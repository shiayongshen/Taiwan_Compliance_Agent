; SMT2 file generated from compliance case automatic
; Case ID: case_107
; Generated at: 2025-10-19T08:14:10.922741
;
; This file can be executed with Z3:
;   z3 case_107.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_audit_plan_executed Bool)
(declare-const annual_audit_plan_reported_on_time Bool)
(declare-const board_approval_for_control_system Bool)
(declare-const business_duty_faith Bool)
(declare-const business_operated_according_to_articles Bool)
(declare-const business_operated_according_to_internal_control Bool)
(declare-const business_operated_according_to_law Bool)
(declare-const can_provide_reasonable_explanation Bool)
(declare-const changed_account_without_justification Bool)
(declare-const confidentiality_obligation Bool)
(declare-const control_operation_recorded Bool)
(declare-const control_record_minimum_period Int)
(declare-const control_record_retention_period Int)
(declare-const control_system_recorded Bool)
(declare-const damaged_client_interest_in_trading Bool)
(declare-const deficiency_severity_major Bool)
(declare-const dispersed_investment Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_good_faith Bool)
(declare-const duty_of_loyalty Bool)
(declare-const execution_recorded Bool)
(declare-const external_financial_report_false Bool)
(declare-const intentional_opposite_order Bool)
(declare-const internal_control_authority_responsibility_defined Bool)
(declare-const internal_control_continuously_reviewed Bool)
(declare-const internal_control_deficiency_conditions Bool)
(declare-const internal_control_deficiency_improved Bool)
(declare-const internal_control_deficiency_reported Bool)
(declare-const internal_control_design_and_execution Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_management Bool)
(declare-const internal_control_organization_defined Bool)
(declare-const internal_control_reporting_defined Bool)
(declare-const internal_control_self_assessed Bool)
(declare-const internal_control_system_defined Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_written Bool)
(declare-const investment_decision_based_on_analysis Bool)
(declare-const investment_decision_has_reasonable_basis Bool)
(declare-const investment_decision_recorded Bool)
(declare-const investment_diversification_ratio Real)
(declare-const law_violation_severe Bool)
(declare-const major_fraud_occurred Bool)
(declare-const manager_appointment_and_dismissal_defined Bool)
(declare-const manager_authority_defined Bool)
(declare-const manager_salary_policy_defined Bool)
(declare-const monthly_review_done Bool)
(declare-const not_violated_article_19_1 Bool)
(declare-const not_violated_article_59 Bool)
(declare-const not_violated_law_or_contract Bool)
(declare-const order_executed_through_exchange Bool)
(declare-const other_harmful_behavior Bool)
(declare-const other_related_data_protected Bool)
(declare-const penalty Bool)
(declare-const personal_data_protected Bool)
(declare-const profit_loss_sharing_agreement Bool)
(declare-const prohibited_behavior_1 Bool)
(declare-const prohibited_behavior_2 Bool)
(declare-const prohibited_behavior_3 Bool)
(declare-const prohibited_behavior_4 Bool)
(declare-const prohibited_behavior_5 Bool)
(declare-const prohibited_behavior_6 Bool)
(declare-const prohibited_behavior_7 Bool)
(declare-const prohibited_behavior_8 Bool)
(declare-const prohibited_behavior_9 Bool)
(declare-const prohibited_behavior_all Bool)
(declare-const prohibited_behavior_responsibility Bool)
(declare-const qualified_internal_audit_staff_assigned Bool)
(declare-const regulator_min_diversification_ratio Real)
(declare-const regulator_permits_performance_fee Bool)
(declare-const regulator_permits_subdelegation Bool)
(declare-const regulator_special_review_needed Bool)
(declare-const self_or_other_client_opposite_order Bool)
(declare-const subdelegated_or_transferred Bool)
(declare-const suspected_fraud Bool)
(declare-const transaction_data_protected Bool)
(declare-const used_client_account_for_self_or_others Bool)
(declare-const used_duty_info_for_self_or_others Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:business_duty_faith] 證券投資信託及顧問事業等應以善良管理人注意義務及忠實義務誠實信用原則執行業務
(assert (= business_duty_faith (and duty_of_care duty_of_loyalty duty_of_good_faith)))

; [securities:confidentiality_obligation] 對受益人或客戶資料應保守秘密
(assert (= confidentiality_obligation
   (and personal_data_protected
        transaction_data_protected
        other_related_data_protected)))

; [securities:investment_decision_recorded] 投資決定依據分析作成並有合理基礎，執行時作成紀錄並按月檢討
(assert (= investment_decision_recorded
   (and investment_decision_based_on_analysis
        investment_decision_has_reasonable_basis
        execution_recorded
        monthly_review_done)))

; [securities:internal_control_established_and_executed] 訂定內部控制制度並確實執行，控制作業留存紀錄並保存期限符合規定
(assert (= internal_control_established_and_executed
   (and internal_control_system_defined
        internal_control_system_executed
        control_operation_recorded
        (>= control_record_retention_period control_record_minimum_period))))

; [securities:dispersed_investment] 委託投資資產分散投資符合主管機關規定之分散比率
(assert (= dispersed_investment
   (>= investment_diversification_ratio regulator_min_diversification_ratio)))

; [securities:prohibited_behavior_1] 不得利用職務資訊為自己或非客戶人從事有價證券買賣
(assert (not (= used_duty_info_for_self_or_others prohibited_behavior_1)))

; [securities:prohibited_behavior_2] 不得運用委託資產買賣有價證券損害客戶權益
(assert (not (= damaged_client_interest_in_trading prohibited_behavior_2)))

; [securities:prohibited_behavior_3] 不得與客戶約定收益共享或損失分擔（主管機關另有規定者除外）
(assert (= prohibited_behavior_3
   (or (not profit_loss_sharing_agreement) regulator_permits_performance_fee)))

; [securities:prohibited_behavior_4] 不得與自己資金或其他客戶資產為相對委託交易（經證券交易市場委託成交且非故意者除外）
(assert (= prohibited_behavior_4
   (or (not self_or_other_client_opposite_order)
       (and order_executed_through_exchange (not intentional_opposite_order)))))

; [securities:prohibited_behavior_5] 不得利用客戶帳戶為自己或他人買賣有價證券
(assert (not (= used_client_account_for_self_or_others prohibited_behavior_5)))

; [securities:prohibited_behavior_6] 不得將全權委託投資契約全部或部分複委任或轉讓他人（主管機關另有規定者除外）
(assert (= prohibited_behavior_6
   (or regulator_permits_subdelegation (not subdelegated_or_transferred))))

; [securities:prohibited_behavior_7] 不得無正當理由將已成交買賣委託改變帳戶（全權委託帳戶與自己、他人或其他帳戶間）
(assert (not (= changed_account_without_justification prohibited_behavior_7)))

; [securities:prohibited_behavior_8] 投資決策應依投資分析報告，報告缺乏合理基礎者除能合理解釋外不得違反
(assert (= prohibited_behavior_8
   (or can_provide_reasonable_explanation investment_decision_based_on_analysis)))

; [securities:prohibited_behavior_9] 不得有其他影響事業經營或客戶權益之行為
(assert (not (= other_harmful_behavior prohibited_behavior_9)))

; [securities:prohibited_behavior_all] 所有禁止行為均符合規定
(assert (= prohibited_behavior_all
   (and prohibited_behavior_1
        prohibited_behavior_2
        prohibited_behavior_3
        prohibited_behavior_4
        prohibited_behavior_5
        prohibited_behavior_6
        prohibited_behavior_7
        prohibited_behavior_8
        prohibited_behavior_9)))

; [securities:prohibited_behavior_responsibility] 負責人及業務人員不得為第19條第1項、第59條或法令契約禁止行為
(assert (= prohibited_behavior_responsibility
   (and not_violated_article_19_1
        not_violated_article_59
        not_violated_law_or_contract)))

; [securities:internal_control_established] 依第93條規定建立內部控制制度，訂定或變更應報董事會同意並留存備查
(assert (= internal_control_established
   (and internal_control_system_established
        board_approval_for_control_system
        control_system_recorded)))

; [securities:internal_control_management] 業務經營應依內部控制制度及法令章程執行
(assert (= internal_control_management
   (and business_operated_according_to_law
        business_operated_according_to_articles
        business_operated_according_to_internal_control)))

; [securities:internal_control_design_and_execution] 內部控制制度設計明確組織結構、呈報體系、權限責任，並確實執行及持續檢討
(assert (= internal_control_design_and_execution
   (and internal_control_organization_defined
        internal_control_reporting_defined
        internal_control_authority_responsibility_defined
        manager_appointment_and_dismissal_defined
        manager_authority_defined
        manager_salary_policy_defined
        internal_control_executed
        internal_control_continuously_reviewed)))

; [securities:internal_control_deficiency_conditions] 內部控制缺失或異常事項未依規定改善或評估，或有重大舞弊等情事
(assert (= internal_control_deficiency_conditions
   (or (not qualified_internal_audit_staff_assigned)
       (not internal_control_self_assessed)
       (not internal_control_written)
       (and (not internal_control_deficiency_improved)
            deficiency_severity_major)
       (not annual_audit_plan_reported_on_time)
       (not annual_audit_plan_executed)
       law_violation_severe
       suspected_fraud
       external_financial_report_false
       (not internal_control_deficiency_reported)
       major_fraud_occurred
       regulator_special_review_needed)))

; [securities:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities:penalty_conditions] 處罰條件：違反誠信義務、保密義務、投資決策紀錄、內部控制、分散投資、禁止行為、內部控制缺失等規定時處罰
(assert (= penalty
   (or (not confidentiality_obligation)
       (not internal_control_established_and_executed)
       (not internal_control_established)
       (not internal_control_design_and_execution)
       (not dispersed_investment)
       (not investment_decision_recorded)
       internal_control_deficiency_conditions
       (not business_duty_faith)
       (not prohibited_behavior_all)
       (not prohibited_behavior_responsibility)
       (not internal_control_management))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= duty_of_care false))
(assert (= duty_of_loyalty false))
(assert (= duty_of_good_faith false))
(assert (= business_duty_faith false))
(assert (= confidentiality_obligation true))
(assert (= personal_data_protected true))
(assert (= transaction_data_protected true))
(assert (= other_related_data_protected true))
(assert (= investment_decision_based_on_analysis false))
(assert (= investment_decision_has_reasonable_basis false))
(assert (= investment_decision_recorded false))
(assert (= execution_recorded false))
(assert (= monthly_review_done false))
(assert (= internal_control_system_defined true))
(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_established_and_executed false))
(assert (= internal_control_executed false))
(assert (= control_operation_recorded false))
(assert (= control_record_retention_period 0))
(assert (= control_record_minimum_period 7))
(assert (= board_approval_for_control_system true))
(assert (= internal_control_management false))
(assert (= internal_control_design_and_execution false))
(assert (= internal_control_organization_defined true))
(assert (= internal_control_reporting_defined true))
(assert (= internal_control_authority_responsibility_defined true))
(assert (= manager_appointment_and_dismissal_defined true))
(assert (= manager_authority_defined true))
(assert (= manager_salary_policy_defined true))
(assert (= internal_control_continuously_reviewed false))
(assert (= annual_audit_plan_reported_on_time false))
(assert (= annual_audit_plan_executed false))
(assert (= internal_control_written true))
(assert (= qualified_internal_audit_staff_assigned false))
(assert (= internal_control_deficiency_reported false))
(assert (= internal_control_self_assessed false))
(assert (= internal_control_deficiency_improved false))
(assert (= deficiency_severity_major true))
(assert (= external_financial_report_false false))
(assert (= law_violation_severe true))
(assert (= major_fraud_occurred false))
(assert (= suspected_fraud false))
(assert (= regulator_special_review_needed true))
(assert (= dispersed_investment true))
(assert (= investment_diversification_ratio 100.0))
(assert (= regulator_min_diversification_ratio 50.0))
(assert (= used_duty_info_for_self_or_others false))
(assert (= prohibited_behavior_1 true))
(assert (= damaged_client_interest_in_trading true))
(assert (= prohibited_behavior_2 false))
(assert (= profit_loss_sharing_agreement false))
(assert (= regulator_permits_performance_fee false))
(assert (= prohibited_behavior_3 true))
(assert (= self_or_other_client_opposite_order false))
(assert (= order_executed_through_exchange true))
(assert (= intentional_opposite_order false))
(assert (= prohibited_behavior_4 true))
(assert (= used_client_account_for_self_or_others false))
(assert (= prohibited_behavior_5 true))
(assert (= subdelegated_or_transferred false))
(assert (= regulator_permits_subdelegation false))
(assert (= prohibited_behavior_6 true))
(assert (= changed_account_without_justification false))
(assert (= prohibited_behavior_7 true))
(assert (= can_provide_reasonable_explanation false))
(assert (= prohibited_behavior_8 false))
(assert (= other_harmful_behavior true))
(assert (= prohibited_behavior_9 false))
(assert (= prohibited_behavior_all false))
(assert (= not_violated_article_19_1 false))
(assert (= not_violated_article_59 false))
(assert (= not_violated_law_or_contract false))
(assert (= prohibited_behavior_responsibility false))
(assert (= business_operated_according_to_law false))
(assert (= business_operated_according_to_articles false))
(assert (= business_operated_according_to_internal_control false))
(assert (= penalty true))
(assert (= control_system_recorded false))
(assert (= internal_control_deficiency_conditions false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 81
; Total facts: 81
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
