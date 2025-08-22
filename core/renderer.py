from typing import List, Dict, Any
from .schema import VarSpec, ConstraintSpec

TEMPLATE = """\
# Auto-generated Z3 snippet
from z3 import *

s = Solver()

# === Vars ===
{decls}

# === Facts (hard) ===
{facts}

# === Constraints (each rule_*_ok) ===
{rules}

print("Z3 constraints generated. You can s.check() after adding specifics.")
"""

def render_z3_snippet(varspecs: List[VarSpec], facts: Dict[str, Any], constraints: List[ConstraintSpec]) -> str:
    decl_lines = []
    for v in varspecs:
        if v.type == "Real": decl_lines.append(f"{v.name} = Real('{v.name}')")
        elif v.type == "Int": decl_lines.append(f"{v.name} = Int('{v.name}')")
        else: decl_lines.append(f"{v.name} = Bool('{v.name}')")
        if v.domain:
            if v.domain.min is not None: decl_lines.append(f"s.add({v.name} >= {v.domain.min})")
            if v.domain.max is not None: decl_lines.append(f"s.add({v.name} <= {v.domain.max})")

    fact_lines = []
    for k, val in facts.items():
        if isinstance(val, bool):
            fact_lines.append(f"s.add({k} == {str(val)})")
        else:
            fact_lines.append(f"s.add({k} == {val})")

    rule_lines = []
    for c in constraints:
        rule_name = f"{c.id}"
        # 直接把 S-expr 放成註解，方便對照；實際求解建議用 core/dsl.py 的工具編譯
        rule_lines.append(f"# {rule_name}: {c.desc}")
        rule_lines.append(f"# expr: {c.expr}")
        rule_lines.append(f"{rule_name} = Bool('{rule_name}')  # placeholder; compile via DSL in Python runtime")

    return TEMPLATE.format(
        decls="\n".join(decl_lines),
        facts="\n".join(fact_lines),
        rules="\n".join(rule_lines),
    )
