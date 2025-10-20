; SMT2 file generated from compliance case automatic
; Case ID: case_116
; Generated at: 2025-10-19T08:25:26.022257
;
; This file can be executed with Z3:
;   z3 case_116.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const compliance_evaluation_and_supervision_done Bool)
(declare-const compliance_self_evaluation_done Bool)
(declare-const compliance_supervisor_implementation_supervised Bool)
(declare-const compliance_supervisor_opinion_signed Bool)
(declare-const compliance_unit_ok Bool)
(declare-const foreign_compliance_resources_adequate Bool)
(declare-const foreign_compliance_risk_assessment_verified Bool)
(declare-const foreign_compliance_risk_monitoring_established Bool)
(declare-const foreign_compliance_self_evaluation_done Bool)
(declare-const foreign_compliance_supervised Bool)
(declare-const foreign_compliance_supervisor_qualified Bool)
(declare-const foreign_financial_regulations_collected Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const internal_systems_compliant Bool)
(declare-const law_regulation_communication_system_established Bool)
(declare-const operation_rules_updated Bool)
(declare-const penalty Bool)
(declare-const self_evaluation_at_least_twice_per_year Bool)
(declare-const self_evaluation_records_kept_5_years Bool)
(declare-const self_evaluation_responsible_person_assigned Bool)
(declare-const self_evaluation_results_reported Bool)
(declare-const staff_training_done Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_control_ok] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:compliance_unit_established] 法令遵循單位建立並執行相關事項
(assert (= compliance_unit_ok
   (and law_regulation_communication_system_established
        operation_rules_updated
        compliance_supervisor_opinion_signed
        compliance_evaluation_and_supervision_done
        staff_training_done
        compliance_supervisor_implementation_supervised)))

; [bank:foreign_compliance_supervised] 國外營業單位法令遵循督導完成
(assert (= foreign_compliance_supervised
   (and foreign_financial_regulations_collected
        foreign_compliance_self_evaluation_done
        foreign_compliance_supervisor_qualified
        foreign_compliance_resources_adequate
        foreign_compliance_risk_monitoring_established
        foreign_compliance_risk_assessment_verified)))

; [bank:compliance_self_evaluation_done] 法令遵循自行評估每半年至少辦理一次且結果送備查
(assert (= compliance_self_evaluation_done
   (and self_evaluation_at_least_twice_per_year
        self_evaluation_results_reported
        self_evaluation_responsible_person_assigned
        self_evaluation_records_kept_5_years)))

; [bank:internal_systems_compliant] 內部控制、內部處理及內部作業制度均建立且確實執行
(assert (= internal_systems_compliant
   (and internal_control_ok internal_handling_ok internal_operation_ok)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理或內部作業制度時處罰
(assert (not (= internal_systems_compliant penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= law_regulation_communication_system_established false))
(assert (= operation_rules_updated false))
(assert (= compliance_supervisor_opinion_signed false))
(assert (= compliance_evaluation_and_supervision_done false))
(assert (= staff_training_done false))
(assert (= compliance_supervisor_implementation_supervised false))
(assert (= compliance_self_evaluation_done false))
(assert (= self_evaluation_at_least_twice_per_year false))
(assert (= self_evaluation_results_reported false))
(assert (= self_evaluation_responsible_person_assigned false))
(assert (= self_evaluation_records_kept_5_years false))
(assert (= foreign_financial_regulations_collected false))
(assert (= foreign_compliance_self_evaluation_done false))
(assert (= foreign_compliance_supervisor_qualified false))
(assert (= foreign_compliance_resources_adequate false))
(assert (= foreign_compliance_risk_monitoring_established false))
(assert (= foreign_compliance_risk_assessment_verified false))
(assert (= foreign_compliance_supervised false))
(assert (= compliance_unit_ok false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_operation_ok false))
(assert (= internal_systems_compliant false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 36
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
