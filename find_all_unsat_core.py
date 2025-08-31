from z3 import *
import itertools
import time

# -------------------------------
# MARCO (hard+soft 一起)
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

def marco_all_constraints(hard, soft):
    all_constraints = [(c, "hard") for c in hard] + [(c, "soft") for c in soft]
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
def minimal_hitting_set(mus_list):
    all_elems = set().union(*mus_list)
    for r in range(1, len(all_elems)+1):
        for subset in itertools.combinations(all_elems, r):
            if all(any(e in subset for e in mus) for mus in mus_list):
                return set(subset)
    return set()

# -------------------------------
# 測試你的例子
# -------------------------------
x, y, z, w = Ints("x y z w")
hours_week_A, hours_day_A = Ints("hours_week_A hours_day_A")
hours_week_B, hours_day_B = Ints("hours_week_B hours_day_B")
wage_C, wage_D = Ints("wage_C wage_D")
age_E = Int("age_E")
insured_F = Bool("insured_F")
pregnant_H, fired_H = Bools("pregnant_H fired_H")
fired_G = Bool("fired_G")

hard_constraints = [
    hours_week_A <= 40,
    hours_day_A <= 8,
    Or(hours_day_A < 8, hours_week_A < 40),
    wage_C >= 160,
    age_E >= 18,
    hours_day_A <= 10,
    hours_week_A <= 52,
    insured_F == True,
    Implies(pregnant_H, Not(fired_H))
]

soft_constraints = [
    hours_week_A == 50,
    hours_day_A == 10,
    hours_week_B == 42,
    hours_day_B == 9,
    wage_C == 120,
    wage_D == 150,
    age_E == 17,
    insured_F == False,
    fired_G == True,
    And(pregnant_H, fired_H)
]

# -------------------------------
# 執行並計算時間
# -------------------------------
t0 = time.time()
results = marco_all_constraints(hard_constraints, soft_constraints)
t1 = time.time()

print("=== 列舉完成 ===")
soft_mus_sets = []

for idx, mus in enumerate(results["MUS"], 1):
    hard_part = [c for (c, t) in mus if t == "hard"]
    soft_part = [(soft_constraints.index(c), c) for (c, t) in mus if t == "soft"]
    print(f"\nMUS {idx}:")
    print("  Hard constraints:", hard_part)
    print("  Soft constraints:", [c for (_, c) in soft_part])
    soft_mus_sets.append(set(i for (i, _) in soft_part))

t2 = time.time()
if soft_mus_sets:
    mhs = minimal_hitting_set(soft_mus_sets)
    t3 = time.time()
    print("\n=== Minimal Hitting Set (MHS) ===")
    print("軟約束索引:", mhs)
    print("需要移掉的軟約束:")
    for idx in mhs:
        print("-", soft_constraints[idx])
else:
    t3 = t2

# -------------------------------
# 運行時間統計
# -------------------------------
print("\n=== 運行時間 (秒) ===")
print(f"總時間: {t3 - t0:.4f}")
print(f"  列舉 MUS/MCS: {t1 - t0:.4f}")
print(f"  處理 MUS + 輸出: {t2 - t1:.4f}")
print(f"  計算 MHS: {t3 - t2:.4f}")
