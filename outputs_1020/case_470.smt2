; SMT2 file generated from compliance case automatic
; Case ID: case_470
; Generated at: 2025-10-19T16:44:13.930972
;
; This file can be executed with Z3:
;   z3 case_470.smt2
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
(declare-const explanation_submitted_in_time Bool)
(declare-const explanation_truthful Bool)
(declare-const forex_amount_ntd Real)
(declare-const forex_deposited Bool)
(declare-const forex_sold Bool)
(declare-const obligation_to_explain Bool)
(declare-const penalty Bool)
(declare-const under_inquiry Bool)
(declare-const violate_article_6_1 Bool)
(declare-const violate_article_6_1_inquiry Bool)
(declare-const violate_article_7 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [forex:declaration_required] 新臺幣五十萬元以上等值外匯收支或交易應申報
(assert (= declaration_required (<= 500000.0 forex_amount_ntd)))

; [forex:declaration_made] 依規定申報
(assert (= declaration_made (and declaration_required declaration_submitted)))

; [forex:declaration_truthful] 申報事項無不實之虞
(assert (not (= declaration_has_falsehood declaration_truthful)))

; [forex:obligation_to_explain] 受查詢者有據實說明義務
(assert (= obligation_to_explain (or explanation_truthful (not under_inquiry))))

; [forex:violate_article_6_1] 違反第6-1條規定，故意不申報或申報不實
(assert (= violate_article_6_1
   (or (and declaration_required (not declaration_submitted))
       (and declaration_required
            declaration_submitted
            (not declaration_truthful)))))

; [forex:violate_article_6_1_inquiry] 受查詢未於限期內提出說明或為虛偽說明
(assert (= violate_article_6_1_inquiry
   (and under_inquiry
        (or (not explanation_submitted_in_time) (not explanation_truthful)))))

; [forex:violate_article_7] 違反第7條規定，不結售或不存入外匯
(assert (= violate_article_7 (or (not forex_sold) (not forex_deposited))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第6-1條故意不申報或申報不實，或受查詢未說明，或違反第7條不結售或不存入外匯
(assert (= penalty
   (or violate_article_6_1 violate_article_6_1_inquiry violate_article_7)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= forex_amount_ntd 500000.0))
(assert (= declaration_required true))
(assert (= declaration_submitted true))
(assert (= declaration_has_falsehood true))
(assert (= under_inquiry true))
(assert (= explanation_submitted_in_time true))
(assert (= explanation_truthful true))
(assert (= forex_sold true))
(assert (= forex_deposited true))
(assert (= declaration_made false))
(assert (= declaration_truthful false))
(assert (= obligation_to_explain false))
(assert (= penalty false))
(assert (= violate_article_6_1 false))
(assert (= violate_article_6_1_inquiry false))
(assert (= violate_article_7 false))

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
