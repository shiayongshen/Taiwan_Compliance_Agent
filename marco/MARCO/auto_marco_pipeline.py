# auto_marco_pipeline.py
# 將 Z3 的 (hard_constraints, soft_constraints) 全自動：
# 1) 轉 SMT2（帶 :named c{i} 標籤）
# 2) 用 MARCO Python API 列舉 MCS 或 MUS
# 3) 只回傳「軟約束」的索引集合（0-based），可直接用來決定要移除哪些軟約束

import os
import sys
import tempfile
from pathlib import Path
from typing import List, Set, Iterable, Literal, Tuple
from z3 import *


# === 這行：把 MARCO repo 的根目錄加到 sys.path ===
# 假設目錄結構：/path/to/MARCO 內有 src/marco/marco.py
# 若你已經能 from src.marco.marco import ...，可以刪掉這段。
MARCO_ROOT = os.environ.get("MARCO_ROOT")  # 你也可以 export MARCO_ROOT=/path/to/MARCO
if MARCO_ROOT and (Path(MARCO_ROOT) / "src" / "marco" / "marco.py").exists():
    sys.path.insert(0, str(Path(MARCO_ROOT)))

try:
    from src.marco.marco import parse_args, enumerate_with_args
except Exception as e:
    raise RuntimeError(
        "無法匯入 MARCO：請設定環境變數 MARCO_ROOT=MARCO repo 路徑，"
        "或確認可 from src.marco.marco import parse_args, enumerate_with_args"
    ) from e


def collect_symbols(constraints):
    """
    掃描一串 Z3 約束，回傳 { z3.Const: z3.Sort } 的字典，涵蓋 Int/Bool 變數。
    """
    seen = {}

    def visit(ast):
        # 只處理 Z3 AST
        if not isinstance(ast, AstRef):
            return
        # 常數且是未解釋符號（使用者宣告的變數）
        if ast.num_args() == 0 and ast.decl().kind() == Z3_OP_UNINTERPRETED:
            if ast not in seen:
                seen[ast] = ast.sort()
        # 遞迴走訪子節點
        for i in range(ast.num_args()):
            visit(ast.arg(i))

    for c in constraints:
        visit(c)
    return seen  # {x: IntSort(), b: BoolSort(), ...}

def dump_to_smt2(path: str, z3_constraints, logic: str = "ALL") -> None:
    """
    將約束輸出為 SMT2：先宣告所有用到的符號，再逐條 assert，並用 :named c{i} 標記。
    """
    constraints = list(z3_constraints)
    syms = collect_symbols(constraints)  # {AstRef -> SortRef}

    with open(path, "w", encoding="utf-8") as f:
        f.write(f"(set-logic {logic})\n")

        # 宣告符號
        # 注意：用 .sexpr() 會得到符號名字（若是 0 參數函數），Sort 用內建名稱
        for sym, srt in syms.items():
            sort_name = "Int" if srt.kind() == Z3_INT_SORT else "Bool" if srt.kind() == Z3_BOOL_SORT else None
            if sort_name is None:
                # 你目前的模型只用到 Int/Bool；若之後有其他 Sort，可以在此擴充
                raise TypeError(f"Unsupported sort in SMT2 dump: {srt}")
            f.write(f"(declare-const {sym.sexpr()} {sort_name})\n")

        # 逐條 assert，並以 :named c{i} 標籤
        for i, c in enumerate(constraints, 1):
            f.write(f"(assert (! {c.sexpr()} :named c{i}))\n")

        f.write("(check-sat)\n")

def run_marco_smt2(
    smt2_file: str,
    kind: Literal["MCS", "MUS", "MSS"] = "MCS",
    threads: int = 4,
):
    """
    以 MARCO Python API 在 SMT2 檔上做列舉。
    回傳 generator：每個結果為 ('C'/'U'/'S', set_of_indices_1_based)
    """
    args_list = [smt2_file, "--threads", str(threads)]
    if kind == "MCS":
        args_list.append("--print-mcses")  # 切到列舉 MCS（行首 'C'）
    # 預設會列 U/MUS 與 S/MSS（若沒加 --print-mcses）

    args = parse_args(args_list)
    # print_results=False -> 回傳 tuple 例 ('C', {3,7})
    return enumerate_with_args(args, print_results=False)


def project_to_soft_only(
    indices_1based: Set[int],
    hard_count: int,
    soft_count: int,
) -> Set[int]:
    """
    將 MARCO 輸出的「整體索引（1-based）」投影成「軟約束的 0-based 索引」。
    總輸入順序 = [hard(1..hard_count), soft(hard_count+1 .. hard_count+soft_count)]
    """
    soft_0_based = set()
    for i in indices_1based:
        if hard_count < i <= hard_count + soft_count:
            soft_0_based.add(i - hard_count - 1)
    return soft_0_based


def enumerate_soft_sets(
    hard_constraints: List,
    soft_constraints: List,
    kind: Literal["MCS", "MUS", "MSS"] = "MCS",
    threads: int = 4,
) -> Iterable[Tuple[str, Set[int]]]:
    """
    直接接 Z3 的 hard/soft，回傳一個 iterator：
    其中每個元素為 (typ, soft_index_set_0_based)
      - typ ∈ {'C','U','S'} 分別對應 MCS, MUS, MSS
      - set 是「軟約束的 0-based 索引」
    """
    with tempfile.TemporaryDirectory(prefix="marco_smt2_") as td:
        smt2 = str(Path(td) / "input.smt2")
        # 按 「硬 + 軟」的順序輸出，方便之後投影
        dump_to_smt2(smt2, list(hard_constraints) + list(soft_constraints))
        gen = run_marco_smt2(smt2, kind=kind, threads=threads)
        for typ, idx_set_1based in gen:
            soft_set = project_to_soft_only(idx_set_1based, len(hard_constraints), len(soft_constraints))
            yield typ, soft_set


def pick_minimum_soft_set(
    hard_constraints: List,
    soft_constraints: List,
    kind: Literal["MCS", "MUS"] = "MCS",
    threads: int = 4,
) -> Set[int]:
    """
    在列舉結果中挑一個「軟約束部分尺寸最小」的集合（常用於找一組最小要刪的軟約束/MCS）。
    """
    best = None
    for typ, s in enumerate_soft_sets(hard_constraints, soft_constraints, kind=kind, threads=threads):
        if typ != ("C" if kind == "MCS" else "U"):
            continue
        if best is None or len(s[1]) < len(best):
            best = s[1]
    return best or set()
