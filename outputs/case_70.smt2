; SMT2 file generated from compliance case automatic
; Case ID: case_70
; Generated at: 2025-10-21T00:44:18.893708
;
; This file can be executed with Z3:
;   z3 case_70.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const explanation_doc_false Bool)
(declare-const explanation_doc_not_according_to_rules Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const not_provide_explanation_doc Bool)
(declare-const not_publicly_explain Bool)
(declare-const not_report_to_authority_in_time Bool)
(declare-const penalty Bool)
(declare-const report_or_explanation_false Bool)
(declare-const violate_148_1_1 Bool)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_1_or_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_1_or_2 (or violate_148_1_1 violate_148_1_2)))

; [insurance:violate_148_2_1] 違反第一百四十八條之二第一項規定
(assert (= violate_148_2_1
   (or explanation_doc_false
       not_provide_explanation_doc
       explanation_doc_not_according_to_rules)))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定
(assert (= violate_148_2_2
   (or not_publicly_explain
       not_report_to_authority_in_time
       report_or_explanation_false)))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反148-1-1或2、148-2-1、148-2-2、148-3-1或148-3-2規定時處罰
(assert (= penalty
   (or violate_148_1_1_or_2
       violate_148_2_1
       violate_148_2_2
       violate_148_3_1
       violate_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_1 true))
(assert (= violate_148_1_2 false))
(assert (= violate_148_1_1_or_2 true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 true))
(assert (= violate_148_3_2 false))
(assert (= not_provide_explanation_doc false))
(assert (= explanation_doc_not_according_to_rules false))
(assert (= explanation_doc_false false))
(assert (= not_report_to_authority_in_time false))
(assert (= not_publicly_explain false))
(assert (= report_or_explanation_false false))
(assert (= internal_control_established false))
(assert (= internal_control_executed true))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 18
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
