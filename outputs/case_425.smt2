; SMT2 file generated from compliance case automatic
; Case ID: case_425
; Generated at: 2025-10-21T09:20:47.755019
;
; This file can be executed with Z3:
;   z3 case_425.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_completed Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficient Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const violation_144_1_to_4_145 Bool)
(declare-const violation_144_1_to_4_145_flag Bool)
(declare-const violation_144_5 Bool)
(declare-const violation_144_5_flag Bool)
(declare-const violation_148_1_or_2 Bool)
(declare-const violation_148_1_or_2_flag Bool)
(declare-const violation_148_2_1 Bool)
(declare-const violation_148_2_1_flag Bool)
(declare-const violation_148_2_2 Bool)
(declare-const violation_148_2_2_flag Bool)
(declare-const violation_148_3_1 Bool)
(declare-const violation_148_3_1_flag Bool)
(declare-const violation_148_3_2 Bool)
(declare-const violation_148_3_2_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級嚴重不足判定
(assert (= capital_level_severe_insufficient
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_level_significant_deterioration] 資本等級顯著惡化判定
(assert (= capital_level_significant_deterioration
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級不足判定
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級適足判定
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著惡化, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_completed] 資本嚴重不足等級措施完成（增資、改善計畫或合併完成）
(assert (= capital_level_4_measures_completed
   (and capital_level_severe_insufficient
        capital_increase_completed
        financial_or_business_improvement_plan_completed)))

; [insurance:capital_level_3_measures_completed] 資本顯著惡化等級措施完成（改善計畫核定且執行）
(assert (= capital_level_3_measures_completed
   (and capital_level_significant_deterioration
        improvement_plan_submitted
        improvement_plan_approved
        improvement_plan_executed)))

; [insurance:capital_level_2_measures_completed] 資本不足等級措施完成（改善計畫核定且執行）
(assert (= capital_level_2_measures_completed
   (and capital_level_insufficient
        improvement_plan_submitted
        improvement_plan_approved
        improvement_plan_executed)))

; [insurance:violation_144_1_to_4_145] 違反第一百四十四條第一項至第四項、第一百四十五條規定
(assert (= violation_144_1_to_4_145 violation_144_1_to_4_145_flag))

; [insurance:violation_144_5] 簽證精算人員或外部複核精算人員違反第一百四十四條第五項規定
(assert (= violation_144_5 violation_144_5_flag))

; [insurance:violation_148_1_or_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violation_148_1_or_2 violation_148_1_or_2_flag))

; [insurance:violation_148_2_1] 違反第一百四十八條之二第一項規定（未提供說明文件、說明文件未依規定記載或記載不實）
(assert (= violation_148_2_1 violation_148_2_1_flag))

; [insurance:violation_148_2_2] 違反第一百四十八條之二第二項規定（未依限報告或公開說明，或內容不實）
(assert (= violation_148_2_2 violation_148_2_2_flag))

; [insurance:violation_148_3_1] 違反第一百四十八條之三第一項規定（未建立或未執行內部控制或稽核制度）
(assert (= violation_148_3_1 violation_148_3_1_flag))

; [insurance:violation_148_3_2] 違反第一百四十八條之三第二項規定（未建立或未執行內部處理制度或程序）
(assert (= violation_148_3_2 violation_148_3_2_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關法令規定或資本嚴重不足且未完成增資或改善計畫時處罰
(assert (let ((a!1 (or violation_144_1_to_4_145
               violation_144_5
               violation_148_1_or_2
               violation_148_2_1
               violation_148_2_2
               violation_148_3_1
               violation_148_3_2
               (and capital_level_severe_insufficient
                    (not (or capital_increase_completed
                             financial_or_business_improvement_plan_completed
                             merger_completed))))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 45.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= violation_144_1_to_4_145_flag true))
(assert (= violation_144_1_to_4_145 true))
(assert (= violation_144_5_flag false))
(assert (= violation_144_5 false))
(assert (= violation_148_1_or_2_flag false))
(assert (= violation_148_1_or_2 false))
(assert (= violation_148_2_1_flag false))
(assert (= violation_148_2_1 false))
(assert (= violation_148_2_2_flag false))
(assert (= violation_148_2_2 false))
(assert (= violation_148_3_1_flag false))
(assert (= violation_148_3_1 false))
(assert (= violation_148_3_2_flag false))
(assert (= violation_148_3_2 false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_executed false))
(assert (= capital_level_2_measures_completed false))
(assert (= capital_level_3_measures_completed false))
(assert (= capital_level_4_measures_completed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 32
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
