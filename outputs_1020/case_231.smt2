; SMT2 file generated from compliance case automatic
; Case ID: case_231
; Generated at: 2025-10-19T10:58:13.860901
;
; This file can be executed with Z3:
;   z3 case_231.smt2
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

; [bank:internal_control_ok] 建立並執行內部控制及稽核制度
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 建立並執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 建立並執行內部作業制度及程序
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:internal_derivative_operation_ok] 建立並執行衍生性金融商品業務內部作業制度及程序
(assert (= internal_derivative_operation_ok
   (and internal_derivative_operation_established
        internal_derivative_operation_executed)))

; [bank:internal_systems_compliance] 內部控制、內部處理、內部作業及衍生性金融商品業務制度均建立且執行
(assert (= internal_systems_compliance
   (and internal_control_ok
        internal_handling_ok
        internal_operation_ok
        internal_derivative_operation_ok)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業或衍生性金融商品業務制度時處罰
(assert (= penalty
   (or (not internal_derivative_operation_ok)
       (not internal_handling_ok)
       (not internal_operation_ok)
       (not internal_control_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= derivative_operation_system_established false))
(assert (= derivative_operation_system_executed false))
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
(assert (= penalty false))

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
