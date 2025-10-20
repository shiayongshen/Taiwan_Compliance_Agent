; SMT2 file generated from compliance case automatic
; Case ID: case_105
; Generated at: 2025-10-19T08:08:57.371554
;
; This file can be executed with Z3:
;   z3 case_105.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const analysis_and_decision_reasonable Bool)
(declare-const annual_audit_plan_executed_on_time Bool)
(declare-const annual_audit_plan_reported_on_time Bool)
(declare-const audit_findings_and_corrections_reported_on_time Bool)
(declare-const business_duty_of_care_and_loyalty Bool)
(declare-const business_operated_according_to_articles Bool)
(declare-const business_operated_according_to_internal_control Bool)
(declare-const business_operated_according_to_law Bool)
(declare-const comply_with_law Bool)
(declare-const comply_with_orders_and_contracts Bool)
(declare-const confidentiality_obligation Bool)
(declare-const control_operations_recorded Bool)
(declare-const control_records_retained_for_required_period Bool)
(declare-const decision_based_on_analysis Bool)
(declare-const dispersed_investment_required Bool)
(declare-const execution_recorded Bool)
(declare-const external_financial_reporting_accurate Bool)
(declare-const internal_control_authority_and_responsibility_defined Bool)
(declare-const internal_control_change_approved_by_board Bool)
(declare-const internal_control_change_completed_within_deadline Bool)
(declare-const internal_control_change_filed Bool)
(declare-const internal_control_deficiencies_corrected Bool)
(declare-const internal_control_executed_and_reviewed Bool)
(declare-const internal_control_organization_defined Bool)
(declare-const internal_control_reporting_system_defined Bool)
(declare-const internal_control_self_assessment_done Bool)
(declare-const internal_control_statement_made Bool)
(declare-const internal_control_system_change_approved_and_filed Bool)
(declare-const internal_control_system_deficiencies_and_violations Bool)
(declare-const internal_control_system_documented Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_established_and_executed Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_system_operated_according_to_law_and_articles Bool)
(declare-const internal_control_system_requirements Bool)
(declare-const investment_decision_based_on_analysis_report Bool)
(declare-const investment_decision_record_and_review Bool)
(declare-const investment_dispersed Bool)
(declare-const investment_diversification_ratio Real)
(declare-const keep_confidential Bool)
(declare-const manager_appointment_and_removal_defined Bool)
(declare-const manager_authority_defined Bool)
(declare-const manager_compensation_policy_defined Bool)
(declare-const monthly_review_submitted Bool)
(declare-const no_intentional_opposite_trade_result Bool)
(declare-const no_major_fraud_or_suspected_fraud Bool)
(declare-const no_other_law_or_authority_rule Bool)
(declare-const no_other_necessary_special_audit Bool)
(declare-const other_behaviors_affecting_business_or_client_rights Bool)
(declare-const penalty Bool)
(declare-const perform_with_good_faith Bool)
(declare-const performance_fee_regulated_exception Bool)
(declare-const profit_loss_sharing_agreement_with_client Bool)
(declare-const prohibited_acts_article_19_1 Bool)
(declare-const prohibited_acts_article_59 Bool)
(declare-const prohibited_acts_law_or_contract Bool)
(declare-const prohibited_behaviors_in_fiduciary_investment Bool)
(declare-const prohibited_behaviors_not_performed Bool)
(declare-const prohibited_business_acts_not_performed Bool)
(declare-const qualified_internal_audit_staff_assigned Bool)
(declare-const reasonable_explanation_provided Bool)
(declare-const regulator_requests_change Bool)
(declare-const regulatory_exception_for_subdelegation Bool)
(declare-const required_diversification_ratio Real)
(declare-const self_or_other_client_opposite_trades Bool)
(declare-const subdelegation_or_transfer_of_fiduciary_contract Bool)
(declare-const trades_via_central_market_or_broker Bool)
(declare-const transactions_damaging_client_interests Bool)
(declare-const unjustified_account_transfer_of_completed_trades Bool)
(declare-const use_client_account_for_self_or_others Bool)
(declare-const use_of_insider_info_for_self_or_others Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:business_duty_of_care_and_loyalty] 證券投資信託及顧問事業等應以善良管理人注意義務及忠實義務執行業務
(assert (= business_duty_of_care_and_loyalty
   (and comply_with_law
        comply_with_orders_and_contracts
        perform_with_good_faith)))

; [securities:confidentiality_obligation] 對受益人或客戶資料應保守秘密
(assert (= confidentiality_obligation
   (or (not no_other_law_or_authority_rule) keep_confidential)))

; [securities:investment_decision_record_and_review] 投資決定應有合理基礎並作成紀錄及按月檢討
(assert (= investment_decision_record_and_review
   (and decision_based_on_analysis
        execution_recorded
        monthly_review_submitted
        analysis_and_decision_reasonable)))

; [securities:internal_control_system_established_and_executed] 內部控制制度訂定並確實執行，控制作業留存紀錄並保存期限
(assert (= internal_control_system_established_and_executed
   (and internal_control_system_documented
        internal_control_system_executed
        control_operations_recorded
        control_records_retained_for_required_period)))

; [securities:dispersed_investment_required] 委託投資資產應分散投資，符合主管機關定之分散比率
(assert (= dispersed_investment_required
   (and investment_dispersed
        (>= investment_diversification_ratio required_diversification_ratio))))

; [securities:prohibited_behaviors_in_fiduciary_investment] 全權委託投資業務禁止特定行為
(assert (= prohibited_behaviors_in_fiduciary_investment
   (and (not use_of_insider_info_for_self_or_others)
        (not transactions_damaging_client_interests)
        (or performance_fee_regulated_exception
            (not profit_loss_sharing_agreement_with_client))
        (or (not self_or_other_client_opposite_trades)
            (and trades_via_central_market_or_broker
                 no_intentional_opposite_trade_result))
        (not use_client_account_for_self_or_others)
        (or regulatory_exception_for_subdelegation
            (not subdelegation_or_transfer_of_fiduciary_contract))
        (or reasonable_explanation_provided
            (not unjustified_account_transfer_of_completed_trades))
        (or investment_decision_based_on_analysis_report
            reasonable_explanation_provided)
        (not other_behaviors_affecting_business_or_client_rights))))

; [securities:prohibited_behaviors_not_performed] 未違反全權委託投資業務禁止行為
(assert (= prohibited_behaviors_not_performed
   prohibited_behaviors_in_fiduciary_investment))

; [securities:prohibited_business_acts_not_performed] 負責人及業務人員不得為第十九條第一項、第五十九條或法令契約禁止行為
(assert (= prohibited_business_acts_not_performed
   (and (not prohibited_acts_article_19_1)
        (not prohibited_acts_article_59)
        (not prohibited_acts_law_or_contract))))

; [securities:internal_control_system_established] 依第九十三條規定建立內部控制制度
(assert (= internal_control_system_established internal_control_system_documented))

; [securities:internal_control_system_operated_according_to_law_and_articles] 業務經營依內部控制制度及法令章程執行
(assert (= internal_control_system_operated_according_to_law_and_articles
   (and business_operated_according_to_law
        business_operated_according_to_articles
        business_operated_according_to_internal_control)))

; [securities:internal_control_system_change_approved_and_filed] 內部控制制度訂定或變更經董事會同意並留存備查，變更應於限期內完成
(assert (= internal_control_system_change_approved_and_filed
   (and internal_control_change_approved_by_board
        internal_control_change_filed
        (or (not regulator_requests_change)
            internal_control_change_completed_within_deadline))))

; [securities:internal_control_system_requirements] 內部控制制度應訂定明確組織結構、呈報體系、權限責任及經理人設置等事項，並確實執行及檢討
(assert (= internal_control_system_requirements
   (and internal_control_organization_defined
        internal_control_reporting_system_defined
        internal_control_authority_and_responsibility_defined
        manager_appointment_and_removal_defined
        manager_authority_defined
        manager_compensation_policy_defined
        internal_control_executed_and_reviewed)))

; [securities:internal_control_system_deficiencies_and_violations] 未訂書面內部控制制度、未配置適任人員、未執行稽核計畫等缺失
(assert (= internal_control_system_deficiencies_and_violations
   (or (not no_major_fraud_or_suspected_fraud)
       (not annual_audit_plan_reported_on_time)
       (not external_financial_reporting_accurate)
       (not no_other_necessary_special_audit)
       (not qualified_internal_audit_staff_assigned)
       (not internal_control_self_assessment_done)
       (not internal_control_statement_made)
       (not internal_control_system_documented)
       (not annual_audit_plan_executed_on_time)
       (not internal_control_deficiencies_corrected)
       (not audit_findings_and_corrections_reported_on_time))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反善良管理人義務、保密義務、投資決策紀錄與檢討、內部控制制度、分散投資規定、禁止行為、負責人禁止行為或內部控制缺失時處罰
(assert (= penalty
   (or (not dispersed_investment_required)
       (not business_duty_of_care_and_loyalty)
       (not investment_decision_record_and_review)
       (not confidentiality_obligation)
       (not prohibited_behaviors_not_performed)
       internal_control_system_deficiencies_and_violations
       (not internal_control_system_established_and_executed)
       (not prohibited_business_acts_not_performed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= comply_with_law false))
(assert (= comply_with_orders_and_contracts false))
(assert (= perform_with_good_faith false))
(assert (= business_duty_of_care_and_loyalty false))
(assert (= decision_based_on_analysis false))
(assert (= execution_recorded false))
(assert (= monthly_review_submitted false))
(assert (= analysis_and_decision_reasonable false))
(assert (= internal_control_system_documented false))
(assert (= internal_control_system_executed false))
(assert (= control_operations_recorded false))
(assert (= control_records_retained_for_required_period false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_established_and_executed false))
(assert (= internal_control_system_operated_according_to_law_and_articles false))
(assert (= business_operated_according_to_law false))
(assert (= business_operated_according_to_articles false))
(assert (= business_operated_according_to_internal_control false))
(assert (= internal_control_organization_defined false))
(assert (= internal_control_reporting_system_defined false))
(assert (= internal_control_authority_and_responsibility_defined false))
(assert (= manager_appointment_and_removal_defined false))
(assert (= manager_authority_defined false))
(assert (= manager_compensation_policy_defined false))
(assert (= internal_control_executed_and_reviewed false))
(assert (= internal_control_change_approved_by_board false))
(assert (= internal_control_change_filed false))
(assert (= regulator_requests_change true))
(assert (= internal_control_change_completed_within_deadline false))
(assert (= internal_control_system_change_approved_and_filed false))
(assert (= internal_control_system_deficiencies_and_violations true))
(assert (= qualified_internal_audit_staff_assigned false))
(assert (= annual_audit_plan_reported_on_time false))
(assert (= annual_audit_plan_executed_on_time false))
(assert (= audit_findings_and_corrections_reported_on_time false))
(assert (= internal_control_self_assessment_done false))
(assert (= internal_control_statement_made false))
(assert (= internal_control_deficiencies_corrected false))
(assert (= external_financial_reporting_accurate false))
(assert (= no_major_fraud_or_suspected_fraud false))
(assert (= no_other_necessary_special_audit false))
(assert (= confidentiality_obligation true))
(assert (= no_other_law_or_authority_rule true))
(assert (= keep_confidential true))
(assert (= dispersed_investment_required true))
(assert (= investment_dispersed true))
(assert (= investment_diversification_ratio 100.0))
(assert (= required_diversification_ratio 80.0))
(assert (= prohibited_behaviors_in_fiduciary_investment false))
(assert (= prohibited_behaviors_not_performed false))
(assert (= use_of_insider_info_for_self_or_others false))
(assert (= transactions_damaging_client_interests true))
(assert (= profit_loss_sharing_agreement_with_client false))
(assert (= performance_fee_regulated_exception false))
(assert (= self_or_other_client_opposite_trades false))
(assert (= trades_via_central_market_or_broker true))
(assert (= no_intentional_opposite_trade_result true))
(assert (= use_client_account_for_self_or_others false))
(assert (= subdelegation_or_transfer_of_fiduciary_contract false))
(assert (= regulatory_exception_for_subdelegation false))
(assert (= unjustified_account_transfer_of_completed_trades false))
(assert (= reasonable_explanation_provided false))
(assert (= investment_decision_based_on_analysis_report false))
(assert (= other_behaviors_affecting_business_or_client_rights false))
(assert (= prohibited_business_acts_not_performed false))
(assert (= prohibited_acts_article_19_1 true))
(assert (= prohibited_acts_article_59 true))
(assert (= prohibited_acts_law_or_contract true))
(assert (= penalty true))
(assert (= internal_control_system_requirements false))
(assert (= investment_decision_record_and_review false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 71
; Total facts: 71
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
