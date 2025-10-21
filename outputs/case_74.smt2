; SMT2 file generated from compliance case automatic
; Case ID: case_74
; Generated at: 2025-10-21T00:48:24.502173
;
; This file can be executed with Z3:
;   z3 case_74.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const consumer_data_fully_understood Bool)
(declare-const consumer_investment_risk_understood Bool)
(declare-const consumer_understands_premium_usage Bool)
(declare-const customer_foreign_exchange_risk_tolerance_known Bool)
(declare-const insurance_consumer_data_complete Bool)
(declare-const insurance_consumer_data_minimum_fields Bool)
(declare-const insurance_investment_suitability_ok Bool)
(declare-const insurance_non_investment_suitability_ok Bool)
(declare-const insurance_product_foreign_currency Bool)
(declare-const insurance_type_amount_premium_match_needs Bool)
(declare-const insured_person_basic_data_complete Bool)
(declare-const insured_relationships_known Bool)
(declare-const legal_person_minimum_fields_complete Bool)
(declare-const natural_person_minimum_fields_complete Bool)
(declare-const other_regulatory_basic_data_complete Bool)
(declare-const penalty Bool)
(declare-const product_service_suitable Bool)
(declare-const transaction_control_mechanism_established Bool)
(declare-const understand_and_suitability Bool)
(declare-const violation_article_30_1_2 Bool)
(declare-const violation_article_30_1_2_insurance Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [finance_consumer:understand_and_suitability] 金融服務業充分瞭解金融消費者相關資料並確保適合度
(assert (= understand_and_suitability
   (and consumer_data_fully_understood product_service_suitable)))

; [finance_consumer:insurance_consumer_data_complete] 保險業充分瞭解金融消費者基本資料
(assert (= insurance_consumer_data_complete
   (and insured_person_basic_data_complete
        insured_relationships_known
        other_regulatory_basic_data_complete)))

; [finance_consumer:insurance_consumer_data_minimum_fields] 保險業基本資料包含姓名、性別、出生年月日、身分證字號及聯絡方式（自然人）或法人名稱、代表人、地址、聯絡電話（法人）
(assert (= insurance_consumer_data_minimum_fields
   (and natural_person_minimum_fields_complete
        legal_person_minimum_fields_complete)))

; [finance_consumer:insurance_suitability_considerations_investment] 保險業提供投資型保險商品前適合度考量事項
(assert (= insurance_investment_suitability_ok
   (and consumer_understands_premium_usage
        insurance_type_amount_premium_match_needs
        consumer_investment_risk_understood
        transaction_control_mechanism_established)))

; [finance_consumer:insurance_suitability_considerations_non_investment] 保險業提供財產保險及非投資型保險商品前適合度考量事項
(assert (= insurance_non_investment_suitability_ok
   (and consumer_understands_premium_usage
        insurance_type_amount_premium_match_needs
        (or (not insurance_product_foreign_currency)
            customer_foreign_exchange_risk_tolerance_known))))

; [finance_consumer:violation_article_30_1_2] 違反金融消費者保護法第9條第一項未充分瞭解及確保適合度
(assert (not (= understand_and_suitability violation_article_30_1_2)))

; [finance_consumer:violation_article_30_1_2_insurance] 違反金融消費者保護法第9條第一項及相關辦法保險業務適合度規定
(assert (not (= (or insurance_investment_suitability_ok
            insurance_non_investment_suitability_ok)
        violation_article_30_1_2_insurance)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第9條未充分瞭解及確保適合度或保險業未符合適合度規定時處罰
(assert (= penalty (or violation_article_30_1_2 violation_article_30_1_2_insurance)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= consumer_data_fully_understood false))
(assert (= product_service_suitable false))
(assert (= understand_and_suitability false))
(assert (= violation_article_30_1_2 true))
(assert (= insurance_investment_suitability_ok false))
(assert (= insurance_non_investment_suitability_ok false))
(assert (= violation_article_30_1_2_insurance true))
(assert (= consumer_understands_premium_usage false))
(assert (= insurance_type_amount_premium_match_needs false))
(assert (= customer_foreign_exchange_risk_tolerance_known false))
(assert (= insurance_product_foreign_currency true))
(assert (= consumer_investment_risk_understood false))
(assert (= transaction_control_mechanism_established false))
(assert (= insurance_consumer_data_complete false))
(assert (= insured_person_basic_data_complete false))
(assert (= insured_relationships_known false))
(assert (= other_regulatory_basic_data_complete false))
(assert (= insurance_consumer_data_minimum_fields false))
(assert (= natural_person_minimum_fields_complete false))
(assert (= legal_person_minimum_fields_complete false))
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
; Total variables: 21
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
