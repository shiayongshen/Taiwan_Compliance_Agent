; SMT2 file generated from compliance case automatic
; Case ID: case_74
; Generated at: 2025-10-19T07:13:44.099382
;
; This file can be executed with Z3:
;   z3 case_74.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const compliance_suitability Bool)
(declare-const consumer_data_fully_understood Bool)
(declare-const consumer_understands_exchange_rate_risk Bool)
(declare-const consumer_understands_premium_usage Bool)
(declare-const ensure_suitability Bool)
(declare-const insurance_acceptance_conditions_set Bool)
(declare-const insurance_acceptance_principle Bool)
(declare-const insurance_investment_suitability Bool)
(declare-const insurance_non_investment_suitability Bool)
(declare-const insurance_product_foreign_currency Bool)
(declare-const insurance_purpose_understood Bool)
(declare-const insurance_type_amount_premium_match_needs Bool)
(declare-const insurance_understand_basic_data Bool)
(declare-const insurance_understand_review_principle Bool)
(declare-const insured_person_basic_data_included Bool)
(declare-const insured_person_relationship_confirmed Bool)
(declare-const investment_attribute_risk_tolerance_confirmed Bool)
(declare-const other_regulatory_basic_data_included Bool)
(declare-const penalty Bool)
(declare-const product_service_suitability_confirmed Bool)
(declare-const transaction_control_mechanism_established Bool)
(declare-const understand_consumer_data Bool)
(declare-const underwriting_procedure_performed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [financial_consumer:understand_consumer_data] 金融服務業應充分瞭解金融消費者相關資料
(assert (= understand_consumer_data consumer_data_fully_understood))

; [financial_consumer:ensure_suitability] 金融服務業應確保商品或服務對金融消費者之適合度
(assert (= ensure_suitability product_service_suitability_confirmed))

; [financial_consumer:insurance_understand_basic_data] 保險業應充分瞭解金融消費者基本資料
(assert (= insurance_understand_basic_data
   (and insured_person_basic_data_included
        insured_person_relationship_confirmed
        other_regulatory_basic_data_included)))

; [financial_consumer:insurance_acceptance_principle] 保險業應訂定金融消費者投保條件
(assert (= insurance_acceptance_principle insurance_acceptance_conditions_set))

; [financial_consumer:insurance_understand_review_principle] 保險業應瞭解金融消費者投保目的及需求並進行核保程序
(assert (= insurance_understand_review_principle
   (and insurance_purpose_understood underwriting_procedure_performed)))

; [financial_consumer:insurance_investment_suitability] 保險業提供投資型保險商品前應考量適合度事項
(assert (= insurance_investment_suitability
   (and consumer_understands_premium_usage
        insurance_type_amount_premium_match_needs
        investment_attribute_risk_tolerance_confirmed
        transaction_control_mechanism_established)))

; [financial_consumer:insurance_non_investment_suitability] 保險業提供非投資型保險商品前應考量適合度事項
(assert (= insurance_non_investment_suitability
   (and consumer_understands_premium_usage
        insurance_type_amount_premium_match_needs
        (or consumer_understands_exchange_rate_risk
            (not insurance_product_foreign_currency)))))

; [financial_consumer:compliance_suitability] 金融服務業符合充分瞭解及適合度規定
(assert (= compliance_suitability (and understand_consumer_data ensure_suitability)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反未充分瞭解金融消費者資料或未確保適合度時處罰
(assert (= penalty (or (not ensure_suitability) (not understand_consumer_data))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= consumer_data_fully_understood false))
(assert (= understand_consumer_data false))
(assert (= product_service_suitability_confirmed false))
(assert (= ensure_suitability false))
(assert (= insurance_understand_basic_data false))
(assert (= insured_person_basic_data_included false))
(assert (= insured_person_relationship_confirmed false))
(assert (= other_regulatory_basic_data_included false))
(assert (= insurance_acceptance_conditions_set false))
(assert (= insurance_acceptance_principle false))
(assert (= insurance_purpose_understood false))
(assert (= underwriting_procedure_performed false))
(assert (= insurance_investment_suitability false))
(assert (= consumer_understands_premium_usage false))
(assert (= insurance_type_amount_premium_match_needs false))
(assert (= investment_attribute_risk_tolerance_confirmed false))
(assert (= transaction_control_mechanism_established false))
(assert (= insurance_non_investment_suitability false))
(assert (= insurance_product_foreign_currency false))
(assert (= consumer_understands_exchange_rate_risk false))
(assert (= penalty true))
(assert (= compliance_suitability false))
(assert (= insurance_understand_review_principle false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 23
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
