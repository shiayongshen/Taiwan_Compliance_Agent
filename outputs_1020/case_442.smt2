; SMT2 file generated from compliance case automatic
; Case ID: case_442
; Generated at: 2025-10-19T16:05:05.908186
;
; This file can be executed with Z3:
;   z3 case_442.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_3_deterioration Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const financial_business_deterioration Bool)
(declare-const improvement_plan_approved_and_executed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_documents_accurate Bool)
(declare-const internal_documents_provided Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const penalty_violation_internal_control Bool)
(declare-const penalty_violation_internal_documents Bool)
(declare-const penalty_violation_internal_handling Bool)
(declare-const penalty_violation_professional_reinsurance Bool)
(declare-const penalty_violation_reinsurance Bool)
(declare-const penalty_violation_reporting Bool)
(declare-const report_content_accurate Bool)
(declare-const report_submitted_on_time Bool)
(declare-const violation_professional_reinsurance_regulations Bool)
(declare-const violation_reinsurance_regulations Bool)

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

; [insurance:capital_level_2_3_deterioration] 資本等級非嚴重不足但財務或業務狀況顯著惡化且未改善
(assert (= capital_level_2_3_deterioration
   (and (or (= 2 capital_level) (= 3 capital_level))
        financial_business_deterioration
        (not improvement_plan_approved_and_executed))))

; [insurance:penalty_violation_reinsurance] 違反再保險分出、分入、危險分散機制方式或限額規定
(assert (= penalty_violation_reinsurance violation_reinsurance_regulations))

; [insurance:penalty_violation_professional_reinsurance] 專業再保險業違反業務範圍或財務管理規定
(assert (= penalty_violation_professional_reinsurance
   violation_professional_reinsurance_regulations))

; [insurance:penalty_violation_internal_control] 違反內部控制或稽核制度未建立或未執行
(assert (not (= (and internal_control_established internal_control_executed)
        penalty_violation_internal_control)))

; [insurance:penalty_violation_internal_handling] 違反內部處理制度或程序未建立或未執行
(assert (not (= (and internal_handling_established internal_handling_executed)
        penalty_violation_internal_handling)))

; [insurance:penalty_violation_internal_documents] 違反說明文件提供或記載規定
(assert (= penalty_violation_internal_documents
   (or (not internal_documents_accurate) (not internal_documents_provided))))

; [insurance:penalty_violation_reporting] 違反報告或公開說明規定
(assert (= penalty_violation_reporting
   (or (not report_content_accurate) (not report_submitted_on_time))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未完成增資或改善計畫，或財務業務顯著惡化未改善，或違反再保險、內部控制、說明文件、報告等規定時處罰
(assert (= penalty
   (or capital_level_4_noncompliance
       capital_level_2_3_deterioration
       penalty_violation_internal_control
       penalty_violation_internal_documents
       penalty_violation_reinsurance
       penalty_violation_professional_reinsurance
       penalty_violation_internal_handling
       penalty_violation_reporting)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 3.0))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_documents_provided false))
(assert (= internal_documents_accurate false))
(assert (= report_submitted_on_time false))
(assert (= report_content_accurate false))
(assert (= violation_reinsurance_regulations false))
(assert (= violation_professional_reinsurance_regulations false))
(assert (= financial_business_deterioration false))
(assert (= improvement_plan_approved_and_executed false))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level 0))
(assert (= capital_level_2_3_deterioration false))
(assert (= capital_level_4_noncompliance false))
(assert (= penalty false))
(assert (= penalty_violation_internal_control false))
(assert (= penalty_violation_internal_documents false))
(assert (= penalty_violation_internal_handling false))
(assert (= penalty_violation_professional_reinsurance false))
(assert (= penalty_violation_reinsurance false))
(assert (= penalty_violation_reporting false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 26
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
