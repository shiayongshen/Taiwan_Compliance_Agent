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
def render_z3_snippet(
    case_id: str,
    varspecs: List[VarSpec],
    facts: Dict[str, Any],
    constraints: List[ConstraintSpec],
) -> str:
    decl_lines = []
    for v in varspecs:
        if v.type == "Real":
            decl_lines.append(f"{v.name} = Real('{v.name}')")
        elif v.type == "Int":
            decl_lines.append(f"{v.name} = Int('{v.name}')")
        else:
            decl_lines.append(f"{v.name} = Bool('{v.name}')")
        if v.domain:
            if getattr(v.domain, "min", None) is not None:
                decl_lines.append(f"s.add({v.name} >= {v.domain.min})")
            if getattr(v.domain, "max", None) is not None:
                decl_lines.append(f"s.add({v.name} <= {v.domain.max})")

    fact_lines = []
    for k, val in facts.items():
        if isinstance(val, bool):
            fact_lines.append(f"s.add({k} == {str(val)})")
        else:
            fact_lines.append(f"s.add({k} == {val})")

    rule_lines = []
    for c in constraints:
        rule_name = f"{c.id}"
        rule_lines.append(f"# {rule_name}: {c.desc}")
        rule_lines.append(f"# expr: {c.expr}")
        rule_lines.append(f"{rule_name} = Bool('{rule_name}')  # placeholder; compile via DSL in runtime")

    return TEMPLATE.format(
        case_id=case_id,
        decls="\n".join(decl_lines),
        facts="\n".join(fact_lines),
        rules="\n".join(rule_lines),
    )
