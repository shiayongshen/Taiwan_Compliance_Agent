; SMT2 file generated from compliance case automatic
; Case ID: case_470
; Generated at: 2025-10-21T10:27:40.871452
;
; This file can be executed with Z3:
;   z3 case_470.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const declaration_false_suspected Bool)
(declare-const declaration_made Bool)
(declare-const declaration_required Bool)
(declare-const declaration_submitted Bool)
(declare-const declaration_truthful Bool)
(declare-const forex_amount_ntd_equivalent Real)
(declare-const forex_deposited Bool)
(declare-const forex_sold_settled Bool)
(declare-const penalty Bool)
(declare-const query_response_ok Bool)
(declare-const query_response_submitted_in_time Bool)
(declare-const query_response_truthful Bool)
(declare-const violation_declaration Bool)
(declare-const violation_forex_settlement Bool)
(declare-const violation_query_response Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [forex:declaration_required] 新臺幣五十萬元以上等值外匯收支或交易應申報
(assert (= declaration_required (<= 500000.0 forex_amount_ntd_equivalent)))

; [forex:declaration_made] 依規定申報
(assert (= declaration_made (or declaration_submitted (not declaration_required))))

; [forex:declaration_truthful] 申報內容無不實
(assert (not (= declaration_false_suspected declaration_truthful)))

; [forex:query_response_ok] 受查詢者據實說明
(assert (= query_response_ok query_response_truthful))

; [forex:violation_declaration] 違反第6-1條故意不申報或申報不實
(assert (= violation_declaration
   (and declaration_required
        (or declaration_false_suspected (not declaration_submitted)))))

; [forex:violation_query_response] 受查詢未於限期內提出說明或為虛偽說明
(assert (= violation_query_response
   (or (not query_response_submitted_in_time) (not query_response_truthful))))

; [forex:violation_forex_settlement] 違反第7條規定不結售或不存入外匯
(assert (= violation_forex_settlement
   (or (not forex_deposited) (not forex_sold_settled))))

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

(assert (= forex_amount_ntd_equivalent 1000000.0))
(assert (= declaration_required true))
(assert (= declaration_submitted true))
(assert (= declaration_false_suspected true))
(assert (= declaration_made false))
(assert (= declaration_truthful false))
(assert (= forex_sold_settled true))
(assert (= forex_deposited true))
(assert (= query_response_submitted_in_time true))
(assert (= query_response_truthful true))
(assert (= query_response_ok true))
(assert (= violation_declaration true))
(assert (= violation_forex_settlement false))
(assert (= violation_query_response false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 15
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
