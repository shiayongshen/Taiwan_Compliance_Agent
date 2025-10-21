; SMT2 file generated from compliance case automatic
; Case ID: case_463
; Generated at: 2025-10-21T22:51:57.243089
;
; This file can be executed with Z3:
;   z3 case_463.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const all_levels_covered Bool)
(declare-const all_process_stages_covered Bool)
(declare-const authority_and_responsibility_assigned Bool)
(declare-const board_and_supervisory_responsibility_established Bool)
(declare-const business_plan_prepared Bool)
(declare-const complete_financial_operational_compliance_information Bool)
(declare-const control_activities_designed_and_executed Bool)
(declare-const control_activities_executed Bool)
(declare-const control_environment_established Bool)
(declare-const deficiencies_communicated_and_corrected Bool)
(declare-const execution_guidelines_prepared Bool)
(declare-const external_environment_and_business_model_considered Bool)
(declare-const fraud_risk_considered Bool)
(declare-const guidelines_planned Bool)
(declare-const human_resources_policy_established Bool)
(declare-const information_and_communication_effective Bool)
(declare-const integrity_and_ethics_established Bool)
(declare-const internal_and_external_communication_effective Bool)
(declare-const internal_code_of_conduct_established Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_effective Bool)
(declare-const internal_control_system_established Bool)
(declare-const management_strategy_planned Bool)
(declare-const monitoring_activities_performed Bool)
(declare-const no_conflicting_responsibilities Bool)
(declare-const objectives_defined Bool)
(declare-const ongoing_evaluations_performed Bool)
(declare-const organizational_structure_established Bool)
(declare-const overall_management_planned Bool)
(declare-const penalty Bool)
(declare-const performance_measurement_and_rewards_established Bool)
(declare-const proper_segregation_of_duties Bool)
(declare-const relevant_quality_information_collected Bool)
(declare-const risk_assessment_performed Bool)
(declare-const risk_management_policy_planned Bool)
(declare-const risk_management_procedures_prepared Bool)
(declare-const separate_evaluations_performed Bool)
(declare-const subsidiaries_supervised Bool)
(declare-const technology_environment_covered Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 已建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_control_executed] 內部控制制度持續有效執行
(assert (= internal_control_executed internal_control_system_effective))

; [bank:overall_management_planned] 已規劃整體經營策略、風險管理政策與指導準則，並擬定經營計畫、風險管理程序及執行準則
(assert (= overall_management_planned
   (and management_strategy_planned
        risk_management_policy_planned
        guidelines_planned
        business_plan_prepared
        risk_management_procedures_prepared
        execution_guidelines_prepared)))

; [bank:control_environment_established] 已建立控制環境，包括誠信與道德價值、董（理）事會及監察人治理監督責任、組織結構、權責分派、人力資源政策、績效衡量及獎懲等
(assert (= control_environment_established
   (and integrity_and_ethics_established
        board_and_supervisory_responsibility_established
        organizational_structure_established
        authority_and_responsibility_assigned
        human_resources_policy_established
        performance_measurement_and_rewards_established
        internal_code_of_conduct_established)))

; [bank:risk_assessment_performed] 已執行風險評估，包含確立目標、考量外部環境與商業模式改變及舞弊情事，並設計、修正及執行控制作業
(assert (= risk_assessment_performed
   (and objectives_defined
        external_environment_and_business_model_considered
        fraud_risk_considered
        control_activities_designed_and_executed)))

; [bank:control_activities_executed] 控制作業執行，包括所有層級、業務流程階段、科技環境、子公司監督與管理及適當職務分工，且無責任衝突
(assert (= control_activities_executed
   (and all_levels_covered
        all_process_stages_covered
        technology_environment_covered
        subsidiaries_supervised
        proper_segregation_of_duties
        no_conflicting_responsibilities)))

; [bank:information_and_communication_effective] 資訊與溝通有效，包含攸關且具品質資訊蒐集、產生及使用，內外部有效溝通及完整財務、營運及遵循資訊
(assert (= information_and_communication_effective
   (and relevant_quality_information_collected
        internal_and_external_communication_effective
        complete_financial_operational_compliance_information)))

; [bank:monitoring_activities_performed] 監督作業持續進行，包括持續性評估、個別評估及缺失溝通與改善
(assert (= monitoring_activities_performed
   (and ongoing_evaluations_performed
        separate_evaluations_performed
        deficiencies_communicated_and_corrected)))

; [bank:internal_control_compliance] 內部控制制度符合第3條、第4條及第7條規定
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_executed
        overall_management_planned
        control_environment_established
        risk_assessment_performed
        control_activities_executed
        information_and_communication_effective
        monitoring_activities_performed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制制度規定時處罰
(assert (not (= internal_control_compliance penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_effective false))
(assert (= management_strategy_planned false))
(assert (= risk_management_policy_planned false))
(assert (= guidelines_planned false))
(assert (= business_plan_prepared false))
(assert (= risk_management_procedures_prepared false))
(assert (= execution_guidelines_prepared false))
(assert (= integrity_and_ethics_established false))
(assert (= board_and_supervisory_responsibility_established false))
(assert (= organizational_structure_established false))
(assert (= authority_and_responsibility_assigned false))
(assert (= human_resources_policy_established false))
(assert (= performance_measurement_and_rewards_established false))
(assert (= internal_code_of_conduct_established false))
(assert (= objectives_defined false))
(assert (= external_environment_and_business_model_considered false))
(assert (= fraud_risk_considered false))
(assert (= control_activities_designed_and_executed false))
(assert (= all_levels_covered false))
(assert (= all_process_stages_covered false))
(assert (= technology_environment_covered false))
(assert (= subsidiaries_supervised false))
(assert (= proper_segregation_of_duties false))
(assert (= no_conflicting_responsibilities false))
(assert (= relevant_quality_information_collected false))
(assert (= internal_and_external_communication_effective false))
(assert (= complete_financial_operational_compliance_information false))
(assert (= ongoing_evaluations_performed false))
(assert (= separate_evaluations_performed false))
(assert (= deficiencies_communicated_and_corrected false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 41
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
