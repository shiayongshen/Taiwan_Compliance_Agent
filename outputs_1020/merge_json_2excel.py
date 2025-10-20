import json
import pandas as pd
from pathlib import Path

OUT = Path("outputs")
EXCEL_PATH = OUT / "pipeline_all_results.xlsx"

def main():
    all_stats_files = list(OUT.glob("*.stats.json"))
    if not all_stats_files:
        print("⚠️ 沒找到任何 .stats.json 檔案。")
        return

    summaries = []
    checkpoint_rows = []
    agent_calls_rows = []
    fix_logs_rows = []

    # === 讀取所有 .stats.json ===
    for file in all_stats_files:
        with open(file, "r", encoding="utf-8") as f:
            data = json.load(f)
        
        case_id = data.get("case_id", file.stem.replace(".stats", ""))
        checkpoints = data.get("checkpoints_detail", {})
        agent_calls = data.get("agent_calls", [])
        fix_logs = data.get("fix_logs", [])

        # 摘要資料
        summary = {k: v for k, v in data.items() if not isinstance(v, (list, dict))}
        summary["case_id"] = case_id
        summaries.append(summary)

        # 檢查點資料
        for step, info in checkpoints.items():
            if isinstance(info, dict):
                checkpoint_rows.append({
                    "case_id": case_id,
                    "step": step,
                    "passed": info.get("passed"),
                    "details": info.get("details"),
                    "timestamp": info.get("timestamp")
                })
            else:
                checkpoint_rows.append({
                    "case_id": case_id,
                    "step": step,
                    "passed": info,
                    "details": None,
                    "timestamp": None
                })
        
        # Agent 呼叫紀錄
        for call in agent_calls:
            call["case_id"] = case_id
            agent_calls_rows.append(call)

        # 修復紀錄
        for fix in fix_logs:
            fix["case_id"] = case_id
            fix_logs_rows.append(fix)

    # === DataFrame ===
    df_summary = pd.DataFrame(summaries).sort_values(by="case_id").reset_index(drop=True)
    df_checkpoints = pd.DataFrame(checkpoint_rows).sort_values(by=["case_id", "step"]).reset_index(drop=True)
    df_agent_calls = pd.DataFrame(agent_calls_rows).sort_values(by="case_id").reset_index(drop=True)
    df_fix_logs = pd.DataFrame(fix_logs_rows).sort_values(by="case_id").reset_index(drop=True)

    # === ✅ 每個 case 只保留到第一個 Fail 為止（跳過 step5_repair_needed） ===
    filtered_rows = []

    for case_id, group in df_checkpoints.groupby("case_id", sort=False):
        # 確保按 step 順序排序
        group = group.sort_values(by="step", key=lambda col: col.map(str))

        # 找出第一個 Fail（排除 step5_repair_needed）
        fail_mask = (group["passed"] == False) & (group["step"] != "step5_repair_needed")

        if fail_mask.any():
            first_fail_index = group[fail_mask].index[0]
            cutoff_group = group.loc[:first_fail_index]  # 包含第一個 Fail
        else:
            cutoff_group = group

        filtered_rows.append(cutoff_group)

    df_checkpoints = pd.concat(filtered_rows).reset_index(drop=True)

    # === 統計準確率 ===
    total_cases = len(df_summary)
    valid_cases = df_summary[df_summary["success"].notna()]
    success_cases = valid_cases["success"].sum()
    fail_cases = len(valid_cases) - success_cases
    accuracy = success_cases / len(valid_cases) * 100 if len(valid_cases) > 0 else 0.0

    avg_time = df_summary["total_time_sec"].mean()
    total_cost = df_summary["total_cost_usd"].sum()

    print("\n📊 === Summary Statistics ===")
    print(f"總案例數: {total_cases}")
    print(f"有效案例: {len(valid_cases)}")
    print(f"成功案例: {success_cases}")
    print(f"失敗案例: {fail_cases}")
    print(f"準確率: {accuracy:.2f}%")
    print(f"平均時間: {avg_time:.2f} 秒")
    print(f"總成本: ${total_cost:.6f}")

    # === 各檢查點統計（基於裁切後的 df_checkpoints） ===
    checkpoint_stats = []
    for step in sorted(df_checkpoints["step"].unique()):
        subset = df_checkpoints[df_checkpoints["step"] == step]
        subset = subset[subset["passed"].notna()]  # 排除 None
        if len(subset) == 0:
            continue
        total = len(subset)
        pass_count = (subset["passed"] == True).sum()
        fail_count = (subset["passed"] == False).sum()
        skip_count = (subset["passed"].isnull()).sum()
        pass_rate = pass_count / total * 100 if total > 0 else 0
        checkpoint_stats.append({
            "step": step,
            "total_cases": total,
            "pass_count": pass_count,
            "fail_count": fail_count,
            "skip_count": skip_count,
            "pass_rate_%": round(pass_rate, 2)
        })

    df_checkpoint_stats = pd.DataFrame(checkpoint_stats)

    # === 輸出到 Excel ===
    with pd.ExcelWriter(EXCEL_PATH, engine="openpyxl") as writer:
        import re

        def natural_key(text):
            """從 case_id 提取數字以自然排序"""
            match = re.search(r"(\d+)", str(text))
            return int(match.group(1)) if match else 0

        df_summary = df_summary.sort_values(by="case_id", key=lambda col: col.map(natural_key)).reset_index(drop=True)
        df_checkpoints = df_checkpoints.sort_values(by=["case_id", "step"], key=lambda col: col.map(natural_key) if col.name == "case_id" else col).reset_index(drop=True)
        df_agent_calls = df_agent_calls.sort_values(by="case_id", key=lambda col: col.map(natural_key)).reset_index(drop=True)
        df_fix_logs = df_fix_logs.sort_values(by="case_id", key=lambda col: col.map(natural_key)).reset_index(drop=True)

        df_summary.to_excel(writer, sheet_name="Summary", index=False)
        df_checkpoints.to_excel(writer, sheet_name="Checkpoints", index=False)
        df_checkpoint_stats.to_excel(writer, sheet_name="Checkpoint_Stats", index=False)
        df_agent_calls.to_excel(writer, sheet_name="AgentCalls", index=False)
        df_fix_logs.to_excel(writer, sheet_name="FixLogs", index=False)

        # 寫入總覽統計
        summary_data = pd.DataFrame([{
            "Total Cases": total_cases,
            "Valid Cases": len(valid_cases),
            "Success Cases": success_cases,
            "Fail Cases": fail_cases,
            "Accuracy (%)": round(accuracy, 2),
            "Avg Time (sec)": round(avg_time, 2),
            "Total Cost (USD)": round(total_cost, 6)
        }])
        summary_data.to_excel(writer, sheet_name="Overall", index=False)

    print(f"\n✅ 已輸出統整檔案：{EXCEL_PATH}")
    print(f"📁 包含 Sheets: Summary / Checkpoints / Checkpoint_Stats / AgentCalls / FixLogs / Overall")


if __name__ == "__main__":
    main()
