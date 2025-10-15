import json
from z3 import *


def declare_vars(varspecs):
    """根據 varspecs 宣告 Z3 變數"""
    z3_vars = {}
    for v in varspecs:
        name, typ = v["name"], v["type"]
        if typ == "Real":
            z3_vars[name] = Real(name)
        elif typ == "Int":
            z3_vars[name] = Int(name)
        elif typ == "Bool":
            z3_vars[name] = Bool(name)
        else:
            raise ValueError(f"Unknown type: {typ}")
    return z3_vars
def build_expr(expr, z3_vars):
    """把 JSON expr 轉成 Z3 formula"""
    if isinstance(expr, list):
        op = expr[0]
        if op == "VAR":
            return z3_vars[expr[1]]
        elif op == "AND":
            return And(*[build_expr(e, z3_vars) for e in expr[1:]])
        elif op == "OR":
            return Or(*[build_expr(e, z3_vars) for e in expr[1:]])
        elif op == "NOT":
            return Not(build_expr(expr[1], z3_vars))
        elif op == "EQ":
            return build_expr(expr[1], z3_vars) == build_expr(expr[2], z3_vars)
        elif op == "GE":
            return build_expr(expr[1], z3_vars) >= build_expr(expr[2], z3_vars)
        elif op == "LE":
            return build_expr(expr[1], z3_vars) <= build_expr(expr[2], z3_vars)
        elif op == "GT":
            return build_expr(expr[1], z3_vars) > build_expr(expr[2], z3_vars)
        elif op == "LT":
            return build_expr(expr[1], z3_vars) < build_expr(expr[2], z3_vars)
        elif op == "MUL":
            return build_expr(expr[1], z3_vars) * build_expr(expr[2], z3_vars)
        elif op == "ADD":
            return sum(build_expr(e, z3_vars) for e in expr[1:])
        elif op == "SUM":
            return sum(build_expr(e, z3_vars) for e in expr[1:])
        elif op == "AVG":
            terms = [build_expr(e, z3_vars) for e in expr[1:]]
            return sum(terms) / len(terms)
        elif op == "DIV":
            return build_expr(expr[1], z3_vars) / build_expr(expr[2], z3_vars)
        elif op == "CASE":
            parts = expr[1:]
            default = parts[-1]
            cases = list(zip(parts[0::2], parts[1::2]))
            
            # 🔧 處理 default（可能是純數字）
            res = _to_z3_value(build_expr(default, z3_vars))
            
            for cond, val in reversed(cases):
                cond_expr = build_expr(cond, z3_vars)
                
                # 確保條件是 Bool
                if isinstance(cond_expr, ArithRef):
                    cond_expr = cond_expr != 0
                elif not isinstance(cond_expr, BoolRef):
                    raise TypeError(f"CASE 條件必須是 Bool，但得到 {cond_expr} ({type(cond_expr)})")
                
                # 🔧 處理 val（可能是純數字）
                val_expr = _to_z3_value(build_expr(val, z3_vars))
                res = If(cond_expr, val_expr, res)
            
            return res
        elif op == "IMPLIES":
            return Implies(build_expr(expr[1], z3_vars), build_expr(expr[2], z3_vars))
        else:
            raise ValueError(f"Unsupported operator {op}")
    elif isinstance(expr, str):
        if expr in z3_vars:
            return z3_vars[expr]
        if expr.lower() == "true":
            return True
        if expr.lower() == "false":
            return False
        raise ValueError(f"Unknown variable or invalid string in expr: {expr}")
    else:
        return expr  # 數字或布林


def _to_z3_value(val):
    """將 Python 值轉換為對應的 Z3 常數"""
    if isinstance(val, (BoolRef, ArithRef)):
        # 已經是 Z3 表達式，直接返回
        return val
    elif isinstance(val, bool):
        return BoolVal(val)
    elif isinstance(val, int):
        return IntVal(val)
    elif isinstance(val, float):
        return RealVal(val)
    else:
        # 其他情況（例如已經是 Z3 常數）
        return val

def build_constraints(hard_json, soft_json):
    """建立硬/軟約束"""
    z3_vars = declare_vars(soft_json["varspecs"])

    # hard constraints
    hard_constraints = [build_expr(c["expr"], z3_vars) for c in hard_json]

    # soft constraints (facts)
    facts = soft_json.get("facts", {})
    if "facts" in facts and isinstance(facts["facts"], dict):
        facts = facts["facts"]  # 🔧 解開巢狀的 facts

    soft_constraints = []
    for name, val in facts.items():
        if name not in z3_vars:
            raise ValueError(f"Fact variable {name} not declared in varspecs")
        if isinstance(z3_vars[name], BoolRef):
            soft_constraints.append(z3_vars[name] == bool(val))
        elif isinstance(z3_vars[name], ArithRef):
            soft_constraints.append(z3_vars[name] == float(val))
        else:
            raise ValueError(f"Unsupported fact type for {name}")

    return hard_constraints, soft_constraints


if __name__ == "__main__":
    import argparse
    from test import pretty_print_results  # ← 你原本的檔案匯入

    parser = argparse.ArgumentParser()
    parser.add_argument("--hard", required=True, help="Path to hard constraints JSON")
    parser.add_argument("--soft", required=True, help="Path to soft constraints JSON")
    args = parser.parse_args()

    with open(args.hard, "r", encoding="utf-8") as f:
        hard_json = json.load(f)
    with open(args.soft, "r", encoding="utf-8") as f:
        soft_json = json.load(f)

    hard_constraints, soft_constraints = build_constraints(hard_json, soft_json)
    pretty_print_results(hard_constraints, soft_constraints)
