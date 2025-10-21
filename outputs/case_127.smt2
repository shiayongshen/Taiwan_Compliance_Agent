; SMT2 file generated from compliance case automatic
; Case ID: case_127
; Generated at: 2025-10-21T02:29:36.216638
;
; This file can be executed with Z3:
;   z3 case_127.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advertising_concealment Bool)
(declare-const advertising_content_obligation Bool)
(declare-const advertising_content_true Bool)
(declare-const advertising_false Bool)
(declare-const advertising_false_or_fraudulent Bool)
(declare-const advertising_foreign_exchange_speculation Bool)
(declare-const advertising_fraud Bool)
(declare-const advertising_guarantee_principal_or_profit Bool)
(declare-const advertising_illegal_promotion Bool)
(declare-const advertising_misleading Bool)
(declare-const advertising_misleading_other Bool)
(declare-const advertising_other_impacting_business_or_beneficiaries Bool)
(declare-const advertising_performance_forecast Bool)
(declare-const advertising_prohibited_behaviors Bool)
(declare-const advertising_reported Bool)
(declare-const advertising_reported_to_association_within_10_days Bool)
(declare-const advertising_truthful Bool)
(declare-const advertising_unapproved_fund_promotion Bool)
(declare-const advertising_use_approval_as_guarantee Bool)
(declare-const advertising_violate_law_or_contract Bool)
(declare-const annual_audit_plan_executed Bool)
(declare-const annual_audit_plan_reported Bool)
(declare-const audit_findings_reported Bool)
(declare-const business_duty_of_care_and_loyalty Bool)
(declare-const business_operated_according_to_internal_control Bool)
(declare-const business_suspension Bool)
(declare-const confidentiality_observed Bool)
(declare-const customer_identity_and_basic_data Bool)
(declare-const customer_identity_provided_and_basic_data_filled Bool)
(declare-const customer_knowledge_and_risk_assessed Bool)
(declare-const customer_knowledge_and_risk_assessment Bool)
(declare-const duty_of_care_observed Bool)
(declare-const duty_of_loyalty_observed Bool)
(declare-const financial_education_referral Bool)
(declare-const fund_sales_violation Bool)
(declare-const fund_sales_violation_responsibility Bool)
(declare-const futures_business_operated_according_to_internal_control Bool)
(declare-const futures_internal_control_change_completed_within_deadline Bool)
(declare-const futures_internal_control_change_complied Bool)
(declare-const futures_internal_control_change_notified Bool)
(declare-const futures_internal_control_change_recorded Bool)
(declare-const futures_internal_control_change_reported Bool)
(declare-const futures_internal_control_change_reported_to_board Bool)
(declare-const futures_internal_control_established Bool)
(declare-const futures_internal_control_operated Bool)
(declare-const futures_internal_control_system_established Bool)
(declare-const good_faith_principle_observed Bool)
(declare-const internal_audit_staff_adequate Bool)
(declare-const internal_control_anti_money_laundering Bool)
(declare-const internal_control_change_completed_within_deadline Bool)
(declare-const internal_control_change_complied Bool)
(declare-const internal_control_change_notified_by_authority Bool)
(declare-const internal_control_change_recorded Bool)
(declare-const internal_control_change_reported Bool)
(declare-const internal_control_change_reported_to_board Bool)
(declare-const internal_control_customer_understanding Bool)
(declare-const internal_control_deficiencies_corrected Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_includes_required_principles Bool)
(declare-const internal_control_legal_compliance Bool)
(declare-const internal_control_operated Bool)
(declare-const internal_control_requirements Bool)
(declare-const internal_control_reviewed Bool)
(declare-const internal_control_sales_behavior Bool)
(declare-const internal_control_self_assessed Bool)
(declare-const internal_control_short_swing_prevention Bool)
(declare-const internal_control_structure_defined Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_violation_conditions Bool)
(declare-const internal_control_written Bool)
(declare-const large_or_suspicious_transactions_recorded Bool)
(declare-const large_or_suspicious_transactions_recorded_and_compliant Bool)
(declare-const law_or_order_violated Bool)
(declare-const liability_for_damage Bool)
(declare-const license_revocation Bool)
(declare-const minor_case_exemption Bool)
(declare-const obligation_to_consumer Bool)
(declare-const order_to_remove_officer Bool)
(declare-const order_to_remove_personnel Bool)
(declare-const order_to_suspend_personnel Bool)
(declare-const other_necessary_measures Bool)
(declare-const other_related_data_confidential Bool)
(declare-const penalty Bool)
(declare-const penalty_exemption_for_minor_cases Bool)
(declare-const penalty_fines Bool)
(declare-const penalty_measures Bool)
(declare-const penalty_violation_list Bool)
(declare-const personal_data_confidential Bool)
(declare-const personnel_agent_for_others Bool)
(declare-const personnel_change_trade_account Bool)
(declare-const personnel_confidentiality Bool)
(declare-const personnel_duty_of_care_and_loyalty Bool)
(declare-const personnel_duty_of_care_observed Bool)
(declare-const personnel_duty_of_loyalty_observed Bool)
(declare-const personnel_false_or_fraudulent Bool)
(declare-const personnel_good_faith_principle_observed Bool)
(declare-const personnel_leak_confidential_info Bool)
(declare-const personnel_manipulate_market_price Bool)
(declare-const personnel_misconduct Bool)
(declare-const personnel_misconduct_affecting_business Bool)
(declare-const personnel_not_return_commission_to_fund Bool)
(declare-const personnel_offer_specific_benefits Bool)
(declare-const personnel_other_harmful_behaviors Bool)
(declare-const personnel_other_related_data_confidential Bool)
(declare-const personnel_penalty_measures Bool)
(declare-const personnel_personal_data_confidential Bool)
(declare-const personnel_prohibited_behaviors Bool)
(declare-const personnel_proxy_assignment Bool)
(declare-const personnel_public_recommendation_or_forecast Bool)
(declare-const personnel_self_dealing Bool)
(declare-const personnel_sell_proxy_votes Bool)
(declare-const personnel_transaction_data_confidential Bool)
(declare-const personnel_unreasonable_commission Bool)
(declare-const prohibited_financial_education Bool)
(declare-const proxy_assigned_with_qualification Bool)
(declare-const proxy_recorded_in_special_book Bool)
(declare-const proxy_violate_provisions Bool)
(declare-const serious_financial_reporting_violation Bool)
(declare-const serious_fraud_or_suspected Bool)
(declare-const short_swing_trading_fee_deducted Bool)
(declare-const short_swing_trading_fee_deducted_and_accounted Bool)
(declare-const subscription_and_redemption_follow_contract_and_procedures Bool)
(declare-const subscription_and_redemption_procedures Bool)
(declare-const subsidiary_defined Bool)
(declare-const subsidiary_defined_by_financial_reporting Bool)
(declare-const suspension_of_fund_raising Bool)
(declare-const transaction_data_confidential Bool)
(declare-const violation_119_listed Bool)
(declare-const violation_advertising_regulations Bool)
(declare-const violation_advertising_rules Bool)
(declare-const violation_behavior_rules_69 Bool)
(declare-const violation_branch_establishment_72_1 Bool)
(declare-const violation_compensation_rules Bool)
(declare-const violation_compensation_system Bool)
(declare-const violation_consumer_suitability Bool)
(declare-const violation_consumer_understanding Bool)
(declare-const violation_disclosure Bool)
(declare-const violation_disclosure_rules Bool)
(declare-const violation_diversification_ratio_58_2 Bool)
(declare-const violation_investment_scope_14_1 Bool)
(declare-const violation_investment_scope_16_4 Bool)
(declare-const violation_list_119 Bool)
(declare-const violation_no_business_license_63_1 Bool)
(declare-const violation_of_law_or_order Bool)
(declare-const violation_provisions_16_1_19_1_51_1_59 Bool)
(declare-const violation_restriction_rules_70 Bool)
(declare-const violation_unapproved_business Bool)
(declare-const warning_issued Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:business_duty_of_care_and_loyalty] 證券投資信託及顧問事業等應以善良管理人注意義務及忠實義務執行業務
(assert (= business_duty_of_care_and_loyalty
   (and duty_of_care_observed
        duty_of_loyalty_observed
        good_faith_principle_observed)))

; [securities:confidentiality_observed] 對受益人或客戶資料保守秘密
(assert (= confidentiality_observed
   (and personal_data_confidential
        transaction_data_confidential
        other_related_data_confidential)))

; [securities:liability_for_damage] 違反注意義務、忠實義務或保密義務應負賠償責任
(assert (= liability_for_damage
   (or (not business_duty_of_care_and_loyalty) (not confidentiality_observed))))

; [securities:violation_of_law_or_order] 違反本法或依本法發布之命令
(assert (= violation_of_law_or_order law_or_order_violated))

; [securities:penalty_measures] 主管機關可依情節輕重處分
(assert (= penalty_measures
   (or warning_issued
       other_necessary_measures
       order_to_remove_officer
       suspension_of_fund_raising
       license_revocation
       business_suspension)))

; [securities:personnel_misconduct_affecting_business] 董事、監察人、經理人或受僱人違法行為影響業務正常執行
(assert (= personnel_misconduct_affecting_business personnel_misconduct))

; [securities:personnel_penalty_measures] 主管機關得命停止執行業務或解除職務，並得視情節處分事業
(assert (= personnel_penalty_measures
   (or penalty_measures order_to_suspend_personnel order_to_remove_personnel)))

; [securities:penalty_violation_list] 違反第111條列舉事項之一
(assert (= penalty_violation_list
   (or violation_unapproved_business
       violation_no_business_license_63_1
       violation_investment_scope_14_1
       violation_investment_scope_16_4
       violation_provisions_16_1_19_1_51_1_59
       violation_diversification_ratio_58_2
       violation_behavior_rules_69
       violation_restriction_rules_70
       violation_branch_establishment_72_1)))

; [financial_consumer:advertising_misleading] 金融服務業廣告不得虛偽、詐欺、隱匿或足致誤信
(assert (not (= (or advertising_misleading_other
            advertising_fraud
            advertising_concealment
            advertising_false)
        advertising_misleading)))

; [financial_consumer:advertising_truthful] 金融服務業廣告內容須真實且義務不低於廣告內容
(assert (= advertising_truthful
   (and advertising_content_true
        (or (not obligation_to_consumer) advertising_content_obligation))))

; [financial_consumer:prohibited_financial_education] 金融服務業不得藉金融教育引薦個別商品或服務
(assert (not (= financial_education_referral prohibited_financial_education)))

; [financial_consumer:violation_advertising_rules] 違反廣告、業務招攬及促銷活動方式或內容規定
(assert (= violation_advertising_rules violation_advertising_regulations))

; [financial_consumer:violation_consumer_understanding] 未充分瞭解金融消費者資料及確保適合度
(assert (= violation_consumer_understanding violation_consumer_suitability))

; [financial_consumer:violation_disclosure] 未充分說明金融商品重要內容或揭露風險
(assert (= violation_disclosure violation_disclosure_rules))

; [financial_consumer:violation_compensation_system] 未訂定或未依核定原則訂定酬金制度或未確實執行
(assert (= violation_compensation_system violation_compensation_rules))

; [financial_consumer:penalty_fines] 違反金融消費者保護法第30-1條規定處罰
(assert (= penalty_fines
   (or violation_advertising_rules
       violation_disclosure
       violation_consumer_understanding
       violation_compensation_system)))

; [securities_trust:internal_control_established] 證券投資信託事業建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities_trust:internal_control_operated] 證券投資信託事業依內部控制制度經營業務
(assert (= internal_control_operated business_operated_according_to_internal_control))

; [securities_trust:internal_control_change_reported] 內部控制制度訂定或變更應報董事會同意並留存備查
(assert (= internal_control_change_reported
   (and internal_control_change_reported_to_board
        internal_control_change_recorded)))

; [securities_trust:internal_control_change_complied] 經主管機關通知變更者應於限期內變更
(assert (= internal_control_change_complied
   (or internal_control_change_completed_within_deadline
       (not internal_control_change_notified_by_authority))))

; [securities_trust:advertising_prohibited_behaviors] 證券投資信託事業廣告及促銷活動不得有禁止行為
(assert (= advertising_prohibited_behaviors
   (and (not advertising_use_approval_as_guarantee)
        (not advertising_guarantee_principal_or_profit)
        (not advertising_illegal_promotion)
        (not advertising_false_or_fraudulent)
        (not advertising_unapproved_fund_promotion)
        (not advertising_violate_law_or_contract)
        (not advertising_performance_forecast)
        (not advertising_foreign_exchange_speculation)
        (not advertising_other_impacting_business_or_beneficiaries))))

; [securities_trust:advertising_reported] 證券投資信託事業應於事實發生後十日內向同業公會申報廣告及促銷活動
(assert (= advertising_reported advertising_reported_to_association_within_10_days))

; [securities_trust:fund_sales_violation_responsibility] 基金銷售機構違反廣告及促銷規定，事業及銷售機構負責
(assert (= fund_sales_violation_responsibility fund_sales_violation))

; [securities_trust:personnel_duty_of_care_and_loyalty] 負責人及業務人員應以善良管理人注意義務及忠實義務執行業務
(assert (= personnel_duty_of_care_and_loyalty
   (and personnel_duty_of_care_observed
        personnel_duty_of_loyalty_observed
        personnel_good_faith_principle_observed)))

; [securities_trust:personnel_prohibited_behaviors] 負責人及業務人員不得有禁止行為
(assert (not (= (or personnel_false_or_fraudulent
            personnel_other_harmful_behaviors
            personnel_self_dealing
            personnel_agent_for_others
            personnel_not_return_commission_to_fund
            personnel_public_recommendation_or_forecast
            personnel_leak_confidential_info
            personnel_sell_proxy_votes
            personnel_change_trade_account
            personnel_manipulate_market_price
            personnel_unreasonable_commission
            personnel_offer_specific_benefits)
        personnel_prohibited_behaviors)))

; [securities_trust:personnel_confidentiality] 負責人及業務人員對受益人或客戶資料保守秘密
(assert (= personnel_confidentiality
   (and personnel_personal_data_confidential
        personnel_transaction_data_confidential
        personnel_other_related_data_confidential)))

; [securities_trust:personnel_proxy_assignment] 代理人應具相當資格且不得違反規定，並設專簿記錄
(assert (= personnel_proxy_assignment
   (and proxy_assigned_with_qualification
        (not proxy_violate_provisions)
        proxy_recorded_in_special_book)))

; [market_services:internal_control_requirements] 各服務事業應訂定明確內部控制制度並確實執行
(assert (= internal_control_requirements
   (and internal_control_structure_defined
        internal_control_executed
        internal_control_reviewed)))

; [market_services:internal_control_subsidiary_definition] 子公司依財務報告編製規範認定
(assert (= subsidiary_defined subsidiary_defined_by_financial_reporting))

; [market_services:internal_control_violation_conditions] 未訂書面內部控制制度等情事之一
(assert (= internal_control_violation_conditions
   (or (not audit_findings_reported)
       (not annual_audit_plan_executed)
       (not internal_control_self_assessed)
       (not internal_audit_staff_adequate)
       (not annual_audit_plan_reported)
       (not internal_control_deficiencies_corrected)
       serious_fraud_or_suspected
       serious_financial_reporting_violation
       (not internal_control_written))))

; [futures_trust:internal_control_established] 期貨信託事業依主管機關規定訂定內部控制制度
(assert (= futures_internal_control_established
   futures_internal_control_system_established))

; [futures_trust:internal_control_operated] 期貨信託事業依內部控制制度經營業務
(assert (= futures_internal_control_operated
   futures_business_operated_according_to_internal_control))

; [futures_trust:internal_control_change_reported] 內部控制制度訂定或變更應報董事會同意並留存備查
(assert (= futures_internal_control_change_reported
   (and futures_internal_control_change_reported_to_board
        futures_internal_control_change_recorded)))

; [futures_trust:internal_control_change_complied] 經主管機關或指定機構通知變更者應於限期內變更
(assert (= futures_internal_control_change_complied
   (or (not futures_internal_control_change_notified)
       futures_internal_control_change_completed_within_deadline)))

; [futures_trust:customer_knowledge_and_risk_assessment] 期貨信託事業應充分知悉並評估客戶投資知識、經驗、財務狀況及風險承受度
(assert (= customer_knowledge_and_risk_assessment customer_knowledge_and_risk_assessed))

; [futures_trust:customer_identity_and_basic_data] 首次申購客戶應提出身分證明文件並填具基本資料
(assert (= customer_identity_and_basic_data
   customer_identity_provided_and_basic_data_filled))

; [futures_trust:subscription_and_redemption_procedures] 受理申購買回應依契約及作業程序辦理
(assert (= subscription_and_redemption_procedures
   subscription_and_redemption_follow_contract_and_procedures))

; [futures_trust:large_or_suspicious_transactions_recorded] 一定金額以上或疑似洗錢交易應留存完整正確交易紀錄及憑證
(assert (= large_or_suspicious_transactions_recorded
   large_or_suspicious_transactions_recorded_and_compliant))

; [futures_trust:short_swing_trading_fee_deducted] 對符合短線交易認定標準之受益人扣除買回費用歸入基金資產
(assert (= short_swing_trading_fee_deducted
   short_swing_trading_fee_deducted_and_accounted))

; [futures_trust:internal_control_includes_required_principles] 內部控制制度應包括充分瞭解客戶、銷售行為、短線交易防制、洗錢防制及法令遵循
(assert (= internal_control_includes_required_principles
   (and internal_control_customer_understanding
        internal_control_sales_behavior
        internal_control_short_swing_prevention
        internal_control_anti_money_laundering
        internal_control_legal_compliance)))

; [futures:violation_list_119] 違反期貨交易法第119條列舉事項之一
(assert (= violation_list_119 violation_119_listed))

; [futures:penalty_exemption_for_minor_cases] 情節輕微得免予處罰
(assert (= penalty_exemption_for_minor_cases minor_case_exemption))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法定義務或規定時處罰
(assert (= penalty
   (or violation_list_119
       (not futures_internal_control_change_reported)
       (not personnel_confidentiality)
       (not customer_identity_and_basic_data)
       (not subscription_and_redemption_procedures)
       (not personnel_proxy_assignment)
       (not business_duty_of_care_and_loyalty)
       (not internal_control_change_complied)
       (not futures_internal_control_change_complied)
       fund_sales_violation_responsibility
       (not internal_control_operated)
       (not short_swing_trading_fee_deducted)
       (not advertising_prohibited_behaviors)
       (not confidentiality_observed)
       (not personnel_prohibited_behaviors)
       penalty_violation_list
       personnel_misconduct_affecting_business
       penalty_fines
       (not internal_control_includes_required_principles)
       (not personnel_duty_of_care_and_loyalty)
       (not internal_control_established)
       violation_of_law_or_order
       (not customer_knowledge_and_risk_assessment)
       internal_control_violation_conditions
       (not futures_internal_control_operated)
       (not large_or_suspicious_transactions_recorded)
       (not futures_internal_control_established)
       (not advertising_reported)
       (not penalty_exemption_for_minor_cases)
       (not internal_control_requirements)
       (not internal_control_change_reported))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= advertising_false true))
(assert (= advertising_fraud false))
(assert (= advertising_concealment true))
(assert (= advertising_misleading_other true))
(assert (= advertising_guarantee_principal_or_profit true))
(assert (= advertising_illegal_promotion true))
(assert (= advertising_unapproved_fund_promotion false))
(assert (= advertising_use_approval_as_guarantee false))
(assert (= advertising_violate_law_or_contract true))
(assert (= advertising_performance_forecast false))
(assert (= advertising_foreign_exchange_speculation false))
(assert (= advertising_other_impacting_business_or_beneficiaries true))
(assert (= advertising_reported_to_association_within_10_days false))
(assert (= advertising_reported false))
(assert (= advertising_content_true false))
(assert (= advertising_content_obligation false))
(assert (= advertising_misleading false))
(assert (= advertising_prohibited_behaviors false))
(assert (= business_duty_of_care_and_loyalty false))
(assert (= duty_of_care_observed false))
(assert (= duty_of_loyalty_observed false))
(assert (= good_faith_principle_observed false))
(assert (= confidentiality_observed false))
(assert (= personal_data_confidential false))
(assert (= transaction_data_confidential false))
(assert (= other_related_data_confidential false))
(assert (= fund_sales_violation true))
(assert (= fund_sales_violation_responsibility true))
(assert (= internal_control_written false))
(assert (= internal_audit_staff_adequate false))
(assert (= annual_audit_plan_reported false))
(assert (= annual_audit_plan_executed false))
(assert (= audit_findings_reported false))
(assert (= internal_control_self_assessed false))
(assert (= internal_control_deficiencies_corrected false))
(assert (= internal_control_violation_conditions true))
(assert (= internal_control_established false))
(assert (= internal_control_system_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_operated false))
(assert (= internal_control_change_reported false))
(assert (= internal_control_change_reported_to_board false))
(assert (= internal_control_change_recorded false))
(assert (= internal_control_change_complied false))
(assert (= internal_control_change_notified_by_authority false))
(assert (= internal_control_requirements false))
(assert (= internal_control_structure_defined false))
(assert (= internal_control_reviewed false))
(assert (= internal_control_customer_understanding false))
(assert (= internal_control_sales_behavior false))
(assert (= internal_control_short_swing_prevention false))
(assert (= internal_control_anti_money_laundering false))
(assert (= internal_control_legal_compliance false))
(assert (= personnel_duty_of_care_observed false))
(assert (= personnel_duty_of_loyalty_observed false))
(assert (= personnel_good_faith_principle_observed false))
(assert (= personnel_duty_of_care_and_loyalty false))
(assert (= personnel_prohibited_behaviors false))
(assert (= personnel_leak_confidential_info true))
(assert (= personnel_self_dealing true))
(assert (= personnel_false_or_fraudulent true))
(assert (= personnel_not_return_commission_to_fund false))
(assert (= personnel_offer_specific_benefits true))
(assert (= personnel_sell_proxy_votes false))
(assert (= personnel_manipulate_market_price false))
(assert (= personnel_change_trade_account false))
(assert (= personnel_public_recommendation_or_forecast true))
(assert (= personnel_other_harmful_behaviors false))
(assert (= personnel_confidentiality false))
(assert (= personnel_personal_data_confidential false))
(assert (= personnel_transaction_data_confidential false))
(assert (= personnel_other_related_data_confidential false))
(assert (= personnel_proxy_assignment false))
(assert (= proxy_assigned_with_qualification false))
(assert (= proxy_violate_provisions true))
(assert (= proxy_recorded_in_special_book false))
(assert (= personnel_misconduct true))
(assert (= personnel_misconduct_affecting_business true))
(assert (= personnel_penalty_measures true))
(assert (= order_to_remove_personnel true))
(assert (= order_to_suspend_personnel true))
(assert (= order_to_remove_officer true))
(assert (= penalty_measures true))
(assert (= warning_issued true))
(assert (= law_or_order_violated true))
(assert (= violation_of_law_or_order true))
(assert (= violation_advertising_regulations true))
(assert (= violation_advertising_rules true))
(assert (= violation_consumer_suitability false))
(assert (= violation_consumer_understanding false))
(assert (= violation_disclosure_rules false))
(assert (= violation_disclosure false))
(assert (= violation_compensation_rules false))
(assert (= violation_compensation_system false))
(assert (= penalty_fines true))
(assert (= penalty_violation_list false))
(assert (= violation_unapproved_business false))
(assert (= violation_investment_scope_14_1 false))
(assert (= violation_investment_scope_16_4 false))
(assert (= violation_provisions_16_1_19_1_51_1_59 false))
(assert (= violation_diversification_ratio_58_2 false))
(assert (= violation_no_business_license_63_1 false))
(assert (= violation_behavior_rules_69 false))
(assert (= violation_restriction_rules_70 false))
(assert (= violation_branch_establishment_72_1 false))
(assert (= violation_list_119 true))
(assert (= violation_119_listed true))
(assert (= minor_case_exemption false))
(assert (= penalty_exemption_for_minor_cases false))
(assert (= penalty true))
(assert (= liability_for_damage true))
(assert (= financial_education_referral false))
(assert (= prohibited_financial_education true))
(assert (= customer_identity_provided_and_basic_data_filled true))
(assert (= customer_identity_and_basic_data true))
(assert (= customer_knowledge_and_risk_assessed true))
(assert (= customer_knowledge_and_risk_assessment true))
(assert (= subscription_and_redemption_follow_contract_and_procedures true))
(assert (= subscription_and_redemption_procedures true))
(assert (= large_or_suspicious_transactions_recorded_and_compliant true))
(assert (= large_or_suspicious_transactions_recorded true))
(assert (= short_swing_trading_fee_deducted_and_accounted true))
(assert (= short_swing_trading_fee_deducted true))
(assert (= internal_control_includes_required_principles false))
(assert (= subsidiary_defined_by_financial_reporting true))
(assert (= subsidiary_defined true))
(assert (= futures_internal_control_system_established false))
(assert (= futures_internal_control_established false))
(assert (= futures_business_operated_according_to_internal_control false))
(assert (= futures_internal_control_operated false))
(assert (= futures_internal_control_change_reported_to_board false))
(assert (= futures_internal_control_change_reported false))
(assert (= futures_internal_control_change_recorded false))
(assert (= futures_internal_control_change_complied false))
(assert (= futures_internal_control_change_completed_within_deadline false))
(assert (= futures_internal_control_change_notified false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 44
; Total variables: 149
; Total facts: 136
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
