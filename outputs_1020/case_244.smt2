; SMT2 file generated from compliance case automatic
; Case ID: case_244
; Generated at: 2025-10-19T11:13:03.297095
;
; This file can be executed with Z3:
;   z3 case_244.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advertisement_and_promotion_management Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const compensation_and_risk_management Bool)
(declare-const customer_complaints_handling Bool)
(declare-const customer_needs_assessment Bool)
(declare-const document_control_and_storage Bool)
(declare-const fixed_office_and_accounting Bool)
(declare-const has_dedicated_accounting Bool)
(declare-const has_fixed_office Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const only_agent_license Bool)
(declare-const only_broker_license Bool)
(declare-const only_notary_license Bool)
(declare-const other_regulatory_requirements Bool)
(declare-const penalty Bool)
(declare-const pre_submission_check Bool)
(declare-const premium_collection_management Bool)
(declare-const product_information_disclosure Bool)
(declare-const qualification_and_scope_defined Bool)
(declare-const report_filing_and_verification Bool)
(declare-const single_license_only Bool)
(declare-const solicitation_handling_established Bool)
(declare-const solicitation_handling_executed Bool)
(declare-const solicitation_handling_minimum_requirements Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_compliance] 保險代理人公司或經紀人公司建立並確實執行內部控制、稽核制度及招攬處理制度
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_executed
        audit_system_established
        audit_system_executed
        solicitation_handling_established
        solicitation_handling_executed)))

; [insurance:single_license_only] 兼有保險代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license_only
   (or only_agent_license only_broker_license only_notary_license)))

; [insurance:fixed_office_and_accounting] 保險代理人、經紀人、公證人應有固定業務處所並專設帳簿記載業務收支
(assert (= fixed_office_and_accounting (and has_fixed_office has_dedicated_accounting)))

; [insurance:solicitation_handling_minimum_requirements] 招攬處理制度及程序至少包括11項規定（第7條）
(assert (= solicitation_handling_minimum_requirements
   (and qualification_and_scope_defined
        compensation_and_risk_management
        premium_collection_management
        product_information_disclosure
        advertisement_and_promotion_management
        customer_needs_assessment
        report_filing_and_verification
        pre_submission_check
        document_control_and_storage
        customer_complaints_handling
        other_regulatory_requirements)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：未建立或未確實執行內部控制、稽核制度或招攬處理制度，或兼有多重資格未擇一申領執業證照，或未有固定業務處所及專設帳簿時處罰
(assert (= penalty
   (or (not single_license_only)
       (not fixed_office_and_accounting)
       (not internal_control_compliance)
       (not solicitation_handling_minimum_requirements))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_established false))
(assert (= solicitation_handling_executed false))
(assert (= qualification_and_scope_defined false))
(assert (= compensation_and_risk_management false))
(assert (= premium_collection_management false))
(assert (= product_information_disclosure false))
(assert (= advertisement_and_promotion_management false))
(assert (= customer_needs_assessment false))
(assert (= report_filing_and_verification false))
(assert (= pre_submission_check false))
(assert (= document_control_and_storage false))
(assert (= customer_complaints_handling false))
(assert (= other_regulatory_requirements false))
(assert (= has_fixed_office true))
(assert (= has_dedicated_accounting true))
(assert (= only_agent_license true))
(assert (= only_broker_license false))
(assert (= only_notary_license false))
(assert (= fixed_office_and_accounting true))
(assert (= solicitation_handling_minimum_requirements false))
(assert (= internal_control_compliance false))
(assert (= single_license_only true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 27
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
