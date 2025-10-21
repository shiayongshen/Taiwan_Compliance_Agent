; SMT2 file generated from compliance case automatic
; Case ID: case_259
; Generated at: 2025-10-21T05:45:53.802222
;
; This file can be executed with Z3:
;   z3 case_259.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const business_is_finance_lease_or_virtual_asset_service Bool)
(declare-const business_is_jewelry Bool)
(declare-const business_is_lawyer_notary_accountant_related Bool)
(declare-const business_is_other_high_risk_business Bool)
(declare-const business_is_real_estate_agent_related Bool)
(declare-const business_is_third_party_payment_service Bool)
(declare-const business_is_trust_and_company_service_provider Bool)
(declare-const control_procedures_established Bool)
(declare-const currency_transaction_definition Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const designated_non_financial_business_definition Bool)
(declare-const designated_use_non_cash_payment_tool Bool)
(declare-const finance_lease_and_virtual_asset_applicability Bool)
(declare-const financial_institution_definition Bool)
(declare-const inspection_evaded Bool)
(declare-const institution_is_agricultural_credit_department Bool)
(declare-const institution_is_bank Bool)
(declare-const institution_is_bill_finance_company Bool)
(declare-const institution_is_credit_card_company Bool)
(declare-const institution_is_credit_cooperative Bool)
(declare-const institution_is_fisheries_credit_department Bool)
(declare-const institution_is_futures_broker Bool)
(declare-const institution_is_insurance_company Bool)
(declare-const institution_is_national_agricultural_bank Bool)
(declare-const institution_is_other_designated_financial_institution Bool)
(declare-const institution_is_postal_savings_insurance Bool)
(declare-const institution_is_securities_central_depository Bool)
(declare-const institution_is_securities_finance Bool)
(declare-const institution_is_securities_firm Bool)
(declare-const institution_is_securities_investment_advisor Bool)
(declare-const institution_is_securities_investment_trust Bool)
(declare-const institution_is_trust_industry Bool)
(declare-const institution_is_trust_investment_company Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const other_designated_matters_established Bool)
(declare-const penalty Bool)
(declare-const reporting_days_after_transaction Int)
(declare-const reporting_media_submitted Bool)
(declare-const reporting_timing_compliance Bool)
(declare-const reporting_written_approved Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held_regularly Bool)
(declare-const transaction_amount_definition Bool)
(declare-const transaction_amount_threshold Real)
(declare-const transaction_is_cash_payment Bool)
(declare-const transaction_is_cash_receipt Bool)
(declare-const transaction_is_currency_exchange Bool)
(declare-const transaction_payment_tool_requirement Bool)

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
        other_designated_matters_established)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_implemented))

; [aml:internal_control_compliance] 洗錢防制內部控制制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [aml:reporting_timing_compliance] 金融機構於交易完成後五個營業日內申報達一定金額以上通貨交易
(assert (= reporting_timing_compliance
   (or (and reporting_media_submitted (>= 5 reporting_days_after_transaction))
       (and (not reporting_media_submitted)
            reporting_written_approved
            (>= 5 reporting_days_after_transaction)))))

; [aml:transaction_amount_definition] 一定金額定義為新台幣五十萬元含等值外幣
(assert (= transaction_amount_definition (= 500000.0 transaction_amount_threshold)))

; [aml:currency_transaction_definition] 通貨交易定義為單筆現金收付或換鈔交易
(assert (= currency_transaction_definition
   (or transaction_is_cash_payment
       transaction_is_cash_receipt
       transaction_is_currency_exchange)))

; [aml:financial_institution_definition] 金融機構定義包含銀行、信託投資公司、信用合作社等多種機構
(assert (= financial_institution_definition
   (or institution_is_trust_industry
       institution_is_securities_firm
       institution_is_securities_finance
       institution_is_credit_card_company
       institution_is_postal_savings_insurance
       institution_is_insurance_company
       institution_is_other_designated_financial_institution
       institution_is_futures_broker
       institution_is_securities_central_depository
       institution_is_securities_investment_trust
       institution_is_fisheries_credit_department
       institution_is_national_agricultural_bank
       institution_is_securities_investment_advisor
       institution_is_bank
       institution_is_credit_cooperative
       institution_is_agricultural_credit_department
       institution_is_trust_investment_company
       institution_is_bill_finance_company)))

; [aml:designated_non_financial_business_definition] 指定非金融事業或人員定義
(assert (= designated_non_financial_business_definition
   (or business_is_other_high_risk_business
       business_is_lawyer_notary_accountant_related
       business_is_trust_and_company_service_provider
       business_is_jewelry
       business_is_third_party_payment_service
       business_is_real_estate_agent_related)))

; [aml:finance_lease_and_virtual_asset_applicability] 融資性租賃及虛擬資產服務事業適用金融機構規定
(assert (= finance_lease_and_virtual_asset_applicability
   business_is_finance_lease_or_virtual_asset_service))

; [aml:transaction_payment_tool_requirement] 必要時指定達一定金額交易應使用現金以外支付工具
(assert (= transaction_payment_tool_requirement designated_use_non_cash_payment_tool))

; [aml:penalty_default_false] 預設不處罰
(assert (not penalty))

; [aml:penalty_conditions] 處罰條件：違反洗錢防制內部控制制度建立或執行規定，或違反通貨交易申報規定，或規避查核者處罰
(assert (= penalty
   (or inspection_evaded
       (not internal_control_established)
       (not internal_control_executed)
       (not reporting_timing_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held_regularly true))
(assert (= dedicated_personnel_assigned true))
(assert (= risk_assessment_report_updated true))
(assert (= audit_procedures_established true))
(assert (= other_designated_matters_established true))
(assert (= internal_control_implemented false))
(assert (= reporting_media_submitted false))
(assert (= reporting_written_approved false))
(assert (= reporting_days_after_transaction 10))
(assert (= inspection_evaded false))
(assert (= transaction_amount_threshold 500000))
(assert (= transaction_is_cash_receipt true))
(assert (= transaction_is_cash_payment false))
(assert (= transaction_is_currency_exchange false))
(assert (= designated_use_non_cash_payment_tool false))
(assert (= business_is_finance_lease_or_virtual_asset_service false))
(assert (= business_is_jewelry false))
(assert (= business_is_lawyer_notary_accountant_related false))
(assert (= business_is_other_high_risk_business false))
(assert (= business_is_real_estate_agent_related false))
(assert (= business_is_third_party_payment_service false))
(assert (= business_is_trust_and_company_service_provider false))
(assert (= financial_institution_definition true))
(assert (= institution_is_bank true))
(assert (= institution_is_trust_investment_company false))
(assert (= institution_is_credit_cooperative false))
(assert (= institution_is_agricultural_credit_department false))
(assert (= institution_is_fisheries_credit_department false))
(assert (= institution_is_national_agricultural_bank false))
(assert (= institution_is_postal_savings_insurance false))
(assert (= institution_is_bill_finance_company false))
(assert (= institution_is_credit_card_company false))
(assert (= institution_is_insurance_company false))
(assert (= institution_is_securities_firm false))
(assert (= institution_is_securities_investment_trust false))
(assert (= institution_is_securities_finance false))
(assert (= institution_is_securities_investment_advisor false))
(assert (= institution_is_securities_central_depository false))
(assert (= institution_is_futures_broker false))
(assert (= institution_is_trust_industry false))
(assert (= institution_is_other_designated_financial_institution false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 52
; Total facts: 42
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
