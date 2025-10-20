; SMT2 file generated from compliance case automatic
; Case ID: case_440
; Generated at: 2025-10-19T16:00:50.327427
;
; This file can be executed with Z3:
;   z3 case_440.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_completed Bool)
(declare-const capital_level_2_noncompliance Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_3_noncompliance Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_true Bool)
(declare-const explanation_document_violation Bool)
(declare-const financial_deterioration Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_violation Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_violation Bool)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_deterioration Bool)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const re_insurance_violation Bool)
(declare-const re_insurance_violation_general Bool)
(declare-const re_insurance_violation_professional Bool)
(declare-const report_content_true Bool)
(declare-const report_submitted_on_time Bool)
(declare-const reporting_violation Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervisory_measures_required Bool)

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

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level) (not capital_level_4_measures_completed))))

; [insurance:capital_level_3_noncompliance] 資本顯著不足且未依規定期限完成增資、改善計畫或合併
(assert (= capital_level_3_noncompliance
   (and (= 3 capital_level) (not capital_level_3_measures_completed))))

; [insurance:capital_level_2_noncompliance] 資本不足且未依規定期限完成增資、改善計畫或合併
(assert (= capital_level_2_noncompliance
   (and (= 2 capital_level) (not capital_level_2_measures_completed))))

; [insurance:financial_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約責任或有損及被保險人權益之虞
(assert (= financial_deterioration
   (or cannot_fulfill_contract cannot_pay_debt risk_to_insured_rights)))

; [insurance:improvement_plan_submitted_and_approved] 已提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值加速惡化或經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration
   (or net_worth_accelerated_deterioration
       profit_loss_accelerated_deterioration
       (not improvement_plan_effective))))

; [insurance:supervisory_measures_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_required
   (or capital_level_4_noncompliance
       (and (not capital_level_4_noncompliance)
            financial_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_accelerated_deterioration))))

; [insurance:re_insurance_violation] 違反再保險分出、分入、危險分散機制方式或限額規定
(assert (= re_insurance_violation
   (or re_insurance_violation_general re_insurance_violation_professional)))

; [insurance:internal_control_violation] 未建立或未執行內部控制或稽核制度
(assert (= internal_control_violation
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:internal_handling_violation] 未建立或未執行內部處理制度或程序
(assert (= internal_handling_violation
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:reporting_violation] 未依限報告或公開說明，或報告內容不實
(assert (= reporting_violation
   (or (not report_content_true) (not report_submitted_on_time))))

; [insurance:explanation_document_violation] 未提供說明文件或說明文件未依規定記載或記載不實
(assert (= explanation_document_violation
   (or (not explanation_document_provided)
       (not explanation_document_compliant)
       (not explanation_document_true))))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反再保險規定、內部控制、內部處理、說明文件或報告規定時處罰
(assert (= penalty
   (or explanation_document_violation
       internal_control_violation
       internal_handling_violation
       reporting_violation
       re_insurance_violation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 50.0))
(assert (= net_worth_ratio 50.0))
(assert (= cannot_fulfill_contract false))
(assert (= cannot_pay_debt false))
(assert (= capital_level_2_measures_completed false))
(assert (= capital_level_3_measures_completed false))
(assert (= capital_level_4_measures_completed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_effective false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= net_worth_accelerated_deterioration false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= explanation_document_provided false))
(assert (= explanation_document_compliant false))
(assert (= explanation_document_true false))
(assert (= report_submitted_on_time false))
(assert (= report_content_true false))
(assert (= re_insurance_violation_general false))
(assert (= re_insurance_violation_professional false))
(assert (= penalty true))
(assert (= re_insurance_violation false))
(assert (= internal_control_violation true))
(assert (= internal_handling_violation true))
(assert (= explanation_document_violation true))
(assert (= reporting_violation true))
(assert (= risk_to_insured_rights false))
(assert (= capital_level 0))
(assert (= capital_level_2_noncompliance false))
(assert (= capital_level_3_noncompliance false))
(assert (= capital_level_4_noncompliance false))
(assert (= financial_deterioration false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= supervisory_measures_required false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 39
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
