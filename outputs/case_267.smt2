; SMT2 file generated from compliance case automatic
; Case ID: case_267
; Generated at: 2025-10-21T05:55:18.185870
;
; This file can be executed with Z3:
;   z3 case_267.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const improvement_completed Bool)
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
(declare-const penalty Bool)
(declare-const penalty_repeat_offense Bool)
(declare-const previous_penalty_imposed Bool)
(declare-const violation_internal_systems Bool)

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

; [bank:internal_control_ok] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:violation_internal_systems] 違反內部控制、內部處理或內部作業制度規定
(assert (= violation_internal_systems
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; [bank:penalty_repeat_offense] 經處罰後限期內未改善，主管機關得按次處罰
(assert (= penalty_repeat_offense
   (and previous_penalty_imposed (not improvement_completed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部制度規定或經處罰後限期內未改善時處罰
(assert (= penalty (or penalty_repeat_offense violation_internal_systems)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established true))
(assert (= internal_operation_system_executed false))
(assert (= previous_penalty_imposed true))
(assert (= improvement_completed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 20
; Total facts: 8
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
