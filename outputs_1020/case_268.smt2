; SMT2 file generated from compliance case automatic
; Case ID: case_268
; Generated at: 2025-10-19T11:46:03.952041
;
; This file can be executed with Z3:
;   z3 case_268.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_audit_plan_executed Bool)
(declare-const audit_committee_management_included Bool)
(declare-const audit_organization_planned Bool)
(declare-const audit_supervision_done Bool)
(declare-const banking_business_regulations_defined Bool)
(declare-const business_regulations_defined Bool)
(declare-const control_activities_compliant Bool)
(declare-const control_environment_compliant Bool)
(declare-const credit_union_business_regulations_defined Bool)
(declare-const group_aml_ctf_plan_established Bool)
(declare-const information_communication_compliant Bool)
(declare-const internal_audit_duties_compliant Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_components_compliant Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_scope_compliant Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const legal_compliance_violations Bool)
(declare-const monitoring_activities_compliant Bool)
(declare-const organization_rules_defined Bool)
(declare-const penalty Bool)
(declare-const policy_revision_mechanism_established Bool)
(declare-const risk_assessment_compliant Bool)
(declare-const salary_committee_management_included Bool)
(declare-const securities_business_regulations_defined Bool)
(declare-const subsidiary_control_defined Bool)
(declare-const subsidiary_management_defined Bool)
(declare-const trust_business_manual_defined Bool)
(declare-const violate_article_16_10 Bool)
(declare-const violate_article_16_1_2_9 Bool)
(declare-const violate_article_16_3 Bool)
(declare-const violate_article_16_5_reporting Bool)
(declare-const violate_article_16_6_pledge Bool)
(declare-const violate_article_16_7_exception Bool)
(declare-const violate_article_18_1 Bool)
(declare-const violate_article_38 Bool)
(declare-const violate_article_39_1 Bool)
(declare-const violate_article_39_2 Bool)
(declare-const violate_article_39_3 Bool)
(declare-const violate_article_40_41_ratio_disposal Bool)
(declare-const violate_article_42_1_confidentiality Bool)
(declare-const violate_article_43_1_2_4 Bool)
(declare-const violate_article_43_3_scope_management Bool)
(declare-const violate_article_45_1_4 Bool)
(declare-const violate_article_46_1_reporting Bool)
(declare-const violate_article_51_internal_control Bool)
(declare-const violate_article_53_1_2_capital Bool)
(declare-const violate_article_53_3_capital_replenish Bool)
(declare-const violate_article_55_1_order Bool)
(declare-const violate_article_56_1_assistance Bool)
(declare-const violate_article_56_2_order Bool)
(declare-const violate_article_6_1 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:internal_control_established] 金融控股公司已建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [fhc:internal_control_executed] 金融控股公司已確實執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [fhc:internal_control_compliance] 金融控股公司內部控制制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [fhc:internal_control_components_compliant] 內部控制制度包含五大組成要素且符合規定
(assert (= internal_control_components_compliant
   (and control_environment_compliant
        risk_assessment_compliant
        control_activities_compliant
        information_communication_compliant
        monitoring_activities_compliant)))

; [fhc:internal_audit_duties_compliant] 內部稽核單位履行規劃、督導及稽核計畫等職責
(assert (= internal_audit_duties_compliant
   (and audit_organization_planned
        audit_supervision_done
        annual_audit_plan_executed)))

; [fhc:internal_control_scope_compliant] 內部控制制度涵蓋所有營運活動並訂定適當政策及程序
(assert (= internal_control_scope_compliant
   (and organization_rules_defined
        business_regulations_defined
        subsidiary_management_defined
        banking_business_regulations_defined
        credit_union_business_regulations_defined
        securities_business_regulations_defined
        trust_business_manual_defined
        salary_committee_management_included
        audit_committee_management_included
        subsidiary_control_defined
        group_aml_ctf_plan_established
        policy_revision_mechanism_established)))

; [fhc:legal_compliance_violations] 違反金融控股公司法第60條各項規定
(assert (= legal_compliance_violations
   (or violate_article_43_1_2_4
       violate_article_55_1_order
       violate_article_16_1_2_9
       violate_article_16_7_exception
       violate_article_40_41_ratio_disposal
       violate_article_51_internal_control
       violate_article_39_2
       violate_article_16_3
       violate_article_38
       violate_article_6_1
       violate_article_53_1_2_capital
       violate_article_53_3_capital_replenish
       violate_article_42_1_confidentiality
       violate_article_43_3_scope_management
       violate_article_16_6_pledge
       violate_article_16_10
       violate_article_56_2_order
       violate_article_56_1_assistance
       violate_article_16_5_reporting
       violate_article_39_3
       violate_article_18_1
       violate_article_45_1_4
       violate_article_46_1_reporting
       violate_article_39_1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法第60條任一規定時處罰
(assert (= penalty legal_compliance_violations))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= audit_organization_planned false))
(assert (= audit_supervision_done false))
(assert (= annual_audit_plan_executed false))
(assert (= organization_rules_defined false))
(assert (= business_regulations_defined false))
(assert (= subsidiary_management_defined false))
(assert (= banking_business_regulations_defined false))
(assert (= credit_union_business_regulations_defined false))
(assert (= securities_business_regulations_defined false))
(assert (= trust_business_manual_defined false))
(assert (= salary_committee_management_included false))
(assert (= audit_committee_management_included false))
(assert (= subsidiary_control_defined false))
(assert (= group_aml_ctf_plan_established false))
(assert (= policy_revision_mechanism_established false))
(assert (= control_environment_compliant false))
(assert (= risk_assessment_compliant false))
(assert (= control_activities_compliant false))
(assert (= information_communication_compliant false))
(assert (= monitoring_activities_compliant false))
(assert (= violate_article_51_internal_control true))
(assert (= violate_article_16_10 false))
(assert (= violate_article_16_1_2_9 false))
(assert (= violate_article_16_3 false))
(assert (= violate_article_16_5_reporting false))
(assert (= violate_article_16_6_pledge false))
(assert (= violate_article_16_7_exception false))
(assert (= violate_article_18_1 false))
(assert (= violate_article_38 false))
(assert (= violate_article_39_1 false))
(assert (= violate_article_39_2 false))
(assert (= violate_article_39_3 false))
(assert (= violate_article_40_41_ratio_disposal false))
(assert (= violate_article_42_1_confidentiality false))
(assert (= violate_article_43_1_2_4 false))
(assert (= violate_article_43_3_scope_management false))
(assert (= violate_article_45_1_4 false))
(assert (= violate_article_46_1_reporting false))
(assert (= violate_article_53_1_2_capital false))
(assert (= violate_article_53_3_capital_replenish false))
(assert (= violate_article_55_1_order false))
(assert (= violate_article_56_1_assistance false))
(assert (= violate_article_56_2_order false))
(assert (= violate_article_6_1 false))
(assert (= legal_compliance_violations true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= internal_audit_duties_compliant false))
(assert (= internal_control_components_compliant false))
(assert (= internal_control_scope_compliant false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 54
; Total facts: 54
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
