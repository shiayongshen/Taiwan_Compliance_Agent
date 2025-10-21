; SMT2 file generated from compliance case automatic
; Case ID: case_161
; Generated at: 2025-10-21T03:38:18.712305
;
; This file can be executed with Z3:
;   z3 case_161.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const duty_of_care_and_loyalty_executed Bool)
(declare-const duty_of_care_and_loyalty_met Bool)
(declare-const exemption_by_authority Bool)
(declare-const failure_to_return_commission_to_fund Bool)
(declare-const fraud_or_misleading_behavior Bool)
(declare-const fund_holding_stock_or_equity_derivative Bool)
(declare-const improper_account_transfers Bool)
(declare-const improper_public_recommendations Bool)
(declare-const insider_trading_or_leakage Bool)
(declare-const manipulating_market_prices Bool)
(declare-const no_prohibited_behaviors Bool)
(declare-const other_harmful_acts_to_investors_or_fund Bool)
(declare-const penalty Bool)
(declare-const prohibited_related_party_trading Bool)
(declare-const providing_undue_benefits_for_promotion Bool)
(declare-const related_party_trading_reported Bool)
(declare-const related_person_definition_according_to_authority Bool)
(declare-const related_person_definition_ok Bool)
(declare-const related_person_trading_stock_or_equity_derivative Bool)
(declare-const self_dealing_or_conflict_of_interest Bool)
(declare-const selling_proxy_votes_for_benefits Bool)
(declare-const trading_reported_to_fund Bool)
(declare-const unauthorized_agent_trading Bool)
(declare-const unreasonable_commissions_to_nonprofessionals Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:prohibited_related_party_trading] 負責人及關係人於基金持有期間不得從事該公司股票及具股權性質衍生商品交易
(assert (= prohibited_related_party_trading
   (or (not fund_holding_stock_or_equity_derivative)
       (not (or related_person_trading_stock_or_equity_derivative
                exemption_by_authority)))))

; [securities:related_party_trading_reported] 負責人及關係人交易應依主管機關規定申報
(assert (= related_party_trading_reported
   (or (not related_person_trading_stock_or_equity_derivative)
       trading_reported_to_fund)))

; [securities:related_person_definition] 關係人定義符合主管機關規定
(assert (= related_person_definition_ok
   related_person_definition_according_to_authority))

; [securities:duty_of_care_and_loyalty] 負責人及業務人員應以善良管理人注意義務及忠實義務執行業務
(assert (= duty_of_care_and_loyalty_met duty_of_care_and_loyalty_executed))

; [securities:prohibited_behaviors] 不得有法令禁止之不當行為
(assert (= no_prohibited_behaviors
   (and (not insider_trading_or_leakage)
        (not self_dealing_or_conflict_of_interest)
        (not fraud_or_misleading_behavior)
        (not failure_to_return_commission_to_fund)
        (not providing_undue_benefits_for_promotion)
        (not selling_proxy_votes_for_benefits)
        (not manipulating_market_prices)
        (not improper_account_transfers)
        (not improper_public_recommendations)
        (not unreasonable_commissions_to_nonprofessionals)
        (not unauthorized_agent_trading)
        (not other_harmful_acts_to_investors_or_fund))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反禁止交易、申報義務、關係人定義或不當行為時處罰
(assert (= penalty
   (or (not related_person_definition_ok)
       (not duty_of_care_and_loyalty_met)
       (not prohibited_related_party_trading)
       (not related_party_trading_reported)
       (not no_prohibited_behaviors))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fund_holding_stock_or_equity_derivative true))
(assert (= related_person_trading_stock_or_equity_derivative true))
(assert (= exemption_by_authority false))
(assert (= trading_reported_to_fund false))
(assert (= related_person_definition_according_to_authority true))
(assert (= related_person_definition_ok true))
(assert (= duty_of_care_and_loyalty_executed false))
(assert (= duty_of_care_and_loyalty_met false))
(assert (= insider_trading_or_leakage true))
(assert (= self_dealing_or_conflict_of_interest false))
(assert (= fraud_or_misleading_behavior false))
(assert (= failure_to_return_commission_to_fund false))
(assert (= providing_undue_benefits_for_promotion false))
(assert (= selling_proxy_votes_for_benefits false))
(assert (= manipulating_market_prices false))
(assert (= improper_account_transfers false))
(assert (= improper_public_recommendations false))
(assert (= unreasonable_commissions_to_nonprofessionals false))
(assert (= unauthorized_agent_trading false))
(assert (= other_harmful_acts_to_investors_or_fund false))
(assert (= no_prohibited_behaviors false))
(assert (= prohibited_related_party_trading true))
(assert (= related_party_trading_reported false))
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
; Total variables: 24
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
