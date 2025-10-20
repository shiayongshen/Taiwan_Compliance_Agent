; SMT2 file generated from compliance case automatic
; Case ID: case_210
; Generated at: 2025-10-19T10:33:26.487489
;
; This file can be executed with Z3:
;   z3 case_210.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const cash_card_and_credit_card_interest_rate_limit Real)
(declare-const cash_card_interest_rate_annual_percent Real)
(declare-const central_authority_permission_granted Bool)
(declare-const comply_with_standard_contract_provisions Bool)
(declare-const contract_specifies_adjustment_frequency_for_fee_and_benefits Bool)
(declare-const credit_card_revolving_credit_interest_rate_annual_percent Real)
(declare-const current_consumption_not_included_in_current_principal Bool)
(declare-const default_penalty_charged Bool)
(declare-const default_penalty_collection_method_compliance Bool)
(declare-const default_penalty_collection_method_complies Bool)
(declare-const disclosed_annual_fee Bool)
(declare-const disclosed_benefits_and_conditions Bool)
(declare-const disclosed_cardholder_rights_and_obligations Bool)
(declare-const disclosed_default_penalty_calculation Bool)
(declare-const disclosed_dispute_handling_procedures Bool)
(declare-const disclosed_fees_and_charges Bool)
(declare-const disclosed_other_regulatory_matters Bool)
(declare-const disclosed_revolving_credit_rate_and_interest Bool)
(declare-const disclosed_usage_and_loss_handling Bool)
(declare-const disclosure_plain_and_prominent Bool)
(declare-const disclosure_requirements Bool)
(declare-const engage_credit_card_business Bool)
(declare-const engage_money_market_business Bool)
(declare-const fees_not_included_in_revolving_principal Bool)
(declare-const interest_calculation_rules Bool)
(declare-const interest_start_date_not_before_actual_disbursement Bool)
(declare-const no_compound_interest Bool)
(declare-const penalty Bool)
(declare-const permission_required_for_money_market_or_credit_card Bool)
(declare-const principal_of_interest_included_accounts_comply_with_regulations Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:permission_required_for_money_market_or_credit_card] 經營貨幣市場業務或信用卡業務須經中央主管機關許可
(assert (= permission_required_for_money_market_or_credit_card
   (or (not (or engage_credit_card_business engage_money_market_business))
       central_authority_permission_granted)))

; [bank:cash_card_and_credit_card_interest_rate_limit] 現金卡利率及信用卡循環信用利率不得超過年利率15%
(assert (= cash_card_and_credit_card_interest_rate_limit
   (ite (and (>= 15.0 cash_card_interest_rate_annual_percent)
             (>= 15.0 credit_card_revolving_credit_interest_rate_annual_percent))
        1.0
        0.0)))

; [credit_card:disclosure_requirements] 發卡機構應以書面或電子文件告知申請人規定事項
(assert (= disclosure_requirements
   (and disclosed_annual_fee
        disclosed_fees_and_charges
        disclosed_revolving_credit_rate_and_interest
        disclosed_default_penalty_calculation
        disclosed_usage_and_loss_handling
        disclosed_cardholder_rights_and_obligations
        disclosed_dispute_handling_procedures
        disclosed_benefits_and_conditions
        disclosed_other_regulatory_matters
        disclosure_plain_and_prominent
        contract_specifies_adjustment_frequency_for_fee_and_benefits)))

; [credit_card:interest_calculation_rules] 信用卡循環信用計息方式符合規定
(assert (= interest_calculation_rules
   (and no_compound_interest
        interest_start_date_not_before_actual_disbursement
        comply_with_standard_contract_provisions
        fees_not_included_in_revolving_principal
        current_consumption_not_included_in_current_principal
        principal_of_interest_included_accounts_comply_with_regulations)))

; [credit_card:default_penalty_collection_method_compliance] 違約金收取方式符合主管機關規定
(assert (= default_penalty_collection_method_compliance
   (or default_penalty_collection_method_complies (not default_penalty_charged))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行法及信用卡業務管理辦法相關規定時處罰
(assert (= penalty
   (or (and default_penalty_charged
            (not default_penalty_collection_method_complies))
       (not (>= 15.0 cash_card_interest_rate_annual_percent))
       (not disclosure_requirements)
       (not interest_calculation_rules)
       (and (or engage_credit_card_business engage_money_market_business)
            (not central_authority_permission_granted))
       (not (>= 15.0 credit_card_revolving_credit_interest_rate_annual_percent)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= engage_credit_card_business true))
(assert (= central_authority_permission_granted true))
(assert (= cash_card_interest_rate_annual_percent 15.0))
(assert (= credit_card_revolving_credit_interest_rate_annual_percent 15.0))
(assert (= disclosed_annual_fee true))
(assert (= disclosed_fees_and_charges true))
(assert (= disclosed_revolving_credit_rate_and_interest true))
(assert (= disclosed_default_penalty_calculation true))
(assert (= disclosed_usage_and_loss_handling true))
(assert (= disclosed_cardholder_rights_and_obligations true))
(assert (= disclosed_dispute_handling_procedures true))
(assert (= disclosed_benefits_and_conditions true))
(assert (= disclosed_other_regulatory_matters true))
(assert (= disclosure_plain_and_prominent true))
(assert (= contract_specifies_adjustment_frequency_for_fee_and_benefits true))
(assert (= no_compound_interest true))
(assert (= interest_start_date_not_before_actual_disbursement true))
(assert (= comply_with_standard_contract_provisions true))
(assert (= fees_not_included_in_revolving_principal true))
(assert (= current_consumption_not_included_in_current_principal true))
(assert (= principal_of_interest_included_accounts_comply_with_regulations true))
(assert (= default_penalty_charged false))
(assert (= default_penalty_collection_method_complies true))
(assert (= cash_card_and_credit_card_interest_rate_limit 0.0))
(assert (= default_penalty_collection_method_compliance false))
(assert (= disclosure_requirements false))
(assert (= engage_money_market_business false))
(assert (= interest_calculation_rules false))
(assert (= penalty false))
(assert (= permission_required_for_money_market_or_credit_card false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 30
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
