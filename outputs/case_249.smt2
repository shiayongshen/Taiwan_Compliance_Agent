; SMT2 file generated from compliance case automatic
; Case ID: case_249
; Generated at: 2025-10-21T05:30:40.681661
;
; This file can be executed with Z3:
;   z3 case_249.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const article_12_compliance Bool)
(declare-const article_13_paragraph_1_compliance Bool)
(declare-const article_13_paragraph_2_compliance Bool)
(declare-const article_15_paragraph_1_compliance Bool)
(declare-const article_15_paragraph_2_compliance Bool)
(declare-const article_18_compliance Bool)
(declare-const article_24_paragraph_2_compliance Bool)
(declare-const article_24_paragraph_3_compliance Bool)
(declare-const article_27_compliance Bool)
(declare-const article_31_compliance Bool)
(declare-const article_32_paragraph_1_compliance Bool)
(declare-const article_34_paragraph_1_compliance Bool)
(declare-const article_34_paragraph_3_compliance Bool)
(declare-const article_36_liquidity_compliance Bool)
(declare-const article_40_compliance Bool)
(declare-const article_59_compliance Bool)
(declare-const article_60_compliance Bool)
(declare-const minimum_yield_guaranteed Real)
(declare-const penalty Bool)
(declare-const principal_guaranteed Bool)
(declare-const prohibit_minimum_yield_guarantee Bool)
(declare-const prohibit_principal_guarantee Bool)
(declare-const violate_article_12 Bool)
(declare-const violate_article_13 Bool)
(declare-const violate_article_15_paragraph_1 Bool)
(declare-const violate_article_15_paragraph_2 Bool)
(declare-const violate_article_18 Bool)
(declare-const violate_article_24_paragraph_2_or_3 Bool)
(declare-const violate_article_27 Bool)
(declare-const violate_article_31 Bool)
(declare-const violate_article_32_paragraph_1 Bool)
(declare-const violate_article_34_paragraph_1_or_3 Bool)
(declare-const violate_article_36_liquidity_ratio Bool)
(declare-const violate_article_40 Bool)
(declare-const violate_article_59 Bool)
(declare-const violate_article_60 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [trust:prohibit_principal_guarantee] 信託業不得承諾擔保本金
(assert (not (= principal_guaranteed prohibit_principal_guarantee)))

; [trust:prohibit_minimum_yield_guarantee] 信託業不得承諾擔保最低收益率
(assert (= prohibit_minimum_yield_guarantee (= minimum_yield_guaranteed 0.0)))

; [trust:violate_article_12] 違反第十二條規定
(assert (not (= article_12_compliance violate_article_12)))

; [trust:violate_article_13] 違反第十三條第一項或第二項規定
(assert (= violate_article_13
   (or (not article_13_paragraph_1_compliance)
       (not article_13_paragraph_2_compliance))))

; [trust:violate_article_15_paragraph_1] 違反第十五條第一項規定
(assert (not (= article_15_paragraph_1_compliance violate_article_15_paragraph_1)))

; [trust:violate_article_15_paragraph_2] 信託業董事或監察人違反第十五條第二項關於準用銀行法第六十四條第一項規定
(assert (not (= article_15_paragraph_2_compliance violate_article_15_paragraph_2)))

; [trust:violate_article_18] 違反第十八條規定
(assert (not (= article_18_compliance violate_article_18)))

; [trust:violate_article_24_paragraph_2_or_3] 違反第二十四條第二項或第三項規定
(assert (= violate_article_24_paragraph_2_or_3
   (or (not article_24_paragraph_2_compliance)
       (not article_24_paragraph_3_compliance))))

; [trust:violate_article_27] 違反第二十七條規定
(assert (not (= article_27_compliance violate_article_27)))

; [trust:violate_article_31] 違反第三十一條規定
(assert (not (= article_31_compliance violate_article_31)))

; [trust:violate_article_32_paragraph_1] 違反第三十二條第一項限制
(assert (not (= article_32_paragraph_1_compliance violate_article_32_paragraph_1)))

; [trust:violate_article_34_paragraph_1_or_3] 違反第三十四條第一項或第三項規定
(assert (= violate_article_34_paragraph_1_or_3
   (or (not article_34_paragraph_1_compliance)
       (not article_34_paragraph_3_compliance))))

; [trust:violate_article_36_liquidity_ratio] 違反第三十六條規定，未保持一定比率流動性資產
(assert (not (= article_36_liquidity_compliance violate_article_36_liquidity_ratio)))

; [trust:violate_article_40] 違反第四十條規定
(assert (not (= article_40_compliance violate_article_40)))

; [trust:violate_article_59] 違反第五十九條規定
(assert (not (= article_59_compliance violate_article_59)))

; [trust:violate_article_60] 違反第六十條規定
(assert (not (= article_60_compliance violate_article_60)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關條文規定時處罰
(assert (= penalty
   (or (not violate_article_18)
       (not prohibit_minimum_yield_guarantee)
       (not violate_article_40)
       (not violate_article_31)
       (not violate_article_60)
       (not violate_article_34_paragraph_1_or_3)
       (not violate_article_36_liquidity_ratio)
       (not violate_article_27)
       (not violate_article_32_paragraph_1)
       (not prohibit_principal_guarantee)
       (not violate_article_15_paragraph_2)
       (not violate_article_59)
       (not violate_article_24_paragraph_2_or_3)
       (not violate_article_12)
       (not violate_article_13)
       (not violate_article_15_paragraph_1))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= principal_guaranteed true))
(assert (= minimum_yield_guaranteed 0.0))
(assert (= prohibit_principal_guarantee false))
(assert (= prohibit_minimum_yield_guarantee true))
(assert (= article_12_compliance true))
(assert (= article_13_paragraph_1_compliance true))
(assert (= article_13_paragraph_2_compliance true))
(assert (= article_15_paragraph_1_compliance true))
(assert (= article_15_paragraph_2_compliance true))
(assert (= article_18_compliance true))
(assert (= article_24_paragraph_2_compliance true))
(assert (= article_24_paragraph_3_compliance true))
(assert (= article_27_compliance true))
(assert (= article_31_compliance false))
(assert (= article_32_paragraph_1_compliance true))
(assert (= article_34_paragraph_1_compliance true))
(assert (= article_34_paragraph_3_compliance true))
(assert (= article_36_liquidity_compliance true))
(assert (= article_40_compliance true))
(assert (= article_59_compliance true))
(assert (= article_60_compliance true))
(assert (= violate_article_12 false))
(assert (= violate_article_13 false))
(assert (= violate_article_15_paragraph_1 false))
(assert (= violate_article_15_paragraph_2 false))
(assert (= violate_article_18 false))
(assert (= violate_article_24_paragraph_2_or_3 false))
(assert (= violate_article_27 false))
(assert (= violate_article_31 true))
(assert (= violate_article_32_paragraph_1 false))
(assert (= violate_article_34_paragraph_1_or_3 false))
(assert (= violate_article_36_liquidity_ratio false))
(assert (= violate_article_40 false))
(assert (= violate_article_59 false))
(assert (= violate_article_60 false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 36
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
