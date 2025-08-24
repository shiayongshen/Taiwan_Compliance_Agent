import json
import pandas as pd
from pathlib import Path
from config import llm_config
from agents.orchestrator import build_team
from core.schema import VarSpec, ConstraintSpec
from core.renderer import render_z3_snippet
from agents.prompt import COMPLETION_PROMPT_TEMPLATE


GENERATE_Z3CODE_PROMPT = """

你是【Z3 Python Solver 產生器】。

使用者提供兩個 JSON 資料：
1. constraint_spec.json：
{constraint_spec}


2. varspec_facts.json：
{varspec_facts}


請根據以上內容，生成一份 **完整可執行的 Z3 Python 程式碼**，需求如下：

---

📌 要求：

1. 為 constraint_spec 中的每條 constraint：
   - 將其 expr 編譯為 Z3 表達式
   - 使用 `s.assert_and_track(expr, "id")` 加入 solver

2. 為 varspec_facts 中的 facts 值：
   - 使用 `s.add_soft(...)` 加入
   - 型別根據 varspecs 宣告（Real / Int / Bool）

3. 所有 VAR 中的變數都要宣告（從 constraint 與 facts 中取得）

4. 執行 Z3 求解，並：
   - 印出 `penalty` 的值（若存在）
   - 印出解是否 `sat`
   - 若 `unsat`，印出 `unsat_core()`

---

📌 輸出格式要求：
- 只輸出 Python Z3 程式碼（不要加說明文字）
- 使用 `from z3 import *` 開頭
- 按照順序：
  - 宣告變數
  - 建立 solver
  - 加入 soft facts
  - 加入 assert_and_track
  - check() + 印結果

"""

DATA = Path("data/dataset.csv")
OUT = Path("outputs"); OUT.mkdir(parents=True, exist_ok=True)

def extract_atomic_vars(constraints):
    used = set()
    ops = {
        "AND", "OR", "NOT", "EQ", "GE", "LE", "GT", "LT",
        "ADD", "SUB", "MUL", "DIV",
        "SUM", "AVG", "MIN", "MAX",
        "ABS", "POW", "ROUND", "FLOOR", "CEIL", "IFNULL",
        "PERCENT", "CASE", "IMPLIES"
    }

    def walk(expr):
        if isinstance(expr, list):
            if expr and expr[0] == "VAR":
                pass  # 忽略 VAR 節點，因為它是衍生變數引用
            else:
                for e in expr:
                    walk(e)
        elif isinstance(expr, str):
            if expr not in ops and ':' not in expr:
                used.add(expr)

    for c in constraints:
        walk(c["expr"])

    return sorted(used)

def print_dialog_log(title, messages):
    print(f"\n[{title}]")
    for msg in messages:
        role = msg['role'].upper()
        content = msg['content']
        print(f"{role}: {content}\n{'-'*40}")

def main():
    team = build_team(llm_config)
    df = pd.read_csv(DATA)

    for idx, row in df.iterrows():
        case_id = f"case_{idx}"
        case_text = str(row["法律案例"])
        statute_text = str(row["相關法條"])

        ### === 1) 法條解析 ===
        # 第一輪解析
        parser_prompt = f"【相關法條】\n{statute_text}\n——請輸出 ConstraintSpec[]（JSON 陣列）。"
        parser_messages = [{"role": "user", "content": parser_prompt}]
        parser_reply = team["parser"].generate_reply(messages=parser_messages)
        parser_reply_content = parser_reply["content"] if isinstance(parser_reply, dict) else str(parser_reply)
        parser_messages.append({"role": "assistant", "content": parser_reply_content})

        # 第二輪補完解析
        completion_prompt = COMPLETION_PROMPT_TEMPLATE.format(
            statute_text=statute_text,
            existing_constraints=parser_reply_content
        )
        parser_messages.append({"role": "user", "content": completion_prompt})
        completion_reply = team["parser"].generate_reply(messages=parser_messages)
        completion_reply_content = completion_reply["content"] if isinstance(completion_reply, dict) else str(completion_reply)
        parser_messages.append({"role": "assistant", "content": completion_reply_content})

        # 最終 constraint 使用補完結果
        constraints = json.loads(completion_reply_content)
        constraints_obj = [ConstraintSpec(**c) for c in constraints]
        used_vars = extract_atomic_vars(constraints)

        ### === 2) 案例解析 ===
        used_vars_str = ", ".join(used_vars)
        mapper_prompt = (
            f"【法律案例】\n{case_text}\n"
            f"【需用到的變數】\n{used_vars_str}\n"
            "——請輸出 varspecs+facts（JSON 物件）。"
        )
        mapper_messages = [{"role": "user", "content": mapper_prompt}]
        mapper_reply = team["mapper"].generate_reply(messages=mapper_messages)
        mapper_reply_content = mapper_reply["content"] if isinstance(mapper_reply, dict) else str(mapper_reply)
        mapper_messages.append({"role": "assistant", "content": mapper_reply_content})

        mapping = json.loads(mapper_reply_content)
        varspecs = [VarSpec(**v) for v in mapping["varspecs"]]
        facts = mapping["facts"]

        ### === 4) 寫檔 ===
        (OUT / f"{case_id}.constraint_spec.json").write_text(
            json.dumps(constraints, ensure_ascii=False, indent=2), encoding="utf-8"
        )
        (OUT / f"{case_id}.varspec_facts.json").write_text(
            json.dumps(mapping, ensure_ascii=False, indent=2), encoding="utf-8"
        )
        z3_prompt = GENERATE_Z3CODE_PROMPT.format(
            constraint_spec=json.dumps(constraints, ensure_ascii=False, indent=2),
            varspec_facts=json.dumps(mapping, ensure_ascii=False, indent=2)
        )

        z3_response = team["solver"].generate_reply(messages=[{"role": "user", "content": z3_prompt}])
        z3_code = z3_response["content"] if isinstance(z3_response, dict) else str(z3_response)

        (OUT / f"{case_id}.z3.py").write_text(z3_code, encoding="utf-8")


        # 寫入對話 log
        (OUT / f"{case_id}.parser_log.txt").write_text(
            "\n\n".join([f"{m['role'].upper()}: {m['content']}" for m in parser_messages]), encoding="utf-8"
        )
        (OUT / f"{case_id}.mapper_log.txt").write_text(
            "\n\n".join([f"{m['role'].upper()}: {m['content']}" for m in mapper_messages]), encoding="utf-8"
        )

        ### === 印出對話 log ===
        print_dialog_log(f"{case_id} / Parser 對話 Log", parser_messages)
        print_dialog_log(f"{case_id} / Mapper 對話 Log", mapper_messages)

        print(f"[OK] {case_id} → outputs/{case_id}.*")

if __name__ == "__main__":
    main()
