; SMT2 file generated from compliance case automatic
; Case ID: case_209
; Generated at: 2025-10-21T04:36:18.341817
;
; This file can be executed with Z3:
;   z3 case_209.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const clear_risk_disclosure_to_client Bool)
(declare-const client_acceptance_rules_established Bool)
(declare-const client_data_collected_and_verified Bool)
(declare-const client_review_procedures_established Bool)
(declare-const client_understanding_rules_established Bool)
(declare-const consumer_data_collected_and_verified Bool)
(declare-const consumer_data_understood Bool)
(declare-const consumer_protection_compliance Bool)
(declare-const control_procedures_established Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const false_or_hidden_recommendation Bool)
(declare-const financial_institution_defined Bool)
(declare-const inspection_cooperation Bool)
(declare-const inspection_evaded_or_obstructed Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_execution_confirmed Bool)
(declare-const investment_ability_evaluated Bool)
(declare-const is_agricultural_credit_department Bool)
(declare-const is_bank Bool)
(declare-const is_bill_finance_company Bool)
(declare-const is_credit_card_company Bool)
(declare-const is_credit_cooperative Bool)
(declare-const is_designated_non_financial_business_or_personnel Bool)
(declare-const is_financing_lease_or_virtual_asset_service_provider Bool)
(declare-const is_fisheries_credit_department Bool)
(declare-const is_futures_broker Bool)
(declare-const is_insurance_company Bool)
(declare-const is_national_agricultural_bank Bool)
(declare-const is_other_designated_financial_institution Bool)
(declare-const is_postal_financial_institution Bool)
(declare-const is_securities_central_depository Bool)
(declare-const is_securities_finance_company Bool)
(declare-const is_securities_firm Bool)
(declare-const is_securities_investment_advisor Bool)
(declare-const is_securities_investment_trust Bool)
(declare-const is_trust_company Bool)
(declare-const is_trust_industry Bool)
(declare-const monitoring_mechanism_established Bool)
(declare-const non_professional_investor_compliance Bool)
(declare-const other_designated_matters_complied Bool)
(declare-const penalty Bool)
(declare-const penalty_heavy Bool)
(declare-const product_suitability_confirmed Bool)
(declare-const product_suitability_ensured Bool)
(declare-const product_suitability_rules_established Bool)
(declare-const recommendation_false_or_hidden Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const risk_level_classification_established Bool)
(declare-const serious_violation Bool)
(declare-const serious_violation_flag Bool)
(declare-const training_held_regularly Bool)
(declare-const violate_advertising_rules Bool)
(declare-const violate_compensation_rules Bool)
(declare-const violate_consumer_data_rules Bool)
(declare-const violate_disclosure_rules Bool)
(declare-const violation_advertising Bool)
(declare-const violation_compensation Bool)
(declare-const violation_consumer_data Bool)
(declare-const violation_disclosure Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures_established
        training_held_regularly
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_complied)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_execution_confirmed))

; [aml:internal_control_compliance] 洗錢防制內部控制制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [aml:inspection_cooperation] 配合中央目的事業主管機關查核
(assert (not (= inspection_evaded_or_obstructed inspection_cooperation)))

; [fcp:consumer_data_understood] 充分瞭解金融消費者相關資料
(assert (= consumer_data_understood consumer_data_collected_and_verified))

; [fcp:product_suitability_ensured] 確保金融商品或服務對金融消費者之適合度
(assert (= product_suitability_ensured product_suitability_confirmed))

; [fcp:consumer_protection_compliance] 金融消費者保護法第9條規定遵守
(assert (= consumer_protection_compliance
   (and consumer_data_understood product_suitability_ensured)))

; [fcp:violation_advertising] 違反廣告、業務招攬、營業促銷活動方式或內容規定
(assert (= violation_advertising violate_advertising_rules))

; [fcp:violation_consumer_data] 違反未充分瞭解金融消費者資料及適合度規定
(assert (= violation_consumer_data violate_consumer_data_rules))

; [fcp:violation_disclosure] 違反未充分說明金融商品、服務、契約重要內容或揭露風險規定
(assert (= violation_disclosure violate_disclosure_rules))

; [fcp:violation_compensation] 違反酬金制度訂定或執行規定
(assert (= violation_compensation violate_compensation_rules))

; [fcp:serious_violation] 違反前述規定且情節重大
(assert (= serious_violation serious_violation_flag))

; [trust:client_understanding_rules_established] 信託業建立充分瞭解客戶作業準則
(assert (= client_understanding_rules_established
   (and client_acceptance_rules_established
        client_review_procedures_established
        client_data_collected_and_verified
        investment_ability_evaluated)))

; [trust:non_professional_investor_compliance] 非專業投資人遵守商品適合度規章及風險揭露
(assert (= non_professional_investor_compliance
   (and product_suitability_rules_established
        risk_level_classification_established
        monitoring_mechanism_established
        clear_risk_disclosure_to_client)))

; [trust:false_or_hidden_recommendation] 信託業推介內容有虛偽、隱匿或未依規定辦理
(assert (= false_or_hidden_recommendation recommendation_false_or_hidden))

; [aml:financial_institution_defined] 是否為洗錢防制法定義之金融機構或指定非金融事業或人員
(assert (= financial_institution_defined
   (or is_bill_finance_company
       is_securities_finance_company
       is_futures_broker
       is_trust_industry
       is_securities_central_depository
       is_bank
       is_fisheries_credit_department
       is_securities_firm
       is_postal_financial_institution
       is_insurance_company
       is_securities_investment_advisor
       is_other_designated_financial_institution
       is_national_agricultural_bank
       is_designated_non_financial_business_or_personnel
       is_credit_card_company
       is_agricultural_credit_department
       is_securities_investment_trust
       is_financing_lease_or_virtual_asset_service_provider
       is_credit_cooperative
       is_trust_company)))

; [aml:penalty_conditions] 處罰條件：違反洗錢防制法第7條規定未建立或未執行制度，或規避查核時處罰
(assert (= penalty
   (or (not inspection_cooperation)
       (not internal_control_executed)
       (not internal_control_established))))

; [fcp:penalty_conditions] 處罰條件：違反金融消費者保護法第30-1條規定之任一情形
(assert (= penalty
   (or violation_compensation
       violation_disclosure
       violation_advertising
       violation_consumer_data)))

; [fcp:penalty_conditions_serious] 處罰條件：違反且情節重大者加重處罰
(assert (= penalty_heavy
   (and (or violation_compensation
            violation_disclosure
            violation_advertising
            violation_consumer_data)
        serious_violation)))

; [trust:penalty_conditions] 處罰條件：信託業推介內容虛偽、隱匿或未依規定辦理
(assert (= penalty false_or_hidden_recommendation))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= is_bank true))
(assert (= control_procedures_established false))
(assert (= training_held_regularly false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_complied false))
(assert (= internal_control_execution_confirmed false))
(assert (= inspection_evaded_or_obstructed false))
(assert (= consumer_data_collected_and_verified false))
(assert (= product_suitability_confirmed false))
(assert (= violate_consumer_data_rules true))
(assert (= violation_consumer_data true))
(assert (= violate_advertising_rules false))
(assert (= violation_advertising false))
(assert (= violate_disclosure_rules false))
(assert (= violation_disclosure false))
(assert (= violate_compensation_rules false))
(assert (= violation_compensation false))
(assert (= serious_violation_flag false))
(assert (= serious_violation false))
(assert (= false_or_hidden_recommendation false))
(assert (= recommendation_false_or_hidden false))
(assert (= client_acceptance_rules_established false))
(assert (= client_review_procedures_established false))
(assert (= client_data_collected_and_verified false))
(assert (= investment_ability_evaluated false))
(assert (= client_understanding_rules_established false))
(assert (= product_suitability_rules_established false))
(assert (= risk_level_classification_established false))
(assert (= monitoring_mechanism_established false))
(assert (= clear_risk_disclosure_to_client false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= inspection_cooperation true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 62
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
