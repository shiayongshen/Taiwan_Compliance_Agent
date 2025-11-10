"""
分析已存在的 fixed constraint 案例的翻轉率
"""
import json
import pandas as pd
from pathlib import Path
from datetime import datetime
import time

from marco.json2z3 import declare_vars, build_expr
from utils import z3_optimize_case, calculate_min_flips


def load_existing_results(excel_path):
    """讀取現有的 Excel 結果"""
    df = pd.read_excel(excel_path)
    
    # 篩選有 fixed constraints 的案例（hard_constraint_count > 0）
    with_fixed = df[df["hard_constraint_count"] > 0].copy()
    
    print(f"📊 讀取結果統計:")
    print(f"  總案例數: {len(df)}")
    print(f"  有 fixed 的案例: {len(with_fixed)}")
    print(f"  SAT 的案例: {(df['sat_result'] == 'SAT').sum()}")
    print(f"  有 fixed 的 SAT 案例: {((with_fixed['sat_result'] == 'SAT')).sum()}")
    
    return with_fixed


def extract_case_id(case_id_str):
    """從 case_id 字符串提取編號"""
    return int(case_id_str.replace("case_", ""))


def recompute_flips_for_case(row, data_dir="outputs"):
    """
    重新計算單個案例的翻轉率
    """
    case_id = row["case_id"]
    case_idx = extract_case_id(case_id)
    
    # 載入案例數據
    data_path = Path(data_dir)
    
    constraints_file = data_path / f"{case_id}.constraint_spec.json"
    varspecs_file = data_path / f"{case_id}.varspecs.json"
    facts_file = data_path / f"{case_id}.facts.json"
    
    try:
        with open(constraints_file, "r", encoding="utf-8") as f:
            constraints = json.load(f)
        
        with open(varspecs_file, "r", encoding="utf-8") as f:
            varspecs = json.load(f)
        
        with open(facts_file, "r", encoding="utf-8") as f:
            facts = json.load(f)
        
    except FileNotFoundError as e:
        print(f"❌ 無法載入 {case_id}: {e}")
        return None
    
    # 從 Excel 中提取 hard_constraint_keys
    try:
        hard_constraint_keys = json.loads(row["hard_constraint_keys"])
    except:
        hard_constraint_keys = []
    
    if not hard_constraint_keys:
        return None
    
    # 建立 hard constraints
    hard_constraints_list = []
    for key in hard_constraint_keys:
        value = facts[key]
        hard_constraint_spec = {
            "id": f"hard_constraint_from_fact_{key}",
            "desc": f"Fixed from fact: {key} = {value}",
            "expr": ["EQ", ["VAR", key], value],
            "weight": 1,
            "domain": "experiment"
        }
        hard_constraints_list.append(hard_constraint_spec)
    
    # 合併 constraints
    modified_constraints = constraints + hard_constraints_list
    
    # 建立 modified_facts（排除 fixed 的）
    modified_facts = {k: v for k, v in facts.items() if k not in hard_constraint_keys}
    
    # 宣告 Z3 變數
    z3_vars = declare_vars(varspecs)
    
    # 執行 Z3 求解
    start = time.time()
    is_sat, result = z3_optimize_case(modified_constraints, modified_facts, z3_vars, build_expr)
    elapsed_time = time.time() - start
    
    if not is_sat:
        return None
    
    # 計算翻轉
    flips_info = calculate_min_flips(result, modified_facts, z3_vars)
    
    # 計算 non-fixed 翻轉率
    flipped_non_fixed = flips_info['flipped_count']
    non_fixed_vars_count = len(modified_facts)
    
    if non_fixed_vars_count > 0:
        non_fixed_flip_rate = round((flipped_non_fixed / non_fixed_vars_count) * 100, 2)
    else:
        non_fixed_flip_rate = 0
    
    return {
        "case_id": case_id,
        "fixed_vars_count": len(hard_constraint_keys),
        "non_fixed_vars_count": non_fixed_vars_count,
        "flipped_non_fixed_count": flipped_non_fixed,
        "non_fixed_flip_rate": non_fixed_flip_rate,
        "elapsed_time": elapsed_time,
        "flipped_variables": [f['variable'] for f in flips_info['flipped_variables']]
    }


def main(excel_path, data_dir="outputs", output_file=None):
    """
    主函數：分析已存在的 fixed constraint 案例
    """
    print(f"\n{'='*60}")
    print(f"🔍 分析已存在的 Fixed Constraint 案例")
    print(f"{'='*60}")
    print(f"讀取: {excel_path}\n")
    
    # 讀取現有結果
    with_fixed = load_existing_results(excel_path)
    
    # 篩選 SAT 的案例
    with_fixed_sat = with_fixed[with_fixed["sat_result"] == "SAT"].copy()
    
    print(f"\n📈 開始計算翻轉率...\n")
    
    # 重新計算翻轉率
    results = []
    for idx, (_, row) in enumerate(with_fixed_sat.iterrows(), 1):
        case_id = row["case_id"]
        print(f"[{idx}/{len(with_fixed_sat)}] 處理 {case_id}...")
        
        flip_result = recompute_flips_for_case(row, data_dir)
        
        if flip_result:
            results.append(flip_result)
            print(f"  ✓ Fixed: {flip_result['fixed_vars_count']}, "
                  f"Non-Fixed: {flip_result['non_fixed_vars_count']}, "
                  f"Flipped: {flip_result['flipped_non_fixed_count']}, "
                  f"Flip Rate: {flip_result['non_fixed_flip_rate']}%")
        else:
            print(f"  ✗ 計算失敗")
    
    if not results:
        print("❌ 沒有有效的結果")
        return None
    
    # 轉換為 DataFrame
    results_df = pd.DataFrame(results)
    
    # 計算統計
    print(f"\n{'='*60}")
    print(f"📊 統計結果")
    print(f"{'='*60}")
    print(f"成功計算案例數: {len(results_df)}")
    print(f"平均 Fixed 變數數: {results_df['fixed_vars_count'].mean():.2f}")
    print(f"平均 Non-Fixed 變數數: {results_df['non_fixed_vars_count'].mean():.2f}")
    print(f"平均翻轉 Non-Fixed 變數數: {results_df['flipped_non_fixed_count'].mean():.2f}")
    print(f"平均 Non-Fixed 翻轉率: {results_df['non_fixed_flip_rate'].mean():.2f}%")
    print(f"最小翻轉率: {results_df['non_fixed_flip_rate'].min():.2f}%")
    print(f"最大翻轉率: {results_df['non_fixed_flip_rate'].max():.2f}%")
    print(f"中位數翻轉率: {results_df['non_fixed_flip_rate'].median():.2f}%")
    
    # 保存結果
    if output_file is None:
        output_file = f"fixed_cases_flip_analysis_{datetime.now().strftime('%Y%m%d_%H%M%S')}.xlsx"
    
    output_path = Path("outputs_RQ3") / output_file
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    with pd.ExcelWriter(output_path, engine='openpyxl') as writer:
        # Sheet 1: 詳細結果
        results_df.to_excel(writer, sheet_name='Results', index=False)
        
        # Sheet 2: 統計摘要
        summary_data = {
            "Metric": [
                "Total Cases with Fixed Constraints (SAT)",
                "Avg Fixed Variables",
                "Avg Non-Fixed Variables",
                "Avg Flipped Non-Fixed Variables",
                "Avg Non-Fixed Flip Rate (%)",
                "Min Flip Rate (%)",
                "Max Flip Rate (%)",
                "Median Flip Rate (%)",
                "Std Dev Flip Rate (%)"
            ],
            "Value": [
                len(results_df),
                f"{results_df['fixed_vars_count'].mean():.2f}",
                f"{results_df['non_fixed_vars_count'].mean():.2f}",
                f"{results_df['flipped_non_fixed_count'].mean():.2f}",
                f"{results_df['non_fixed_flip_rate'].mean():.2f}",
                f"{results_df['non_fixed_flip_rate'].min():.2f}",
                f"{results_df['non_fixed_flip_rate'].max():.2f}",
                f"{results_df['non_fixed_flip_rate'].median():.2f}",
                f"{results_df['non_fixed_flip_rate'].std():.2f}"
            ]
        }
        summary_df = pd.DataFrame(summary_data)
        summary_df.to_excel(writer, sheet_name='Summary', index=False)
    
    print(f"\n💾 結果已保存至: {output_path}\n")
    
    return results_df, output_path


if __name__ == "__main__":
    excel_path = "outputs_RQ3/experiment_results_20251101_155651.xlsx"
    
    results_df, output_path = main(
        excel_path=excel_path,
        data_dir="outputs",
        output_file=None
    )
