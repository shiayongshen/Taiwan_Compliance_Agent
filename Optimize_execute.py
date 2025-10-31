import json
import z3
import pandas as pd
from pathlib import Path
from marco.json2z3 import declare_vars, build_expr

def solve_case(constraint_spec, facts, varspecs):
    """
    使用 Z3 Optimize 求解最小合規解
    - constraint_spec: list of constraints (hard if weight > 0, soft if weight == 0)
    - facts: dict of initial facts (added as soft constraints)
    - varspecs: list of variable specifications
    
    返回: (initial_facts, suggested_model) 或 (None, None) 如果無解
    """
    try:
        # 聲明變量
        z3_vars = declare_vars(varspecs)
        
        # 創建 Optimize solver
        opt = z3.Optimize()
        
        # 添加 hard constraints (weight > 0)
        for c in constraint_spec:
            if c.get('weight', 0) > 0:
                expr = build_expr(c['expr'], z3_vars)
                tag = c.get('id', f"constraint_{constraint_spec.index(c)}")
                opt.assert_and_track(expr, tag)
        
        # 添加 soft constraints (weight == 0)
        for c in constraint_spec:
            if c.get('weight', 0) == 0:
                expr = build_expr(c['expr'], z3_vars)
                opt.add_soft(expr, weight=1, id=c.get('id', f"soft_{constraint_spec.index(c)}"))
        
        # 添加 facts as soft constraints
        for k, v in facts.items():
            fact_expr = build_expr(["EQ", ["VAR", k], v], z3_vars)
            opt.add_soft(fact_expr, weight=1, id=f"fact_{k}")
        
        # 求解
        result = opt.check()
        if result == z3.sat:
            model = opt.model()
            
            # 提取建議值
            suggested = {}
            for var_name in z3_vars:
                try:
                    sugg = model[z3_vars[var_name]]
                    if sugg is not None:
                        if sugg.sort() == z3.BoolSort():
                            suggested[var_name] = z3.is_true(sugg)
                        elif sugg.sort() == z3.IntSort():
                            suggested[var_name] = sugg.as_long()
                        elif sugg.sort() == z3.RealSort():
                            suggested[var_name] = float(sugg.numerator_as_long()) / float(sugg.denominator_as_long())
                        else:
                            suggested[var_name] = str(sugg)
                except:
                    # 如果無法獲取值，跳過
                    pass
            
            return facts, suggested
        else:
            return None, None
            
    except Exception as e:
        print(f"Error in solve_case: {e}")
        return None, None

def compare_values(initial, suggested):
    """
    比較初始值和建議值，處理數值、Bool 和分數
    """
    if isinstance(initial, bool) and isinstance(suggested, bool):
        return initial == suggested
    elif isinstance(initial, (int, float)) and isinstance(suggested, (int, float)):
        return abs(float(initial) - float(suggested)) < 1e-6
    else:
        return str(initial).lower() == str(suggested).lower()

def main():
    # 讀取 Excel 文件
    excel_path = Path("outputs/searchable_cases.xlsx")
    df = pd.read_excel(excel_path, sheet_name='Cases')
    
    results = []
    
    for idx, row in df.iterrows():
        case_id = row['case_id']
        case_name = row['case_name']
        statute = row['statute']
        
        try:
            # 解析 JSON 字符串 (去掉外層引號，如果有的話)
            constraint_spec_str = str(row['constraint_spec']).strip('"')
            facts_str = str(row['facts']).strip('"')
            varspecs_str = str(row['varspecs']).strip('"')
            
            constraint_spec = json.loads(constraint_spec_str)
            facts = json.loads(facts_str)
            varspecs = json.loads(varspecs_str)
            
            # 執行求解
            initial, suggested = solve_case(constraint_spec, facts, varspecs)
            
            if initial and suggested:
                # 調試：對於 case_0 打印詳細信息
                if case_id == 'case_0':
                    print("Debug for case_0:")
                    print("Initial facts:")
                    for k, v in initial.items():
                        print(f"  {k}: {v}")
                    print("Suggested model:")
                    for k, v in suggested.items():
                        print(f"  {k}: {v}")
                
                # 計算變化
                changes = []
                num_changes = 0
                for k in initial:
                    sugg_val = suggested.get(k, initial[k])
                    changes.append(f"{k}: {initial[k]} -> {sugg_val}")
                    if not compare_values(initial[k], sugg_val):
                        num_changes += 1
                
                changes_str = "; ".join(changes)
                
                results.append({
                    "case_id": case_id,
                    "case_name": case_name,
                    "statute": statute,
                    "num_changes": num_changes,
                    "changes": changes_str,
                    "status": "成功"
                })
            else:
                results.append({
                    "case_id": case_id,
                    "case_name": case_name,
                    "statute": statute,
                    "num_changes": "無解",
                    "changes": "N/A",
                    "status": "無解"
                })
        except Exception as e:
            results.append({
                "case_id": case_id,
                "case_name": case_name,
                "statute": statute,
                "num_changes": "錯誤",
                "changes": f"錯誤: {str(e)}",
                "status": "錯誤"
            })
    
    # 輸出結果到新 Excel
    results_df = pd.DataFrame(results)
    output_path = Path("outputs/solve_results.xlsx")
    with pd.ExcelWriter(output_path, engine='openpyxl') as writer:
        results_df.to_excel(writer, sheet_name='Results', index=False)
    
    print(f"處理完成，共 {len(results)} 個案例。結果保存到 {output_path}")
    
    # 打印摘要
    successful = len([r for r in results if r['status'] == '成功'])
    no_solution = len([r for r in results if r['status'] == '無解'])
    errors = len([r for r in results if r['status'] == '錯誤'])
    
    print(f"成功求解: {successful}")
    print(f"無解: {no_solution}")
    print(f"錯誤: {errors}")

if __name__ == "__main__":
    main()