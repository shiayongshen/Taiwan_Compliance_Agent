; SMT2 file generated from compliance case automatic
; Case ID: case_417
; Generated at: 2025-10-21T09:10:13.483811
;
; This file can be executed with Z3:
;   z3 case_417.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const aml_ctf_program_established Bool)
(declare-const anti_money_laundering_program_established Bool)
(declare-const business_specifications_defined Bool)
(declare-const business_specifications_established Bool)
(declare-const compliance_audit_risk_units_participated Bool)
(declare-const compliance_communication_system_established Bool)
(declare-const compliance_evaluation_defined Bool)
(declare-const compliance_foreign_unit_supervised Bool)
(declare-const compliance_opinion_signed Bool)
(declare-const compliance_regulations_updated Bool)
(declare-const compliance_self_assessment_frequency_per_year Int)
(declare-const compliance_self_assessment_performed Bool)
(declare-const compliance_self_assessment_records_retained Bool)
(declare-const compliance_self_assessment_results_reported Bool)
(declare-const compliance_supervision_executed Bool)
(declare-const compliance_training_provided Bool)
(declare-const compliance_unit_established Bool)
(declare-const control_activities_implemented Bool)
(declare-const control_activities_ok Bool)
(declare-const control_environment_established Bool)
(declare-const control_environment_ok Bool)
(declare-const foreign_compliance_resources_adequate Bool)
(declare-const foreign_compliance_risk_monitoring_established Bool)
(declare-const foreign_compliance_risk_monitoring_verified Bool)
(declare-const foreign_compliance_self_assessment_performed Bool)
(declare-const foreign_compliance_supervisor_qualified Bool)
(declare-const foreign_financial_regulations_collected Bool)
(declare-const information_communication_effective Bool)
(declare-const information_communication_ok Bool)
(declare-const internal_control_comprehensive_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_participation_compliance_audit_risk Bool)
(declare-const internal_control_policies_defined Bool)
(declare-const internal_control_policies_established Bool)
(declare-const internal_control_policies_reviewed Bool)
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
(declare-const monitoring_activities_ok Bool)
(declare-const monitoring_activities_performed Bool)
(declare-const organization_regulations_defined Bool)
(declare-const organization_regulations_established Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_ok Bool)
(declare-const risk_assessment_performed Bool)
(declare-const risk_management_policy_approved_by_board Bool)
(declare-const risk_management_policy_defined Bool)
(declare-const risk_management_policy_established Bool)
(declare-const subsidiary_control_defined Bool)
(declare-const subsidiary_control_policies_established Bool)
(declare-const subsidiary_internal_control_supervised Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

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

; [bank:control_environment_ok] 控制環境符合要求
(assert (= control_environment_ok control_environment_established))

; [bank:risk_assessment_ok] 風險評估符合要求
(assert (= risk_assessment_ok risk_assessment_performed))

; [bank:control_activities_ok] 控制作業符合要求
(assert (= control_activities_ok control_activities_implemented))

; [bank:information_communication_ok] 資訊與溝通符合要求
(assert (= information_communication_ok information_communication_effective))

; [bank:monitoring_activities_ok] 監督作業符合要求
(assert (= monitoring_activities_ok monitoring_activities_performed))

; [bank:internal_control_comprehensive_ok] 內部控制制度包含五大組成要素且符合要求
(assert (= internal_control_comprehensive_ok
   (and control_environment_ok
        risk_assessment_ok
        control_activities_ok
        information_communication_ok
        monitoring_activities_ok)))

; [bank:compliance_unit_established] 法令遵循單位建立並執行法令遵循事項
(assert (= compliance_unit_established
   (and compliance_communication_system_established
        compliance_regulations_updated
        compliance_opinion_signed
        compliance_evaluation_defined
        compliance_training_provided
        compliance_supervision_executed)))

; [bank:compliance_foreign_unit_supervised] 法令遵循單位督導國外營業單位法令遵循
(assert (= compliance_foreign_unit_supervised
   (and foreign_financial_regulations_collected
        foreign_compliance_self_assessment_performed
        foreign_compliance_supervisor_qualified
        foreign_compliance_resources_adequate
        foreign_compliance_risk_monitoring_established
        foreign_compliance_risk_monitoring_verified)))

; [bank:compliance_self_assessment_performed] 法令遵循自行評估每半年至少辦理一次
(assert (= compliance_self_assessment_performed
   (and (<= 2 compliance_self_assessment_frequency_per_year)
        compliance_self_assessment_results_reported
        compliance_self_assessment_records_retained)))

; [bank:risk_management_policy_established] 訂定風險管理政策與程序並經董（理）事會通過
(assert (= risk_management_policy_established
   (and risk_management_policy_defined risk_management_policy_approved_by_board)))

; [bank:organization_regulations_defined] 訂定組織規程或管理章則
(assert (= organization_regulations_defined organization_regulations_established))

; [bank:business_specifications_defined] 訂定相關業務規範及處理手冊
(assert (= business_specifications_defined business_specifications_established))

; [bank:internal_control_policies_defined] 內部控制制度訂定適當政策及作業程序並適時檢討修訂
(assert (= internal_control_policies_defined
   (and internal_control_policies_established
        internal_control_policies_reviewed)))

; [bank:subsidiary_control_defined] 對子公司必要控制作業訂定並督促建立內部控制制度
(assert (= subsidiary_control_defined
   (and subsidiary_control_policies_established
        subsidiary_internal_control_supervised)))

; [bank:anti_money_laundering_program_established] 建立集團整體性防制洗錢及打擊資恐計畫
(assert (= anti_money_laundering_program_established aml_ctf_program_established))

; [bank:internal_control_participation_compliance_audit_risk] 法令遵循、內部稽核及風險管理單位參與作業及管理規章訂定、修訂或廢止
(assert (= internal_control_participation_compliance_audit_risk
   compliance_audit_risk_units_participated))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度及程序時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= aml_ctf_program_established true))
(assert (= anti_money_laundering_program_established true))
(assert (= business_specifications_established false))
(assert (= business_specifications_defined false))
(assert (= compliance_audit_risk_units_participated false))
(assert (= compliance_communication_system_established false))
(assert (= compliance_evaluation_defined false))
(assert (= compliance_regulations_updated false))
(assert (= compliance_self_assessment_frequency_per_year 0))
(assert (= compliance_self_assessment_performed false))
(assert (= compliance_self_assessment_records_retained false))
(assert (= compliance_self_assessment_results_reported false))
(assert (= compliance_supervision_executed false))
(assert (= compliance_training_provided false))
(assert (= compliance_unit_established false))
(assert (= control_activities_implemented false))
(assert (= control_environment_established false))
(assert (= foreign_compliance_resources_adequate false))
(assert (= foreign_compliance_risk_monitoring_established false))
(assert (= foreign_compliance_risk_monitoring_verified false))
(assert (= foreign_compliance_self_assessment_performed false))
(assert (= foreign_compliance_supervisor_qualified false))
(assert (= foreign_financial_regulations_collected false))
(assert (= information_communication_effective false))
(assert (= internal_control_policies_established false))
(assert (= internal_control_policies_reviewed false))
(assert (= internal_control_participation_compliance_audit_risk false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= monitoring_activities_performed false))
(assert (= organization_regulations_established false))
(assert (= risk_assessment_performed false))
(assert (= risk_management_policy_defined false))
(assert (= risk_management_policy_approved_by_board false))
(assert (= risk_management_policy_established false))
(assert (= subsidiary_control_policies_established false))
(assert (= subsidiary_internal_control_supervised false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 27
; Total variables: 62
; Total facts: 45
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
