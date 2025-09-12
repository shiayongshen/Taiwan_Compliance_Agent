import json

def validate_constraints(constraints, build_expr, z3_vars):
    """檢查所有 constraints，收集錯誤"""
    errors = []
    for i, c in enumerate(constraints):
        try:
            build_expr(c["expr"], z3_vars)
        except Exception as e:
            errors.append({
                "index": i,
                "id": c.get("id", f"c{i}"),
                "expr": c["expr"],
                "error": str(e),
            })
    return errors


def repair_with_agent(team, constraint, error):
    """針對單一 constraint 呼叫 ConstraintRepairAgent 修復"""
    print(f"修復 index={error['index']} 的錯誤: {error['error']}")
    repair_input = f"""
錯誤訊息:
{json.dumps(error, ensure_ascii=False, indent=2)}

原始 Constraint:
{json.dumps(constraint, ensure_ascii=False, indent=2)}

請僅輸出修正後的單一 ConstraintSpec JSON 物件，不要包陣列。
"""
    repair_reply = team["repair"].generate_reply(
        messages=[{"role": "user", "content": repair_input}]
    )
    repaired = repair_reply["content"] if isinstance(repair_reply, dict) else str(repair_reply)
    return json.loads(repaired)


def repair_loop(team, constraints, build_expr, z3_vars, max_iter=3):
    """逐條修復直到沒有錯誤或達到最大次數"""
    for _ in range(max_iter):
        errors = validate_constraints(constraints, build_expr, z3_vars)
        if not errors:
            return constraints

        for error in errors:
            idx = error["index"]
            repaired_constraint = repair_with_agent(team, constraints[idx], error)
            constraints[idx] = repaired_constraint  # 只替換這一條
            break  # 修完一條就重新驗證

    raise RuntimeError("修復失敗，仍有錯誤存在")
