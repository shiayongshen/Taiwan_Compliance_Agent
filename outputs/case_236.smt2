; SMT2 file generated from compliance case automatic
; Case ID: case_236
; Generated at: 2025-10-21T05:13:08.622530
;
; This file can be executed with Z3:
;   z3 case_236.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accept_agent_trades_for_board_members_or_employees Bool)
(declare-const accept_non_client_account Bool)
(declare-const accept_trades_by_investment_advisor_auto_rebalancing Bool)
(declare-const accept_trades_while_aware_of_market_manipulation_intent Bool)
(declare-const accept_trades_without_client_authorization Bool)
(declare-const accept_trades_without_proper_contract Bool)
(declare-const agent_open_account_or_trade_for_others_illegally Bool)
(declare-const business_operated_according_to_articles Bool)
(declare-const business_operated_according_to_internal_control Bool)
(declare-const business_operated_according_to_law Bool)
(declare-const client_account_offsetting_without_legal_basis Bool)
(declare-const fees_returned_to_issuer_or_related Bool)
(declare-const fraud_or_misleading_in_underwriting_or_trading Bool)
(declare-const full_power_delegation_to_client Bool)
(declare-const guarantee_profit_or_share_profit Bool)
(declare-const handling_according_to_association_rules Bool)
(declare-const honesty_and_credit_observed Bool)
(declare-const honesty_and_credit_principle Bool)
(declare-const illegal_disclosure_of_client_info Bool)
(declare-const internal_control_change_completed_within_deadline Bool)
(declare-const internal_control_change_notified Bool)
(declare-const internal_control_compliant Bool)
(declare-const internal_control_defined Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_updated Bool)
(declare-const joint_risk_sharing_with_client Bool)
(declare-const loan_or_mediation_with_client Bool)
(declare-const misappropriation_of_client_assets Bool)
(declare-const not_follow_client_instructions Bool)
(declare-const other_violations_of_securities_laws_or_regulations Bool)
(declare-const penalty Bool)
(declare-const penalty_applied Bool)
(declare-const penalty_imposed Bool)
(declare-const prohibited_behaviors Bool)
(declare-const promote_specific_stocks_to_public Bool)
(declare-const provide_market_forecast_to_induce_trading Bool)
(declare-const remove_officer_order Bool)
(declare-const remove_order_issued Bool)
(declare-const self_dealing_with_client_orders Bool)
(declare-const solicit_unapproved_securities_or_derivatives Bool)
(declare-const speculation_using_insider_info Bool)
(declare-const stabilization_operations_allowed Bool)
(declare-const stabilization_operations_permitted Bool)
(declare-const stop_business_order Bool)
(declare-const stop_order_issued Bool)
(declare-const underwriting_fair_and_reasonable Bool)
(declare-const underwriting_fees_compensated_otherwise Bool)
(declare-const underwriting_fees_fair Bool)
(declare-const underwriting_handling_according_to_rules Bool)
(declare-const underwriting_personnel_receive_improper_benefits Bool)
(declare-const use_client_name_or_account_for_trading Bool)
(declare-const use_others_or_relatives_name_for_client_trading Bool)
(declare-const violation_occurred Bool)
(declare-const violation_of_law Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_of_law] 證券商董事、監察人及受僱人違反證券交易法或相關法令，影響業務正常執行
(assert (= violation_of_law violation_occurred))

; [securities:stop_business_order] 主管機關命令證券商停止一年以下業務執行
(assert (= stop_business_order stop_order_issued))

; [securities:remove_officer_order] 主管機關命令證券商解除董事、監察人或經理人職務
(assert (= remove_officer_order remove_order_issued))

; [securities:penalty_imposed] 主管機關依證券交易法第66條視情節輕重對證券商處分
(assert (= penalty_imposed penalty_applied))

; [securities:internal_control_established] 證券商依金融監督管理委員會及相關機構規範訂定內部控制制度
(assert (= internal_control_established internal_control_defined))

; [securities:internal_control_compliant] 證券商業務經營依法令、章程及內部控制制度
(assert (= internal_control_compliant
   (and business_operated_according_to_law
        business_operated_according_to_articles
        business_operated_according_to_internal_control)))

; [securities:internal_control_updated] 內部控制制度變更後於限期內完成變更
(assert (= internal_control_updated
   (or (not internal_control_change_notified)
       internal_control_change_completed_within_deadline)))

; [securities:underwriting_fair_and_reasonable] 證券商承銷有價證券以公平合理方式，不得以其他方式補償或退還
(assert (= underwriting_fair_and_reasonable
   (and underwriting_fees_fair
        (not underwriting_fees_compensated_otherwise)
        (not fees_returned_to_issuer_or_related))))

; [securities:underwriting_handling_according_to_rules] 證券商承銷或再行銷售有價證券依證券商同業公會處理辦法處理
(assert (= underwriting_handling_according_to_rules
   handling_according_to_association_rules))

; [securities:stabilization_operations_allowed] 證券商辦理上市有價證券承銷或再行銷售得視必要進行安定操作交易
(assert (= stabilization_operations_allowed stabilization_operations_permitted))

; [securities:honesty_and_credit_principle] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= honesty_and_credit_principle honesty_and_credit_observed))

; [securities:prohibited_behaviors] 證券商負責人及業務人員不得有證券交易法及相關規定禁止之行為
(assert (not (= (or solicit_unapproved_securities_or_derivatives
            (not accept_trades_by_investment_advisor_auto_rebalancing)
            fraud_or_misleading_in_underwriting_or_trading
            speculation_using_insider_info
            other_violations_of_securities_laws_or_regulations
            illegal_disclosure_of_client_info
            accept_trades_while_aware_of_market_manipulation_intent
            agent_open_account_or_trade_for_others_illegally
            joint_risk_sharing_with_client
            use_others_or_relatives_name_for_client_trading
            not_follow_client_instructions
            use_client_name_or_account_for_trading
            accept_non_client_account
            self_dealing_with_client_orders
            promote_specific_stocks_to_public
            guarantee_profit_or_share_profit
            accept_agent_trades_for_board_members_or_employees
            full_power_delegation_to_client
            accept_trades_without_proper_contract
            misappropriation_of_client_assets
            underwriting_personnel_receive_improper_benefits
            accept_trades_without_client_authorization
            client_account_offsetting_without_legal_basis
            provide_market_forecast_to_induce_trading
            loan_or_mediation_with_client)
        prohibited_behaviors)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法或相關法令，或未依規定建立內部控制制度，或有禁止行為時處罰
(assert (= penalty
   (or (not internal_control_updated)
       (not honesty_and_credit_principle)
       (not internal_control_compliant)
       (not internal_control_established)
       (not underwriting_fair_and_reasonable)
       (not violation_of_law)
       (not underwriting_handling_according_to_rules)
       (not prohibited_behaviors))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_occurred true))
(assert (= violation_of_law true))
(assert (= penalty_applied true))
(assert (= stop_order_issued true))
(assert (= remove_order_issued false))
(assert (= internal_control_defined false))
(assert (= internal_control_established false))
(assert (= internal_control_compliant false))
(assert (= internal_control_change_notified false))
(assert (= internal_control_change_completed_within_deadline false))
(assert (= underwriting_fees_fair false))
(assert (= underwriting_fees_compensated_otherwise true))
(assert (= fees_returned_to_issuer_or_related true))
(assert (= handling_according_to_association_rules false))
(assert (= stabilization_operations_permitted false))
(assert (= honesty_and_credit_observed false))
(assert (= accept_agent_trades_for_board_members_or_employees false))
(assert (= accept_non_client_account false))
(assert (= accept_trades_by_investment_advisor_auto_rebalancing false))
(assert (= accept_trades_while_aware_of_market_manipulation_intent false))
(assert (= accept_trades_without_client_authorization false))
(assert (= accept_trades_without_proper_contract false))
(assert (= agent_open_account_or_trade_for_others_illegally false))
(assert (= business_operated_according_to_articles false))
(assert (= business_operated_according_to_internal_control false))
(assert (= business_operated_according_to_law false))
(assert (= client_account_offsetting_without_legal_basis false))
(assert (= fraud_or_misleading_in_underwriting_or_trading false))
(assert (= full_power_delegation_to_client false))
(assert (= guarantee_profit_or_share_profit false))
(assert (= honesty_and_credit_principle false))
(assert (= illegal_disclosure_of_client_info false))
(assert (= joint_risk_sharing_with_client false))
(assert (= loan_or_mediation_with_client false))
(assert (= misappropriation_of_client_assets false))
(assert (= not_follow_client_instructions false))
(assert (= other_violations_of_securities_laws_or_regulations true))
(assert (= penalty true))
(assert (= prohibited_behaviors false))
(assert (= promote_specific_stocks_to_public false))
(assert (= provide_market_forecast_to_induce_trading false))
(assert (= remove_officer_order false))
(assert (= solicit_unapproved_securities_or_derivatives false))
(assert (= speculation_using_insider_info false))
(assert (= stabilization_operations_allowed false))
(assert (= stop_business_order true))
(assert (= underwriting_fair_and_reasonable false))
(assert (= underwriting_handling_according_to_rules false))
(assert (= underwriting_personnel_receive_improper_benefits false))
(assert (= use_client_name_or_account_for_trading false))
(assert (= use_others_or_relatives_name_for_client_trading false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 54
; Total facts: 51
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
