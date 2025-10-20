; SMT2 file generated from compliance case automatic
; Case ID: case_432
; Generated at: 2025-10-19T15:51:10.431559
;
; This file can be executed with Z3:
;   z3 case_432.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_or_no_improvement Bool)
(declare-const accelerated_deterioration_or_no_improvement_flag Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_3_measures_executed_flag Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_4_measures_executed_flag Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_classification Int)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficient Bool)
(declare-const capital_level_significant_insufficient Bool)
(declare-const capital_severe_insufficient_and_no_improvement Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_deterioration_flag Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_flag Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const prohibited_actions_without_supervisor_consent Bool)
(declare-const supervisor_consent_contract_commitment Bool)
(declare-const supervisor_consent_other_major_financial_matters Bool)
(declare-const supervisor_consent_payment_exceed_limit Bool)
(declare-const supervisory_measures_executed Bool)
(declare-const supervisory_measures_executed_flag Bool)
(declare-const supervisory_measures_required Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級為嚴重不足
(assert (not (= (<= 1 capital_level) capital_level_severe_insufficient)))

; [insurance:capital_level] 資本等級分類（1=適足, 0=非適足）
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
  (= capital_level (ite (<= 50.0 capital_adequacy_ratio) a!2 4)))))

; [insurance:capital_level_severe_insufficient] 資本等級為嚴重不足（CAR < 50 或 淨值 < 0）
(assert (= capital_level_severe_insufficient
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_level_significant_insufficient] 資本等級為顯著不足（50 ≤ CAR < 150 且 0 ≤ NWR < 2）
(assert (= capital_level_significant_insufficient
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級為不足（150 ≤ CAR < 200）
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級為適足（CAR ≥ 200）
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限內完成
(assert (= improvement_plan_completed improvement_plan_submitted_and_completed))

; [insurance:capital_severe_insufficient_and_no_improvement] 資本嚴重不足且未依主管機關規定期限完成增資、財務或業務改善計畫或合併
(assert (= capital_severe_insufficient_and_no_improvement
   (and capital_level_severe_insufficient (not improvement_plan_completed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration financial_or_business_deterioration_flag))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_flag))

; [insurance:accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= accelerated_deterioration_or_no_improvement
   accelerated_deterioration_or_no_improvement_flag))

; [insurance:supervisory_measures_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_required
   (or capital_severe_insufficient_and_no_improvement
       (and financial_or_business_deterioration
            improvement_plan_approved
            accelerated_deterioration_or_no_improvement))))

; [insurance:supervisory_measures_executed] 主管機關已為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_executed supervisory_measures_executed_flag))

; [insurance:prohibited_actions_without_supervisor_consent] 保險業監管處分時，未經監管人同意不得為特定行為
(assert (= prohibited_actions_without_supervisor_consent
   (and (not supervisor_consent_payment_exceed_limit)
        (not supervisor_consent_contract_commitment)
        (not supervisor_consent_other_major_financial_matters))))

; [insurance:capital_level_classification] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level_classification a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級（4）措施已執行
(assert (= capital_level_4_measures_executed capital_level_4_measures_executed_flag))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級（3）措施已執行
(assert (= capital_level_3_measures_executed capital_level_3_measures_executed_flag))

; [insurance:capital_level_2_measures_executed] 資本不足等級（2）措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成改善計畫，或財務業務惡化未改善，或未執行對應措施時處罰
(assert (= penalty
   (or (and (= 3 capital_level_classification)
            (not capital_level_3_measures_executed))
       (and supervisory_measures_required (not supervisory_measures_executed))
       (and (= 4 capital_level_classification)
            (not capital_level_4_measures_executed))
       (and (= 2 capital_level_classification)
            (not capital_level_2_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 2.0))
(assert (= capital_level_4_measures_executed_flag true))
(assert (= capital_level_4_measures_executed true))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= financial_or_business_deterioration_flag false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_approved_flag false))
(assert (= improvement_plan_approved false))
(assert (= accelerated_deterioration_or_no_improvement_flag false))
(assert (= accelerated_deterioration_or_no_improvement false))
(assert (= supervisory_measures_required false))
(assert (= supervisory_measures_executed_flag false))
(assert (= supervisory_measures_executed false))
(assert (= supervisor_consent_payment_exceed_limit false))
(assert (= supervisor_consent_contract_commitment false))
(assert (= supervisor_consent_other_major_financial_matters false))
(assert (= prohibited_actions_without_supervisor_consent true))
(assert (= capital_level 0))
(assert (= capital_level_2_measures_executed false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_3_measures_executed_flag false))
(assert (= capital_level_adequate false))
(assert (= capital_level_classification 0))
(assert (= capital_level_insufficient false))
(assert (= capital_level_severe_insufficient false))
(assert (= capital_level_significant_insufficient false))
(assert (= capital_severe_insufficient_and_no_improvement false))
(assert (= improvement_plan_completed false))
(assert (= improvement_plan_submitted_and_completed false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 33
; Total facts: 33
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
