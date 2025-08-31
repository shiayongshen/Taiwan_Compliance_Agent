import subprocess
import tempfile
from pathlib import Path
from z3 import *
import pulp

def dump_to_smt2(path: str, hard_constraints, soft_constraints):
    all_constraints = list(hard_constraints) + list(soft_constraints)
    syms = {}
    def visit(ast):
        if not isinstance(ast, AstRef):
            return
        if ast.num_args() == 0 and ast.decl().kind() == Z3_OP_UNINTERPRETED:
            syms[ast] = ast.sort()
        for i in range(ast.num_args()):
            visit(ast.arg(i))
    for c in all_constraints:
        visit(c)

    with open(path, "w") as f:
        f.write("(set-logic ALL)\n")
        for sym, srt in syms.items():
            if srt.kind() == Z3_INT_SORT:
                f.write(f"(declare-const {sym.sexpr()} Int)\n")
            elif srt.kind() == Z3_BOOL_SORT:
                f.write(f"(declare-const {sym.sexpr()} Bool)\n")
            elif srt.kind() == Z3_REAL_SORT:
                f.write(f"(declare-const {sym.sexpr()} Real)\n")
            else:
                raise ValueError(f"Unknown sort: {srt}")
        for i, c in enumerate(all_constraints, 1):
            f.write(f"(assert (! {c.sexpr()} :named c{i}))\n")
        f.write("(check-sat)\n")

def run_marco_cli(hard_constraints, soft_constraints, kind="MUS"):
    with tempfile.TemporaryDirectory() as td:
        smt2_file = Path(td) / "input.smt2"
        dump_to_smt2(smt2_file, hard_constraints, soft_constraints)

        cmd = ["python3", "marco.py", str(smt2_file), "--threads", "1", "-v"]
        if kind == "MCS":
            cmd.append("--print-mcses")

        proc = subprocess.run(cmd, capture_output=True, text=True, cwd=Path(__file__).parent)
        if proc.returncode != 0:
            raise RuntimeError("MARCO failed:\n" + proc.stderr)

        results = []
        for line in proc.stdout.splitlines():
            line = line.strip()
            if not line:
                continue
            typ, *nums = line.split()
            if kind == "MCS" and typ == "C":
                results.append({int(x) for x in nums})
            elif kind == "MUS" and typ == "U":
                results.append({int(x) for x in nums})
        return results

def project_to_soft(mus, hard_count, soft_count):
    """將 MUS 投影到 soft constraints index"""
    return {i - hard_count - 1 for i in mus if hard_count < i <= hard_count + soft_count}

def compute_mhs_with_ilp(mus_list, soft_count, exclude=set()):
    """
    回傳一個最優的 Minimal Hitting Set (單解)
    """
    model = pulp.LpProblem("Minimal_Hitting_Set", pulp.LpMinimize)
    x = {i: pulp.LpVariable(f"x_{i}", cat="Binary") for i in range(soft_count) if i not in exclude}

    model += pulp.lpSum(x[i] for i in x)

    for mus in mus_list:
        valid_vars = [x[i] for i in mus if i in x]
        if valid_vars:
            model += pulp.lpSum(valid_vars) >= 1

    model.solve(pulp.PULP_CBC_CMD(msg=0))
    if pulp.LpStatus[model.status] != "Optimal":
        return []
    return [i for i in x if pulp.value(x[i]) == 1]


def enumerate_all_mhs_ilp(mus_list, soft_count, exclude=set()):
    """
    列舉所有 Minimal Hitting Sets (多解)
    """
    results = []

    def solve_ilp(blocking_constraints):
        model = pulp.LpProblem("Minimal_Hitting_Set", pulp.LpMinimize)
        x = {i: pulp.LpVariable(f"x_{i}", cat="Binary") for i in range(soft_count) if i not in exclude}

        model += pulp.lpSum(x[i] for i in x)

        for mus in mus_list:
            valid_vars = [x[i] for i in mus if i in x]
            if valid_vars:
                model += pulp.lpSum(valid_vars) >= 1

        for bc in blocking_constraints:
            model += pulp.lpSum(x[i] for i in bc if i in x) <= len(bc) - 1

        model.solve(pulp.PULP_CBC_CMD(msg=0))
        if pulp.LpStatus[model.status] != "Optimal":
            return None
        return {i for i in x if pulp.value(x[i]) == 1}

    blocking_constraints = []
    while True:
        sol = solve_ilp(blocking_constraints)
        if sol is None:
            break
        results.append(sol)
        blocking_constraints.append(sol)

    return results

def pretty_print_results(hard_constraints, soft_constraints):
    mus_list = run_marco_cli(hard_constraints, soft_constraints, kind="MUS")
    hard_n, soft_n = len(hard_constraints), len(soft_constraints)

    print(f"=== 所有 MUS (原始索引) ===")
    for idx_set in mus_list:

        # 映射到軟約束索引
        soft_set = project_to_soft(idx_set, hard_n, soft_n)

        # 映射到硬約束索引 (0-based)
        hard_set = {i - 1 for i in idx_set if i <= hard_n}

        print("MUS 硬約束索引", sorted(hard_set))
        print("MUS 軟約束索引", sorted(soft_set))

        if hard_set:
            print("對應硬約束公式:")
            for i in sorted(hard_set):
                print(f"  - hard[{i}]: {hard_constraints[i]}")

        if soft_set:
            print("對應軟約束公式:")
            for i in sorted(soft_set):
                print(f"  - soft[{i}]: {soft_constraints[i]}")

        print("="*60)

    # 投影後只留 soft 部分
    mus_soft = [project_to_soft(mus, hard_n, soft_n) for mus in mus_list if project_to_soft(mus, hard_n, soft_n)]

    print("\n=== 投影到 Soft constraints 的 MUS 集合族 ===")
    for mus in mus_soft:
        print(mus)

    # 找 penalty 的 index
    exclude = {i for i, c in enumerate(soft_constraints) if str(c).startswith("penalty")}

    mhs = compute_mhs_with_ilp(mus_soft, soft_n, exclude=exclude)
    print("\n=== 單一 Minimal Hitting Set (候選 MCS，不含 penalty) ===")
    print("Soft indices:", mhs)
    for i in mhs:
        print(f" - soft[{i}]: {soft_constraints[i]}")

    # 多解
    all_mhs = enumerate_all_mhs_ilp(mus_soft, soft_n, exclude=exclude)
    print("\n=== 所有 Minimal Hitting Sets (候選 MCS，不含 penalty) ===")
    for sol in all_mhs:
        print("Soft indices:", sorted(sol))
        for i in sorted(sol):
            print(f" - soft[{i}]: {soft_constraints[i]}")
        print("----")
        


# --- Demo ---
if __name__ == "__main__":
    CAR = Real('CAR')
    NWR = Real('NWR')
    NWR_prev = Real('NWR_prev')
    avg_compensation_12m = Real('avg_compensation_12m')
    equity = Real('equity')
    net_worth = Real('net_worth')
    own_capital = Real('own_capital')
    responsible_person_compensation = Real('responsible_person_compensation')
    risk_capital = Real('risk_capital')
    tier1_restricted_capital = Real('tier1_restricted_capital')
    tier1_unrestricted_capital = Real('tier1_unrestricted_capital')
    tier2_capital = Real('tier2_capital')
    total_assets_excl_investment = Real('total_assets_excl_investment')
    penalty = Bool('penalty')

    insurance_capital_adequate_ok = Bool('insurance:capital_adequate_ok')
    insurance_capital_inadequate = Bool('insurance:capital_inadequate')
    insurance_capital_significantly_inadequate = Bool('insurance:capital_significantly_inadequate')
    insurance_capital_severely_inadequate = Bool('insurance:capital_severely_inadequate')
    insurance_capital_classification = Int('insurance:capital_classification')
    insurance_car_calculation = Bool('insurance:car_calculation')
    insurance_nwr_calculation = Bool('insurance:nwr_calculation')
    insurance_improvement_plan_required = Bool('insurance:improvement_plan_required')
    insurance_improvement_plan_execution = Bool('insurance:improvement_plan_execution')
    insurance_inadequate_next_level_measures = Bool('insurance:inadequate_next_level_measures')
    insurance_inadequate_product_restriction = Bool('insurance:inadequate_product_restriction')
    insurance_inadequate_fund_usage_restriction = Bool('insurance:inadequate_fund_usage_restriction')
    insurance_inadequate_compensation_restriction = Bool('insurance:inadequate_compensation_restriction')
    insurance_significantly_inadequate_measures = Bool('insurance:significantly_inadequate_measures')
    insurance_significantly_inadequate_dismiss = Bool('insurance:significantly_inadequate_dismiss')
    insurance_significantly_inadequate_suspend = Bool('insurance:significantly_inadequate_suspend')
    insurance_significantly_inadequate_asset_approval = Bool('insurance:significantly_inadequate_asset_approval')
    insurance_significantly_inadequate_asset_disposal = Bool('insurance:significantly_inadequate_asset_disposal')
    insurance_significantly_inadequate_related_party = Bool('insurance:significantly_inadequate_related_party')
    insurance_significantly_inadequate_compensation_reduction = Bool('insurance:significantly_inadequate_compensation_reduction')
    insurance_significantly_inadequate_branch_restriction = Bool('insurance:significantly_inadequate_branch_restriction')
    insurance_severely_inadequate_measures = Bool('insurance:severely_inadequate_measures')
    insurance_severely_inadequate_special_measures = Bool('insurance:severely_inadequate_special_measures')
    insurance_own_capital_composition = Bool('insurance:own_capital_composition')
    insurance_capital_compliance_ok = Bool('insurance_capital_compliance_ok')

    # -------------------------------
    # Soft constraints (Facts)
    # -------------------------------
    soft_constraints = [
        CAR == 150.0,
        NWR == 2.97,
        NWR_prev == 2.97,
        penalty == False
    ]

# -------------------------------
# Hard constraints (Laws)
# -------------------------------
    hard_constraints = [
    # 分類條件 (iff 定義)
    insurance_capital_adequate_ok == And(
        CAR >= 200.0,
        Or(NWR >= 3.0, NWR_prev >= 3.0)
    ),

    insurance_capital_inadequate == Or(
        And(CAR >= 150.0, CAR < 200.0),
        And(NWR < 3.0, NWR_prev < 3.0,
            Or(NWR >= 2.0, NWR_prev >= 2.0))
    ),

    insurance_capital_significantly_inadequate == Or(
        And(CAR >= 50.0, CAR < 150.0),
        And(NWR < 2.0, NWR_prev < 2.0,
            NWR >= 0.0, NWR_prev >= 0.0)
    ),

    insurance_capital_severely_inadequate == Or(
        CAR < 50.0,
        net_worth < 0.0
    ),

    # 完全覆蓋 + 互斥條件
    Or(
        insurance_capital_adequate_ok,
        insurance_capital_inadequate,
        insurance_capital_significantly_inadequate,
        insurance_capital_severely_inadequate
    ),

    AtMost(
        insurance_capital_adequate_ok,
        insurance_capital_inadequate,
        insurance_capital_significantly_inadequate,
        insurance_capital_severely_inadequate, 1
    ),

    # 新增合規條件 (財閥合格)
    insurance_capital_compliance_ok == And(
        CAR > 200.0,
        NWR > 3.0,
        NWR_prev > 3.0
    ),

    # 其他公式保持不變
    CAR == (own_capital / risk_capital) * 100.0,
    NWR == (equity / total_assets_excl_investment) * 100.0,
    own_capital == tier1_unrestricted_capital + tier1_restricted_capital + tier2_capital,

    # 🔒 Penalty 限制
    penalty == Not(insurance_capital_compliance_ok)
]
    pretty_print_results(hard_constraints, soft_constraints)
