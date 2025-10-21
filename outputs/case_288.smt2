; SMT2 file generated from compliance case automatic
; Case ID: case_288
; Generated at: 2025-10-21T06:25:48.215864
;
; This file can be executed with Z3:
;   z3 case_288.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_unit_established Bool)
(declare-const exempted_by_other_penalty Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_established Bool)
(declare-const penalty Bool)
(declare-const penalty_amount Real)
(declare-const penalty_amount_valid Bool)
(declare-const violate_law_or_order Bool)
(declare-const violation_penalty_applicable Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [trust:internal_control_and_audit_established] 信託業建立內部控制及稽核制度並設置稽核單位
(assert (= internal_control_and_audit_established
   (and internal_control_established audit_unit_established)))

; [trust:violation_penalty_applicable] 違反信託業法或命令者適用罰鍰
(assert (= violation_penalty_applicable violate_law_or_order))

; [trust:penalty_amount_range] 罰鍰金額介於60萬至300萬新臺幣
(assert (= penalty_amount_valid
   (and (<= 600000.0 penalty_amount) (>= 3000000.0 penalty_amount))))

; [trust:penalty_conditions] 處罰條件：違反本法或命令中強制或禁止規定者處罰
(assert (= penalty (and violate_law_or_order (not exempted_by_other_penalty))))

; [trust:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= audit_unit_established false))
(assert (= violate_law_or_order true))
(assert (= penalty_amount 3000000))
(assert (= exempted_by_other_penalty false))
(assert (= penalty true))
(assert (= penalty_amount_valid true))
(assert (= violation_penalty_applicable true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 5
; Total variables: 9
; Total facts: 8
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
