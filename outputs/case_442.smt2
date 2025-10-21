; SMT2 file generated from compliance case automatic
; Case ID: case_442
; Generated at: 2025-10-21T09:57:05.722683
;
; This file can be executed with Z3:
;   z3 case_442.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration Bool)
(declare-const accelerated_deterioration_noncompliance Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const contract_or_major_commitment_made Bool)
(declare-const financial_deterioration Bool)
(declare-const financial_deterioration_noncompliance Bool)
(declare-const illegal_acts_under_supervision Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_effective Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_violation Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_violation Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_violation Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_impact Bool)
(declare-const payment_exceed_limit Bool)
(declare-const penalty Bool)
(declare-const professional_reinsurance_violation Bool)
(declare-const reinsurance_violation Bool)
(declare-const violation_of_professional_reinsurance_rules Bool)
(declare-const violation_of_reinsurance_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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
  (= capital_level a!3)))))

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level) (not capital_level_4_measures_completed))))

; [insurance:financial_deterioration_noncompliance] 財務或業務狀況顯著惡化且未提出或未完成改善計畫
(assert (= financial_deterioration_noncompliance
   (and financial_deterioration (not improvement_plan_approved))))

; [insurance:accelerated_deterioration_noncompliance] 損益、淨值加速惡化且未改善
(assert (= accelerated_deterioration_noncompliance
   (and accelerated_deterioration (not improvement_plan_effective))))

; [insurance:reinsurance_violation] 違反再保險分出、分入、危險分散機制方式或限額規定
(assert (= reinsurance_violation violation_of_reinsurance_rules))

; [insurance:professional_reinsurance_violation] 專業再保險業違反業務範圍或財務管理規定
(assert (= professional_reinsurance_violation
   violation_of_professional_reinsurance_rules))

; [insurance:internal_control_violation] 未建立或未執行內部控制或稽核制度
(assert (not (= (and internal_control_established internal_control_executed)
        internal_control_violation)))

; [insurance:internal_handling_violation] 未建立或未執行內部處理制度或程序
(assert (not (= (and internal_handling_established internal_handling_executed)
        internal_handling_violation)))

; [insurance:internal_operation_violation] 未建立或未執行內部作業制度或程序
(assert (not (= (and internal_operation_established internal_operation_executed)
        internal_operation_violation)))

; [insurance:illegal_acts_under_supervision] 監管處分期間違反主管機關規定之行為
(assert (= illegal_acts_under_supervision
   (or payment_exceed_limit
       contract_or_major_commitment_made
       other_major_financial_impact)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未完成增資或改善計畫，或財務惡化未提出核定改善計畫，或未建立執行內部控制、處理、作業制度，或違反再保險規定，或監管期間違法行為
(assert (= penalty
   (or accelerated_deterioration_noncompliance
       reinsurance_violation
       financial_deterioration_noncompliance
       capital_level_4_noncompliance
       internal_control_violation
       internal_handling_violation
       internal_operation_violation
       illegal_acts_under_supervision
       professional_reinsurance_violation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 45.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_level_4_measures_completed false))
(assert (= financial_deterioration false))
(assert (= improvement_plan_approved false))
(assert (= accelerated_deterioration false))
(assert (= improvement_plan_effective false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= violation_of_reinsurance_rules false))
(assert (= violation_of_professional_reinsurance_rules false))
(assert (= payment_exceed_limit false))
(assert (= contract_or_major_commitment_made false))
(assert (= other_major_financial_impact false))
(assert (= illegal_acts_under_supervision true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 30
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
