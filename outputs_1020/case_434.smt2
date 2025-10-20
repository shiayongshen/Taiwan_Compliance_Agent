; SMT2 file generated from compliance case automatic
; Case ID: case_434
; Generated at: 2025-10-19T15:54:42.292473
;
; This file can be executed with Z3:
;   z3 case_434.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const confidentiality_observed Bool)
(declare-const control_operation_recorded Bool)
(declare-const control_record_retention_period_years Int)
(declare-const disclosure_of_confidential_info Bool)
(declare-const duty_of_care_and_loyalty_observed Bool)
(declare-const execution_recorded Bool)
(declare-const failure_to_return_commissions_to_fund Bool)
(declare-const fine_imposed Bool)
(declare-const fraudulent_or_misleading_behavior Bool)
(declare-const improper_account_transfers Bool)
(declare-const improper_public_recommendations Bool)
(declare-const improvement_ordered Bool)
(declare-const internal_audit_responsibility_and_reporting Bool)
(declare-const internal_control_documented Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_execution_confirmed Bool)
(declare-const internal_control_organization_and_execution Bool)
(declare-const internal_control_organization_documented Bool)
(declare-const internal_control_periodic_reviewed Bool)
(declare-const investment_decision_based_on_analysis Bool)
(declare-const investment_decision_has_reasonable_basis Bool)
(declare-const investment_decision_recorded Bool)
(declare-const major_deficiency_or_misconduct_disclosed Bool)
(declare-const manipulating_security_prices Bool)
(declare-const minor_violations_fines_and_orders Bool)
(declare-const monthly_review_submitted Bool)
(declare-const other_acts_harming_clients_or_business Bool)
(declare-const penalty Bool)
(declare-const personnel_confidentiality Bool)
(declare-const personnel_duty_of_care_and_prohibited_behaviors Bool)
(declare-const personnel_misconduct_affects_operations Bool)
(declare-const personnel_qualification_compliance Bool)
(declare-const personnel_qualification_meets_regulations Bool)
(declare-const personnel_violation_affects_operations Bool)
(declare-const providing_undue_benefits_for_promotion Bool)
(declare-const recommendation_for_disciplinary_action_made Bool)
(declare-const responsible_persons_held_accountable Bool)
(declare-const self_dealing_or_related_party_trading Bool)
(declare-const selling_proxy_votes_for_money Bool)
(declare-const serious_violations_fines_and_orders Bool)
(declare-const unauthorized_agent_trading Bool)
(declare-const using_non_professional_agents_or_unreasonable_commissions Bool)
(declare-const violation_of_law_or_order Bool)
(declare-const violation_of_reporting_or_recording_rules Bool)
(declare-const violation_of_specified_provisions Bool)
(declare-const violation_penalties_applicable Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:investment_decision_recorded] 證券投資信託事業投資決定依據分析作成並有合理基礎，交付執行時作成紀錄，並按月檢討
(assert (= investment_decision_recorded
   (and investment_decision_based_on_analysis
        investment_decision_has_reasonable_basis
        execution_recorded
        monthly_review_submitted)))

; [securities:internal_control_established_and_executed] 證券投資信託事業內部控制制度訂定並確實執行，控制作業留存紀錄並保存一定期限
(assert (= internal_control_established_and_executed
   (and internal_control_documented
        internal_control_executed
        control_operation_recorded
        (<= 5.0 (to_real control_record_retention_period_years)))))

; [securities:personnel_qualification_compliance] 證券投資信託事業及顧問事業人員資格條件、行為規範、訓練、登記期限及程序符合主管機關規定
(assert (= personnel_qualification_compliance personnel_qualification_meets_regulations))

; [securities:violation_penalties] 主管機關對違反法令者得依情節輕重處分
(assert (= violation_penalties_applicable violation_of_law_or_order))

; [securities:personnel_misconduct_affects_operations] 證券投資信託事業及顧問事業人員違反法令行為足以影響業務正常執行
(assert (= personnel_misconduct_affects_operations
   personnel_violation_affects_operations))

; [securities:serious_violations_fines_and_orders] 證券投資信託事業或顧問事業違反特定條文規定，處罰鍰並責令限期改善，屆期不改善加重處罰
(assert (= serious_violations_fines_and_orders
   (and violation_of_specified_provisions fine_imposed improvement_ordered)))

; [securities:minor_violations_fines_and_orders] 證券投資信託事業、顧問事業、基金保管機構違反申報、帳簿保存等規定，處罰鍰並責令限期改善，屆期不改善加重處罰
(assert (= minor_violations_fines_and_orders
   (and violation_of_reporting_or_recording_rules
        fine_imposed
        improvement_ordered)))

; [securities:personnel_duty_of_care_and_prohibited_behaviors] 證券投資信託事業負責人及業務人員應以善良管理人注意義務執行業務，且不得有列舉之不當行為
(assert (= personnel_duty_of_care_and_prohibited_behaviors
   (and duty_of_care_and_loyalty_observed
        (not disclosure_of_confidential_info)
        (not self_dealing_or_related_party_trading)
        (not fraudulent_or_misleading_behavior)
        (not failure_to_return_commissions_to_fund)
        (not providing_undue_benefits_for_promotion)
        (not selling_proxy_votes_for_money)
        (not manipulating_security_prices)
        (not improper_account_transfers)
        (not improper_public_recommendations)
        (not using_non_professional_agents_or_unreasonable_commissions)
        (not unauthorized_agent_trading)
        (not other_acts_harming_clients_or_business))))

; [securities:personnel_confidentiality] 證券投資信託事業人員對受益人或客戶資料應保守秘密
(assert (= personnel_confidentiality confidentiality_observed))

; [securities:internal_control_organization_and_execution] 各服務事業內部控制制度訂定明確組織結構、呈報體系及權責，並確實執行及隨時檢討
(assert (= internal_control_organization_and_execution
   (and internal_control_organization_documented
        internal_control_execution_confirmed
        internal_control_periodic_reviewed)))

; [securities:internal_audit_responsibility_and_reporting] 內部稽核人員發現重大弊端應揭露並建議懲處，相關人員應負失職責任
(assert (= internal_audit_responsibility_and_reporting
   (and major_deficiency_or_misconduct_disclosed
        recommendation_for_disciplinary_action_made
        responsible_persons_held_accountable)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法定要求時處罰
(assert (= penalty
   (or (not serious_violations_fines_and_orders)
       (not internal_control_established_and_executed)
       (not internal_audit_responsibility_and_reporting)
       (not personnel_qualification_compliance)
       (not personnel_confidentiality)
       (not investment_decision_recorded)
       (not minor_violations_fines_and_orders)
       (not internal_control_organization_and_execution)
       (not personnel_duty_of_care_and_prohibited_behaviors))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= investment_decision_based_on_analysis false))
(assert (= investment_decision_has_reasonable_basis false))
(assert (= execution_recorded false))
(assert (= monthly_review_submitted false))
(assert (= internal_control_documented false))
(assert (= internal_control_executed false))
(assert (= control_operation_recorded false))
(assert (= control_record_retention_period_years 0))
(assert (= personnel_qualification_meets_regulations true))
(assert (= disclosure_of_confidential_info false))
(assert (= duty_of_care_and_loyalty_observed false))
(assert (= failure_to_return_commissions_to_fund false))
(assert (= fine_imposed true))
(assert (= fraudulent_or_misleading_behavior true))
(assert (= improper_account_transfers false))
(assert (= improper_public_recommendations false))
(assert (= improvement_ordered true))
(assert (= internal_control_organization_documented false))
(assert (= internal_control_execution_confirmed false))
(assert (= internal_control_periodic_reviewed false))
(assert (= internal_control_organization_and_execution false))
(assert (= investment_decision_recorded false))
(assert (= major_deficiency_or_misconduct_disclosed true))
(assert (= manipulating_security_prices false))
(assert (= minor_violations_fines_and_orders true))
(assert (= personnel_confidentiality true))
(assert (= personnel_duty_of_care_and_prohibited_behaviors false))
(assert (= personnel_violation_affects_operations true))
(assert (= personnel_misconduct_affects_operations true))
(assert (= personnel_qualification_compliance true))
(assert (= providing_undue_benefits_for_promotion false))
(assert (= recommendation_for_disciplinary_action_made true))
(assert (= responsible_persons_held_accountable true))
(assert (= self_dealing_or_related_party_trading true))
(assert (= selling_proxy_votes_for_money false))
(assert (= serious_violations_fines_and_orders true))
(assert (= unauthorized_agent_trading false))
(assert (= using_non_professional_agents_or_unreasonable_commissions false))
(assert (= violation_of_law_or_order true))
(assert (= violation_of_reporting_or_recording_rules true))
(assert (= violation_of_specified_provisions true))
(assert (= violation_penalties_applicable true))
(assert (= penalty true))
(assert (= confidentiality_observed false))
(assert (= internal_audit_responsibility_and_reporting false))
(assert (= internal_control_established_and_executed false))
(assert (= other_acts_harming_clients_or_business false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 47
; Total facts: 47
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
