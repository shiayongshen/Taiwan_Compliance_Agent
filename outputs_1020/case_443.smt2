; SMT2 file generated from compliance case automatic
; Case ID: case_443
; Generated at: 2025-10-19T16:06:14.755754
;
; This file can be executed with Z3:
;   z3 case_443.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const confidentiality_duty Bool)
(declare-const confidentiality_observed Bool)
(declare-const duty_of_care_and_loyalty_observed Bool)
(declare-const failure_to_return_commission_or_benefits_to_fund Bool)
(declare-const fraudulent_or_misleading_acts Bool)
(declare-const fund_holding_stock_or_equity_derivative Bool)
(declare-const good_faith_duty Bool)
(declare-const improper_account_transfer_between_fund_and_others Bool)
(declare-const insider_trading_or_leakage Bool)
(declare-const manipulating_security_prices_or_harming_investors Bool)
(declare-const other_acts_harming_beneficiaries_or_fund_operations Bool)
(declare-const penalty Bool)
(declare-const person_or_related_party_trading Bool)
(declare-const prohibited_behaviors Bool)
(declare-const prohibited_trading_period Bool)
(declare-const providing_or_receiving_undue_benefits_for_promotion Bool)
(declare-const public_promotion_or_forecasting_of_specific_securities Bool)
(declare-const self_dealing_or_conflict_of_interest Bool)
(declare-const selling_proxy_votes_for_money_or_benefits Bool)
(declare-const trading_declaration_required Bool)
(declare-const trading_reported_to_fund Bool)
(declare-const unauthorized_agent_trading_except_legal_representative Bool)
(declare-const using_non_professional_personnel_or_unreasonable_commissions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:prohibited_trading_period] 負責人及關係人於基金持有期間不得從事該公司股票及具股權性質衍生商品交易
(assert (= prohibited_trading_period
   (or (not fund_holding_stock_or_equity_derivative)
       (not person_or_related_party_trading))))

; [securities:trading_declaration_required] 負責人及關係人從事公司股票及具股權性質衍生商品交易應申報
(assert (= trading_declaration_required
   (or (not person_or_related_party_trading) trading_reported_to_fund)))

; [securities:good_faith_duty] 負責人及業務人員應以善良管理人注意義務及忠實義務執行業務
(assert (= good_faith_duty duty_of_care_and_loyalty_observed))

; [securities:prohibited_behaviors] 負責人及業務人員不得有法令禁止之不當行為
(assert (not (= (or providing_or_receiving_undue_benefits_for_promotion
            self_dealing_or_conflict_of_interest
            other_acts_harming_beneficiaries_or_fund_operations
            failure_to_return_commission_or_benefits_to_fund
            fraudulent_or_misleading_acts
            unauthorized_agent_trading_except_legal_representative
            improper_account_transfer_between_fund_and_others
            using_non_professional_personnel_or_unreasonable_commissions
            selling_proxy_votes_for_money_or_benefits
            insider_trading_or_leakage
            manipulating_security_prices_or_harming_investors
            public_promotion_or_forecasting_of_specific_securities)
        prohibited_behaviors)))

; [securities:confidentiality_duty] 負責人及業務人員應保守受益人及客戶資料秘密
(assert (= confidentiality_duty confidentiality_observed))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反禁止交易期間規定、未申報交易、違反善良管理義務、從事禁止行為或違反保密義務時處罰
(assert (= penalty
   (or (not prohibited_behaviors)
       (and person_or_related_party_trading (not trading_reported_to_fund))
       (not confidentiality_duty)
       (and fund_holding_stock_or_equity_derivative
            person_or_related_party_trading)
       (not good_faith_duty))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fund_holding_stock_or_equity_derivative true))
(assert (= person_or_related_party_trading true))
(assert (= trading_reported_to_fund false))
(assert (= duty_of_care_and_loyalty_observed false))
(assert (= insider_trading_or_leakage true))
(assert (= self_dealing_or_conflict_of_interest false))
(assert (= fraudulent_or_misleading_acts false))
(assert (= failure_to_return_commission_or_benefits_to_fund false))
(assert (= providing_or_receiving_undue_benefits_for_promotion false))
(assert (= selling_proxy_votes_for_money_or_benefits false))
(assert (= manipulating_security_prices_or_harming_investors false))
(assert (= improper_account_transfer_between_fund_and_others false))
(assert (= public_promotion_or_forecasting_of_specific_securities false))
(assert (= using_non_professional_personnel_or_unreasonable_commissions false))
(assert (= unauthorized_agent_trading_except_legal_representative false))
(assert (= other_acts_harming_beneficiaries_or_fund_operations false))
(assert (= confidentiality_observed true))
(assert (= confidentiality_duty true))
(assert (= good_faith_duty false))
(assert (= prohibited_behaviors false))
(assert (= prohibited_trading_period false))
(assert (= trading_declaration_required true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 23
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
