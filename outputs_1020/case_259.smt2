; SMT2 file generated from compliance case automatic
; Case ID: case_259
; Generated at: 2025-10-19T11:36:02.348119
;
; This file can be executed with Z3:
;   z3 case_259.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const business_is_jewelry_industry Bool)
(declare-const business_is_lawyer_notary_accountant_related Bool)
(declare-const business_is_other_designated_non_financial Bool)
(declare-const business_is_real_estate_agent_related Bool)
(declare-const business_is_third_party_payment_service Bool)
(declare-const business_is_trust_and_company_service_provider Bool)
(declare-const control_procedures_established Bool)
(declare-const currency_transaction_defined Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const designated_non_financial_business_defined Bool)
(declare-const financial_institution_defined Bool)
(declare-const implementation_rules_complied Bool)
(declare-const inspection_obstructed Bool)
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
(declare-const institution_is_postal_financial_institution Bool)
(declare-const institution_is_securities_central_depository Bool)
(declare-const institution_is_securities_finance_company Bool)
(declare-const institution_is_securities_firm Bool)
(declare-const institution_is_securities_investment_advisor Bool)
(declare-const institution_is_securities_investment_trust Bool)
(declare-const institution_is_trust_industry Bool)
(declare-const institution_is_trust_investment_company Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const internal_control_violation Bool)
(declare-const other_designated_matters_established Bool)
(declare-const penalty Bool)
(declare-const refuse_or_obstruct_inspection Bool)
(declare-const reporting_days_after_transaction Int)
(declare-const reporting_media_submitted Bool)
(declare-const reporting_timing_ok Bool)
(declare-const reporting_written_approved Bool)
(declare-const reporting_written_submitted Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held Bool)
(declare-const transaction_amount_ntd Real)
(declare-const transaction_amount_threshold Real)
(declare-const transaction_is_cash_payment Bool)
(declare-const transaction_is_cash_receipt Bool)
(declare-const transaction_is_currency_exchange Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures_established
        training_held
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_established)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_implemented))

; [aml:internal_control_compliance] 洗錢防制內部控制制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [aml:reporting_timing_ok] 金融機構於交易完成後五個營業日內申報達一定金額以上通貨交易
(assert (= reporting_timing_ok
   (or (and reporting_media_submitted (>= 5 reporting_days_after_transaction))
       (and (not reporting_media_submitted)
            reporting_written_submitted
            reporting_written_approved))))

; [aml:transaction_amount_threshold] 通貨交易達一定金額以上（新台幣五十萬元含等值外幣）
(assert (= transaction_amount_threshold
   (ite (<= 500000.0 transaction_amount_ntd) 1.0 0.0)))

; [aml:currency_transaction_defined] 通貨交易定義符合現金收付或換鈔交易
(assert (= currency_transaction_defined
   (or transaction_is_currency_exchange
       transaction_is_cash_receipt
       transaction_is_cash_payment)))

; [aml:financial_institution_defined] 金融機構定義符合洗錢防制法第5條規定
(assert (= financial_institution_defined
   (or institution_is_securities_finance_company
       institution_is_bill_finance_company
       institution_is_securities_investment_trust
       institution_is_fisheries_credit_department
       institution_is_agricultural_credit_department
       institution_is_futures_broker
       institution_is_bank
       institution_is_securities_central_depository
       institution_is_postal_financial_institution
       institution_is_trust_investment_company
       institution_is_securities_investment_advisor
       institution_is_trust_industry
       institution_is_national_agricultural_bank
       institution_is_securities_firm
       institution_is_insurance_company
       institution_is_other_designated_financial_institution
       institution_is_credit_cooperative
       institution_is_credit_card_company)))

; [aml:designated_non_financial_business_defined] 指定之非金融事業或人員定義符合洗錢防制法第5條規定
(assert (= designated_non_financial_business_defined
   (or business_is_real_estate_agent_related
       business_is_trust_and_company_service_provider
       business_is_third_party_payment_service
       business_is_lawyer_notary_accountant_related
       business_is_other_designated_non_financial
       business_is_jewelry_industry)))

; [aml:internal_control_violation] 違反洗錢防制法第7條未建立制度或未依規定執行
(assert (= internal_control_violation
   (or (not implementation_rules_complied) (not internal_control_established))))

; [aml:refuse_or_obstruct_inspection] 規避、拒絕或妨礙現地或非現地查核
(assert (= refuse_or_obstruct_inspection inspection_obstructed))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反未建立或未依規定執行洗錢防制制度，或規避拒絕妨礙查核時處罰
(assert (= penalty (or internal_control_violation refuse_or_obstruct_inspection)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_established false))
(assert (= internal_control_implemented false))
(assert (= implementation_rules_complied false))
(assert (= inspection_obstructed false))
(assert (= reporting_media_submitted false))
(assert (= reporting_written_submitted false))
(assert (= reporting_written_approved false))
(assert (= reporting_days_after_transaction 6))
(assert (= transaction_amount_ntd 500000.0))
(assert (= transaction_is_cash_receipt true))
(assert (= transaction_is_cash_payment false))
(assert (= transaction_is_currency_exchange false))
(assert (= institution_is_bank true))
(assert (= business_is_jewelry_industry false))
(assert (= business_is_real_estate_agent_related false))
(assert (= business_is_lawyer_notary_accountant_related false))
(assert (= business_is_trust_and_company_service_provider false))
(assert (= business_is_third_party_payment_service false))
(assert (= business_is_other_designated_non_financial false))
(assert (= designated_non_financial_business_defined false))
(assert (= financial_institution_defined true))
(assert (= currency_transaction_defined false))
(assert (= institution_is_agricultural_credit_department false))
(assert (= institution_is_bill_finance_company false))
(assert (= institution_is_credit_card_company false))
(assert (= institution_is_credit_cooperative false))
(assert (= institution_is_fisheries_credit_department false))
(assert (= institution_is_futures_broker false))
(assert (= institution_is_insurance_company false))
(assert (= institution_is_national_agricultural_bank false))
(assert (= institution_is_other_designated_financial_institution false))
(assert (= institution_is_postal_financial_institution false))
(assert (= institution_is_securities_central_depository false))
(assert (= institution_is_securities_finance_company false))
(assert (= institution_is_securities_firm false))
(assert (= institution_is_securities_investment_advisor false))
(assert (= institution_is_securities_investment_trust false))
(assert (= institution_is_trust_industry false))
(assert (= institution_is_trust_investment_company false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_violation false))
(assert (= penalty false))
(assert (= refuse_or_obstruct_inspection false))
(assert (= reporting_timing_ok false))
(assert (= transaction_amount_threshold 0.0))

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
; Total facts: 52
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
