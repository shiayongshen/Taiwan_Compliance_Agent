; SMT2 file generated from compliance case automatic
; Case ID: case_160
; Generated at: 2025-10-19T09:37:38.188138
;
; This file can be executed with Z3:
;   z3 case_160.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accepted_client_orders_with_market_manipulation_intent Bool)
(declare-const accepted_full_trust_delegation Bool)
(declare-const accepted_others_opening_accounts Bool)
(declare-const accepted_same_day_buy_sell_offset Bool)
(declare-const accepted_unauthorized_agent_trades Bool)
(declare-const accepted_uncontracted_client_trades Bool)
(declare-const acted_as_agent_for_others_without_authority Bool)
(declare-const business_conduct_honest Bool)
(declare-const concealed_or_fraudulent_behavior Bool)
(declare-const disclosed_client_secrets Bool)
(declare-const engaged_in_speculative_trading Bool)
(declare-const failed_to_follow_client_instructions Bool)
(declare-const guaranteed_client_profit Bool)
(declare-const had_loan_or_securities_lending_with_client Bool)
(declare-const had_undue_benefit_agreement_with_issuers Bool)
(declare-const honest_and_credit_principle_followed Bool)
(declare-const improvement_completed Bool)
(declare-const improvement_completed_flag Bool)
(declare-const improvement_order_given Bool)
(declare-const improvement_order_issued Bool)
(declare-const induced_buy_sell_based_on_price_prediction Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_violation_penalty Bool)
(declare-const misappropriated_client_assets Bool)
(declare-const penalty Bool)
(declare-const penalty_conditions_violation Bool)
(declare-const penalty_exemption_for_minor_violation Bool)
(declare-const penalty_imposed_for_violation Bool)
(declare-const prohibited_behaviors Bool)
(declare-const promoted_specific_stocks_to_public Bool)
(declare-const self_dealing_as_counterparty Bool)
(declare-const shared_trading_loss Bool)
(declare-const shared_trading_profit Bool)
(declare-const solicited_unapproved_securities Bool)
(declare-const used_client_account_for_trading Bool)
(declare-const used_others_account_for_client_trading Bool)
(declare-const violated_other_securities_management_regulations Bool)
(declare-const violation_affecting_business Bool)
(declare-const violation_of_law_or_regulation Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_affecting_business] 證券商董事、監察人及受僱人違反法令且影響業務正常執行
(assert (= violation_affecting_business violation_of_law_or_regulation))

; [securities:penalty_imposed_for_violation] 主管機關得依情節輕重對證券商處分
(assert (= penalty_imposed_for_violation violation_affecting_business))

; [securities:internal_control_established] 證券商依規定建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_executed] 證券商確實執行內部控制制度
(assert (= internal_control_executed internal_control_system_executed))

; [securities:internal_control_compliance] 證券商內部控制制度建立且執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [securities:business_conduct_honest] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= business_conduct_honest honest_and_credit_principle_followed))

; [securities:prohibited_behaviors] 證券商負責人及業務人員不得有違法禁止行為
(assert (not (= (or accepted_client_orders_with_market_manipulation_intent
            guaranteed_client_profit
            used_others_account_for_client_trading
            had_undue_benefit_agreement_with_issuers
            engaged_in_speculative_trading
            self_dealing_as_counterparty
            had_loan_or_securities_lending_with_client
            failed_to_follow_client_instructions
            accepted_uncontracted_client_trades
            promoted_specific_stocks_to_public
            accepted_others_opening_accounts
            used_client_account_for_trading
            shared_trading_loss
            accepted_unauthorized_agent_trades
            accepted_same_day_buy_sell_offset
            shared_trading_profit
            induced_buy_sell_based_on_price_prediction
            misappropriated_client_assets
            solicited_unapproved_securities
            acted_as_agent_for_others_without_authority
            concealed_or_fraudulent_behavior
            accepted_full_trust_delegation
            disclosed_client_secrets
            violated_other_securities_management_regulations)
        prohibited_behaviors)))

; [securities:internal_control_violation_penalty] 違反內部控制制度者處罰
(assert (not (= internal_control_compliance internal_control_violation_penalty)))

; [securities:penalty_conditions_violation] 違反證券交易法相關規定之處罰條件
(assert (= penalty_conditions_violation
   (or (not business_conduct_honest)
       (not prohibited_behaviors)
       violation_affecting_business
       (not internal_control_compliance))))

; [securities:improvement_order_issued] 主管機關命令限期改善
(assert (= improvement_order_issued improvement_order_given))

; [securities:improvement_completed] 限期改善已完成
(assert (= improvement_completed improvement_completed_flag))

; [securities:penalty_exemption_for_minor_violation] 情節輕微者免予處罰
(assert (= penalty_exemption_for_minor_violation
   (or improvement_completed (not violation_affecting_business))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法相關規定且未改善或情節非輕微時處罰
(assert (= penalty
   (and (not penalty_exemption_for_minor_violation)
        penalty_conditions_violation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_of_law_or_regulation true))
(assert (= violation_affecting_business true))
(assert (= penalty_imposed_for_violation true))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= business_conduct_honest true))
(assert (= prohibited_behaviors true))
(assert (= improvement_order_given true))
(assert (= improvement_order_issued true))
(assert (= improvement_completed_flag false))
(assert (= improvement_completed false))
(assert (= accepted_client_orders_with_market_manipulation_intent false))
(assert (= accepted_full_trust_delegation false))
(assert (= accepted_others_opening_accounts false))
(assert (= accepted_same_day_buy_sell_offset false))
(assert (= accepted_unauthorized_agent_trades false))
(assert (= accepted_uncontracted_client_trades false))
(assert (= acted_as_agent_for_others_without_authority false))
(assert (= concealed_or_fraudulent_behavior false))
(assert (= disclosed_client_secrets false))
(assert (= engaged_in_speculative_trading false))
(assert (= failed_to_follow_client_instructions false))
(assert (= guaranteed_client_profit false))
(assert (= had_loan_or_securities_lending_with_client false))
(assert (= had_undue_benefit_agreement_with_issuers false))
(assert (= honest_and_credit_principle_followed false))
(assert (= induced_buy_sell_based_on_price_prediction false))
(assert (= internal_control_violation_penalty false))
(assert (= misappropriated_client_assets false))
(assert (= penalty false))
(assert (= penalty_conditions_violation false))
(assert (= penalty_exemption_for_minor_violation false))
(assert (= promoted_specific_stocks_to_public false))
(assert (= self_dealing_as_counterparty false))
(assert (= shared_trading_loss false))
(assert (= shared_trading_profit false))
(assert (= solicited_unapproved_securities false))
(assert (= used_client_account_for_trading false))
(assert (= used_others_account_for_client_trading false))
(assert (= violated_other_securities_management_regulations false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 43
; Total facts: 43
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
