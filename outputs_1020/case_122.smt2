; SMT2 file generated from compliance case automatic
; Case ID: case_122
; Generated at: 2025-10-19T08:33:27.880911
;
; This file can be executed with Z3:
;   z3 case_122.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_license_and_insurance Bool)
(declare-const applicant_and_insured_basic_data_collected Bool)
(declare-const assisted_to_create_formal_appearance Bool)
(declare-const bank_and_securities_understanding Bool)
(declare-const broker_duty_of_care_and_fiduciary Bool)
(declare-const broker_written_report_and_fee_disclosure Bool)
(declare-const consumer_basic_data_collected Bool)
(declare-const consumer_identity_and_financial_background_collected Bool)
(declare-const consumer_investment_ability_evaluated Bool)
(declare-const consumer_risk_preference_and_investment_experience_collected Bool)
(declare-const duty_of_care_performed Bool)
(declare-const excluded_professional_investors Bool)
(declare-const fee_disclosure_made Bool)
(declare-const fiduciary_duty_performed Bool)
(declare-const financial_consumer_data_fully_understood Bool)
(declare-const financial_product_service_suitable Bool)
(declare-const financial_underwriting_and_reporting_implemented Bool)
(declare-const fund_source_assessed Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const is_financial_consumer Bool)
(declare-const is_professional_investor Bool)
(declare-const license_obtained Bool)
(declare-const meets_financial_or_professional_criteria Bool)
(declare-const no_retroactive_policy_effect Bool)
(declare-const other_protection_measures_implemented Bool)
(declare-const other_regulatory_basic_data_collected Bool)
(declare-const penalty Bool)
(declare-const related_insurance_purchased Bool)
(declare-const relationship_between_applicant_insured_beneficiary_collected Bool)
(declare-const signatures_and_evidence_verified Bool)
(declare-const understanding_and_suitability Bool)
(declare-const underwriting_internal_control_compliance Bool)
(declare-const underwriting_personnel_qualified Bool)
(declare-const underwriting_suitability_evaluated_and_signed Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [financial_consumer:understanding_and_suitability] 金融服務業充分瞭解金融消費者相關資料且確保適合度
(assert (= understanding_and_suitability
   (and financial_consumer_data_fully_understood
        financial_product_service_suitable)))

; [insurance:agent_broker_license_and_insurance] 保險代理人、經紀人、公證人已取得許可、繳存保證金並投保相關保險
(assert (= agent_broker_license_and_insurance
   (and license_obtained guarantee_deposit_paid related_insurance_purchased)))

; [insurance:broker_duty_of_care_and_fiduciary] 保險經紀人履行善良管理人注意義務及忠實義務
(assert (= broker_duty_of_care_and_fiduciary
   (and duty_of_care_performed fiduciary_duty_performed)))

; [insurance:broker_written_report_and_fee_disclosure] 保險經紀人提供書面分析報告並明確告知報酬收取標準
(assert (= broker_written_report_and_fee_disclosure
   (and written_analysis_report_provided fee_disclosure_made)))

; [insurance:underwriting_internal_control_compliance] 保險業核保制度符合管理規則要求
(assert (= underwriting_internal_control_compliance
   (and underwriting_personnel_qualified
        underwriting_suitability_evaluated_and_signed
        no_retroactive_policy_effect
        signatures_and_evidence_verified
        financial_underwriting_and_reporting_implemented
        fund_source_assessed
        other_protection_measures_implemented)))

; [financial_consumer:excluded_professional_investors] 金融消費者不包括專業投資機構及符合一定財力或專業能力者
(assert (= excluded_professional_investors
   (or is_professional_investor meets_financial_or_professional_criteria)))

; [financial_consumer:is_financial_consumer] 是否為金融消費者
(assert (= is_financial_consumer
   (or assisted_to_create_formal_appearance
       (not excluded_professional_investors))))

; [financial_consumer:bank_and_securities_understanding] 銀行及證券期貨業於訂立契約前充分瞭解金融消費者相關資料
(assert (= bank_and_securities_understanding
   (and consumer_identity_and_financial_background_collected
        consumer_risk_preference_and_investment_experience_collected
        consumer_investment_ability_evaluated)))

; [insurance:consumer_basic_data_collected] 保險業提供保險契約前充分瞭解金融消費者基本資料
(assert (= consumer_basic_data_collected
   (and applicant_and_insured_basic_data_collected
        relationship_between_applicant_insured_beneficiary_collected
        other_regulatory_basic_data_collected)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融消費者保護法第30-1條第2款未充分瞭解金融消費者資料及確保適合度
(assert (= penalty
   (or (not agent_broker_license_and_insurance)
       (not broker_written_report_and_fee_disclosure)
       (not understanding_and_suitability)
       (not broker_duty_of_care_and_fiduciary)
       (not underwriting_internal_control_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= financial_consumer_data_fully_understood false))
(assert (= financial_product_service_suitable false))
(assert (= license_obtained true))
(assert (= guarantee_deposit_paid true))
(assert (= related_insurance_purchased true))
(assert (= duty_of_care_performed false))
(assert (= fiduciary_duty_performed false))
(assert (= written_analysis_report_provided false))
(assert (= fee_disclosure_made false))
(assert (= underwriting_personnel_qualified true))
(assert (= underwriting_suitability_evaluated_and_signed true))
(assert (= no_retroactive_policy_effect true))
(assert (= signatures_and_evidence_verified true))
(assert (= financial_underwriting_and_reporting_implemented true))
(assert (= fund_source_assessed false))
(assert (= other_protection_measures_implemented true))
(assert (= applicant_and_insured_basic_data_collected true))
(assert (= relationship_between_applicant_insured_beneficiary_collected true))
(assert (= other_regulatory_basic_data_collected true))
(assert (= consumer_basic_data_collected true))
(assert (= excluded_professional_investors false))
(assert (= is_professional_investor false))
(assert (= meets_financial_or_professional_criteria false))
(assert (= assisted_to_create_formal_appearance false))
(assert (= is_financial_consumer true))
(assert (= penalty true))
(assert (= agent_broker_license_and_insurance false))
(assert (= bank_and_securities_understanding false))
(assert (= broker_duty_of_care_and_fiduciary false))
(assert (= broker_written_report_and_fee_disclosure false))
(assert (= consumer_identity_and_financial_background_collected false))
(assert (= consumer_investment_ability_evaluated false))
(assert (= consumer_risk_preference_and_investment_experience_collected false))
(assert (= understanding_and_suitability false))
(assert (= underwriting_internal_control_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 35
; Total facts: 35
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
