; SMT2 file generated from compliance case automatic
; Case ID: case_326
; Generated at: 2025-10-21T07:20:57.235175
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
(declare-const business_direct_contact_permitted Bool)
(declare-const finance_institution_permit_granted Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_100_to_1500 Bool)
(declare-const penalty_fine_200_to_1000 Bool)
(declare-const penalty_imposed_on_institution Bool)
(declare-const penalty_imprisonment_or_fine_100_to_1500 Bool)
(declare-const penalty_imprisonment_or_fine_1500 Bool)
(declare-const repeat_violation_after_order Bool)
(declare-const restriction_order_approved Bool)
(declare-const restriction_order_issued Bool)
(declare-const violate_article_36_1_or_2 Bool)
(declare-const violate_restriction_order Bool)
(declare-const violation_of_restriction_order Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [taiwan_china:business_direct_contact_permitted] 經財政部許可，得與大陸地區人民等有業務上之直接往來
(assert (= business_direct_contact_permitted finance_institution_permit_granted))

; [taiwan_china:branch_establishment_permitted] 臺灣地區金融保險證券期貨機構在大陸地區設立分支機構，應報經財政部許可
(assert (= branch_establishment_permitted branch_establishment_permit_granted))

; [taiwan_china:restriction_order_issued] 財政部經行政院核定後，限制或禁止業務直接往來
(assert (= restriction_order_issued restriction_order_approved))

; [taiwan_china:violate_article_36_1_or_2] 違反第三十六條第一項或第二項規定
(assert (= violate_article_36_1_or_2
   (or (not business_direct_contact_permitted)
       (not branch_establishment_permitted))))

; [taiwan_china:violate_restriction_order] 違反財政部依第三十六條第四項規定報請行政院核定之限制或禁止命令
(assert (= violate_restriction_order
   (and restriction_order_issued violation_of_restriction_order)))

; [taiwan_china:penalty_fine_200_to_1000] 違反第三十六條第一項或第二項規定者，處新臺幣二百萬元以上一千萬元以下罰鍰
(assert (= penalty_fine_200_to_1000 violate_article_36_1_or_2))

; [taiwan_china:penalty_fine_100_to_1500] 違反限制或禁止命令者，處新臺幣一百萬元以上一千五百萬元以下罰金
(assert (= penalty_fine_100_to_1500 violate_restriction_order))

; [taiwan_china:penalty_imprisonment_or_fine_1500] 屆期不停止或改正，或停止後再為相同違反行為者，處行為負責人三年以下有期徒刑、拘役或科或併科新臺幣一千五百萬元以下罰金
(assert (= penalty_imprisonment_or_fine_1500 repeat_violation_after_order))

; [taiwan_china:penalty_imprisonment_or_fine_100_to_1500] 違反限制或禁止命令者，處行為負責人三年以下有期徒刑、拘役或科或併科新臺幣一百萬元以上一千五百萬元以下罰金
(assert (= penalty_imprisonment_or_fine_100_to_1500 violate_restriction_order))

; [taiwan_china:penalty_imposed_on_institution] 對金融保險證券期貨機構科罰金
(assert (= penalty_imposed_on_institution
   (or violate_article_36_1_or_2 violate_restriction_order)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第三十六條第一項或第二項規定，或違反限制或禁止命令，或重複違反者處罰
(assert (= penalty
   (or repeat_violation_after_order
       violate_article_36_1_or_2
       violate_restriction_order)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= finance_institution_permit_granted false))
(assert (= branch_establishment_permit_granted false))
(assert (= restriction_order_approved false))
(assert (= restriction_order_issued false))
(assert (= violation_of_restriction_order false))
(assert (= repeat_violation_after_order false))
(assert (= violate_article_36_1_or_2 true))
(assert (= violate_restriction_order false))
(assert (= penalty true))
(assert (= penalty_fine_200_to_1000 true))
(assert (= penalty_imposed_on_institution true))
(assert (= penalty_fine_100_to_1500 false))
(assert (= penalty_imprisonment_or_fine_100_to_1500 false))
(assert (= penalty_imprisonment_or_fine_1500 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 16
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
