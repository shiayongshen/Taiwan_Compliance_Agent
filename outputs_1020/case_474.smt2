; SMT2 file generated from compliance case automatic
; Case ID: case_474
; Generated at: 2025-10-19T16:47:53.702166
;
; This file can be executed with Z3:
;   z3 case_474.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const declaration_has_falsehood Bool)
(declare-const declaration_made Bool)
(declare-const declaration_required Bool)
(declare-const declaration_submitted Bool)
(declare-const declaration_truthful Bool)
(declare-const forex_amount_ntd Real)
(declare-const forex_deposited_to_central_bank_or_designated_bank Bool)
(declare-const forex_sold_to_central_bank Bool)
(declare-const penalty Bool)
(declare-const query_response_ok Bool)
(declare-const query_response_submitted_in_time Bool)
(declare-const query_response_truthful Bool)
(declare-const violation_declaration Bool)
(declare-const violation_forex_sale Bool)
(declare-const violation_query_response Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [forex:declaration_required] 新臺幣五十萬元以上等值外匯收支或交易應申報
(assert (= declaration_required (<= 500000.0 forex_amount_ntd)))

; [forex:declaration_made] 依規定申報
(assert (= declaration_made (and declaration_required declaration_submitted)))

; [forex:declaration_truthful] 申報事項無不實之虞
(assert (not (= declaration_has_falsehood declaration_truthful)))

; [forex:query_response_ok] 受查詢者據實說明
(assert (= query_response_ok query_response_truthful))

; [forex:violation_declaration] 違反第6-1條故意不申報或申報不實
(assert (= violation_declaration
   (or (and declaration_required (not declaration_submitted))
       (and declaration_required
            declaration_submitted
            declaration_has_falsehood))))

; [forex:violation_query_response] 受查詢未於限期內提出說明或為虛偽說明
(assert (= violation_query_response
   (or (not query_response_submitted_in_time) (not query_response_truthful))))

; [forex:violation_forex_sale] 違反第7條規定不結售或不存入外匯
(assert (= violation_forex_sale
   (or (not forex_deposited_to_central_bank_or_designated_bank)
       (not forex_sold_to_central_bank))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反申報義務或查詢說明義務或外匯結售存入義務時處罰
(assert (= penalty
   (or violation_forex_sale violation_query_response violation_declaration)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= forex_amount_ntd 500000.0))
(assert (= declaration_required true))
(assert (= declaration_submitted true))
(assert (= declaration_has_falsehood true))
(assert (= forex_sold_to_central_bank true))
(assert (= forex_deposited_to_central_bank_or_designated_bank true))
(assert (= query_response_submitted_in_time true))
(assert (= query_response_truthful true))
(assert (= declaration_made false))
(assert (= declaration_truthful false))
(assert (= penalty false))
(assert (= query_response_ok false))
(assert (= violation_declaration false))
(assert (= violation_forex_sale false))
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
; Total variables: 15
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
