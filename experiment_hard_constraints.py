import json
import pandas as pd
import random
from pathlib import Path
from datetime import datetime
import time
from concurrent.futures import ThreadPoolExecutor, as_completed

from marco.json2z3 import declare_vars, build_expr
from utils import check_case_law_hard


class ExperimentConfig:
    """實驗配置"""
    def __init__(self, case_ratio=0.5, seed=42):
        self.case_ratio = case_ratio  # 選取案例比例
        self.seed = seed
        random.seed(seed)


class ExperimentStats:
    """記錄單次實驗結果"""
    def __init__(self, case_id, experiment_id):
        self.case_id = case_id
        self.experiment_id = experiment_id
        self.timestamp = datetime.now().isoformat()
        self.start_time = time.time()
        
        # 原始資料
        self.original_constraints_count = 0
        self.original_facts_count = 0
        
        # 選取資料
        self.selected_constraints_count = 0
        self.selected_constraints = []
        self.hard_constraints_from_facts = []
        self.hard_constraint_count = 0
        
        # 結果
        self.sat_result = None
        self.unsat_core = None
        self.error_message = None
        self.elapsed_time = 0
        self.success = False
    
    def to_dict(self):
        """轉換為字典"""
        return {
            "case_id": self.case_id,
            "experiment_id": self.experiment_id,
            "timestamp": self.timestamp,
            "original_constraints_count": self.original_constraints_count,
            "original_facts_count": self.original_facts_count,
            "selected_constraints_count": self.selected_constraints_count,
            "hard_constraint_count": self.hard_constraint_count,
            "sat_result": self.sat_result,
            "unsat_core": str(self.unsat_core) if self.unsat_core else None,
            "error_message": self.error_message,
            "elapsed_time_sec": round(self.elapsed_time, 3),
            "success": self.success,
            "selected_constraints": json.dumps(self.selected_constraints, ensure_ascii=False),
            "hard_constraints": json.dumps(self.hard_constraints_from_facts, ensure_ascii=False)
        }


def load_case_data(case_id, data_dir="outputs"):
    """載入單個案例的 constraints、varspecs、facts"""
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
        
        return constraints, varspecs, facts
    except FileNotFoundError as e:
        print(f"❌ Failed to load data for {case_id}: {e}")
        return None, None, None


def select_constraints_random(constraints, ratio=0.5):
    """隨機選取一部分 constraints"""
    if not constraints:
        return []
    
    count = max(1, int(len(constraints) * ratio))
    selected = random.sample(constraints, count)
    return selected


def extract_hard_constraints_from_facts(facts, varspecs, max_count=None, ratio=0.5):
    """
    從 facts 中隨機選取一半的元素作為 hard constraints（排除 penalty）
    
    Args:
        facts: 事實字典
        varspecs: 變數規範
        max_count: 最多選取多少個
        ratio: 選取比例（默認 0.5 = 50%）
    
    Returns:
        hard_constraints: 列表，格式為 [{"var": "name", "value": val, "constraint": "var == val"}, ...]
        selected_keys: 選中的鍵列表
    """
    if not facts:
        return [], []
    
    # 決定選取多少個 fact 元素（排除 penalty）
    fact_keys = [k for k in facts.keys() if 'penalty' not in k.lower()]
    if not fact_keys:
        return [], []
    
    # 隨機選取指定比例的 facts（默認 50%）
    count = max(1, int(len(fact_keys) * ratio))
    
    if max_count:
        count = min(count, max_count)
    
    selected_keys = random.sample(fact_keys, min(count, len(fact_keys)))
    
    hard_constraints = []
    for key in selected_keys:
        value = facts[key]
        hard_constraints.append({
            "var": key,
            "value": value,
            "constraint": f"{key} == {json.dumps(value)}"
        })
    
    return hard_constraints, selected_keys


def build_modified_constraints(original_constraints, hard_constraints_list):
    """
    將 hard constraints 轉換為 constraint spec 格式
    並合併到原始 constraints 中
    
    Args:
        original_constraints: 原始 constraints 列表
        hard_constraints_list: hard constraints 列表 (from extract_hard_constraints_from_facts)
    
    Returns:
        modified_constraints: 修改後的 constraints
    """
    modified_constraints = original_constraints.copy()
    
    for i, hc in enumerate(hard_constraints_list):
        # 創建新的 constraint spec，使用 Z3 expr 格式
        var_name = hc['var']
        value = hc['value']
        
        # 建立正確的 Z3 expr 格式: ["EQ", ["VAR", var_name], value]
        hard_constraint_spec = {
            "id": f"hard_constraint_{i}",
            "name": f"Hard Constraint from Fact: {var_name}",
            "type": "hard",
            "expr": ["EQ", ["VAR", var_name], value],
            "description": f"Value from fact: {var_name} = {value}"
        }
        modified_constraints.append(hard_constraint_spec)
    
    return modified_constraints


def run_experiment(case_id, config, data_dir="outputs"):
    """
    執行單個案例的實驗
    
    Returns:
        ExperimentStats: 實驗結果
    """
    stats = ExperimentStats(case_id, f"exp_{datetime.now().strftime('%Y%m%d_%H%M%S')}")
    
    try:
        # 載入資料
        constraints, varspecs, facts = load_case_data(case_id, data_dir)
        if constraints is None:
            stats.error_message = "Failed to load case data"
            return stats
        
        stats.original_constraints_count = len(constraints)
        stats.original_facts_count = len(facts)
        
        # 步驟 1: 隨機選取一半的 constraints
        selected_constraints = select_constraints_random(constraints, ratio=config.case_ratio)
        stats.selected_constraints = [c.get("id", f"constraint_{i}") for i, c in enumerate(selected_constraints)]
        stats.selected_constraints_count = len(selected_constraints)
        
        print(f"  ✓ Selected {len(selected_constraints)} constraints from {len(constraints)}")
        
        # 步驟 2: 從 facts 中提取 hard constraints（50% 且排除 penalty）
        hard_constraints_list, selected_fact_keys = extract_hard_constraints_from_facts(facts, varspecs, ratio=0.5)
        stats.hard_constraints_from_facts = hard_constraints_list
        stats.hard_constraint_count = len(hard_constraints_list)
        
        print(f"  ✓ Extracted {len(hard_constraints_list)} hard constraints from facts")
        print(f"    Selected fact keys: {selected_fact_keys}")
        
        # 步驟 3: 建立修改後的 facts（只包含非 hard constraint 的 facts）
        modified_facts = {k: v for k, v in facts.items() if k not in selected_fact_keys}
        
        # 步驟 4: 將 hard constraints 轉換為 constraint spec 格式並合併
        modified_constraints = build_modified_constraints(selected_constraints, hard_constraints_list)
        
        # 步驟 5: 宣告 Z3 變數
        z3_vars = declare_vars(varspecs)
        
        # 步驟 6: 執行 Z3 檢查
        # 注意：check_case_law_hard 會自動將 modified_facts 加入 constraints
        start = time.time()
        sat_result, info = check_case_law_hard(modified_constraints, modified_facts, z3_vars, build_expr)
        stats.elapsed_time = time.time() - start
        
        stats.sat_result = sat_result
        stats.unsat_core = info if sat_result == "UNSAT" else None
        stats.success = True
        
        print(f"  ✓ Z3 Check Result: {sat_result}")
        
    except Exception as e:
        stats.error_message = str(e)
        print(f"  ❌ Error: {e}")
    
    return stats


def run_experiment_batch(case_ids, config, data_dir="outputs", max_workers=4):
    """
    批量執行實驗
    
    Args:
        case_ids: 案例 ID 列表
        config: ExperimentConfig
        data_dir: 資料目錄
        max_workers: 最大併行數
    
    Returns:
        list: ExperimentStats 列表
    """
    all_stats = []
    
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = {
            executor.submit(run_experiment, case_id, config, data_dir): case_id
            for case_id in case_ids
        }
        
        for i, future in enumerate(as_completed(futures), 1):
            case_id = futures[future]
            try:
                print(f"\n[{i}/{len(case_ids)}] Processing {case_id}...")
                stats = future.result()
                all_stats.append(stats)
            except Exception as e:
                print(f"❌ Failed to process {case_id}: {e}")
                stats = ExperimentStats(case_id, f"exp_{datetime.now().strftime('%Y%m%d_%H%M%S')}")
                stats.error_message = str(e)
                all_stats.append(stats)
    
    return all_stats


def save_experiment_results(all_stats, output_dir="outputs"):
    """
    將實驗結果儲存為 Excel
    
    Args:
        all_stats: ExperimentStats 列表
        output_dir: 輸出目錄
    """
    output_path = Path(output_dir)
    output_path.mkdir(parents=True, exist_ok=True)
    
    # 轉換為 DataFrame
    data = [stats.to_dict() for stats in all_stats]
    df = pd.DataFrame(data)
    
    # 計算統計
    total_cases = len(df)
    success_cases = df["success"].sum()
    unsat_count = (df["sat_result"] == "UNSAT").sum()
    sat_count = (df["sat_result"] == "SAT").sum()
    error_count = (df["sat_result"].isna()).sum()
    
    # 儲存到 Excel
    excel_path = output_path / f"experiment_results_{datetime.now().strftime('%Y%m%d_%H%M%S')}.xlsx"
    
    with pd.ExcelWriter(excel_path, engine='openpyxl') as writer:
        # Sheet 1: 詳細結果
        df.to_excel(writer, sheet_name='Results', index=False)
        
        # Sheet 2: 統計摘要
        summary_data = {
            "Metric": [
                "Total Cases",
                "Successful Runs",
                "UNSAT Results",
                "SAT Results",
                "Errors",
                "UNSAT Rate (%)",
                "Avg Elapsed Time (sec)",
                "Avg Selected Constraints",
                "Avg Hard Constraints"
            ],
            "Value": [
                total_cases,
                success_cases,
                unsat_count,
                sat_count,
                error_count,
                f"{(unsat_count / success_cases * 100):.2f}" if success_cases > 0 else "N/A",
                f"{df[df['success']]['elapsed_time_sec'].mean():.3f}",
                f"{df['selected_constraints_count'].mean():.1f}",
                f"{df['hard_constraint_count'].mean():.1f}"
            ]
        }
        summary_df = pd.DataFrame(summary_data)
        summary_df.to_excel(writer, sheet_name='Summary', index=False)
        
        # Sheet 3: SAT/UNSAT 分佈
        distribution_data = {
            "Result": ["UNSAT", "SAT", "ERROR"],
            "Count": [unsat_count, sat_count, error_count],
            "Percentage": [
                f"{(unsat_count / total_cases * 100):.2f}%",
                f"{(sat_count / total_cases * 100):.2f}%",
                f"{(error_count / total_cases * 100):.2f}%"
            ]
        }
        dist_df = pd.DataFrame(distribution_data)
        dist_df.to_excel(writer, sheet_name='Distribution', index=False)
    
    print(f"\n{'='*60}")
    print(f"📊 Experiment Results Summary")
    print(f"{'='*60}")
    print(f"Total Cases: {total_cases}")
    print(f"Successful Runs: {success_cases}")
    print(f"UNSAT Results: {unsat_count} ({(unsat_count / success_cases * 100):.2f}%)")
    print(f"SAT Results: {sat_count} ({(sat_count / success_cases * 100):.2f}%)")
    print(f"Errors: {error_count}")
    print(f"Avg Elapsed Time: {df[df['success']]['elapsed_time_sec'].mean():.3f} sec")
    print(f"\n💾 Results saved to: {excel_path}")
    
    return excel_path


def main(case_indices=None, data_dir="outputs", output_dir="outputs", max_workers=4):
    """
    主函數：執行實驗
    
    Args:
        case_indices: 案例索引列表 (e.g., [0, 1, 2, ...])
                     如果為 None，則自動從 outputs 目錄載入所有案例
        data_dir: 資料目錄
        output_dir: 輸出目錄
        max_workers: 最大併行數
    """
    # 如果未指定案例，從 outputs 目錄自動發現
    if case_indices is None:
        output_path = Path(data_dir)
        constraint_files = list(output_path.glob("case_*.constraint_spec.json"))
        case_indices = sorted([
            int(f.name.replace("case_", "").replace(".constraint_spec.json", ""))
            for f in constraint_files
        ])
    
    if not case_indices:
        print("❌ No cases found!")
        return
    
    # 隨機選取一半的案例
    half_count = max(1, len(case_indices) // 2)
    selected_indices = random.sample(case_indices, half_count)
    case_ids = [f"case_{idx}" for idx in sorted(selected_indices)]
    
    print(f"\n{'='*60}")
    print(f"🧪 Experiment Configuration")
    print(f"{'='*60}")
    print(f"Total Cases Available: {len(case_indices)}")
    print(f"Cases Selected for Experiment: {len(case_ids)} ({len(case_ids)/len(case_indices)*100:.1f}%)")
    print(f"Selected Case IDs: {case_ids[:5]}{'...' if len(case_ids) > 5 else ''}")
    print(f"Data Directory: {data_dir}")
    print(f"Output Directory: {output_dir}")
    
    # 建立實驗配置
    config = ExperimentConfig(case_ratio=0.5, seed=42)
    
    # 執行實驗
    print(f"\n{'='*60}")
    print(f"🚀 Running Experiments...")
    print(f"{'='*60}")
    
    all_stats = run_experiment_batch(case_ids, config, data_dir, max_workers)
    
    # 儲存結果
    excel_path = save_experiment_results(all_stats, output_dir)
    
    return all_stats, excel_path


if __name__ == "__main__":
    import sys
    
    # 可選：指定特定的案例索引
    # case_indices = [0, 1, 2]  # 只測試前 3 個案例
    case_indices = None  # 自動發現所有案例
    
    all_stats, excel_path = main(
        case_indices=case_indices,
        data_dir="outputs",
        output_dir="outputs_RQ3",
        max_workers=1  # 單線程以便調試
    )