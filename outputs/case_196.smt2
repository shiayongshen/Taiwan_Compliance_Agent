; SMT2 file generated from compliance case automatic
; Case ID: case_196
; Generated at: 2025-10-21T04:17:10.779373
;
; This file can be executed with Z3:
;   z3 case_196.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const bank_violation Bool)
(declare-const control_procedures_established Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_execution_confirmed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_execution_confirmed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_execution_confirmed Bool)
(declare-const internal_operation_system_established Bool)
(declare-const other_required_matters_established Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held_regularly Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures_established
        training_held_regularly
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_required_matters_established)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_execution_confirmed))

; [bank:internal_control_established] 銀行建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 銀行建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 銀行建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 銀行內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_execution_confirmed))

; [bank:internal_handling_executed] 銀行內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_execution_confirmed))

; [bank:internal_operation_executed] 銀行內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_execution_confirmed))

; [bank:violation_penalty_condition] 銀行違反內部控制、處理或作業制度規定
(assert (= bank_violation
   (or (not internal_operation_established)
       (not internal_control_executed)
       (not internal_handling_established)
       (not internal_handling_executed)
       (not internal_control_established)
       (not internal_operation_executed))))

; [aml:penalty_default_false] 預設不處罰
(assert (not penalty))

; [aml:penalty_conditions] 處罰條件：未建立或未確實執行洗錢防制內部控制制度或銀行違反內部控制相關規定時處罰
(assert (= penalty
   (or (not internal_control_established)
       bank_violation
       (not internal_control_executed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held_regularly false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_required_matters_established false))
(assert (= internal_control_execution_confirmed false))
(assert (= internal_control_system_established false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_execution_confirmed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_execution_confirmed false))
(assert (= bank_violation true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 20
; Total facts: 13
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
