import json
import pandas as pd
from pathlib import Path
import time

from config import llm_config
from agents.orchestrator import build_team
from agents.prompt import COMPLETION_PROMPT_TEMPLATE
from core.repair_pipeline import repair_loop
from marco.json2z3 import declare_vars, build_expr

from utils import (
    get_reply_with_tokens,
    ensure_json_valid,
    check_constraints_parseable,
    check_constraints_consistency,
    check_case_law_hard,
    z3_optimize_case,
    calculate_cost,
    extract_all_vars,
    check_constraints_parseable,
    repair_loop_with_rounds,
    auto_fix_constraints,
    consistency_check_with_repair,
    add_penalty_meta,
    diagnose_constraints
)


DATA = Path("data/dataset.csv")
OUT = Path("outputs"); OUT.mkdir(parents=True, exist_ok=True)


# 新增：儲存每個 agent 輸出的輔助函式
def save_agent_output(case_id, name, content):
    path = OUT / f"{case_id}.{name}.json"
    try:
        # 若是字串，嘗試 parse 成 JSON，失敗時包成 raw 字串存
        if isinstance(content, str):
            try:
                parsed = json.loads(content)
                path.write_text(json.dumps(parsed, ensure_ascii=False, indent=2), encoding="utf-8")
            except Exception:
                path.write_text(json.dumps({"raw": content}, ensure_ascii=False, indent=2), encoding="utf-8")
        else:
            path.write_text(json.dumps(content, ensure_ascii=False, indent=2), encoding="utf-8")
    except Exception as e:
        print(f"⚠️ Failed to save {name} output: {e}")

def run_pipeline(team, case_id, case_text, statute_text):
    """
    執行完整流程圖的 pipeline
    """
    logs = {}
    
    # === Step 1: Law Parser ===
    print("Step 1: Law Parser")
    parser_prompt = f"【相關法條】\n{statute_text}\n——請輸出 ConstraintSpec[]（JSON 陣列）。"
    parser_messages = [{"role": "user", "content": parser_prompt}]
    parser_reply, _, _ = get_reply_with_tokens(team["parser"], parser_messages)
    # 儲存 parser 初步回覆
    save_agent_output(case_id, "parser.initial_reply", parser_reply)

    # === Step 2: Completion (補完) ===
    print("Step 2: Law Completion")
    completion_prompt = COMPLETION_PROMPT_TEMPLATE.format(
        statute_text=statute_text,
        existing_constraints=parser_reply
    )
    parser_messages.append({"role": "user", "content": completion_prompt})
    completion_reply, _, _ = get_reply_with_tokens(team["parser"], parser_messages)
    # 儲存 parser 補完回覆
    save_agent_output(case_id, "parser.completion_reply", completion_reply)

    # === Step 3: JSON Valid? ===
    print("Step 3: Ensure JSON Valid")
    # constraints = ensure_json_valid(team, completion_reply)
    constraints = ensure_json_valid(team, parser_reply)
    
    # 儲存解析後的 constraints（JSON 物件）
    save_agent_output(case_id, "parser.constraints_parsed", constraints)
    
    # === Step 3.5: Add Penalty Meta ===
    # print("Step 3.5: Add penalty meta rules")
    # constraints = add_penalty_meta(team, constraints)
    # save_agent_output(case_id, "parser.constraints_with_penalty", constraints)

    # === Step 4: VarSpec ===
    print("Step 4: VarSpec Extraction")
    used_vars = extract_all_vars(constraints)
    varspec_prompt = f"【需用到的變數】\n{', '.join(used_vars)}\n——請輸出 varspecs（JSON 陣列）。"
    varspec_messages = [{"role": "user", "content": varspec_prompt}]
    varspec_reply, _, _ = get_reply_with_tokens(team["varspec"], varspec_messages)
    # 儲存 varspec agent 的原始回覆
    save_agent_output(case_id, "varspec.raw_reply", varspec_reply)
    varspecs = json.loads(varspec_reply)
    # 儲存解析後的 varspecs
    save_agent_output(case_id, "varspec.parsed", varspecs)

    # 宣告 Z3 變數
    z3_vars = declare_vars(varspecs)
    constraints, varspecs = auto_fix_constraints(constraints, varspecs)

    # === Step 5: Constraints 可 parse? ===
    print("Step 5: Check Constraints Parseable")

    ok, err = check_constraints_parseable(constraints, z3_vars, build_expr)
    rounds = 0
    if not ok:
    # 先診斷
        problems = diagnose_constraints(constraints, z3_vars, build_expr)
        print(f"⚠️ Found {len(problems)} problematic constraints:")
        for p in problems:
            print(f"  - [{p['id']}] {p['error']}")
            
    while not ok and rounds < 3:   # 最多嘗試 3 輪
        print(f"⚠️ Constraints parse failed: {err}")
        # 在 repair 過程中，repair_loop_with_rounds 可能會呼叫多個 agent
        # 我們在外層儲存修復 attempt 前後的狀態（若該函式回傳可儲存的內容）
        constraints, varspecs, ok, rounds, last_err = repair_loop_with_rounds(
        team, constraints, varspecs, build_expr, z3_vars, max_rounds=3
    )
        # 儲存每次修復後的中間結果（若有變化）
        save_agent_output(case_id, f"repair.rounds_{rounds}.constraints", constraints)
        save_agent_output(case_id, f"repair.rounds_{rounds}.varspecs", varspecs)
        if ok:
            print(f"✅ Repair success after {rounds} round(s)")
            break
        err = last_err

    if not ok:
        raise RuntimeError(f"❌ 修復失敗，最後錯誤: {err}")
    else:
        print("✅ Constraints successfully parsed into Z3 expressions")
    # === Step 6: Constraints Consistency ===
    print("Step 6: Constraints Consistency")
    constraints, ok, result, info = consistency_check_with_repair(team, constraints, z3_vars, build_expr)
    # 儲存一致性檢查回傳資訊
    save_agent_output(case_id, "consistency.result", {"ok": ok, "result": result, "info": info})

    if not ok:
        print(f"⚠️ Still inconsistent after repair: {info}")
    else:
        print("✅ Constraints passed consistency check")

        # 🔑 修復後重新生成 VarSpec 和 Z3 Vars
        used_vars = extract_all_vars(constraints)
        varspec_prompt = f"【需用到的變數】\n{', '.join(used_vars)}\n——請輸出 varspecs（JSON 陣列）。"
        varspec_messages = [{"role": "user", "content": varspec_prompt}]
        varspec_reply, _, _ = get_reply_with_tokens(team["varspec"], varspec_messages)
        save_agent_output(case_id, "varspec.post_repair_raw", varspec_reply)
        varspecs = json.loads(varspec_reply)
        save_agent_output(case_id, "varspec.post_repair_parsed", varspecs)

        z3_vars = declare_vars(varspecs)
    # === Step 7: Case Mapper ===
    print("Step 7: Case Mapper")
    mapper_prompt = (
        f"【法律案例】\n{case_text}\n"
        f"【需用到的變數與型別】\n{json.dumps(varspecs, ensure_ascii=False, indent=2)}\n"
        "——請輸出 facts（JSON 物件）。"
    )
    mapper_messages = [{"role": "user", "content": mapper_prompt}]
    mapper_reply, _, _ = get_reply_with_tokens(team["mapper"], mapper_messages)
    # 儲存 mapper 原始回覆
    save_agent_output(case_id, "mapper.raw_reply", mapper_reply)
    facts = json.loads(mapper_reply)
    if "facts" in facts:
        facts = facts["facts"]
    # 儲存解析後的 facts
    save_agent_output(case_id, "mapper.parsed_facts", facts)


    # === Step 8: Case+Law Hard Check ===  
    print("Step 8: Case+Law Hard Check")
    sat_result, info = check_case_law_hard(constraints, facts, z3_vars, build_expr)

    if sat_result == "UNSAT":
        print(f"❌ Case+Law UNSAT → 違規案例 (Unsat core: {info})")
        # 這裡你可以選擇：直接標註為違規，不呼叫 repair
        violation = True
    elif sat_result == "SAT":
        print("✅ Case+Law SAT → 合規案例")
        violation = False
    else:
        print(f"⚠️ Case+Law check returned {sat_result}: {info}")
        violation = None  # 表示不確定

    # === Step 9: Z3 Optimize ===
    print("Step 9: Z3 Optimize")
    ok, model = z3_optimize_case(constraints, facts, z3_vars, build_expr)
    if ok:
        print(f"✅ Optimization success for {case_id}: {model}")
    else:
        print(f"⚠️ Optimization failed for {case_id}: {model}")

    # === return 結果 ===
    return {
        "constraints": constraints,
        "varspecs": varspecs,
        "facts": facts,
       # "model": model if ok else None
    }

def main():
    team = build_team(llm_config)
    df = pd.read_csv(DATA)

    all_records = []

    for idx, row in df.iterrows():
        case_id = f"case_{idx}"
        case_text = str(row["法律案例"])
        statute_text = str(row["相關法條"])

        print(f"\n=== Running {case_id} ===")
        start = time.time()

        # 執行 pipeline
        result = run_pipeline(team, case_id, case_text, statute_text)

        # === 寫檔 (三份 json) ===
        (OUT / f"{case_id}.constraint_spec.json").write_text(
            json.dumps(result["constraints"], ensure_ascii=False, indent=2),
            encoding="utf-8"
        )
        (OUT / f"{case_id}.varspecs.json").write_text(
            json.dumps(result["varspecs"], ensure_ascii=False, indent=2),
            encoding="utf-8"
        )
        (OUT / f"{case_id}.facts.json").write_text(
            json.dumps(result["facts"], ensure_ascii=False, indent=2),
            encoding="utf-8"
        )

        elapsed = time.time() - start
        print(f"[OK] {case_id} finished in {elapsed:.2f}s")

        all_records.append({"case_id": case_id, "elapsed": elapsed})

    # === 保存時間統計 ===
    timing_df = pd.DataFrame(all_records)
    timing_csv = OUT / "timing_statistics.csv"
    timing_df.to_csv(timing_csv, index=False, encoding="utf-8")
    print(f"\n=== 總結 ===")
    print(f"總案例數: {len(all_records)}")
    print(f"平均耗時: {timing_df['elapsed'].mean():.2f} 秒")
    print(f"結果已保存至 {timing_csv}")


if __name__ == "__main__":
    main()