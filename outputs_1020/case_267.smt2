; SMT2 file generated from compliance case automatic
; Case ID: case_267
; Generated at: 2025-10-19T11:44:49.911438
;
; This file can be executed with Z3:
;   z3 case_267.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const internal_control_established Bool)
(declare-const internal_control_established_flag Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_executed_flag Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_established_flag Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_executed_flag Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_established_flag Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_executed_flag Bool)
(declare-const internal_operation_ok Bool)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_handling Bool)
(declare-const violation_internal_operation Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_established_flag))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_executed_flag))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_established_flag))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_executed_flag))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_established_flag))

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_executed_flag))

; [bank:internal_control_ok] 建立內部控制及稽核制度且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 建立內部作業制度及程序且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:violation_internal_control] 違反內部控制及稽核制度規定
(assert (not (= internal_control_ok violation_internal_control)))

; [bank:violation_internal_handling] 違反內部處理制度及程序規定
(assert (not (= internal_handling_ok violation_internal_handling)))

; [bank:violation_internal_operation] 違反內部作業制度及程序規定
(assert (not (= internal_operation_ok violation_internal_operation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行內部控制、內部處理或內部作業制度時處罰
(assert (= penalty
   (or violation_internal_control
       violation_internal_handling
       violation_internal_operation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established_flag false))
(assert (= internal_control_executed_flag false))
(assert (= internal_handling_established_flag false))
(assert (= internal_handling_executed_flag false))
(assert (= internal_operation_established_flag false))
(assert (= internal_operation_executed_flag false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_operation_ok false))
(assert (= violation_internal_control false))
(assert (= violation_internal_handling false))
(assert (= violation_internal_operation false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 19
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
