; SMT2 file generated from compliance case automatic
; Case ID: case_179
; Generated at: 2025-10-19T09:56:28.198545
;
; This file can be executed with Z3:
;   z3 case_179.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const account_monitoring_policy_established Bool)
(declare-const audit_procedures_established Bool)
(declare-const compliance_ok Bool)
(declare-const control_procedures_established Bool)
(declare-const customer_data_integrated Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const electronic_payment_monitoring_included Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_for_data_access_established Bool)
(declare-const internal_control_implementation_confirmed Bool)
(declare-const monitoring_patterns_included Bool)
(declare-const monitoring_policy_documented_completely Bool)
(declare-const monitoring_policy_reviewed_and_updated Bool)
(declare-const monitoring_records_kept Bool)
(declare-const other_designated_matters_complied Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const risk_based_monitoring_policy_established Bool)
(declare-const training_held_regularly Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 已建立洗錢防制內部控制與稽核制度，包含六項規定
(assert (= internal_control_established
   (and control_procedures_established
        training_held_regularly
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_complied)))

; [aml:internal_control_executed] 已確實執行洗錢防制內部控制與稽核制度
(assert (= internal_control_executed internal_control_implementation_confirmed))

; [aml:account_monitoring_policy_established] 已建立帳戶或交易監控政策與程序，符合風險基礎方法及資訊系統輔助要求
(assert (= account_monitoring_policy_established
   (and customer_data_integrated
        internal_control_for_data_access_established
        risk_based_monitoring_policy_established
        monitoring_policy_reviewed_and_updated
        monitoring_policy_documented_completely
        monitoring_patterns_included
        electronic_payment_monitoring_included
        monitoring_records_kept)))

; [aml:compliance_ok] 洗錢防制制度建立且執行，帳戶交易監控政策建立且符合規定
(assert (= compliance_ok
   (and internal_control_established
        internal_control_executed
        account_monitoring_policy_established)))

; [aml:penalty_default_false] 預設不處罰
(assert (not penalty))

; [aml:penalty_conditions] 處罰條件：未建立或未執行洗錢防制內部控制與稽核制度，或未建立符合規定之帳戶交易監控政策時處罰
(assert (= penalty
   (or (not internal_control_executed)
       (not account_monitoring_policy_established)
       (not internal_control_established))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held_regularly false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_complied false))
(assert (= internal_control_implementation_confirmed false))
(assert (= customer_data_integrated false))
(assert (= internal_control_for_data_access_established false))
(assert (= risk_based_monitoring_policy_established false))
(assert (= monitoring_policy_reviewed_and_updated false))
(assert (= monitoring_policy_documented_completely false))
(assert (= monitoring_patterns_included false))
(assert (= electronic_payment_monitoring_included false))
(assert (= monitoring_records_kept false))
(assert (= penalty true))
(assert (= account_monitoring_policy_established false))
(assert (= compliance_ok false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 20
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
