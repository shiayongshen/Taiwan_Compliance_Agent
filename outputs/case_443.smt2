; SMT2 file generated from compliance case automatic
; Case ID: case_443
; Generated at: 2025-10-21T09:58:06.541559
;
; This file can be executed with Z3:
;   z3 case_443.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const duty_of_care_and_loyalty_followed Bool)
(declare-const fiduciary_duty_met Bool)
(declare-const fraud_or_misleading_behavior Bool)
(declare-const fund_holding_stock_or_equity_derivative Bool)
(declare-const insider_trading_or_leakage Bool)
(declare-const manipulate_market_price_or_harm_investors Bool)
(declare-const no_prohibited_behaviors Bool)
(declare-const not_return_commission_or_benefits_to_fund Bool)
(declare-const other_behaviors_harming_investors_or_company Bool)
(declare-const penalty Bool)
(declare-const person_is_legal_person Bool)
(declare-const person_is_natural_person Bool)
(declare-const person_or_related_party_trading Bool)
(declare-const prohibited_trading_period Bool)
(declare-const providing_or_receiving_undue_benefits_for_promotion Bool)
(declare-const publicly_recommend_or_forecast_specific_securities Bool)
(declare-const related_party_definition_ok Bool)
(declare-const related_party_is_controlled_or_mutually_controlled_legal_person Bool)
(declare-const related_party_is_spouse_or_second_degree_blood_relative_or_enterprise_responsible_by_person_or_spouse Bool)
(declare-const reported_to_fund_company Bool)
(declare-const reporting_obligation Bool)
(declare-const self_dealing_or_undue_related_party_trading Bool)
(declare-const selling_proxy_votes_for_money_or_benefits Bool)
(declare-const transfer_orders_between_fund_and_other_accounts Bool)
(declare-const unauthorized_agent_trading_except_legal_agent Bool)
(declare-const use_nonprofessional_to_recruit_or_pay_unreasonable_commission Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:prohibited_trading_period] 負責人及關係人於基金持有期間不得從事該公司股票及具股權性質衍生商品交易
(assert (= prohibited_trading_period
   (or (not fund_holding_stock_or_equity_derivative)
       (not person_or_related_party_trading))))

; [securities:reporting_obligation] 負責人及關係人應依主管機關規定申報交易情形
(assert (= reporting_obligation reported_to_fund_company))

; [securities:related_party_definition] 關係人定義符合主管機關規定
(assert (= related_party_definition_ok
   (or (and person_is_natural_person
            related_party_is_spouse_or_second_degree_blood_relative_or_enterprise_responsible_by_person_or_spouse)
       (and person_is_legal_person
            related_party_is_controlled_or_mutually_controlled_legal_person))))

; [securities:fiduciary_duty] 負責人及業務人員應以善良管理人注意義務及忠實義務執行業務
(assert (= fiduciary_duty_met duty_of_care_and_loyalty_followed))

; [securities:prohibited_behaviors] 不得有法令禁止之不當行為
(assert (= no_prohibited_behaviors
   (and (not insider_trading_or_leakage)
        (not self_dealing_or_undue_related_party_trading)
        (not fraud_or_misleading_behavior)
        (not not_return_commission_or_benefits_to_fund)
        (not providing_or_receiving_undue_benefits_for_promotion)
        (not selling_proxy_votes_for_money_or_benefits)
        (not manipulate_market_price_or_harm_investors)
        (not transfer_orders_between_fund_and_other_accounts)
        (not publicly_recommend_or_forecast_specific_securities)
        (not use_nonprofessional_to_recruit_or_pay_unreasonable_commission)
        (not unauthorized_agent_trading_except_legal_agent)
        (not other_behaviors_harming_investors_or_company))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反禁止交易期間規定或未申報交易或違反禁止行為時處罰
(assert (= penalty
   (or (and fund_holding_stock_or_equity_derivative
            person_or_related_party_trading)
       (not no_prohibited_behaviors)
       (not reporting_obligation))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fund_holding_stock_or_equity_derivative true))
(assert (= person_or_related_party_trading true))
(assert (= reported_to_fund_company false))
(assert (= reporting_obligation false))
(assert (= insider_trading_or_leakage true))
(assert (= self_dealing_or_undue_related_party_trading true))
(assert (= fraud_or_misleading_behavior false))
(assert (= not_return_commission_or_benefits_to_fund false))
(assert (= providing_or_receiving_undue_benefits_for_promotion false))
(assert (= selling_proxy_votes_for_money_or_benefits false))
(assert (= manipulate_market_price_or_harm_investors false))
(assert (= transfer_orders_between_fund_and_other_accounts false))
(assert (= publicly_recommend_or_forecast_specific_securities false))
(assert (= use_nonprofessional_to_recruit_or_pay_unreasonable_commission false))
(assert (= unauthorized_agent_trading_except_legal_agent false))
(assert (= other_behaviors_harming_investors_or_company false))
(assert (= prohibited_trading_period false))
(assert (= duty_of_care_and_loyalty_followed false))
(assert (= fiduciary_duty_met false))
(assert (= related_party_definition_ok true))
(assert (= person_is_natural_person true))
(assert (= person_is_legal_person false))
(assert (= related_party_is_spouse_or_second_degree_blood_relative_or_enterprise_responsible_by_person_or_spouse true))
(assert (= related_party_is_controlled_or_mutually_controlled_legal_person false))
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
; Total variables: 26
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
