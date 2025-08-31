import json
import itertools
from z3 import *

# -------------------------------
# Expr parser
# -------------------------------
def parse_expr(expr, varmap):
    if isinstance(expr, list):
        op = expr[0]
        if op == "VAR":
            name = expr[1]
            if name not in varmap:
                varmap[name] = Real(name)  # 預設 Real
            return varmap[name]
        if op == "EQ":
            return parse_expr(expr[1], varmap) == parse_expr(expr[2], varmap)
        if op == "LT":
            return parse_expr(expr[1], varmap) < parse_expr(expr[2], varmap)
        if op == "LE":
            return parse_expr(expr[1], varmap) <= parse_expr(expr[2], varmap)
        if op == "GE":
            return parse_expr(expr[1], varmap) >= parse_expr(expr[2], varmap)
        if op == "GT":
            return parse_expr(expr[1], varmap) > parse_expr(expr[2], varmap)
        if op == "AND":
            return And(*[parse_expr(e, varmap) for e in expr[1:]])
        if op == "OR":
            return Or(*[parse_expr(e, varmap) for e in expr[1:]])
        if op == "NOT":
            return Not(parse_expr(expr[1], varmap))
        if op == "IMPLIES":
            return Implies(parse_expr(expr[1], varmap), parse_expr(expr[2], varmap))
        if op == "MUL":
            return parse_expr(expr[1], varmap) * parse_expr(expr[2], varmap)
        if op == "DIV":
            return parse_expr(expr[1], varmap) / parse_expr(expr[2], varmap)
        if op == "CASE":
            args = expr[1:]
            res = parse_expr(args[-1], varmap)
            for i in range(len(args)-2, -1, -2):
                cond = parse_expr(args[i], varmap)
                val = parse_expr(args[i+1], varmap)
                res = If(cond, val, res)
            return res
    elif isinstance(expr, (int, float, bool)):
        return expr
    elif isinstance(expr, str):
        if expr not in varmap:
            varmap[expr] = Real(expr)  # 預設 Real
        return varmap[expr]
    raise ValueError(f"Unknown expr: {expr}")


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
    all_constraints = [(c, f"fact:{name}") for name, c in facts.items()] + \
                      [(c, f"law:{name}") for name, c in laws.items()]
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
    filtered_mus = [set(e for e in mus if not str(e).startswith(ignore_prefix))
                    for mus in mus_list]
    all_elems = set().union(*filtered_mus)
    for r in range(1, len(all_elems)+1):
        for subset in itertools.combinations(all_elems, r):
            if all(any(e in subset for e in mus) for mus in filtered_mus):
                return set(subset)
    return set()

# -------------------------------
# 主流程
# -------------------------------
def run_case(laws_json, case_json):
    # 1. 建立變數
    varmap = {}
    for spec in case_json["varspecs"]:
        if spec["type"] == "Real":
            varmap[spec["name"]] = Real(spec["name"])
        elif spec["type"] == "Int":
            varmap[spec["name"]] = Int(spec["name"])
        elif spec["type"] == "Bool":
            varmap[spec["name"]] = Bool(spec["name"])

    # 2. facts
    facts = {}
    for k, v in case_json["facts"].items():
        facts[k] = varmap[k] == v

    # 3. laws
    laws = {}
    for rule in laws_json:
        laws[rule["id"]] = parse_expr(rule["expr"], varmap)

    # 4. 跑 MARCO
    results = marco_all_constraints(facts, laws)

    print("=== 列舉完成 ===")
    mus_sets = []
    for idx, mus in enumerate(results["MUS"], 1):
        fact_part = [tag for (_, tag) in mus if tag.startswith("fact:")]
        law_part = [tag for (_, tag) in mus if tag.startswith("law:")]
        print(f"\nMUS {idx}:")
        print("  Facts:", fact_part)
        print("  Laws:", law_part)
        mus_sets.append(set(fact_part))

    if mus_sets:
        mhs = minimal_hitting_set(mus_sets)
        print("\n=== Minimal Hitting Set (MHS) ===")
        print("需要放寬/移除的 Facts:", mhs)

# -------------------------------
# 測試執行
# -------------------------------
if __name__ == "__main__":
    with open("outputs/case_0.constraint_spec.json") as f1, open("outputs/case_0.varspec_facts.json") as f2:
        laws_json = json.load(f1)
        case_json = json.load(f2)
    run_case(laws_json, case_json)
