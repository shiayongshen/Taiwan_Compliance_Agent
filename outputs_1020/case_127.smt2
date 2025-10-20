; SMT2 file generated from compliance case automatic
; Case ID: case_127
; Generated at: 2025-10-19T08:43:45.415564
;
; This file can be executed with Z3:
;   z3 case_127.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const act_as_agent_without_authority Bool)
(declare-const advertising_compliance Bool)
(declare-const advertising_content_level Bool)
(declare-const advertising_content_true Bool)
(declare-const advertising_obligation_level Bool)
(declare-const advertising_prohibited_acts Bool)
(declare-const advertising_reported Bool)
(declare-const advertising_reported_within_10_days Bool)
(declare-const agent_not_violating_article_3_4_8 Bool)
(declare-const agent_qualification_adequate Bool)
(declare-const agent_qualification_and_record Bool)
(declare-const agent_recorded_in_special_book Bool)
(declare-const annual_audit_plan_executed Bool)
(declare-const annual_audit_plan_reported Bool)
(declare-const anti_money_laundering_compliance Bool)
(declare-const appropriate_authority_and_responsibility_defined Bool)
(declare-const assist_formal_appearance_violation Bool)
(declare-const audit_findings_reported Bool)
(declare-const authorized_act_presumption Bool)
(declare-const business_operated_according_to_articles Bool)
(declare-const business_operated_according_to_internal_control Bool)
(declare-const business_operated_according_to_law Bool)
(declare-const business_suspension Bool)
(declare-const buyback_fee_deducted Bool)
(declare-const civil_liability_act_presumed_authorized Bool)
(declare-const confidentiality_compliance Bool)
(declare-const customer_basic_data_filled Bool)
(declare-const customer_financial_status_assessed Bool)
(declare-const customer_identity_and_data Bool)
(declare-const customer_identity_provided Bool)
(declare-const customer_investment_experience_assessed Bool)
(declare-const customer_investment_knowledge_assessed Bool)
(declare-const customer_knowledge_assessment Bool)
(declare-const customer_risk_tolerance_assessed Bool)
(declare-const damage_reputation Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_loyalty Bool)
(declare-const exaggerate_past_performance Bool)
(declare-const exaggerate_performance Bool)
(declare-const false_or_fraudulent Bool)
(declare-const false_or_fraudulent_advertising Bool)
(declare-const fee_included_in_fund_assets Bool)
(declare-const fiduciary_duty_compliance Bool)
(declare-const financial_education_referral Bool)
(declare-const fund_sales_responsibility Bool)
(declare-const fund_sales_violation_responsible Bool)
(declare-const futures_business_operated_according_to_articles Bool)
(declare-const futures_business_operated_according_to_internal_control Bool)
(declare-const futures_business_operated_according_to_law Bool)
(declare-const futures_internal_control_change_approved Bool)
(declare-const futures_internal_control_change_completed_within_deadline Bool)
(declare-const futures_internal_control_change_complied Bool)
(declare-const futures_internal_control_change_notified Bool)
(declare-const futures_internal_control_change_recorded Bool)
(declare-const futures_internal_control_change_reported_to_board Bool)
(declare-const futures_internal_control_compliance Bool)
(declare-const futures_internal_control_established Bool)
(declare-const futures_internal_control_system_established Bool)
(declare-const good_faith_principle Bool)
(declare-const guarantee_principal_or_profit Bool)
(declare-const hide_restrictions Bool)
(declare-const internal_control_change_approved Bool)
(declare-const internal_control_change_completed_within_deadline Bool)
(declare-const internal_control_change_complied Bool)
(declare-const internal_control_change_notified_by_authority Bool)
(declare-const internal_control_change_recorded Bool)
(declare-const internal_control_change_reported_to_board Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_designed Bool)
(declare-const internal_control_documented Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_execution Bool)
(declare-const internal_control_requirements Bool)
(declare-const internal_control_reviewed Bool)
(declare-const internal_control_self_assessed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_violation Bool)
(declare-const internal_organization_structure_defined Bool)
(declare-const law_or_order_violated Bool)
(declare-const leak_confidential_info Bool)
(declare-const liability_for_damage Bool)
(declare-const license_revocation Bool)
(declare-const major_fraud_or_suspected_fraud Bool)
(declare-const major_transactions_recorded Bool)
(declare-const manager_appointment_and_dismissal_defined Bool)
(declare-const manager_authority_defined Bool)
(declare-const manager_compensation_policy_defined Bool)
(declare-const manipulate_security_prices Bool)
(declare-const mislead_approval Bool)
(declare-const not_return_commission_to_fund Bool)
(declare-const offer_gifts_to_induce_purchase Bool)
(declare-const offer_specific_benefits_to_promote Bool)
(declare-const officer_misconduct Bool)
(declare-const officer_misconduct_penalty Bool)
(declare-const officer_violation_affecting_business Bool)
(declare-const operate_without_license_63_1 Bool)
(declare-const order_removal_of_officer Bool)
(declare-const order_stop_business_within_one_year Bool)
(declare-const other_harmful_acts Bool)
(declare-const other_necessary_measures Bool)
(declare-const other_necessary_special_audit_cases Bool)
(declare-const other_related_data_protection Bool)
(declare-const pay_unreasonable_commission Bool)
(declare-const penalty Bool)
(declare-const penalty_aggravation Bool)
(declare-const penalty_fine_111 Bool)
(declare-const penalty_measures Bool)
(declare-const penalty_violation_advertising Bool)
(declare-const penalty_violation_consumer_protection Bool)
(declare-const penalty_violation_formal_appearance Bool)
(declare-const personal_data_protection Bool)
(declare-const personnel_confidentiality Bool)
(declare-const personnel_duty_of_care Bool)
(declare-const personnel_duty_of_loyalty Bool)
(declare-const personnel_fiduciary_duty Bool)
(declare-const personnel_good_faith_principle Bool)
(declare-const personnel_other_data_protection Bool)
(declare-const personnel_personal_data_protection Bool)
(declare-const personnel_prohibited_acts Bool)
(declare-const personnel_transaction_data_protection Bool)
(declare-const predict_fund_performance Bool)
(declare-const prohibited_acts_19_1_59 Bool)
(declare-const prohibited_advertising_acts Bool)
(declare-const prohibited_business_acts Bool)
(declare-const prohibited_fin_edu_promotion Bool)
(declare-const promote_unapproved_funds Bool)
(declare-const promote_unapproved_products Bool)
(declare-const publicly_recommend_specific_securities Bool)
(declare-const qualified_internal_audit_staff_assigned Bool)
(declare-const reporting_system_defined Bool)
(declare-const self_dealing_or_related_party_trading Bool)
(declare-const sell_voting_rights_for_benefits Bool)
(declare-const serious_case Bool)
(declare-const short_swing_trading_fee_handling Bool)
(declare-const short_swing_trading_identified Bool)
(declare-const significant_financial_reporting_misstatements Bool)
(declare-const significant_internal_control_deficiencies Bool)
(declare-const speculate_exchange_rate Bool)
(declare-const subscription_and_redemption_compliance Bool)
(declare-const subscription_redemption_according_to_contract Bool)
(declare-const subsidiary_defined_by_financial_reporting Bool)
(declare-const subsidiary_definition Bool)
(declare-const suspension_of_fund_raising Bool)
(declare-const transaction_data_protection Bool)
(declare-const transfer_orders_between_accounts Bool)
(declare-const use_approval_as_guarantee Bool)
(declare-const use_confusing_trademark Bool)
(declare-const use_false_reports Bool)
(declare-const use_nonprofessional_to_recruit_clients Bool)
(declare-const violate_advertising_content_rules Bool)
(declare-const violate_advertising_regulations Bool)
(declare-const violate_article_14_1_18_1_56_1 Bool)
(declare-const violate_article_16_1_19_1_51_1_59 Bool)
(declare-const violate_article_16_4 Bool)
(declare-const violate_article_3_4 Bool)
(declare-const violate_article_58_2 Bool)
(declare-const violate_compensation_system Bool)
(declare-const violate_consumer_data_understanding Bool)
(declare-const violate_consumer_protection Bool)
(declare-const violate_disclosure_obligations Bool)
(declare-const violate_law_or_contract Bool)
(declare-const violate_law_or_regulation Bool)
(declare-const violate_rules_69 Bool)
(declare-const violate_rules_70 Bool)
(declare-const violate_rules_72_1 Bool)
(declare-const violation_of_law_or_order Bool)
(declare-const warning_issued Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:fiduciary_duty_compliance] 證券投資信託事業等依善良管理人注意義務及忠實義務執行業務
(assert (= fiduciary_duty_compliance
   (and duty_of_care duty_of_loyalty good_faith_principle)))

; [securities:confidentiality_compliance] 對受益人或客戶資料保守秘密
(assert (= confidentiality_compliance
   (and personal_data_protection
        transaction_data_protection
        other_related_data_protection)))

; [securities:liability_for_damage] 違反義務致損害應負賠償責任
(assert (= liability_for_damage
   (and (not fiduciary_duty_compliance) (not confidentiality_compliance))))

; [securities:violation_of_law_or_order] 違反本法或依本法發布命令
(assert (= violation_of_law_or_order law_or_order_violated))

; [securities:penalty_measures] 主管機關可依違反情節輕重採取處分措施
(assert (= penalty_measures
   (or suspension_of_fund_raising
       order_removal_of_officer
       warning_issued
       business_suspension
       license_revocation
       other_necessary_measures)))

; [securities:officer_misconduct] 董事、監察人、經理人或受僱人違反法令影響業務正常執行
(assert (= officer_misconduct officer_violation_affecting_business))

; [securities:officer_misconduct_penalty] 主管機關得命停止業務或解除職務，並依前條處分
(assert (= officer_misconduct_penalty
   (or order_removal_of_officer
       order_stop_business_within_one_year
       penalty_measures)))

; [securities:penalty_fine_111] 第111條列舉違規行為罰鍰
(assert (= penalty_fine_111
   (or violate_article_14_1_18_1_56_1
       violate_rules_72_1
       violate_article_16_1_19_1_51_1_59
       violate_article_16_4
       violate_rules_69
       violate_rules_70
       violate_article_58_2
       violate_article_3_4
       operate_without_license_63_1)))

; [finance:advertising_compliance] 金融服務業廣告及促銷不得虛偽詐欺且應真實
(assert (= advertising_compliance
   (and (not false_or_fraudulent_advertising)
        advertising_content_true
        (= advertising_obligation_level advertising_content_level))))

; [finance:prohibited_fin_edu_promotion] 金融教育宣導不得引薦個別金融商品或服務
(assert (not (= financial_education_referral prohibited_fin_edu_promotion)))

; [finance:penalty_violation_advertising] 違反廣告及促銷規定罰鍰
(assert (= penalty_violation_advertising violate_advertising_regulations))

; [finance:penalty_violation_consumer_protection] 違反金融消費者保護法相關規定罰鍰
(assert (= penalty_violation_consumer_protection
   (or violate_disclosure_obligations
       violate_compensation_system
       violate_advertising_content_rules
       violate_consumer_data_understanding)))

; [finance:penalty_violation_formal_appearance] 協助創造形式上外觀條件違規罰鍰
(assert (= penalty_violation_formal_appearance assist_formal_appearance_violation))

; [finance:penalty_aggravation] 情節重大者得加重罰鍰
(assert (= penalty_aggravation
   (and (or penalty_violation_advertising penalty_violation_consumer_protection)
        serious_case)))

; [finance_advertising:prohibited_acts] 金融服務業廣告業務招攬及促銷不得有禁止行為
(assert (not (= (or violate_law_or_regulation
            hide_restrictions
            use_confusing_trademark
            mislead_approval
            use_false_reports
            false_or_fraudulent
            exaggerate_performance
            promote_unapproved_products
            guarantee_principal_or_profit
            damage_reputation)
        prohibited_advertising_acts)))

; [securities:internal_control_established] 證券投資信託事業建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_compliance] 業務經營依內部控制制度及法令章程
(assert (= internal_control_compliance
   (and business_operated_according_to_law
        business_operated_according_to_articles
        business_operated_according_to_internal_control)))

; [securities:internal_control_change_approved] 內部控制制度訂定或變更經董事會同意並留存備查
(assert (= internal_control_change_approved
   (and internal_control_change_reported_to_board
        internal_control_change_recorded)))

; [securities:internal_control_change_complied] 經主管機關通知變更者於限期內變更
(assert (= internal_control_change_complied
   (or internal_control_change_completed_within_deadline
       (not internal_control_change_notified_by_authority))))

; [securities:advertising_prohibited_acts] 證券投資信託事業廣告及促銷不得有禁止行為
(assert (not (= (or speculate_exchange_rate
            use_approval_as_guarantee
            offer_gifts_to_induce_purchase
            false_or_fraudulent
            other_harmful_acts
            promote_unapproved_funds
            violate_law_or_contract
            guarantee_principal_or_profit
            exaggerate_past_performance
            predict_fund_performance)
        advertising_prohibited_acts)))

; [securities:advertising_reported] 廣告及促銷活動事實發生後十日內申報
(assert (= advertising_reported advertising_reported_within_10_days))

; [securities:fund_sales_responsibility] 基金銷售機構違反規定應負責任
(assert (= fund_sales_responsibility fund_sales_violation_responsible))

; [securities:personnel_fiduciary_duty] 負責人及業務人員以善良管理人注意義務及忠實義務執行業務
(assert (= personnel_fiduciary_duty
   (and personnel_duty_of_care
        personnel_duty_of_loyalty
        personnel_good_faith_principle)))

; [securities:personnel_prohibited_acts] 負責人及業務人員不得有禁止行為
(assert (not (= (or sell_voting_rights_for_benefits
            publicly_recommend_specific_securities
            not_return_commission_to_fund
            use_nonprofessional_to_recruit_clients
            leak_confidential_info
            transfer_orders_between_accounts
            false_or_fraudulent
            act_as_agent_without_authority
            other_harmful_acts
            offer_specific_benefits_to_promote
            manipulate_security_prices
            self_dealing_or_related_party_trading
            pay_unreasonable_commission)
        personnel_prohibited_acts)))

; [securities:personnel_confidentiality] 負責人及業務人員對客戶資料保守秘密
(assert (= personnel_confidentiality
   (and personnel_personal_data_protection
        personnel_transaction_data_protection
        personnel_other_data_protection)))

; [securities:agent_qualification_and_record] 代理人應具相當資格且代理事由應專簿記載
(assert (= agent_qualification_and_record
   (and agent_qualification_adequate
        agent_not_violating_article_3_4_8
        agent_recorded_in_special_book)))

; [securities:prohibited_business_acts] 負責人及業務人員不得為本法第十九條第一項、第五十九條或契約規定禁止行為
(assert (not (= prohibited_acts_19_1_59 prohibited_business_acts)))

; [securities:authorized_act_presumption] 涉及民事責任行為推定為事業授權範圍內行為
(assert (= authorized_act_presumption civil_liability_act_presumed_authorized))

; [securities_market:internal_control_requirements] 服務事業內部控制制度應訂定組織結構、呈報體系及經理人職權等事項
(assert (= internal_control_requirements
   (and internal_organization_structure_defined
        reporting_system_defined
        appropriate_authority_and_responsibility_defined
        manager_appointment_and_dismissal_defined
        manager_authority_defined
        manager_compensation_policy_defined)))

; [securities_market:internal_control_execution] 服務事業應設計、執行並檢討內部控制制度以確保有效
(assert (= internal_control_execution
   (and internal_control_designed
        internal_control_executed
        internal_control_reviewed)))

; [securities_market:subsidiary_definition] 子公司依財務報告編製規範認定
(assert (= subsidiary_definition subsidiary_defined_by_financial_reporting))

; [securities_market:internal_control_violation] 未訂書面內部控制制度或相關缺失情節重大
(assert (= internal_control_violation
   (or (not qualified_internal_audit_staff_assigned)
       significant_internal_control_deficiencies
       (not internal_control_self_assessed)
       (not annual_audit_plan_executed)
       significant_financial_reporting_misstatements
       (not audit_findings_reported)
       major_fraud_or_suspected_fraud
       (not annual_audit_plan_reported)
       other_necessary_special_audit_cases
       (not internal_control_documented))))

; [futures:internal_control_established] 期貨信託事業依主管機關規定訂定內部控制制度
(assert (= futures_internal_control_established
   futures_internal_control_system_established))

; [futures:internal_control_compliance] 期貨信託事業業務依內部控制制度及法令章程經營
(assert (= futures_internal_control_compliance
   (and futures_business_operated_according_to_law
        futures_business_operated_according_to_articles
        futures_business_operated_according_to_internal_control)))

; [futures:internal_control_change_approved] 期貨信託事業內部控制制度訂定或變更經董事會同意並留存備查
(assert (= futures_internal_control_change_approved
   (and futures_internal_control_change_reported_to_board
        futures_internal_control_change_recorded)))

; [futures:internal_control_change_complied] 經主管機關或指定機構通知變更者於限期內變更
(assert (= futures_internal_control_change_complied
   (or (not futures_internal_control_change_notified)
       futures_internal_control_change_completed_within_deadline)))

; [futures:customer_knowledge_assessment] 期貨信託事業應充分知悉並評估客戶投資知識、經驗、財務狀況及風險承受度
(assert (= customer_knowledge_assessment
   (and customer_investment_knowledge_assessed
        customer_investment_experience_assessed
        customer_financial_status_assessed
        customer_risk_tolerance_assessed)))

; [futures:customer_identity_and_data] 首次申購客戶應提出身分證明並填具基本資料
(assert (= customer_identity_and_data
   (and customer_identity_provided customer_basic_data_filled)))

; [futures:subscription_and_redemption_compliance] 申購買回依契約及作業程序辦理，重大交易留存完整紀錄
(assert (= subscription_and_redemption_compliance
   (and subscription_redemption_according_to_contract
        major_transactions_recorded
        anti_money_laundering_compliance)))

; [futures:short_swing_trading_fee_handling] 短線交易買回費用扣除並歸入基金資產
(assert (= short_swing_trading_fee_handling
   (and short_swing_trading_identified
        buyback_fee_deducted
        fee_included_in_fund_assets)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反義務或規定時處罰
(assert (= penalty
   (or violate_consumer_protection
       penalty_fine_111
       (not futures_internal_control_change_approved)
       (not fund_sales_responsibility)
       internal_control_violation
       prohibited_fin_edu_promotion
       (not futures_internal_control_compliance)
       (not confidentiality_compliance)
       (not prohibited_business_acts)
       violate_advertising_regulations
       (not internal_control_execution)
       (not internal_control_change_approved)
       (not internal_control_change_complied)
       law_or_order_violated
       (not futures_internal_control_established)
       (not personnel_fiduciary_duty)
       (not internal_control_established)
       (not short_swing_trading_fee_handling)
       (not advertising_compliance)
       (not internal_control_requirements)
       (not internal_control_compliance)
       (not subscription_and_redemption_compliance)
       assist_formal_appearance_violation
       (not futures_internal_control_change_complied)
       (not prohibited_advertising_acts)
       (not fiduciary_duty_compliance)
       officer_violation_affecting_business
       (not agent_qualification_and_record)
       (not customer_knowledge_assessment)
       (not customer_identity_and_data)
       (not advertising_prohibited_acts)
       (not subsidiary_definition)
       (not personnel_prohibited_acts)
       (not authorized_act_presumption)
       (not advertising_reported)
       (not personnel_confidentiality))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= duty_of_care false))
(assert (= duty_of_loyalty false))
(assert (= good_faith_principle false))
(assert (= personal_data_protection false))
(assert (= transaction_data_protection false))
(assert (= other_related_data_protection false))
(assert (= law_or_order_violated true))
(assert (= officer_violation_affecting_business true))
(assert (= warning_issued true))
(assert (= order_removal_of_officer true))
(assert (= order_stop_business_within_one_year false))
(assert (= business_suspension false))
(assert (= license_revocation false))
(assert (= other_necessary_measures false))
(assert (= violate_article_3_4 true))
(assert (= violate_article_14_1_18_1_56_1 true))
(assert (= violate_article_16_4 false))
(assert (= violate_article_16_1_19_1_51_1_59 false))
(assert (= violate_article_58_2 false))
(assert (= violate_advertising_regulations true))
(assert (= violate_consumer_protection true))
(assert (= assist_formal_appearance_violation false))
(assert (= advertising_compliance false))
(assert (= prohibited_fin_edu_promotion false))
(assert (= prohibited_advertising_acts false))
(assert (= advertising_reported_within_10_days false))
(assert (= fund_sales_violation_responsible true))
(assert (= personnel_duty_of_care false))
(assert (= personnel_duty_of_loyalty false))
(assert (= personnel_good_faith_principle false))
(assert (= personnel_personal_data_protection false))
(assert (= personnel_transaction_data_protection false))
(assert (= personnel_other_data_protection false))
(assert (= agent_qualification_adequate false))
(assert (= agent_not_violating_article_3_4_8 false))
(assert (= agent_recorded_in_special_book false))
(assert (= prohibited_business_acts false))
(assert (= civil_liability_act_presumed_authorized false))
(assert (= internal_control_system_established false))
(assert (= internal_control_compliance false))
(assert (= internal_control_change_reported_to_board false))
(assert (= internal_control_change_recorded false))
(assert (= internal_control_change_notified_by_authority false))
(assert (= internal_control_change_completed_within_deadline false))
(assert (= advertising_reported false))
(assert (= fund_sales_responsibility true))
(assert (= personnel_fiduciary_duty false))
(assert (= personnel_prohibited_acts false))
(assert (= personnel_confidentiality false))
(assert (= agent_qualification_and_record false))
(assert (= authorized_act_presumption false))
(assert (= internal_control_requirements false))
(assert (= internal_control_designed false))
(assert (= internal_control_executed false))
(assert (= internal_control_reviewed false))
(assert (= internal_control_self_assessed false))
(assert (= internal_control_violation true))
(assert (= qualified_internal_audit_staff_assigned false))
(assert (= annual_audit_plan_reported false))
(assert (= annual_audit_plan_executed false))
(assert (= audit_findings_reported false))
(assert (= significant_internal_control_deficiencies true))
(assert (= significant_financial_reporting_misstatements false))
(assert (= major_fraud_or_suspected_fraud false))
(assert (= other_necessary_special_audit_cases false))
(assert (= false_or_fraudulent true))
(assert (= false_or_fraudulent_advertising true))
(assert (= guarantee_principal_or_profit true))
(assert (= offer_gifts_to_induce_purchase false))
(assert (= exaggerate_past_performance true))
(assert (= exaggerate_performance true))
(assert (= mislead_approval false))
(assert (= promote_unapproved_products false))
(assert (= promote_unapproved_funds false))
(assert (= violate_law_or_contract true))
(assert (= violate_law_or_regulation true))
(assert (= violate_rules_69 false))
(assert (= violate_rules_70 false))
(assert (= violate_rules_72_1 false))
(assert (= leak_confidential_info false))
(assert (= self_dealing_or_related_party_trading true))
(assert (= not_return_commission_to_fund false))
(assert (= offer_specific_benefits_to_promote true))
(assert (= sell_voting_rights_for_benefits false))
(assert (= manipulate_security_prices false))
(assert (= transfer_orders_between_accounts false))
(assert (= publicly_recommend_specific_securities false))
(assert (= use_nonprofessional_to_recruit_clients false))
(assert (= pay_unreasonable_commission false))
(assert (= act_as_agent_without_authority false))
(assert (= other_harmful_acts true))
(assert (= penalty_fine_111 true))
(assert (= penalty_measures true))
(assert (= penalty_violation_advertising true))
(assert (= penalty_violation_consumer_protection true))
(assert (= penalty_violation_formal_appearance false))
(assert (= penalty_aggravation true))
(assert (= fiduciary_duty_compliance false))
(assert (= confidentiality_compliance false))
(assert (= penalty true))
(assert (= officer_misconduct true))
(assert (= officer_misconduct_penalty true))
(assert (= customer_investment_knowledge_assessed false))
(assert (= customer_investment_experience_assessed false))
(assert (= customer_financial_status_assessed false))
(assert (= customer_risk_tolerance_assessed false))
(assert (= customer_knowledge_assessment false))
(assert (= customer_identity_provided false))
(assert (= customer_basic_data_filled false))
(assert (= customer_identity_and_data false))
(assert (= subscription_redemption_according_to_contract false))
(assert (= major_transactions_recorded false))
(assert (= anti_money_laundering_compliance false))
(assert (= subscription_and_redemption_compliance false))
(assert (= short_swing_trading_identified false))
(assert (= buyback_fee_deducted false))
(assert (= fee_included_in_fund_assets false))
(assert (= short_swing_trading_fee_handling false))
(assert (= futures_internal_control_system_established true))
(assert (= futures_internal_control_established true))
(assert (= futures_business_operated_according_to_law true))
(assert (= futures_business_operated_according_to_articles true))
(assert (= futures_business_operated_according_to_internal_control true))
(assert (= futures_internal_control_compliance true))
(assert (= futures_internal_control_change_reported_to_board false))
(assert (= futures_internal_control_change_recorded false))
(assert (= futures_internal_control_change_approved false))
(assert (= futures_internal_control_change_notified false))
(assert (= futures_internal_control_change_completed_within_deadline false))
(assert (= futures_internal_control_change_complied false))
(assert (= subsidiary_defined_by_financial_reporting true))
(assert (= subsidiary_definition true))
(assert (= internal_organization_structure_defined false))
(assert (= reporting_system_defined false))
(assert (= appropriate_authority_and_responsibility_defined false))
(assert (= manager_appointment_and_dismissal_defined false))
(assert (= manager_authority_defined false))
(assert (= manager_compensation_policy_defined false))
(assert (= advertising_content_level false))
(assert (= advertising_content_true false))
(assert (= advertising_obligation_level false))
(assert (= advertising_prohibited_acts false))
(assert (= business_operated_according_to_articles false))
(assert (= business_operated_according_to_internal_control false))
(assert (= business_operated_according_to_law false))
(assert (= damage_reputation false))
(assert (= financial_education_referral false))
(assert (= hide_restrictions false))
(assert (= internal_control_change_approved false))
(assert (= internal_control_change_complied false))
(assert (= internal_control_documented false))
(assert (= internal_control_established false))
(assert (= internal_control_execution false))
(assert (= liability_for_damage false))
(assert (= operate_without_license_63_1 false))
(assert (= predict_fund_performance false))
(assert (= prohibited_acts_19_1_59 false))
(assert (= serious_case false))
(assert (= speculate_exchange_rate false))
(assert (= suspension_of_fund_raising false))
(assert (= use_approval_as_guarantee false))
(assert (= use_confusing_trademark false))
(assert (= use_false_reports false))
(assert (= violate_advertising_content_rules false))
(assert (= violate_compensation_system false))
(assert (= violate_consumer_data_understanding false))
(assert (= violate_disclosure_obligations false))
(assert (= violation_of_law_or_order false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 42
; Total variables: 168
; Total facts: 168
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
