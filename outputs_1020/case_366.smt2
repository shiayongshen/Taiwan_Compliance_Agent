; SMT2 file generated from compliance case automatic
; Case ID: case_366
; Generated at: 2025-10-19T14:08:15.162125
;
; This file can be executed with Z3:
;   z3 case_366.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const appropriate_measures_taken Bool)
(declare-const asset_allocation_and_risk_management_established Bool)
(declare-const asset_quality_and_loss_provisioning_controlled Bool)
(declare-const business_specifications_defined Bool)
(declare-const capital_adequacy_monitored Bool)
(declare-const control_activities_implemented Bool)
(declare-const control_environment_established Bool)
(declare-const independent_risk_control_unit_established Bool)
(declare-const information_and_communication_effective Bool)
(declare-const information_security_and_emergency_plan_established Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_comprehensive Bool)
(declare-const internal_control_elements_compliant Bool)
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
(declare-const liquidity_risk_management_established Bool)
(declare-const major_risk_detected Bool)
(declare-const monitoring_activities_performed Bool)
(declare-const organization_rules_defined Bool)
(declare-const penalty Bool)
(declare-const periodic_review_and_revision Bool)
(declare-const reported_to_board Bool)
(declare-const risk_assessment_performed Bool)
(declare-const risk_control_measures_taken Bool)
(declare-const risk_control_report_submitted Bool)
(declare-const risk_control_reported Bool)
(declare-const risk_control_unit_established Bool)
(declare-const risk_management_principles_followed Bool)

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

; [bank:risk_control_unit_established] 設置獨立專責風險控管單位
(assert (= risk_control_unit_established independent_risk_control_unit_established))

; [bank:risk_control_reported] 定期向董（理）事會提出風險控管報告
(assert (= risk_control_reported risk_control_report_submitted))

; [bank:risk_control_measures_taken] 發現重大風險時立即採取適當措施並報告董（理）事會
(assert (= risk_control_measures_taken
   (and major_risk_detected appropriate_measures_taken reported_to_board)))

; [bank:internal_control_comprehensive] 內部控制制度涵蓋所有營運活動並訂定適當政策及程序
(assert (= internal_control_comprehensive
   (and organization_rules_defined
        business_specifications_defined
        periodic_review_and_revision)))

; [bank:internal_control_elements_compliant] 內部控制制度包含控制環境、風險評估、控制作業、資訊與溝通、監督作業等組成要素
(assert (= internal_control_elements_compliant
   (and control_environment_established
        risk_assessment_performed
        control_activities_implemented
        information_and_communication_effective
        monitoring_activities_performed)))

; [bank:risk_management_principles_followed] 銀行業風險控管機制符合規定原則
(assert (= risk_management_principles_followed
   (and capital_adequacy_monitored
        liquidity_risk_management_established
        asset_allocation_and_risk_management_established
        asset_quality_and_loss_provisioning_controlled
        information_security_and_emergency_plan_established)))

; [bank:internal_control_compliance] 銀行內部控制及稽核制度合規
(assert (= internal_control_compliance
   (and internal_control_ok
        internal_handling_ok
        internal_operation_ok
        risk_control_unit_established
        risk_control_reported
        (or (not major_risk_detected) risk_control_measures_taken)
        internal_control_comprehensive
        internal_control_elements_compliant
        risk_management_principles_followed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度，或未設置獨立風險控管單位，或未定期報告，或未採取風險控管措施時處罰
(assert (= penalty
   (or (not internal_control_elements_compliant)
       (not risk_management_principles_followed)
       (not internal_handling_ok)
       (not risk_control_unit_established)
       (not internal_control_comprehensive)
       (not internal_operation_ok)
       (and major_risk_detected (not risk_control_measures_taken))
       (not risk_control_reported)
       (not internal_control_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= independent_risk_control_unit_established false))
(assert (= risk_control_report_submitted false))
(assert (= major_risk_detected true))
(assert (= appropriate_measures_taken false))
(assert (= reported_to_board false))
(assert (= organization_rules_defined false))
(assert (= business_specifications_defined false))
(assert (= periodic_review_and_revision false))
(assert (= control_environment_established false))
(assert (= risk_assessment_performed false))
(assert (= control_activities_implemented false))
(assert (= information_and_communication_effective false))
(assert (= monitoring_activities_performed false))
(assert (= capital_adequacy_monitored false))
(assert (= liquidity_risk_management_established false))
(assert (= asset_allocation_and_risk_management_established false))
(assert (= asset_quality_and_loss_provisioning_controlled false))
(assert (= information_security_and_emergency_plan_established false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= risk_control_unit_established false))
(assert (= risk_control_reported false))
(assert (= risk_control_measures_taken false))
(assert (= internal_control_comprehensive false))
(assert (= internal_control_elements_compliant false))
(assert (= risk_management_principles_followed false))
(assert (= internal_control_ok false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_ok false))
(assert (= internal_control_compliance false))
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
; Total variables: 41
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
