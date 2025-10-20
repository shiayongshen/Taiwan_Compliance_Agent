; SMT2 file generated from compliance case automatic
; Case ID: case_463
; Generated at: 2025-10-19T16:34:10.224088
;
; This file can be executed with Z3:
;   z3 case_463.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const all_levels_and_processes_covered Bool)
(declare-const assessment_results_used Bool)
(declare-const authority_and_responsibility_assigned Bool)
(declare-const bank_law_compliance Bool)
(declare-const board_and_supervisory_responsibility_established Bool)
(declare-const business_plan_prepared Bool)
(declare-const business_plan_prepared_flag Bool)
(declare-const business_strategy_planned Bool)
(declare-const complete_financial_operational_compliance_information Bool)
(declare-const conflicting_duties_assigned Bool)
(declare-const consider_business_model_changes Bool)
(declare-const consider_external_environment Bool)
(declare-const consider_fraud_risk Bool)
(declare-const control_activities_ok Bool)
(declare-const control_environment_ok Bool)
(declare-const deficiencies_reported_and_corrected Bool)
(declare-const effective_internal_external_communication Bool)
(declare-const execution_guidelines_prepared Bool)
(declare-const guidelines_planned Bool)
(declare-const human_resources_policy_established Bool)
(declare-const information_and_communication_ok Bool)
(declare-const information_supports_internal_control Bool)
(declare-const integrity_and_ethics_established Bool)
(declare-const internal_code_of_conduct_established Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_full_compliance Bool)
(declare-const internal_control_system_effective Bool)
(declare-const internal_control_system_established Bool)
(declare-const legal_compliance Bool)
(declare-const linked_to_units Bool)
(declare-const monitoring_activities_ok Bool)
(declare-const objectives_defined Bool)
(declare-const ongoing_evaluations_performed Bool)
(declare-const organizational_structure_established Bool)
(declare-const overall_strategy_planned Bool)
(declare-const penalty Bool)
(declare-const performance_measurement_and_rewards_established Bool)
(declare-const policies_and_procedures_appropriate Bool)
(declare-const proper_segregation_of_duties Bool)
(declare-const regulatory_compliance Bool)
(declare-const relevant_quality_information_collected Bool)
(declare-const risk_assessment_ok Bool)
(declare-const risk_controlled_within_tolerance Bool)
(declare-const risk_management_policy_planned Bool)
(declare-const risk_management_procedure_prepared Bool)
(declare-const separate_evaluations_performed Bool)
(declare-const subsidiaries_supervised Bool)
(declare-const technology_environment_covered Bool)
(declare-const timely_information_access Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 已建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_control_executed] 內部控制制度持續有效執行
(assert (= internal_control_executed internal_control_system_effective))

; [bank:overall_strategy_planned] 已規劃整體經營策略、風險管理政策與指導準則
(assert (= overall_strategy_planned
   (and business_strategy_planned
        risk_management_policy_planned
        guidelines_planned)))

; [bank:business_plan_prepared] 已擬定經營計畫、風險管理程序及執行準則
(assert (= business_plan_prepared
   (and business_plan_prepared_flag
        risk_management_procedure_prepared
        execution_guidelines_prepared)))

; [bank:internal_control_compliance] 內部控制制度符合第3條規定
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_executed
        overall_strategy_planned
        business_plan_prepared)))

; [bank:control_environment_ok] 控制環境符合規定
(assert (= control_environment_ok
   (and integrity_and_ethics_established
        board_and_supervisory_responsibility_established
        organizational_structure_established
        authority_and_responsibility_assigned
        human_resources_policy_established
        performance_measurement_and_rewards_established
        internal_code_of_conduct_established)))

; [bank:risk_assessment_ok] 風險評估符合規定
(assert (= risk_assessment_ok
   (and objectives_defined
        linked_to_units
        consider_external_environment
        consider_business_model_changes
        consider_fraud_risk
        assessment_results_used)))

; [bank:control_activities_ok] 控制作業符合規定
(assert (= control_activities_ok
   (and policies_and_procedures_appropriate
        risk_controlled_within_tolerance
        all_levels_and_processes_covered
        technology_environment_covered
        subsidiaries_supervised
        proper_segregation_of_duties
        (not conflicting_duties_assigned))))

; [bank:information_and_communication_ok] 資訊與溝通符合規定
(assert (= information_and_communication_ok
   (and relevant_quality_information_collected
        information_supports_internal_control
        effective_internal_external_communication
        timely_information_access
        complete_financial_operational_compliance_information)))

; [bank:monitoring_activities_ok] 監督作業符合規定
(assert (= monitoring_activities_ok
   (and ongoing_evaluations_performed
        separate_evaluations_performed
        deficiencies_reported_and_corrected)))

; [bank:internal_control_full_compliance] 內部控制制度完全符合第7條規定
(assert (= internal_control_full_compliance
   (and control_environment_ok
        risk_assessment_ok
        control_activities_ok
        information_and_communication_ok
        monitoring_activities_ok)))

; [bank:legal_compliance] 遵守信用合作社法及主管機關規定
(assert (= legal_compliance (and bank_law_compliance regulatory_compliance)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制制度建立、執行或相關法令規定時處罰
(assert (= penalty
   (or (not internal_control_executed)
       (not internal_control_full_compliance)
       (not overall_strategy_planned)
       (not internal_control_established)
       (not business_plan_prepared)
       (not legal_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_effective false))
(assert (= business_strategy_planned false))
(assert (= risk_management_policy_planned false))
(assert (= guidelines_planned false))
(assert (= business_plan_prepared_flag false))
(assert (= risk_management_procedure_prepared false))
(assert (= execution_guidelines_prepared false))
(assert (= integrity_and_ethics_established false))
(assert (= board_and_supervisory_responsibility_established false))
(assert (= organizational_structure_established false))
(assert (= authority_and_responsibility_assigned false))
(assert (= human_resources_policy_established false))
(assert (= performance_measurement_and_rewards_established false))
(assert (= internal_code_of_conduct_established false))
(assert (= objectives_defined false))
(assert (= linked_to_units false))
(assert (= consider_external_environment false))
(assert (= consider_business_model_changes false))
(assert (= consider_fraud_risk false))
(assert (= assessment_results_used false))
(assert (= policies_and_procedures_appropriate false))
(assert (= risk_controlled_within_tolerance false))
(assert (= all_levels_and_processes_covered false))
(assert (= technology_environment_covered false))
(assert (= subsidiaries_supervised false))
(assert (= proper_segregation_of_duties false))
(assert (= conflicting_duties_assigned false))
(assert (= relevant_quality_information_collected false))
(assert (= information_supports_internal_control false))
(assert (= effective_internal_external_communication false))
(assert (= timely_information_access false))
(assert (= complete_financial_operational_compliance_information false))
(assert (= ongoing_evaluations_performed false))
(assert (= separate_evaluations_performed false))
(assert (= deficiencies_reported_and_corrected false))
(assert (= bank_law_compliance false))
(assert (= regulatory_compliance false))
(assert (= business_plan_prepared false))
(assert (= control_activities_ok false))
(assert (= control_environment_ok false))
(assert (= information_and_communication_ok false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_full_compliance false))
(assert (= legal_compliance false))
(assert (= monitoring_activities_ok false))
(assert (= overall_strategy_planned false))
(assert (= penalty false))
(assert (= risk_assessment_ok false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 51
; Total facts: 51
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
