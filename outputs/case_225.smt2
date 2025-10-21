; SMT2 file generated from compliance case automatic
; Case ID: case_225
; Generated at: 2025-10-21T22:01:22.529408
;
; This file can be executed with Z3:
;   z3 case_225.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const disclose_publicly Bool)
(declare-const penalty Bool)
(declare-const related_corporate_person_includes_chairman_and_manager_and_spouse_and_2nd_degree_blood Bool)
(declare-const related_corporate_person_includes_enterprise_with_1_3_share_or_control Bool)
(declare-const related_corporate_person_includes_enterprise_with_chairman_manager_or_majority_board Bool)
(declare-const related_enterprise_applies_company_law_369_1_to_369_3_369_9_369_11 Bool)
(declare-const related_person_definition Bool)
(declare-const related_person_includes_enterprise_responsible_by_person_or_spouse Bool)
(declare-const related_person_includes_spouse_and_2nd_degree_blood Bool)
(declare-const report_to_authority Bool)
(declare-const report_within_30_days_after_quarter_end Bool)
(declare-const same_person_is_natural_or_legal Bool)
(declare-const threshold_amount_or_ratio Real)
(declare-const transaction_amount_or_ratio Real)
(declare-const transaction_is_credit Bool)
(declare-const transaction_is_derivative_financial_product Bool)
(declare-const transaction_is_investment_or_purchase_of_issuer_securities Bool)
(declare-const transaction_is_other_regulated_by_authority Bool)
(declare-const transaction_is_repurchase_of_note_or_bond Bool)
(declare-const transaction_is_short_term_note_guarantee_or_endorsement Bool)
(declare-const transaction_reporting_required Bool)
(declare-const transaction_scope_valid Bool)
(declare-const violation_article_46 Bool)
(declare-const violation_article_60_15 Bool)
(declare-const violation_article_60_any Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:related_person_definition] 同一人、同一關係人及同一關係企業定義
(assert (= related_person_definition
   (and same_person_is_natural_or_legal
        related_person_includes_spouse_and_2nd_degree_blood
        related_person_includes_enterprise_responsible_by_person_or_spouse
        related_corporate_person_includes_chairman_and_manager_and_spouse_and_2nd_degree_blood
        related_corporate_person_includes_enterprise_with_1_3_share_or_control
        related_corporate_person_includes_enterprise_with_chairman_manager_or_majority_board
        related_enterprise_applies_company_law_369_1_to_369_3_369_9_369_11)))

; [fhc:transaction_reporting_required] 子公司對同一人、同一關係人及同一關係企業交易達一定金額或比率須申報揭露
(assert (= transaction_reporting_required
   (and (>= transaction_amount_or_ratio threshold_amount_or_ratio)
        report_within_30_days_after_quarter_end
        report_to_authority
        disclose_publicly)))

; [fhc:transaction_scope] 交易行為範圍
(assert (= transaction_scope_valid
   (or transaction_is_short_term_note_guarantee_or_endorsement
       transaction_is_repurchase_of_note_or_bond
       transaction_is_derivative_financial_product
       transaction_is_credit
       transaction_is_investment_or_purchase_of_issuer_securities
       transaction_is_other_regulated_by_authority)))

; [fhc:violation_article_46] 違反第46條申報或揭露規定
(assert (= violation_article_46
   (or (not transaction_reporting_required) (not transaction_scope_valid))))

; [fhc:violation_article_60_15] 違反第60條第十五款：違反第46條申報或揭露規定
(assert (= violation_article_60_15 violation_article_46))

; [fhc:violation_article_60_any] 違反第60條任一款規定
(assert (= violation_article_60_any violation_article_60_15))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第60條第十五款規定時處罰
(assert (= penalty violation_article_60_15))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= same_person_is_natural_or_legal true))
(assert (= related_person_includes_spouse_and_2nd_degree_blood true))
(assert (= related_person_includes_enterprise_responsible_by_person_or_spouse true))
(assert (= related_corporate_person_includes_chairman_and_manager_and_spouse_and_2nd_degree_blood true))
(assert (= related_corporate_person_includes_enterprise_with_1_3_share_or_control true))
(assert (= related_corporate_person_includes_enterprise_with_chairman_manager_or_majority_board true))
(assert (= related_enterprise_applies_company_law_369_1_to_369_3_369_9_369_11 true))
(assert (= related_person_definition true))
(assert (= transaction_amount_or_ratio 10000000))
(assert (= threshold_amount_or_ratio 5000000))
(assert (= report_within_30_days_after_quarter_end false))
(assert (= report_to_authority false))
(assert (= disclose_publicly false))
(assert (= transaction_is_credit true))
(assert (= transaction_is_short_term_note_guarantee_or_endorsement false))
(assert (= transaction_is_repurchase_of_note_or_bond false))
(assert (= transaction_is_investment_or_purchase_of_issuer_securities false))
(assert (= transaction_is_derivative_financial_product false))
(assert (= transaction_is_other_regulated_by_authority false))
(assert (= transaction_reporting_required false))
(assert (= transaction_scope_valid true))
(assert (= violation_article_46 true))
(assert (= violation_article_60_15 true))
(assert (= violation_article_60_any true))
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
; Total variables: 25
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
