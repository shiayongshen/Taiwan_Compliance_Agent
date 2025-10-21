; SMT2 file generated from compliance case automatic
; Case ID: case_268
; Generated at: 2025-10-21T05:57:15.102395
;
; This file can be executed with Z3:
;   z3 case_268.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_audit_plan_prepared Bool)
(declare-const audit_committee_management_included Bool)
(declare-const audit_organization_planned Bool)
(declare-const audit_supervision_performed Bool)
(declare-const business_regulations_defined Bool)
(declare-const control_activities_compliant Bool)
(declare-const control_environment_compliant Bool)
(declare-const fhc_internal_control_established Bool)
(declare-const fhc_internal_control_executed Bool)
(declare-const group_aml_ctf_plan_established Bool)
(declare-const information_communication_compliant Bool)
(declare-const internal_audit_duties_compliant Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_components_compliant Bool)
(declare-const internal_control_comprehensive_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_scope_compliant Bool)
(declare-const manuals_and_handbooks_defined Bool)
(declare-const monitoring_compliant Bool)
(declare-const organization_rules_defined Bool)
(declare-const penalty Bool)
(declare-const regulations_revision_process_defined Bool)
(declare-const risk_assessment_compliant Bool)
(declare-const salary_committee_management_included Bool)
(declare-const subsidiary_control_defined Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:internal_control_established] 金融控股公司已建立內部控制及稽核制度
(assert (= internal_control_established fhc_internal_control_established))

; [fhc:internal_control_executed] 金融控股公司已確實執行內部控制及稽核制度
(assert (= internal_control_executed fhc_internal_control_executed))

; [fhc:internal_control_compliance] 金融控股公司建立且確實執行內部控制及稽核制度
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [fhc:internal_control_components_compliant] 內部控制制度包含五大組成要素且符合規定
(assert (= internal_control_components_compliant
   (and control_environment_compliant
        risk_assessment_compliant
        control_activities_compliant
        information_communication_compliant
        monitoring_compliant)))

; [fhc:internal_audit_duties_compliant] 內部稽核單位履行規劃、督導及稽核計畫等職責
(assert (= internal_audit_duties_compliant
   (and audit_organization_planned
        audit_supervision_performed
        annual_audit_plan_prepared)))

; [fhc:internal_control_scope_compliant] 內部控制制度涵蓋所有營運活動並訂定適當政策及程序
(assert (= internal_control_scope_compliant
   (and organization_rules_defined
        business_regulations_defined
        manuals_and_handbooks_defined
        salary_committee_management_included
        audit_committee_management_included
        subsidiary_control_defined
        group_aml_ctf_plan_established
        regulations_revision_process_defined)))

; [fhc:internal_control_comprehensive_compliance] 金融控股公司內部控制制度全面符合規定
(assert (= internal_control_comprehensive_compliance
   (and internal_control_compliance
        internal_control_components_compliant
        internal_audit_duties_compliant
        internal_control_scope_compliant)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行內部控制及稽核制度，或內部控制制度不符合規定時處罰
(assert (= penalty
   (or (not internal_control_established)
       (not internal_control_executed)
       (not internal_control_components_compliant)
       (not internal_control_scope_compliant)
       (not internal_audit_duties_compliant))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fhc_internal_control_established false))
(assert (= fhc_internal_control_executed false))
(assert (= control_environment_compliant false))
(assert (= risk_assessment_compliant false))
(assert (= control_activities_compliant false))
(assert (= information_communication_compliant false))
(assert (= monitoring_compliant false))
(assert (= audit_organization_planned false))
(assert (= audit_supervision_performed false))
(assert (= annual_audit_plan_prepared false))
(assert (= business_regulations_defined false))
(assert (= organization_rules_defined false))
(assert (= manuals_and_handbooks_defined false))
(assert (= salary_committee_management_included false))
(assert (= audit_committee_management_included false))
(assert (= subsidiary_control_defined false))
(assert (= group_aml_ctf_plan_established false))
(assert (= regulations_revision_process_defined false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 26
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
