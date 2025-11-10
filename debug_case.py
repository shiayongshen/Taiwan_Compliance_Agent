import json
from pathlib import Path

def print_case_details(case_id="case_0", data_dir="outputs"):
    """
    印出某個案例的完整資訊
    """
    data_path = Path(data_dir)
    
    constraints_file = data_path / f"{case_id}.constraint_spec.json"
    varspecs_file = data_path / f"{case_id}.varspecs.json"
    facts_file = data_path / f"{case_id}.facts.json"
    
    # 載入資料
    with open(constraints_file, "r", encoding="utf-8") as f:
        constraints = json.load(f)
    
    with open(varspecs_file, "r", encoding="utf-8") as f:
        varspecs = json.load(f)
    
    with open(facts_file, "r", encoding="utf-8") as f:
        facts = json.load(f)
    
    print("\n" + "="*80)
    print(f"CASE: {case_id}")
    print("="*80)
    
    # 1. Variables 統計
    print(f"\n📋 VARIABLES ({len(varspecs)} 個)")
    print("-"*80)
    for i, var in enumerate(varspecs[:10]):  # 只顯示前10個
        print(f"  {i+1}. {var.get('name', 'N/A')}: {var.get('type', 'N/A')}")
    if len(varspecs) > 10:
        print(f"  ... 還有 {len(varspecs) - 10} 個變數")
    
    # 2. Constraints 統計（按 domain 分類）
    print(f"\n📌 CONSTRAINTS ({len(constraints)} 個)")
    print("-"*80)
    
    # 按 domain 分類
    by_domain = {}
    no_prefix_constraints = []
    
    for c in constraints:
        constraint_id = c.get("id", "")
        if ':' in constraint_id:
            domain = constraint_id.split(':')[0]
            if domain not in by_domain:
                by_domain[domain] = []
            by_domain[domain].append(c)
        else:
            no_prefix_constraints.append(c)
    
    # 顯示帶前綴的 constraints
    print(f"  With prefix ({sum(len(v) for v in by_domain.values())} 個):")
    for domain, cons in sorted(by_domain.items()):
        print(f"    - {domain}: {len(cons)} 個")
    
    # 顯示無前綴的 constraints
    print(f"  Without prefix ({len(no_prefix_constraints)} 個):")
    for i, c in enumerate(no_prefix_constraints[:5]):
        print(f"    {i+1}. {c.get('id', 'N/A')}: {c.get('desc', 'N/A')}")
    if len(no_prefix_constraints) > 5:
        print(f"    ... 還有 {len(no_prefix_constraints) - 5} 個")
    
    # 3. Facts 統計
    print(f"\n📊 FACTS ({len(facts)} 個)")
    print("-"*80)
    
    # 分類 facts
    penalty_facts = {k: v for k, v in facts.items() if 'penalty' in k.lower()}
    prefix_facts = {k: v for k, v in facts.items() if ':' in k}
    clean_facts = {k: v for k, v in facts.items() if 'penalty' not in k.lower() and ':' not in k}
    
    print(f"  Clean facts (可用來變成 hard constraints): {len(clean_facts)} 個")
    for i, (k, v) in enumerate(list(clean_facts.items())[:8]):
        print(f"    - {k}: {v}")
    if len(clean_facts) > 8:
        print(f"    ... 還有 {len(clean_facts) - 8} 個")
    
    if prefix_facts:
        print(f"  Prefix facts: {len(prefix_facts)} 個")
        for k, v in list(prefix_facts.items())[:3]:
            print(f"    - {k}: {v}")
        if len(prefix_facts) > 3:
            print(f"    ... 還有 {len(prefix_facts) - 3} 個")
    
    if penalty_facts:
        print(f"  Penalty facts: {len(penalty_facts)} 個")
        for k, v in penalty_facts.items():
            print(f"    - {k}: {v}")
    
    # 4. 實驗統計
    print(f"\n🧪 EXPERIMENT STATS")
    print("-"*80)
    print(f"  Total constraints: {len(constraints)}")
    print(f"  Usable constraints (no prefix): {len(no_prefix_constraints)}")
    print(f"  Total facts: {len(facts)}")
    print(f"  Usable facts (for hard constraints): {len(clean_facts)}")
    print(f"  Hard constraints if 50% ratio: {int(len(clean_facts) * 0.5)} 個")
    print(f"  Hard constraints if 10% ratio: {int(len(clean_facts) * 0.1)} 個")
    print(f"  Hard constraints if 1% ratio: {int(len(clean_facts) * 0.01)} 個")
    
    print("\n" + "="*80)

if __name__ == "__main__":
    # 顯示第一個案例的完整資訊
    print_case_details("case_0")
