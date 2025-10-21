; SMT2 file generated from compliance case automatic
; Case ID: case_472
; Generated at: 2025-10-21T10:28:53.002716
;
; This file can be executed with Z3:
;   z3 case_472.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const declaration_accurate Bool)
(declare-const declaration_made Bool)
(declare-const declaration_required Bool)
(declare-const declaration_submitted Bool)
(declare-const explanation_provided Bool)
(declare-const explanation_truthful Bool)
(declare-const forex_amount_twd Real)
(declare-const forex_not_deposited Bool)
(declare-const forex_not_sold Bool)
(declare-const penalty Bool)
(declare-const violation_declaration Bool)
(declare-const violation_explanation Bool)
(declare-const violation_forex_handling Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [forex:declaration_required] 新臺幣五十萬元以上等值外匯收支或交易應申報
(assert (= declaration_required (<= 500000.0 forex_amount_twd)))

; [forex:declaration_made] 依規定申報
(assert (= declaration_made (and declaration_submitted declaration_accurate)))

; [forex:explanation_provided] 受查詢者有據實說明義務
(assert (= explanation_provided explanation_truthful))

; [forex:violation_declaration] 違反第六條之一規定，故意不為申報或申報不實
(assert (= violation_declaration (and declaration_required (not declaration_made))))

; [forex:violation_explanation] 受查詢未於限期內提出說明或為虛偽說明
(assert (not (= explanation_provided violation_explanation)))

; [forex:violation_forex_handling] 違反第七條規定，不結售或不存入外匯
(assert (= violation_forex_handling (or forex_not_sold forex_not_deposited)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反申報或說明義務，或違反外匯結售或存入規定時處罰
(assert (= penalty
   (or violation_declaration violation_explanation violation_forex_handling)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= forex_amount_twd 500000))
(assert (= declaration_required true))
(assert (= declaration_submitted true))
(assert (= declaration_accurate false))
(assert (= declaration_made false))
(assert (= explanation_truthful true))
(assert (= explanation_provided true))
(assert (= forex_not_sold false))
(assert (= forex_not_deposited false))
(assert (= violation_declaration true))
(assert (= violation_explanation false))
(assert (= violation_forex_handling false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 13
; Total facts: 13
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
