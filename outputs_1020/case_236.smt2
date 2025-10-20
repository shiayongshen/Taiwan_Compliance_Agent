; SMT2 file generated from compliance case automatic
; Case ID: case_236
; Generated at: 2025-10-19T11:02:47.484521
;
; This file can be executed with Z3:
;   z3 case_236.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accept_trades_without_proper_contract Bool)
(declare-const accepting_non_client_account_trades Bool)
(declare-const accepting_trades_while_knowing_market_manipulation_intent Bool)
(declare-const accepting_trades_without_client_authorization Bool)
(declare-const business_conducted_according_to_law_and_internal_control Bool)
(declare-const director_violation Bool)
(declare-const employee_violation Bool)
(declare-const fees_compensated_by_other_means Bool)
(declare-const fees_returned_to_issuer_or_related_person Bool)
(declare-const fraud_or_misleading_in_underwriting_or_trading Bool)
(declare-const full_power_delegation_to_client Bool)
(declare-const handling_methods_approved Bool)
(declare-const honesty_and_credit_observed Bool)
(declare-const honesty_and_credit_principle Bool)
(declare-const illegal_disclosure_of_client_info Bool)
(declare-const improper_benefit_agreements_between_underwriters_and_issuers Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_guideline_adopted Bool)
(declare-const internal_control_updated_if_notified Bool)
(declare-const joint_loss_profit_agreement Bool)
(declare-const loan_or_mediation_with_client Bool)
(declare-const misappropriation_or_custody_violation Bool)
(declare-const not_following_client_orders Bool)
(declare-const offsetting_buy_and_sell_orders_illegally Bool)
(declare-const other_violations_of_securities_laws_or_regulations Bool)
(declare-const penalty Bool)
(declare-const profit_guarantee_or_sharing Bool)
(declare-const prohibited_behaviors Bool)
(declare-const promoting_specific_stocks_to_public Bool)
(declare-const providing_false_market_forecasts_to_clients Bool)
(declare-const self_dealing_with_client_orders Bool)
(declare-const soliciting_unapproved_securities_or_derivatives Bool)
(declare-const speculation_using_insider_info Bool)
(declare-const stabilization_operations_approved_if_any Bool)
(declare-const supervisor_violation Bool)
(declare-const unauthorized_account_opening_or_trading Bool)
(declare-const underwriting_fair_and_reasonable Bool)
(declare-const underwriting_fees_fair Bool)
(declare-const underwriting_handling_followed Bool)
(declare-const use_client_account_for_trading Bool)
(declare-const use_others_or_relatives_name_for_client_trading Bool)
(declare-const violation_of_law Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_of_law] 證券商董事、監察人及受僱人違反證券交易法或相關法令，影響業務正常執行
(assert (= violation_of_law
   (and director_violation supervisor_violation employee_violation)))

; [securities:internal_control_established] 證券商依規定訂定內部控制制度
(assert (= internal_control_established
   (and internal_control_guideline_adopted
        business_conducted_according_to_law_and_internal_control
        internal_control_updated_if_notified)))

; [securities:underwriting_fair_and_reasonable] 證券商承銷有價證券以公平合理方式，不得不當補償或退還
(assert (= underwriting_fair_and_reasonable
   (and underwriting_fees_fair
        (not fees_compensated_by_other_means)
        (not fees_returned_to_issuer_or_related_person)
        underwriting_handling_followed
        handling_methods_approved
        stabilization_operations_approved_if_any)))

; [securities:honesty_and_credit_principle] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= honesty_and_credit_principle honesty_and_credit_observed))

; [securities:prohibited_behaviors] 證券商負責人及業務人員不得有違反證券管理法令及規定之行為
(assert (not (= (or accepting_trades_while_knowing_market_manipulation_intent
            fraud_or_misleading_in_underwriting_or_trading
            other_violations_of_securities_laws_or_regulations
            offsetting_buy_and_sell_orders_illegally
            soliciting_unapproved_securities_or_derivatives
            accepting_trades_without_client_authorization
            use_others_or_relatives_name_for_client_trading
            use_client_account_for_trading
            improper_benefit_agreements_between_underwriters_and_issuers
            illegal_disclosure_of_client_info
            self_dealing_with_client_orders
            loan_or_mediation_with_client
            profit_guarantee_or_sharing
            accepting_non_client_account_trades
            speculation_using_insider_info
            not_following_client_orders
            accept_trades_without_proper_contract
            providing_false_market_forecasts_to_clients
            full_power_delegation_to_client
            joint_loss_profit_agreement
            promoting_specific_stocks_to_public
            misappropriation_or_custody_violation
            unauthorized_account_opening_or_trading)
        prohibited_behaviors)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：證券商董事、監察人及受僱人違反法令或有禁止行為時處罰
(assert (= penalty
   (or (not prohibited_behaviors)
       violation_of_law
       (not honesty_and_credit_principle)
       (not internal_control_established)
       (not underwriting_fair_and_reasonable))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= director_violation true))
(assert (= supervisor_violation true))
(assert (= employee_violation true))
(assert (= internal_control_guideline_adopted false))
(assert (= business_conducted_according_to_law_and_internal_control false))
(assert (= internal_control_updated_if_notified true))
(assert (= underwriting_fees_fair true))
(assert (= fees_compensated_by_other_means false))
(assert (= fees_returned_to_issuer_or_related_person false))
(assert (= underwriting_handling_followed true))
(assert (= handling_methods_approved true))
(assert (= stabilization_operations_approved_if_any true))
(assert (= honesty_and_credit_observed true))
(assert (= speculation_using_insider_info false))
(assert (= illegal_disclosure_of_client_info false))
(assert (= full_power_delegation_to_client false))
(assert (= profit_guarantee_or_sharing false))
(assert (= joint_loss_profit_agreement false))
(assert (= self_dealing_with_client_orders false))
(assert (= use_client_account_for_trading false))
(assert (= use_others_or_relatives_name_for_client_trading false))
(assert (= loan_or_mediation_with_client false))
(assert (= fraud_or_misleading_in_underwriting_or_trading false))
(assert (= misappropriation_or_custody_violation false))
(assert (= accept_trades_without_proper_contract false))
(assert (= not_following_client_orders false))
(assert (= providing_false_market_forecasts_to_clients false))
(assert (= promoting_specific_stocks_to_public false))
(assert (= offsetting_buy_and_sell_orders_illegally false))
(assert (= unauthorized_account_opening_or_trading false))
(assert (= accepting_non_client_account_trades false))
(assert (= accepting_trades_without_client_authorization false))
(assert (= accepting_trades_while_knowing_market_manipulation_intent false))
(assert (= improper_benefit_agreements_between_underwriters_and_issuers false))
(assert (= soliciting_unapproved_securities_or_derivatives false))
(assert (= other_violations_of_securities_laws_or_regulations true))
(assert (= internal_control_established false))
(assert (= underwriting_fair_and_reasonable true))
(assert (= honesty_and_credit_principle true))
(assert (= prohibited_behaviors true))
(assert (= violation_of_law true))
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
; Total variables: 42
; Total facts: 42
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
