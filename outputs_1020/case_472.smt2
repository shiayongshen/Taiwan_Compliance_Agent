; SMT2 file generated from compliance case automatic
; Case ID: case_472
; Generated at: 2025-10-19T16:46:22.767397
;
; This file can be executed with Z3:
;   z3 case_472.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const compliance Bool)
(declare-const declaration_false_suspected Bool)
(declare-const declaration_made Bool)
(declare-const declaration_required Bool)
(declare-const declaration_submitted Bool)
(declare-const declaration_truthful Bool)
(declare-const explanation_provided Bool)
(declare-const explanation_submitted_in_time Bool)
(declare-const explanation_truthful Bool)
(declare-const foreign_exchange_deposited Bool)
(declare-const foreign_exchange_sold Bool)
(declare-const forex_amount_ntd Real)
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

; [forex:declaration_made] 依規定申報之事項已申報
(assert (= declaration_made (or (not declaration_required) declaration_submitted)))

; [forex:declaration_truthful] 申報事項無不實之虞
(assert (not (= declaration_false_suspected declaration_truthful)))

; [forex:explanation_provided] 受查詢者有據實說明義務且已據實說明
(assert (= explanation_provided (or (not under_inquiry) explanation_truthful)))

; [forex:compliance] 符合申報及說明義務
(assert (= compliance (and declaration_made declaration_truthful explanation_provided)))

; [forex:violate_article_6_1] 違反第6-1條規定，故意不申報或申報不實
(assert (= violate_article_6_1
   (and declaration_required
        (or (not declaration_submitted) declaration_false_suspected))))

; [forex:violate_article_6_1_inquiry] 受查詢未於限期內提出說明或為虛偽說明
(assert (= violate_article_6_1_inquiry
   (and under_inquiry
        (or (not explanation_submitted_in_time) (not explanation_truthful)))))

; [forex:violate_article_7] 違反第7條規定，不結售或不存入外匯
(assert (= violate_article_7
   (or (not foreign_exchange_deposited) (not foreign_exchange_sold))))

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
(assert (= declaration_false_suspected true))
(assert (= under_inquiry true))
(assert (= explanation_submitted_in_time true))
(assert (= explanation_truthful true))
(assert (= foreign_exchange_sold true))
(assert (= foreign_exchange_deposited true))
(assert (= penalty true))
(assert (= compliance false))
(assert (= declaration_made false))
(assert (= declaration_truthful false))
(assert (= explanation_provided false))
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
; Total constraints: 10
; Total variables: 17
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
