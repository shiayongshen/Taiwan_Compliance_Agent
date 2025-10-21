; SMT2 file generated from compliance case automatic
; Case ID: case_434
; Generated at: 2025-10-21T09:49:04.728372
;
; This file can be executed with Z3:
;   z3 case_434.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authority_and_responsibility_defined Bool)
(declare-const changed_trade_account_improperly Bool)
(declare-const conflict_of_interest_avoided Bool)
(declare-const conflict_of_interest_occurred Bool)
(declare-const control_operation_recorded Bool)
(declare-const control_record_retention_period_years Int)
(declare-const damaged_beneficiary_or_client Bool)
(declare-const document_storage_compliant Bool)
(declare-const execution_recorded Bool)
(declare-const fraudulent_behavior Bool)
(declare-const fund_operation_record_retention_period Int)
(declare-const fund_operation_record_retention_years Int)
(declare-const improper_public_recommendation Bool)
(declare-const improvement_not_made_by_deadline Bool)
(declare-const internal_audit_concealed_findings Bool)
(declare-const internal_audit_disciplinary_recommendation Bool)
(declare-const internal_audit_found_major_issue Bool)
(declare-const internal_audit_not_implemented Bool)
(declare-const internal_audit_prevented_major_loss Bool)
(declare-const internal_audit_recommend_discipline Bool)
(declare-const internal_audit_report_discloses_responsible_personnel Bool)
(declare-const internal_audit_reward_for_loss_prevention Bool)
(declare-const internal_audit_rewarded Bool)
(declare-const internal_control_defined Bool)
(declare-const internal_control_defined_and_executed Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_execution_and_review Bool)
(declare-const internal_control_inadequate Bool)
(declare-const internal_control_organization_and_responsibility_defined Bool)
(declare-const internal_control_organization_defined Bool)
(declare-const internal_control_reviewed_regularly Bool)
(declare-const internal_control_subsidiary_definition Bool)
(declare-const internal_management_poor Bool)
(declare-const investment_decision_based_on_analysis Bool)
(declare-const investment_decision_recorded Bool)
(declare-const law_compliance_not_implemented Bool)
(declare-const leaked_confidential_info Bool)
(declare-const manager_appointment_and_dismissal_defined Bool)
(declare-const manager_authority_defined Bool)
(declare-const manipulated_security_prices Bool)
(declare-const monthly_review_done Bool)
(declare-const monthly_review_submitted Bool)
(declare-const not_return_commission_to_fund Bool)
(declare-const other_harmful_behaviors Bool)
(declare-const penalty Bool)
(declare-const penalty_for_personnel_misconduct Bool)
(declare-const penalty_violation_fines Bool)
(declare-const penalty_violation_fines_extended Bool)
(declare-const personnel_behavior_affects_business Bool)
(declare-const personnel_behavior_compliant Bool)
(declare-const personnel_confidentiality_obligation Bool)
(declare-const personnel_duty_of_care_and_loyalty Bool)
(declare-const personnel_keep_client_info_confidential Bool)
(declare-const personnel_misconduct Bool)
(declare-const personnel_perform_duties_faithfully Bool)
(declare-const personnel_procedures_followed Bool)
(declare-const personnel_prohibited_behaviors Bool)
(declare-const personnel_qualification_compliant Bool)
(declare-const personnel_qualification_met Bool)
(declare-const personnel_registration_valid Bool)
(declare-const personnel_training_completed Bool)
(declare-const personnel_violated_law Bool)
(declare-const provided_specific_benefits_to_promote Bool)
(declare-const received_money_for_proxy_vote Bool)
(declare-const record_preparation_compliant Bool)
(declare-const refusal_to_accept_designated_successor_prohibited Bool)
(declare-const refused_designated_successor_without_reason Bool)
(declare-const regulator_defined_min_years Int)
(declare-const regulator_inspection_followup_deficient Bool)
(declare-const reporting_and_recording_compliance Bool)
(declare-const reporting_system_defined Bool)
(declare-const reporting_to_regulator_compliant Bool)
(declare-const reports_submitted_on_time Bool)
(declare-const responsible_personnel_duty_breach Bool)
(declare-const salary_and_compensation_policy_defined Bool)
(declare-const self_or_others_benefit_trading Bool)
(declare-const serious_internal_management_failures_responsibility Bool)
(declare-const subsidiary_defined_by_financial_reporting Bool)
(declare-const timely_financial_and_business_reports_submitted Bool)
(declare-const unauthorized_agent_trading Bool)
(declare-const unreasonable_commission_to_nonprofessionals Bool)
(declare-const violation_article_16_1_19_1_51_1_59 Bool)
(declare-const violation_article_3_4_or_4_4 Bool)
(declare-const violation_article_63_1 Bool)
(declare-const violation_of_law Bool)
(declare-const violation_of_regulator_orders Bool)
(declare-const violation_penalty_conditions Bool)
(declare-const violation_regulator_rules_14_1_18_1_56_1 Bool)
(declare-const violation_regulator_rules_16_4 Bool)
(declare-const violation_regulator_rules_58_2 Bool)
(declare-const violation_regulator_rules_69 Bool)
(declare-const violation_regulator_rules_70 Bool)
(declare-const violation_regulator_rules_72_1 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:investment_decision_recorded] 投資決定依據分析作成且交付執行時有紀錄
(assert (= investment_decision_recorded
   (and investment_decision_based_on_analysis execution_recorded)))

; [securities:monthly_review_submitted] 按月提出檢討
(assert (= monthly_review_submitted monthly_review_done))

; [securities:internal_control_defined_and_executed] 內部控制制度訂定且確實執行，控制作業留存紀錄並保存期限符合規定
(assert (= internal_control_defined_and_executed
   (and internal_control_defined
        internal_control_executed
        control_operation_recorded
        (>= control_record_retention_period_years regulator_defined_min_years))))

; [securities:personnel_qualification_compliant] 人員資格條件、行為規範、訓練、登記期限及程序符合主管機關規定
(assert (= personnel_qualification_compliant
   (and personnel_qualification_met
        personnel_behavior_compliant
        personnel_training_completed
        personnel_registration_valid
        personnel_procedures_followed)))

; [securities:violation_penalty_conditions] 違反本法或主管機關命令者處分條件
(assert (= violation_penalty_conditions
   (or violation_of_law violation_of_regulator_orders)))

; [securities:personnel_misconduct] 董事、監察人、經理人或受僱人有違反法令且影響業務正常執行之行為
(assert (= personnel_misconduct
   (and personnel_violated_law personnel_behavior_affects_business)))

; [securities:penalty_for_personnel_misconduct] 主管機關得命令停止執行業務或解除職務，並視情節輕重處分
(assert (= penalty_for_personnel_misconduct personnel_misconduct))

; [securities:penalty_violation_fines] 違反特定條文規定處罰罰鍰並責令限期改善，屆期不改善加重處罰
(assert (= penalty_violation_fines
   (or violation_regulator_rules_69
       violation_regulator_rules_14_1_18_1_56_1
       violation_article_16_1_19_1_51_1_59
       violation_article_3_4_or_4_4
       violation_regulator_rules_72_1
       violation_regulator_rules_58_2
       violation_regulator_rules_16_4
       violation_article_63_1
       violation_regulator_rules_70)))

; [securities:penalty_violation_fines_extended] 違反罰鍰規定屆期不改善者，按次加重處罰
(assert (= penalty_violation_fines_extended
   (and penalty_violation_fines improvement_not_made_by_deadline)))

; [securities:reporting_and_recording_compliance] 依規定申報、製作、備置、保存帳簿及相關文件
(assert (= reporting_and_recording_compliance
   (and reporting_to_regulator_compliant
        record_preparation_compliant
        document_storage_compliant)))

; [securities:conflict_of_interest_avoided] 避免利益衝突及損害受益人或客戶權益
(assert (= conflict_of_interest_avoided
   (and (not conflict_of_interest_occurred) (not damaged_beneficiary_or_client))))

; [securities:refusal_to_accept_designated_successor_prohibited] 無正當理由拒絕主管機關指定承受者違規
(assert (not (= refused_designated_successor_without_reason
        refusal_to_accept_designated_successor_prohibited)))

; [securities:timely_financial_and_business_reports_submitted] 依限提出財務、業務報告及相關資料
(assert (= timely_financial_and_business_reports_submitted reports_submitted_on_time))

; [securities:personnel_duty_of_care_and_loyalty] 負責人及業務人員以善良管理人注意義務及忠實義務執行業務
(assert (= personnel_duty_of_care_and_loyalty personnel_perform_duties_faithfully))

; [securities:personnel_prohibited_behaviors] 人員不得有洩漏消息、利益衝突、詐欺、損害基金投資人權益等違法行為
(assert (not (= (or received_money_for_proxy_vote
            improper_public_recommendation
            other_harmful_behaviors
            changed_trade_account_improperly
            manipulated_security_prices
            not_return_commission_to_fund
            self_or_others_benefit_trading
            unreasonable_commission_to_nonprofessionals
            unauthorized_agent_trading
            fraudulent_behavior
            leaked_confidential_info
            provided_specific_benefits_to_promote)
        personnel_prohibited_behaviors)))

; [securities:personnel_confidentiality_obligation] 人員對受益人或客戶資料應保守秘密
(assert (= personnel_confidentiality_obligation personnel_keep_client_info_confidential))

; [securities:fund_operation_record_retention_period] 基金運用相關紀錄保存期限不得少於五年
(assert (= fund_operation_record_retention_period
   (ite (<= 5.0 (to_real fund_operation_record_retention_years)) 1 0)))

; [securities:internal_control_organization_and_responsibility_defined] 內部控制制度訂定明確組織結構、呈報體系及權限責任
(assert (= internal_control_organization_and_responsibility_defined
   (and internal_control_organization_defined
        reporting_system_defined
        authority_and_responsibility_defined
        manager_appointment_and_dismissal_defined
        manager_authority_defined
        salary_and_compensation_policy_defined)))

; [securities:internal_control_execution_and_review] 內部控制制度確實執行並隨時檢討以確保持續有效
(assert (= internal_control_execution_and_review
   (and internal_control_executed internal_control_reviewed_regularly)))

; [securities:internal_control_subsidiary_definition] 子公司依財務報告編製規範認定
(assert (= internal_control_subsidiary_definition
   subsidiary_defined_by_financial_reporting))

; [securities:serious_internal_management_failures_responsibility] 內部管理不善或重大弊端時相關人員負失職責任
(assert (= serious_internal_management_failures_responsibility
   (or (not (or law_compliance_not_implemented
                internal_audit_concealed_findings
                regulator_inspection_followup_deficient
                internal_management_poor
                internal_control_inadequate
                internal_audit_not_implemented))
       responsible_personnel_duty_breach)))

; [securities:internal_audit_reward_for_loss_prevention] 內部稽核人員發現重大弊端並使事業免於重大損失者應予獎勵
(assert (= internal_audit_reward_for_loss_prevention
   (or internal_audit_rewarded
       (not (and internal_audit_found_major_issue
                 internal_audit_prevented_major_loss)))))

; [securities:internal_audit_disciplinary_recommendation] 內部稽核單位對重大缺失有懲處建議權並於報告中揭露失職人員
(assert (= internal_audit_disciplinary_recommendation
   (and internal_audit_recommend_discipline
        internal_audit_report_discloses_responsible_personnel)))

; [meta:penalty_default_false] 預設不處罰
(assert (or violation_penalty_conditions
    (not internal_control_execution_and_review)
    (and penalty_violation_fines improvement_not_made_by_deadline)
    (not reporting_and_recording_compliance)
    (not (<= 5.0 (to_real fund_operation_record_retention_years)))
    (not personnel_duty_of_care_and_loyalty)
    (not timely_financial_and_business_reports_submitted)
    (not conflict_of_interest_avoided)
    personnel_misconduct
    (not personnel_prohibited_behaviors)
    refused_designated_successor_without_reason
    (not personnel_confidentiality_obligation)
    (not internal_control_defined_and_executed)
    (not internal_control_organization_and_responsibility_defined)
    (not internal_audit_reward_for_loss_prevention)
    (not investment_decision_recorded)
    (not internal_audit_disciplinary_recommendation)
    (not penalty)
    (not monthly_review_submitted)
    penalty_violation_fines
    (not internal_control_subsidiary_definition)
    (not personnel_qualification_compliant)
    responsible_personnel_duty_breach))

; [meta:penalty_conditions] 處罰條件：違反投資決定紀錄、內部控制、資格規定、法令或命令等任一規定時處罰
(assert (let ((a!1 (or (not investment_decision_recorded)
               violation_penalty_conditions
               (not monthly_review_submitted)
               (not personnel_qualification_compliant)
               (and penalty_violation_fines improvement_not_made_by_deadline)
               (not conflict_of_interest_avoided)
               (not timely_financial_and_business_reports_submitted)
               (not personnel_duty_of_care_and_loyalty)
               (not personnel_prohibited_behaviors)
               personnel_misconduct
               (not personnel_confidentiality_obligation)
               refused_designated_successor_without_reason
               (not (<= 5.0 (to_real fund_operation_record_retention_years)))
               (not reporting_and_recording_compliance)
               (not internal_control_organization_and_responsibility_defined)
               (not internal_control_execution_and_review)
               (not internal_control_subsidiary_definition)
               (not internal_audit_reward_for_loss_prevention)
               (not internal_audit_disciplinary_recommendation)
               penalty_violation_fines
               (not internal_control_defined_and_executed)
               responsible_personnel_duty_breach)))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= investment_decision_based_on_analysis false))
(assert (= execution_recorded false))
(assert (= monthly_review_done false))
(assert (= internal_control_defined false))
(assert (= internal_control_executed false))
(assert (= control_operation_recorded false))
(assert (= control_record_retention_period_years 3))
(assert (= regulator_defined_min_years 5))
(assert (= personnel_qualification_met true))
(assert (= personnel_behavior_compliant false))
(assert (= personnel_training_completed true))
(assert (= personnel_registration_valid true))
(assert (= personnel_procedures_followed true))
(assert (= violation_of_law true))
(assert (= violation_of_regulator_orders true))
(assert (= personnel_violated_law true))
(assert (= personnel_behavior_affects_business true))
(assert (= personnel_misconduct true))
(assert (= penalty_violation_fines true))
(assert (= improvement_not_made_by_deadline false))
(assert (= reporting_to_regulator_compliant false))
(assert (= record_preparation_compliant false))
(assert (= document_storage_compliant false))
(assert (= conflict_of_interest_occurred true))
(assert (= damaged_beneficiary_or_client true))
(assert (= conflict_of_interest_avoided false))
(assert (= refused_designated_successor_without_reason false))
(assert (= reports_submitted_on_time false))
(assert (= personnel_perform_duties_faithfully false))
(assert (= personnel_duty_of_care_and_loyalty false))
(assert (= leaked_confidential_info false))
(assert (= self_or_others_benefit_trading true))
(assert (= fraudulent_behavior false))
(assert (= not_return_commission_to_fund false))
(assert (= provided_specific_benefits_to_promote false))
(assert (= received_money_for_proxy_vote false))
(assert (= manipulated_security_prices false))
(assert (= changed_trade_account_improperly false))
(assert (= improper_public_recommendation false))
(assert (= unreasonable_commission_to_nonprofessionals false))
(assert (= unauthorized_agent_trading false))
(assert (= other_harmful_behaviors false))
(assert (= personnel_prohibited_behaviors true))
(assert (= personnel_keep_client_info_confidential false))
(assert (= personnel_confidentiality_obligation false))
(assert (= fund_operation_record_retention_years 3))
(assert (= fund_operation_record_retention_period 3))
(assert (= internal_control_organization_defined false))
(assert (= reporting_system_defined false))
(assert (= authority_and_responsibility_defined false))
(assert (= manager_appointment_and_dismissal_defined false))
(assert (= manager_authority_defined false))
(assert (= salary_and_compensation_policy_defined false))
(assert (= internal_control_organization_and_responsibility_defined false))
(assert (= internal_control_reviewed_regularly false))
(assert (= internal_control_execution_and_review false))
(assert (= subsidiary_defined_by_financial_reporting false))
(assert (= internal_control_subsidiary_definition false))
(assert (= internal_management_poor true))
(assert (= internal_control_inadequate true))
(assert (= internal_audit_not_implemented true))
(assert (= law_compliance_not_implemented true))
(assert (= regulator_inspection_followup_deficient true))
(assert (= internal_audit_concealed_findings true))
(assert (= responsible_personnel_duty_breach true))
(assert (= serious_internal_management_failures_responsibility true))
(assert (= internal_audit_found_major_issue false))
(assert (= internal_audit_prevented_major_loss false))
(assert (= internal_audit_rewarded false))
(assert (= internal_audit_reward_for_loss_prevention false))
(assert (= internal_audit_recommend_discipline false))
(assert (= internal_audit_disciplinary_recommendation false))
(assert (= penalty_for_personnel_misconduct true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 25
; Total variables: 93
; Total facts: 74
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
