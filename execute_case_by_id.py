import json
import z3
import pandas as pd
from pathlib import Path
import statistics
from marco.json2z3 import declare_vars, build_expr

DATA = Path("dataset/updated_processed_cases.csv")

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

def compare_values(initial, suggested):
    """
    比較初始值和建議值，處理數值、Bool 和分數
    """
    # 將 Z3 值轉為 Python 值
    if suggested.sort() == z3.BoolSort():
        sugg_val = z3.is_true(suggested)
    elif suggested.sort() == z3.IntSort():
        sugg_val = suggested.as_long()
    elif suggested.sort() == z3.RealSort():
        sugg_val = float(suggested.numerator_as_long()) / float(suggested.denominator_as_long())
    else:
        sugg_val = str(suggested)
    
    if isinstance(initial, bool) and isinstance(sugg_val, bool):
        return initial == sugg_val
    elif isinstance(initial, (int, float)) and isinstance(sugg_val, (int, float)):
        return abs(float(initial) - float(sugg_val)) < 1e-6
    else:
        return str(initial).lower() == str(sugg_val).lower()  # 忽略大小寫

def get_changes_for_case(case_id):
    base_path = f"/Users/vincenthsia/compliance_case_automatic/outputs/case_{case_id}"
    
    try:
        # Load JSON files
        with open(f"{base_path}.varspecs.json", 'r', encoding='utf-8') as f:
            varspecs = json.load(f)
        with open(f"{base_path}.facts.json", 'r', encoding='utf-8') as f:
            facts = json.load(f)
        with open(f"{base_path}.constraint_spec.json", 'r', encoding='utf-8') as f:
            constraints = json.load(f)
        
        # Declare variables
        z3_vars = declare_vars(varspecs)
        
        # Optimize
        ok, result = z3_optimize_case(constraints, facts, z3_vars, build_expr)
        
        if ok:
            model = result
            changes = []
            for var_name in z3_vars:
                suggested = model[z3_vars[var_name]]
                if suggested is not None and var_name in facts:
                    if not compare_values(facts[var_name], suggested):
                        changes.append((var_name, facts[var_name], suggested))
            return changes
        else:
            return None  # No solution
    except Exception as e:
        print(f"Error for case_{case_id}: {e}")
        return None

def main():
    df = pd.read_csv(DATA)
    total_cases = len(df)
    results = []
    
    for idx in range(total_cases):
        case_id = f"{idx}"
        changes = get_changes_for_case(case_id)
        if changes is not None:
            num_changes = len(changes)
            changed_vars = [var for var, _, _ in changes]
            results.append({
                "case_id": case_id,
                "num_changes": num_changes,
                "changed_vars": "; ".join(changed_vars) if changed_vars else "None"
            })
        else:
            results.append({
                "case_id": case_id,
                "num_changes": "Error/No Solution",
                "changed_vars": "N/A"
            })
    
    # 統計
    valid_results = [r for r in results if isinstance(r["num_changes"], int)]
    if valid_results:
        changes_list = [r["num_changes"] for r in valid_results]
        avg_changes = sum(changes_list) / len(changes_list)
        std_dev = statistics.stdev(changes_list) if len(changes_list) > 1 else 0
        max_changes = max(changes_list)
        min_changes = min(changes_list)
        total_changes = sum(changes_list)
        
        # 分布
        count_changes = {}
        for num in changes_list:
            count_changes[num] = count_changes.get(num, 0) + 1
        distribution_df = pd.DataFrame(list(count_changes.items()), columns=['num_changes', 'count']).sort_values('num_changes')
    else:
        avg_changes = 0
        std_dev = 0
        max_changes = 0
        min_changes = 0
        total_changes = 0
        distribution_df = pd.DataFrame(columns=['num_changes', 'count'])
    
    summary = {
        "total_cases": total_cases,
        "valid_cases": len(valid_results),
        "avg_changes": avg_changes,
        "std_dev_changes": std_dev,
        "max_changes": max_changes,
        "min_changes": min_changes,
        "total_changes": total_changes
    }
    
    # 存成 Excel
    results_df = pd.DataFrame(results)
    summary_df = pd.DataFrame([summary])
    
    output_path = Path("outputs/changes_statistics.xlsx")
    with pd.ExcelWriter(output_path, engine='openpyxl') as writer:
        results_df.to_excel(writer, sheet_name='Details', index=False)
        summary_df.to_excel(writer, sheet_name='Summary', index=False)
        distribution_df.to_excel(writer, sheet_name='Distribution', index=False)
    
    print(f"Statistics saved to {output_path}")
    print(f"Average changes: {avg_changes:.2f}")
    print(f"Standard deviation: {std_dev:.2f}")
    print(f"Total valid cases: {len(valid_results)}")

if __name__ == "__main__":
    main()