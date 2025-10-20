; SMT2 file generated from compliance case automatic
; Case ID: case_341
; Generated at: 2025-10-19T13:34:32.369629
;
; This file can be executed with Z3:
;   z3 case_341.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const derivative_business_internal_operation_system_and_procedure_established Bool)
(declare-const derivative_business_internal_operation_system_and_procedure_executed Bool)
(declare-const derivative_business_internal_operation_system_established Bool)
(declare-const derivative_business_internal_operation_system_executed Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_executed Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_control_and_audit_system_executed Bool)
(declare-const internal_handling_system_and_procedure_established Bool)
(declare-const internal_handling_system_and_procedure_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_system_and_procedure_established Bool)
(declare-const internal_operation_system_and_procedure_executed Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const outsourcing_included_in_internal_audit Bool)
(declare-const outsourcing_included_in_internal_control Bool)
(declare-const outsourcing_internal_control_compliance Bool)
(declare-const outsourcing_scope_supervision_defined Bool)
(declare-const outsourcing_scope_supervision_executed Bool)
(declare-const outsourcing_supervision_of_delegate_internal_audit_established Bool)
(declare-const outsourcing_supervision_of_delegate_internal_audit_executed Bool)
(declare-const outsourcing_supervision_of_delegate_internal_control_established Bool)
(declare-const outsourcing_supervision_of_delegate_internal_control_executed Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:outsourcing_internal_control_compliance] 委外內部作業制度及程序符合監督管理、內部控制及稽核制度要求
(assert (= outsourcing_internal_control_compliance
   (and outsourcing_scope_supervision_defined
        outsourcing_scope_supervision_executed
        outsourcing_included_in_internal_control
        outsourcing_included_in_internal_audit
        outsourcing_supervision_of_delegate_internal_control_established
        outsourcing_supervision_of_delegate_internal_control_executed
        outsourcing_supervision_of_delegate_internal_audit_established
        outsourcing_supervision_of_delegate_internal_audit_executed)))

; [bank:internal_control_and_audit_established] 銀行建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   internal_control_and_audit_system_established))

; [bank:internal_handling_system_established] 銀行建立資產品質評估、損失準備提列、逾期放款催收及呆帳轉銷之內部處理制度及程序
(assert (= internal_handling_system_established
   internal_handling_system_and_procedure_established))

; [bank:internal_operation_system_established] 銀行訂定委託事項範圍、客戶權益保障、風險管理及內部控制原則之內部作業制度及程序
(assert (= internal_operation_system_established
   internal_operation_system_and_procedure_established))

; [bank:derivative_business_internal_operation_system_established] 銀行訂定衍生性金融商品業務範圍、人員管理、客戶權益保障及風險管理之內部作業制度及程序
(assert (= derivative_business_internal_operation_system_established
   derivative_business_internal_operation_system_and_procedure_established))

; [bank:internal_control_and_audit_executed] 銀行確實執行內部控制及稽核制度
(assert (= internal_control_and_audit_executed
   internal_control_and_audit_system_executed))

; [bank:internal_handling_system_executed] 銀行確實執行內部處理制度及程序
(assert (= internal_handling_system_executed
   internal_handling_system_and_procedure_executed))

; [bank:internal_operation_system_executed] 銀行確實執行內部作業制度及程序
(assert (= internal_operation_system_executed
   internal_operation_system_and_procedure_executed))

; [bank:derivative_business_internal_operation_system_executed] 銀行確實執行衍生性金融商品業務內部作業制度及程序
(assert (= derivative_business_internal_operation_system_executed
   derivative_business_internal_operation_system_and_procedure_executed))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、稽核、處理及作業制度程序時處罰
(assert (= penalty
   (or (not internal_operation_system_executed)
       (not internal_operation_system_established)
       (not internal_control_and_audit_executed)
       (not internal_handling_system_executed)
       (not internal_control_and_audit_established)
       (not internal_handling_system_established))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= outsourcing_scope_supervision_defined false))
(assert (= outsourcing_scope_supervision_executed false))
(assert (= outsourcing_included_in_internal_control false))
(assert (= outsourcing_included_in_internal_audit false))
(assert (= outsourcing_supervision_of_delegate_internal_control_established false))
(assert (= outsourcing_supervision_of_delegate_internal_control_executed false))
(assert (= outsourcing_supervision_of_delegate_internal_audit_established false))
(assert (= outsourcing_supervision_of_delegate_internal_audit_executed false))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_control_and_audit_system_executed false))
(assert (= internal_handling_system_and_procedure_established true))
(assert (= internal_handling_system_and_procedure_executed true))
(assert (= internal_operation_system_and_procedure_established false))
(assert (= internal_operation_system_and_procedure_executed false))
(assert (= derivative_business_internal_operation_system_and_procedure_established true))
(assert (= derivative_business_internal_operation_system_and_procedure_executed true))
(assert (= penalty true))
(assert (= derivative_business_internal_operation_system_established false))
(assert (= derivative_business_internal_operation_system_executed false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_control_and_audit_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= outsourcing_internal_control_compliance false))

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
