import json
import pandas as pd
from pathlib import Path
from config import llm_config
from agents.orchestrator import build_team
from core.schema import VarSpec, ConstraintSpec
from core.renderer import render_z3_snippet

DATA = Path("data/dataset.csv")
OUT = Path("outputs"); OUT.mkdir(parents=True, exist_ok=True)

def main():
    team = build_team(llm_config)
    df = pd.read_csv(DATA)

    for idx, row in df.iterrows():
        case_id = f"case_{idx+1}"
        case_text = str(row["法律案例"])
        statute_text = str(row["相關法條"])

        # 1) 法條 → ConstraintSpec[]
        parser_prompt = f"【相關法條】\n{statute_text}\n——請輸出 ConstraintSpec[]（JSON 陣列）。"
        parser_out = team["parser"].generate_reply(parser_prompt).strip()
        constraints = json.loads(parser_out)
        constraints_obj = [ConstraintSpec(**c) for c in constraints]

        # 2) 案例 → VarSpec[] + facts
        mapper_prompt = f"【法律案例】\n{case_text}\n——請輸出 varspecs+facts（JSON 物件）。"
        mapper_out = team["mapper"].generate_reply(mapper_prompt).strip()
        mapping = json.loads(mapper_out)
        varspecs = [VarSpec(**v) for v in mapping["varspecs"]]
        facts = mapping["facts"]

        # 3) 產 Z3 片段（僅宣告 & facts & rule 名稱；實際求值可用 core/dsl.compile_s_expr）
        z3_code = render_z3_snippet(case_id, varspecs, facts, constraints_obj)

        # 4) 落地
        (OUT / f"{case_id}.constraint_spec.json").write_text(
            json.dumps(constraints, ensure_ascii=False, indent=2), encoding="utf-8"
        )
        (OUT / f"{case_id}.varspec_facts.json").write_text(
            json.dumps(mapping, ensure_ascii=False, indent=2), encoding="utf-8"
        )
        (OUT / f"{case_id}.z3.py").write_text(z3_code, encoding="utf-8")

        print(f"[OK] {case_id} → outputs/{case_id}.*")

if __name__ == "__main__":
    main()
