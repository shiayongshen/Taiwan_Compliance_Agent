import json
import pandas as pd
from pathlib import Path

DATA = Path("dataset/updated_processed_cases.csv")
OUTPUT_DIR = Path("outputs")

def load_json_safe(filepath):
    """安全讀取 JSON 文件，如果失敗返回 'N/A'"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            return json.dumps(json.load(f), ensure_ascii=False, indent=2)
    except Exception as e:
        return f"N/A ({str(e)})"

def main():
    df = pd.read_csv(DATA)
    results = []
    
    for idx, row in df.iterrows():
        case_id = f"case_{idx}"
        case_name = str(row["法律案例"])
        statute = str(row["相關法條"])
        
        # 讀取對應的 JSON 文件
        constraint_spec = load_json_safe(OUTPUT_DIR / f"{case_id}.constraint_spec.json")
        facts = load_json_safe(OUTPUT_DIR / f"{case_id}.facts.json")
        varspecs = load_json_safe(OUTPUT_DIR / f"{case_id}.varspecs.json")
        
        results.append({
            "case_id": case_id,
            "case_name": case_name,
            "statute": statute,
            "constraint_spec": constraint_spec,
            "facts": facts,
            "varspecs": varspecs
        })
    
    # 創建 DataFrame
    results_df = pd.DataFrame(results)
    
    # 輸出到 Excel
    output_path = OUTPUT_DIR / "searchable_cases.xlsx"
    with pd.ExcelWriter(output_path, engine='openpyxl') as writer:
        results_df.to_excel(writer, sheet_name='Cases', index=False)
    
    print(f"Searchable Excel created at: {output_path}")
    print(f"Total cases: {len(results)}")

if __name__ == "__main__":
    main()