import json
import pandas as pd
from pathlib import Path
import time
from config import llm_config
from agents.orchestrator import build_team
from core.schema import VarSpec, ConstraintSpec
from core.renderer import render_z3_snippet
from agents.prompt import COMPLETION_PROMPT_TEMPLATE
from agents.json_fixer import make_json_fixer
from core.repair_pipeline import repair_loop   # ✅ 新增
from marco.json2z3 import declare_vars, build_expr   # ✅ 引進給 repair_loop 用
import tiktoken

TOKEN_PRICES = {
    "input": 0.4 / 1000000, # $0.4 per 1M tokens 
    "output": 1.6 / 1000000, # $1.6per 1M tokens
}
DATA = Path("data/dataset.csv")
OUT = Path("outputs"); OUT.mkdir(parents=True, exist_ok=True)


def count_tokens(text, model="gpt-4"):
    """計算文本的token數量"""
    try:
        encoding = tiktoken.encoding_for_model(model)
        return len(encoding.encode(text))
    except:
        # 如果無法取得encoding，使用粗略估算 (4字符≈1token)
        return len(text) // 4

def calculate_cost(input_tokens, output_tokens):
    """計算成本"""
    input_cost = input_tokens * TOKEN_PRICES["input"]
    output_cost = output_tokens * TOKEN_PRICES["output"]
    return input_cost + output_cost

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

def main():
    team = build_team(llm_config)
    df = pd.read_csv(DATA)
    
    # ✅ 新增：時間統計列表
    timing_records = []

    for idx, row in df.iterrows():
        case_id = f"case_{idx}"
        case_text = str(row["法律案例"])
        statute_text = str(row["相關法條"])
        
        # ✅ 新增：單個案例的時間記錄 + Token記錄
        case_timing = {
            "case_id": case_id,
            "parser_time": 0,
            "completion_time": 0,
            "json_fixer_time": 0,
            "varspec_time": 0,
            "mapper_time": 0,
            "repair_time": 0,
            "repair_rounds": 0,
            "total_time": 0,
            # Token統計
            "parser_input_tokens": 0,
            "parser_output_tokens": 0,
            "completion_input_tokens": 0,
            "completion_output_tokens": 0,
            "json_fixer_input_tokens": 0,
            "json_fixer_output_tokens": 0,
            "varspec_input_tokens": 0,
            "varspec_output_tokens": 0,
            "mapper_input_tokens": 0,
            "mapper_output_tokens": 0,
            "repair_input_tokens": 0,
            "repair_output_tokens": 0,
            "total_input_tokens": 0,
            "total_output_tokens": 0,
            "total_tokens": 0,
            "estimated_cost": 0.0
        }
        
        case_start_time = time.time()

        # === 1) 法條解析 ===
        print("Law parser 解析中...")
        parser_start = time.time()
        parser_prompt = f"【相關法條】\n{statute_text}\n——請輸出 ConstraintSpec[]（JSON 陣列）。"
        parser_messages = [{"role": "user", "content": parser_prompt}]
        parser_reply_content, input_tokens, output_tokens = get_reply_with_tokens(team["parser"], parser_messages)
        parser_messages.append({"role": "assistant", "content": parser_reply_content})
        case_timing["parser_time"] = time.time() - parser_start
        case_timing["parser_input_tokens"] = input_tokens
        case_timing["parser_output_tokens"] = output_tokens

        print("Law parser 補完中...")
        completion_start = time.time()
        completion_prompt = COMPLETION_PROMPT_TEMPLATE.format(
            statute_text=statute_text,
            existing_constraints=parser_reply_content
        )
        parser_messages.append({"role": "user", "content": completion_prompt})
        completion_reply_content, input_tokens, output_tokens = get_reply_with_tokens(team["parser"], parser_messages)
        parser_messages.append({"role": "assistant", "content": completion_reply_content})
        case_timing["completion_time"] = time.time() - completion_start
        case_timing["completion_input_tokens"] = input_tokens
        case_timing["completion_output_tokens"] = output_tokens

        try:
            constraints = json.loads(completion_reply_content)
        except json.JSONDecodeError:
            print("⚠️ JSON parse failed, trying to fix with JsonFixer...")
            fixer_start = time.time()
            fixer_messages = [{"role": "user", "content": completion_reply_content}]
            fixed_content, input_tokens, output_tokens = get_reply_with_tokens(team["json_fixer"], fixer_messages)
            constraints = json.loads(fixed_content)
            case_timing["json_fixer_time"] = time.time() - fixer_start
            case_timing["json_fixer_input_tokens"] = input_tokens
            case_timing["json_fixer_output_tokens"] = output_tokens

        used_vars = extract_all_vars(constraints)
        print(f"Extracted {len(used_vars)} used vars:", used_vars)

        # === 2) VarSpec 生成 ===
        print("VarSpecAgent 解析中...")
        varspec_start = time.time()
        varspec_prompt = (
            f"【需用到的變數】\n{', '.join(used_vars)}\n"
            "——請輸出 varspecs（JSON 陣列）。"
        )
        varspec_messages = [{"role": "user", "content": varspec_prompt}]
        varspec_reply_content, input_tokens, output_tokens = get_reply_with_tokens(team["varspec"], varspec_messages)
        varspecs = json.loads(varspec_reply_content)
        case_timing["varspec_time"] = time.time() - varspec_start
        case_timing["varspec_input_tokens"] = input_tokens
        case_timing["varspec_output_tokens"] = output_tokens

        # === 3) Case facts 解析 ===
        print("Case mapper 解析中...")
        mapper_start = time.time()
        mapper_prompt = (
            f"【法律案例】\n{case_text}\n"
            f"【需用到的變數與型別】\n{json.dumps(varspecs, ensure_ascii=False, indent=2)}\n"
            "——請輸出 facts（JSON 物件），必須符合上述 varspecs 的型別與格式。"
        )
        mapper_messages = [{"role": "user", "content": mapper_prompt}]
        mapper_reply_content, input_tokens, output_tokens = get_reply_with_tokens(team["mapper"], mapper_messages)
        mapper_messages.append({"role": "assistant", "content": mapper_reply_content})
        facts = json.loads(mapper_reply_content)
        mapping = {"varspecs": varspecs, "facts": facts}
        case_timing["mapper_time"] = time.time() - mapper_start
        case_timing["mapper_input_tokens"] = input_tokens
        case_timing["mapper_output_tokens"] = output_tokens

        # === 4) Constraint Repair ===
        print("Constraint repair 中...")
        repair_start = time.time()
        z3_vars = declare_vars(varspecs)
        
        # ✅ 修改：使用包裝函數來獲取修復輪數和token統計
        constraints, repair_rounds, repair_input_tokens, repair_output_tokens = repair_loop_with_rounds(team, constraints, build_expr, z3_vars)
        
        case_timing["repair_time"] = time.time() - repair_start
        case_timing["repair_rounds"] = repair_rounds
        case_timing["repair_input_tokens"] = repair_input_tokens
        case_timing["repair_output_tokens"] = repair_output_tokens

        # === 計算總Token和成本 ===
        case_timing["total_input_tokens"] = (
            case_timing["parser_input_tokens"] + 
            case_timing["completion_input_tokens"] +
            case_timing["json_fixer_input_tokens"] +
            case_timing["varspec_input_tokens"] +
            case_timing["mapper_input_tokens"] +
            case_timing["repair_input_tokens"]
        )
        case_timing["total_output_tokens"] = (
            case_timing["parser_output_tokens"] + 
            case_timing["completion_output_tokens"] +
            case_timing["json_fixer_output_tokens"] +
            case_timing["varspec_output_tokens"] +
            case_timing["mapper_output_tokens"] +
            case_timing["repair_output_tokens"]
        )
        case_timing["total_tokens"] = case_timing["total_input_tokens"] + case_timing["total_output_tokens"]
        case_timing["estimated_cost"] = calculate_cost(case_timing["total_input_tokens"], case_timing["total_output_tokens"])

        # === 5) 寫檔 ===
        (OUT / f"{case_id}.constraint_spec.json").write_text(
            json.dumps(constraints, ensure_ascii=False, indent=2), encoding="utf-8"
        )
        (OUT / f"{case_id}.varspec_facts.json").write_text(
            json.dumps(mapping, ensure_ascii=False, indent=2), encoding="utf-8"
        )

        # log
        (OUT / f"{case_id}.parser_log.txt").write_text(
            "\n\n".join([f"{m['role'].upper()}: {m['content']}" for m in parser_messages]), encoding="utf-8"
        )
        (OUT / f"{case_id}.mapper_log.txt").write_text(
            "\n\n".join([f"{m['role'].upper()}: {m['content']}" for m in mapper_messages]), encoding="utf-8"
        )

        # ✅ 計算總時間並添加到記錄
        case_timing["total_time"] = time.time() - case_start_time
        timing_records.append(case_timing)

        print(f"[OK] {case_id} → outputs/{case_id}.* (總耗時: {case_timing['total_time']:.2f}秒, 修復{repair_rounds}輪, 總Token: {case_timing['total_tokens']:,}, 成本: ${case_timing['estimated_cost']:.4f})")

    # ✅ 新增：保存時間統計到CSV
    timing_df = pd.DataFrame(timing_records)
    timing_csv_path = OUT / "timing_statistics.csv"
    timing_df.to_csv(timing_csv_path, index=False, encoding="utf-8")
    
    # ✅ 新增：顯示統計摘要
    print(f"\n=== 時間與成本統計摘要 ===")
    print(f"總案例數: {len(timing_records)}")
    print(f"平均每案例耗時: {timing_df['total_time'].mean():.2f}秒")
    print(f"Parser 平均耗時: {timing_df['parser_time'].mean():.2f}秒")
    print(f"Completion 平均耗時: {timing_df['completion_time'].mean():.2f}秒")
    print(f"VarSpec 平均耗時: {timing_df['varspec_time'].mean():.2f}秒")
    print(f"Mapper 平均耗時: {timing_df['mapper_time'].mean():.2f}秒")
    print(f"Repair 平均耗時: {timing_df['repair_time'].mean():.2f}秒")
    print(f"平均修復輪數: {timing_df['repair_rounds'].mean():.1f}")
    print(f"\n=== Token & 成本統計 ===")
    print(f"平均每案例 Input Tokens: {timing_df['total_input_tokens'].mean():,.0f}")
    print(f"平均每案例 Output Tokens: {timing_df['total_output_tokens'].mean():,.0f}")
    print(f"平均每案例總 Tokens: {timing_df['total_tokens'].mean():,.0f}")
    print(f"平均每案例成本: ${timing_df['estimated_cost'].mean():.4f}")
    print(f"總 Input Tokens: {timing_df['total_input_tokens'].sum():,}")
    print(f"總 Output Tokens: {timing_df['total_output_tokens'].sum():,}")
    print(f"總 Tokens: {timing_df['total_tokens'].sum():,}")
    print(f"總成本: ${timing_df['estimated_cost'].sum():.4f}")
    print(f"時間統計已保存至: {timing_csv_path}")
def repair_loop_with_rounds(team, constraints, build_expr, z3_vars):
    """
    包裝原始的 repair_loop，追蹤修復輪數和token使用量
    """
    total_input_tokens = 0
    total_output_tokens = 0
    
    # 先嘗試呼叫原始函數
    try:
        # 如果repair_loop需要token追蹤，可能需要修改實現
        # 這裡假設我們需要手動實現token追蹤
        result = repair_loop(team, constraints, build_expr, z3_vars)
        
        # 檢查返回值是否為元組 (constraints, rounds)
        if isinstance(result, tuple) and len(result) == 2:
            return result[0], result[1], total_input_tokens, total_output_tokens
        else:
            # 如果只返回 constraints，估算為 1 輪
            return result, 1, total_input_tokens, total_output_tokens
            
    except Exception as e:
        print(f"Repair failed: {e}")
        # 返回原始 constraints 和 0 輪
        return constraints, 0, total_input_tokens, total_output_tokens


if __name__ == "__main__": 
    main()