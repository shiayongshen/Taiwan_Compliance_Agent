; SMT2 file generated from compliance case automatic
; Case ID: case_106
; Generated at: 2025-10-21T01:47:47.611487
;
; This file can be executed with Z3:
;   z3 case_106.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const acts_in_good_faith Bool)
(declare-const business_scope_during_termination_properly_handled Bool)
(declare-const business_terminated_properly Bool)
(declare-const business_termination_handling_compliance Bool)
(declare-const central_bank_approval_obtained Bool)
(declare-const commissioned_to_broker Bool)
(declare-const complies_with_contracts Bool)
(declare-const complies_with_law Bool)
(declare-const complies_with_orders Bool)
(declare-const confidentiality_compliance Bool)
(declare-const conflict_of_interest_prevention_measures_executed Bool)
(declare-const conflict_prevention_policy_defined Bool)
(declare-const conflict_prevention_policy_executed Bool)
(declare-const control_operations_recorded Bool)
(declare-const control_records_retention_period Int)
(declare-const damaging_client_interests_trading Bool)
(declare-const delegation_or_transfer_of_full_discretionary_contract Bool)
(declare-const engages_in_foreign_securities_business Bool)
(declare-const engages_in_securities_investment Bool)
(declare-const fiduciary_duty_compliance Bool)
(declare-const foreign_securities_business_compliance Bool)
(declare-const full_discretionary_investment_diversification_compliance Bool)
(declare-const full_discretionary_investment_investment_decision_compliance Bool)
(declare-const full_discretionary_investment_operated_according_to_rules Bool)
(declare-const insider_trading_for_self_or_others Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_system_defined Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_system_executed_flag Bool)
(declare-const investment_decision_based_on_analysis Bool)
(declare-const investment_decision_has_reasonable_basis Bool)
(declare-const investment_decision_record_compliance Bool)
(declare-const investment_decision_recorded Bool)
(declare-const investment_diversification_ratio_compliance Bool)
(declare-const investment_in_single_company_bonds Bool)
(declare-const investment_in_single_company_stock_bonds_warrants Bool)
(declare-const investment_in_trust_and_special_purpose_company_securities Bool)
(declare-const keeps_confidential Bool)
(declare-const meets_diversification_ratio Bool)
(declare-const monthly_review_submitted Bool)
(declare-const net_asset_value Real)
(declare-const not_intentional_opposite_trading Bool)
(declare-const operates_according_to_operating_rules Bool)
(declare-const other_behaviors_affecting_business_or_client_rights Bool)
(declare-const other_laws_or_authority_provisions_apply Bool)
(declare-const penalty Bool)
(declare-const performance_fee_regulated_exception Bool)
(declare-const profit_loss_sharing_agreement_with_client Bool)
(declare-const prohibited_behaviors_compliance Bool)
(declare-const prohibited_behaviors_violated Bool)
(declare-const prohibited_business_activities_compliance Bool)
(declare-const prohibited_business_activities_violated Bool)
(declare-const reasonable_explanation_provided Bool)
(declare-const regulatory_exception_for_delegation_or_transfer Bool)
(declare-const required_retention_period Int)
(declare-const securities_brokerage_commissioned Bool)
(declare-const self_or_other_client_opposite_trading Bool)
(declare-const trading_through_central_market Bool)
(declare-const unauthorized_trade_order_account_change Bool)
(declare-const using_client_account_for_self_or_others Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:fiduciary_duty_compliance] 證券投資信託及顧問事業等依善良管理人注意義務及忠實義務執行業務
(assert (= fiduciary_duty_compliance
   (and complies_with_law
        complies_with_orders
        complies_with_contracts
        acts_in_good_faith)))

; [securities:confidentiality_compliance] 保守受益人或客戶個人資料及交易資料秘密
(assert (= confidentiality_compliance
   (or keeps_confidential other_laws_or_authority_provisions_apply)))

; [securities:investment_decision_record_compliance] 投資決定依分析作成並有合理基礎，且作成紀錄、按月檢討
(assert (= investment_decision_record_compliance
   (and investment_decision_based_on_analysis
        investment_decision_has_reasonable_basis
        investment_decision_recorded
        monthly_review_submitted)))

; [securities:internal_control_established_and_executed] 訂定內部控制制度並確實執行，控制作業留存紀錄並保存期限符合規定
(assert (= internal_control_established_and_executed
   (and internal_control_system_defined
        internal_control_system_executed
        control_operations_recorded
        (>= control_records_retention_period required_retention_period))))

; [securities:full_discretionary_investment_operated_according_to_rules] 全權委託投資業務依業務操作規定辦理
(assert (= full_discretionary_investment_operated_according_to_rules
   operates_according_to_operating_rules))

; [securities:full_discretionary_investment_investment_decision_compliance] 全權委託投資資產投資決定準用第17條規定
(assert (= full_discretionary_investment_investment_decision_compliance
   investment_decision_record_compliance))

; [securities:full_discretionary_investment_diversification_compliance] 全權委託投資資產分散投資且符合主管機關定之分散比率
(assert (= full_discretionary_investment_diversification_compliance
   meets_diversification_ratio))

; [securities:prohibited_behaviors_violated] 違反經營全權委託投資業務禁止行為
(assert (let ((a!1 (or other_behaviors_affecting_business_or_client_rights
               (and profit_loss_sharing_agreement_with_client
                    (not performance_fee_regulated_exception))
               unauthorized_trade_order_account_change
               using_client_account_for_self_or_others
               (and delegation_or_transfer_of_full_discretionary_contract
                    (not regulatory_exception_for_delegation_or_transfer))
               (and (not investment_decision_based_on_analysis)
                    (not reasonable_explanation_provided))
               damaging_client_interests_trading
               insider_trading_for_self_or_others
               (and self_or_other_client_opposite_trading
                    (not (and trading_through_central_market
                              not_intentional_opposite_trading))))))
  (= prohibited_behaviors_violated a!1)))

; [securities:prohibited_behaviors_compliance] 未違反經營全權委託投資業務禁止行為
(assert (not (= prohibited_behaviors_violated prohibited_behaviors_compliance)))

; [securities:prohibited_business_activities_compliance] 負責人、業務人員及受僱人不得為第19條第1項、第59條或法令契約禁止行為
(assert (not (= prohibited_business_activities_violated
        prohibited_business_activities_compliance)))

; [securities:internal_control_system_established] 依第93條規定建立內部控制制度
(assert (= internal_control_system_established internal_control_system_defined))

; [securities:internal_control_system_executed] 內部控制制度確實執行
(assert (= internal_control_system_executed internal_control_system_executed_flag))

; [securities:conflict_of_interest_prevention_measures_executed] 訂定資訊及通訊設備使用管理規範並確實執行利益衝突防範措施
(assert (= conflict_of_interest_prevention_measures_executed
   (and conflict_prevention_policy_defined conflict_prevention_policy_executed)))

; [securities:investment_diversification_ratio_compliance] 投資標的分散比率符合第17條規定
(assert (= investment_diversification_ratio_compliance
   (and (>= (* 20.0 net_asset_value)
            (ite investment_in_single_company_stock_bonds_warrants 1.0 0.0))
        (>= (* 10.0 net_asset_value)
            (ite investment_in_single_company_bonds 1.0 0.0))
        (>= (* 20.0 net_asset_value)
            (ite investment_in_trust_and_special_purpose_company_securities
                 1.0
                 0.0)))))

; [securities:foreign_securities_business_compliance] 經營全權委託投資外國有價證券業務涉及資金匯出入經中央銀行同意
(assert (= foreign_securities_business_compliance
   (or (not engages_in_foreign_securities_business)
       central_bank_approval_obtained)))

; [securities:securities_brokerage_commissioned] 有價證券投資委託證券經紀商於集中交易市場或證券商營業處所為之
(assert (= securities_brokerage_commissioned
   (or (not engages_in_securities_investment) commissioned_to_broker)))

; [securities:business_termination_handling_compliance] 撤銷、廢止許可、停業或歇業時依法了結業務
(assert (= business_termination_handling_compliance
   (and business_terminated_properly
        business_scope_during_termination_properly_handled)))

; [securities:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities:penalty_conditions] 處罰條件：違反法定義務或禁止行為時處罰
(assert (= penalty
   (or prohibited_behaviors_violated
       (not prohibited_business_activities_compliance)
       (not investment_diversification_ratio_compliance)
       (and engages_in_securities_investment (not commissioned_to_broker))
       (not business_termination_handling_compliance)
       (not internal_control_established_and_executed)
       (not investment_decision_record_compliance)
       (not full_discretionary_investment_operated_according_to_rules)
       (not internal_control_system_executed)
       (not full_discretionary_investment_investment_decision_compliance)
       (not confidentiality_compliance)
       (not fiduciary_duty_compliance)
       (not internal_control_system_established)
       (not conflict_of_interest_prevention_measures_executed)
       (not full_discretionary_investment_diversification_compliance)
       (and engages_in_foreign_securities_business
            (not central_bank_approval_obtained)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= acts_in_good_faith false))
(assert (= complies_with_law false))
(assert (= complies_with_orders false))
(assert (= complies_with_contracts false))
(assert (= confidentiality_compliance false))
(assert (= conflict_prevention_policy_defined false))
(assert (= conflict_prevention_policy_executed false))
(assert (= conflict_of_interest_prevention_measures_executed false))
(assert (= control_operations_recorded false))
(assert (= control_records_retention_period 0))
(assert (= damaging_client_interests_trading true))
(assert (= delegation_or_transfer_of_full_discretionary_contract false))
(assert (= engages_in_foreign_securities_business false))
(assert (= engages_in_securities_investment true))
(assert (= fiduciary_duty_compliance false))
(assert (= foreign_securities_business_compliance true))
(assert (= full_discretionary_investment_diversification_compliance false))
(assert (= full_discretionary_investment_investment_decision_compliance false))
(assert (= full_discretionary_investment_operated_according_to_rules false))
(assert (= insider_trading_for_self_or_others false))
(assert (= internal_control_system_defined false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_system_executed_flag false))
(assert (= investment_decision_based_on_analysis false))
(assert (= investment_decision_has_reasonable_basis false))
(assert (= investment_decision_record_compliance false))
(assert (= investment_decision_recorded false))
(assert (= investment_diversification_ratio_compliance false))
(assert (= investment_in_single_company_bonds true))
(assert (= investment_in_single_company_stock_bonds_warrants true))
(assert (= investment_in_trust_and_special_purpose_company_securities true))
(assert (= keeps_confidential false))
(assert (= meets_diversification_ratio false))
(assert (= monthly_review_submitted false))
(assert (= net_asset_value 100))
(assert (= not_intentional_opposite_trading false))
(assert (= operates_according_to_operating_rules false))
(assert (= other_behaviors_affecting_business_or_client_rights true))
(assert (= other_laws_or_authority_provisions_apply false))
(assert (= penalty true))
(assert (= performance_fee_regulated_exception false))
(assert (= profit_loss_sharing_agreement_with_client false))
(assert (= prohibited_behaviors_violated true))
(assert (= prohibited_behaviors_compliance false))
(assert (= prohibited_business_activities_compliance false))
(assert (= prohibited_business_activities_violated true))
(assert (= reasonable_explanation_provided false))
(assert (= regulatory_exception_for_delegation_or_transfer false))
(assert (= required_retention_period 7))
(assert (= securities_brokerage_commissioned true))
(assert (= self_or_other_client_opposite_trading false))
(assert (= trading_through_central_market false))
(assert (= unauthorized_trade_order_account_change false))
(assert (= using_client_account_for_self_or_others false))
(assert (= business_terminated_properly true))
(assert (= business_scope_during_termination_properly_handled true))
(assert (= business_termination_handling_compliance true))
(assert (= central_bank_approval_obtained true))
(assert (= commissioned_to_broker true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 61
; Total facts: 60
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
