; SMT2 file generated from compliance case automatic
; Case ID: case_51
; Generated at: 2025-10-21T00:15:01.401749
;
; This file can be executed with Z3:
;   z3 case_51.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const ad_and_promotion_rules_complied Bool)
(declare-const agent_license_and_insurance Bool)
(declare-const bank_product_review_committee_established Bool)
(declare-const bank_product_suitability_evaluated Bool)
(declare-const bank_securities_consumer_data_compliance Bool)
(declare-const bank_securities_investment_ability_assessed Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_written_report_and_fee_disclosure Bool)
(declare-const compensation_system_established Bool)
(declare-const compensation_system_executed Bool)
(declare-const compliance_with_ad_rules Bool)
(declare-const compliance_with_compensation_rules Bool)
(declare-const compliance_with_disclosure_rules Bool)
(declare-const compliance_with_suitability_rules Bool)
(declare-const consumer_confirmation_obtained Bool)
(declare-const consumer_data_fully_understood Bool)
(declare-const consumer_data_understood Bool)
(declare-const consumer_identity_recorded Bool)
(declare-const consumer_risk_and_product_risk_classified Bool)
(declare-const consumer_risk_level_classified Bool)
(declare-const consumer_understands_investment_risk_borne Bool)
(declare-const consumer_understands_premium_usage Bool)
(declare-const contract_purpose_and_needs_recorded Bool)
(declare-const disclosure_fully_explained Bool)
(declare-const disclosure_rules_complied Bool)
(declare-const duty_of_care_observed Bool)
(declare-const duty_of_loyalty_observed Bool)
(declare-const fee_disclosure_made Bool)
(declare-const financial_background_recorded Bool)
(declare-const fund_operation_status_considered Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const income_and_fund_source_recorded Bool)
(declare-const insurance_product_suitability_considered Bool)
(declare-const insurance_type_amount_and_premium_match_needs Bool)
(declare-const investment_attributes_and_risk_tolerance_considered Bool)
(declare-const investment_attributes_considered Bool)
(declare-const investment_experience_recorded Bool)
(declare-const license_permitted_by_authority Bool)
(declare-const penalty Bool)
(declare-const product_characteristics_evaluated Bool)
(declare-const product_risk_level_classified Bool)
(declare-const product_service_suitability_ensured Bool)
(declare-const product_suitability_confirmed Bool)
(declare-const professional_ability_considered Bool)
(declare-const related_insurance_purchased Bool)
(declare-const risk_preference_recorded Bool)
(declare-const risk_tolerance_considered Bool)
(declare-const risk_understanding_considered Bool)
(declare-const service_suitability_considered Bool)
(declare-const suitability_ensured Bool)
(declare-const suitability_related_rules_complied Bool)
(declare-const transaction_control_mechanism_established Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [financial:consumer_data_understood] 金融服務業充分瞭解金融消費者相關資料
(assert (= consumer_data_understood consumer_data_fully_understood))

; [financial:suitability_ensured] 金融服務業確保商品或服務對金融消費者之適合度
(assert (= suitability_ensured product_service_suitability_ensured))

; [financial:compliance_with_ad_rules] 遵守第八條第二項辦法中廣告、業務招攬、營業促銷方式及內容規定
(assert (= compliance_with_ad_rules ad_and_promotion_rules_complied))

; [financial:compliance_with_suitability_rules] 遵守第九條第一項及第二項辦法中適合度相關規定
(assert (= compliance_with_suitability_rules
   (and consumer_data_understood
        suitability_ensured
        suitability_related_rules_complied)))

; [financial:compliance_with_disclosure_rules] 遵守第十條第一項及第三項辦法中說明、揭露規定
(assert (= compliance_with_disclosure_rules
   (and disclosure_fully_explained disclosure_rules_complied)))

; [financial:compliance_with_compensation_rules] 遵守第十一條之一規定，訂定並確實執行酬金制度
(assert (= compliance_with_compensation_rules
   (and compensation_system_established compensation_system_executed)))

; [insurance:agent_license_and_insurance] 保險代理人、經紀人、公證人經主管機關許可，繳存保證金並投保相關保險
(assert (= agent_license_and_insurance
   (and license_permitted_by_authority
        guarantee_deposit_paid
        related_insurance_purchased)))

; [insurance:broker_duty_of_care] 保險經紀人以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care (and duty_of_care_observed duty_of_loyalty_observed)))

; [insurance:broker_written_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內提供書面分析報告並明確告知報酬收取標準
(assert (= broker_written_report_and_fee_disclosure
   (and written_analysis_report_provided fee_disclosure_made)))

; [financial:bank_securities_consumer_data_compliance] 銀行業及證券期貨業充分瞭解金融消費者相關資料並留存基本資料
(assert (= bank_securities_consumer_data_compliance
   (and consumer_identity_recorded
        financial_background_recorded
        income_and_fund_source_recorded
        risk_preference_recorded
        investment_experience_recorded
        contract_purpose_and_needs_recorded
        consumer_confirmation_obtained)))

; [financial:bank_securities_investment_ability_assessed] 銀行業及證券期貨業綜合考量資料評估金融消費者投資能力
(assert (= bank_securities_investment_ability_assessed
   (and fund_operation_status_considered
        professional_ability_considered
        investment_attributes_considered
        risk_understanding_considered
        risk_tolerance_considered
        service_suitability_considered)))

; [financial:bank_product_suitability_evaluated] 銀行業及證券期貨業依商品特性評估商品或服務適合度，銀行設立商品審查小組
(assert (= bank_product_suitability_evaluated
   (and product_characteristics_evaluated
        product_suitability_confirmed
        bank_product_review_committee_established)))

; [financial:consumer_risk_and_product_risk_classified] 金融消費者風險承受等級及金融商品或服務風險等級分類
(assert (= consumer_risk_and_product_risk_classified
   (and consumer_risk_level_classified product_risk_level_classified)))

; [insurance:insurance_product_suitability_considered] 保險業提供投資型保險商品前考量適合度事項
(assert (= insurance_product_suitability_considered
   (and consumer_understands_premium_usage
        insurance_type_amount_and_premium_match_needs
        investment_attributes_and_risk_tolerance_considered
        consumer_understands_investment_risk_borne
        transaction_control_mechanism_established)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融消費者保護法及相關辦法規定時處罰
(assert (= penalty
   (or (not agent_license_and_insurance)
       (not broker_written_report_and_fee_disclosure)
       (not insurance_product_suitability_considered)
       (not broker_duty_of_care)
       (not consumer_risk_and_product_risk_classified)
       (not bank_product_suitability_evaluated)
       (not compliance_with_suitability_rules)
       (not compliance_with_disclosure_rules)
       (not compliance_with_ad_rules)
       (not compliance_with_compensation_rules)
       (not bank_securities_investment_ability_assessed)
       (not bank_securities_consumer_data_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= ad_and_promotion_rules_complied true))
(assert (= agent_license_and_insurance true))
(assert (= bank_product_review_committee_established true))
(assert (= bank_product_suitability_evaluated true))
(assert (= bank_securities_consumer_data_compliance false))
(assert (= bank_securities_investment_ability_assessed true))
(assert (= broker_duty_of_care true))
(assert (= broker_written_report_and_fee_disclosure true))
(assert (= compensation_system_established true))
(assert (= compensation_system_executed true))
(assert (= compliance_with_ad_rules true))
(assert (= compliance_with_compensation_rules true))
(assert (= compliance_with_disclosure_rules true))
(assert (= compliance_with_suitability_rules false))
(assert (= consumer_confirmation_obtained true))
(assert (= consumer_data_fully_understood false))
(assert (= consumer_data_understood false))
(assert (= consumer_identity_recorded true))
(assert (= consumer_risk_and_product_risk_classified true))
(assert (= consumer_risk_level_classified true))
(assert (= consumer_understands_investment_risk_borne false))
(assert (= consumer_understands_premium_usage false))
(assert (= contract_purpose_and_needs_recorded true))
(assert (= disclosure_fully_explained true))
(assert (= disclosure_rules_complied true))
(assert (= duty_of_care_observed true))
(assert (= duty_of_loyalty_observed true))
(assert (= fee_disclosure_made true))
(assert (= financial_background_recorded true))
(assert (= fund_operation_status_considered true))
(assert (= guarantee_deposit_paid true))
(assert (= income_and_fund_source_recorded false))
(assert (= insurance_product_suitability_considered false))
(assert (= insurance_type_amount_and_premium_match_needs false))
(assert (= investment_attributes_and_risk_tolerance_considered false))
(assert (= investment_attributes_considered true))
(assert (= investment_experience_recorded true))
(assert (= license_permitted_by_authority true))
(assert (= penalty true))
(assert (= product_characteristics_evaluated true))
(assert (= product_risk_level_classified true))
(assert (= product_service_suitability_ensured false))
(assert (= product_suitability_confirmed true))
(assert (= professional_ability_considered true))
(assert (= related_insurance_purchased true))
(assert (= risk_preference_recorded true))
(assert (= risk_tolerance_considered true))
(assert (= risk_understanding_considered true))
(assert (= service_suitability_considered true))
(assert (= suitability_ensured false))
(assert (= suitability_related_rules_complied false))
(assert (= transaction_control_mechanism_established false))
(assert (= written_analysis_report_provided true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 53
; Total facts: 53
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
