; SMT2 file generated from compliance case automatic
; Case ID: case_392
; Generated at: 2025-10-19T14:43:02.283822
;
; This file can be executed with Z3:
;   z3 case_392.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const penalty Bool)
(declare-const public_explanation_provided Bool)
(declare-const report_and_explanation_truthful Bool)
(declare-const reported_to_authority_on_time Bool)
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
   (or (not explanation_document_provided)
       (not explanation_document_truthful)
       (not explanation_document_compliant))))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定
(assert (= violate_148_2_2
   (or (not reported_to_authority_on_time)
       (not public_explanation_provided)
       (not report_and_explanation_truthful))))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
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
(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 false))
(assert (= violate_148_3_2 true))
(assert (= explanation_document_provided true))
(assert (= explanation_document_compliant true))
(assert (= explanation_document_truthful true))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= public_explanation_provided false))
(assert (= report_and_explanation_truthful true))
(assert (= reported_to_authority_on_time true))
(assert (= violate_148_1_1_or_2 true))
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
