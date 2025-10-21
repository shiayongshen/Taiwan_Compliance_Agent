import os
import json
import re

# 設定目錄路徑
output_dir = 'outputs'

# 儲存失敗案例的 index 列表
failed_indices = []

# 遍歷目錄中的所有檔案
for filename in os.listdir(output_dir):
    if filename.endswith('.stats.json'):
        filepath = os.path.join(output_dir, filename)
        with open(filepath, 'r', encoding='utf-8') as f:
            data = json.load(f)
            if not data.get('success', True):  # 檢查 success 欄位
                case_id = data.get('case_id', filename.replace('.stats.json', ''))
                # 從 case_id 中提取 index（假設格式為 case_{index}）
                match = re.search(r'case_(\d+)', case_id)
                if match:
                    index = int(match.group(1))
                    failed_indices.append(index)

# 輸出失敗案例的 index 列表
print("失敗案例的 index 列表：", sorted(failed_indices))