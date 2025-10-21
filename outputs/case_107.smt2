; SMT2 file generated from compliance case automatic
; Case ID: case_107
; Generated at: 2025-10-21T01:50:21.243302
;
; This file can be executed with Z3:
;   z3 case_107.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const analysis_reasonable Bool)
(declare-const annual_audit_plan_executed_on_time Bool)
(declare-const annual_audit_plan_reported_on_time Bool)
(declare-const appropriate_authority_and_responsibility_defined Bool)
(declare-const business_duty_of_care_and_loyalty Bool)
(declare-const compensation_obligation Bool)
(declare-const confidentiality_maintained Bool)
(declare-const confidentiality_obligation Bool)
(declare-const contract_compliance Bool)
(declare-const control_operation_recorded Bool)
(declare-const decision_based_on_analysis Bool)
(declare-const diversified_investment_requirement Bool)
(declare-const execution_recorded Bool)
(declare-const external_financial_reporting_accurate Bool)
(declare-const good_faith_execution Bool)
(declare-const internal_control_deficiencies_improved_per_auditor_recommendations Bool)
(declare-const internal_control_deficiencies_reported_on_time Bool)
(declare-const internal_control_organization_defined Bool)
(declare-const internal_control_self_assessment_done Bool)
(declare-const internal_control_system_approved_by_board Bool)
(declare-const internal_control_system_change_approved_by_board Bool)
(declare-const internal_control_system_change_completed_within_deadline Bool)
(declare-const internal_control_system_change_filed Bool)
(declare-const internal_control_system_change_reported Bool)
(declare-const internal_control_system_continuously_reviewed Bool)
(declare-const internal_control_system_design_and_execution Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_established_and_executed Bool)
(declare-const internal_control_system_establishment_and_operation Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_system_executed_according_to_law_and_articles Bool)
(declare-const internal_control_system_special_audit_conditions Bool)
(declare-const internal_control_written Bool)
(declare-const investment_decision_based_on_analysis Bool)
(declare-const investment_decision_for_fiduciary_assets Bool)
(declare-const investment_decision_record_and_review Bool)
(declare-const investment_diversification_ratio Real)
(declare-const law_compliance Bool)
(declare-const liability_for_damage Bool)
(declare-const major_fraud_or_suspected_fraud_occurred Bool)
(declare-const manager_appointment_and_removal_defined Bool)
(declare-const manager_authority_and_salary_policy_defined Bool)
(declare-const monthly_review_submitted Bool)
(declare-const no_other_law_or_regulation Bool)
(declare-const not_intentional_cross_trading Bool)
(declare-const order_compliance Bool)
(declare-const other_acts_affecting_business_or_client_rights Bool)
(declare-const other_conditions_requiring_special_audit Bool)
(declare-const penalty Bool)
(declare-const performance_fee_exception Bool)
(declare-const profit_loss_sharing_agreement Bool)
(declare-const prohibited_acts_by_responsible_personnel Bool)
(declare-const prohibited_acts_in_fiduciary_investment Bool)
(declare-const qualified_internal_audit_staff_assigned Bool)
(declare-const reasonable_explanation_provided Bool)
(declare-const record_retention_period Int)
(declare-const regulatory_exception_for_subdelegation Bool)
(declare-const reporting_system_defined Bool)
(declare-const required_diversification_ratio Real)
(declare-const self_dealing_or_cross_trading Bool)
(declare-const subdelegation_or_transfer_of_fiduciary_contract Bool)
(declare-const through_central_market_or_broker Bool)
(declare-const transactions_damaging_client_interests Bool)
(declare-const unauthorized_account_transfer_of_trades Bool)
(declare-const use_of_client_account_for_own_or_others Bool)
(declare-const use_of_insider_info_for_own_or_others Bool)
(declare-const violation_of_article_19_1 Bool)
(declare-const violation_of_article_59 Bool)
(declare-const violation_of_law_or_contract Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:business_duty_of_care_and_loyalty] 證券投資信託及顧問事業等應以善良管理人注意義務及忠實義務執行業務
(assert (= business_duty_of_care_and_loyalty
   (and law_compliance
        order_compliance
        contract_compliance
        good_faith_execution)))

; [securities:confidentiality_obligation] 對受益人或客戶資料應保守秘密
(assert (= confidentiality_obligation
   (or confidentiality_maintained (not no_other_law_or_regulation))))

; [securities:liability_for_damage] 違反注意義務或保密義務致損害應負賠償責任
(assert (let ((a!1 (or compensation_obligation
               (not (or (not business_duty_of_care_and_loyalty)
                        (not confidentiality_obligation))))))
  (= liability_for_damage a!1)))

; [securities:investment_decision_record_and_review] 投資決定應有合理基礎並作成紀錄及按月檢討
(assert (= investment_decision_record_and_review
   (and decision_based_on_analysis
        execution_recorded
        monthly_review_submitted
        analysis_reasonable)))

; [securities:internal_control_system_established_and_executed] 證券投資信託事業應訂定內部控制制度並確實執行
(assert (= internal_control_system_established_and_executed
   (and internal_control_system_established
        internal_control_system_executed
        control_operation_recorded
        (<= 0.0 (to_real record_retention_period)))))

; [securities:investment_decision_for_fiduciary_assets] 全權委託投資資產之投資決定準用第17條規定
(assert (= investment_decision_for_fiduciary_assets
   investment_decision_record_and_review))

; [securities:diversified_investment_requirement] 委託投資資產應分散投資，分散比率由主管機關定之
(assert (= diversified_investment_requirement
   (>= investment_diversification_ratio required_diversification_ratio)))

; [securities:prohibited_acts_in_fiduciary_investment] 經營全權委託投資業務不得有第59條列舉之行為
(assert (let ((a!1 (or use_of_insider_info_for_own_or_others
               use_of_client_account_for_own_or_others
               (and self_dealing_or_cross_trading
                    (not (and through_central_market_or_broker
                              not_intentional_cross_trading)))
               unauthorized_account_transfer_of_trades
               (and subdelegation_or_transfer_of_fiduciary_contract
                    (not regulatory_exception_for_subdelegation))
               (and profit_loss_sharing_agreement
                    (not performance_fee_exception))
               (and (not investment_decision_based_on_analysis)
                    (not reasonable_explanation_provided))
               transactions_damaging_client_interests
               other_acts_affecting_business_or_client_rights)))
  (not (= a!1 prohibited_acts_in_fiduciary_investment))))

; [securities:prohibited_acts_by_responsible_personnel] 負責人及受僱人不得為第19條第1項、第59條或法令契約禁止之行為
(assert (not (= (or violation_of_article_19_1
            violation_of_article_59
            violation_of_law_or_contract)
        prohibited_acts_by_responsible_personnel)))

; [securities:internal_control_system_establishment_and_operation] 證券投資信託事業應依第93條規定建立內部控制制度並依法令章程執行
(assert (= internal_control_system_establishment_and_operation
   (and internal_control_system_established
        internal_control_system_approved_by_board
        internal_control_system_executed_according_to_law_and_articles)))

; [securities:internal_control_system_change_reported] 內部控制制度訂定或變更應報董事會同意並留存備查，變更應於限期內完成
(assert (= internal_control_system_change_reported
   (and internal_control_system_change_approved_by_board
        internal_control_system_change_filed
        internal_control_system_change_completed_within_deadline)))

; [securities:internal_control_system_design_and_execution] 內部控制制度應訂定明確組織結構、呈報體系及適當權限責任，並確實執行及持續檢討
(assert (= internal_control_system_design_and_execution
   (and internal_control_organization_defined
        reporting_system_defined
        appropriate_authority_and_responsibility_defined
        manager_appointment_and_removal_defined
        manager_authority_and_salary_policy_defined
        internal_control_system_executed
        internal_control_system_continuously_reviewed)))

; [securities:internal_control_system_special_audit_conditions] 主管機關得命令限期改善及委託會計師專案審查內部控制制度
(assert (= internal_control_system_special_audit_conditions
   (or (not internal_control_self_assessment_done)
       major_fraud_or_suspected_fraud_occurred
       other_conditions_requiring_special_audit
       (not internal_control_written)
       (not external_financial_reporting_accurate)
       (not annual_audit_plan_executed_on_time)
       (not qualified_internal_audit_staff_assigned)
       (not internal_control_deficiencies_improved_per_auditor_recommendations)
       (not annual_audit_plan_reported_on_time)
       (not internal_control_deficiencies_reported_on_time))))

; [securities:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities:penalty_conditions] 處罰條件：違反注意義務、保密義務、投資決策紀錄、內部控制制度或第59條禁止行為等規定時處罰
(assert (= penalty
   (or (not internal_control_system_establishment_and_operation)
       (not business_duty_of_care_and_loyalty)
       (not confidentiality_obligation)
       (not investment_decision_record_and_review)
       (not internal_control_system_established_and_executed)
       (not investment_decision_for_fiduciary_assets)
       (not internal_control_system_design_and_execution)
       (not prohibited_acts_by_responsible_personnel)
       (not internal_control_system_change_reported)
       (not diversified_investment_requirement)
       internal_control_system_special_audit_conditions
       (not prohibited_acts_in_fiduciary_investment))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= business_duty_of_care_and_loyalty false))
(assert (= law_compliance false))
(assert (= order_compliance false))
(assert (= contract_compliance false))
(assert (= good_faith_execution false))
(assert (= confidentiality_obligation true))
(assert (= confidentiality_maintained true))
(assert (= decision_based_on_analysis false))
(assert (= execution_recorded false))
(assert (= monthly_review_submitted false))
(assert (= analysis_reasonable false))
(assert (= investment_decision_record_and_review false))
(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= control_operation_recorded false))
(assert (= record_retention_period 0))
(assert (= internal_control_system_established_and_executed false))
(assert (= internal_control_system_approved_by_board true))
(assert (= internal_control_system_change_approved_by_board true))
(assert (= internal_control_system_change_filed true))
(assert (= internal_control_system_change_completed_within_deadline true))
(assert (= internal_control_system_change_reported true))
(assert (= internal_control_organization_defined true))
(assert (= reporting_system_defined true))
(assert (= appropriate_authority_and_responsibility_defined true))
(assert (= manager_appointment_and_removal_defined true))
(assert (= manager_authority_and_salary_policy_defined true))
(assert (= internal_control_system_continuously_reviewed true))
(assert (= internal_control_system_design_and_execution true))
(assert (= internal_control_system_establishment_and_operation false))
(assert (= internal_control_system_executed_according_to_law_and_articles false))
(assert (= internal_control_system_special_audit_conditions true))
(assert (= internal_control_written true))
(assert (= qualified_internal_audit_staff_assigned false))
(assert (= annual_audit_plan_reported_on_time false))
(assert (= annual_audit_plan_executed_on_time false))
(assert (= internal_control_deficiencies_reported_on_time false))
(assert (= internal_control_self_assessment_done false))
(assert (= internal_control_deficiencies_improved_per_auditor_recommendations false))
(assert (= external_financial_reporting_accurate false))
(assert (= major_fraud_or_suspected_fraud_occurred true))
(assert (= other_conditions_requiring_special_audit true))
(assert (= investment_decision_for_fiduciary_assets false))
(assert (= investment_diversification_ratio 10.0))
(assert (= required_diversification_ratio 50.0))
(assert (= diversified_investment_requirement false))
(assert (= use_of_insider_info_for_own_or_others false))
(assert (= transactions_damaging_client_interests true))
(assert (= profit_loss_sharing_agreement false))
(assert (= performance_fee_exception false))
(assert (= self_dealing_or_cross_trading false))
(assert (= through_central_market_or_broker true))
(assert (= not_intentional_cross_trading true))
(assert (= use_of_client_account_for_own_or_others false))
(assert (= subdelegation_or_transfer_of_fiduciary_contract false))
(assert (= regulatory_exception_for_subdelegation false))
(assert (= unauthorized_account_transfer_of_trades false))
(assert (= reasonable_explanation_provided false))
(assert (= other_acts_affecting_business_or_client_rights true))
(assert (= prohibited_acts_in_fiduciary_investment false))
(assert (= violation_of_article_19_1 true))
(assert (= violation_of_article_59 true))
(assert (= violation_of_law_or_contract true))
(assert (= prohibited_acts_by_responsible_personnel false))
(assert (= penalty true))
(assert (= compensation_obligation true))
(assert (= no_other_law_or_regulation true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 69
; Total facts: 67
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
