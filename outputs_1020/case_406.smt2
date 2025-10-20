; SMT2 file generated from compliance case automatic
; Case ID: case_406
; Generated at: 2025-10-19T15:01:06.919053
;
; This file can be executed with Z3:
;   z3 case_406.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const derivative_operation_system_established Bool)
(declare-const derivative_operation_system_executed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_derivative_operation_established Bool)
(declare-const internal_derivative_operation_executed Bool)
(declare-const internal_derivative_operation_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const internal_systems_compliance Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_derivative_operation_established] 建立衍生性金融商品業務內部作業制度及程序
(assert (= internal_derivative_operation_established
   derivative_operation_system_established))

; [bank:internal_derivative_operation_executed] 衍生性金融商品業務內部作業制度及程序確實執行
(assert (= internal_derivative_operation_executed derivative_operation_system_executed))

; [bank:internal_control_ok] 內部控制及稽核制度建立且執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 內部處理制度及程序建立且執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 內部作業制度及程序建立且執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:internal_derivative_operation_ok] 衍生性金融商品業務內部作業制度及程序建立且執行
(assert (= internal_derivative_operation_ok
   (and internal_derivative_operation_established
        internal_derivative_operation_executed)))

; [bank:internal_systems_compliance] 銀行內部制度及程序全面合規
(assert (= internal_systems_compliance
   (and internal_control_ok
        internal_handling_ok
        internal_operation_ok
        internal_derivative_operation_ok)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、處理、作業制度及程序時處罰
(assert (not (= internal_systems_compliance penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= derivative_operation_system_established true))
(assert (= derivative_operation_system_executed true))
(assert (= penalty true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_ok false))
(assert (= internal_derivative_operation_established false))
(assert (= internal_derivative_operation_executed false))
(assert (= internal_derivative_operation_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_operation_ok false))
(assert (= internal_systems_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 22
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
