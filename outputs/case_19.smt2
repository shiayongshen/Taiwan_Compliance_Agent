; SMT2 file generated from compliance case automatic
; Case ID: case_19
; Generated at: 2025-10-20T23:10:56.512255
;
; This file can be executed with Z3:
;   z3 case_19.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_for_others_investment Bool)
(declare-const analysis_reasonable_basis Bool)
(declare-const business_operated_according_internal_control_and_law Bool)
(declare-const civil_liability_behavior_authorized Bool)
(declare-const confidentiality_obligation Bool)
(declare-const control_operation_recorded Bool)
(declare-const control_record_retention_period Bool)
(declare-const damaging_customer_interest_trading Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_loyalty Bool)
(declare-const execution_recorded Bool)
(declare-const fiduciary_duty_compliance Bool)
(declare-const fraudulent_behavior Bool)
(declare-const full_discretionary_investment_prohibited_behaviors Bool)
(declare-const full_discretionary_investment_restricted_trading Bool)
(declare-const full_discretionary_restricted_person_trading_during_holding_period Bool)
(declare-const good_faith_principle Bool)
(declare-const improper_account_order_change Bool)
(declare-const improper_order_account_change Bool)
(declare-const internal_control_change_approved_by_board Bool)
(declare-const internal_control_change_done_within_deadline Bool)
(declare-const internal_control_change_recorded Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_system_built Bool)
(declare-const internal_control_system_change_approved_and_recorded Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_system_operated_according_law Bool)
(declare-const investment_decision_based_on_analysis Bool)
(declare-const investment_decision_follow_report Bool)
(declare-const investment_decision_record_and_review Bool)
(declare-const leak_confidential_info Bool)
(declare-const liability_for_violation Bool)
(declare-const manipulate_security_price Bool)
(declare-const monthly_review_submitted Bool)
(declare-const not_intentional_opposite_trading Bool)
(declare-const not_return_commission_to_fund Bool)
(declare-const not_violate_article_19_1 Bool)
(declare-const not_violate_article_59 Bool)
(declare-const not_violate_law_or_contract Bool)
(declare-const opposite_side_trading Bool)
(declare-const other_harmful_behavior Bool)
(declare-const other_harmful_to_beneficiaries_or_business Bool)
(declare-const other_related_data_protection Bool)
(declare-const penalty Bool)
(declare-const performance_fee_regulated Bool)
(declare-const personal_data_protection Bool)
(declare-const personnel_authorized_behavior_presumption Bool)
(declare-const personnel_prohibited_behavior Bool)
(declare-const personnel_prohibited_specific_behaviors Bool)
(declare-const personnel_qualification_compliance Bool)
(declare-const personnel_regulatory_penalty_imposed Bool)
(declare-const personnel_rules_complied Bool)
(declare-const personnel_violation_penalties Bool)
(declare-const profit_loss_sharing_agreement Bool)
(declare-const prohibited_behavior_all Bool)
(declare-const prohibited_behavior_level_1 Bool)
(declare-const prohibited_behavior_level_2 Bool)
(declare-const prohibited_behavior_level_3 Bool)
(declare-const prohibited_behavior_level_4 Bool)
(declare-const prohibited_behavior_level_5 Bool)
(declare-const prohibited_behavior_level_6 Bool)
(declare-const prohibited_behavior_level_7 Bool)
(declare-const prohibited_behavior_level_8 Bool)
(declare-const prohibited_behavior_level_9 Bool)
(declare-const provide_specific_benefits_to_promote Bool)
(declare-const public_promotion_of_specific_security Bool)
(declare-const reasonable_explanation_provided Bool)
(declare-const regulatory_exception_for_order_change Bool)
(declare-const regulatory_exception_for_subdelegation Bool)
(declare-const regulatory_penalty_imposed Bool)
(declare-const report_has_reasonable_basis Bool)
(declare-const restricted_person_trading_during_holding_period Bool)
(declare-const restricted_trading_period_prohibition Bool)
(declare-const self_or_others_benefit_trading Bool)
(declare-const subdelegation_or_transfer Bool)
(declare-const trading_declaration_made Bool)
(declare-const trading_declaration_obligation Bool)
(declare-const trading_through_central_market Bool)
(declare-const transaction_data_protection Bool)
(declare-const transfer_proxy_voting_rights_for_money Bool)
(declare-const unreasonable_commission_payment Bool)
(declare-const use_customer_account_for_own_or_others_trading Bool)
(declare-const use_of_duty_info_for_own_or_others_trading Bool)
(declare-const violation_penalties Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:fiduciary_duty_compliance] 證券投資信託事業等應以善良管理人注意義務及忠實義務誠實信用原則執行業務
(assert (= fiduciary_duty_compliance
   (and duty_of_care duty_of_loyalty good_faith_principle)))

; [securities:confidentiality_obligation] 證券投資信託事業等應保守受益人或客戶個人資料及交易資料秘密
(assert (= confidentiality_obligation
   (and personal_data_protection
        transaction_data_protection
        other_related_data_protection)))

; [securities:liability_for_violation] 違反善良管理人義務或保密義務者應負賠償責任
(assert (= liability_for_violation
   (and fiduciary_duty_compliance confidentiality_obligation)))

; [securities:investment_decision_record_and_review] 證券投資信託事業投資決策應有合理基礎並作成紀錄及按月檢討
(assert (= investment_decision_record_and_review
   (and investment_decision_based_on_analysis
        execution_recorded
        monthly_review_submitted
        analysis_reasonable_basis)))

; [securities:internal_control_established_and_executed] 證券投資信託事業應訂定內部控制制度並確實執行，且留存紀錄
(assert (= internal_control_established_and_executed
   (and internal_control_system_established
        internal_control_system_executed
        control_operation_recorded
        (<= 0 (ite control_record_retention_period 1 0)))))

; [securities:prohibited_behavior_level_1] 禁止利用職務資訊為自己或非客戶之人從事有價證券買賣交易
(assert (not (= use_of_duty_info_for_own_or_others_trading prohibited_behavior_level_1)))

; [securities:prohibited_behavior_level_2] 禁止運用委託投資資產買賣有價證券時從事損害客戶權益之交易
(assert (not (= damaging_customer_interest_trading prohibited_behavior_level_2)))

; [securities:prohibited_behavior_level_3] 禁止與客戶約定收益共享或損失分擔（主管機關另有規定者除外）
(assert (= prohibited_behavior_level_3
   (or performance_fee_regulated (not profit_loss_sharing_agreement))))

; [securities:prohibited_behavior_level_4] 禁止運用客戶委託資產與自己或其他客戶資產為相對委託交易（非故意結果除外）
(assert (= prohibited_behavior_level_4
   (or (not opposite_side_trading)
       (and trading_through_central_market not_intentional_opposite_trading))))

; [securities:prohibited_behavior_level_5] 禁止利用客戶帳戶為自己或他人買賣有價證券
(assert (not (= use_customer_account_for_own_or_others_trading
        prohibited_behavior_level_5)))

; [securities:prohibited_behavior_level_6] 禁止將全權委託投資契約全部或部分複委任或轉讓他人（主管機關另有規定者除外）
(assert (= prohibited_behavior_level_6
   (or regulatory_exception_for_subdelegation (not subdelegation_or_transfer))))

; [securities:prohibited_behavior_level_7] 禁止無正當理由將已成交買賣委託帳戶變更（主管機關另有規定者除外）
(assert (= prohibited_behavior_level_7
   (or regulatory_exception_for_order_change
       (not improper_order_account_change))))

; [securities:prohibited_behavior_level_8] 禁止未依投資分析報告作成投資決策或報告缺乏合理基礎（合理解釋者除外）
(assert (= prohibited_behavior_level_8
   (or (not investment_decision_follow_report)
       reasonable_explanation_provided
       (not report_has_reasonable_basis))))

; [securities:prohibited_behavior_level_9] 禁止其他影響事業經營或客戶權益之行為
(assert (not (= other_harmful_behavior prohibited_behavior_level_9)))

; [securities:prohibited_behavior_all] 禁止所有列舉之違規行為
(assert (= prohibited_behavior_all
   (and prohibited_behavior_level_1
        prohibited_behavior_level_2
        prohibited_behavior_level_3
        prohibited_behavior_level_4
        prohibited_behavior_level_5
        prohibited_behavior_level_6
        prohibited_behavior_level_7
        prohibited_behavior_level_8
        prohibited_behavior_level_9)))

; [securities:personnel_qualification_compliance] 證券投資信託事業及顧問事業應備置人員資格條件及行為規範等規則
(assert (= personnel_qualification_compliance personnel_rules_complied))

; [securities:personnel_prohibited_behavior] 負責人及業務人員不得為第19條第1項、第59條或法令契約禁止之行為
(assert (= personnel_prohibited_behavior
   (and not_violate_article_19_1
        not_violate_article_59
        not_violate_law_or_contract)))

; [securities:personnel_authorized_behavior_presumption] 負責人及業務人員涉及民事責任行為推定為事業授權範圍內行為
(assert (= personnel_authorized_behavior_presumption
   civil_liability_behavior_authorized))

; [securities:restricted_trading_period_prohibition] 負責人及關係人於持有公司股票及股權性質衍生商品期間不得從事該交易
(assert (not (= restricted_person_trading_during_holding_period
        restricted_trading_period_prohibition)))

; [securities:trading_declaration_obligation] 負責人及關係人從事公司股票及股權性質衍生商品交易應申報
(assert (= trading_declaration_obligation trading_declaration_made))

; [securities:violation_penalties] 違反本法或命令者主管機關得依情節輕重處分
(assert (= violation_penalties regulatory_penalty_imposed))

; [securities:personnel_violation_penalties] 董事、監察人、經理人或受僱人違反法令影響業務正常執行者主管機關得處分
(assert (= personnel_violation_penalties personnel_regulatory_penalty_imposed))

; [securities:full_discretionary_investment_prohibited_behaviors] 全權委託投資業務禁止行為
(assert (= full_discretionary_investment_prohibited_behaviors
   (and prohibited_behavior_level_1
        prohibited_behavior_level_2
        prohibited_behavior_level_3
        prohibited_behavior_level_4
        prohibited_behavior_level_5
        prohibited_behavior_level_6
        prohibited_behavior_level_7
        prohibited_behavior_level_8
        prohibited_behavior_level_9)))

; [securities:full_discretionary_investment_restricted_trading] 全權委託投資業務專責部門主管與投資經理人及其關係人於持有期間不得從事公司股票及股權性質衍生商品交易
(assert (not (= full_discretionary_restricted_person_trading_during_holding_period
        full_discretionary_investment_restricted_trading)))

; [securities:internal_control_system_established] 證券投資信託事業應依規定建立內部控制制度
(assert (= internal_control_system_established internal_control_system_built))

; [securities:internal_control_system_operated_according_law] 證券投資信託事業業務經營應依內部控制制度及法令章程
(assert (= internal_control_system_operated_according_law
   business_operated_according_internal_control_and_law))

; [securities:internal_control_system_change_approved_and_recorded] 內部控制制度變更應董事會同意並留存備查，並於通知後限期變更
(assert (= internal_control_system_change_approved_and_recorded
   (and internal_control_change_approved_by_board
        internal_control_change_recorded
        internal_control_change_done_within_deadline)))

; [securities:personnel_prohibited_specific_behaviors] 負責人及業務人員不得有特定違規行為及應保守秘密
(assert (= personnel_prohibited_specific_behaviors
   (and (not leak_confidential_info)
        (not self_or_others_benefit_trading)
        (not fraudulent_behavior)
        (not not_return_commission_to_fund)
        (not provide_specific_benefits_to_promote)
        (not transfer_proxy_voting_rights_for_money)
        (not manipulate_security_price)
        (not improper_account_order_change)
        (not public_promotion_of_specific_security)
        (not unreasonable_commission_payment)
        (not agent_for_others_investment)
        (not other_harmful_to_beneficiaries_or_business)
        confidentiality_obligation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反善良管理人義務、保密義務、內部控制制度、禁止行為或人員資格規定時處罰
(assert (= penalty
   (or (not prohibited_behavior_all)
       (not internal_control_established_and_executed)
       (not violation_penalties)
       (not restricted_trading_period_prohibition)
       (not personnel_qualification_compliance)
       (not internal_control_system_operated_according_law)
       (not investment_decision_record_and_review)
       (not trading_declaration_obligation)
       (not full_discretionary_investment_prohibited_behaviors)
       (not personnel_prohibited_behavior)
       (not personnel_violation_penalties)
       (not internal_control_system_change_approved_and_recorded)
       (not confidentiality_obligation)
       (not personnel_prohibited_specific_behaviors)
       (not fiduciary_duty_compliance)
       (not full_discretionary_investment_restricted_trading)
       (not internal_control_system_established))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= duty_of_care false))
(assert (= duty_of_loyalty false))
(assert (= good_faith_principle false))
(assert (= personal_data_protection true))
(assert (= transaction_data_protection true))
(assert (= other_related_data_protection true))
(assert (= confidentiality_obligation true))
(assert (= investment_decision_based_on_analysis true))
(assert (= execution_recorded true))
(assert (= monthly_review_submitted true))
(assert (= analysis_reasonable_basis true))
(assert (= internal_control_system_built true))
(assert (= internal_control_system_executed false))
(assert (= control_operation_recorded false))
(assert (= control_record_retention_period false))
(assert (= internal_control_system_established true))
(assert (= business_operated_according_internal_control_and_law false))
(assert (= internal_control_change_approved_by_board true))
(assert (= internal_control_change_recorded true))
(assert (= internal_control_change_done_within_deadline true))
(assert (= internal_control_system_change_approved_and_recorded true))
(assert (= use_of_duty_info_for_own_or_others_trading true))
(assert (= damaging_customer_interest_trading true))
(assert (= profit_loss_sharing_agreement false))
(assert (= performance_fee_regulated true))
(assert (= opposite_side_trading true))
(assert (= trading_through_central_market true))
(assert (= not_intentional_opposite_trading true))
(assert (= use_customer_account_for_own_or_others_trading true))
(assert (= subdelegation_or_transfer false))
(assert (= regulatory_exception_for_subdelegation false))
(assert (= improper_order_account_change false))
(assert (= regulatory_exception_for_order_change false))
(assert (= investment_decision_follow_report true))
(assert (= report_has_reasonable_basis true))
(assert (= reasonable_explanation_provided true))
(assert (= other_harmful_behavior true))
(assert (= personnel_rules_complied false))
(assert (= personnel_qualification_compliance false))
(assert (= not_violate_article_19_1 false))
(assert (= not_violate_article_59 false))
(assert (= not_violate_law_or_contract false))
(assert (= personnel_prohibited_behavior false))
(assert (= leak_confidential_info false))
(assert (= self_or_others_benefit_trading true))
(assert (= fraudulent_behavior false))
(assert (= not_return_commission_to_fund false))
(assert (= provide_specific_benefits_to_promote false))
(assert (= transfer_proxy_voting_rights_for_money false))
(assert (= manipulate_security_price false))
(assert (= improper_account_order_change false))
(assert (= public_promotion_of_specific_security false))
(assert (= unreasonable_commission_payment false))
(assert (= agent_for_others_investment false))
(assert (= other_harmful_to_beneficiaries_or_business true))
(assert (= personnel_prohibited_specific_behaviors false))
(assert (= fiduciary_duty_compliance false))
(assert (= full_discretionary_investment_prohibited_behaviors false))
(assert (= full_discretionary_restricted_person_trading_during_holding_period false))
(assert (= full_discretionary_investment_restricted_trading false))
(assert (= restricted_person_trading_during_holding_period false))
(assert (= restricted_trading_period_prohibition false))
(assert (= trading_declaration_made false))
(assert (= trading_declaration_obligation false))
(assert (= regulatory_penalty_imposed true))
(assert (= violation_penalties true))
(assert (= personnel_regulatory_penalty_imposed true))
(assert (= personnel_violation_penalties true))
(assert (= civil_liability_behavior_authorized false))
(assert (= personnel_authorized_behavior_presumption false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 30
; Total variables: 85
; Total facts: 71
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
