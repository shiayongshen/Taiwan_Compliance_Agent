; SMT2 file generated from compliance case automatic
; Case ID: case_177
; Generated at: 2025-10-21T03:59:03.559392
;
; This file can be executed with Z3:
;   z3 case_177.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const business_relationship_end_date Int)
(declare-const control_procedures_established Bool)
(declare-const current_date Int)
(declare-const customer_identification_data_retained Bool)
(declare-const customer_identification_data_retention_period_ok Bool)
(declare-const customer_identification_performed Bool)
(declare-const customer_identification_procedure_ok Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const enhanced_customer_due_diligence_ok Bool)
(declare-const enhanced_due_diligence_performed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_execution_confirmed Bool)
(declare-const legal_longer_retention_period Bool)
(declare-const other_designated_matters_established Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const suspicious_transaction_reported Bool)
(declare-const suspicious_transaction_reporting_ok Bool)
(declare-const temporary_transaction_end_date Int)
(declare-const training_held Bool)
(declare-const transaction_reported Bool)
(declare-const transaction_reporting_ok Bool)
(declare-const transaction_temporary Bool)

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
        other_designated_matters_established)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_execution_confirmed))

; [aml:customer_identification_procedure_ok] 完成確認客戶身分程序並留存資料
(assert (= customer_identification_procedure_ok
   (and customer_identification_performed customer_identification_data_retained)))

; [aml:customer_identification_data_retention_period_ok] 確認客戶身分資料保存期限符合規定
(assert (let ((a!1 (and transaction_temporary
                (<= 1825
                    (+ current_date (* (- 1) temporary_transaction_end_date))))))
(let ((a!2 (or a!1
               (<= 1 (ite legal_longer_retention_period 1 0))
               (<= 1825
                   (+ current_date (* (- 1) business_relationship_end_date))))))
  (= customer_identification_data_retention_period_ok a!2))))

; [aml:enhanced_customer_due_diligence_ok] 對重要政治性職務客戶及其關係人執行加強審查程序
(assert (= enhanced_customer_due_diligence_ok enhanced_due_diligence_performed))

; [aml:transaction_reporting_ok] 對達一定金額之通貨交易依法申報
(assert (= transaction_reporting_ok transaction_reported))

; [aml:suspicious_transaction_reporting_ok] 對疑似犯罪交易依法申報
(assert (= suspicious_transaction_reporting_ok suspicious_transaction_reported))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反洗錢防制法第7條、8條、12條、13條規定時處罰
(assert (= penalty
   (or (not enhanced_customer_due_diligence_ok)
       (not transaction_reporting_ok)
       (not suspicious_transaction_reporting_ok)
       (not customer_identification_data_retention_period_ok)
       (not (and internal_control_established internal_control_executed))
       (not customer_identification_procedure_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_established false))
(assert (= internal_control_execution_confirmed false))
(assert (= customer_identification_performed false))
(assert (= customer_identification_data_retained false))
(assert (= business_relationship_end_date 0))
(assert (= current_date 0))
(assert (= transaction_temporary false))
(assert (= temporary_transaction_end_date 0))
(assert (= legal_longer_retention_period false))
(assert (= enhanced_due_diligence_performed false))
(assert (= transaction_reported false))
(assert (= suspicious_transaction_reported false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 25
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
