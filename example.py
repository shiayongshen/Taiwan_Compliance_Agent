from z3 import *
import itertools
import time

# -------------------------------
# MARCO helper
# -------------------------------
def check_subset(constraints, mask):
    solver = Solver()
    for i, (c, _) in enumerate(constraints):
        if mask[i]:
            solver.add(c)
    return solver.check()

def shrink_to_mus(constraints, mask):
    mus = mask[:]
    for i in range(len(constraints)):
        if mus[i]:
            mus[i] = False
            s2 = Solver()
            for j, (c, _) in enumerate(constraints):
                if mus[j]:
                    s2.add(c)
            if s2.check() != unsat:
                mus[i] = True
    return mus

def grow_to_mcs(constraints, mask):
    mcs = mask[:]
    for i in range(len(constraints)):
        if not mcs[i]:
            mcs[i] = True
            if check_subset(constraints, mcs) == unsat:
                mcs[i] = False
    return mcs

def marco_all_constraints(facts, laws):
    all_constraints = [(c, f"fact:{name}") for name, c in facts.items()] + [(c, f"law:{name}") for name, c in laws.items()]
    n = len(all_constraints)

    space = Solver()
    selector = [Bool(f"s_{i}") for i in range(n)]
    results = {"MUS": [], "MCS": []}

    while space.check() == sat:
        model = space.model()
        mask = [is_true(model.eval(selector[i], model_completion=True)) for i in range(n)]

        if check_subset(all_constraints, mask) == unsat:
            mus = shrink_to_mus(all_constraints, mask)
            results["MUS"].append([(all_constraints[i][0], all_constraints[i][1]) for i in range(n) if mus[i]])
            space.add(Or([Not(selector[i]) for i in range(n) if mus[i]]))
        else:
            mcs = grow_to_mcs(all_constraints, mask)
            results["MCS"].append([(all_constraints[i][0], all_constraints[i][1]) for i in range(n) if mcs[i]])
            space.add(Or([selector[i] for i in range(n) if not mcs[i]]))
    return results

# -------------------------------
# Minimal Hitting Set
# -------------------------------
def minimal_hitting_set(mus_list, ignore_prefix="fact:penalty"):
    # 過濾掉 penalty 類的 facts
    filtered_mus = [set(e for e in mus if not str(e).startswith(ignore_prefix))
                    for mus in mus_list]

    all_elems = set().union(*filtered_mus)
    for r in range(1, len(all_elems)+1):
        for subset in itertools.combinations(all_elems, r):
            if all(any(e in subset for e in mus) for mus in filtered_mus):
                return set(subset)
    return set()

# -------------------------------
# 宣告變數
# -------------------------------
CAR = Real('CAR')
NWR = Real('NWR')
NWR_prev = Real('NWR_prev')
avg_compensation_12m = Real('avg_compensation_12m')
equity = Real('equity')
net_worth = Real('net_worth')
own_capital = Real('own_capital')
responsible_person_compensation = Real('responsible_person_compensation')
risk_capital = Real('risk_capital')
tier1_restricted_capital = Real('tier1_restricted_capital')
tier1_unrestricted_capital = Real('tier1_unrestricted_capital')
tier2_capital = Real('tier2_capital')
total_assets_excl_investment = Real('total_assets_excl_investment')
penalty = Bool('penalty')

insurance_capital_adequate_ok = Bool('insurance:capital_adequate_ok')
insurance_capital_inadequate = Bool('insurance:capital_inadequate')
insurance_capital_significantly_inadequate = Bool('insurance:capital_significantly_inadequate')
insurance_capital_severely_inadequate = Bool('insurance:capital_severely_inadequate')
insurance_capital_classification = Int('insurance:capital_classification')
insurance_car_calculation = Bool('insurance:car_calculation')
insurance_nwr_calculation = Bool('insurance:nwr_calculation')
insurance_improvement_plan_required = Bool('insurance:improvement_plan_required')
insurance_improvement_plan_execution = Bool('insurance:improvement_plan_execution')
insurance_inadequate_next_level_measures = Bool('insurance:inadequate_next_level_measures')
insurance_inadequate_product_restriction = Bool('insurance:inadequate_product_restriction')
insurance_inadequate_fund_usage_restriction = Bool('insurance:inadequate_fund_usage_restriction')
insurance_inadequate_compensation_restriction = Bool('insurance:inadequate_compensation_restriction')
insurance_significantly_inadequate_measures = Bool('insurance:significantly_inadequate_measures')
insurance_significantly_inadequate_dismiss = Bool('insurance:significantly_inadequate_dismiss')
insurance_significantly_inadequate_suspend = Bool('insurance:significantly_inadequate_suspend')
insurance_significantly_inadequate_asset_approval = Bool('insurance:significantly_inadequate_asset_approval')
insurance_significantly_inadequate_asset_disposal = Bool('insurance:significantly_inadequate_asset_disposal')
insurance_significantly_inadequate_related_party = Bool('insurance:significantly_inadequate_related_party')
insurance_significantly_inadequate_compensation_reduction = Bool('insurance:significantly_inadequate_compensation_reduction')
insurance_significantly_inadequate_branch_restriction = Bool('insurance:significantly_inadequate_branch_restriction')
insurance_severely_inadequate_measures = Bool('insurance:severely_inadequate_measures')
insurance_severely_inadequate_special_measures = Bool('insurance:severely_inadequate_special_measures')
insurance_own_capital_composition = Bool('insurance:own_capital_composition')
insurance_capital_compliance_ok = Bool('insurance_capital_compliance_ok')

# -------------------------------
# Facts (軟約束)
# -------------------------------
facts = {
    "CAR": CAR == 150.0,
    "NWR": NWR == 2.97,
    "NWR_prev": NWR_prev == 2.97,
    "penalty_fact": penalty == False
}

# -------------------------------
# Laws (硬約束) → 這裡只列一部分示例
# -------------------------------
laws = {
    # 分類條件 (iff 定義)
    "capital_adequate_ok": insurance_capital_adequate_ok == And(
        CAR >= 200.0,
        Or(NWR >= 3.0, NWR_prev >= 3.0)
    ),

    "capital_inadequate": insurance_capital_inadequate == Or(
        And(CAR >= 150.0, CAR < 200.0),
        And(NWR < 3.0, NWR_prev < 3.0,
            Or(NWR >= 2.0, NWR_prev >= 2.0))
    ),

    "capital_significantly_inadequate": insurance_capital_significantly_inadequate == Or(
        And(CAR >= 50.0, CAR < 150.0),
        And(NWR < 2.0, NWR_prev < 2.0,
            NWR >= 0.0, NWR_prev >= 0.0)
    ),

    "capital_severely_inadequate": insurance_capital_severely_inadequate == Or(
        CAR < 50.0,
        net_worth < 0.0
    ),

    # 完全覆蓋 + 互斥條件
    "capital_classification_cover": Or(
        insurance_capital_adequate_ok,
        insurance_capital_inadequate,
        insurance_capital_significantly_inadequate,
        insurance_capital_severely_inadequate
    ),

    "capital_classification_mutex": AtMost(
        insurance_capital_adequate_ok,
        insurance_capital_inadequate,
        insurance_capital_significantly_inadequate,
        insurance_capital_severely_inadequate, 1
    ),

    # 新增合規條件 (財閥合格)
    "capital_compliance_ok": insurance_capital_compliance_ok == And(
        CAR > 200.0,
        NWR > 3.0,
        NWR_prev > 3.0
    ),

    # 其他公式保持不變
    "car_calculation": CAR == (own_capital / risk_capital) * 100.0,
    "nwr_calculation": NWR == (equity / total_assets_excl_investment) * 100.0,
    "own_capital_composition": own_capital == tier1_unrestricted_capital + tier1_restricted_capital + tier2_capital,

    # 🔒 Penalty 限制：只有在不合規時 penalty 才可能為 True
    "penalty_rule": penalty == Not(insurance_capital_compliance_ok)
}


# -------------------------------
# 執行 MARCO
# -------------------------------
t0 = time.time()
results = marco_all_constraints(facts, laws)
t1 = time.time()

print("=== 列舉完成 ===")
soft_mus_sets = []

for idx, mus in enumerate(results["MUS"], 1):
    fact_part = [tag for (_, tag) in mus if tag.startswith("fact:")]
    law_part = [tag for (_, tag) in mus if tag.startswith("law:")]
    print(f"\nMUS {idx}:")
    print("  Facts:", fact_part)
    print("  Laws:", law_part)
    # 記錄 fact 索引 (只針對 facts 計算 MHS)
    soft_mus_sets.append(set(fact_part))

t2 = time.time()

# -------------------------------
# 計算 MHS
# -------------------------------
if soft_mus_sets:
    mhs = minimal_hitting_set(soft_mus_sets)
    print("\n=== Minimal Hitting Set (MHS) ===")
    print("需要放寬/移除的 Facts:", mhs)
else:
    mhs = set()

t3 = time.time()

# -------------------------------
# 運行時間
# -------------------------------
print("\n=== 運行時間 (秒) ===")
print(f"總時間: {t3 - t0:.4f}")
print(f"  列舉 MUS: {t1 - t0:.4f}")
print(f"  處理 MUS: {t2 - t1:.4f}")
print(f"  計算 MHS: {t3 - t2:.4f}")
