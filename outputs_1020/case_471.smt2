; SMT2 file generated from compliance case automatic
; Case ID: case_471
; Generated at: 2025-10-19T16:45:40.636286
;
; This file can be executed with Z3:
;   z3 case_471.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const declaration_accurate Bool)
(declare-const declaration_compliance Bool)
(declare-const declaration_made Bool)
(declare-const declaration_required Bool)
(declare-const declaration_submitted Bool)
(declare-const forex_amount_twd Real)
(declare-const forex_deposited Bool)
(declare-const forex_sold_settled Bool)
(declare-const penalty Bool)
(declare-const query_received Bool)
(declare-const query_responded Bool)
(declare-const query_responded_truthfully Bool)
(declare-const query_response_compliance Bool)
(declare-const violation_declaration Bool)
(declare-const violation_forex_settlement Bool)
(declare-const violation_query_response Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [forex:declaration_required] 新臺幣五十萬元以上等值外匯收支或交易應申報
(assert (= declaration_required (<= 500000.0 forex_amount_twd)))

; [forex:declaration_made] 依規定申報
(assert (= declaration_made (and declaration_submitted declaration_accurate)))

; [forex:declaration_compliance] 申報義務符合規定（應申報且已申報且申報正確，或不需申報）
(assert (= declaration_compliance
   (or (not declaration_required) (and declaration_required declaration_made))))

; [forex:query_response_compliance] 受查詢者有據實說明義務
(assert (= query_response_compliance
   (or (not query_received) query_responded_truthfully)))

; [forex:violation_declaration] 違反第六條之一規定，故意不申報或申報不實
(assert (= violation_declaration
   (and declaration_required
        (or (not declaration_submitted) (not declaration_accurate)))))

; [forex:violation_query_response] 受查詢未於限期內提出說明或為虛偽說明
(assert (= violation_query_response
   (and query_received
        (or (not query_responded) (not query_responded_truthfully)))))

; [forex:violation_forex_settlement] 違反第七條規定，不結售或不存入外匯
(assert (= violation_forex_settlement
   (or (not forex_sold_settled) (not forex_deposited))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反申報義務、查詢說明義務或外匯結售存入規定時處罰
(assert (= penalty
   (or violation_forex_settlement
       violation_query_response
       violation_declaration)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= forex_amount_twd 500000.0))
(assert (= declaration_required true))
(assert (= declaration_submitted true))
(assert (= declaration_accurate false))
(assert (= query_received true))
(assert (= query_responded true))
(assert (= query_responded_truthfully true))
(assert (= forex_sold_settled true))
(assert (= forex_deposited true))
(assert (= penalty true))
(assert (= declaration_compliance false))
(assert (= declaration_made false))
(assert (= query_response_compliance false))
(assert (= violation_declaration false))
(assert (= violation_forex_settlement false))
(assert (= violation_query_response false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 16
; Total facts: 16
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
