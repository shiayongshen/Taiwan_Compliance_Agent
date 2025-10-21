; SMT2 file generated from compliance case automatic
; Case ID: case_281
; Generated at: 2025-10-21T06:16:06.109348
;
; This file can be executed with Z3:
;   z3 case_281.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_handling Bool)
(declare-const violation_internal_operation Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert true)

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert true)

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert true)

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert true)

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert true)

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert true)

; [bank:internal_control_ok] 建立內部控制及稽核制度且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 建立內部作業制度及程序且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:violation_internal_control] 違反內部控制及稽核制度建立或執行
(assert (not (= internal_control_ok violation_internal_control)))

; [bank:violation_internal_handling] 違反內部處理制度及程序建立或執行
(assert (not (= internal_handling_ok violation_internal_handling)))

; [bank:violation_internal_operation] 違反內部作業制度及程序建立或執行
(assert (not (= internal_operation_ok violation_internal_operation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理或內部作業制度時處罰
(assert (= penalty
   (or violation_internal_control
       violation_internal_handling
       violation_internal_operation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= violation_internal_control true))
(assert (= violation_internal_handling false))
(assert (= violation_internal_operation true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 13
; Total facts: 10
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
