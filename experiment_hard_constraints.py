import json
import pandas as pd
import random
from pathlib import Path
from datetime import datetime
import time
from concurrent.futures import ThreadPoolExecutor, as_completed

from marco.json2z3 import declare_vars, build_expr
from utils import check_case_law_hard, z3_optimize_case, calculate_min_flips

class ExperimentConfig:
    """實驗配置"""
    def __init__(self, case_ratio=0.5, facts_ratio_min=0.01, facts_ratio_max=0.5, seed=42):
        self.case_ratio = case_ratio  # 選取案例比例
        self.facts_ratio_min = facts_ratio_min  # facts 最小比例
        self.facts_ratio_max = facts_ratio_max  # facts 最大比例
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
        self.hard_constraint_count = 0
        self.hard_constraint_keys = []  # 記錄選中的 fact keys
        self.hard_constraints_from_facts = []
        self.facts_ratio = 0  # 記錄隨機選取的比例
        
        # 結果
        self.sat_result = None
        self.unsat_core = None
        self.error_message = None
        self.elapsed_time = 0
        self.success = False
        
        # 翻轉資訊（只在 SAT 時有效）
        self.min_flips_info = None
        self.flipped_count = 0
        self.unchanged_count = 0
        self.flip_rate = 0
        self.flipped_details = []
        
        # 新增：區分 fixed 和 non-fixed 的翻轉率
        self.fixed_vars_count = 0  # fixed constraints 的變數數
        self.non_fixed_vars_count = 0  # 可以翻轉的變數數
        self.flipped_non_fixed_count = 0  # 被翻轉的 non-fixed 變數數
        self.non_fixed_flip_rate = 0  # 只計算 non-fixed 變數的翻轉率
    
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
            "facts_ratio": round(self.facts_ratio, 3),  # 記錄選取比例
            "sat_result": self.sat_result,
            "unsat_core": str(self.unsat_core) if self.unsat_core else None,
            "error_message": self.error_message,
            "elapsed_time_sec": round(self.elapsed_time, 3),
            "success": self.success,
            "selected_constraints": json.dumps(self.selected_constraints, ensure_ascii=False),
            "hard_constraint_keys": json.dumps(self.hard_constraint_keys, ensure_ascii=False),  # 選中的 fact keys
            "hard_constraints": json.dumps(self.hard_constraints_from_facts, ensure_ascii=False),
            # 原始翻轉資訊
            "flipped_count": self.flipped_count,
            "unchanged_count": self.unchanged_count,
            "flip_rate": self.flip_rate,
            "flipped_details": json.dumps(self.flipped_details, ensure_ascii=False),
            # 新增：fixed vs non-fixed 翻轉率
            "fixed_vars_count": self.fixed_vars_count,
            "non_fixed_vars_count": self.non_fixed_vars_count,
            "flipped_non_fixed_count": self.flipped_non_fixed_count,
            "non_fixed_flip_rate": self.non_fixed_flip_rate
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
    從 facts 中隨機選取指定比例的元素作為 hard constraints（排除 penalty 和有前綴的 key）
    
    Args:
        facts: 事實字典
        varspecs: 變數規範
        max_count: 最多選取多少個
        ratio: 選取比例（默認 0.5 = 50%）
    
    Returns:
        hard_constraints: 列表
        selected_keys: 選中的鍵列表
    """
    if not facts:
        return [], []
    
    # 決定選取多少個 fact 元素
    # 排除：1) 'penalty' 相關的 key，2) 含有冒號前綴的 key（如 "insurance:", "meta:"）
    fact_keys = [
        k for k in facts.keys() 
        if 'penalty' not in k.lower() and ':' not in k
    ]
    
    if not fact_keys:
        return [], []
    
    # 隨機選取指定比例的 facts
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
    
    實驗流程：
    1. 載入 constraints 和 facts
    2. 從 facts 中隨機選取一部分變數變成 hard constraints（固定值）
    3. 其餘 facts 變成 soft constraints
    4. 用 optimizer 求解看是 SAT 或 UNSAT
    
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
        
        # 步驟 1: 使用全部 constraints（不過濾前綴）
        selected_constraints = constraints
        stats.selected_constraints = [c.get("id", f"constraint_{i}") for i, c in enumerate(selected_constraints)]
        stats.selected_constraints_count = len(selected_constraints)
        
        print(f"  ✓ Using all {len(selected_constraints)} constraints")
        
        # 步驟 2: 隨機選取 facts 的一部分變成 hard constraints
        random_ratio = random.uniform(config.facts_ratio_min, config.facts_ratio_max)
        stats.facts_ratio = random_ratio  # 記錄比例
        print(f"  ℹ️ Random facts ratio: {random_ratio:.3f}")
        
        # 從 facts 中提取哪些要變成 hard constraints（排除 penalty）
        fact_keys = [
            k for k in facts.keys() 
            if 'penalty' not in k.lower() and ':' not in k
        ]
        
        if fact_keys:
            count = max(1, int(len(fact_keys) * random_ratio))
            hard_constraint_keys = random.sample(fact_keys, min(count, len(fact_keys)))
        else:
            hard_constraint_keys = []
        
        stats.hard_constraint_count = len(hard_constraint_keys)
        stats.hard_constraint_keys = hard_constraint_keys  # 記錄選中的 keys
        print(f"  ✓ Selected {len(hard_constraint_keys)} facts as hard constraints")
        print(f"    Hard constraint keys: {hard_constraint_keys}")
        
        # 步驟 3: 建立 hard constraints（從選中的 facts 固定值）
        hard_constraints_list = []
        for i, key in enumerate(hard_constraint_keys):
            value = facts[key]
            hard_constraint_spec = {
                "id": f"hard_constraint_from_fact_{key}",
                "desc": f"Fixed from fact: {key} = {value}",
                "expr": ["EQ", ["VAR", key], value],
                "weight": 1,  # hard constraint
                "domain": "experiment"
            }
            hard_constraints_list.append(hard_constraint_spec)
            stats.hard_constraints_from_facts.append({
                "key": key,
                "value": value
            })
        
        # 步驟 4: 合併 constraints
        # = 原始 constraints + hard constraints from facts
        modified_constraints = selected_constraints + hard_constraints_list
        
        print(f"  ✓ Final constraints: {len(selected_constraints)} + {len(hard_constraints_list)} = {len(modified_constraints)}")
        
        # 步驟 5: 建立修改後的 facts（排除變成 hard constraints 的）
        modified_facts = {k: v for k, v in facts.items() if k not in hard_constraint_keys}
        print(f"  ✓ Soft facts: {len(facts)} - {len(hard_constraint_keys)} = {len(modified_facts)}")
        
        # 步驟 6: 宣告 Z3 變數
        z3_vars = declare_vars(varspecs)
        
        # 步驟 7: 執行 Z3 optimizer 求解
        # - modified_constraints 是 hard constraints
        # - modified_facts 是 soft constraints
        start = time.time()
        is_sat, result = z3_optimize_case(modified_constraints, modified_facts, z3_vars, build_expr)
        stats.elapsed_time = time.time() - start
        
        if is_sat:
            stats.sat_result = "SAT"
            stats.success = True
            
            # 計算最小翻轉數（SAT 時才有 model）
            flips_info = calculate_min_flips(result, modified_facts, z3_vars)
            stats.min_flips_info = flips_info
            stats.flipped_count = flips_info['flipped_count']
            stats.unchanged_count = flips_info['unchanged_count']
            stats.flip_rate = flips_info['flip_rate']
            stats.flipped_details = flips_info['flipped_variables']
            
            # 新增：計算 fixed vs non-fixed 的翻轉率
            # fixed_vars：在 hard_constraint_keys 中的變數（不能被翻轉）
            # non_fixed_vars：在 modified_facts 中的變數（可以被翻轉）
            stats.fixed_vars_count = len(hard_constraint_keys)
            stats.non_fixed_vars_count = len(modified_facts)
            
            # 計算被翻轉的 non-fixed 變數數
            flipped_non_fixed = [f for f in stats.flipped_details if f['variable'] in modified_facts]
            stats.flipped_non_fixed_count = len(flipped_non_fixed)
            
            # 計算 non-fixed 翻轉率：翻轉的 non-fixed / 所有 non-fixed
            if stats.non_fixed_vars_count > 0:
                stats.non_fixed_flip_rate = round((stats.flipped_non_fixed_count / stats.non_fixed_vars_count) * 100, 2)
            else:
                stats.non_fixed_flip_rate = 0
            
            print(f"  ✓ Z3 Optimizer Result: {stats.sat_result}")
            print(f"    All Facts Flips: {stats.flipped_count}/{len(modified_facts)} ({stats.flip_rate}%)")
            print(f"    Fixed Variables: {stats.fixed_vars_count}")
            print(f"    Non-Fixed Variables: {stats.non_fixed_vars_count}")
            print(f"    Flipped Non-Fixed: {stats.flipped_non_fixed_count}/{stats.non_fixed_vars_count} ({stats.non_fixed_flip_rate}%)")
            print(f"    Flipped Variables: {[f['variable'] for f in stats.flipped_details]}")
        else:
            stats.sat_result = "UNSAT"
            stats.unsat_core = result
            stats.success = False
            print(f"  ✓ Z3 Optimizer Result: {stats.sat_result}")
            print(f"    Unsat Core: {result}")
        
    except Exception as e:
        stats.error_message = str(e)
        print(f"  ❌ Error: {e}")
        import traceback
        traceback.print_exc()
    
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


def run_experiment_batch_baseline(case_ids, data_dir="outputs", max_workers=4):
    """
    批量執行基準實驗（不加 hard constraints，所有 facts 都是 soft constraints）
    
    Args:
        case_ids: 案例 ID 列表
        data_dir: 資料目錄
        max_workers: 最大併行數
    
    Returns:
        list: ExperimentStats 列表
    """
    all_stats = []
    
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = {
            executor.submit(run_experiment_baseline, case_id, data_dir): case_id
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
                stats = ExperimentStats(case_id, f"baseline_{datetime.now().strftime('%Y%m%d_%H%M%S')}")
                stats.error_message = str(e)
                all_stats.append(stats)
    
    return all_stats


def run_experiment_baseline(case_id, data_dir="outputs"):
    """
    執行基準實驗（不加 hard constraints）
    
    實驗流程：
    1. 載入 constraints 和 facts
    2. 所有 facts 變成 soft constraints（沒有 hard constraints）
    3. 用 optimizer 求解看是 SAT 或 UNSAT
    
    Returns:
        ExperimentStats: 實驗結果
    """
    stats = ExperimentStats(case_id, f"baseline_{datetime.now().strftime('%Y%m%d_%H%M%S')}")
    
    try:
        # 載入資料
        constraints, varspecs, facts = load_case_data(case_id, data_dir)
        if constraints is None:
            stats.error_message = "Failed to load case data"
            return stats
        
        stats.original_constraints_count = len(constraints)
        stats.original_facts_count = len(facts)
        
        # 使用全部 constraints 作為 hard constraints
        stats.selected_constraints = [c.get("id", f"constraint_{i}") for i, c in enumerate(constraints)]
        stats.selected_constraints_count = len(constraints)
        
        # 基準實驗：沒有額外的 hard constraints（hard_constraint_count = 0）
        stats.hard_constraint_count = 0
        stats.hard_constraint_keys = []
        stats.facts_ratio = 0
        
        print(f"  ✓ Using all {len(constraints)} constraints as hard constraints")
        print(f"  ✓ All {len(facts)} facts as soft constraints (baseline)")
        
        # 宣告 Z3 變數
        z3_vars = declare_vars(varspecs)
        
        # 執行 Z3 optimizer 求解
        start = time.time()
        is_sat, result = z3_optimize_case(constraints, facts, z3_vars, build_expr)
        stats.elapsed_time = time.time() - start
        
        if is_sat:
            stats.sat_result = "SAT"
            stats.success = True
            
            # 計算最小翻轉數（SAT 時才有 model）
            flips_info = calculate_min_flips(result, facts, z3_vars)
            stats.min_flips_info = flips_info
            stats.flipped_count = flips_info['flipped_count']
            stats.unchanged_count = flips_info['unchanged_count']
            stats.flip_rate = flips_info['flip_rate']
            stats.flipped_details = flips_info['flipped_variables']
            
            # 新增：基準實驗中，所有 facts 都是 non-fixed（因為沒有 hard constraints）
            stats.fixed_vars_count = 0
            stats.non_fixed_vars_count = len(facts)
            stats.flipped_non_fixed_count = stats.flipped_count
            stats.non_fixed_flip_rate = stats.flip_rate
            
            print(f"  ✓ Z3 Optimizer Result: {stats.sat_result}")
            print(f"    Minimum Flips: {stats.flipped_count}/{len(facts)} ({stats.flip_rate}%)")
            print(f"    Fixed Variables: 0 (baseline - no fixed constraints)")
            print(f"    Non-Fixed Variables: {len(facts)}")
            print(f"    Flipped Non-Fixed: {stats.flipped_count}/{len(facts)} ({stats.flip_rate}%)")
            print(f"    Flipped Variables: {[f['variable'] for f in stats.flipped_details]}")
        else:
            stats.sat_result = "UNSAT"
            stats.unsat_core = result
            stats.success = False
            print(f"  ✓ Z3 Optimizer Result: {stats.sat_result}")
            print(f"    Unsat Core: {result}")
        
    except Exception as e:
        stats.error_message = str(e)
        print(f"  ❌ Error: {e}")
        import traceback
        traceback.print_exc()
    
    return stats


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
    
    # 翻轉相關統計（只計算 SAT 的）
    sat_df = df[df["sat_result"] == "SAT"]
    avg_flips = sat_df["flipped_count"].mean() if len(sat_df) > 0 else 0
    avg_flip_rate = sat_df["flip_rate"].mean() if len(sat_df) > 0 else 0
    
    # 新增：區分 fixed vs non-fixed 翻轉率的統計
    avg_fixed_vars = df["fixed_vars_count"].mean() if len(df) > 0 else 0
    avg_non_fixed_vars = df["non_fixed_vars_count"].mean() if len(df) > 0 else 0
    avg_flipped_non_fixed = sat_df["flipped_non_fixed_count"].mean() if len(sat_df) > 0 else 0
    avg_non_fixed_flip_rate = sat_df["non_fixed_flip_rate"].mean() if len(sat_df) > 0 else 0
    
    # 儲存到 Excel
    excel_path = output_path / f"experiment_results_{datetime.now().strftime('%Y%m%d_%H%M%S')}.xlsx"
    
    with pd.ExcelWriter(excel_path, engine='openpyxl') as writer:
        # Sheet 1: 詳細結果
        df.to_excel(writer, sheet_name='Results', index=False)
        
        # 計算有 fixed vs 沒有 fixed 的分組統計
        with_fixed_df = sat_df[sat_df["fixed_vars_count"] > 0]
        without_fixed_df = sat_df[sat_df["fixed_vars_count"] == 0]
        
        # 有 fixed constraints 的統計
        with_fixed_count = len(with_fixed_df)
        with_fixed_avg_flip_rate = with_fixed_df["non_fixed_flip_rate"].mean() if len(with_fixed_df) > 0 else 0
        with_fixed_avg_flipped_count = with_fixed_df["flipped_non_fixed_count"].mean() if len(with_fixed_df) > 0 else 0
        
        # 沒有 fixed constraints 的統計（基準）
        without_fixed_count = len(without_fixed_df)
        without_fixed_avg_flip_rate = without_fixed_df["flip_rate"].mean() if len(without_fixed_df) > 0 else 0
        without_fixed_avg_flipped_count = without_fixed_df["flipped_count"].mean() if len(without_fixed_df) > 0 else 0
        
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
                "Avg Hard Constraints",
                "--- SAT Cases Only ---",
                "Avg Min Flips (SAT)",
                "Avg Flip Rate (SAT) (%)",
                "Total SAT Cases",
                "--- Cases WITH Fixed Constraints ---",
                "Count (With Fixed)",
                "Avg Non-Fixed Flip Rate (%)",
                "Avg Flipped Variables",
                "--- Cases WITHOUT Fixed Constraints (Baseline) ---",
                "Count (Without Fixed)",
                "Avg Flip Rate (%)",
                "Avg Flipped Variables"
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
                f"{df['hard_constraint_count'].mean():.1f}",
                "",
                f"{avg_flips:.2f}",
                f"{avg_flip_rate:.2f}%",
                sat_count,
                "",
                with_fixed_count,
                f"{with_fixed_avg_flip_rate:.2f}%",
                f"{with_fixed_avg_flipped_count:.2f}",
                "",
                without_fixed_count,
                f"{without_fixed_avg_flip_rate:.2f}%",
                f"{without_fixed_avg_flipped_count:.2f}"
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
        
        # Sheet 4: SAT 結果詳細分析（只包含 SAT 的案例）
        if len(sat_df) > 0:
            sat_analysis = sat_df[[
                "case_id", "sat_result", "flipped_count", "unchanged_count", 
                "flip_rate", "fixed_vars_count", "non_fixed_vars_count",
                "flipped_non_fixed_count", "non_fixed_flip_rate",
                "hard_constraint_count", "elapsed_time_sec"
            ]].copy()
            sat_analysis.to_excel(writer, sheet_name='SAT_Analysis', index=False)
    
    print(f"\n{'='*60}")
    print(f"📊 Experiment Results Summary")
    print(f"{'='*60}")
    print(f"Total Cases: {total_cases}")
    print(f"Successful Runs: {success_cases}")
    print(f"UNSAT Results: {unsat_count} ({(unsat_count / success_cases * 100):.2f}%)")
    print(f"SAT Results: {sat_count} ({(sat_count / success_cases * 100):.2f}%)")
    print(f"Errors: {error_count}")
    print(f"Avg Elapsed Time: {df[df['success']]['elapsed_time_sec'].mean():.3f} sec")
    print(f"\n📈 SAT Cases Analysis:")
    print(f"Avg Minimum Flips: {avg_flips:.2f} variables")
    print(f"Avg Flip Rate (All Facts): {avg_flip_rate:.2f}%")
    print(f"\n🔧 Comparison: Cases WITH Fixed vs WITHOUT Fixed Constraints:")
    print(f"{'─'*60}")
    print(f"WITH Fixed Constraints:")
    print(f"  Cases: {with_fixed_count}")
    print(f"  Avg Non-Fixed Flip Rate: {with_fixed_avg_flip_rate:.2f}%")
    print(f"    (計算方式: 翻轉的 non-fixed / 所有 non-fixed，fixed 不計入)")
    print(f"  Avg Flipped Variables (non-fixed only): {with_fixed_avg_flipped_count:.2f}")
    print(f"{'─'*60}")
    print(f"WITHOUT Fixed Constraints (Baseline):")
    print(f"  Cases: {without_fixed_count}")
    print(f"  Avg Flip Rate: {without_fixed_avg_flip_rate:.2f}%")
    print(f"    (計算方式: 翻轉的 facts / 所有 facts)")
    print(f"  Avg Flipped Variables: {without_fixed_avg_flipped_count:.2f}")
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
    unselected_indices = [idx for idx in case_indices if idx not in selected_indices]
    
    selected_case_ids = [f"case_{idx}" for idx in sorted(selected_indices)]
    unselected_case_ids = [f"case_{idx}" for idx in sorted(unselected_indices)]
    
    print(f"\n{'='*60}")
    print(f"🧪 Experiment Configuration")
    print(f"{'='*60}")
    print(f"Total Cases Available: {len(case_indices)}")
    print(f"Cases Selected (With Hard Constraints): {len(selected_case_ids)} ({len(selected_case_ids)/len(case_indices)*100:.1f}%)")
    print(f"Cases Unselected (Baseline): {len(unselected_case_ids)} ({len(unselected_case_ids)/len(case_indices)*100:.1f}%)")
    print(f"Data Directory: {data_dir}")
    print(f"Output Directory: {output_dir}")
    
    # 建立實驗配置（facts 比例隨機 0.01 ~ 0.5）
    config = ExperimentConfig(
        case_ratio=0.5, 
        facts_ratio_min=0.01, 
        facts_ratio_max=0.5, 
        seed=42
    )
    
    # ===== 第一組：執行有 hard constraints 的實驗 =====
    print(f"\n{'='*60}")
    print(f"🚀 Running Experiments (Selected Cases with Hard Constraints)...")
    print(f"{'='*60}")
    
    all_stats_selected = run_experiment_batch(selected_case_ids, config, data_dir, max_workers)
    
    # ===== 第二組：執行沒有 hard constraints 的實驗（基準）=====
    print(f"\n{'='*60}")
    print(f"🚀 Running Baseline Experiments (Unselected Cases without Hard Constraints)...")
    print(f"{'='*60}")
    
    all_stats_unselected = run_experiment_batch_baseline(unselected_case_ids, data_dir, max_workers)
    
    # 合併結果
    all_stats = all_stats_selected + all_stats_unselected
    
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