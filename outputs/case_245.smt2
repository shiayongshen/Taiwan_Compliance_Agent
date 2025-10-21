; SMT2 file generated from compliance case automatic
; Case ID: case_245
; Generated at: 2025-10-21T05:24:30.390729
;
; This file can be executed with Z3:
;   z3 case_245.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const beneficial_owner_reviewed Bool)
(declare-const business_relationship_terminated Bool)
(declare-const compliance_ok Bool)
(declare-const control_procedures_established Bool)
(declare-const customer_data_retention_years Int)
(declare-const customer_identification_data_retained Bool)
(declare-const customer_identification_procedure_established Bool)
(declare-const customer_identification_procedure_ok Bool)
(declare-const customer_is_politically_exposed_person_or_related Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const enhanced_customer_due_diligence_ok Bool)
(declare-const enhanced_due_diligence_executed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const longer_legal_retention_years Int)
(declare-const other_required_matters_established Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const temporary_transaction_terminated Bool)
(declare-const training_held Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures_established
        training_held
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_required_matters_established)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_implemented))

; [aml:customer_identification_procedure_ok] 確認客戶身分程序已建立且包含實質受益人審查
(assert (= customer_identification_procedure_ok
   (and customer_identification_procedure_established beneficial_owner_reviewed)))

; [aml:customer_identification_data_retained] 確認客戶身分程序所得資料已留存至少五年
(assert (let ((a!1 (or (>= customer_data_retention_years longer_legal_retention_years)
               (and temporary_transaction_terminated
                    (<= 5.0 (to_real customer_data_retention_years)))
               (and business_relationship_terminated
                    (<= 5.0 (to_real customer_data_retention_years))))))
  (= customer_identification_data_retained a!1)))

; [aml:enhanced_customer_due_diligence_ok] 對重要政治性職務客戶及其關係人執行加強客戶審查程序
(assert (= enhanced_customer_due_diligence_ok
   (or (not customer_is_politically_exposed_person_or_related)
       enhanced_due_diligence_executed)))

; [aml:compliance_ok] 符合洗錢防制法第7條及第8條規定
(assert (= compliance_ok
   (and internal_control_established
        internal_control_executed
        customer_identification_procedure_ok
        customer_identification_data_retained
        enhanced_customer_due_diligence_ok)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反洗錢防制法第7條或第8條規定時處罰
(assert (= penalty
   (or (and customer_is_politically_exposed_person_or_related
            (not enhanced_customer_due_diligence_ok))
       (not internal_control_executed)
       (not customer_identification_data_retained)
       (not internal_control_established)
       (not customer_identification_procedure_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held true))
(assert (= dedicated_personnel_assigned true))
(assert (= risk_assessment_report_updated true))
(assert (= audit_procedures_established true))
(assert (= other_required_matters_established true))
(assert (= internal_control_implemented true))
(assert (= customer_identification_procedure_established true))
(assert (= beneficial_owner_reviewed true))
(assert (= business_relationship_terminated false))
(assert (= customer_data_retention_years 3))
(assert (= temporary_transaction_terminated false))
(assert (= longer_legal_retention_years 5))
(assert (= customer_is_politically_exposed_person_or_related false))
(assert (= enhanced_due_diligence_executed true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 22
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
