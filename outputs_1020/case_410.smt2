; SMT2 file generated from compliance case automatic
; Case ID: case_410
; Generated at: 2025-10-19T15:11:50.919758
;
; This file can be executed with Z3:
;   z3 case_410.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const affect_normal_business Bool)
(declare-const agent_investment_except_legal_agent Bool)
(declare-const delegate_or_transfer_contract Bool)
(declare-const delegated_investment_holding_company_stock_or_derivatives Bool)
(declare-const fraudulent_or_misleading_behavior Bool)
(declare-const fund_holding_company_stock_or_derivatives Bool)
(declare-const harm_client_interests Bool)
(declare-const ignore_investment_report Bool)
(declare-const includes_enterprise_controlled_by_person_or_spouse Bool)
(declare-const includes_mutual_control_corporate Bool)
(declare-const includes_same_source_controlled_corporate Bool)
(declare-const includes_spouse_and_second_degree_relatives Bool)
(declare-const intentional_counterparty_trading Bool)
(declare-const keep_client_data_confidential Bool)
(declare-const leak_confidential_info Bool)
(declare-const manipulate_security_prices Bool)
(declare-const not_return_commission_to_fund Bool)
(declare-const operate_without_approval Bool)
(declare-const operate_without_business_license_63_1 Bool)
(declare-const order_dismiss_officer Bool)
(declare-const order_stop_business_within_one_year Bool)
(declare-const other_harmful_behaviors Bool)
(declare-const other_harmful_behaviors_delegated Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const person_is_corporate Bool)
(declare-const person_is_natural_person Bool)
(declare-const personnel_confidentiality Bool)
(declare-const personnel_prohibited_behaviors Bool)
(declare-const personnel_violation Bool)
(declare-const personnel_violation_penalty Bool)
(declare-const profit_loss_sharing_agreement Bool)
(declare-const prohibited_delegated_investment_behaviors Bool)
(declare-const prohibited_trading_delegated_investment Bool)
(declare-const prohibited_trading_during_fund_holding Bool)
(declare-const provide_specific_benefits_to_promote Bool)
(declare-const public_promotion_or_price_forecast Bool)
(declare-const related_persons_corporate Bool)
(declare-const related_persons_definition Bool)
(declare-const related_persons_natural_person Bool)
(declare-const relative_trading_exception Bool)
(declare-const revoke_business_license Bool)
(declare-const self_or_others_trading Bool)
(declare-const self_or_others_trading_conflict Bool)
(declare-const sell_proxy_voting_rights_for_benefits Bool)
(declare-const suspend_business Bool)
(declare-const suspend_fund_raising_or_new_business Bool)
(declare-const trade_company_stock_or_derivatives Bool)
(declare-const trade_company_stock_or_derivatives_delegated Bool)
(declare-const transfer_orders_between_accounts Bool)
(declare-const unauthorized_order_transfer Bool)
(declare-const use_client_account_for_self_or_others Bool)
(declare-const use_insider_info_for_others Bool)
(declare-const use_nonprofessional_to_recruit_or_pay_unreasonable_commission Bool)
(declare-const violate_behavior_rules_69 Bool)
(declare-const violate_branch_establishment_rules_72_1 Bool)
(declare-const violate_diversification_ratio_58_2 Bool)
(declare-const violate_investment_scope_rules_14_1_18_1_56_1 Bool)
(declare-const violate_investment_scope_rules_16_4 Bool)
(declare-const violate_law_or_related_regulations Bool)
(declare-const violate_restriction_rules_70 Bool)
(declare-const violate_rules_16_1_19_1_51_1_59 Bool)
(declare-const violation_fine Bool)
(declare-const violation_penalty_level Bool)
(declare-const warning Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_penalty_level] 主管機關對違反法令事業之處分等級（1=警告,2=解除職務,3=停止募集或新增業務,4=停業,5=廢止營業許可,6=其他處置,0=無處分）
(assert (let ((a!1 (ite suspend_fund_raising_or_new_business
                3
                (ite suspend_business
                     4
                     (ite revoke_business_license
                          5
                          (ite other_necessary_measures 6 0))))))
  (= (ite violation_penalty_level 1 0)
     (ite warning 1 (ite order_dismiss_officer 2 a!1)))))

; [securities:personnel_violation] 董事、監察人、經理人或受僱人違反法令且影響業務正常執行
(assert (= personnel_violation
   (and violate_law_or_related_regulations affect_normal_business)))

; [securities:personnel_violation_penalty] 主管機關命令停止執行業務或解除職務處分
(assert (= personnel_violation_penalty
   (or order_dismiss_officer order_stop_business_within_one_year)))

; [securities:violation_fine] 違反特定條文規定之罰鍰情形
(assert (= violation_fine
   (or violate_rules_16_1_19_1_51_1_59
       operate_without_approval
       violate_restriction_rules_70
       violate_branch_establishment_rules_72_1
       violate_behavior_rules_69
       violate_investment_scope_rules_16_4
       operate_without_business_license_63_1
       violate_diversification_ratio_58_2
       violate_investment_scope_rules_14_1_18_1_56_1)))

; [trust:personnel_prohibited_behaviors] 證券投資信託事業負責人及業務人員禁止行為
(assert (not (= (or manipulate_security_prices
            fraudulent_or_misleading_behavior
            other_harmful_behaviors
            provide_specific_benefits_to_promote
            leak_confidential_info
            transfer_orders_between_accounts
            not_return_commission_to_fund
            public_promotion_or_price_forecast
            agent_investment_except_legal_agent
            use_nonprofessional_to_recruit_or_pay_unreasonable_commission
            self_or_others_trading_conflict
            sell_proxy_voting_rights_for_benefits)
        personnel_prohibited_behaviors)))

; [trust:personnel_confidentiality] 負責人及業務人員保守客戶資料秘密
(assert (= personnel_confidentiality keep_client_data_confidential))

; [trust:prohibited_trading_during_fund_holding] 負責人及關係人於基金持有期間不得交易該公司股票及衍生商品
(assert (= prohibited_trading_during_fund_holding
   (or (not fund_holding_company_stock_or_derivatives)
       (not trade_company_stock_or_derivatives))))

; [trust:related_persons_definition] 關係人定義符合規定
(assert (= related_persons_definition
   (or related_persons_corporate related_persons_natural_person)))

; [trust:related_persons_natural_person] 自然人關係人定義
(assert (= related_persons_natural_person
   (and person_is_natural_person
        includes_spouse_and_second_degree_relatives
        includes_enterprise_controlled_by_person_or_spouse)))

; [trust:related_persons_corporate] 法人關係人定義
(assert (= related_persons_corporate
   (and person_is_corporate
        includes_same_source_controlled_corporate
        includes_mutual_control_corporate)))

; [trust:prohibited_trading_delegated_investment] 全權委託投資業務專責人員及關係人禁止交易規定
(assert (= prohibited_trading_delegated_investment
   (or (not delegated_investment_holding_company_stock_or_derivatives)
       (not trade_company_stock_or_derivatives_delegated))))

; [trust:prohibited_delegated_investment_behaviors] 全權委託投資業務禁止行為
(assert (let ((a!1 (= (or self_or_others_trading
                  delegate_or_transfer_contract
                  profit_loss_sharing_agreement
                  (and relative_trading_exception
                       (not intentional_counterparty_trading))
                  unauthorized_order_transfer
                  use_client_account_for_self_or_others
                  use_insider_info_for_others
                  ignore_investment_report
                  harm_client_interests
                  other_harmful_behaviors_delegated)
              prohibited_delegated_investment_behaviors)))
  (not a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令或命令，或人員違規，或違反罰鍰條件時處罰
(assert (= penalty
   (or (not prohibited_trading_delegated_investment)
       (not personnel_violation)
       (not prohibited_delegated_investment_behaviors)
       (not violation_fine)
       (not personnel_confidentiality)
       (not personnel_prohibited_behaviors)
       (not prohibited_trading_during_fund_holding))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= warning true))
(assert (= order_dismiss_officer true))
(assert (= suspend_fund_raising_or_new_business false))
(assert (= suspend_business false))
(assert (= revoke_business_license false))
(assert (= other_necessary_measures false))
(assert (= violate_law_or_related_regulations true))
(assert (= affect_normal_business true))
(assert (= personnel_violation true))
(assert (= personnel_violation_penalty true))
(assert (= violation_fine true))
(assert (= operate_without_approval false))
(assert (= violate_investment_scope_rules_14_1_18_1_56_1 false))
(assert (= violate_investment_scope_rules_16_4 false))
(assert (= violate_rules_16_1_19_1_51_1_59 false))
(assert (= violate_diversification_ratio_58_2 false))
(assert (= operate_without_business_license_63_1 false))
(assert (= violate_behavior_rules_69 true))
(assert (= violate_restriction_rules_70 false))
(assert (= violate_branch_establishment_rules_72_1 false))
(assert (= personnel_prohibited_behaviors true))
(assert (= leak_confidential_info false))
(assert (= self_or_others_trading_conflict true))
(assert (= fraudulent_or_misleading_behavior false))
(assert (= not_return_commission_to_fund false))
(assert (= provide_specific_benefits_to_promote false))
(assert (= sell_proxy_voting_rights_for_benefits false))
(assert (= manipulate_security_prices false))
(assert (= transfer_orders_between_accounts false))
(assert (= public_promotion_or_price_forecast false))
(assert (= use_nonprofessional_to_recruit_or_pay_unreasonable_commission false))
(assert (= agent_investment_except_legal_agent false))
(assert (= other_harmful_behaviors false))
(assert (= personnel_confidentiality true))
(assert (= keep_client_data_confidential true))
(assert (= prohibited_trading_during_fund_holding true))
(assert (= fund_holding_company_stock_or_derivatives true))
(assert (= trade_company_stock_or_derivatives true))
(assert (= prohibited_trading_delegated_investment true))
(assert (= delegated_investment_holding_company_stock_or_derivatives true))
(assert (= trade_company_stock_or_derivatives_delegated true))
(assert (= prohibited_delegated_investment_behaviors true))
(assert (= use_insider_info_for_others true))
(assert (= harm_client_interests true))
(assert (= profit_loss_sharing_agreement false))
(assert (= self_or_others_trading true))
(assert (= relative_trading_exception false))
(assert (= intentional_counterparty_trading false))
(assert (= use_client_account_for_self_or_others false))
(assert (= delegate_or_transfer_contract false))
(assert (= unauthorized_order_transfer false))
(assert (= ignore_investment_report false))
(assert (= other_harmful_behaviors_delegated false))
(assert (= person_is_natural_person true))
(assert (= includes_spouse_and_second_degree_relatives true))
(assert (= includes_enterprise_controlled_by_person_or_spouse true))
(assert (= related_persons_natural_person true))
(assert (= person_is_corporate false))
(assert (= includes_same_source_controlled_corporate false))
(assert (= includes_mutual_control_corporate false))
(assert (= related_persons_corporate false))
(assert (= related_persons_definition true))
(assert (= order_stop_business_within_one_year false))
(assert (= penalty false))
(assert (= violation_penalty_level false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 65
; Total facts: 65
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
