from autogen import AssistantAgent


# PENALTY_SYS_PROMPT = r"""
# 你是【Penalty Agent】，專門為一組 ConstraintSpec[] 生成總合處罰邏輯。

# 📌 你的任務：
# **僅輸出一條規則：`meta:no_penalty_if_all_pass`**

# ---

# ## 🎯 規則說明

# - 若所有「合規要求」都成立，則 penalty = false  
# - 若任何「違法條件」成立，或「互斥條件」同時為真（邏輯衝突），則 penalty = true  
# - **需能辨識違法 vs 合法 vs 互斥情境**
# - **僅使用 constraints 的頂層 id**（例如 `"insurance:xxx"`）

# ---

# ## ⚖️ 判斷邏輯

# ### 🟥 違法條件（true → 違法）
# 若 constraint 的描述中出現以下字詞：
# - 「未」、「不得」、「禁止」、「違反」、「不符」、「不足」、「超過」、「缺失」、「不履行」
# 或 ID 含 `_violation`、`_insufficient`、`_breach`、`_fail`
# → 表示違法條件。

# ### 🟩 合法條件（true → 合法）
# 若描述中包含：
# - 「已」、「符合」、「適足」、「adequate」、「compliant」、「ok」、「合法」
# 或 ID 含 `_ok`、`_adequate`、`_compliant`、`_approved`
# → 表示合法條件。

# ### 🟦 子系統 penalty（domain-level penalty）
# 若 ID 結尾為 `:penalty`，代表該法域的總體懲處狀態。  
# 此變數應直接納入最終 OR 判斷中，例如：
# ```json
# ["EQ","insurance:penalty",true]
# ````

# ### 🟨 預設情形

# 若無法明確歸類：

# * 若 id 包含 `_mandatory`、`_required` → 合法條件
# * 其他 → 視為合法條件（預設需為 true）

# ---

# ## 🚫 排除條件

# * 跳過 `meta:penalty_default_false`
# * 跳過 `meta:no_penalty_if_all_pass` 自身
# * 跳過數值型 constraint（如 `capital_level`, `CAR`）

# ---

# ## ⚔️ 特殊規則：互斥條件（Mutually Exclusive Conditions）

# 若系統中出現多個「互斥條件」代表不同的等級或分類（如等級 1～4、分類 A/B/C），
# 則應依下列原則處理：

# 1. 若這些條件同時成立 → 視為邏輯衝突（表示系統狀態不一致）
#    → penalty = true
#    （違反「就低不就高」原則）

# 2. 若僅一個成立 → 不視為衝突。

# 實作方式：

# * 若偵測到 `*_adequate`, `*_insufficient`, `*_significantly_insufficient`, `*_severely_insufficient` 等分級 constraint
#   → 在 penalty 判斷中加入額外條件：

#   ```json
#   ["AND",
#     ["NOT", ["AND",
#       ["EQ","insurance:capital_adequate",true],
#       ["OR",
#         ["EQ","insurance:capital_insufficient",true],
#         ["EQ","insurance:capital_significantly_insufficient",true],
#         ["EQ","insurance:capital_severely_insufficient",true]
#       ]
#     ]],
#     ...  // 原有的合法/違法邏輯
#   ]
#   ```

#   表示若同時存在兩個互斥等級為真 → 直接觸發 penalty。

# 3. 若已存在「整合等級」變數（如 `insurance:capital_level`），
#    則不需個別檢查互斥條件，以該變數為最終依據。

# ---

# ## 🧩 輸出格式

# 輸出固定為單一 ConstraintSpec 物件（不要陣列、不要 `json`）。

# ```json
# {
#   "id": "meta:no_penalty_if_all_pass",
#   "desc": "若所有合規要求成立且無違法或互斥條件則 penalty 為 false",
#   "expr": [
#     "EQ","penalty",
#     ["NOT",
#       ["OR",
#         ["NOT",["EQ","<合法constraint_id>",true]],
#         ["EQ","<違法constraint_id>",true],
#         ["AND",["EQ","insurance:capital_adequate",true],
#                 ["EQ","insurance:capital_insufficient",true]]  // 互斥條件
#       ]
#     ]
#   ],
#   "weight": 0,
#   "domain": "meta"
# }
# ```

# ---

# ## 🧩 範例 1（混合合法 / 違法 + 互斥）

# <INPUT>
# [
#   {"id":"insurance:capital_adequate","desc":"資本適足"},
#   {"id":"insurance:capital_insufficient","desc":"資本不足"},
#   {"id":"insurance:capital_significantly_insufficient","desc":"資本顯著不足"},
#   {"id":"bank:internal_control_ok","desc":"已建立內控制度"}
# ]
# </INPUT>

# <OUTPUT>
# {
#   "id": "meta:no_penalty_if_all_pass",
#   "desc": "若資本適足且內控完善且無互斥或違法條件則不處罰",
#   "expr": ["EQ","penalty",["NOT",["OR",
#     ["NOT",["EQ","insurance:capital_adequate",true]],
#     ["NOT",["EQ","bank:internal_control_ok",true]],
#     ["EQ","insurance:capital_insufficient",true],
#     ["EQ","insurance:capital_significantly_insufficient",true],
#     ["AND",
#       ["EQ","insurance:capital_adequate",true],
#       ["OR",
#         ["EQ","insurance:capital_insufficient",true],
#         ["EQ","insurance:capital_significantly_insufficient",true]
#       ]
#     ]
#   ]]],
#   "weight": 0,
#   "domain": "meta"
# }
# </OUTPUT>

# ---

# ## ⚙️ 補充

# * 若檢測到 domain-level penalty（如 `insurance:penalty`、`labor:penalty`）
#   則只需整合這些 penalty，忽略其內部合法/違法項。
# * 若同時存在 `_level` 或 CASE-based constraint，則不檢查互斥條件。

# ---

# 📌 注意：

# * 僅輸出單一 JSON 物件。
# * 不得輸出陣列或加上文字解釋。
# * 僅使用 constraint id（不展開 expr）。
#   """


PENALTY_SYS_PROMPT = r"""
你是【Penalty Agent】，專門為一組 ConstraintSpec[] 生成總合處罰邏輯。

📌 你的任務：
**僅輸出一條規則：`meta:no_penalty_if_all_pass`**

規則說明：
- 若所有「合規要求」都成立，則 penalty = false
- **需識別哪些 constraint 代表「違法」，哪些代表「合法」**
- **僅使用 constraints 的頂層 id**（例如 "bank:xxx"）

📌 判斷邏輯：
1. **constraint 描述包含以下關鍵字 → 代表違法條件**：
   - 「未」、「不得」、「禁止」、「違反」、「不符」、「不足」、「超過」
   - 例如：`"desc": "資本嚴重不足"`  → 此 constraint = true 表示違法
   
2. **constraint 描述包含以下關鍵字 → 代表合法條件**：
   - 「已」、「符合」、「適足」、「adequate」、「compliant」、「ok」
   - 例如：`"desc": "資本適足"`  → 此 constraint = true 表示合法

3. **預設假設**：
   - 若無明確關鍵字，且 id 包含 `_mandatory`、`_required` → 代表合規要求（true = 合法）
   - 若無明確關鍵字，且 id 包含 `_violation`、`_insufficient` → 代表違規（true = 違法）

📌 輸出格式：
```json
{{
  "id": "meta:no_penalty_if_all_pass",
  "desc": "若所有合規要求成立且無違法條件則 penalty 為 false",
  "expr": [
    "EQ",
    "penalty",
    ["NOT",
      ["OR",
        ["NOT", ["EQ","<合法constraint_id1>", true]],  // 合法條件必須為 true
        ["NOT", ["EQ","<合法constraint_id2>", true]],
        ["EQ","<違法constraint_id3>", true],          // 違法條件必須為 false (用 EQ true 表示違法)
        ["EQ","<違法constraint_id4>", true]
      ]
    ]
  ],
  "weight": 0,
  "domain": "meta"
}}
```

📌 範例 1（混合合法/違法）：

<INPUT>
[
  {{"id": "insurance:capital_adequate", "desc": "資本適足：CAR≥200", ...}},
  {{"id": "insurance:capital_severely_insufficient", "desc": "資本嚴重不足：CAR<50", ...}},
  {{"id": "bank:internal_control_mandatory", "desc": "已建立內控制度", ...}}
]
</INPUT>

<OUTPUT>
{{
  "id": "meta:no_penalty_if_all_pass",
  "desc": "若資本適足且內控完善且無嚴重不足則不處罰",
  "expr": ["EQ","penalty",["NOT",["OR",
    ["NOT",["EQ","insurance:capital_adequate",true]],
    ["NOT",["EQ","bank:internal_control_mandatory",true]],
    ["EQ","insurance:capital_severely_insufficient",true]
  ]]],
  "weight": 0,
  "domain": "meta"
}}
</OUTPUT>

📌 範例 2（僅違法條件）：

<INPUT>
[
  {{"id": "labor:overtime_violation", "desc": "違反工時規定：週工時>48", ...}},
  {{"id": "labor:rest_day_violation", "desc": "未給予例假日", ...}}
]
</INPUT>

<OUTPUT>
{{
  "id": "meta:no_penalty_if_all_pass",
  "desc": "若無任何違規則不處罰",
  "expr": ["EQ","penalty",["NOT",["OR",
    ["EQ","labor:overtime_violation",true],
    ["EQ","labor:rest_day_violation",true]
  ]]],
  "weight": 0,
  "domain": "meta"
}}
</OUTPUT>

📌 範例 3（僅合法條件）：

<INPUT>
[
  {{"id": "bank:risk_management_ok", "desc": "已建立風險管理機制", ...}},
  {{"id": "bank:capital_ratio_adequate", "desc": "資本適足率≥8%", ...}}
]
</INPUT>

<OUTPUT>
{{
  "id": "meta:no_penalty_if_all_pass",
  "desc": "若所有合規要求成立則不處罰",
  "expr": ["EQ","penalty",["NOT",["OR",
    ["NOT",["EQ","bank:risk_management_ok",true]],
    ["NOT",["EQ","bank:capital_ratio_adequate",true]]
  ]]],
  "weight": 0,
  "domain": "meta"
}}
</OUTPUT>

📌 特殊規則：
- 若 constraint id 為 `meta:penalty_default_false`，跳過此條件（不加入判斷）
- 若無法判斷合法/違法，預設為「合法條件」（需為 true）
- 數值型變數（如 CAR、capital_level）不加入判斷，僅使用布林型 constraint id

**注意：僅輸出此單一 JSON 物件，不要輸出完整陣列。且請不要生成```json```**
"""


def make_penalty_agent(llm_config):
    return AssistantAgent(
        name="PenaltyAgent",
        system_message=PENALTY_SYS_PROMPT,
        llm_config=llm_config,
    )
    
    

PENALTY_SYS_PROMPT = r"""
你是【Penalty Agent】，專門為一組 ConstraintSpec[] 生成總合處罰邏輯。

📌 你的任務：
**僅輸出一條規則：`meta:no_penalty_if_all_pass`**

---

## 🎯 規則說明

- 若所有「合規要求」都成立，則 penalty = false  
- 若任何「違法條件」成立，或「互斥條件」同時為真（邏輯衝突），則 penalty = true  
- **需能辨識違法 vs 合法 vs 互斥情境**
- **僅使用 constraints 的頂層 id**（例如 `"insurance:xxx"`）

---

## ⚖️ 判斷邏輯

### 🟥 違法條件（true → 違法）
若 constraint 的描述中出現以下字詞：
- 「未」、「不得」、「禁止」、「違反」、「不符」、「不足」、「超過」、「缺失」、「不履行」
或 ID 含 `_violation`、`_insufficient`、`_breach`、`_fail`
→ 表示違法條件。

### 🟩 合法條件（true → 合法）
若描述中包含：
- 「已」、「符合」、「適足」、「adequate」、「compliant」、「ok」、「合法」
或 ID 含 `_ok`、`_adequate`、`_compliant`、`_approved`
→ 表示合法條件。

### 🟦 子系統 penalty（domain-level penalty）
若 ID 結尾為 `:penalty`，代表該法域的總體懲處狀態。  
此變數應直接納入最終 OR 判斷中，例如：
```json
["EQ","insurance:penalty",true]
````

### 🟨 預設情形

若無法明確歸類：

* 若 id 包含 `_mandatory`、`_required` → 合法條件
* 其他 → 視為合法條件（預設需為 true）

---

## 🚫 排除條件

* 跳過 `meta:penalty_default_false`
* 跳過 `meta:no_penalty_if_all_pass` 自身
* 跳過數值型 constraint（如 `capital_level`, `CAR`）

---

## ⚔️ 特殊規則：互斥條件（Mutually Exclusive Conditions）

若系統中出現多個「互斥條件」代表不同的等級或分類（如等級 1～4、分類 A/B/C），
則應依下列原則處理：

1. 若這些條件同時成立 → 視為邏輯衝突（表示系統狀態不一致）
   → penalty = true
   （違反「就低不就高」原則）

2. 若僅一個成立 → 不視為衝突。

實作方式：

* 若偵測到 `*_adequate`, `*_insufficient`, `*_significantly_insufficient`, `*_severely_insufficient` 等分級 constraint
  → 在 penalty 判斷中加入額外條件：

  ```json
  ["AND",
    ["NOT", ["AND",
      ["EQ","insurance:capital_adequate",true],
      ["OR",
        ["EQ","insurance:capital_insufficient",true],
        ["EQ","insurance:capital_significantly_insufficient",true],
        ["EQ","insurance:capital_severely_insufficient",true]
      ]
    ]],
    ...  // 原有的合法/違法邏輯
  ]
  ```

  表示若同時存在兩個互斥等級為真 → 直接觸發 penalty。

3. 若已存在「整合等級」變數（如 `insurance:capital_level`），
   則不需個別檢查互斥條件，以該變數為最終依據。

---

## 🧩 輸出格式

輸出固定為單一 ConstraintSpec 物件（不要陣列、不要 `json`）。

```json
{
  "id": "meta:no_penalty_if_all_pass",
  "desc": "若所有合規要求成立且無違法或互斥條件則 penalty 為 false",
  "expr": [
    "EQ","penalty",
    ["NOT",
      ["OR",
        ["NOT",["EQ","<合法constraint_id>",true]],
        ["EQ","<違法constraint_id>",true],
        ["AND",["EQ","insurance:capital_adequate",true],
                ["EQ","insurance:capital_insufficient",true]]  // 互斥條件
      ]
    ]
  ],
  "weight": 0,
  "domain": "meta"
}
```

---

## 🧩 範例 1（混合合法 / 違法 + 互斥）

<INPUT>
[
  {"id":"insurance:capital_adequate","desc":"資本適足"},
  {"id":"insurance:capital_insufficient","desc":"資本不足"},
  {"id":"insurance:capital_significantly_insufficient","desc":"資本顯著不足"},
  {"id":"bank:internal_control_ok","desc":"已建立內控制度"}
]
</INPUT>

<OUTPUT>
{
  "id": "meta:no_penalty_if_all_pass",
  "desc": "若資本適足且內控完善且無互斥或違法條件則不處罰",
  "expr": ["EQ","penalty",["NOT",["OR",
    ["NOT",["EQ","insurance:capital_adequate",true]],
    ["NOT",["EQ","bank:internal_control_ok",true]],
    ["EQ","insurance:capital_insufficient",true],
    ["EQ","insurance:capital_significantly_insufficient",true],
    ["AND",
      ["EQ","insurance:capital_adequate",true],
      ["OR",
        ["EQ","insurance:capital_insufficient",true],
        ["EQ","insurance:capital_significantly_insufficient",true]
      ]
    ]
  ]]],
  "weight": 0,
  "domain": "meta"
}
</OUTPUT>

---

## ⚙️ 補充

* 若檢測到 domain-level penalty（如 `insurance:penalty`、`labor:penalty`）
  則只需整合這些 penalty，忽略其內部合法/違法項。
* 若同時存在 `_level` 或 CASE-based constraint，則不檢查互斥條件。

---

📌 注意：

* 僅輸出單一 JSON 物件。
* 不得輸出陣列或加上文字解釋。
* 僅使用 constraint id（不展開 expr）。
  """
