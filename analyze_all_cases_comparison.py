"""
分析所有案例的翻轉率對比：有 fixed constraint vs 沒有 fixed constraint
"""
import json
import pandas as pd
from pathlib import Path
from datetime import datetime
import time

from marco.json2z3 import declare_vars, build_expr
from utils import z3_optimize_case, calculate_min_flips


def extract_case_id(case_id_str):
    """從 case_id 字符串提取編號"""
    return int(case_id_str.replace("case_", ""))


def compute_flips_for_case_with_fixed(case_id, hard_constraint_keys, data_dir="outputs"):
    """
    計算有 fixed constraint 的案例翻轉率
    """
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
        return None
    
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
        "type": "with_fixed",
        "fixed_vars_count": len(hard_constraint_keys),
        "non_fixed_vars_count": non_fixed_vars_count,
        "flipped_count": flipped_non_fixed,
        "flip_rate": non_fixed_flip_rate,
        "elapsed_time": elapsed_time
    }


def compute_flips_for_case_without_fixed(case_id, data_dir="outputs"):
    """
    計算沒有 fixed constraint 的案例翻轉率（baseline）
    """
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
        return None
    
    # 宣告 Z3 變數
    z3_vars = declare_vars(varspecs)
    
    # 執行 Z3 求解（沒有 fixed constraints）
    start = time.time()
    is_sat, result = z3_optimize_case(constraints, facts, z3_vars, build_expr)
    elapsed_time = time.time() - start
    
    if not is_sat:
        return None
    
    # 計算翻轉
    flips_info = calculate_min_flips(result, facts, z3_vars)
    
    flipped_count = flips_info['flipped_count']
    total_vars_count = len(facts)
    
    if total_vars_count > 0:
        flip_rate = round((flipped_count / total_vars_count) * 100, 2)
    else:
        flip_rate = 0
    
    return {
        "case_id": case_id,
        "type": "without_fixed",
        "fixed_vars_count": 0,
        "non_fixed_vars_count": total_vars_count,
        "flipped_count": flipped_count,
        "flip_rate": flip_rate,
        "elapsed_time": elapsed_time
    }


def get_all_cases_from_outputs(data_dir="outputs"):
    """
    從 outputs 目錄中取得所有案例 ID
    """
    data_path = Path(data_dir)
    constraint_files = list(data_path.glob("case_*.constraint_spec.json"))
    case_ids = sorted([
        f"case_{f.name.replace('case_', '').replace('.constraint_spec.json', '')}"
        for f in constraint_files
    ])
    return case_ids


def get_fixed_cases(excel_path):
    """
    從 Excel 中取得所有被 fixed 的案例 ID
    """
    df = pd.read_excel(excel_path)
    # 取得所有出現在 Excel 中的案例（不管是否 SAT）
    fixed_case_ids = set(df["case_id"].unique())
    return fixed_case_ids


def main(excel_path, data_dir="outputs", output_file=None):
    """
    主函數：分析所有案例的翻轉率對比
    """
    print(f"\n{'='*60}")
    print(f"🔍 分析所有案例的翻轉率對比")
    print(f"{'='*60}")
    print(f"讀取 Excel: {excel_path}")
    print(f"讀取 JSON: {data_dir}\n")
    
    # 讀取現有結果
    df = pd.read_excel(excel_path)
    
    # 篩選 SAT 的案例
    sat_df = df[df["sat_result"] == "SAT"].copy()
    
    # 從 outputs 取得所有可用案例
    all_available_cases = get_all_cases_from_outputs(data_dir)
    
    # 從 Excel 取得所有被 fixed 的案例（239 筆）
    fixed_cases = get_fixed_cases(excel_path)
    
    # Baseline 案例：所有未被 fixed 的案例（240 筆）+ 排除 case_324
    baseline_cases = sorted([c for c in all_available_cases if c not in fixed_cases and c != "case_324"])
    
    print(f"📊 數據統計:")
    print(f"  outputs 總案例數: {len(all_available_cases)}")
    print(f"  被 fixed 的案例數（Excel）: {len(fixed_cases)}")
    print(f"  這些 fixed 案例中 SAT 的: {len(sat_df)}")
    print(f"  Baseline 案例數（未被 fixed 且非 case_324）: {len(baseline_cases)}")
    print(f"\n📈 開始計算翻轉率...\n")
    
    all_results = []
    
    # 計算有 fixed constraints 的案例（只計算 SAT 的）
    print("▶ 計算有 FIXED CONSTRAINTS 的案例 (SAT only):")
    with_fixed_count = 0
    for idx, (_, row) in enumerate(sat_df.iterrows(), 1):
        case_id = row["case_id"]
        
        try:
            hard_constraint_keys = json.loads(row["hard_constraint_keys"])
        except:
            hard_constraint_keys = []
        
        if not hard_constraint_keys:
            continue
        
        print(f"  [{with_fixed_count + 1}] 處理 {case_id}...", end=" ")
        
        result = compute_flips_for_case_with_fixed(case_id, hard_constraint_keys, data_dir)
        
        if result:
            all_results.append(result)
            with_fixed_count += 1
            print(f"✓ Fixed: {result['fixed_vars_count']}, "
                  f"Flip Rate: {result['flip_rate']}%")
        else:
            print("✗ 失敗")
    
    print(f"\n  成功: {with_fixed_count}\n")
    
    # 計算沒有 fixed constraints 的案例（Baseline）
    print(f"▶ 計算沒有 FIXED CONSTRAINTS 的案例 (Baseline):")
    without_fixed_count = 0
    
    print(f"  未被 fixed 的案例數: {len(baseline_cases)}\n")
    
    for idx, case_id in enumerate(baseline_cases, 1):
        print(f"  [{idx}/{len(baseline_cases)}] 處理 {case_id}...", end=" ")
        
        result = compute_flips_for_case_without_fixed(case_id, data_dir)
        
        if result:
            all_results.append(result)
            without_fixed_count += 1
            print(f"✓ Flip Rate: {result['flip_rate']}%")
        else:
            print("✗ 失敗")
    
    print(f"\n  成功: {without_fixed_count}\n")
    
    if not all_results:
        print("❌ 沒有有效的結果")
        return None
    
    # 轉換為 DataFrame
    results_df = pd.DataFrame(all_results)
    
    # 分組統計
    with_fixed_df = results_df[results_df["type"] == "with_fixed"]
    without_fixed_df = results_df[results_df["type"] == "without_fixed"]
    
    # 計算統計
    print(f"{'='*60}")
    print(f"📊 統計結果對比")
    print(f"{'='*60}")
    
    print(f"\n✅ WITH FIXED CONSTRAINTS:")
    print(f"  案例數: {len(with_fixed_df)}")
    if len(with_fixed_df) > 0:
        print(f"  平均 Fixed 變數數: {with_fixed_df['fixed_vars_count'].mean():.2f}")
        print(f"  平均 Non-Fixed 變數數: {with_fixed_df['non_fixed_vars_count'].mean():.2f}")
        print(f"  平均翻轉變數數: {with_fixed_df['flipped_count'].mean():.2f}")
        print(f"  平均翻轉率: {with_fixed_df['flip_rate'].mean():.2f}%")
        print(f"  最小翻轉率: {with_fixed_df['flip_rate'].min():.2f}%")
        print(f"  最大翻轉率: {with_fixed_df['flip_rate'].max():.2f}%")
        print(f"  中位數翻轉率: {with_fixed_df['flip_rate'].median():.2f}%")
    
    print(f"\n🔲 WITHOUT FIXED CONSTRAINTS (Baseline):")
    print(f"  案例數: {len(without_fixed_df)}")
    if len(without_fixed_df) > 0:
        print(f"  平均變數數: {without_fixed_df['non_fixed_vars_count'].mean():.2f}")
        print(f"  平均翻轉變數數: {without_fixed_df['flipped_count'].mean():.2f}")
        print(f"  平均翻轉率: {without_fixed_df['flip_rate'].mean():.2f}%")
        print(f"  最小翻轉率: {without_fixed_df['flip_rate'].min():.2f}%")
        print(f"  最大翻轉率: {without_fixed_df['flip_rate'].max():.2f}%")
        print(f"  中位數翻轉率: {without_fixed_df['flip_rate'].median():.2f}%")
    
    # 計算改進比例
    if len(with_fixed_df) > 0 and len(without_fixed_df) > 0:
        avg_with_fixed = with_fixed_df['flip_rate'].mean()
        avg_without_fixed = without_fixed_df['flip_rate'].mean()
        improvement = ((avg_without_fixed - avg_with_fixed) / avg_without_fixed * 100) if avg_without_fixed > 0 else 0
        
        print(f"\n📈 改進效果:")
        print(f"  Baseline 翻轉率: {avg_without_fixed:.2f}%")
        print(f"  Fixed 翻轉率: {avg_with_fixed:.2f}%")
        print(f"  改進比例: {improvement:.2f}% ⬇️" if improvement > 0 else f"  改進比例: {improvement:.2f}%")
    
    # 保存結果
    if output_file is None:
        output_file = f"all_cases_comparison_{datetime.now().strftime('%Y%m%d_%H%M%S')}.xlsx"
    
    output_path = Path("outputs_RQ3") / output_file
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    with pd.ExcelWriter(output_path, engine='openpyxl') as writer:
        # Sheet 1: 詳細結果
        results_df.to_excel(writer, sheet_name='Results', index=False)
        
        # Sheet 2: 統計摘要
        summary_data = {
            "Category": [
                "WITH Fixed Constraints",
                "WITHOUT Fixed Constraints (Baseline)",
                "",
                "Improvement"
            ],
            "Cases": [
                len(with_fixed_df),
                len(without_fixed_df),
                "",
                ""
            ],
            "Avg Flip Rate (%)": [
                f"{with_fixed_df['flip_rate'].mean():.2f}" if len(with_fixed_df) > 0 else "N/A",
                f"{without_fixed_df['flip_rate'].mean():.2f}" if len(without_fixed_df) > 0 else "N/A",
                "",
                f"{improvement:.2f}%" if (len(with_fixed_df) > 0 and len(without_fixed_df) > 0) else "N/A"
            ],
            "Avg Flipped Variables": [
                f"{with_fixed_df['flipped_count'].mean():.2f}" if len(with_fixed_df) > 0 else "N/A",
                f"{without_fixed_df['flipped_count'].mean():.2f}" if len(without_fixed_df) > 0 else "N/A",
                "",
                ""
            ],
            "Avg Total Variables": [
                f"{with_fixed_df['non_fixed_vars_count'].mean():.2f}" if len(with_fixed_df) > 0 else "N/A",
                f"{without_fixed_df['non_fixed_vars_count'].mean():.2f}" if len(without_fixed_df) > 0 else "N/A",
                "",
                ""
            ]
        }
        summary_df = pd.DataFrame(summary_data)
        summary_df.to_excel(writer, sheet_name='Summary', index=False)
        
        # Sheet 3: WITH Fixed 的詳細統計
        if len(with_fixed_df) > 0:
            with_fixed_stats = {
                "Metric": [
                    "Total Cases",
                    "Avg Fixed Variables",
                    "Avg Non-Fixed Variables",
                    "Avg Flipped Variables",
                    "Avg Flip Rate (%)",
                    "Min Flip Rate (%)",
                    "Max Flip Rate (%)",
                    "Median Flip Rate (%)",
                    "Std Dev Flip Rate (%)"
                ],
                "Value": [
                    len(with_fixed_df),
                    f"{with_fixed_df['fixed_vars_count'].mean():.2f}",
                    f"{with_fixed_df['non_fixed_vars_count'].mean():.2f}",
                    f"{with_fixed_df['flipped_count'].mean():.2f}",
                    f"{with_fixed_df['flip_rate'].mean():.2f}",
                    f"{with_fixed_df['flip_rate'].min():.2f}",
                    f"{with_fixed_df['flip_rate'].max():.2f}",
                    f"{with_fixed_df['flip_rate'].median():.2f}",
                    f"{with_fixed_df['flip_rate'].std():.2f}"
                ]
            }
            with_fixed_stats_df = pd.DataFrame(with_fixed_stats)
            with_fixed_stats_df.to_excel(writer, sheet_name='WithFixed_Stats', index=False)
        
        # Sheet 4: WITHOUT Fixed 的詳細統計
        if len(without_fixed_df) > 0:
            without_fixed_stats = {
                "Metric": [
                    "Total Cases",
                    "Avg Total Variables",
                    "Avg Flipped Variables",
                    "Avg Flip Rate (%)",
                    "Min Flip Rate (%)",
                    "Max Flip Rate (%)",
                    "Median Flip Rate (%)",
                    "Std Dev Flip Rate (%)"
                ],
                "Value": [
                    len(without_fixed_df),
                    f"{without_fixed_df['non_fixed_vars_count'].mean():.2f}",
                    f"{without_fixed_df['flipped_count'].mean():.2f}",
                    f"{without_fixed_df['flip_rate'].mean():.2f}",
                    f"{without_fixed_df['flip_rate'].min():.2f}",
                    f"{without_fixed_df['flip_rate'].max():.2f}",
                    f"{without_fixed_df['flip_rate'].median():.2f}",
                    f"{without_fixed_df['flip_rate'].std():.2f}"
                ]
            }
            without_fixed_stats_df = pd.DataFrame(without_fixed_stats)
            without_fixed_stats_df.to_excel(writer, sheet_name='WithoutFixed_Stats', index=False)
    
    print(f"\n💾 結果已保存至: {output_path}\n")
    
    return results_df, output_path


if __name__ == "__main__":
    excel_path = "outputs_RQ3/experiment_results_20251101_155651.xlsx"
    
    results_df, output_path = main(
        excel_path=excel_path,
        data_dir="outputs",
        output_file=None
    )
