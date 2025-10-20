; SMT2 file generated from compliance case automatic
; Case ID: case_205
; Generated at: 2025-10-19T10:26:53.775215
;
; This file can be executed with Z3:
;   z3 case_205.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const beneficiary_assessed_high_risk Bool)
(declare-const beneficiary_is_legal_person_or_trustee Bool)
(declare-const customer_from_high_risk_country Bool)
(declare-const enhanced_cdd_for_high_risk_beneficiary Bool)
(declare-const enhanced_cdd_required Bool)
(declare-const enhanced_ongoing_monitoring Bool)
(declare-const exemption_for_stored_value_card_named_registration Bool)
(declare-const high_risk_country Bool)
(declare-const high_risk_situation Bool)
(declare-const insurance_beneficiary_risk_considered Bool)
(declare-const insurance_industry Bool)
(declare-const international_aml_org_non_compliance Bool)
(declare-const international_aml_org_serious_deficiency Bool)
(declare-const lower_risk_situation Bool)
(declare-const other_concrete_evidence_high_risk Bool)
(declare-const penalty Bool)
(declare-const reasonable_measures_before_payout Bool)
(declare-const reasonable_measures_taken_before_payout Bool)
(declare-const reasonable_measures_to_understand_wealth_and_funds_source Bool)
(declare-const senior_management_approval_obtained Bool)
(declare-const simplified_cdd_allowed Bool)
(declare-const simplified_cdd_not_allowed Bool)
(declare-const stored_value_card_named_registration Bool)
(declare-const strengthen_cdd_for_high_risk Bool)
(declare-const strengthen_cdd_measures Bool)
(declare-const suspected_money_laundering_or_terrorist_financing Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:high_risk_country_definition] 洗錢或資恐高風險國家或地區定義
(assert (= high_risk_country
   (or international_aml_org_non_compliance
       international_aml_org_serious_deficiency
       other_concrete_evidence_high_risk)))

; [aml:enhanced_cdd_required] 對洗錢或資恐高風險國家或地區客戶應採取強化確認客戶身分措施
(assert (= enhanced_cdd_required customer_from_high_risk_country))

; [aml:strengthen_cdd_for_high_risk] 高風險情形應加強確認客戶身分及持續審查措施
(assert (= strengthen_cdd_for_high_risk high_risk_situation))

; [aml:strengthen_cdd_measures] 高風險情形應採取強化措施
(assert (= strengthen_cdd_measures
   (and high_risk_situation
        senior_management_approval_obtained
        reasonable_measures_to_understand_wealth_and_funds_source
        enhanced_ongoing_monitoring)))

; [aml:simplified_cdd_allowed] 較低風險情形得採取簡化措施
(assert (= simplified_cdd_allowed
   (and lower_risk_situation
        (not customer_from_high_risk_country)
        (not suspected_money_laundering_or_terrorist_financing))))

; [aml:simplified_cdd_not_allowed] 不得採取簡化措施之情形
(assert (= simplified_cdd_not_allowed
   (or customer_from_high_risk_country
       suspected_money_laundering_or_terrorist_financing)))

; [aml:exemption_for_stored_value_card_named_registration] 辦理儲值卡記名作業時，不適用高風險客戶強化措施規定
(assert (= exemption_for_stored_value_card_named_registration
   stored_value_card_named_registration))

; [aml:insurance_beneficiary_risk_considered] 保險業應將人壽保險契約受益人納入強化確認客戶身分措施考量
(assert (= insurance_beneficiary_risk_considered insurance_industry))

; [aml:enhanced_cdd_for_high_risk_beneficiary] 人壽保險契約受益人為法人或信託且評估為較高風險者，應採取強化確認客戶身分措施
(assert (= enhanced_cdd_for_high_risk_beneficiary
   (and insurance_industry
        beneficiary_is_legal_person_or_trustee
        beneficiary_assessed_high_risk)))

; [aml:reasonable_measures_before_payout] 給付保險金前採取合理措施辨識及驗證實質受益人身分
(assert (= reasonable_measures_before_payout
   (and insurance_industry
        beneficiary_is_legal_person_or_trustee
        beneficiary_assessed_high_risk
        reasonable_measures_taken_before_payout)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定採取強化確認客戶身分措施或持續審查措施時處罰
(assert (= penalty
   (or (and customer_from_high_risk_country (not enhanced_cdd_required))
       (and high_risk_situation (not strengthen_cdd_measures))
       (and insurance_industry
            beneficiary_is_legal_person_or_trustee
            beneficiary_assessed_high_risk
            (not reasonable_measures_taken_before_payout)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= beneficiary_assessed_high_risk false))
(assert (= beneficiary_is_legal_person_or_trustee false))
(assert (= customer_from_high_risk_country false))
(assert (= enhanced_cdd_for_high_risk_beneficiary false))
(assert (= enhanced_cdd_required false))
(assert (= enhanced_ongoing_monitoring false))
(assert (= exemption_for_stored_value_card_named_registration false))
(assert (= high_risk_country false))
(assert (= high_risk_situation false))
(assert (= insurance_beneficiary_risk_considered false))
(assert (= insurance_industry false))
(assert (= international_aml_org_non_compliance false))
(assert (= international_aml_org_serious_deficiency false))
(assert (= lower_risk_situation false))
(assert (= other_concrete_evidence_high_risk false))
(assert (= penalty true))
(assert (= reasonable_measures_before_payout false))
(assert (= reasonable_measures_taken_before_payout false))
(assert (= reasonable_measures_to_understand_wealth_and_funds_source false))
(assert (= senior_management_approval_obtained false))
(assert (= simplified_cdd_allowed false))
(assert (= simplified_cdd_not_allowed true))
(assert (= stored_value_card_named_registration false))
(assert (= strengthen_cdd_for_high_risk false))
(assert (= strengthen_cdd_measures false))
(assert (= suspected_money_laundering_or_terrorist_financing true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 26
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
