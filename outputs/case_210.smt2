; SMT2 file generated from compliance case automatic
; Case ID: case_210
; Generated at: 2025-10-21T04:37:38.415456
;
; This file can be executed with Z3:
;   z3 case_210.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const actual_disbursement_date Int)
(declare-const allowed_interest_principal Real)
(declare-const central_authority_permission_granted Bool)
(declare-const compound_interest_applied Bool)
(declare-const contract_includes_adjustment_frequency Bool)
(declare-const credit_card_interest_rate_limit Real)
(declare-const credit_card_revolving_annual_interest_rate Real)
(declare-const current_consumption_included_in_principal Bool)
(declare-const disclosed_annual_fee Bool)
(declare-const disclosed_benefits_and_conditions Bool)
(declare-const disclosed_cardholder_rights Bool)
(declare-const disclosed_dispute_handling Bool)
(declare-const disclosed_fees_and_charges Bool)
(declare-const disclosed_other_regulatory_items Bool)
(declare-const disclosed_penalty_calculation Bool)
(declare-const disclosed_revolving_interest_calculation Bool)
(declare-const disclosed_revolving_interest_rate Real)
(declare-const disclosed_usage_and_loss_handling Bool)
(declare-const disclosure_plain_and_prominent Bool)
(declare-const disclosure_required Bool)
(declare-const engage_credit_card_business Bool)
(declare-const engage_money_market_business Bool)
(declare-const fees_included_in_revolving_principal Bool)
(declare-const interest_principal_accounts_compliant Bool)
(declare-const interest_start_date Int)
(declare-const law_violation Bool)
(declare-const no_compound_interest Bool)
(declare-const no_current_consumption_in_principal Bool)
(declare-const no_fee_in_principal Bool)
(declare-const penalty Bool)
(declare-const penalty_charge_method Bool)
(declare-const penalty_charge_method_compliant Bool)
(declare-const penalty_charged Bool)
(declare-const permission_required Bool)
(declare-const violated_mandatory_or_prohibitory_provisions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:permission_required] 經營貨幣市場業務或信用卡業務須經中央主管機關許可
(assert (= permission_required
   (or central_authority_permission_granted
       (not (or engage_credit_card_business engage_money_market_business)))))

; [bank:credit_card_interest_rate_limit] 信用卡循環信用利率不得超過年利率15%
(assert (= credit_card_interest_rate_limit
   (ite (>= 15.0 credit_card_revolving_annual_interest_rate) 1.0 0.0)))

; [credit_card:disclosure_required] 發卡機構應以書面或電子文件告知申請人規定事項
(assert (= disclosure_required
   (and disclosed_annual_fee
        disclosed_fees_and_charges
        (= disclosed_revolving_interest_rate 1.0)
        disclosed_revolving_interest_calculation
        disclosed_penalty_calculation
        disclosed_usage_and_loss_handling
        disclosed_cardholder_rights
        disclosed_dispute_handling
        disclosed_benefits_and_conditions
        disclosed_other_regulatory_items
        disclosure_plain_and_prominent
        contract_includes_adjustment_frequency)))

; [credit_card:no_compound_interest] 信用卡循環信用不得以複利計息
(assert (not (= compound_interest_applied no_compound_interest)))

; [credit_card:interest_start_date] 起息日不得早於實際撥款日
(assert (= interest_start_date
   (ite (>= interest_start_date actual_disbursement_date) 1 0)))

; [credit_card:no_fee_in_principal] 不得將各項費用計入循環信用本金
(assert (not (= fees_included_in_revolving_principal no_fee_in_principal)))

; [credit_card:no_current_consumption_in_principal] 不得將當期消費帳款計入當期本金計算循環信用利息
(assert (not (= current_consumption_included_in_principal
        no_current_consumption_in_principal)))

; [credit_card:allowed_interest_principal] 得計入循環信用利息本金之帳款依主管機關規定辦理
(assert (= allowed_interest_principal
   (ite interest_principal_accounts_compliant 1.0 0.0)))

; [credit_card:penalty_charge_method] 違約金收取方式依主管機關規定辦理
(assert (= penalty_charge_method
   (or penalty_charge_method_compliant (not penalty_charged))))

; [bank:law_violation] 違反銀行法或授權命令中強制或禁止規定
(assert (= law_violation violated_mandatory_or_prohibitory_provisions))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行法強制或禁止規定時處罰
(assert (= penalty law_violation))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= engage_credit_card_business true))
(assert (= central_authority_permission_granted true))
(assert (= credit_card_revolving_annual_interest_rate 16.0))
(assert (= credit_card_interest_rate_limit 16.0))
(assert (= compound_interest_applied true))
(assert (= no_compound_interest false))
(assert (= disclosed_annual_fee false))
(assert (= disclosed_fees_and_charges false))
(assert (= disclosed_revolving_interest_rate 16.0))
(assert (= disclosed_revolving_interest_calculation false))
(assert (= disclosed_penalty_calculation false))
(assert (= disclosed_usage_and_loss_handling false))
(assert (= disclosed_cardholder_rights false))
(assert (= disclosed_dispute_handling false))
(assert (= disclosed_benefits_and_conditions false))
(assert (= disclosed_other_regulatory_items false))
(assert (= disclosure_plain_and_prominent false))
(assert (= contract_includes_adjustment_frequency false))
(assert (= fees_included_in_revolving_principal true))
(assert (= no_fee_in_principal false))
(assert (= current_consumption_included_in_principal true))
(assert (= no_current_consumption_in_principal false))
(assert (= interest_principal_accounts_compliant false))
(assert (= interest_start_date 0))
(assert (= actual_disbursement_date 1))
(assert (= penalty_charged true))
(assert (= penalty_charge_method_compliant false))
(assert (= penalty_charge_method false))
(assert (= violated_mandatory_or_prohibitory_provisions true))
(assert (= law_violation true))
(assert (= penalty true))
(assert (= permission_required true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 35
; Total facts: 32
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
