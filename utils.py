import json
import tiktoken
import z3
from marco.json2z3 import declare_vars, build_expr

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
                    used.add(expr[1])
            else:
                for e in expr:
                    walk(e)
        elif isinstance(expr, str):
            if expr not in ops:
                used.add(expr)

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
                # 如果 constraint operator 是 EQ，int 應該被解讀成 bool
                return True if e == 1 else False if e == 0 else e
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
            # fallback 到原本的全量修復邏輯
            target = "varspec"
        else:
            print(f"📍 Found {len(problems)} problematic constraint(s):")
            for p in problems:
                print(f"   [{p['id']}] {p['error']}")
            
            # 提取有問題的 constraints
            problem_indices = {p['index'] for p in problems}
            problem_constraints = [repaired_constraints[i] for i in problem_indices]
            
            # === 判斷錯誤類型 ===
            # if "True, False or Z3 Boolean expression expected" in str(err):
            #     target = "varspec"
            if "not found" in str(err).lower():
                target = "varspec"
            else:
                target = "constraint"

        # === 呼叫 LLM 修復 ===
        if target == "varspec":
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
            reply, _, _ = get_reply_with_tokens(team["repair"], repair_messages)
            try:
                repaired_varspecs = json.loads(reply)
                z3_vars = declare_vars(repaired_varspecs)
            except Exception as e:
                print(f"⚠️ VarSpec 修復 JSON parse 失敗: {e}")
                continue

        else:  # constraint 錯誤
            # 🔑 只修復有問題的 constraints
             for p in problems:
                idx = p["index"]
                bad_constraint = repaired_constraints[idx]
                print(f"\n🔧 修復 constraint [{bad_constraint.get('id', idx)}]")

                repair_prompt = f"""
Z3 parsing 失敗，錯誤訊息：
{p['error']}

有問題的 constraint：
{json.dumps(bad_constraint, ensure_ascii=False, indent=2)}

📌 修復規則（務必遵守）：
1. **禁止更改任何變數名稱**
   - 保持所有變數的原始名稱（包括冒號、底線等符號）
   - 例如：`insurance:capital_severely_insufficient_measures` 不可改成 `insurance_capital_severely_insufficient_measures`
   
2. **只修正以下問題**：
   - 缺少 EQ 綁定：確保 expr 最外層是 `["EQ", "<constraint_id>", <condition>]`
   - 型別錯誤：確保 Bool/Int/Real 使用正確
   - 運算子缺少操作數：例如 `["GE", "CAR"]` 應改為 `["GE", "CAR", 200.0]`
   - 邏輯運算子的子項必須是 Bool：例如 `["NOT", "capital_level"]` 應改為 `["NOT", ["EQ", "capital_level", 2]]`

3. **保持原有語意**：不要改變約束的邏輯含義

4. **constraint id 必須與 expr 中的變數名稱一致**

範例修復：
❌ 錯誤修復（改變了變數名稱）：
```json
{{
  "id": "insurance:capital_adequate",
  "expr": ["EQ", "insurance_capital_adequate", ...] 
}}
```

✅ 正確修復（保持變數名稱）：
```json
{{
  "id": "insurance:capital_adequate",
  "expr": ["EQ", "insurance:capital_adequate", ...]  
}}
```

⚠️ 僅輸出修正後的單一 constraint JSON 物件，不要包含 ```json ``` 等格式標記。
"""
                # print(f"   Prompt: {repair_prompt}...")
                repair_messages = [{"role": "user", "content": repair_prompt}]
                reply, _, _ = get_reply_with_tokens(team["repair"], repair_messages)

                try:
                    fixed = json.loads(reply)
                    print(f"   LLM 回覆: {reply}...")
                    if isinstance(fixed, dict):
                        repaired_constraints[idx] = fixed
                        print(f"   ✓ Constraint [{bad_constraint.get('id', idx)}] 修復完成")
                    else:
                        print(f"⚠️ LLM 回覆非單一 JSON 物件: {type(fixed)}")
                except Exception as e:
                    print(f"⚠️ Constraint 修復 JSON parse 失敗: {e}")
                    print(f"   LLM 回覆: {reply[:200]}...")
            # === 每輪修完再重新檢查（算一輪） ===
        ok, err = check_constraints_parseable(repaired_constraints, z3_vars, build_expr)
        if ok:
            print(f"✅ 修復完成於第 {round_id+1} 輪")
            return repaired_constraints, repaired_varspecs, True, round_id+1, None

        last_err = err
        print(f"❌ 第 {round_id+1} 輪修復仍失敗：{err}")

    return repaired_constraints, repaired_varspecs, False, max_rounds, last_err

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

def consistency_check_with_repair(team, constraints, z3_vars, build_expr, max_attempts=5):
    """
    檢查 constraints consistency，不一致時呼叫修復 Agent
    會把 unsat core 及其相關的 constraints 一起修復
    回傳: (constraints, consistent, result, info)
    """
    for attempt in range(max_attempts):
        consistent, result, info = check_constraints_consistency(constraints, z3_vars, build_expr)

        if consistent:
            print("✅ Constraints are consistent")
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

範例：
若 unsat core 是 `["insurance:capital_insufficient_measures", "insurance:capital_significantly_insufficient_measures"]`
且相關 constraints 包含 `"insurance:capital_level"` 和其他措施變數
則修復時應：
- 確保這些 measures 變數不會同時為 true（因為 capital_level 只能是一個值）
- 或者修改 measures 的定義，讓它們不依賴於互斥的 capital_level 值
- 或者修改 capital_level 的定義，讓它能容納這些邏輯

⚠️ 請輸出完整的修復後 constraints JSON 陣列（包含 🔴 和 🟡 的所有項目）,注意，請不要輸出```json```。
"""
            
            reply, _, _ = get_reply_with_tokens(team["statute_repairer"], [{"role": "user", "content": repair_prompt}])
            print(f"修復 Agent 回傳: {reply[:200]}...")
            
            try:
                repaired = json.loads(reply)
                if not isinstance(repaired, list):
                    repaired = [repaired]
            except Exception as e:
                print(f"⚠️ 修復 Agent 回傳無法解析: {e}")
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
            continue

        if result == "ERROR":
            print(f"❌ Error during satisfiability check: {info}")
            return constraints, False, result, info

        print(f"❌ Unexpected result: {result}, {info}")
        return constraints, False, result, info

    print("❌ Repair attempts exhausted, still inconsistent")
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