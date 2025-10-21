; SMT2 file generated from compliance case automatic
; Case ID: case_422
; Generated at: 2025-10-21T09:17:13.057641
;
; This file can be executed with Z3:
;   z3 case_422.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const derivative_operation_established Bool)
(declare-const derivative_operation_executed Bool)
(declare-const derivative_operation_ok Bool)
(declare-const derivative_operation_system_established Bool)
(declare-const derivative_operation_system_executed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
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

; [bank:derivative_operation_established] 建立衍生性金融商品業務內部作業制度及程序
(assert (= derivative_operation_established derivative_operation_system_established))

; [bank:derivative_operation_executed] 衍生性金融商品業務內部作業制度及程序確實執行
(assert (= derivative_operation_executed derivative_operation_system_executed))

; [bank:internal_control_ok] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:derivative_operation_ok] 衍生性金融商品業務內部作業制度及程序建立且確實執行
(assert (= derivative_operation_ok
   (and derivative_operation_established derivative_operation_executed)))

; [bank:internal_systems_compliance] 銀行內部制度及程序均建立且確實執行
(assert (= internal_systems_compliance
   (and internal_control_ok
        internal_handling_ok
        internal_operation_ok
        derivative_operation_ok)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行任一內部制度及程序時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_operation_ok)
       (not internal_handling_ok)
       (not derivative_operation_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established true))
(assert (= internal_operation_system_executed false))
(assert (= derivative_operation_system_established true))
(assert (= derivative_operation_system_executed true))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established true))
(assert (= internal_operation_executed false))
(assert (= derivative_operation_established true))
(assert (= derivative_operation_executed true))
(assert (= penalty true))

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
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
