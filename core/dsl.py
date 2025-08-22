from z3 import Real, Int, Bool, And, Or, Not

def z3_var(vtype, name):
    return {"Real": Real, "Int": Int, "Bool": Bool}[vtype](name)

def compile_s_expr(ast, env):
    op = ast[0]
    if op == "AND": return And(*[compile_s_expr(x, env) for x in ast[1:]])
    if op == "OR":  return Or(*[compile_s_expr(x, env) for x in ast[1:]])
    if op == "NOT": return Not(compile_s_expr(ast[1], env))
    if op == "GE":  return env[ast[1]] >= ast[2]
    if op == "LE":  return env[ast[1]] <= ast[2]
    if op == "GT":  return env[ast[1]] >  ast[2]
    if op == "LT":  return env[ast[1]] <  ast[2]
    if op == "EQ":  return env[ast[1]] == ast[2]
    if op == "VAR": return env[ast[1]]
    raise ValueError(f"Unknown op: {op}")
