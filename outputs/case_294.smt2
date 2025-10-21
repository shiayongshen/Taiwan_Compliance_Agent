; SMT2 file generated from compliance case automatic
; Case ID: case_294
; Generated at: 2025-10-21T06:32:23.191346
;
; This file can be executed with Z3:
;   z3 case_294.smt2
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
(declare-const violation_129_7 Bool)
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

; [bank:internal_control_ok] 建立且確實執行內部控制及稽核制度
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 建立且確實執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 建立且確實執行內部作業制度及程序
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:violation_129_7] 違反第129條第7款：未依規定建立或執行內部控制、內部處理、內部作業制度
(assert (= violation_129_7
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行法第129條第7款規定時處罰
(assert (= penalty violation_129_7))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_control_ok false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_ok false))
(assert (= violation_129_7 true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 11
; Total facts: 11
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
