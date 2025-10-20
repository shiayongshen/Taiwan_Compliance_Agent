; SMT2 file generated from compliance case automatic
; Case ID: case_326
; Generated at: 2025-10-19T13:13:36.321428
;
; This file can be executed with Z3:
;   z3 case_326.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const branch_establishment_permit_granted Bool)
(declare-const branch_establishment_permitted Bool)
(declare-const business_direct_contact_allowed Bool)
(declare-const business_direct_contact_permitted Bool)
(declare-const financial_institution_permit_granted Bool)
(declare-const investment_compliance Bool)
(declare-const investment_handled_according_to_previous_article Bool)
(declare-const penalty Bool)
(declare-const restriction_or_prohibition_order_approved Bool)
(declare-const restriction_order_approved Bool)
(declare-const violate_article_36_1_or_2 Bool)
(declare-const violate_restriction_order Bool)
(declare-const violate_restriction_order_actual Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [cross_strait:business_direct_contact_permitted] 經財政部許可，臺灣地區金融保險證券期貨機構及其境外分支機構得與大陸地區人民等有業務直接往來
(assert (= business_direct_contact_permitted financial_institution_permit_granted))

; [cross_strait:branch_establishment_permitted] 臺灣地區金融保險證券期貨機構在大陸地區設立分支機構，應報經財政部許可
(assert (= branch_establishment_permitted branch_establishment_permit_granted))

; [cross_strait:investment_compliance] 相關投資事項依規定辦理
(assert (= investment_compliance investment_handled_according_to_previous_article))

; [cross_strait:restriction_order_approved] 財政部報請行政院核定後，限制或禁止業務直接往來
(assert (= restriction_order_approved restriction_or_prohibition_order_approved))

; [cross_strait:business_direct_contact_allowed] 是否允許業務直接往來（考慮限制或禁止命令）
(assert (= business_direct_contact_allowed
   (and business_direct_contact_permitted (not restriction_order_approved))))

; [cross_strait:violate_article_36_1_or_2] 違反第三十六條第一項或第二項規定
(assert (not (= business_direct_contact_allowed violate_article_36_1_or_2)))

; [cross_strait:violate_restriction_order] 違反財政部依第三十六條第四項規定報請行政院核定之限制或禁止命令
(assert (= violate_restriction_order
   (and restriction_order_approved violate_restriction_order_actual)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第三十六條第一項或第二項規定，或違反限制或禁止命令時處罰
(assert (= penalty (or violate_article_36_1_or_2 violate_restriction_order)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= financial_institution_permit_granted false))
(assert (= business_direct_contact_permitted false))
(assert (= restriction_or_prohibition_order_approved false))
(assert (= restriction_order_approved false))
(assert (= business_direct_contact_allowed false))
(assert (= violate_article_36_1_or_2 true))
(assert (= violate_restriction_order_actual false))
(assert (= violate_restriction_order false))
(assert (= branch_establishment_permit_granted false))
(assert (= branch_establishment_permitted false))
(assert (= investment_handled_according_to_previous_article false))
(assert (= investment_compliance false))
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
; Total variables: 13
; Total facts: 13
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
