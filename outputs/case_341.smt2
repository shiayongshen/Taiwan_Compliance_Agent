; SMT2 file generated from compliance case automatic
; Case ID: case_341
; Generated at: 2025-10-21T07:37:39.485332
;
; This file can be executed with Z3:
;   z3 case_341.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_operation_compliance Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_compliance] 建立並執行內部控制及稽核制度
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_compliance] 建立並執行內部處理制度及程序
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_compliance] 建立並執行內部作業制度及程序
(assert (= internal_operation_compliance
   (and internal_operation_established internal_operation_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理或內部作業制度及程序時處罰
(assert (= penalty
   (or (not internal_control_compliance)
       (not internal_handling_compliance)
       (not internal_operation_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= internal_operation_established true))
(assert (= internal_operation_executed false))
(assert (= internal_control_compliance false))
(assert (= internal_handling_compliance true))
(assert (= internal_operation_compliance false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 5
; Total variables: 10
; Total facts: 10
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
