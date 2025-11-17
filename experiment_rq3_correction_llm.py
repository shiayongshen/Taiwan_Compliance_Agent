"""
experiment_rq3_correction_llm.py

RQ3 Correction Reasoning with LLM experiment.

This experiment:
1. Takes 239 cases that have been augmented with hard constraints (randomly selected facts)
2. Among them, ~130 are UNSAT and ~109 are SAT
3. For each case, asks LLM to:
   - See case description + relevant statutes
   - See the hard constraints (frozen facts)
   - Suggest adjustments to OTHER facts to achieve compliance (PENALTY = false)
   - Or declare UNSAT if it thinks the problem is infeasible
4. Evaluates LLM's judgment against ground truth (SMT solver result)

Requires OpenAI API credentials in .env:
    OPENAI_API_KEY=...
    OPENAI_MODEL=gpt-4-mini (or your preferred model)

Usage:
    python experiment_rq3_correction_llm.py

"""

import json
import random
import time
from pathlib import Path
from datetime import datetime
import traceback
import re
import os

import pandas as pd

try:
    import z3
except Exception:
    z3 = None

try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass

try:
    from openai import OpenAI
except ImportError:
    OpenAI = None

from marco.json2z3 import declare_vars, build_expr


def load_rq3_ground_truth(output_dir="outputs_RQ3"):
    """
    Load pre-computed ground truth from RQ3 experiment results.
    Returns a dict mapping case_id -> "SAT" or "UNSAT"
    
    For cases NOT in RQ3 (original cases without augmented constraints),
    we assume they are SAT (since they've been verified to have solutions).
    """
    gt_dict = {}
    try:
        # Find the latest experiment results file
        output_path = Path(output_dir)
        excel_files = sorted(output_path.glob("experiment_results_*.xlsx"), reverse=True)
        
        if not excel_files:
            print(f"Warning: No experiment results found in {output_dir}")
            return gt_dict
        
        rq3_excel_path = excel_files[0]
        print(f"Loading ground truth from: {rq3_excel_path}")
        
        df = pd.read_excel(rq3_excel_path, sheet_name="Results")
        for _, row in df.iterrows():
            case_id = row["case_id"]
            result = row["sat_result"]
            gt_dict[case_id] = result
        print(f"Loaded {len(gt_dict)} ground truth results from {rq3_excel_path}")
        print(f"  SAT: {sum(1 for r in gt_dict.values() if r == 'SAT')}")
        print(f"  UNSAT: {sum(1 for r in gt_dict.values() if r == 'UNSAT')}")
    except Exception as e:
        print(f"Warning: Could not load RQ3 ground truth: {e}")
    return gt_dict


def get_ground_truth(case_id, rq3_ground_truth_dict):
    """
    Get ground truth for a case.
    If in RQ3 results, use that.
    Otherwise (original cases), assume SAT.
    
    Returns "SAT" or "UNSAT"
    """
    if case_id in rq3_ground_truth_dict:
        return rq3_ground_truth_dict[case_id]
    else:
        # Cases not in RQ3 are original cases without augmented constraints
        # They should be SAT (as verified in original data)
        return "SAT"


def load_case_data(case_id, data_dir="outputs", case_dataset_csv=None):
    """Load constraints, varspecs, facts for a case."""
    data_path = Path(data_dir)
    with open(data_path / f"{case_id}.constraint_spec.json", "r", encoding="utf-8") as f:
        constraints = json.load(f)
    with open(data_path / f"{case_id}.varspecs.json", "r", encoding="utf-8") as f:
        varspecs = json.load(f)
    with open(data_path / f"{case_id}.facts.json", "r", encoding="utf-8") as f:
        facts = json.load(f)
    
    # Load case description and related statutes from CSV if available
    case_desc = None
    related_statutes = None
    if case_dataset_csv is not None:
        try:
            case_num = int(case_id.split("_")[-1]) if "_" in case_id else int(case_id.replace("case_", ""))
            if case_num < len(case_dataset_csv):
                case_desc = case_dataset_csv.iloc[case_num]["法律案例"]
                related_statutes = case_dataset_csv.iloc[case_num]["相關法條"]
        except Exception:
            pass
    
    return constraints, varspecs, facts, case_desc, related_statutes




def test_smt_with_modified_facts(constraints, varspecs, facts_modified):
    """
    Test whether modified facts (suggested by LLM) satisfy all constraints using Z3 Solver.
    
    Uses SOLVER (not Optimizer) to fairly evaluate LLM's correction ability.
    LLM's suggested facts are added as HARD constraints, so if they don't satisfy
    the legal constraints, it will be UNSAT.
    
    Returns ("SAT", model) or ("UNSAT", core) or ("ERROR", error_msg)
    """
    if z3 is None:
        return ("ERROR", "z3 not available")
    
    try:
        z3_vars = declare_vars(varspecs)
    except Exception as e:
        return ("ERROR", f"Failed to declare vars: {e}")
    
    solver = z3.Solver()
    
    # Add all constraints as hard constraints (legal requirements)
    for i, c in enumerate(constraints):
        try:
            expr = c.get("expr") or c.get("expression")
            if expr is None:
                expr = c.get("constraint")
            z3_expr = build_expr(expr, z3_vars)
            solver.add(z3_expr)
        except Exception as e:
            return ("ERROR", f"Failed to build constraint {i}: {e}")
    
    # Add LLM-suggested facts as hard constraints
    # If LLM's suggestions don't satisfy the legal constraints, result will be UNSAT
    for k, v in facts_modified.items():
        try:
            fact_expr = build_expr(["EQ", ["VAR", k], v], z3_vars)
            solver.add(fact_expr)
        except Exception:
            continue
    
    try:
        res = solver.check()
        if res == z3.sat:
            try:
                m = solver.model()
                model_dict = {}
                for vname in z3_vars.keys():
                    try:
                        val = m.eval(z3_vars[vname], model_completion=True)
                        model_dict[vname] = str(val)
                    except Exception:
                        continue
                return ("SAT", model_dict)
            except Exception as e:
                return ("SAT", {"error": str(e)})
        elif res == z3.unsat:
            try:
                core = solver.unsat_core()
                core_ids = [c.decl().name() for c in core]
                return ("UNSAT", core_ids)
            except Exception:
                return ("UNSAT", None)
        else:
            return ("UNKNOWN", None)
    except Exception as e:
        return ("ERROR", str(e))
    finally:
        try:
            del solver
            import gc
            gc.collect()
        except Exception:
            pass


def build_llm_prompt(case_id, constraints, facts, hard_constraint_keys, case_desc=None, related_statutes=None):
    """Build a prompt for LLM to suggest corrections."""
    hard_cs = [c for c in constraints if c.get("type") == "hard"]
    soft_cs = [c for c in constraints if c.get("type") != "hard"]
    
    # 固定的 facts（不能修改）
    hard_facts = {k: facts[k] for k in hard_constraint_keys if k in facts}
    
    # 可修改的 facts（排除固定的和 penalty）
    modifiable_facts = {
        k: v for k, v in facts.items() 
        if k not in hard_constraint_keys and 'penalty' not in k.lower()
    }
    
    # Build case context section
    case_context = ""
    if case_desc:
        case_context += f"\n### 案例描述 (Case Description)\n{case_desc[:1000]}\n"
    if related_statutes:
        case_context += f"\n### 相關法條 (Applicable Laws)\n{related_statutes[:1000]}\n"
    
    prompt = f"""## 法律合規案例修正任務 (Case {case_id})

### 目標
根據以下法律約束和案例事實，提建議修改以達到「無罰款」(PENALTY=false) 的合規狀態。
{case_context}

### 可修改的案例事實 (Case Facts - You can modify these)
```json
{json.dumps(modifiable_facts, indent=2, ensure_ascii=False)}
```

### 已固定的限制條件 (HARD CONSTRAINTS - 無法修改)
以下變數已被固定，您無法修改這些變數的值：
{', '.join(hard_constraint_keys)}

對應的固定值為：
```json
{json.dumps(hard_facts, indent=2, ensure_ascii=False)}
```

### 法律約束 (Legal Constraints)

**硬性約束 (Hard Constraints - 必須滿足):**
{chr(10).join([f"  - {c.get('id', 'unnamed')}: {c.get('desc', c.get('name', ''))}" for c in hard_cs[:15]])}
（共 {len(hard_cs)} 條硬性約束）

### 您的任務

您可以修改上述「可修改的案例事實」中的任何變數，以達到合規。

請判斷：
1. 是否存在一組變數調整方案，使得系統滿足所有硬性約束並達到 PENALTY=false？
2. 如果存在，提出具體的調整建議（JSON 格式，只列出要修改的變數）。
3. 如果不存在，宣告為 UNSAT（無可行解）。

### 回應格式（只回應 JSON，不要有其他文字）

如果您認為可以找到合規解：
{{"judgment": "SAT", "modifications": {{"var_name_1": new_value_1, "var_name_2": new_value_2}}, "reasoning": "簡要說明"}}

如果無解：
{{"judgment": "UNSAT", "reasoning": "簡要說明為什麼無解"}}
"""
    return prompt


def call_llm_for_correction(prompt, model=None, api_key=None, temperature=0.3):
    """Call OpenAI API to get LLM response."""
    if OpenAI is None:
        return None, "OpenAI library not installed"
    
    if api_key is None:
        api_key = os.getenv("OPENAI_API_KEY")
    if model is None:
        model = os.getenv("OPENAI_MODEL", "gpt-4-mini")
    
    if not api_key:
        return None, "OPENAI_API_KEY not found in environment"
    
    try:
        client = OpenAI(api_key=api_key)
        response = client.chat.completions.create(
            model=model,
            messages=[
                {"role": "system", "content": "You are a legal compliance expert. Respond only with valid JSON, no other text."},
                {"role": "user", "content": prompt}
            ],
            temperature=temperature,
        )
        return response.choices[0].message.content, None
    except Exception as e:
        return None, f"OpenAI API error: {str(e)}"


def parse_llm_response(llm_text, debug=False):
    """Parse LLM response to extract judgment (SAT/UNSAT) and modifications."""
    if not llm_text:
        if debug:
            print(f"    [DEBUG] Empty LLM response")
        return ("ERROR", None, "Empty response")
    
    if debug:
        print(f"    [DEBUG] LLM raw response (first 500 chars): {llm_text[:500]}")
    
    # Try to parse as JSON multiple times with different strategies
    
    # Strategy 1: Try direct JSON parsing first
    try:
        data = json.loads(llm_text)
        judgment = data.get("judgment", "").upper()
        modifications = data.get("modifications", {}) if judgment == "SAT" else None
        reasoning = data.get("reasoning", "")
        
        if debug:
            print(f"    [DEBUG] Direct JSON parse succeeded. Judgment: {judgment}")
        
        if judgment in ("SAT", "UNSAT"):
            return (judgment, modifications, reasoning)
    except json.JSONDecodeError:
        if debug:
            print(f"    [DEBUG] Direct JSON parse failed, trying regex extraction...")
        pass
    
    # Strategy 2: Extract JSON using more robust regex
    # Find the start of JSON (first {) and work backwards from the end
    json_start = llm_text.find('{')
    if json_start != -1:
        # Try to find the matching closing brace
        brace_count = 0
        json_end = -1
        for i in range(json_start, len(llm_text)):
            if llm_text[i] == '{':
                brace_count += 1
            elif llm_text[i] == '}':
                brace_count -= 1
                if brace_count == 0:
                    json_end = i + 1
                    break
        
        if json_end > json_start:
            try:
                json_str = llm_text[json_start:json_end]
                if debug:
                    print(f"    [DEBUG] Extracted JSON (first 300 chars): {json_str[:300]}")
                data = json.loads(json_str)
                judgment = data.get("judgment", "").upper()
                modifications = data.get("modifications", {}) if judgment == "SAT" else None
                reasoning = data.get("reasoning", "")
                
                if debug:
                    print(f"    [DEBUG] Regex-based JSON parse succeeded. Judgment: {judgment}")
                
                if judgment in ("SAT", "UNSAT"):
                    return (judgment, modifications, reasoning)
                else:
                    if debug:
                        print(f"    [DEBUG] Invalid judgment value: {judgment}")
                    return ("ERROR", None, f"Invalid judgment: {judgment}")
            except json.JSONDecodeError as e:
                if debug:
                    print(f"    [DEBUG] Regex-based JSON parse failed: {e}")
                pass
    
    if debug:
        print(f"    [DEBUG] JSON parsing exhausted, trying keyword matching")
    
    # Strategy 3: Fallback to keyword matching
    if "unsat" in llm_text.lower():
        if debug:
            print(f"    [DEBUG] Found 'unsat' keyword")
        return ("UNSAT", None, llm_text[:300])
    elif "sat" in llm_text.lower():
        if debug:
            print(f"    [DEBUG] Found 'sat' keyword")
        return ("SAT", None, llm_text[:300])
    else:
        if debug:
            print(f"    [DEBUG] Could not parse response at all")
        return ("ERROR", None, f"Could not parse response: {llm_text[:300]}")


def run_case_experiment(case_id, hard_constraint_keys, data_dir="outputs", case_dataset_csv=None, rq3_ground_truth_dict=None):
    """Run the full experiment for one case with actual LLM call.
    
    Args:
        case_id: The case ID
        hard_constraint_keys: Set of hard constraint variable keys
        data_dir: Path to case data
        case_dataset_csv: Loaded CSV DataFrame with case descriptions
        rq3_ground_truth_dict: Dict mapping case_id -> "SAT"/"UNSAT" from RQ3 results
    """
    if rq3_ground_truth_dict is None:
        rq3_ground_truth_dict = {}
    
    result = {
        "case_id": case_id,
        "num_hard_constraint_facts": len(hard_constraint_keys),  # 記錄有多少個 facts 被固定
        "ground_truth_result": None,
        "ground_truth_model": None,
        "llm_judgment": None,
        "llm_modifications": None,
        "llm_response_raw": None,
        "llm_correctness": None,
        "llm_validation_result": None,
        "error": None,
        "elapsed_time_sec": None,
    }
    
    start_time = time.time()
    
    try:
        constraints, varspecs, facts, case_desc, related_statutes = load_case_data(case_id, data_dir, case_dataset_csv)
    except Exception as e:
        result["error"] = f"Failed to load case: {str(e)[:100]}"
        result["elapsed_time_sec"] = time.time() - start_time
        return result
    
    # Step 1: Get ground truth from RQ3 results (or assume SAT for original cases)
    truth_result = get_ground_truth(case_id, rq3_ground_truth_dict)
    result["ground_truth_result"] = truth_result
    
    # Step 2: Build LLM prompt
    try:
        prompt = build_llm_prompt(case_id, constraints, facts, hard_constraint_keys, case_desc, related_statutes)
    except Exception as e:
        result["error"] = f"Failed to build prompt: {str(e)[:100]}"
        result["elapsed_time_sec"] = time.time() - start_time
        return result
    
    # Step 3: Call LLM
    llm_response, llm_error = call_llm_for_correction(prompt)
    if llm_error:
        result["error"] = f"LLM call failed: {llm_error[:100]}"
        result["elapsed_time_sec"] = time.time() - start_time
        return result
    
    # Step 4: Parse LLM response (with debug output)
    llm_judgment, llm_mods, reasoning = parse_llm_response(llm_response, debug=True)
    result["llm_judgment"] = llm_judgment
    result["llm_modifications"] = llm_mods
    result["llm_response_raw"] = llm_response[:500]  # Store raw response for debugging
    
    # Step 5: Evaluate LLM correctness
    if llm_judgment == "SAT":
        if llm_mods and isinstance(llm_mods, dict):
            # Build the complete facts with:
            # - Fixed facts (hard_constraint_keys) kept as is
            # - Modifiable facts updated with LLM's suggestions
            facts_modified = dict(facts)  # Start with all original facts
            
            # Apply LLM's modifications (只改可修改的 facts)
            for k, v in llm_mods.items():
                if k not in hard_constraint_keys:  # Only allow modifications to non-fixed facts
                    facts_modified[k] = v
            
            # Validate with Solver
            val_result, _ = test_smt_with_modified_facts(constraints, varspecs, facts_modified)
            result["llm_validation_result"] = val_result
            result["llm_correctness"] = (val_result == "SAT") and (truth_result == "SAT")
        else:
            result["llm_correctness"] = (truth_result == "SAT")
    elif llm_judgment == "UNSAT":
        result["llm_correctness"] = (truth_result == "UNSAT")
    else:
        result["llm_correctness"] = False
    
    result["elapsed_time_sec"] = time.time() - start_time
    return result


def load_hard_constraints_from_log(output_dir="outputs_RQ3"):
    """Load hard constraint keys from the previous experiment output."""
    output_path = Path(output_dir)
    excel_files = sorted(list(output_path.glob("experiment_results_*.xlsx")), reverse=True)
    
    if not excel_files:
        print(f"Warning: No experiment results found in {output_dir}")
        return {}
    
    excel_file = excel_files[0]
    print(f"Loading hard constraints from: {excel_file}")
    
    df = pd.read_excel(excel_file, sheet_name="Results")
    hard_constraints_map = {}
    
    for _, row in df.iterrows():
        case_id = row["case_id"]
        
        # Try to get hard_constraint_keys column (新的欄位名)
        hard_cs_json = None
        if "hard_constraint_keys" in df.columns:
            hard_cs_json = row["hard_constraint_keys"]
        elif "hard_constraints" in df.columns:
            hard_cs_json = row["hard_constraints"]
        
        if hard_cs_json and pd.notna(hard_cs_json):
            try:
                # Parse JSON string
                if isinstance(hard_cs_json, str):
                    hard_cs_list = json.loads(hard_cs_json)
                else:
                    hard_cs_list = hard_cs_json
                
                # Extract keys from the list
                if isinstance(hard_cs_list, list):
                    hard_cs_keys = []
                    for item in hard_cs_list:
                        if isinstance(item, dict):
                            # If it's a dict with "key" or "var" field
                            if "key" in item:
                                hard_cs_keys.append(item["key"])
                            elif "var" in item:
                                hard_cs_keys.append(item["var"])
                        elif isinstance(item, str):
                            # If it's just a string
                            hard_cs_keys.append(item)
                    
                    if hard_cs_keys:
                        hard_constraints_map[case_id] = hard_cs_keys
                        print(f"  {case_id}: {len(hard_cs_keys)} hard constraints")
            except Exception as e:
                print(f"  Warning: Failed to parse hard constraints for {case_id}: {e}")
                hard_constraints_map[case_id] = []
        else:
            hard_constraints_map[case_id] = []
    
    print(f"Total cases with hard constraints: {sum(1 for v in hard_constraints_map.values() if v)}")
    return hard_constraints_map


# def main():
#     data_dir = "outputs"
#     output_dir_prev = "outputs_RQ3"
#     output_dir = "outputs_RQ3_llm_correction"
    
#     # Check if OpenAI is available
#     if OpenAI is None:
#         print("ERROR: OpenAI library not installed. Please install with: pip install openai")
#         return
    
#     api_key = os.getenv("OPENAI_API_KEY")
#     model = os.getenv("OPENAI_MODEL", "gpt-4-mini")
    
#     if not api_key:
#         print("ERROR: OPENAI_API_KEY not found in .env file")
#         return
    
#     print(f"Using model: {model}")
#     print(f"API Key: {api_key[:20]}...")
    
#     # Load RQ3 ground truth (pre-computed SMT results)
#     rq3_ground_truth = load_rq3_ground_truth(output_dir_prev)
#     print()
    
#     # Load case dataset CSV for case descriptions and statutes
#     try:
#         case_dataset_csv = pd.read_csv("dataset/updated_processed_cases.csv", encoding="utf-8")
#         print(f"Loaded case dataset with {len(case_dataset_csv)} rows")
#     except Exception as e:
#         print(f"Warning: Could not load case dataset CSV: {e}")
#         case_dataset_csv = None
    
#     # Load hard constraints from previous experiment
#     hard_constraints_map = load_hard_constraints_from_log(output_dir_prev)
    
#     if not hard_constraints_map:
#         print("Warning: No hard constraints found from previous experiment")
#         hard_constraints_map = {}
#     else:
#         print(f"Loaded {len(hard_constraints_map)} cases with hard constraints")
    
#     # Generate list of all cases to process
#     # Get all available cases from outputs directory
#     data_path = Path(data_dir)
#     all_cases = set()
#     for constraint_file in data_path.glob("*.constraint_spec.json"):
#         case_id = constraint_file.stem.replace(".constraint_spec", "")
#         all_cases.add(case_id)
    
#     all_cases = sorted(list(all_cases), key=lambda x: int(x.split("_")[-1]))
#     print(f"\nFound {len(all_cases)} total cases in {data_dir}")
    
#     results = []
#     for i, case_id in enumerate(all_cases, 1):
#         # Get hard constraints for this case if available
#         hard_keys = hard_constraints_map.get(case_id, [])
#         has_hard_constraint = len(hard_keys) > 0
        
#         print(f"[{i}/{len(all_cases)}] {case_id} (hard: {len(hard_keys)} keys, augmented: {has_hard_constraint})...", flush=True)
#         r = run_case_experiment(case_id, hard_keys, data_dir=data_dir, case_dataset_csv=case_dataset_csv, rq3_ground_truth_dict=rq3_ground_truth)
#         r["has_hard_constraint"] = has_hard_constraint
#         results.append(r)
        
#         # Print result summary
#         if r["ground_truth_result"] and r["llm_judgment"]:
#             match = "✓" if r["llm_correctness"] else "✗"
#             print(f"     Ground truth: {r['ground_truth_result']:5} | LLM: {r['llm_judgment']:5} | {match} ({r['elapsed_time_sec']:.2f}s)")
#         else:
#             print(f"     ERROR: {r.get('error', 'Unknown error')[:80]}")
    
#     # Save results to Excel
#     outdir = Path(output_dir)
#     outdir.mkdir(parents=True, exist_ok=True)
    
#     df = pd.DataFrame(results)
#     excel_path = outdir / f"rq3_llm_correction_results_{datetime.now().strftime('%Y%m%d_%H%M%S')}.xlsx"
    
#     with pd.ExcelWriter(excel_path, engine="openpyxl") as writer:
#         df.to_excel(writer, sheet_name="results", index=False)
        
#         # Add summary sheet
#         total = len(df)
#         augmented_count = (df["has_hard_constraint"] == True).sum()
#         original_count = total - augmented_count
        
#         truth_sat = (df["ground_truth_result"] == "SAT").sum()
#         truth_unsat = (df["ground_truth_result"] == "UNSAT").sum()
#         llm_sat = (df["llm_judgment"] == "SAT").sum()
#         llm_unsat = (df["llm_judgment"] == "UNSAT").sum()
#         llm_error = (df["llm_judgment"] == "ERROR").sum()
#         correct = df["llm_correctness"].sum()
        
#         summary = {
#             "Metric": [
#                 "Total Cases",
#                 "Augmented Cases (with hard constraints)",
#                 "Original Cases (no hard constraints)",
#                 "Ground Truth SAT",
#                 "Ground Truth UNSAT",
#                 "LLM SAT",
#                 "LLM UNSAT",
#                 "LLM ERROR",
#                 "LLM Correct Judgments",
#                 "Accuracy (%)"
#             ],
#             "Value": [
#                 total,
#                 augmented_count,
#                 original_count,
#                 truth_sat,
#                 truth_unsat,
#                 llm_sat,
#                 llm_unsat,
#                 llm_error,
#                 correct,
#                 f"{(correct / total * 100):.1f}%" if total > 0 else "N/A"
#             ]
#         }
#         summary_df = pd.DataFrame(summary)
#         summary_df.to_excel(writer, sheet_name="summary", index=False)
    
#     print(f"\n{'='*60}")
#     print(f"Results saved to: {excel_path}")
#     print(f"{'='*60}")
#     print(summary_df.to_string(index=False))


# if __name__ == "__main__":
#     main()

def main():
    data_dir = "outputs"
    output_dir_prev = "outputs_RQ3"
    output_dir = "outputs_RQ3_llm_correction"
    
    # Check if OpenAI is available
    if OpenAI is None:
        print("ERROR: OpenAI library not installed. Please install with: pip install openai")
        return
    
    api_key = os.getenv("OPENAI_API_KEY")
    model = os.getenv("OPENAI_MODEL", "gpt-4-mini")
    
    if not api_key:
        print("ERROR: OPENAI_API_KEY not found in .env file")
        return
    
    print(f"Using model: {model}")
    print(f"API Key: {api_key[:20]}...")
    
    # Load RQ3 ground truth (pre-computed SMT results)
    rq3_ground_truth = load_rq3_ground_truth(output_dir_prev)
    print()
    
    # Load case dataset CSV for case descriptions and statutes
    try:
        case_dataset_csv = pd.read_csv("dataset/updated_processed_cases.csv", encoding="utf-8")
        print(f"Loaded case dataset with {len(case_dataset_csv)} rows")
    except Exception as e:
        print(f"Warning: Could not load case dataset CSV: {e}")
        case_dataset_csv = None
    
    # Load hard constraints from previous experiment
    hard_constraints_map = load_hard_constraints_from_log(output_dir_prev)
    
    if not hard_constraints_map:
        print("Warning: No hard constraints found from previous experiment")
        hard_constraints_map = {}
    else:
        print(f"Loaded {len(hard_constraints_map)} cases with hard constraints")
    
    # 只處理 case_0 到 case_86
    all_cases = [f"case_{i}" for i in range(0, 87)]
    print(f"\nProcessing cases: case_0 to case_86 (total: {len(all_cases)} cases)")
    
    results = []
    for i, case_id in enumerate(all_cases, 1):
        # Get hard constraints for this case if available
        hard_keys = hard_constraints_map.get(case_id, [])
        has_hard_constraint = len(hard_keys) > 0
        
        print(f"[{i}/{len(all_cases)}] {case_id} (hard: {len(hard_keys)} keys, augmented: {has_hard_constraint})...", flush=True)
        r = run_case_experiment(case_id, hard_keys, data_dir=data_dir, case_dataset_csv=case_dataset_csv, rq3_ground_truth_dict=rq3_ground_truth)
        r["has_hard_constraint"] = has_hard_constraint
        results.append(r)
        
        # Print result summary
        if r["ground_truth_result"] and r["llm_judgment"]:
            match = "✓" if r["llm_correctness"] else "✗"
            print(f"     Ground truth: {r['ground_truth_result']:5} | LLM: {r['llm_judgment']:5} | {match} ({r['elapsed_time_sec']:.2f}s)")
        else:
            print(f"     ERROR: {r.get('error', 'Unknown error')[:80]}")
    
    # Save results to Excel
    outdir = Path(output_dir)
    outdir.mkdir(parents=True, exist_ok=True)
    
    df = pd.DataFrame(results)
    excel_path = outdir / f"rq3_llm_correction_results_{datetime.now().strftime('%Y%m%d_%H%M%S')}.xlsx"
    
    with pd.ExcelWriter(excel_path, engine="openpyxl") as writer:
        df.to_excel(writer, sheet_name="results", index=False)
        
        # Add summary sheet
        total = len(df)
        augmented_count = (df["has_hard_constraint"] == True).sum()
        original_count = total - augmented_count
        
        truth_sat = (df["ground_truth_result"] == "SAT").sum()
        truth_unsat = (df["ground_truth_result"] == "UNSAT").sum()
        llm_sat = (df["llm_judgment"] == "SAT").sum()
        llm_unsat = (df["llm_judgment"] == "UNSAT").sum()
        llm_error = (df["llm_judgment"] == "ERROR").sum()
        correct = df["llm_correctness"].sum()
        
        summary = {
            "Metric": [
                "Total Cases",
                "Augmented Cases (with hard constraints)",
                "Original Cases (no hard constraints)",
                "Ground Truth SAT",
                "Ground Truth UNSAT",
                "LLM SAT",
                "LLM UNSAT",
                "LLM ERROR",
                "LLM Correct Judgments",
                "Accuracy (%)"
            ],
            "Value": [
                total,
                augmented_count,
                original_count,
                truth_sat,
                truth_unsat,
                llm_sat,
                llm_unsat,
                llm_error,
                correct,
                f"{(correct / total * 100):.1f}%" if total > 0 else "N/A"
            ]
        }
        summary_df = pd.DataFrame(summary)
        summary_df.to_excel(writer, sheet_name="summary", index=False)
    
    print(f"\n{'='*60}")
    print(f"Results saved to: {excel_path}")
    print(f"{'='*60}")
    print(summary_df.to_string(index=False))


if __name__ == "__main__":
    main()