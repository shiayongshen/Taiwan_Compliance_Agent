from typing import List, Dict, Any, Set, Union

Z3_OP = {
    "AND": "And",
    "OR": "Or",
    "NOT": "Not",
    "EQ": "==",
    "GE": ">=",
    "LE": "<=",
    "GT": ">",
    "LT": "<",
    "ADD": "+",
    "SUB": "-",
    "MUL": "*",
    "DIV": "/",
    "VAR": "VAR",
    "CASE": "CASE"
}


def extract_vars(expr: Any, var_set: Set[str]):
    if isinstance(expr, list):
        if expr[0] == "VAR":
            var_set.add(expr[1])
        elif expr[0] == "CASE":
            for i in range(1, len(expr) - 1, 2):
                extract_vars(expr[i], var_set)
        else:
            for sub in expr[1:]:
                extract_vars(sub, var_set)


def collect_all_vars(constraints: List[Dict[str, Any]]) -> Set[str]:
    vars_used = set()
    for c in constraints:
        extract_vars(c["expr"], vars_used)
    return vars_used


def convert_expr(expr: Any) -> str:
    if isinstance(expr, list):
        op = expr[0]
        if op == "VAR":
            return expr[1].replace(":", "_")
        elif op == "CASE":
            parts = expr[1:]
            default = repr(parts[-1])
            for i in range(len(parts) - 2, 0, -2):
                cond = convert_expr(parts[i - 1])
                val = repr(parts[i])
                default = f"If({cond}, {val}, {default})"
            return default
        elif op in {"ADD", "SUB", "MUL", "DIV"}:
            args = [convert_expr(a) for a in expr[1:]]
            return f"({f' {Z3_OP[op]} '.join(args)})"
        elif op in {"AND", "OR"}:
            args = ", ".join(convert_expr(a) for a in expr[1:])
            return f"{Z3_OP[op]}({args})"
        elif op == "NOT":
            return f"Not({convert_expr(expr[1])})"
        elif op in {"EQ", "GE", "LE", "GT", "LT"}:
            a = convert_expr(expr[1])
            b = convert_expr(expr[2])
            return f"({a} {Z3_OP[op]} {b})"
        else:
            raise ValueError(f"Unknown operator: {op}")
    elif isinstance(expr, str):
        return expr.replace(":", "_")
    else:
        return str(expr)


def generate_z3_solver_code(
    constraints: List[Dict[str, Any]],
    varspec_facts: Dict[str, Any]
) -> str:
    varspecs = varspec_facts["varspecs"]
    facts = varspec_facts["facts"]

    # Build var type map
    var_type_map = {}
    for var in varspecs:
        var_type_map[var["name"]] = var["type"]

    # Gather all vars from constraints
    used_vars = collect_all_vars(constraints)

    # Add fact vars (some might not appear in expr)
    used_vars.update(facts.keys())

    code = []
    code.append("from z3 import *")

    # Variable declarations
    code.append("\n# === Variable Declarations ===")
    for var in sorted(used_vars):
        z3name = var.replace(":", "_")
        vtype = var_type_map.get(var, "Real")
        if vtype == "Real":
            code.append(f"{z3name} = Real('{z3name}')")
        elif vtype == "Int":
            code.append(f"{z3name} = Int('{z3name}')")
        elif vtype == "Bool":
            code.append(f"{z3name} = Bool('{z3name}')")
        elif vtype == "String":
            code.append(f"{z3name} = String('{z3name}')")
        else:
            code.append(f"# Unknown type for {z3name}, defaulting to Real")
            code.append(f"{z3name} = Real('{z3name}')")

    # Solver
    code.append("\n# === Solver ===")
    code.append("s = Optimize()")

    # Soft facts
    code.append("\n# === Soft Constraints (facts) ===")
    for name, value in facts.items():
        z3name = name.replace(":", "_")
        vtype = var_type_map.get(name, "Real")
        if vtype == "Bool":
            val = "True" if value else "False"
            code.append(f"s.add_soft({z3name} == {val})")
        else:
            code.append(f"s.add_soft({z3name} == {value})")

    # Constraints
    code.append("\n# === Hard Constraints ===")
    for c in constraints:
        expr_code = convert_expr(c["expr"])
        if isinstance(c["expr"], list) and c["expr"][0] == "CASE":
            # 特殊處理 CASE：把結果綁定給變數（根據 constraint id）
            var_name = c["id"].replace(":", "_")
            constraint_code = f"{var_name} == {expr_code}"
        else:
            constraint_code = expr_code
        code.append(f's.assert_and_track({constraint_code}, "{c["id"]}")')

    # Solve
    code.append("\n# === Solve ===")
    code.append("result = s.check()")
    code.append("print('Result:', result)")
    code.append("if result == sat:")
    code.append("    m = s.model()")
    code.append("    for d in m.decls():")
    code.append("        print(f\"{d.name()} =\", m[d])")
    code.append("else:")
    code.append("    print('UNSAT')")
    code.append("    print('Unsat core:', s.unsat_core())")

    return "\n".join(code)

