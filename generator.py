import json
from generate_z3_code_from_constraints import generate_z3_solver_code  # 你剛剛寫的函式

# 讀取 constraint_spec.json
with open("outputs/case_0.constraint_spec.json", "r", encoding="utf-8") as f:
    constraint_spec = json.load(f)

# 讀取 varspec_facts.json
with open("outputs/case_0.varspec_facts.json", "r", encoding="utf-8") as f:
    varspec_facts = json.load(f)

# 產生 Z3 程式碼
z3_code = generate_z3_solver_code(constraint_spec, varspec_facts)

# 輸出成 .py 檔
with open("solver_output.z3.py", "w", encoding="utf-8") as f:
    f.write(z3_code)

print("✅ Z3 solver code written to solver_output.z3.py")