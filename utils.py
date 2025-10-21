import json
import tiktoken
import z3
from datetime import datetime
from marco.json2z3 import declare_vars, build_expr
import copy

TOKEN_PRICES = {
    "input": 0.4 / 1000000, # $0.4 per 1M tokens 
    "output": 1.6 / 1000000, # $1.6per 1M tokens
}

def count_tokens(text, model="gpt-4"):
    """計算文本的token數量"""
    try:
        encoding = tiktoken.encoding_for_model(model)
        return len(encoding.encode(text))
    except:
        # 如果無法取得encoding，使用粗略估算 (4字符≈1token)
        return len(text) // 4


def get_reply_with_tokens(agent, messages):
    """獲取回覆並計算token數量"""
    # 計算輸入tokens
    input_text = "\n".join([msg["content"] for msg in messages])
    input_tokens = count_tokens(input_text)
    
    # 獲取回覆
    reply = agent.generate_reply(messages=messages)
    reply_content = reply["content"] if isinstance(reply, dict) else str(reply)
    
    # 計算輸出tokens
    output_tokens = count_tokens(reply_content)
    
    return reply_content, input_tokens, output_tokens

def ensure_json_valid(team, raw_text):
    """確保 constraints JSON 格式正確，不正確時呼叫 JsonFixer"""
    try:
        return json.loads(raw_text)
    except json.JSONDecodeError:
        fixer_messages = [{"role": "user", "content": raw_text}]
        fixed, _, _ = get_reply_with_tokens(team["json_fixer"], fixer_messages)
        return json.loads(fixed)

def check_z3_satisfiability(constraints, z3_vars, build_expr, save_py=False, py_path="debug_constraints.py"):
    """
    檢查約束的 Z3 可滿足性
    若 save_py=True，會同時輸出可執行的 Z3 Python 檔案。
    """
    try:
        solver = z3.Solver()
        python_lines = ["from z3 import *", "solver = Solver()", ""]

        for i, constraint in enumerate(constraints):
            try:
                z3_expr = build_expr(constraint["expr"], z3_vars)
                tag_id = constraint.get("id", f"c{i}")
                tag = z3.Bool(tag_id)
                solver.assert_and_track(z3_expr, tag)

                # 🔹 把 constraint 轉成 Z3 Python 語法
                python_lines.append(f"# {tag_id}")
                python_lines.append(f"solver.assert_and_track({z3_expr.sexpr()}, '{tag_id}')")
                python_lines.append("")
            except Exception as e:
                return "ERROR", f"Failed to build constraint {constraint}: {e}"

        if save_py:
            with open(py_path, "w", encoding="utf-8") as f:
                f.write("\n".join(python_lines))
                f.write("\nprint(solver.check())\n")
                f.write("try:\n    print('Unsat core:', solver.unsat_core())\nexcept:\n    pass\n")
            print(f"✅ 已輸出 Z3 Python 檔案：{py_path}")

        result = solver.check()

        if result == z3.sat:
            return "SAT", solver.model()
        elif result == z3.unsat:
            core = solver.unsat_core()
            core_ids = [c.decl().name() for c in core]
            return "UNSAT", core_ids
        else:
            return "UNKNOWN", "Z3 returned unknown"

    except Exception as e:
        return "ERROR", f"Z3 check failed: {e}"




    
def check_constraints_parseable(constraints, z3_vars, build_expr):
    """
    確認 constraints 能否正確 parse 成 Z3 expr
    constraints: List[ConstraintSpec-like dict]
    z3_vars: dict[str, z3.Var] 由 declare_vars 建立
    build_expr: 函數，用來把 JSON expr 轉成 Z3 表達式
    ---
    return: (ok: bool, error: Optional[str])
    """
    try:
        for c in constraints:
            expr = c.get("expr")
            if expr is None:
                return False, f"Constraint missing expr: {c}"
            _ = build_expr(expr, z3_vars)  # 嘗試轉成 Z3 AST
        return True, None
    except Exception as e:
        return False, str(e)
    
def check_constraints_consistency(constraints, z3_vars, build_expr):
    result, info = check_z3_satisfiability(constraints, z3_vars, build_expr)
    consistent = (result != "UNSAT")
    return consistent, result, info

def check_case_law_hard(constraints, facts, z3_vars, build_expr):
    combined = constraints[:]
    for k, v in facts.items():   
        combined.append({"expr": ["EQ", ["VAR", k], v]})
    return check_z3_satisfiability(combined, z3_vars, build_expr)

def z3_optimize_case(constraints, facts, z3_vars, build_expr):
    """
    用 Z3 Optimize 嘗試求解 case + constraints
    - constraints = law (必須滿足，hard constraints)
    - facts = 案例事實 (盡量滿足，soft constraints)
    
    返回: (成功與否, model 或 unsat core)
    """
    try:
        opt = z3.Optimize()

        # === 加入 hard constraints (法律規範) ===
        for i, c in enumerate(constraints):
            try:
                z3_expr = build_expr(c["expr"], z3_vars)
                tag = c.get("id", f"law_{i}")
                opt.assert_and_track(z3_expr, tag)
            except Exception as e:
                return False, f"Failed to build constraint {c}: {e}"

        # === 加入 soft constraints (案例事實) ===
        for k, v in facts.items():
            try:
                fact_expr = build_expr(["EQ", ["VAR", k], v], z3_vars)
                opt.add_soft(fact_expr, weight=1, id=f"fact_{k}")
            except Exception as e:
                return False, f"Failed to build fact {k}={v}: {e}"

        # === 求解 ===
        result = opt.check()
        if result == z3.sat:
            return True, opt.model()
        elif result == z3.unsat:
            return False, f"Unsat core: {[str(c) for c in opt.unsat_core()]}"
        else:
            return False, "Z3 returned unknown"

    except Exception as e:
        return False, f"Optimize failed: {e}"
    

def calculate_cost(input_tokens, output_tokens):
    """計算成本"""
    input_cost = input_tokens * TOKEN_PRICES["input"]
    output_cost = output_tokens * TOKEN_PRICES["output"]
    return input_cost + output_cost

def extract_all_vars(constraints):
    """
    提取所有在 constraints 中用到的變數名稱
    （包含原始變數 + 衍生 VAR 變數 + 帶 domain 的 id）
    自動移除變數名稱中的前綴（如 "bank:"）
    """
    used = set()
    ops = {
        "AND", "OR", "NOT", "EQ", "GE", "LE", "GT", "LT",
        "ADD", "SUB", "MUL", "DIV",
        "SUM", "AVG", "MIN", "MAX",
        "ABS", "POW", "ROUND", "FLOOR", "CEIL", "IFNULL",
        "PERCENT", "CASE", "IMPLIES"
    }

    def walk(expr):
        if isinstance(expr, list):
            if expr and expr[0] == "VAR":
                # ["VAR", "xxx"] → 把 xxx 收進來
                if len(expr) > 1:
                    var_name = expr[1]
                    # 🔧 移除前綴
                    if ":" in var_name:
                        var_name = var_name.split(":", 1)[1]
                    used.add(var_name)
            else:
                for e in expr:
                    walk(e)
        elif isinstance(expr, str):
            if expr not in ops:
                var_name = expr
                # 🔧 移除前綴
                if ":" in var_name:
                    var_name = var_name.split(":", 1)[1]
                used.add(var_name)

    for c in constraints:
        walk(c["expr"])

    return sorted(used)

def print_dialog_log(title, messages):
    print(f"\n[{title}]")
    for msg in messages:
        role = msg['role'].upper()
        content = msg['content']
        #print(f"{role}: {content}\n{'-'*40}")
def auto_fix_constraints(constraints, varspecs):
    fixed = []
    var_names = {v["name"]: v["type"] for v in varspecs}

    for c in constraints:
        expr = c["expr"]

        # 遞迴修復
        def walk(e):
            if isinstance(e, list):
                return [walk(x) for x in e]
            elif isinstance(e, bool):
                return e
            elif isinstance(e, int):
                # ✅ 保持整數不變
                return e
            elif isinstance(e, float):
                return e
            elif isinstance(e, str):
                # 如果變數不存在於 varspec → 自動補上 Bool 定義
                if e not in var_names and not e.isupper():
                    varspecs.append({"name": e, "type": "Bool", "source": "auto_fixed"})
                    var_names[e] = "Bool"
                return e
            else:
                return e

        new_expr = walk(expr)
        c["expr"] = new_expr
        fixed.append(c)

    return fixed, varspecs

def repair_loop_with_rounds(team, constraints, varspecs, build_expr, z3_vars, max_rounds=3):
    """
    嘗試修復 constraints 或 varspecs，直到可 parse 或達到最大輪數
    只針對有問題的 constraints 進行修復
    """
    repaired_constraints = constraints
    repaired_varspecs = varspecs
    last_err = None

    for round_id in range(max_rounds):
        print(f"🔄 Repair attempt {round_id+1}")

        ok, err = check_constraints_parseable(repaired_constraints, z3_vars, build_expr)
        if ok:
            return repaired_constraints, repaired_varspecs, True, round_id+1, None

        last_err = err

        # === 🔑 診斷：找出有問題的 constraints ===
        problems = diagnose_constraints(repaired_constraints, z3_vars, build_expr)
        
        if not problems:
            print("⚠️ 無法定位問題 constraint，可能是 varspec 問題")
            target = "varspec"
        else:
            print(f"📍 Found {len(problems)} problematic constraint(s):")
            for p in problems:
                print(f"   [{p['id']}] {p['error']}")
            
            if "not found" in str(err).lower():
                target = "varspec"
            else:
                target = "constraint"

        # === 呼叫 LLM 修復 ===
        if target == "varspec":
            # VarSpec 修復邏輯保持不變
            repair_prompt = f"""
Z3 parsing 失敗，錯誤訊息：
{err}

這代表 VarSpec 定義的型別或缺少變數。  
請根據以下 constraints 修正 VarSpec JSON（保持正確型別與完整性）：
{json.dumps(repaired_constraints, ensure_ascii=False, indent=2)}

原始 VarSpecs：
{json.dumps(repaired_varspecs, ensure_ascii=False, indent=2)}

⚠️ 僅輸出修正後的 VarSpec JSON 陣列。
"""
            repair_messages = [{"role": "user", "content": repair_prompt}]
            reply, _, _ = get_reply_with_tokens(team["statute_repairer"], repair_messages)
            try:
                repaired_varspecs = safe_json_loads(reply)
                z3_vars = declare_vars(repaired_varspecs)
            except Exception as e:
                print(f"⚠️ VarSpec 修復 JSON parse 失敗: {e}")
                continue

        else:  # constraint 錯誤
            # 🔑 改用 repair_constraint_v2（使用強化版 prompt）
            for p in problems:
                idx = p["index"]
                bad_constraint = repaired_constraints[idx]
                c_id = bad_constraint.get('id', idx)
                
                print(f"\n🔧 修復 constraint [{c_id}]")
                
                # 🔑 找出相關的 constraints 提供上下文
                related = find_related_constraints(c_id, repaired_constraints)
                
                # 🔑 使用 repair_constraint_v2（會使用 repairagent.py 的強化版 prompt）
                fixed, success = repair_constraint_v2(
                    team=team,
                    bad_constraint=bad_constraint,
                    error=p['error'],
                    z3_vars=z3_vars,
                    build_expr=build_expr,
                    varspecs=repaired_varspecs,
                    related_constraints=related,
                    max_retries=3
                )
                
                if success:
                    repaired_constraints[idx] = fixed
                    print(f"   ✅ Constraint [{c_id}] 修復成功")
                else:
                    print(f"   ⚠️ Constraint [{c_id}] 修復失敗，保留原始版本")

        # === 每輪修完再重新檢查 ===
        ok, err = check_constraints_parseable(repaired_constraints, z3_vars, build_expr)
        if ok:
            print(f"✅ 修復完成於第 {round_id+1} 輪")
            return repaired_constraints, repaired_varspecs, True, round_id+1, None

        last_err = err
        print(f"❌ 第 {round_id+1} 輪修復仍失敗：{err}")

    return repaired_constraints, repaired_varspecs, False, max_rounds, last_err

def repair_constraint_v2(team, bad_constraint, error, z3_vars, build_expr, varspecs=None, related_constraints=None, max_retries=3):
    """
    改進版 constraint 修復，包含重試和驗證
    
    Args:
        team: agent 團隊字典
        bad_constraint: 有問題的 constraint
        error: 錯誤訊息
        z3_vars: Z3 變數字典
        build_expr: expr 建構函數
        varspecs: 變數規格列表（可選，用於提供上下文）
        related_constraints: 相關的 constraints（可選，用於提供上下文）
        max_retries: 最大重試次數
    
    Returns:
        (fixed_constraint, success): 修復後的 constraint 和是否成功
    """
    
    # 建立基礎 repair prompt
    repair_prompt = f"""
## 🔴 錯誤訊息
{error}

## 📄 有問題的 Constraint
{json.dumps(bad_constraint, ensure_ascii=False, indent=2)}
"""
    
    # 加入變數規格（如果有提供）
    if varspecs:
        repair_prompt += f"""

## 📖 可用變數（VarSpecs）
{json.dumps([{"name": v["name"], "type": v["type"]} for v in varspecs], ensure_ascii=False, indent=2)}
"""
    
    # 加入相關 constraints（如果有提供）
    if related_constraints:
        repair_prompt += f"""

## 🔗 相關 Constraints（僅供參考，勿修改）
{json.dumps(related_constraints[:3], ensure_ascii=False, indent=2)}

## 📖 相關變數命名型態（VarSpecs）
{json.dumps([{"name": v["name"], "type": v["type"]} for v in varspecs], ensure_ascii=False, indent=2)}

"""
    
    repair_prompt += """

請根據 System Prompt 中的規則修復此 constraint，並輸出完整的 JSON 物件。

⚠️ 注意事項：
1. 不要包含 ```json ``` 等 markdown 標記
2. 僅輸出單一 JSON 物件
3. 保持變數名稱不變
4. 確保 constraint id 與 expr 中的變數名稱一致
5. 請勿把 meta:penalty_default_false 拿掉，我想要找到一個合規解
6. 所有 CASE 的分支值（含 default）必須型別一致。
   - 若 CASE 用於分類（如等級判定），請使用 Int 值（例如 4, 3, 2, 1, 0）。
   - 禁止將 default 寫成 true/false。
"""
    
    for attempt in range(max_retries):
        messages = [{"role": "user", "content": repair_prompt}]
        reply, _, _ = get_reply_with_tokens(team["statute_repairer"], messages)
        
        # 清理 markdown 標記
        reply = reply.strip()
        if reply.startswith("```json"):
            reply = reply[7:]
        if reply.startswith("```"):
            reply = reply[3:]
        if reply.endswith("```"):
            reply = reply[:-3]
        reply = reply.strip()
        
        try:
            # 嘗試解析 JSON
            fixed = json.loads(reply)
            
            # 驗證是否為字典
            if not isinstance(fixed, dict):
                raise ValueError(f"Expected dict, got {type(fixed)}")
            
            # 驗證修復結果（嘗試建構 Z3 表達式）
            test_vars = z3_vars.copy()
            build_expr(fixed["expr"], test_vars)
            
            print(f"   ✅ 修復成功（第 {attempt+1} 次嘗試）")
            return fixed, True
            
        except json.JSONDecodeError as e:
            print(f"   ⚠️ JSON 解析失敗（第 {attempt+1} 次）: {e}")
            repair_prompt += f"\n\n## ❌ 上次輸出無法解析為 JSON\n錯誤：{e}\n請確保輸出純 JSON 格式，不要包含 markdown 標記或其他文字"
            
        except Exception as e:
            print(f"   ⚠️ Z3 驗證失敗（第 {attempt+1} 次）: {e}")
            repair_prompt += f"\n\n## ❌ 上次修復後仍有錯誤\n錯誤：{e}\n\n上次回覆內容：\n{reply[:300]}...\n\n請根據錯誤訊息重新修正"
    
    print(f"   ❌ 修復失敗，已達最大重試次數（{max_retries}）")
    return bad_constraint, False


def repair_constraints_with_agent(team, constraints, unsat_core):
    """
    呼叫修復 Agent，只修 unsat core 涉及的 constraints
    """
    repair_prompt = f"""
以下 constraints 出現互斥問題 (unsat core):

Unsat core IDs:
{unsat_core}

Constraints JSON:
{json.dumps(constraints, ensure_ascii=False, indent=2)}

請你修復這些 constraints：
- 保留未出現在 unsat core 的 constraints 不變
- 僅調整 unsat core 涉及的 constraints，避免邏輯互斥
- 保持語意完整
- 最終輸出合法 ConstraintSpec[] JSON
"""
    messages = [{"role": "user", "content": repair_prompt}]
    fixed_json, _, _ = get_reply_with_tokens(team["statute_repairer"], messages)
    return json.loads(fixed_json)

def find_related_constraints(constraint_id, all_constraints):
    """
    找出與給定 constraint 相關的其他 constraints
    相關性判斷：
    1. 使用相同的變數
    2. 相同的 domain
    3. 描述中提到相同的關鍵概念
    """
    related = []
    target = next((c for c in all_constraints if c.get("id") == constraint_id), None)
    if not target:
        return []
    
    # 提取目標 constraint 使用的變數
    target_vars = set()
    def extract_vars(expr):
        if isinstance(expr, list):
            if expr and expr[0] == "VAR":
                target_vars.add(expr[1])
            else:
                for e in expr:
                    extract_vars(e)
        elif isinstance(expr, str):
            if expr not in {"AND", "OR", "NOT", "EQ", "GE", "LE", "GT", "LT", 
                           "ADD", "SUB", "MUL", "DIV", "CASE", "IMPLIES"}:
                target_vars.add(expr)
    
    extract_vars(target["expr"])
    
    # 提取 domain 和關鍵詞
    target_domain = target.get("domain", "")
    target_desc = target.get("desc", "")
    
    # 找出相關的 constraints
    for c in all_constraints:
        if c.get("id") == constraint_id:
            continue
        
        # 1. 相同 domain
        if c.get("domain") == target_domain:
            related.append(c)
            continue
        
        # 2. 使用相同變數
        c_vars = set()
        extract_vars(c["expr"])
        if target_vars & c_vars:  # 有交集
            related.append(c)
            continue
        
        # 3. 描述中包含相同關鍵詞
        keywords = ["資本", "不足", "適足", "計畫", "措施", "等級"]
        target_keywords = [kw for kw in keywords if kw in target_desc]
        c_desc = c.get("desc", "")
        if any(kw in c_desc for kw in target_keywords):
            related.append(c)
    
    return related


def consistency_check_with_repair(team, constraints, z3_vars, build_expr, max_attempts=5, stats=None):
    """
    檢查 constraints consistency，不一致時呼叫修復 Agent
    會把 unsat core 及其相關的 constraints 一起修復
    回傳: (constraints, consistent, result, info)
    """
    for attempt in range(max_attempts):
        consistent, result, info = check_constraints_consistency(constraints, z3_vars, build_expr)

        if consistent:
            print("✅ Constraints are consistent")
            if stats:
                stats.log_checkpoint("consistency_check", True, f"Consistent after {attempt} attempts")
            return constraints, True, result, info

        if result == "UNSAT":
            print(f"⚠️ Constraints inconsistent → Repair Agent (attempt {attempt+1})")

            # info 應該是 unsat core (list of IDs)
            if isinstance(info, str):
                try:
                    unsat_core_ids = json.loads(info.replace("Unsat core:", "").strip())
                except Exception:
                    unsat_core_ids = []
            else:
                unsat_core_ids = info

            print(f"Unsat core IDs: {unsat_core_ids}")

            # === 🔑 找出 unsat core 及其相關的 constraints ===
            core_constraints = []
            related_constraints = []
            all_to_repair_ids = set(unsat_core_ids)  # 所有需要修復的 ID
            
            for core_id in unsat_core_ids:
                # 找出 core constraint
                core_c = next((c for c in constraints if c.get("id") == core_id), None)
                if core_c:
                    core_constraints.append(core_c)
                    
                    # 找出相關的 constraints
                    related = find_related_constraints(core_id, constraints)
                    for r in related:
                        r_id = r.get("id")
                        if r_id not in all_to_repair_ids:
                            related_constraints.append(r)
                            all_to_repair_ids.add(r_id)

            if not core_constraints:
                print("⚠️ 無法對應到 constraints，跳過修復")
                if stats:
                    stats.log_checkpoint("consistency_check", False, "No core constraints found")
                return constraints, False, result, info

            print(f"📌 Found {len(related_constraints)} related constraints (will also be repaired)")

            # 🔑 所有需要修復的 constraints（core + related）
            all_to_repair = core_constraints + related_constraints

            # === 丟給修復 Agent（一起修復） ===
            repair_prompt = f"""
以下 constraints 出現互斥問題 (unsat core)，需要修復。

## 🔴 Unsat Core Constraints（主要衝突來源）
{json.dumps(core_constraints, ensure_ascii=False, indent=2)}

## 🟡 相關的 Constraints（與 unsat core 使用相同變數或屬於相同領域，也需一起修復）
{json.dumps(related_constraints, ensure_ascii=False, indent=2)}

## 📋 修復要求
1. **同時修復上述兩個區塊的所有 constraints**
2. **確保修復後的邏輯彼此一致**：
   - 若是「資本等級」相關，確保不會同時要求多個互斥等級為 true
   - 若是「措施」相關，確保依賴的前置條件正確（例如：significantly_insufficient_measures 應該包含 insufficient_measures）
   - 若使用相同變數，確保邏輯不衝突（例如：`capital_level` 不能同時等於 2 和 3）
3. **保持語意完整**：不要改變原本的法律意圖
4. **輸出格式**：輸出所有修復後的 constraints（包含 🔴 和 🟡 兩個區塊）
5. **注意**：請勿刪除任何 constraint，僅進行修正

範例：
若 unsat core 是 `["insurance:capital_insufficient_measures", "insurance:capital_significantly_insufficient_measures"]`
且相關 constraints 包含 `"insurance:capital_level"` 和其他措施變數
則修復時應：
- 確保這些 measures 變數不會同時為 true（因為 capital_level 只能是一個值）
- 或者修改 measures 的定義，讓它們不依賴於互斥的 capital_level 值
- 或者修改 capital_level 的定義，讓它能容納這些邏輯

⚠️ 請輸出完整的修復後 constraints JSON 陣列（包含 🔴 和 🟡 的所有項目）,注意，請不要輸出```json```。
"""
            
            # 🔑 記錄 agent 呼叫
            import time
            start_time = time.time()
            reply, input_tokens, output_tokens = get_reply_with_tokens(team["statute_repairer"], [{"role": "user", "content": repair_prompt}])
            elapsed_time = time.time() - start_time
            if stats:
                stats.log_agent_call("consistency_repair_agent", input_tokens, output_tokens, elapsed_time)
            
            print(f"修復 Agent 回傳: {reply[:200]}...")
            
            try:
                repaired = json.loads(reply)
                if not isinstance(repaired, list):
                    repaired = [repaired]
            except Exception as e:
                print(f"⚠️ 修復 Agent 回傳無法解析: {e}")
                if stats:
                    stats.log_checkpoint("consistency_check", False, f"Repair failed at attempt {attempt+1}: JSON parse error")
                return constraints, False, result, info

            # === 驗證修復結果 ===
            repaired_ids = {r.get("id") for r in repaired}
            missing_ids = all_to_repair_ids - repaired_ids
            if missing_ids:
                print(f"⚠️ 修復後缺少以下 constraints: {missing_ids}")
                # 可以選擇：1. 保留原本的  2. 報錯  3. 重試
                # 這裡選擇保留原本的
                for missing_id in missing_ids:
                    original = next((c for c in constraints if c.get("id") == missing_id), None)
                    if original:
                        repaired.append(original)
                        print(f"   → 保留原本的 {missing_id}")

            # === 用修復後的替換回去 ===
            new_constraints = []
            for c in constraints:
                c_id = c.get("id")
                if c_id in all_to_repair_ids:
                    replacement = next((r for r in repaired if r.get("id") == c_id), None)
                    if replacement:
                        new_constraints.append(replacement)
                        marker = "🔴" if c_id in unsat_core_ids else "🟡"
                        print(f"   {marker} 替換 {c_id}")
                    else:
                        new_constraints.append(c)
                        print(f"   ⚠️ 未找到 {c_id} 的修復版本，保留原本")
                else:
                    new_constraints.append(c)

            constraints = new_constraints
            
            # 🔑 記錄修復次數
            if stats:
                stats.increment_repair()
            
            continue

        if result == "ERROR":
            print(f"❌ Error during satisfiability check: {info}")
            if stats:
                stats.log_checkpoint("consistency_check", False, f"Error: {info}")
            return constraints, False, result, info

        print(f"❌ Unexpected result: {result}, {info}")
        if stats:
            stats.log_checkpoint("consistency_check", False, f"Unexpected result: {result}")
        return constraints, False, result, info

    print("❌ Repair attempts exhausted, still inconsistent")
    if stats:
        stats.log_checkpoint("consistency_check", False, f"Max attempts ({max_attempts}) reached")
    return constraints, False, "UNSAT", "Max repair attempts reached"



def add_penalty_meta(team, constraints):
    """
    為 constraints 添加 penalty 相關的 meta 規則
    2. 由 PenaltyAgent 生成 meta:no_penalty_if_all_pass
    """
    # 2. 呼叫 PenaltyAgent 生成總合規則
    prompt = f"""
請根據以下 constraints 生成 meta:no_penalty_if_all_pass 規則：

{json.dumps(constraints, ensure_ascii=False, indent=2)}
"""
    
    messages = [{"role": "user", "content": prompt}]
    reply, _, _ = get_reply_with_tokens(team["penalty"], messages)
    
    # 3. 解析 PenaltyAgent 的回覆
    try:
        penalty_rule = json.loads(reply)
        # 確保是單一物件而非陣列
        if isinstance(penalty_rule, list):
            penalty_rule = penalty_rule[0]
    except Exception as e:
        print(f"⚠️ PenaltyAgent 回覆解析失敗: {e}")
        # 使用預設空規則
        penalty_rule = {
            "id": "meta:no_penalty_if_all_pass",
            "desc": "處罰條件（生成失敗）",
            "expr": ["EQ", "penalty", False],
            "weight": 0,
            "domain": "meta"
        }
    
    # 4. 組合所有規則
    return constraints + [penalty_rule]

def find_unparseable_constraints(constraints, z3_vars, build_expr):
    """
    逐條嘗試把 constraints 轉成 Z3 expr，找出會拋錯或回傳非布林根的項目
    並把原始 constraint 存到 outputs，方便人工編輯。
    回傳 list of (index, constraint, error_message).
    """
    problems = []
    for i, c in enumerate(constraints):
        try:
            expr = build_expr(c, z3_vars)  # 若 build_expr signature 不同請調整
            # 若 build_expr 回傳非 Bool 類型（你原先的錯誤）
            # 用 type 檢查或屬性檢查（視 build_expr 回傳型別）
            if hasattr(expr, "is_bool") and not expr.is_bool():
                problems.append((i, c, f"非 Bool 表達式: {type(expr)}"))
        except Exception as e:
            problems.append((i, c, str(e)))
    # 儲存所有有問題的 constraint，方便檢視
    if problems:
        bad = [{"index": idx, "constraint": con, "error": err} for idx, con, err in problems]
        (OUT / "constraints_unparseable_summary.json").write_text(json.dumps(bad, ensure_ascii=False, indent=2), encoding="utf-8")
        for idx, con, err in problems:
            (OUT / f"constraint_unparseable_{idx}.json").write_text(json.dumps(con, ensure_ascii=False, indent=2), encoding="utf-8")
    return problems

def diagnose_constraints(constraints, z3_vars, build_expr):
    """找出具體哪些 constraint 有問題"""
    problems = []
    for i, c in enumerate(constraints):
        try:
            build_expr(c["expr"], z3_vars)
        except Exception as e:
            problems.append({
                "index": i,
                "id": c.get("id", "unknown"),
                "expr": c["expr"],
                "error": str(e)
            })
    return problems

def clean_json_response(reply):
    """
    清理 LLM 回覆中的 markdown 標記和多餘空白
    
    Args:
        reply: LLM 的原始回覆字串
    
    Returns:
        清理後的 JSON 字串
    """
    if not isinstance(reply, str):
        return reply
    
    reply = reply.strip()
    
    # 移除開頭的 markdown 標記
    if reply.startswith("```json"):
        reply = reply[7:]
    elif reply.startswith("```"):
        reply = reply[3:]
    
    # 移除結尾的 markdown 標記
    if reply.endswith("```"):
        reply = reply[:-3]
    
    reply = reply.strip()
    
    return reply


def safe_json_loads(reply, default=None):
    """
    安全地解析 JSON，自動清理 markdown 標記
    
    Args:
        reply: LLM 的原始回覆字串
        default: 解析失敗時的預設值（若為 None 則拋出異常）
    
    Returns:
        解析後的 JSON 物件
    
    Raises:
        JSONDecodeError: 若解析失敗且 default 為 None
    """
    try:
        cleaned = clean_json_response(reply)
        
        # 檢查是否為空字串
        if not cleaned:
            if default is not None:
                return default
            raise json.JSONDecodeError("Empty string after cleaning", "", 0)
        
        return json.loads(cleaned)
    
    except json.JSONDecodeError as e:
        if default is not None:
            print(f"⚠️ JSON 解析失敗，使用預設值: {e}")
            return default
        else:
            print(f"❌ JSON 解析失敗:")
            print(f"   錯誤: {e}")
            print(f"   原始回覆: {reply[:200]}...")
            print(f"   清理後: {cleaned[:200]}...")
            raise

def validate_and_fix_facts(facts, varspecs):
    """
    驗證並修復 facts
    
    Args:
        facts: 原始 facts 字典
        varspecs: VarSpec 列表
    
    Returns:
        修復後的 facts
    """
    # 建立變數類型映射（移除前綴）
    var_types = {vs["name"].split(":", 1)[-1] if ":" in vs["name"] else vs["name"]: vs["type"] for vs in varspecs}
    
    fixed_facts = {}
    issues = []
    
    for key, value in facts.items():
        # 🔧 移除 key 中的前綴
        clean_key = key.split(":", 1)[-1] if ":" in key else key
        
        # 檢查變數是否存在
        if clean_key not in var_types:
            issues.append(f"⚠️ 變數 '{clean_key}' 不在 VarSpec 中，已跳過")
            continue
        
        var_type = var_types[clean_key]
        
        # 🔑 處理 None 值
        if value is None:
            if var_type == "Bool":
                fixed_value = False
                issues.append(f"⚠️ {clean_key}: None → False (Bool)")
            elif var_type == "Int":
                fixed_value = 0
                issues.append(f"⚠️ {clean_key}: None → 0 (Int)")
            elif var_type == "Real":
                fixed_value = 0.0
                issues.append(f"⚠️ {clean_key}: None → 0.0 (Real)")
            else:
                issues.append(f"❌ {clean_key}: 未知類型 {var_type}，跳過")
                continue
            fixed_facts[clean_key] = fixed_value
        else:
            # 🔑 驗證類型
            if var_type == "Bool":
                if isinstance(value, bool):
                    fixed_facts[clean_key] = value
                elif isinstance(value, str):
                    fixed_facts[clean_key] = value.lower() in ["true", "1", "yes"]
                    issues.append(f"⚠️ {clean_key}: 字串 '{value}' → {fixed_facts[clean_key]} (Bool)")
                elif isinstance(value, (int, float)):
                    fixed_facts[clean_key] = bool(value)
                    issues.append(f"⚠️ {clean_key}: 數字 {value} → {fixed_facts[clean_key]} (Bool)")
                else:
                    fixed_facts[clean_key] = False
                    issues.append(f"❌ {clean_key}: 無法轉換 {value} → False (Bool)")
                    
            elif var_type == "Int":
                if isinstance(value, int):
                    fixed_facts[clean_key] = value
                elif isinstance(value, float):
                    fixed_facts[clean_key] = int(value)
                    issues.append(f"⚠️ {clean_key}: {value} → {int(value)} (Int)")
                elif isinstance(value, str):
                    try:
                        fixed_facts[clean_key] = int(float(value))
                        issues.append(f"⚠️ {clean_key}: '{value}' → {fixed_facts[clean_key]} (Int)")
                    except:
                        fixed_facts[clean_key] = 0
                        issues.append(f"❌ {clean_key}: 無法解析 '{value}' → 0 (Int)")
                else:
                    fixed_facts[clean_key] = 0
                    issues.append(f"❌ {clean_key}: 無法轉換 {value} → 0 (Int)")
                    
            elif var_type == "Real":
                if isinstance(value, (int, float)):
                    fixed_facts[clean_key] = float(value)
                elif isinstance(value, str):
                    try:
                        fixed_facts[clean_key] = float(value)
                        issues.append(f"⚠️ {clean_key}: '{value}' → {fixed_facts[clean_key]} (Real)")
                    except:
                        fixed_facts[clean_key] = 0.0
                        issues.append(f"❌ {clean_key}: 無法解析 '{value}' → 0.0 (Real)")
                else:
                    fixed_facts[clean_key] = 0.0
                    issues.append(f"❌ {clean_key}: 無法轉換 {value} → 0.0 (Real)")
            else:
                issues.append(f"❌ {clean_key}: 未知類型 {var_type}")
    
    # 🔑 檢查是否有 VarSpec 中的變數沒有出現在 facts 中
    for vs in varspecs:
        var_name = vs["name"].split(":", 1)[-1] if ":" in vs["name"] else vs["name"]
        if var_name not in fixed_facts:
            var_type = vs["type"]
            if var_type == "Bool":
                fixed_facts[var_name] = False
                issues.append(f"⚠️ {var_name}: 缺少 → False (Bool)")
            elif var_type == "Int":
                fixed_facts[var_name] = 0
                issues.append(f"⚠️ {var_name}: 缺少 → 0 (Int)")
            elif var_type == "Real":
                fixed_facts[var_name] = 0.0
                issues.append(f"⚠️ {var_name}: 缺少 → 0.0 (Real)")
    
    # 印出問題摘要
    if issues:
        print(f"📋 Facts 驗證與修復（{len(issues)} 個問題）：")
        for issue in issues[:10]:  # 最多顯示 10 個
            print(f"   {issue}")
        if len(issues) > 10:
            print(f"   ... 還有 {len(issues) - 10} 個問題")
    
    return fixed_facts, issues

import time

def repair_case_law_constraints(team, constraints, facts, z3_vars, build_expr, error_info, stats, max_retries=2):
    """
    修復在 Case+Law Hard Check 中發現的問題
    
    Args:
        team: Agent team
        constraints: 原始 constraints
        facts: 案例事實
        z3_vars: Z3 變數字典
        build_expr: build_expr 函數
        error_info: 錯誤資訊
        stats: 統計物件
        max_retries: 最大重試次數
    
    Returns:
        (修復後的 constraints, 是否成功)
    """
    print(f"🔧 Attempting to repair constraints (max {max_retries} retries)")
    
    if stats:
        stats.log_checkpoint("case_law_repair_start", True, f"Starting repair with {len(constraints)} constraints")
    
    # 🔑 診斷問題：找出有問題的 constraint
    problematic_constraints = []
    
    for idx, c in enumerate(constraints):
        try:
            # 測試是否能建構這個 constraint
            build_expr(c["expr"], z3_vars)
        except Exception as e:
            problematic_constraints.append({
                "index": idx,
                "constraint": c,
                "error": str(e)
            })
    
    if not problematic_constraints:
        print("⚠️ 無法定位問題 constraint")
        if stats:
            stats.log_checkpoint("case_law_repair", False, "No problematic constraints found")
        return constraints, False
    
    print(f"📍 Found {len(problematic_constraints)} problematic constraint(s):")
    for p in problematic_constraints:
        c_id = p["constraint"].get("id", p["index"])
        print(f"   [{c_id}] {p['error']}")
    
    if stats:
        stats.log_checkpoint("case_law_repair_diagnosis", True, f"Found {len(problematic_constraints)} problematic constraints")
    
    # 🔑 修復每個有問題的 constraint
    repaired_constraints = constraints[:]
    
    for p in problematic_constraints:
        idx = p["index"]
        bad_constraint = p["constraint"]
        error = p["error"]
        c_id = bad_constraint.get("id", idx)
        
        print(f"\n🔧 Repairing constraint [{c_id}]")
        
        # 🔑 判斷錯誤類型並提供具體指示
        if "Unsupported operator" in error and ":" in error:
            # 問題：引用了其他 constraint 的 id
            repair_hint = """
❌ 錯誤：在 expr 中引用了其他 constraint 的 id（如 "meta:penalty_conditions"）

✅ 修復方法：
1. **移除對其他 constraint 的引用**
2. **直接使用變數名稱**（透過 ["VAR", "變數名"]）
3. **簡化邏輯**，不要依賴其他 constraint 的結果

範例：
❌ 錯誤：`["IMPLIES", ["NOT", ["meta:penalty_conditions"]], ["EQ", "penalty", false]]`
✅ 正確：直接判斷條件，例如：
- 若要表達「預設不處罰」，直接用 `["EQ", "penalty", false]`
- 若要表達「某條件下處罰」，用 `["IMPLIES", ["條件"], ["EQ", "penalty", true]]`
"""
        elif "not found" in error.lower():
            # 問題：變數不存在
            repair_hint = f"""
❌ 錯誤：變數不存在於 VarSpec 中

可用的變數：
{json.dumps(list(z3_vars.keys()), ensure_ascii=False, indent=2)}

✅ 修復方法：
1. 檢查變數名稱是否正確（包括大小寫、符號）
2. 若變數確實需要，請在 VarSpec 中定義
3. 移除不必要的變數引用
"""
        else:
            repair_hint = f"""
❌ 錯誤：{error}

✅ 請根據錯誤訊息修正 constraint
"""
        
        # 🔑 建構修復 prompt
        repair_prompt = f"""
【任務】修復有問題的 constraint

【錯誤訊息】
{error}

【有問題的 Constraint】
{json.dumps(bad_constraint, ensure_ascii=False, indent=2)}

【可用的變數（VarSpec）】
{json.dumps(list(z3_vars.keys()), ensure_ascii=False, indent=2)}

【案例事實（Facts）】
{json.dumps(facts, ensure_ascii=False, indent=2)}

【相關的其他 Constraints（供參考）】
{json.dumps([c for c in constraints if c.get('id') != c_id][:5], ensure_ascii=False, indent=2)}

{repair_hint}

【修復規則】
1. **禁止在 expr 中引用其他 constraint 的 id**
   - 如 ["meta:penalty_conditions"] 這種寫法是錯誤的
   - 應該直接使用變數：["VAR", "變數名"]

2. **只能使用 VarSpec 中定義的變數**
   - 若需要新變數，請說明（但不要在這裡直接使用）

3. **保持原有語意**
   - 不要改變 constraint 的邏輯含義
   - 保持 id、desc、weight、domain 不變

4. **確保 expr 可被 Z3 解析**
   - 使用支援的運算子：AND, OR, NOT, IMPLIES, EQ, GE, LE, GT, LT, CASE 等
   - 禁止使用 MIN/MAX（改用 CASE）

⚠️ 僅輸出修正後的單一 constraint JSON 物件，不要包含 ```json ``` 等格式標記。
"""
        
        # 🔑 呼叫 LLM 修復
        for attempt in range(max_retries):
            print(f"   Attempt {attempt + 1}/{max_retries}")
            
            messages = [{"role": "user", "content": repair_prompt}]
            
            start = time.time()
            reply, input_tokens, output_tokens = get_reply_with_tokens(
                team["statute_repairer"], 
                messages
            )
            elapsed = time.time() - start
            stats.log_agent_call(f"case_law_repair_{c_id}_{attempt+1}", input_tokens, output_tokens, elapsed)
            
            try:
                # 清理回覆
                reply = clean_json_response(reply)
                fixed_constraint = json.loads(reply)
                
                # 🔑 驗證修復後的 constraint
                try:
                    build_expr(fixed_constraint["expr"], z3_vars)
                    print(f"   ✅ Constraint [{c_id}] 修復成功")
                    repaired_constraints[idx] = fixed_constraint
                    stats.increment_repair()
                    break
                except Exception as validation_error:
                    print(f"   ⚠️ 修復後仍有問題: {validation_error}")
                    if attempt < max_retries - 1:
                        # 更新 prompt 加入新的錯誤訊息
                        repair_prompt += f"\n\n【上次修復後的問題】\n{validation_error}\n\n請重新修復。"
                    else:
                        print(f"   ❌ Constraint [{c_id}] 修復失敗，保留原始版本")
                        
            except Exception as parse_error:
                print(f"   ⚠️ JSON 解析失敗: {parse_error}")
                if attempt == max_retries - 1:
                    print(f"   ❌ Constraint [{c_id}] 修復失敗，保留原始版本")
    
    # 🔑 最後驗證所有 constraints 是否可 parse
    try:
        ok, err = check_constraints_parseable(repaired_constraints, z3_vars, build_expr)
        if ok:
            print("\n✅ All constraints repaired successfully")
            if stats:
                stats.log_checkpoint("case_law_repair", True, "All constraints repaired successfully")
            return repaired_constraints, True
        else:
            print(f"\n⚠️ Some constraints still have issues: {err}")
            if stats:
                stats.log_checkpoint("case_law_repair", False, f"Some constraints still have issues: {err}")
            return repaired_constraints, False
    except Exception as e:
        print(f"\n❌ Final validation failed: {e}")
        if stats:
            stats.log_checkpoint("case_law_repair", False, f"Final validation failed: {e}")
        return constraints, False

from z3 import *


def export_to_smt2(case_id, constraints, varspecs, facts, z3_vars, build_expr, output_dir):
    """
    將 constraints、variables 和 facts 匯出為 SMT2 格式
    
    Args:
        case_id: 案例 ID
        constraints: ConstraintSpec 列表
        varspecs: VarSpec 列表
        facts: 案例事實字典
        z3_vars: Z3 變數字典
        build_expr: build_expr 函數
        output_dir: 輸出目錄
    
    Returns:
        Path: SMT2 檔案路徑
    """
    from pathlib import Path
    import z3
    
    output_path = Path(output_dir) / f"{case_id}.smt2"
    
    with open(output_path, 'w', encoding='utf-8') as f:
        # === SMT2 Header ===
        f.write("; SMT2 file generated from compliance case automatic\n")
        f.write(f"; Case ID: {case_id}\n")
        f.write(f"; Generated at: {datetime.now().isoformat()}\n")
        f.write(";\n")
        f.write("; This file can be executed with Z3:\n")
        f.write(f";   z3 {case_id}.smt2\n")
        f.write(";\n\n")
        
        f.write("(set-logic ALL)\n\n")
        
        # === 1. 宣告變數 ===
        f.write("; ============================================================\n")
        f.write("; Variable Declarations\n")
        f.write("; ============================================================\n\n")
        
        for vs in varspecs:
            var_name = vs["name"]
            var_type = vs["type"]
            
            # SMT2 型別映射
            if var_type == "Bool":
                smt_type = "Bool"
            elif var_type == "Int":
                smt_type = "Int"
            elif var_type == "Real":
                smt_type = "Real"
            else:
                smt_type = "Int"  # 預設
            
            f.write(f"(declare-const {var_name} {smt_type})\n")
        
        f.write("\n")
        
        # === 2. 加入 Constraints (Law) ===
        f.write("; ============================================================\n")
        f.write("; Constraints (Legal Rules)\n")
        f.write("; ============================================================\n\n")
        
        for i, c in enumerate(constraints):
            c_id = c.get("id", f"constraint_{i}")
            desc = c.get("desc", "")
            
            try:
                # 建構 Z3 表達式
                z3_expr = build_expr(c["expr"], z3_vars)
                
                # 轉換為 SMT2 格式
                smt2_str = z3.simplify(z3_expr).sexpr()
                
                f.write(f"; [{c_id}] {desc}\n")
                f.write(f"(assert {smt2_str})\n\n")
                
            except Exception as e:
                f.write(f"; ERROR: Failed to convert constraint [{c_id}]: {e}\n")
                f.write(f"; Original expr: {json.dumps(c['expr'])}\n\n")
        
        # === 3. 加入 Facts (Case) ===
        f.write("; ============================================================\n")
        f.write("; Facts (Case Specific)\n")
        f.write("; ============================================================\n\n")
        
        for var_name, value in facts.items():
            if var_name not in z3_vars:
                f.write(f"; WARNING: Variable '{var_name}' not in z3_vars, skipped\n")
                continue
            
            z3_var = z3_vars[var_name]
            
            # 建構 fact 表達式
            try:
                if isinstance(value, bool):
                    smt2_value = "true" if value else "false"
                    f.write(f"(assert (= {var_name} {smt2_value}))\n")
                elif isinstance(value, int):
                    f.write(f"(assert (= {var_name} {value}))\n")
                elif isinstance(value, float):
                    # Real 型別需要轉為分數或小數
                    if value == int(value):
                        f.write(f"(assert (= {var_name} {int(value)}.0))\n")
                    else:
                        # 使用分數表示
                        from fractions import Fraction
                        frac = Fraction(value).limit_denominator()
                        f.write(f"(assert (= {var_name} (/ {frac.numerator}.0 {frac.denominator}.0)))\n")
                else:
                    f.write(f"; WARNING: Unknown type for '{var_name}': {type(value)}\n")
                    
            except Exception as e:
                f.write(f"; ERROR: Failed to add fact '{var_name}={value}': {e}\n")
        
        f.write("\n")
        
        # === 4. Check Satisfiability ===
        f.write("; ============================================================\n")
        f.write("; Check Satisfiability\n")
        f.write("; ============================================================\n\n")
        
        f.write("(check-sat)\n")
        f.write("(get-model)\n")
        
        # === 5. 額外資訊（註解） ===
        f.write("\n; ============================================================\n")
        f.write("; Additional Information\n")
        f.write("; ============================================================\n")
        f.write(f"; Total constraints: {len(constraints)}\n")
        f.write(f"; Total variables: {len(varspecs)}\n")
        f.write(f"; Total facts: {len(facts)}\n")
        f.write(";\n")
        f.write("; Expected result:\n")
        f.write(";   - If UNSAT: Case violates legal rules\n")
        f.write(";   - If SAT: Case complies with legal rules (or error in constraints)\n")
    
    print(f"✅ SMT2 file saved to: {output_path}")
    return output_path

def fix_case_types_by_varspecs(constraints, varspecs, stats=None):
    import copy
    var_types = {v["name"]: v["type"] for v in varspecs}
    fixed_constraints = copy.deepcopy(constraints)

    def wrap_case(expr, var_type, constraint_id=None):
        if var_type == "Int":
            new_expr = ["TO_INT", expr]
            if stats:
                stats.log_fix(constraint_id, "TO_INT on CASE for Int variable", expr, new_expr)
            return new_expr
        elif var_type == "Real":
            new_expr = ["TO_REAL", expr]
            if stats:
                stats.log_fix(constraint_id, "TO_REAL on CASE for Real variable", expr, new_expr)
            return new_expr
        return expr

    def traverse(node, constraint_id=None, parent_var=None):
        if not isinstance(node, list):
            return node
        if len(node) == 0:
            return node

        op = node[0]

        # 找出 EQ 結構
        if op == "EQ" and len(node) == 3:
            var_name = node[1]
            rhs = node[2]
            var_type = var_types.get(var_name)
            if isinstance(rhs, list) and rhs[0] == "CASE":
                node[2] = wrap_case(rhs, var_type, constraint_id)
        else:
            for i in range(1, len(node)):
                node[i] = traverse(node[i], constraint_id, parent_var)

        return node

    for c in fixed_constraints:
        c["expr"] = traverse(c["expr"], c.get("id"))

    return fixed_constraints

def sync_types_constraints_and_varspecs(constraints, varspecs, stats=None):
    """
    ✅ 終極版：修正 CASE 型別不一致 (IntNumRef vs ArithRef)
    支援 MIN/MAX → CASE、自動 Real 化、CASE 結構修復、值型別統一
    現在加入詳細統計：記錄每次修復動作到 stats.log_fix
    並移除 expr 中變數名稱的冒號前綴
    """
    import copy

    var_types = {vs["name"]: vs["type"] for vs in varspecs}
    vars_to_convert_real = set()

    # 統計變數
    total_min_max_replacements = 0
    total_vars_converted_to_real = 0
    total_case_fixes = 0
    total_prefix_removals = 0

    # ============================================================
    # Phase 0 — 移除 expr 中變數名稱的冒號前綴
    # ============================================================
    print("\n🔧 Phase 0: Removing colon prefixes from variable names in expr...")

    def remove_prefixes(expr):
        """遞歸移除 expr 中所有變數名稱的冒號前綴"""
        if not isinstance(expr, list):
            if isinstance(expr, str) and ":" in expr:
                new_expr = expr.split(":", 1)[1]
                return new_expr
            return expr
        return [remove_prefixes(item) for item in expr]

    for c in constraints:
        if c.get("expr"):
            original = copy.deepcopy(c["expr"])
            c["expr"] = remove_prefixes(c["expr"])
            if c["expr"] != original:
                total_prefix_removals += 1
                if stats:
                    stats.log_fix(c.get("id"), "Remove colon prefix", original, c["expr"])
                print(f"   ✅ Removed prefixes in [{c.get('id')}]")


    # ============================================================
    # Phase 1 — 替換 MIN/MAX 為 CASE
    # ============================================================
    print("\n🔧 Phase 1: Replacing MIN/MAX with CASE...")

    def replace_min_max(expr, depth=0):
        if not isinstance(expr, list) or not expr:
            return expr
        op = expr[0]
        indent = "  " * depth

        if op == "MIN":
            if len(expr) == 3:
                a, b = replace_min_max(expr[1], depth + 1), replace_min_max(expr[2], depth + 1)
                new_expr = ["CASE", ["LE", a, b], a, b]
                print(f"{indent}🔄 MIN({a}, {b}) → CASE")
                return new_expr
            return expr[1]
        elif op == "MAX":
            if len(expr) == 3:
                a, b = replace_min_max(expr[1], depth + 1), replace_min_max(expr[2], depth + 1)
                new_expr = ["CASE", ["GE", a, b], a, b]
                print(f"{indent}🔄 MAX({a}, {b}) → CASE")
                return new_expr
            return expr[1]
        else:
            return [op] + [replace_min_max(e, depth + 1) for e in expr[1:]]
    
    for c in constraints:
        if c.get("expr"):
            original = copy.deepcopy(c["expr"])
            c["expr"] = replace_min_max(c["expr"])
            if c["expr"] != original:
                total_min_max_replacements += 1
                if stats:
                    stats.log_fix(c.get("id"), "MIN/MAX to CASE", original, c["expr"])
                print(f"   ✅ Replaced MIN/MAX in [{c.get('id')}]")

    # ============================================================
    # Phase 2 — 分析 CASE 是否需要轉 Real
    # ============================================================
    def has_real_operation(expr):
        if not isinstance(expr, list) or not expr:
            return False
        op = expr[0]
        if op == "DIV":
            return True
        for item in expr[1:]:
            if isinstance(item, float):
                return True
            elif isinstance(item, str) and item in var_types and var_types[item] == "Real":
                return True
            elif isinstance(item, list) and has_real_operation(item):
                return True
        return False
    
    def analyze_expr_for_real(expr):
        if not isinstance(expr, list) or not expr:
            return
        if expr[0] == "EQ" and len(expr) >= 3:
            left, right = expr[1], expr[2]
            if isinstance(right, list) and right and right[0] == "CASE":
                if has_real_operation(right):
                    if isinstance(left, str) and left in var_types:
                        vars_to_convert_real.add(left)
                        print(f"   🔍 Detected: {left} should be Real (CASE with Real ops)")
        for item in expr[1:]:
            if isinstance(item, list):
                analyze_expr_for_real(item)
    
    print("\n🔍 Phase 2: Analyzing expressions...")
    for c in constraints:
        if c.get("expr"):
            analyze_expr_for_real(c["expr"])
    print(f"   Found {len(vars_to_convert_real)} variables to convert: {vars_to_convert_real}")

    # ============================================================
    # Phase 3 — 更新 VarSpecs 型別
    # ============================================================
    print("\n🔧 Phase 3: Updating VarSpecs...")
    updated_varspecs = []
    for vs in varspecs:
        name, typ = vs["name"], vs["type"]
        if name in vars_to_convert_real and typ != "Real":
            updated_vs = vs.copy()
            updated_vs["type"] = "Real"
            updated_vs["_auto_converted"] = True
            updated_varspecs.append(updated_vs)
            total_vars_converted_to_real += 1
            if stats:
                stats.log_fix(f"varspec:{name}", "Auto convert to Real", typ, "Real")
            print(f"   ✅ {name}: {typ} → Real")
        else:
            updated_varspecs.append(vs)
    var_types = {vs["name"]: vs["type"] for vs in updated_varspecs}

    # ============================================================
    # Phase 4 — 修復 CASE 結構與型別
    # ============================================================
    print("\n🔧 Phase 4: Fixing CASE expressions...")

    def convert_to_real(value):
        """把所有 int → float"""
        if isinstance(value, bool):
            return value
        if isinstance(value, int):
            return float(value)
        return value
    
    def fix_case_structure(expr, depth=0):
        """修正 CASE 結構"""
        if not isinstance(expr, list) or not expr:
            return expr
        if expr[0] != "CASE":
            return [expr[0]] + [fix_case_structure(e, depth + 1) for e in expr[1:]]

        indent = "  " * depth
        elements = expr[1:]

        pairs = []
        default = None
        i = 0
        while i < len(elements):
            if i + 1 < len(elements):
                pairs.append((elements[i], elements[i + 1]))
                i += 2
            else:
                default = elements[i]
                i += 1
        if default is None:
            print(f"{indent}⚠️ CASE 缺少 default，補上 0.0")
            default = 0.0

        fixed = ["CASE"]
        for cond, val in pairs:
            fixed.append(fix_case_structure(cond, depth + 1))
            fixed.append(fix_case_structure(val, depth + 1))
        fixed.append(fix_case_structure(default, depth + 1))
        return fixed
    
    def fix_case_expr(expr, depth=0):
        """遞歸修正 CASE：補 default + 統一型別為 Real"""
        expr = fix_case_structure(expr, depth)
        if not isinstance(expr, list) or not expr or expr[0] != "CASE":
            return expr

        indent = "  " * depth
        use_real = has_real_operation(expr)
        if not use_real:
            return expr

        print(f"{indent}🔧 Fixing CASE (use_real=True, {len(expr)} elements)")
        fixed = ["CASE"]
        for i in range(1, len(expr)):
            item = expr[i]
            is_value = (i % 2 == 0) or (i == len(expr) - 1)
            if is_value:
                val = convert_to_real(item)
                fixed.append(val)
                if isinstance(item, int):
                    print(f"{indent}   [val] {item} → {val}")
            else:
                fixed.append(fix_case_expr(item, depth + 1))
        return fixed
    
    fixed_constraints = []
    for c in constraints:
        expr = c.get("expr")
        if not expr:
            fixed_constraints.append(c)
            continue

        original = copy.deepcopy(expr)
        fixed_expr = fix_case_expr(expr)

        if fixed_expr != original:
            cid = c.get("id", "unknown")
            total_case_fixes += 1
            if stats:
                stats.log_fix(cid, "Fix CASE structure/type", original, fixed_expr)
            print(f"   ✅ Fixed constraint [{cid}]")

        new_c = c.copy()
        new_c["expr"] = fixed_expr
        fixed_constraints.append(new_c)

    print("\n✅ Phase 4 completed")
    
    # 最終統計摘要
    print(f"\n📊 sync_types_constraints_and_varspecs Summary:")
    print(f"   - Prefix removals: {total_prefix_removals}")
    print(f"   - MIN/MAX replacements: {total_min_max_replacements}")
    print(f"   - Variables converted to Real: {total_vars_converted_to_real}")
    print(f"   - CASE fixes: {total_case_fixes}")
    print(f"   - Total fixes: {total_prefix_removals + total_min_max_replacements + total_vars_converted_to_real + total_case_fixes}")
    
    return fixed_constraints, updated_varspecs


def repair_sat_to_unsat(team, constraints, facts, varspecs, z3_vars, build_expr, case_text, stats):
    """
    當 SAT 但期望 UNSAT 時的修復策略
    優先順序：Facts > Constraints > VarSpecs
    """
    print("🔧 Starting SAT→UNSAT repair process...")
    
    # === 策略 1: 修復 Facts ===
    print("\n--- Strategy 1: Repair Facts ---")
    
    # 重新請 mapper 生成更激進的違規 facts
    aggressive_mapper_prompt = (
        f"【法律案例】\n{case_text}\n\n"
        f"【相關 Constraints】\n{json.dumps(constraints, ensure_ascii=False, indent=2)}\n\n"
        f"【需用到的變數與型別】\n{json.dumps(varspecs, ensure_ascii=False, indent=2)}\n\n"
        "——請根據案例內容，輸出 facts（JSON 物件）。\n\n"
        
        "⚠️ **特別注意**：\n"
        "1. **這是違規案例，必須設定 facts 明顯違反至少一個 constraint**\n"
        "2. **請設定較極端的數值來確保違規**（例如：比例設為 0 或超過限制）\n"
        "3. **如果有布林變數，請設定為會造成違規的值**\n"
        "4. **如果有數值變數，請設定為明顯超出合規範圍的值**\n"
        "5. 禁止使用 null/None\n"
        "6. 只能使用 VarSpec 中的變數\n\n"
        
        "範例違規設定：\n"
        "- 如果法規要求 capital_ratio >= 0.08，請設定為 0.0 或 0.05\n"
        "- 如果法規要求 stop_distribution = true，請設定為 false\n"
        "- 如果法規要求 days <= 30，請設定為 60\n\n"
        
        "僅輸出 JSON 物件："
    )
    
    mapper_messages = [{"role": "user", "content": aggressive_mapper_prompt}]
    
    start = time.time()
    new_mapper_reply, input_tokens, output_tokens = get_reply_with_tokens(team["mapper"], mapper_messages)
    elapsed = time.time() - start
    stats.log_agent_call("mapper_aggressive_repair", input_tokens, output_tokens, elapsed)
    
    try:
        import re
        new_mapper_reply = clean_json_response(new_mapper_reply)
        new_mapper_reply = re.sub(r'//.*', '', new_mapper_reply)
        new_mapper_reply = re.sub(r'/\*.*?\*/', '', new_mapper_reply, flags=re.DOTALL)
        
        new_facts = json.loads(new_mapper_reply)
        if "facts" in new_facts:
            new_facts = new_facts["facts"]
            
        # 過濾無效變數
        z3_var_names = set(z3_vars.keys())
        new_facts = {k: v for k, v in new_facts.items() if k in z3_var_names}
        
        print(f"✅ Generated new aggressive facts: {list(new_facts.keys())}")
        
        # 測試新的 facts
        sat_result, info = check_case_law_hard(constraints, new_facts, z3_vars, build_expr)
        if sat_result == "UNSAT":
            print(f"✅ Facts修復成功！UNSAT achieved: {info}")
            return new_facts, constraints, varspecs, True
        else:
            print(f"⚠️ Facts修復後仍然 {sat_result}")
            
    except Exception as e:
        print(f"❌ Facts修復失敗: {e}")
    
    # === 策略 2: 加強 Constraints ===
    print("\n--- Strategy 2: Strengthen Constraints ---")
    
    strengthen_prompt = (
        f"【現有 Constraints】\n{json.dumps(constraints, ensure_ascii=False, indent=2)}\n\n"
        f"【Case Facts】\n{json.dumps(facts, ensure_ascii=False, indent=2)}\n\n"
        f"【法律案例】\n{case_text}\n\n"
        
        "目前 constraints + facts 組合是 SAT（可滿足），但這是違規案例，應該要 UNSAT。\n"
        "請加強 constraints，使其更嚴格，以確保違規案例會被檢測出來。\n\n"
        
        "修復策略：\n"
        "1. 收緊數值範圍（例如：>= 0.1 改為 >= 0.15）\n"
        "2. 加入更多約束條件\n"
        "3. 修正邏輯條件（例如：Or 改為 And）\n"
        "4. 加強連鎖約束（例如：if A then B and C）\n\n"
        
        "請輸出加強後的 ConstraintSpec[]（JSON 陣列）："
    )
    
    repair_messages = [{"role": "user", "content": strengthen_prompt}]
    
    start = time.time()
    repair_reply, input_tokens, output_tokens = get_reply_with_tokens(team["parser"], repair_messages)
    elapsed = time.time() - start
    stats.log_agent_call("parser_strengthen_constraints", input_tokens, output_tokens, elapsed)
    
    try:
        strengthened_constraints = ensure_json_valid(team, repair_reply)
        print(f"✅ Generated {len(strengthened_constraints)} strengthened constraints")
        
        # 測試加強後的 constraints
        sat_result, info = check_case_law_hard(strengthened_constraints, facts, z3_vars, build_expr)
        if sat_result == "UNSAT":
            print(f"✅ Constraints加強成功！UNSAT achieved: {info}")
            return facts, strengthened_constraints, varspecs, True
        else:
            print(f"⚠️ Constraints加強後仍然 {sat_result}")
            
    except Exception as e:
        print(f"❌ Constraints加強失敗: {e}")
    
    # === 策略 3: 組合修復 ===
    print("\n--- Strategy 3: Combined Repair ---")
    
    if 'new_facts' in locals() and 'strengthened_constraints' in locals():
        try:
            sat_result, info = check_case_law_hard(strengthened_constraints, new_facts, z3_vars, build_expr)
            if sat_result == "UNSAT":
                print(f"✅ 組合修復成功！UNSAT achieved: {info}")
                return new_facts, strengthened_constraints, varspecs, True
            else:
                print(f"❌ 組合修復後仍然 {sat_result}")
        except Exception as e:
            print(f"❌ 組合修復失敗: {e}")
    
    print("❌ 所有修復策略都失敗")
    return facts, constraints, varspecs, False