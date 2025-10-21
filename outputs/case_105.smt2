; SMT2 file generated from compliance case automatic
; Case ID: case_105
; Generated at: 2025-10-21T01:44:49.652054
;
; This file can be executed with Z3:
;   z3 case_105.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_audit_plan_executed Bool)
(declare-const annual_audit_plan_reported Bool)
(declare-const business_operated_according_to_articles Bool)
(declare-const business_operated_according_to_internal_control Bool)
(declare-const business_operated_according_to_law Bool)
(declare-const business_operated_according_to_law_and_internal_control Bool)
(declare-const confidentiality_obligation Bool)
(declare-const control_operation_recorded Bool)
(declare-const control_record_retention_period Int)
(declare-const damage_amount Real)
(declare-const damaging_client_interests_trading Bool)
(declare-const data_protection_law_compliance Bool)
(declare-const deficiencies_severity_major Bool)
(declare-const diversified_investment Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_honesty Bool)
(declare-const duty_of_loyalty Bool)
(declare-const external_financial_reporting_true Bool)
(declare-const fraud_or_suspected_fraud_occurred Bool)
(declare-const full_trust_contract_subcontracted_or_transferred Bool)
(declare-const full_trust_investment_decision_compliance Bool)
(declare-const full_trust_investment_diversification_compliance Bool)
(declare-const good_faith_duty Bool)
(declare-const insider_trading_for_self_or_others Bool)
(declare-const intentional_opposite_commission Bool)
(declare-const internal_audit_staff_adequate Bool)
(declare-const internal_control_authority_and_responsibility_defined Bool)
(declare-const internal_control_change_approved_and_filed Bool)
(declare-const internal_control_change_approved_by_board Bool)
(declare-const internal_control_change_completed_within_deadline Bool)
(declare-const internal_control_change_filed Bool)
(declare-const internal_control_deficiencies_improved Bool)
(declare-const internal_control_deficiencies_reported Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_organization_structure_defined Bool)
(declare-const internal_control_reporting_system_defined Bool)
(declare-const internal_control_self_assessed Bool)
(declare-const internal_control_system_continuously_reviewed Bool)
(declare-const internal_control_system_defined Bool)
(declare-const internal_control_system_design_and_execution Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_written Bool)
(declare-const investment_decision_based_on_analysis Bool)
(declare-const investment_decision_has_reasonable_basis Bool)
(declare-const investment_decision_reasonable Bool)
(declare-const investment_decision_recorded Bool)
(declare-const investment_decision_recorded_flag Bool)
(declare-const investment_diversification_ratio Real)
(declare-const liability_for_damage Bool)
(declare-const manager_appointment_and_dismissal_defined Bool)
(declare-const manager_authority_and_salary_policy_defined Bool)
(declare-const monthly_review_report_submitted Bool)
(declare-const monthly_review_submitted Bool)
(declare-const opposite_commission_trading Bool)
(declare-const other_behaviors_affecting_business_or_client_rights Bool)
(declare-const other_regulator_special_audit_needed Bool)
(declare-const penalty Bool)
(declare-const profit_loss_sharing_agreement_with_client Bool)
(declare-const prohibited_behaviors_absent Bool)
(declare-const prohibited_behaviors_law_contract_respected Bool)
(declare-const prohibited_behaviors_respected Bool)
(declare-const reasonable_explanation_provided Bool)
(declare-const regulator_additional_rules_compliance Bool)
(declare-const regulator_defined_minimum_period Int)
(declare-const regulator_defined_minimum_ratio Real)
(declare-const regulator_notified_change Bool)
(declare-const regulator_order_for_special_audit Bool)
(declare-const regulator_performance_fee_exception Bool)
(declare-const regulator_subcontracting_exception Bool)
(declare-const trading_through_exchange_or_broker Bool)
(declare-const unauthorized_account_transfer Bool)
(declare-const using_client_account_for_self_or_others Bool)
(declare-const violation_severity_major Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:good_faith_duty] 證券投資信託事業等應以善良管理人注意義務及忠實義務執行業務
(assert (= good_faith_duty (and duty_of_care duty_of_loyalty duty_of_honesty)))

; [securities:confidentiality_obligation] 應保守受益人或客戶個人資料及交易資料秘密
(assert (= confidentiality_obligation
   (and data_protection_law_compliance regulator_additional_rules_compliance)))

; [securities:liability_for_damage] 違反善良管理人義務或保密義務致損害應負賠償責任
(assert (let ((a!1 (and (not good_faith_duty)
                (or (not confidentiality_obligation)
                    (not (<= damage_amount 0.0))))))
  (= liability_for_damage a!1)))

; [securities:investment_decision_recorded] 投資決定依分析作成並作成紀錄
(assert (= investment_decision_recorded
   (and investment_decision_based_on_analysis investment_decision_recorded_flag)))

; [securities:monthly_review_submitted] 按月提出投資決定檢討
(assert (= monthly_review_submitted monthly_review_report_submitted))

; [securities:investment_decision_reasonable] 投資分析與決定有合理基礎及根據
(assert (= investment_decision_reasonable investment_decision_has_reasonable_basis))

; [securities:internal_control_established_and_executed] 訂定內部控制制度並確實執行，控制作業留存紀錄並保存期限符合規定
(assert (= internal_control_established_and_executed
   (and internal_control_system_defined
        internal_control_system_executed
        control_operation_recorded
        (>= control_record_retention_period regulator_defined_minimum_period))))

; [securities:full_trust_investment_decision_compliance] 全權委託投資決定準用第17條規定
(assert (= full_trust_investment_decision_compliance investment_decision_recorded))

; [securities:full_trust_investment_diversification_compliance] 全權委託投資資產分散投資且符合主管機關分散比率規定
(assert (= full_trust_investment_diversification_compliance
   (and diversified_investment
        (>= investment_diversification_ratio regulator_defined_minimum_ratio))))

; [securities:prohibited_behaviors_absent] 未有第59條禁止之行為
(assert (let ((a!1 (and (not insider_trading_for_self_or_others)
                (not damaging_client_interests_trading)
                (or regulator_performance_fee_exception
                    (not profit_loss_sharing_agreement_with_client))
                (or (not opposite_commission_trading)
                    (and trading_through_exchange_or_broker
                         (not intentional_opposite_commission)))
                (not using_client_account_for_self_or_others)
                (or (not full_trust_contract_subcontracted_or_transferred)
                    regulator_subcontracting_exception)
                (not unauthorized_account_transfer)
                (or investment_decision_based_on_analysis
                    reasonable_explanation_provided)
                (not other_behaviors_affecting_business_or_client_rights))))
  (= prohibited_behaviors_absent a!1)))

; [securities:prohibited_behaviors_respected] 負責人及受僱人不得為第19條第1項、第59條或法令契約禁止行為
(assert (= prohibited_behaviors_respected
   (and prohibited_behaviors_absent prohibited_behaviors_law_contract_respected)))

; [securities:internal_control_system_established] 依第93條規定建立內部控制制度
(assert (= internal_control_system_established internal_control_system_defined))

; [securities:business_operated_according_to_law_and_internal_control] 業務經營依法令、章程及內部控制制度
(assert (= business_operated_according_to_law_and_internal_control
   (and business_operated_according_to_law
        business_operated_according_to_articles
        business_operated_according_to_internal_control)))

; [securities:internal_control_change_approved_and_filed] 內部控制制度訂定或變更經董事會同意並留存備查，變更通知限期內完成
(assert (= internal_control_change_approved_and_filed
   (and internal_control_change_approved_by_board
        internal_control_change_filed
        (or (not regulator_notified_change)
            internal_control_change_completed_within_deadline))))

; [securities:internal_control_system_design_and_execution] 內部控制制度設計明確組織結構、呈報體系及權限責任，並確實執行及持續檢討
(assert (= internal_control_system_design_and_execution
   (and internal_control_organization_structure_defined
        internal_control_reporting_system_defined
        internal_control_authority_and_responsibility_defined
        manager_appointment_and_dismissal_defined
        manager_authority_and_salary_policy_defined
        internal_control_system_executed
        internal_control_system_continuously_reviewed)))

; [securities:regulator_order_for_special_audit] 主管機關得令限期改善並委託會計師專案審查內部控制制度
(assert (= regulator_order_for_special_audit
   (or (not internal_audit_staff_adequate)
       (and (not internal_control_deficiencies_improved)
            deficiencies_severity_major)
       (not internal_control_written)
       fraud_or_suspected_fraud_occurred
       (not annual_audit_plan_executed)
       (and (not external_financial_reporting_true) violation_severity_major)
       (not internal_control_self_assessed)
       (not internal_control_deficiencies_reported)
       (not annual_audit_plan_reported)
       other_regulator_special_audit_needed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反善良管理人義務、保密義務、投資決策紀錄、內部控制制度或第59條禁止行為等規定時處罰
(assert (= penalty
   (or (not internal_control_change_approved_and_filed)
       (not investment_decision_reasonable)
       (not internal_control_system_established)
       (not prohibited_behaviors_absent)
       (not full_trust_investment_diversification_compliance)
       (not internal_control_established_and_executed)
       (not internal_control_system_design_and_execution)
       regulator_order_for_special_audit
       (not confidentiality_obligation)
       (not business_operated_according_to_law_and_internal_control)
       (not monthly_review_submitted)
       (not prohibited_behaviors_respected)
       (not investment_decision_recorded)
       (not good_faith_duty)
       (not full_trust_investment_decision_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= duty_of_care false))
(assert (= duty_of_loyalty false))
(assert (= duty_of_honesty false))
(assert (= good_faith_duty false))
(assert (= confidentiality_obligation true))
(assert (= data_protection_law_compliance true))
(assert (= regulator_additional_rules_compliance true))
(assert (= damage_amount 6294785.0))
(assert (= damaging_client_interests_trading true))
(assert (= investment_decision_based_on_analysis false))
(assert (= investment_decision_recorded_flag false))
(assert (= investment_decision_recorded false))
(assert (= monthly_review_report_submitted false))
(assert (= monthly_review_submitted false))
(assert (= investment_decision_has_reasonable_basis false))
(assert (= investment_decision_reasonable false))
(assert (= internal_control_system_defined false))
(assert (= internal_control_system_executed false))
(assert (= control_operation_recorded false))
(assert (= control_record_retention_period 0))
(assert (= internal_control_established_and_executed false))
(assert (= full_trust_investment_decision_compliance false))
(assert (= diversified_investment false))
(assert (= investment_diversification_ratio 0.0))
(assert (= full_trust_investment_diversification_compliance false))
(assert (= insider_trading_for_self_or_others false))
(assert (= profit_loss_sharing_agreement_with_client false))
(assert (= regulator_performance_fee_exception false))
(assert (= opposite_commission_trading false))
(assert (= trading_through_exchange_or_broker true))
(assert (= intentional_opposite_commission false))
(assert (= using_client_account_for_self_or_others false))
(assert (= full_trust_contract_subcontracted_or_transferred false))
(assert (= regulator_subcontracting_exception false))
(assert (= unauthorized_account_transfer false))
(assert (= reasonable_explanation_provided false))
(assert (= other_behaviors_affecting_business_or_client_rights false))
(assert (= prohibited_behaviors_absent false))
(assert (= prohibited_behaviors_law_contract_respected false))
(assert (= prohibited_behaviors_respected false))
(assert (= internal_control_system_established false))
(assert (= business_operated_according_to_law false))
(assert (= business_operated_according_to_articles false))
(assert (= business_operated_according_to_internal_control false))
(assert (= business_operated_according_to_law_and_internal_control false))
(assert (= internal_control_change_approved_by_board false))
(assert (= internal_control_change_filed false))
(assert (= regulator_notified_change false))
(assert (= internal_control_change_completed_within_deadline false))
(assert (= internal_control_change_approved_and_filed false))
(assert (= internal_control_organization_structure_defined false))
(assert (= internal_control_reporting_system_defined false))
(assert (= internal_control_authority_and_responsibility_defined false))
(assert (= manager_appointment_and_dismissal_defined false))
(assert (= manager_authority_and_salary_policy_defined false))
(assert (= internal_control_system_continuously_reviewed false))
(assert (= internal_control_system_design_and_execution false))
(assert (= internal_control_self_assessed false))
(assert (= internal_control_deficiencies_reported false))
(assert (= internal_control_deficiencies_improved false))
(assert (= internal_audit_staff_adequate false))
(assert (= annual_audit_plan_reported false))
(assert (= annual_audit_plan_executed false))
(assert (= fraud_or_suspected_fraud_occurred false))
(assert (= external_financial_reporting_true true))
(assert (= deficiencies_severity_major true))
(assert (= violation_severity_major true))
(assert (= regulator_order_for_special_audit true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 74
; Total facts: 69
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
