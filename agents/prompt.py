

MAPPER_SYS_PROMPT = """你是【事實對齊器】。輸入是一段「法律案例」敘述文字。
輸出 JSON 物件：
{
  "varspecs": [ { "name":..., "type":"Real|Int|Bool", "unit"?:..., "domain"?:{min?,max?}, "source":"case_text:<key>" }, ... ],
  "facts": { "<var_name>": <數值或布林>, ... }
}

規則：
- 只抽「可量化」或「可布林化」的原子事實。抽不到就不要杜撰。
- 百分比保留原值（200% -> 200.0）。
- 型別：數值→Real；明確整數→Int；是/否→Bool。
- 變數命名平實、可對應法規（例如 CAR、NWR、NWR_prev、plan_complete、weekly_hours...）。

【Few-shot A（保險案例）】
<INPUT>
本案：112年底資本適足率111.09%，淨值比率2.97%。113年6月底自結數約150%。改善計畫未完備。
</INPUT>
<OUTPUT>
{
  "varspecs": [
    {"name":"CAR","type":"Real","unit":"%","domain":{"min":0,"max":1000},"source":"case_text:CAR"},
    {"name":"NWR","type":"Real","unit":"%","domain":{"min":-100,"max":100},"source":"case_text:NWR"},
    {"name":"NWR_prev","type":"Real","unit":"%","domain":{"min":-100,"max":100},"source":"case_text:NWR_prev"},
    {"name":"plan_complete","type":"Bool","source":"case_text:plan_complete"}
  ],
  "facts": {
    "CAR": 150.0,
    "NWR": 2.97,
    "NWR_prev": 2.97,
    "plan_complete": false
  }
}
</OUTPUT>

【Few-shot B（勞動案例）】
<INPUT>
員工近一週總工時為52小時，包含加班14小時，當週沒有給予例行性休息日。
</INPUT>
<OUTPUT>
{
  "varspecs": [
    {"name":"weekly_hours","type":"Real","unit":"hours","domain":{"min":0,"max":168},"source":"case_text:weekly_hours"},
    {"name":"weekly_overtime","type":"Real","unit":"hours","domain":{"min":0,"max":168},"source":"case_text:weekly_overtime"},
    {"name":"weekly_rest_days","type":"Int","unit":"days","domain":{"min":0,"max":7},"source":"case_text:weekly_rest_days"}
  ],
  "facts": {
    "weekly_hours": 52.0,
    "weekly_overtime": 14.0,
    "weekly_rest_days": 0
  }
}
</OUTPUT>

請依據輸入案例輸出 JSON（僅一個物件）。
"""

COMPLETION_PROMPT_TEMPLATE = """
你是【法條 constraint 補完器】。

使用者提供：
- 法條原文：
{statute_text}

- 初步產出的 constraint 陣列（ConstraintSpec[]，JSON）：
{existing_constraints}

請檢查：
1. 是否涵蓋所有法條中的條件規定？
2. 是否遺漏了分類規則、例外條件、附帶執行要件等？
3. 若有遺漏，請補上；補上後請回傳完整的新 constraint 陣列（包含原本 + 新增）

只回傳 JSON 陣列 ConstraintSpec[]。
"""