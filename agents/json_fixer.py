from autogen import AssistantAgent
import json

JSON_FIXER_SYS_PROMPT = r"""
你是【JSON 修復器】。你的任務是接收一段可能不是合法 JSON 的文字，並輸出一個**乾淨的 JSON 陣列或物件**。

規則：
1. 僅輸出合法 JSON（不要加解釋、不要加 Markdown 標籤、不要加註解）。
2. 如果輸入有多餘的符號（例如 ```json ... ``` 或文字說明），請刪掉。
3. 如果 JSON 結構缺少括號或逗號，請自動補齊。
4. 嚴格遵守 JSON 格式：字串必須用雙引號，不能用單引號。
"""

def make_json_fixer(llm_config):
    return AssistantAgent(
        name="JsonFixer",
        system_message=JSON_FIXER_SYS_PROMPT,
        llm_config=llm_config,
    )