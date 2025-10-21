; SMT2 file generated from compliance case automatic
; Case ID: case_113
; Generated at: 2025-10-21T01:59:31.614462
;
; This file can be executed with Z3:
;   z3 case_113.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_plan_prepared Bool)
(declare-const business_strategy_planned Bool)
(declare-const contract_terms_compliance Bool)
(declare-const contract_terms_content_level Bool)
(declare-const engaging_in_business_without_approval Bool)
(declare-const execution_guidelines_prepared Bool)
(declare-const external_financial_reporting_compliant Bool)
(declare-const financial_statements_gaap_compliant Bool)
(declare-const foreign_cooperation_without_approval Bool)
(declare-const guidelines_planned Bool)
(declare-const illegal_foreign_cooperation Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_objectives_met Bool)
(declare-const internal_control_system_effective Bool)
(declare-const internal_control_system_established Bool)
(declare-const legal_and_regulatory_compliance_met Bool)
(declare-const operational_effectiveness_and_efficiency_met Bool)
(declare-const overall_strategy_planned Bool)
(declare-const penalty Bool)
(declare-const reporting_reliability_timeliness_transparency_met Bool)
(declare-const representative_illegal_conduct Bool)
(declare-const representative_involved Bool)
(declare-const risk_management_policy_planned Bool)
(declare-const risk_management_procedures_prepared Bool)
(declare-const standard_contract_terms_level Bool)
(declare-const transactions_properly_approved Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [electronic_payment:contract_terms_compliance] 電子支付機構業務定型化契約條款內容不得低於主管機關範本
(assert (= contract_terms_compliance
   (and (or standard_contract_terms_level (not contract_terms_content_level))
        (or contract_terms_content_level (not standard_contract_terms_level)))))

; [electronic_payment:internal_control_established] 建立內部控制制度且持續有效執行
(assert (= internal_control_established
   (and internal_control_system_established internal_control_system_effective)))

; [electronic_payment:business_strategy_planned] 規劃整體經營策略、風險管理政策及指導準則，並擬定經營計畫、風險管理程序及執行準則
(assert (= business_strategy_planned
   (and overall_strategy_planned
        risk_management_policy_planned
        guidelines_planned
        business_plan_prepared
        risk_management_procedures_prepared
        execution_guidelines_prepared)))

; [electronic_payment:internal_control_objectives_met] 內部控制達成營運效果及效率、報導可靠性及法令遵循目標
(assert (= internal_control_objectives_met
   (and operational_effectiveness_and_efficiency_met
        reporting_reliability_timeliness_transparency_met
        legal_and_regulatory_compliance_met)))

; [electronic_payment:external_financial_reporting_compliant] 外部財務報導符合一般公認會計原則及交易適當核准
(assert (= external_financial_reporting_compliant
   (and financial_statements_gaap_compliant transactions_properly_approved)))

; [electronic_payment:illegal_foreign_cooperation] 未經主管機關核准與境外機構合作或協助其於我國境內從事業務
(assert (= illegal_foreign_cooperation
   (and foreign_cooperation_without_approval
        engaging_in_business_without_approval)))

; [electronic_payment:representative_illegal_conduct] 法人代表人、代理人、受僱人或其他從業人員因執行業務犯非法合作罪
(assert (= representative_illegal_conduct
   (and illegal_foreign_cooperation representative_involved)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反未經核准與境外機構合作或協助其於我國境內從事業務者處罰
(assert (= penalty (or illegal_foreign_cooperation representative_illegal_conduct)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established true))
(assert (= internal_control_system_effective false))
(assert (= internal_control_established false))
(assert (= business_plan_prepared false))
(assert (= overall_strategy_planned false))
(assert (= risk_management_policy_planned false))
(assert (= guidelines_planned false))
(assert (= risk_management_procedures_prepared false))
(assert (= execution_guidelines_prepared false))
(assert (= business_strategy_planned false))
(assert (= contract_terms_content_level false))
(assert (= standard_contract_terms_level false))
(assert (= contract_terms_compliance false))
(assert (= financial_statements_gaap_compliant true))
(assert (= transactions_properly_approved false))
(assert (= external_financial_reporting_compliant false))
(assert (= legal_and_regulatory_compliance_met false))
(assert (= operational_effectiveness_and_efficiency_met false))
(assert (= reporting_reliability_timeliness_transparency_met false))
(assert (= internal_control_objectives_met false))
(assert (= foreign_cooperation_without_approval false))
(assert (= engaging_in_business_without_approval false))
(assert (= illegal_foreign_cooperation false))
(assert (= representative_involved false))
(assert (= representative_illegal_conduct false))
(assert (= penalty false))

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
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
