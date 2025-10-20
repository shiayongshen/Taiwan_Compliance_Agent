import json
from z3 import *
from z3.z3 import IntNumRef, ArithRef, BoolRef
def declare_vars(varspecs):
    """根據 varspecs 宣告 Z3 變數"""
    z3_vars = {}
    for v in varspecs:
        name, typ = v["name"], v["type"]
        # 🔧 移除前綴檢查，因為現在名稱已統一
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
    if expr is None:
        raise ValueError("Expression spec cannot be None")

    # ✅ 遞迴展開
    if isinstance(expr, list):
        op = expr[0]
        
        if op == "VAR":
            var_name = expr[1]
            if var_name not in z3_vars:
                raise KeyError(f"Variable '{var_name}' not found in z3_vars. Available: {list(z3_vars.keys())}")
            return z3_vars[var_name]

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

        elif op in {"ADD", "SUM"}:
            return sum(build_expr(e, z3_vars) for e in expr[1:])

        elif op == "AVG":
            terms = [build_expr(e, z3_vars) for e in expr[1:]]
            return sum(terms) / len(terms)

        elif op == "DIV":
            a, b = build_expr(expr[1], z3_vars), build_expr(expr[2], z3_vars)
            # 🔧 強制浮點除法，避免 Int 除 Int 出 Int
            if isinstance(a, IntNumRef):
                a = ToReal(a)
            if isinstance(b, IntNumRef):
                b = ToReal(b)
            return a / b

        elif op == "SUB":
            return build_expr(expr[1], z3_vars) - build_expr(expr[2], z3_vars)

        elif op == "ABS":
            val = build_expr(expr[1], z3_vars)
            return If(val >= 0, val, -val)

        elif op == "POW":
            base = build_expr(expr[1], z3_vars)
            exp = expr[2]
            if not isinstance(exp, int) or exp < 0:
                raise ValueError("POW only supports non-negative integer exponents")
            if exp == 0:
                return IntVal(1)
            result = base
            for _ in range(exp - 1):
                result = result * base
            return result

        elif op == "TO_INT":
            val = build_expr(expr[1], z3_vars)
            return ToInt(val) if isinstance(val, ArithRef) else int(val)

        elif op == "TO_REAL":
            val = build_expr(expr[1], z3_vars)
            return ToReal(val) if isinstance(val, ArithRef) else float(val)

        elif op == "CASE":
            parts = expr[1:]
            if len(parts) < 3 or len(parts) % 2 == 0:
                raise ValueError(
                    f"CASE must have odd number of elements (condition-value pairs + default), got {len(parts)}"
                )

            default = _to_z3_value(build_expr(parts[-1], z3_vars))
            cases = list(zip(parts[0::2], parts[1::2]))

            # ✅ 檢測 CASE 內部型別（Real / Int / Bool）
            all_vals = [default]
            for _, v in cases:
                v_expr = _to_z3_value(build_expr(v, z3_vars))
                all_vals.append(v_expr)

            # 🔍 統一型別（如果混用 Int 與 Real → 全轉 Real）
            sorts = {v.sort().name() for v in all_vals if hasattr(v, "sort")}
            if "Real" in sorts and "Int" in sorts:
                all_vals = [ToReal(v) if v.sort().name() == "Int" else v for v in all_vals]
                print("⚙️ Auto-promoted CASE values from Int → Real")

            res = all_vals[0]
            for cond, val in reversed(cases):
                cond_expr = build_expr(cond, z3_vars)
                val_expr = _to_z3_value(build_expr(val, z3_vars))
                if "Real" in sorts and "Int" in {val_expr.sort().name()}:
                    val_expr = ToReal(val_expr)
                if isinstance(cond_expr, ArithRef):
                    cond_expr = cond_expr != 0
                res = If(cond_expr, val_expr, res)
            return res

        elif op == "IMPLIES":
            return Implies(build_expr(expr[1], z3_vars), build_expr(expr[2], z3_vars))

        else:
            raise ValueError(f"Unsupported operator: {op}")

    elif isinstance(expr, str):
        if expr in z3_vars:
            return z3_vars[expr]
        if expr.lower() == "true":
            return BoolVal(True)
        if expr.lower() == "false":
            return BoolVal(False)
        if ":" in expr:
            raise ValueError(f"Invalid variable name '{expr}' (looks like constraint id)")
        raise ValueError(f"Unknown variable name '{expr}'")

    else:
        # ✅ 處理常數（數字或布林）
        if isinstance(expr, bool):
            return BoolVal(expr)
        if isinstance(expr, int):
            return IntVal(expr)
        if isinstance(expr, float):
            return RealVal(expr)
        return expr
    

def _is_z3_expr(v):
    """安全檢查：是否為任意 Z3 表達式"""
    try:
        return hasattr(v, 'sort') and callable(v.sort)
    except Exception:
        return False


def _to_z3_value(v):
    """將 Python 數值或 Z3 物件轉成正確 Z3 類型（跨版本安全）"""
    if _is_z3_expr(v):
        return v
    if isinstance(v, bool):
        return BoolVal(v)
    if isinstance(v, int):
        return IntVal(v)
    if isinstance(v, float):
        return RealVal(v)
    return v

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



def build_facts_dict(facts, z3_vars):
    """
    將 facts 字典轉為 Z3 約束
    """
    result = []
    
    for var_name, value in facts.items():
        if var_name not in z3_vars:
            raise KeyError(f"Variable '{var_name}' in facts not found in z3_vars. Available: {list(z3_vars.keys())}")
        
        z3_var = z3_vars[var_name]
        
        # 🔑 檢查 value 是否為 None
        if value is None:
            raise ValueError(f"Fact '{var_name}' has None value. All facts must have concrete values.")
        
        # 🔑 根據變數類型處理
        if is_bool(z3_var):
            if not isinstance(value, bool):
                raise TypeError(f"Fact '{var_name}' should be bool, got {type(value).__name__}")
            result.append(z3_var == value)
        elif is_int(z3_var):
            if not isinstance(value, int):
                raise TypeError(f"Fact '{var_name}' should be int, got {type(value).__name__}")
            result.append(z3_var == value)
        elif is_real(z3_var):
            if not isinstance(value, (int, float)):
                raise TypeError(f"Fact '{var_name}' should be float, got {type(value).__name__}")
            result.append(z3_var == RealVal(value))
        else:
            raise TypeError(f"Unknown Z3 variable type for '{var_name}'")
    
    return result