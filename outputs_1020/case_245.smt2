; SMT2 file generated from compliance case automatic
; Case ID: case_245
; Generated at: 2025-10-19T11:13:55.938686
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
(declare-const control_procedures Bool)
(declare-const customer_identification_data_retained Bool)
(declare-const customer_identification_data_retention_years Int)
(declare-const customer_identification_procedure_ok Bool)
(declare-const customer_identification_procedure_performed Bool)
(declare-const customer_identification_risk_based Bool)
(declare-const customer_identification_risk_based_method Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const enhanced_customer_due_diligence_ok Bool)
(declare-const enhanced_due_diligence_performed Bool)
(declare-const enhanced_due_diligence_risk_based Bool)
(declare-const identification_data_retention_period_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const legal_longer_retention_years Int)
(declare-const other_designated_matters_established Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const temporary_transaction_data_retention_years Int)
(declare-const training_held Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures
        training_held
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_established)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_implemented))

; [aml:customer_identification_procedure_ok] 完成確認客戶身分程序並留存資料
(assert (= customer_identification_procedure_ok
   (and customer_identification_procedure_performed
        customer_identification_data_retained)))

; [aml:customer_identification_risk_based] 確認客戶身分程序以風險為基礎並包含實質受益人審查
(assert (= customer_identification_risk_based
   (and customer_identification_risk_based_method beneficial_owner_reviewed)))

; [aml:identification_data_retention_period_ok] 確認客戶身分資料保存期限符合規定
(assert (= identification_data_retention_period_ok
   (or (<= 5.0 (to_real customer_identification_data_retention_years))
       (<= 5.0 (to_real temporary_transaction_data_retention_years))
       (<= 5.0 (to_real legal_longer_retention_years)))))

; [aml:enhanced_customer_due_diligence_ok] 對重要政治性職務客戶及其關係人執行加強客戶審查程序
(assert (= enhanced_customer_due_diligence_ok
   (and enhanced_due_diligence_performed enhanced_due_diligence_risk_based)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行洗錢防制內部控制制度，或未完成確認客戶身分程序、資料保存、加強審查等規定時處罰
(assert (= penalty
   (or (not internal_control_established)
       (not customer_identification_risk_based)
       (not identification_data_retention_period_ok)
       (not customer_identification_procedure_ok)
       (not enhanced_customer_due_diligence_ok)
       (not internal_control_executed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures false))
(assert (= training_held false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_established false))
(assert (= internal_control_implemented false))
(assert (= customer_identification_procedure_performed false))
(assert (= customer_identification_data_retained false))
(assert (= customer_identification_risk_based_method false))
(assert (= beneficial_owner_reviewed false))
(assert (= enhanced_due_diligence_performed false))
(assert (= enhanced_due_diligence_risk_based false))
(assert (= customer_identification_data_retention_years 0))
(assert (= temporary_transaction_data_retention_years 0))
(assert (= legal_longer_retention_years 0))
(assert (= customer_identification_procedure_ok false))
(assert (= customer_identification_risk_based false))
(assert (= enhanced_customer_due_diligence_ok false))
(assert (= identification_data_retention_period_ok false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 23
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
