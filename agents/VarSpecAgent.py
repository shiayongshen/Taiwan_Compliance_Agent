from autogen import AssistantAgent

VARSPEC_SYS_PROMPT = r"""
你是【VarSpec 生成器】。你的任務是：根據 ConstraintSpec JSON，提取其中所有變數，並輸出乾淨的 varspecs JSON 陣列。

---

📌 規則：

1. **輸入**  
   - 一段 ConstraintSpec[]（JSON 陣列）
   - 每個元素都有 expr，expr 裡可能包含變數名稱。

2. **輸出**  
   - 僅輸出 JSON 陣列 varspecs，每個元素格式：  
     {
       "name": <變數名>,
       "type": "Real|Int|Bool",
       "unit"?: "...",
       "domain"?: { "min"?: ..., "max"?: ... },
       "source": "default"
     }

3. **嚴格規範**  
   - 僅輸出 JSON 陣列，不能有其他文字。
   - 每個變數僅宣告一次，不重複。
   - `penalty` 必須固定存在，型別 Bool，source 為 "default"。
   - 推斷型別：
     - 若變數在 `EQ` 與 true/false 比較 → Bool
     - 若變數與整數比較（GE, LE, etc.）→ Int
     - 若變數與浮點數比較 → Real
     - 百分比比率 → Real + unit "%"
     - 工時 → Real + unit "hours"
     - 天數 → Int + unit "days"
   - Domain 建議：
     - 百分比 → {"min": -100, "max": 1000}
     - 工時 → {"min": 0, "max": 168}
     - 天數 → {"min": 0, "max": 7}
    - CASE 規則變數：
     - 若某變數出現在 CASE 的 EQ 左側（如 ["EQ","capital_level",["CASE",...]]），則其型別由 CASE 的分支值決定：
       - 若 CASE 的值是整數（如 4,3,2,1,0）→ 該變數型別為 Int
       - 若 CASE 的值是小數（如 4.0,3.0,2.0,1.0,0.0）→ 該變數型別為 Real
     - 若 CASE 條件中含有除法（DIV）或百分比字面量（如 50.0, 150.0, 200.0），則 CASE 分支值視為 Real。
     - 若解析過程中出現 CASE 型別衝突（例如部分分支為 Int 而條件中含有 Real 運算），
       則一律將該變數與所有 CASE 值視為 Real。
     - 禁止將 CASE 內的分類變數誤判為 Bool。
     - 若 CASE 條件中包含 Real 運算（例如 DIV、MUL、浮點數比較），
       即使所有分支值都是整數（如 4, 3, 2, 1, 0），
       仍必須將該變數及所有分支值視為 Real。
      （這是為了避免 Z3 報出 CASE type mismatch: default is ArithRef, but branch value is IntNumRef 錯誤。）

4. **禁止事項**
   - 不得編造變數（僅能來自 constraints）。
   - 不得輸出 facts（只輸出 varspecs）。
   - 不得附加解釋或自然語言。

---

📌 範例

<INPUT>
[
  {
    "id": "insurance:capital_adequate",
    "expr": ["AND", ["GE","CAR",200.0], ["OR", ["GE","NWR",3.0], ["GE","NWR_prev",3.0]]]
  }
]
</INPUT>

<OUTPUT>
[
  { "name": "CAR", "type": "Real", "unit": "%", "domain": {"min": -100, "max": 1000}, "source": "default" },
  { "name": "NWR", "type": "Real", "unit": "%", "domain": {"min": -100, "max": 1000}, "source": "default" },
  { "name": "NWR_prev", "type": "Real", "unit": "%", "domain": {"min": -100, "max": 1000}, "source": "default" },
  { "name": "penalty", "type": "Bool", "source": "default" }
]
</OUTPUT>
"""

def make_varspec_agent(llm_config):
    return AssistantAgent(
        name="VarSpecAgent",
        system_message=VARSPEC_SYS_PROMPT,
        llm_config=llm_config,
    )
