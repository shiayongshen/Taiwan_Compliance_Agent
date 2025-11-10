"""
analyze_llm_flips.py

分析 LLM 修改的翻轉數（Flips）
比較 LLM 修改後的值與原始 facts 的差異

支援格式: CSV 或 Excel (.xlsx, .xls)

使用方式:
    python analyze_llm_flips.py <file_path> [data_dir] [output_dir] [sheet_name]

例子:
    # CSV 檔案
    python analyze_llm_flips.py outputs_RQ3_llm_correction/experiment_results.csv outputs outputs_RQ3_llm_correction
    
    # Excel 檔案（自動偵測 'result' sheet）
    python analyze_llm_flips.py outputs_RQ3_llm_correction/rq3_llm_correction_results_20251101_164127.xlsx outputs outputs_RQ3_llm_correction
    
    # Excel 檔案（指定 sheet 名稱）
    python analyze_llm_flips.py outputs_RQ3_llm_correction/rq3_llm_correction_results_20251101_164127.xlsx outputs outputs_RQ3_llm_correction result
"""

import json
import pandas as pd
from pathlib import Path
import sys

# Optional SMT computation imports (if z3 & project utils are available)
try:
    from marco.json2z3 import declare_vars, build_expr
    from utils import z3_optimize_case, calculate_min_flips
except Exception:
    declare_vars = None
    build_expr = None
    z3_optimize_case = None
    calculate_min_flips = None

def parse_llm_modifications(llm_modifications_str):
    """
    將 LLM modifications 字符串解析為字典
    """
    if pd.isna(llm_modifications_str):
        return {}
    
    if isinstance(llm_modifications_str, dict):
        return llm_modifications_str
    
    if isinstance(llm_modifications_str, str):
        try:
            return json.loads(llm_modifications_str)
        except:
            try:
                return eval(llm_modifications_str)
            except:
                return {}
    
    return {}


def load_original_facts(case_id, data_dir="outputs"):
    """
    載入原始的 facts
    """
    facts_file = Path(data_dir) / f"{case_id}.facts.json"
    
    try:
        with open(facts_file, "r", encoding="utf-8") as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"Cannot find facts file: {facts_file}")
        return {}


def calculate_llm_flips(case_id, llm_modifications_str, data_dir="outputs"):
    """
    計算 LLM 翻轉的變數數量
    """
    original_facts = load_original_facts(case_id, data_dir)
    llm_modifications = parse_llm_modifications(llm_modifications_str)

    if not original_facts or not llm_modifications:
        return {
            'llm_flips': 0,
            'llm_modified_count': len(llm_modifications) if llm_modifications else 0,
            'flipped_count_in_modified': 0,
            'flip_rate_on_modified': 0,
            'flip_rate_on_all': 0,
            'total_facts': len(original_facts),
            'flipped_details': []
        }

    flipped = []

    for var_name, modified_value in llm_modifications.items():
        if var_name in original_facts:
            original_value = original_facts[var_name]

            if modified_value != original_value:
                flipped.append({
                    'variable': var_name,
                    'original': original_value,
                    'modified': modified_value
                })

    total_facts = len(original_facts)
    llm_modified_count = len([v for v in llm_modifications.keys() if v in original_facts])
    flipped_count = len(flipped)

    flip_rate_on_modified = (flipped_count / llm_modified_count * 100) if llm_modified_count > 0 else 0
    flip_rate_on_all = (flipped_count / total_facts * 100) if total_facts > 0 else 0

    return {
        'llm_flips': flipped_count,
        'llm_modified_count': llm_modified_count,
        'flipped_count_in_modified': flipped_count,
        'flip_rate_on_modified': round(flip_rate_on_modified, 2),
        'flip_rate_on_all': round(flip_rate_on_all, 2),
        'total_facts': total_facts,
        'flipped_details': flipped
    }


def compute_smt_min_flips(case_id, data_dir="outputs"):
    """
    使用 Z3 Optimize 重新求解該案例
    """
    if declare_vars is None or z3_optimize_case is None or calculate_min_flips is None:
        return {'smt_flips': None, 'smt_flip_rate': None, 'total_facts': None}

    base = Path(data_dir)
    constraints_file = base / f"{case_id}.constraint_spec.json"
    varspecs_file = base / f"{case_id}.varspecs.json"
    facts_file = base / f"{case_id}.facts.json"

    try:
        with open(constraints_file, 'r', encoding='utf-8') as f:
            constraints = json.load(f)
        with open(varspecs_file, 'r', encoding='utf-8') as f:
            varspecs = json.load(f)
        with open(facts_file, 'r', encoding='utf-8') as f:
            facts = json.load(f)
    except Exception:
        return {'smt_flips': None, 'smt_flip_rate': None, 'total_facts': None}

    try:
        z3_vars = declare_vars(varspecs)
        ok, result = z3_optimize_case(constraints, facts, z3_vars, build_expr)
        if ok:
            flips_info = calculate_min_flips(result, facts, z3_vars)
            return {
                'smt_flips': flips_info.get('flipped_count', None) if isinstance(flips_info, dict) else None,
                'smt_flip_rate': flips_info.get('flip_rate', None) if isinstance(flips_info, dict) else None,
                'total_facts': flips_info.get('total_variables', len(facts)) if isinstance(flips_info, dict) else len(facts)
            }
        else:
            return {'smt_flips': None, 'smt_flip_rate': None, 'total_facts': len(facts)}
    except Exception:
        return {'smt_flips': None, 'smt_flip_rate': None, 'total_facts': len(facts)}


def analyze_csv(csv_path, data_dir="outputs", sheet_name=None):
    """
    分析 CSV 或 Excel 檔案，計算所有案例的 LLM flips
    """
    file_path = Path(csv_path)
    
    if file_path.suffix.lower() in ['.xlsx', '.xls']:
        if sheet_name is None:
            sheet_name = 'result'
        df = pd.read_excel(csv_path, sheet_name=sheet_name)
        print(f"Loading Excel: {csv_path} (Sheet: {sheet_name})")
    else:
        df = pd.read_csv(csv_path)
        print(f"Loading CSV: {csv_path}")
    
    print(f"Total cases: {len(df)}")
    
    df['llm_flips'] = 0
    df['llm_modified_count'] = 0
    df['total_facts'] = 0
    df['flip_rate_on_modified'] = 0.0
    df['flip_rate_on_all'] = 0.0
    df['flipped_details'] = None
    df['smt_flips'] = None
    df['smt_flip_rate'] = None
    
    for idx, row in df.iterrows():
        case_id = row['case_id']
        llm_modifications = row.get('llm_modifications', None)
        
        if pd.notna(llm_modifications):
            flips_info = calculate_llm_flips(case_id, llm_modifications, data_dir)

            df.at[idx, 'llm_flips'] = flips_info.get('llm_flips', 0)
            df.at[idx, 'llm_modified_count'] = flips_info.get('llm_modified_count', 0)
            df.at[idx, 'total_facts'] = flips_info.get('total_facts', 0)
            df.at[idx, 'flip_rate_on_modified'] = flips_info.get('flip_rate_on_modified', 0.0)
            df.at[idx, 'flip_rate_on_all'] = flips_info.get('flip_rate_on_all', 0.0)
            df.at[idx, 'flipped_details'] = json.dumps(flips_info.get('flipped_details', []), ensure_ascii=False)
            
            if (idx + 1) % 50 == 0:
                print(f"Processed {idx + 1}/{len(df)} cases")
    
    sat_idx = df[df['ground_truth_result'] == 'SAT'].index
    if len(sat_idx) > 0:
        print(f"\nComputing SMT-based min flips for {len(sat_idx)} SAT cases...")
        for i in sat_idx:
            case_id = df.at[i, 'case_id']
            smt_info = compute_smt_min_flips(case_id, data_dir)
            df.at[i, 'smt_flips'] = smt_info.get('smt_flips', None)
            df.at[i, 'smt_flip_rate'] = smt_info.get('smt_flip_rate', None)
            if pd.isna(df.at[i, 'total_facts']) or df.at[i, 'total_facts'] == 0:
                df.at[i, 'total_facts'] = smt_info.get('total_facts', None)
            if (i + 1) % 50 == 0:
                print(f"SMT processed row index {i}")
    
    print("Completed!")
    return df


def save_analysis_results(df, output_dir="outputs"):
    """
    保存分析結果到 Excel
    """
    output_path = Path(output_dir)
    output_path.mkdir(parents=True, exist_ok=True)
    
    csv_output = output_path / "llm_flips_analysis.csv"
    df.to_csv(csv_output, index=False, encoding='utf-8')
    print(f"Saved detailed results: {csv_output}")
    
    sat_cases = df[df['ground_truth_result'] == 'SAT']
    unsat_cases = df[df['ground_truth_result'] == 'UNSAT']
    
    excel_output = output_path / "llm_flips_analysis.xlsx"
    with pd.ExcelWriter(excel_output, engine='openpyxl') as writer:
        df.to_excel(writer, sheet_name='Details', index=False)
        
        if 'has_hard_constraint' in df.columns and len(sat_cases) > 0:
            grouped = sat_cases.groupby('has_hard_constraint')
            rows = []
            for key, g in grouped:
                rows.append({
                    'has_hard_constraint': key,
                    'count': len(g),
                    'avg_llm_flips': g['llm_flips'].mean(),
                    'avg_flip_rate_on_all': g['flip_rate_on_all'].mean(),
                    'avg_modified_vars': g['llm_modified_count'].mean(),
                    'avg_smt_flips': g['smt_flips'].dropna().mean() if 'smt_flips' in g.columns and g['smt_flips'].dropna().shape[0] > 0 else None,
                    'avg_smt_flip_rate': g['smt_flip_rate'].dropna().mean() if 'smt_flip_rate' in g.columns and g['smt_flip_rate'].dropna().shape[0] > 0 else None
                })
            byhc_df = pd.DataFrame(rows)
            byhc_df.to_excel(writer, sheet_name='By_HardConstraint', index=False)
    
    print(f"Saved Excel results: {excel_output}")
    
    print(f"\n{'='*60}")
    print(f"LLM Modifications Analysis Summary")
    print(f"{'='*60}")
    
    if 'has_hard_constraint' in df.columns:
        sat_cases = df[df['ground_truth_result'] == 'SAT']
        
        with_hc = sat_cases[sat_cases['has_hard_constraint'] == True]
        without_hc = sat_cases[sat_cases['has_hard_constraint'] == False]
        
        print(f"\n✅ WITH HARD CONSTRAINTS (LLM Analysis):")
        if len(with_hc) > 0:
            print(f"  案例數: {len(with_hc)}")
            print(f"  平均 LLM 翻轉變數數: {with_hc['llm_flips'].mean():.2f}")
            print(f"  平均 Modified 變數數: {with_hc['llm_modified_count'].mean():.2f}")
            print(f"  平均翻轉率: {with_hc['flip_rate_on_all'].mean():.2f}%")
            print(f"  最小翻轉率: {with_hc['flip_rate_on_all'].min():.2f}%")
            print(f"  最大翻轉率: {with_hc['flip_rate_on_all'].max():.2f}%")
            print(f"  中位數翻轉率: {with_hc['flip_rate_on_all'].median():.2f}%")
        
        print(f"\n🔲 WITHOUT HARD CONSTRAINTS (Baseline):")
        if len(without_hc) > 0:
            print(f"  案例數: {len(without_hc)}")
            print(f"  平均 LLM 翻轉變數數: {without_hc['llm_flips'].mean():.2f}")
            print(f"  平均變數數: {without_hc['llm_modified_count'].mean():.2f}")
            print(f"  平均翻轉率: {without_hc['flip_rate_on_all'].mean():.2f}%")
            print(f"  最小翻轉率: {without_hc['flip_rate_on_all'].min():.2f}%")
            print(f"  最大翻轉率: {without_hc['flip_rate_on_all'].max():.2f}%")
            print(f"  中位數翻轉率: {without_hc['flip_rate_on_all'].median():.2f}%")
        
        if len(with_hc) > 0 and len(without_hc) > 0:
            improvement = ((without_hc['flip_rate_on_all'].mean() - with_hc['flip_rate_on_all'].mean()) / without_hc['flip_rate_on_all'].mean() * 100)
            print(f"\n📈 改進效果:")
            print(f"  Baseline 翻轉率: {without_hc['flip_rate_on_all'].mean():.2f}%")
            print(f"  Fixed 翻轉率: {with_hc['flip_rate_on_all'].mean():.2f}%")
            print(f"  改進比例: {improvement:.2f}% ⬇️" if improvement > 0 else f"  改進比例: {improvement:.2f}%")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    
    file_path = sys.argv[1]
    data_dir = sys.argv[2] if len(sys.argv) > 2 else "outputs"
    output_dir = sys.argv[3] if len(sys.argv) > 3 else Path(file_path).parent
    sheet_name = sys.argv[4] if len(sys.argv) > 4 else None
    
    df_analyzed = analyze_csv(file_path, data_dir, sheet_name)
    save_analysis_results(df_analyzed, output_dir)
