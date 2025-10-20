; SMT2 file generated from compliance case automatic
; Case ID: case_225
; Generated at: 2025-10-19T10:51:38.200854
;
; This file can be executed with Z3:
;   z3 case_225.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const assistance_obligation_compliant Bool)
(declare-const bank_subsidiary_controlled Bool)
(declare-const business_scope_compliant Bool)
(declare-const capital_supplemented_within_deadline Bool)
(declare-const confidentiality_compliant Bool)
(declare-const credit_transactions_included Bool)
(declare-const derivative_financial_products_included Bool)
(declare-const disclosure_by_announcement Bool)
(declare-const disclosure_by_authority_designated_method Bool)
(declare-const disclosure_by_internet Bool)
(declare-const disposal_within_deadline Bool)
(declare-const fhc_establishment_applied Bool)
(declare-const fhc_shareholding_compliant Bool)
(declare-const insurance_subsidiary_controlled Bool)
(declare-const internal_control_and_audit_established_and_executed Bool)
(declare-const investment_in_issuer_securities_included Bool)
(declare-const issuance_condition_compliant Bool)
(declare-const merger_approval_compliant Bool)
(declare-const order_compliance Bool)
(declare-const other_subsidiary_controlled_over_50_percent Bool)
(declare-const other_transactions_as_regulated_included Bool)
(declare-const penalty Bool)
(declare-const pledge_prohibition_compliant Bool)
(declare-const ratio_or_disposal_limit_compliant Bool)
(declare-const related_person_definition Bool)
(declare-const related_person_includes_enterprise_with_chairman_or_majority_directors Bool)
(declare-const related_person_includes_enterprise_with_over_one_third_shares Bool)
(declare-const related_person_includes_enterprise_with_responsible_person Bool)
(declare-const related_person_includes_spouse_and_second_degree_blood_relative Bool)
(declare-const report_to_authority Bool)
(declare-const reporting_and_disclosure_requirement Bool)
(declare-const reporting_days_after_quarter_end Int)
(declare-const reporting_or_announcement_compliant Bool)
(declare-const repurchase_agreement_included Bool)
(declare-const same_person_is_natural_or_legal Bool)
(declare-const securities_subsidiary_controlled Bool)
(declare-const shareholding_approved Bool)
(declare-const shareholding_increase_compliant Bool)
(declare-const shareholding_reported Bool)
(declare-const short_term_fund_use_compliant Bool)
(declare-const short_term_note_guarantee_or_endorsement_included Bool)
(declare-const subsidiary_definition Bool)
(declare-const threshold_amount_or_ratio Real)
(declare-const transaction_amount_or_ratio Real)
(declare-const transaction_limit_and_resolution_compliant Bool)
(declare-const transaction_scope Bool)
(declare-const violation_article_60_15 Bool)
(declare-const violation_article_60_any Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:related_person_definition] 同一人及同一關係人定義
(assert (= related_person_definition
   (and same_person_is_natural_or_legal
        related_person_includes_spouse_and_second_degree_blood_relative
        related_person_includes_enterprise_with_responsible_person
        related_person_includes_enterprise_with_over_one_third_shares
        related_person_includes_enterprise_with_chairman_or_majority_directors)))

; [fhc:subsidiary_definition] 子公司定義
(assert (= subsidiary_definition
   (and bank_subsidiary_controlled
        insurance_subsidiary_controlled
        securities_subsidiary_controlled
        other_subsidiary_controlled_over_50_percent)))

; [fhc:transaction_scope] 交易行為範圍
(assert (= transaction_scope
   (and credit_transactions_included
        short_term_note_guarantee_or_endorsement_included
        repurchase_agreement_included
        investment_in_issuer_securities_included
        derivative_financial_products_included
        other_transactions_as_regulated_included)))

; [fhc:reporting_and_disclosure_requirement] 交易行為達一定金額或比率時申報及揭露義務
(assert (= reporting_and_disclosure_requirement
   (and (>= transaction_amount_or_ratio threshold_amount_or_ratio)
        (>= 30 reporting_days_after_quarter_end)
        report_to_authority
        (or disclosure_by_internet
            disclosure_by_authority_designated_method
            disclosure_by_announcement))))

; [fhc:violation_article_60_15] 違反第46條申報或揭露規定
(assert (not (= reporting_and_disclosure_requirement violation_article_60_15)))

; [fhc:violation_article_60_any] 違反金融控股公司法第60條任一規定
(assert (= violation_article_60_any
   (or (not order_compliance)
       (not shareholding_approved)
       (not assistance_obligation_compliant)
       (not shareholding_reported)
       (not reporting_or_announcement_compliant)
       (not disposal_within_deadline)
       (not reporting_and_disclosure_requirement)
       (not merger_approval_compliant)
       (not ratio_or_disposal_limit_compliant)
       (not fhc_establishment_applied)
       (not transaction_limit_and_resolution_compliant)
       (not short_term_fund_use_compliant)
       (not confidentiality_compliant)
       (not capital_supplemented_within_deadline)
       (not shareholding_increase_compliant)
       (not business_scope_compliant)
       (not fhc_shareholding_compliant)
       (not internal_control_and_audit_established_and_executed)
       (not pledge_prohibition_compliant)
       (not issuance_condition_compliant))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法第60條任一規定時處罰
(assert (= penalty
   (or (not shareholding_approved)
       (not shareholding_reported)
       (not shareholding_increase_compliant)
       (not disposal_within_deadline)
       (not fhc_establishment_applied)
       (not reporting_or_announcement_compliant)
       (not pledge_prohibition_compliant)
       (not merger_approval_compliant)
       (not fhc_shareholding_compliant)
       (not short_term_fund_use_compliant)
       (not issuance_condition_compliant)
       (not ratio_or_disposal_limit_compliant)
       (not confidentiality_compliant)
       (not business_scope_compliant)
       (not transaction_limit_and_resolution_compliant)
       (not reporting_and_disclosure_requirement)
       (not internal_control_and_audit_established_and_executed)
       (not capital_supplemented_within_deadline)
       (not order_compliance)
       (not assistance_obligation_compliant))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= same_person_is_natural_or_legal true))
(assert (= related_person_includes_spouse_and_second_degree_blood_relative true))
(assert (= related_person_includes_enterprise_with_responsible_person true))
(assert (= related_person_includes_enterprise_with_over_one_third_shares true))
(assert (= related_person_includes_enterprise_with_chairman_or_majority_directors true))
(assert (= bank_subsidiary_controlled true))
(assert (= insurance_subsidiary_controlled true))
(assert (= securities_subsidiary_controlled true))
(assert (= other_subsidiary_controlled_over_50_percent true))
(assert (= credit_transactions_included true))
(assert (= short_term_note_guarantee_or_endorsement_included true))
(assert (= repurchase_agreement_included true))
(assert (= investment_in_issuer_securities_included true))
(assert (= derivative_financial_products_included true))
(assert (= other_transactions_as_regulated_included true))
(assert (= transaction_amount_or_ratio 1.0))
(assert (= threshold_amount_or_ratio 1.0))
(assert (= reporting_days_after_quarter_end 7))
(assert (= report_to_authority true))
(assert (= disclosure_by_announcement false))
(assert (= disclosure_by_internet true))
(assert (= disclosure_by_authority_designated_method false))
(assert (= reporting_and_disclosure_requirement false))
(assert (= fhc_establishment_applied true))
(assert (= shareholding_approved true))
(assert (= shareholding_reported true))
(assert (= shareholding_increase_compliant true))
(assert (= disposal_within_deadline true))
(assert (= reporting_or_announcement_compliant false))
(assert (= pledge_prohibition_compliant true))
(assert (= merger_approval_compliant true))
(assert (= fhc_shareholding_compliant true))
(assert (= short_term_fund_use_compliant true))
(assert (= issuance_condition_compliant true))
(assert (= ratio_or_disposal_limit_compliant true))
(assert (= confidentiality_compliant true))
(assert (= business_scope_compliant true))
(assert (= transaction_limit_and_resolution_compliant true))
(assert (= internal_control_and_audit_established_and_executed true))
(assert (= capital_supplemented_within_deadline true))
(assert (= order_compliance true))
(assert (= assistance_obligation_compliant true))
(assert (= violation_article_60_15 true))
(assert (= violation_article_60_any true))
(assert (= penalty true))
(assert (= related_person_definition false))
(assert (= subsidiary_definition false))
(assert (= transaction_scope false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 48
; Total facts: 48
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
