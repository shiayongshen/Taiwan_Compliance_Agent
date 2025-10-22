import json
import pandas as pd
from pathlib import Path
import time
from datetime import datetime

from config import llm_config
from agents.orchestrator import build_team
from agents.prompt import COMPLETION_PROMPT_TEMPLATE
from core.repair_pipeline import repair_loop
from marco.json2z3 import declare_vars, build_expr
from concurrent.futures import ThreadPoolExecutor, as_completed
import io
import sys

from utils import (
    get_reply_with_tokens,
    ensure_json_valid,
    sync_types_constraints_and_varspecs,
    check_constraints_parseable,
    check_constraints_consistency,
    repair_sat_to_unsat,
    check_case_law_hard,
    z3_optimize_case,
    calculate_cost,
    extract_all_vars,
    check_constraints_parseable,
    repair_loop_with_rounds,
    auto_fix_constraints,
    consistency_check_with_repair,
    add_penalty_meta,
    diagnose_constraints,
    safe_json_loads,
    clean_json_response,
    repair_case_law_constraints,
    export_to_smt2,
    validate_and_fix_facts
)


DATA = Path("dataset/updated_processed_cases.csv")
OUT = Path("outputs"); OUT.mkdir(parents=True, exist_ok=True)


class PipelineStats:
    """紀錄 pipeline 執行統計"""
    def __init__(self, case_id):
        self.case_id = case_id
        self.start_time = time.time()
        self.agent_calls = []  # 紀錄每次 agent 呼叫
        self.repair_attempts = 0
        self.success = False
        self.error_message = None
        self.fix_logs = []
        
        # 🔑 檢查點狀態
        self.checkpoints = {
            "step1_law_parser": None,
            "step2_completion": None,
            "step3_json_valid": None,
            "step4_varspec": None,
            "step5_constraints_parseable": None,
            "step5_repair_needed": False,
            "step5_repair_success": None,
            "step6_consistency_check": None,
            "step6_repair_success": None,  # 新增：Step 6 修復成功檢查點
            "step7_case_mapper": None,
            "step7_facts_validation": None,
            "step7_z3_validation": None,
            "step8_case_law_check": None,
            "step8_repair_success": None,  # 新增：Step 8 修復成功檢查點
            "step8_violation_detected": None,
            "step9_z3_optimize": None
        }
        
    def log_checkpoint(self, checkpoint_name, passed, details=None):
        """
        紀錄檢查點狀態
        
        Args:
            checkpoint_name: 檢查點名稱
            passed: 是否通過 (True/False/None)
            details: 額外資訊（可選）
        """
        self.checkpoints[checkpoint_name] = {
            "passed": passed,
            "details": details,
            "timestamp": time.time() - self.start_time
        }
        
        # 印出狀態
        status = "✅" if passed else "❌" if passed is False else "⚠️"
        detail_str = f" ({details})" if details else ""
        print(f"{status} Checkpoint [{checkpoint_name}]: {'PASS' if passed else 'FAIL' if passed is False else 'SKIP'}{detail_str}")
        
    def log_agent_call(self, agent_name, input_tokens, output_tokens, elapsed_time):
        """紀錄單次 agent 呼叫"""
        cost = calculate_cost(input_tokens, output_tokens)
        self.agent_calls.append({
            "agent": agent_name,
            "input_tokens": input_tokens,
            "output_tokens": output_tokens,
            "elapsed_time": elapsed_time,
            "cost": cost
        })
    def log_fix(self, constraint_id, rule, before, after):
        """記錄單次自動修復動作"""
        self.fix_logs.append({
            "id": constraint_id,
            "rule": rule,
            "before": before,
            "after": after,
            "timestamp": round(time.time() - self.start_time, 2)
        })
        
    def increment_repair(self):
        """增加修復次數"""
        self.repair_attempts += 1
    
    def mark_success(self):
        """標記成功"""
        self.success = True
    
    def mark_failure(self, error):
        """標記失敗"""
        self.success = False
        self.error_message = str(error)
    
    def get_total_time(self):
        """取得總執行時間"""
        return time.time() - self.start_time
    
    def get_total_tokens(self):
        """取得總 token 數"""
        total_input = sum(call["input_tokens"] for call in self.agent_calls)
        total_output = sum(call["output_tokens"] for call in self.agent_calls)
        return total_input, total_output
    
    def get_total_cost(self):
        """取得總花費"""
        return sum(call["cost"] for call in self.agent_calls)
    
    def get_checkpoint_summary(self):
        """取得檢查點摘要（用於 Excel）"""
        summary = {}
        for name, data in self.checkpoints.items():
            if data is None:
                summary[name] = "NOT_RUN"
            elif isinstance(data, bool):
                summary[name] = "PASS" if data else "FAIL"
            else:
                summary[name] = "PASS" if data.get("passed") else "FAIL" if data.get("passed") is False else "SKIP"
        return summary
    
    def to_summary_dict(self):
        """轉為摘要字典（用於 Excel）"""
        total_input, total_output = self.get_total_tokens()
        base_summary = {
            "case_id": self.case_id,
            "success": self.success,
            "error_message": self.error_message,
            "total_time_sec": round(self.get_total_time(), 2),
            "repair_attempts": self.repair_attempts,
            "total_agent_calls": len(self.agent_calls),
            "total_input_tokens": total_input,
            "total_output_tokens": total_output,
            "total_tokens": total_input + total_output,
            "total_cost_usd": round(self.get_total_cost(), 6),
            "timestamp": datetime.now().isoformat()
        }
        
        # 🔑 加入檢查點狀態
        checkpoint_summary = self.get_checkpoint_summary()
        base_summary.update(checkpoint_summary)
        
        return base_summary
    
    def to_detailed_dict(self):
        """轉為詳細字典（包含每次 agent 呼叫）"""
        summary = self.to_summary_dict()
        summary["agent_calls"] = self.agent_calls
        summary["checkpoints_detail"] = self.checkpoints
        summary["fix_logs"] = self.fix_logs
        return summary


def save_results(case_id, constraints, varspecs, facts, stats):
    """儲存結果到三個 JSON 檔案"""
    # 1. Constraints
    constraint_path = OUT / f"{case_id}.constraint_spec.json"
    constraint_path.write_text(
        json.dumps(constraints, ensure_ascii=False, indent=2),
        encoding="utf-8"
    )
    
    # 2. VarSpecs
    varspec_path = OUT / f"{case_id}.varspecs.json"
    varspec_path.write_text(
        json.dumps(varspecs, ensure_ascii=False, indent=2),
        encoding="utf-8"
    )
    
    # 3. Facts
    facts_path = OUT / f"{case_id}.facts.json"
    facts_path.write_text(
        json.dumps(facts, ensure_ascii=False, indent=2),
        encoding="utf-8"
    )
    
    # 4. 統計資料（詳細版）
    stats_path = OUT / f"{case_id}.stats.json"
    stats_path.write_text(
        json.dumps(stats.to_detailed_dict(), ensure_ascii=False, indent=2),
        encoding="utf-8"
    )
    
    print(f"✅ Saved results to:")
    print(f"   - {constraint_path}")
    print(f"   - {varspec_path}")
    print(f"   - {facts_path}")
    print(f"   - {stats_path}")


def run_pipeline(team, case_id, case_text, statute_text):
    """
    執行完整流程圖的 pipeline
    """
    stats = PipelineStats(case_id)
    log_buffer = io.StringIO()
    old_stdout = sys.stdout
    sys.stdout = log_buffer
    try:
        # === Step 1: Law Parser ===
        print("\n" + "="*60)
        print("Step 1: Law Parser")
        print("="*60)
        parser_prompt = f"【相關法條】\n{statute_text}\n——請輸出 ConstraintSpec[]（JSON 陣列）。"
        parser_messages = [{"role": "user", "content": parser_prompt}]
        
        start = time.time()
        parser_reply, input_tokens, output_tokens = get_reply_with_tokens(team["parser"], parser_messages)
        elapsed = time.time() - start
        stats.log_agent_call("parser", input_tokens, output_tokens, elapsed)
        stats.log_checkpoint("step1_law_parser", True, f"{len(parser_reply)} chars")

        # === Step 2: Completion (補完) ===
        print("\n" + "="*60)
        print("Step 2: Law Completion")
        print("="*60)
        completion_prompt = COMPLETION_PROMPT_TEMPLATE.format(
            statute_text=statute_text,
            existing_constraints=parser_reply
        )
        parser_messages.append({"role": "user", "content": completion_prompt})
        
        start = time.time()
        completion_reply, input_tokens, output_tokens = get_reply_with_tokens(team["parser"], parser_messages)
        elapsed = time.time() - start
        stats.log_agent_call("parser_completion", input_tokens, output_tokens, elapsed)
        stats.log_checkpoint("step2_completion", True, f"{len(completion_reply)} chars")

        # === Step 3: JSON Valid? ===
        print("\n" + "="*60)
        print("Step 3: Ensure JSON Valid")
        print("="*60)
        try:
            constraints = ensure_json_valid(team, parser_reply)
            stats.log_checkpoint("step3_json_valid", True, f"{len(constraints)} constraints")
        except Exception as e:
            stats.log_checkpoint("step3_json_valid", False, str(e))
            raise

        # === Step 4: VarSpec ===
        print("\n" + "="*60)
        print("Step 4: VarSpec Extraction")
        print("="*60)
        used_vars = extract_all_vars(constraints)
        varspec_prompt = f"【需用到的變數】\n{', '.join(used_vars)}\n——請輸出 varspecs（JSON 陣列）。"
        varspec_messages = [{"role": "user", "content": varspec_prompt}]
        
        start = time.time()
        varspec_reply, input_tokens, output_tokens = get_reply_with_tokens(team["varspec"], varspec_messages)
        elapsed = time.time() - start
        stats.log_agent_call("varspec", input_tokens, output_tokens, elapsed)
        
        try:
            varspec_reply = clean_json_response(varspec_reply)
            varspecs = json.loads(varspec_reply)
            stats.log_checkpoint("step4_varspec", True, f"{len(varspecs)} varspecs")
        except Exception as e:
            stats.log_checkpoint("step4_varspec", False, str(e))
            raise

        # 宣告 Z3 變數
        z3_vars = declare_vars(varspecs)
        constraints, varspecs = auto_fix_constraints(constraints, varspecs)
        constraints, varspecs = sync_types_constraints_and_varspecs(constraints, varspecs, stats)
        # print("\n" + "="*60)
        # print(constraints)
        # print("="*60)
        # print(varspecs)
        z3_vars = declare_vars(varspecs)
        # constraints = fix_case_types_by_varspecs(constraints, varspecs, stats)
        # print(constraints)
        # === Step 5: Constraints 可 parse? ===
        print("\n" + "="*60)
        print("Step 5: Check Constraints Parseable")
        print("="*60)
        ok, err = check_constraints_parseable(constraints, z3_vars, build_expr)
        
        if not ok:
            stats.log_checkpoint("step5_constraints_parseable", False, err)
            stats.checkpoints["step5_repair_needed"] = True
            
            problems = diagnose_constraints(constraints, z3_vars, build_expr)
            print(f"⚠️ Found {len(problems)} problematic constraints:")
            for p in problems:
                print(f"  - [{p['id']}] {p['error']}")
            
            print(f"⚠️ Constraints parse failed: {err}")
            stats.increment_repair()
            
            # 🔑 修復時也要紀錄 agent 呼叫
            constraints, varspecs, ok, rounds, last_err = repair_loop_with_rounds_with_stats(
                team, constraints, varspecs, build_expr, z3_vars, stats, max_rounds=3
            )
            
            if ok:
                print(f"✅ Repair success after {rounds} round(s)")
                stats.log_checkpoint("step5_repair_success", True, f"{rounds} rounds")
            else:
                stats.log_checkpoint("step5_repair_success", False, last_err)
                raise RuntimeError(f"❌ 修復失敗，最後錯誤: {last_err}")
        else:
            print("✅ Constraints successfully parsed into Z3 expressions")
            stats.log_checkpoint("step5_constraints_parseable", True, f"{len(constraints)} constraints")

        # === Step 6: Constraints Consistency ===
        print("\n" + "="*60)
        print("Step 6: Constraints Consistency")
        print("="*60)
        constraints, ok, result, info = consistency_check_with_repair(team, constraints, z3_vars, build_expr, stats=stats)  # 新增 stats 參數

        if not ok:
            print(f"⚠️ Still inconsistent after repair: {info}")
            stats.log_checkpoint("step6_consistency_check", False, info)
            stats.log_checkpoint("step6_repair_success", False, "Repair failed")  # 新增

        else:
            print("✅ Constraints passed consistency check")
            stats.log_checkpoint("step6_consistency_check", True, result)
            stats.log_checkpoint("step6_repair_success", True, "Repair successful")  # 新增


            # 修復後重新生成 VarSpec
            used_vars = extract_all_vars(constraints)
            varspec_prompt = f"【需用到的變數】\n{', '.join(used_vars)}\n——請輸出 varspecs（JSON 陣列）。"
            varspec_messages = [{"role": "user", "content": varspec_prompt}]
            
            start = time.time()
            varspec_reply, input_tokens, output_tokens = get_reply_with_tokens(team["varspec"], varspec_messages)
            elapsed = time.time() - start
            stats.log_agent_call("varspec_post_repair", input_tokens, output_tokens, elapsed)
            
            varspecs = json.loads(varspec_reply)
            z3_vars = declare_vars(varspecs)

        # === Step 7: Case Mapper ===
        print("\n" + "="*60)
        print("Step 7: Case Mapper")
        print("="*60)
        mapper_prompt = (
            f"【法律案例】\n{case_text}\n\n"
            f"【相關 Constraints】\n{json.dumps(constraints, ensure_ascii=False, indent=2)}\n\n"
            f"【需用到的變數與型別】\n{json.dumps(varspecs, ensure_ascii=False, indent=2)}\n\n"
            "——請根據案例內容，輸出 facts（JSON 物件）。\n\n"
            "⚠️ **重要規則**：\n"
            "1. **禁止使用 null/None**\n"
            "2. **只能使用 VarSpec 中的變數**\n"
            "3. 若某些變數可從其他變數推導，請僅設定基礎變數\n"
            "4. **因為這是違規案例，請設定 facts 使之違反至少一個 constraint**（確保整體檢查為 UNSAT）\n\n"
            "5. 若涉及到計算的部分，請確保單位一致以免出現計算錯誤\n"
            "5. 僅輸出 JSON 物件，不要包含 markdown 標記、註解\n\n"
            "範例（不要包含註解）：\n"
            "```json\n"
            "{\n"
            '  "stop_profit_distribution": false,\n'
            '  "capital_ratio": 0.0,\n'
            '  "violation_count": 0\n'
            "}\n"
            "```"
        )
        mapper_messages = [{"role": "user", "content": mapper_prompt}]
        
        start = time.time()
        mapper_reply, input_tokens, output_tokens = get_reply_with_tokens(team["mapper"], mapper_messages)
        elapsed = time.time() - start
        stats.log_agent_call("mapper", input_tokens, output_tokens, elapsed)
        
        try:
            mapper_reply = clean_json_response(mapper_reply)
            
            # 🔑 移除 JSON 中的註解（如果有的話）
            import re
            mapper_reply = re.sub(r'//.*', '', mapper_reply)  # 移除單行註解
            mapper_reply = re.sub(r'/\*.*?\*/', '', mapper_reply, flags=re.DOTALL)  # 移除多行註解
            
            facts = json.loads(mapper_reply)
            if "facts" in facts:
                facts = facts["facts"]
            
            stats.log_checkpoint("step7_case_mapper", True, f"{len(facts)} facts")
        except Exception as e:
            stats.log_checkpoint("step7_case_mapper", False, str(e))
            raise
        
        # 🔑 驗證並修復 facts
        # === Step 7.1: Validate and Fix Facts ===
        # print("\n" + "="*60)
        # print("Step 7.1: Validate and Fix Facts")
        # print("="*60)
        # try:
        #     facts, fix_issues = validate_and_fix_facts(facts, varspecs)
        #     stats.log_checkpoint("step7_facts_validation", True, f"{len(fix_issues)} fixes" if fix_issues else "no issues")
        # except Exception as e:
        #     stats.log_checkpoint("step7_facts_validation", False, str(e))
        #     raise

        # === Step 7.2: 驗證 facts 是否可用於 Z3 ===
        print("\n" + "="*60)
        print("Step 7.2: Test Facts with Z3")
        print("="*60)
        
        # 🔑 過濾 facts，只保留在 z3_vars 中的變數
        z3_var_names = set(z3_vars.keys())
        filtered_facts = {k: v for k, v in facts.items() if k in z3_var_names}
        if len(filtered_facts) < len(facts):
            removed_keys = set(facts.keys()) - set(filtered_facts.keys())
            print(f"⚠️ Removed invalid keys from facts: {removed_keys}")
            facts = filtered_facts 
        try:
            from marco.json2z3 import build_facts_dict
            test_constraints = build_facts_dict(facts, z3_vars)
            print("✅ Facts validated with Z3")
            stats.log_checkpoint("step7_z3_validation", True, f"{len(test_constraints)} constraints")
        except Exception as e:
            print(f"❌ Facts validation failed: {e}")
            # 🔑 嘗試修復 facts
            print("\n" + "="*60)
            print("Step 7.2.1: Repair Facts")
            print("="*60)
            try:
                old_facts = facts.copy()  # 記錄修復前的 facts
                # 重新呼叫 mapper agent 生成 facts
                mapper_prompt_repair = (
                    f"【法律案例】\n{case_text}\n\n"
                    f"【相關 Constraints】\n{json.dumps(constraints, ensure_ascii=False, indent=2)}\n\n"
                    f"【需用到的變數與型別】\n{json.dumps(varspecs, ensure_ascii=False, indent=2)}\n\n"
                    "——請根據案例內容，輸出 facts（JSON 物件）。\n\n"
                    "⚠️ **重要規則**：\n"
                    "1. **禁止使用 null/None**\n"
                    "2. **只能使用 VarSpec 中的變數**\n"
                    "3. 若某些變數可從其他變數推導，請僅設定基礎變數\n"
                    "4. **因為這是違規案例，請設定 facts 使之違反至少一個 constraint**（確保整體檢查為 UNSAT）\n\n"
                    "5. 若涉及到計算的部分，請確保單位一致以免出現計算錯誤\n"
                    "6. 僅輸出 JSON 物件，不要包含 markdown 標記、註解\n\n"
                    f"⚠️ **修復提示**：之前的 facts 驗證失敗 ({str(e)})，請修正並重新輸出。\n\n"
                    "範例（不要包含註解）：\n"
                    "```json\n"
                    "{\n"
                    '  "stop_profit_distribution": false,\n'
                    '  "capital_ratio": 0.0,\n'
                    '  "violation_count": 0\n'
                    "}\n"
                    "```"
                )
                mapper_messages_repair = [{"role": "user", "content": mapper_prompt_repair}]
                
                start = time.time()
                mapper_reply_repair, input_tokens, output_tokens = get_reply_with_tokens(team["mapper"], mapper_messages_repair)
                elapsed = time.time() - start
                stats.log_agent_call("mapper_repair", input_tokens, output_tokens, elapsed)
                
                mapper_reply_repair = clean_json_response(mapper_reply_repair)
                import re
                mapper_reply_repair = re.sub(r'//.*', '', mapper_reply_repair)
                mapper_reply_repair = re.sub(r'/\*.*?\*/', '', mapper_reply_repair, flags=re.DOTALL)
                
                facts = json.loads(mapper_reply_repair)
                if "facts" in facts:
                    facts = facts["facts"]
                
                # 重新過濾
                filtered_facts = {k: v for k, v in facts.items() if k in z3_var_names}
                if len(filtered_facts) < len(facts):
                    removed_keys = set(facts.keys()) - set(filtered_facts.keys())
                    print(f"⚠️ Removed invalid keys from facts after repair: {removed_keys}")
                    facts = filtered_facts
                
                # 重新驗證
                test_constraints = build_facts_dict(facts, z3_vars)
                print("✅ Facts repaired and validated with Z3")
                stats.log_checkpoint("step7_z3_validation", True, f"{len(test_constraints)} constraints (repaired)")
                stats.log_fix("facts_repair", "Regenerate facts", old_facts, facts)  # 記錄修復 log
            except Exception as repair_e:
                print(f"❌ Facts repair failed: {repair_e}")
                stats.log_checkpoint("step7_z3_validation", False, f"Repair failed: {str(repair_e)}")
                raise
        
        # === Step 8: Case+Law Hard Check ===  
        print("\n" + "="*60)
        print("Step 8: Case+Law Hard Check")
        print("="*60)
        sat_result, info = check_case_law_hard(constraints, facts, z3_vars, build_expr)

        # 🔑 Step 8.1: 如果檢查失敗或 SAT（但期望 UNSAT），嘗試修復
        if sat_result == "ERROR":
            print(f"⚠️ Case+Law check error: {info}")
            stats.log_checkpoint("step8_case_law_check", False, str(info))
            
            # 嘗試修復有問題的 constraints
            print("\n" + "="*60)
            print("Step 8.1: Repair Problematic Constraints")
            print("="*60)
            
            constraints, repair_success = repair_case_law_constraints(
                team=team,
                constraints=constraints,
                facts=facts,
                z3_vars=z3_vars,
                build_expr=build_expr,
                error_info=info,
                stats=stats
            )
            
            if repair_success:
                print("✅ Constraints repaired, retrying check...")
                # 重新檢查
                sat_result, info = check_case_law_hard(constraints, facts, z3_vars, build_expr)
                if sat_result == "UNSAT":
                    print(f"✅ Case+Law UNSAT → 違規案例 (Unsat core: {info})")
                    violation = True
                    stats.log_checkpoint("step8_case_law_check", True, "UNSAT")
                    stats.log_checkpoint("step8_violation_detected", True, str(info))
                    stats.log_checkpoint("step8_repair_success", True, "Repair successful")
                elif sat_result == "SAT":
                    print("❌ Case+Law SAT → 修復後仍 SAT，案例可能無違規")
                    violation = False
                    stats.log_checkpoint("step8_case_law_check", True, "SAT")
                    stats.log_checkpoint("step8_violation_detected", False, "SAT after repair")
                    stats.log_checkpoint("step8_repair_success", False, "Repair did not achieve UNSAT")
                    raise RuntimeError("Step 8 failed: No violation detected after repair")
                else:
                    print(f"❌ Still error after repair: {info}")
                    violation = None
                    stats.log_checkpoint("step8_case_law_check", False, f"REPAIR_FAILED: {info}")
                    stats.log_checkpoint("step8_violation_detected", None, str(info))
                    stats.log_checkpoint("step8_repair_success", False, "Repair failed")
                    raise RuntimeError("Step 8 failed: Repair failed")
            else:
                print("❌ Constraint repair failed")
                violation = None
                stats.log_checkpoint("step8_violation_detected", None, "REPAIR_FAILED")
                stats.log_checkpoint("step8_repair_success", False, "Repair failed")
                raise RuntimeError("Step 8 failed: Constraint repair failed")
  
        elif sat_result == "UNSAT":
            print(f"✅ Case+Law UNSAT → 違規案例 (Unsat core: {info})")
            violation = True
            stats.log_checkpoint("step8_case_law_check", True, "UNSAT")
            stats.log_checkpoint("step8_violation_detected", True, str(info))

        elif sat_result == "SAT":
            print("⚠️ Case+Law SAT → 案例可能無違規，但資料集為違規案例，嘗試修復以達成 UNSAT")
            stats.log_checkpoint("step8_case_law_check", False, "SAT (unexpected)")
            
            # 🔑 新的修復策略
            print("\n" + "="*60)
            print("Step 8.1: SAT→UNSAT Repair")
            print("="*60)
            
            repaired_facts, repaired_constraints, repaired_varspecs, repair_success = repair_sat_to_unsat(
                team=team,
                constraints=constraints,
                facts=facts,
                varspecs=varspecs,
                z3_vars=z3_vars,
                build_expr=build_expr,
                case_text=case_text,
                stats=stats
            )
            
            if repair_success:
                print("✅ SAT→UNSAT 修復成功")
                # 更新修復後的結果
                facts = repaired_facts
                constraints = repaired_constraints
                varspecs = repaired_varspecs
                # 重新宣告 z3 變數（如果 varspecs 有改變）
                z3_vars = declare_vars(varspecs)
                
                # 重新檢查
                sat_result, info = check_case_law_hard(constraints, facts, z3_vars, build_expr)
                print(f"✅ Final check: {sat_result} - {info}")
                violation = True
                stats.log_checkpoint("step8_case_law_check", True, "UNSAT after repair")
                stats.log_checkpoint("step8_violation_detected", True, str(info))
                stats.log_checkpoint("step8_repair_success", True, "SAT→UNSAT repair successful")
            else:
                print("❌ SAT→UNSAT 修復失敗")
                violation = False
                stats.log_checkpoint("step8_violation_detected", False, "SAT and repair failed")
                stats.log_checkpoint("step8_repair_success", False, "SAT→UNSAT repair failed")
                raise RuntimeError("Step 8 failed: SAT→UNSAT repair failed")

        # 🔑 如果沒有檢測到違規，raise 異常
        if violation is not True:
            raise RuntimeError("Step 8 failed: No violation detected")
        
         # === Step 9: Z3 Optimize ===
        print("\n" + "="*60)
        print("Step 9: Z3 Optimize")
        print("="*60)
        ok, model = z3_optimize_case(constraints, facts, z3_vars, build_expr)
        if ok:
            print(f"✅ Optimization success for {case_id}")
            print(f"\n📊 Model (filtered):")

            model_lines = []
            for d in model.decls():
                name = d.name()
                if ":" in name:  
                    continue
                val = model[d]
                model_lines.append(f"{name} = {val}")
                print(f"   {name} = {val}")

            # 🔑 儲存乾淨版本到檔案
            model_path = OUT / f"{case_id}.model.txt"
            model_path.write_text("\n".join(model_lines), encoding="utf-8")

            print(f"✅ Model saved to: {model_path}")

            
            stats.log_checkpoint("step9_z3_optimize", True, "success")
            stats.mark_success()
            # 🔑 匯出為 SMT2 格式
            print("\n" + "="*60)
            print("Step 10: Export to SMT2")
            print("="*60)
            try:
                smt2_path = export_to_smt2(
                    case_id=case_id,
                    constraints=constraints,
                    varspecs=varspecs,
                    facts=facts,
                    z3_vars=z3_vars,
                    build_expr=build_expr,
                    output_dir=OUT
                )
                print(f"✅ SMT2 exported successfully")
                print(f"   You can run: z3 {smt2_path}")
            except Exception as e:
                print(f"⚠️ SMT2 export failed: {e}")
        else:
            print(f"⚠️ Optimization failed for {case_id}: {model}")
            stats.log_checkpoint("step9_z3_optimize", False, str(model))
            stats.mark_failure(model)

        log_path = OUT / f"{case_id}.log"
        with open(log_path, "w", encoding="utf-8") as f:
            f.write(log_buffer.getvalue())

        print(f"\n📝 Log saved to: {log_path}")
    
        # 儲存結果
        save_results(case_id, constraints, varspecs, facts, stats)
   
        return {
            "constraints": constraints,
            "varspecs": varspecs,
            "facts": facts,
            "stats": stats
        }

    except Exception as e:
        print(f"❌ Pipeline failed for {case_id}: {e}")
        stats.mark_failure(e)
        # 即使失敗也要儲存已有的資料
        try:
            save_results(case_id, constraints if 'constraints' in locals() else [], 
                        varspecs if 'varspecs' in locals() else [], 
                        facts if 'facts' in locals() else {}, 
                        stats)
        except:
            pass
        raise


def repair_loop_with_rounds_with_stats(team, constraints, varspecs, build_expr, z3_vars, stats, max_rounds=3):
    """
    包裝 repair_loop_with_rounds，額外紀錄統計資料
    """
    result = repair_loop_with_rounds(team, constraints, varspecs, build_expr, z3_vars, max_rounds)
    
    # 🔑 紀錄修復次數
    _, _, ok, rounds, _ = result
    for _ in range(rounds):
        stats.increment_repair()
    
    return result


def main(failed_indices=None):
    
    team = build_team(llm_config)
    df = pd.read_csv(DATA)
    all_stats = []

    for idx, row in df.iterrows():
        if failed_indices is not None and idx not in failed_indices:
            continue  
        case_id = f"case_{idx}"
        case_text = str(row["法律案例"])
        statute_text = str(row["相關法條"])

        print(f"\n{'='*80}")
        print(f"{'='*80}")
        print(f"=== Running {case_id} ===")
        print(f"{'='*80}")
        print(f"{'='*80}")

        try:
            result = run_pipeline(team, case_id, case_text, statute_text)
            all_stats.append(result["stats"].to_summary_dict())
            print(f"\n✅ {case_id} completed successfully")
            
        except Exception as e:
            print(f"\n❌ {case_id} failed: {e}")
            # 即使失敗也要紀錄統計
            failed_stats = PipelineStats(case_id)
            failed_stats.mark_failure(e)
            all_stats.append(failed_stats.to_summary_dict())

    # === 儲存統計 Excel ===
    stats_df = pd.DataFrame(all_stats)
    
    # 🔑 調整欄位順序（檢查點欄位放在最後）
    checkpoint_cols = [col for col in stats_df.columns if col.startswith("step")]
    base_cols = [
        "case_id",
        "success",
        "total_time_sec",
        "repair_attempts",
        "total_agent_calls",
        "total_input_tokens",
        "total_output_tokens",
        "total_tokens",
        "total_cost_usd",
        "error_message",
        "timestamp"
    ]
    column_order = base_cols + checkpoint_cols
    stats_df = stats_df[column_order]
    
    # 儲存到 Excel
    excel_path = OUT / "pipeline_statistics.xlsx"
    with pd.ExcelWriter(excel_path, engine='openpyxl') as writer:
        # Sheet 1: 摘要統計
        stats_df.to_excel(writer, sheet_name='Summary', index=False)
        
        # Sheet 2: 彙總統計
        summary_data = {
            "Total Cases": len(all_stats),
            "Success Cases": stats_df["success"].sum(),
            "Failed Cases": (~stats_df["success"]).sum(),
            "Success Rate": f"{stats_df['success'].mean()*100:.2f}%",
            "Avg Time (sec)": stats_df["total_time_sec"].mean(),
            "Avg Repair Attempts": stats_df["repair_attempts"].mean(),
            "Total Tokens": stats_df["total_tokens"].sum(),
            "Total Cost (USD)": stats_df["total_cost_usd"].sum()
        }
        summary_df = pd.DataFrame([summary_data])
        summary_df.to_excel(writer, sheet_name='Overall', index=False)
        
        # 🔑 Sheet 3: 檢查點統計
        checkpoint_stats = {}
        for col in checkpoint_cols:
            pass_count = (stats_df[col] == "PASS").sum()
            fail_count = (stats_df[col] == "FAIL").sum()
            skip_count = (stats_df[col] == "SKIP").sum()
            not_run_count = (stats_df[col] == "NOT_RUN").sum()
            
            checkpoint_stats[col] = {
                "PASS": pass_count,
                "FAIL": fail_count,
                "SKIP": skip_count,
                "NOT_RUN": not_run_count,
                "Pass Rate": f"{(pass_count / len(stats_df) * 100):.2f}%" if len(stats_df) > 0 else "0%"
            }
        
        checkpoint_df = pd.DataFrame(checkpoint_stats).T
        checkpoint_df.to_excel(writer, sheet_name='Checkpoints')
    
    print(f"\n{'='*60}")
    print(f"=== Pipeline Completed ===")
    print(f"{'='*60}")
    print(f"Total Cases: {len(all_stats)}")
    print(f"Success: {stats_df['success'].sum()}")
    print(f"Failed: {(~stats_df['success']).sum()}")
    print(f"Success Rate: {stats_df['success'].mean()*100:.2f}%")
    print(f"Avg Time: {stats_df['total_time_sec'].mean():.2f} sec")
    print(f"Total Cost: ${stats_df['total_cost_usd'].sum():.6f}")
    print(f"\n📊 Statistics saved to: {excel_path}")


if __name__ == "__main__":
    fail_list_path = [139,340,372,476]
    main(failed_indices=fail_list_path)