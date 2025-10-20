; SMT2 file generated from compliance case automatic
; Case ID: case_323
; Generated at: 2025-10-19T13:09:04.883026
;
; This file can be executed with Z3:
;   z3 case_323.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const act_144_actuarial_staff_assigned Bool)
(declare-const act_144_board_approval_obtained Bool)
(declare-const act_144_external_review_actuary_hired Bool)
(declare-const act_144_reports_fair_and_true Bool)
(declare-const act_148_3_internal_control_established Bool)
(declare-const act_148_3_internal_handling_established Bool)
(declare-const act_171_1_violate_internal_control Bool)
(declare-const act_171_1_violate_internal_handling Bool)
(declare-const actuarial_staff_hired Bool)
(declare-const actuarial_staff_reviewed Bool)
(declare-const applicant_and_insured_identity_confirmed Bool)
(declare-const basic_customer_data_collected Bool)
(declare-const beneficiary_confirmation_procedure Bool)
(declare-const claims_staff_reviewed Bool)
(declare-const contract_change_and_signature_procedure Bool)
(declare-const customer_eligibility_assessed Bool)
(declare-const external_review_actuary_board_approved Bool)
(declare-const external_review_actuary_hired Bool)
(declare-const external_review_report_fair_and_true Bool)
(declare-const false_or_misleading_promotion Bool)
(declare-const gm_or_authorized_manager_reviewed Bool)
(declare-const induce_contract_termination_or_loan_payment Bool)
(declare-const induce_violation_of_disclosure Bool)
(declare-const insurance_amount_and_premium_assessed Bool)
(declare-const insurance_needs_assessed Bool)
(declare-const insurance_purpose_and_needs_assessed Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_sales_procedure_defined Bool)
(declare-const internet_only_insurance_restrictions Bool)
(declare-const investment_staff_reviewed Bool)
(declare-const legal_staff_reviewed Bool)
(declare-const mispricing_or_improper_discount Bool)
(declare-const no_appropriateness_confirmation_for_seniors Bool)
(declare-const no_backdated_policy Bool)
(declare-const no_brokers Bool)
(declare-const no_damaging_behavior_to_insured Bool)
(declare-const no_insurance_agents Bool)
(declare-const no_unassessed_appropriateness Bool)
(declare-const no_unqualified_underwriting Bool)
(declare-const other_damaging_behavior_to_customers Bool)
(declare-const other_regulatory_compliance Bool)
(declare-const penalty Bool)
(declare-const personal_data_preservation_procedure Bool)
(declare-const policy_service_staff_reviewed Bool)
(declare-const post_sale_customer_contact_and_recording Bool)
(declare-const post_sale_record_retention_period_met Bool)
(declare-const premium_source_assessed Bool)
(declare-const product_sales_precheck_responsibilities Bool)
(declare-const proper_financial_underwriting_and_reporting Bool)
(declare-const proper_signature_and_evidence_reviewed Bool)
(declare-const recording_and_review_includes_required_items Bool)
(declare-const recording_and_review_of_sales_process Bool)
(declare-const recording_and_review_retention_period_met Bool)
(declare-const risk_and_premium_based_on_actuarial_data Bool)
(declare-const risk_management_staff_reviewed Bool)
(declare-const senior_customer_ability_assessed Bool)
(declare-const senior_customer_appropriateness_assessed Bool)
(declare-const signing_actuary_assigned Bool)
(declare-const signing_actuary_board_approved Bool)
(declare-const signing_actuary_report_fair_and_true Bool)
(declare-const underwriting_procedure_compliance Bool)
(declare-const underwriting_process_defined Bool)
(declare-const underwriting_staff_qualification_defined Bool)
(declare-const underwriting_staff_reviewed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:act_144_actuarial_staff_assigned] 保險業聘用精算人員並指派簽證精算人員
(assert (= act_144_actuarial_staff_assigned
   (and actuarial_staff_hired signing_actuary_assigned)))

; [insurance:act_144_external_review_actuary_hired] 保險業聘請外部複核精算人員
(assert (= act_144_external_review_actuary_hired external_review_actuary_hired))

; [insurance:act_144_board_approval_obtained] 簽證精算人員指派及外部複核精算人員聘請經董（理）事會同意
(assert (= act_144_board_approval_obtained
   (and signing_actuary_board_approved external_review_actuary_board_approved)))

; [insurance:act_144_reports_fair_and_true] 簽證報告及複核報告內容公正且無虛偽隱匿遺漏錯誤
(assert (= act_144_reports_fair_and_true
   (and signing_actuary_report_fair_and_true
        external_review_report_fair_and_true)))

; [insurance:act_148_3_internal_control_established] 保險業建立內部控制及稽核制度
(assert (= act_148_3_internal_control_established
   internal_control_and_audit_system_established))

; [insurance:act_148_3_internal_handling_established] 保險業建立內部處理制度及程序
(assert (= act_148_3_internal_handling_established internal_handling_system_established))

; [insurance:act_171_1_violate_internal_control] 違反第148-3條第一項規定，未建立或未執行內部控制或稽核制度
(assert (not (= act_148_3_internal_control_established
        act_171_1_violate_internal_control)))

; [insurance:act_171_1_violate_internal_handling] 違反第148-3條第二項規定，未建立或未執行內部處理制度或程序
(assert (not (= act_148_3_internal_handling_established
        act_171_1_violate_internal_handling)))

; [insurance:product_sales_precheck_responsibilities] 保險商品銷售前各職務負責檢視項目完成
(assert (= product_sales_precheck_responsibilities
   (and gm_or_authorized_manager_reviewed
        underwriting_staff_reviewed
        claims_staff_reviewed
        actuarial_staff_reviewed
        policy_service_staff_reviewed
        legal_staff_reviewed
        investment_staff_reviewed
        risk_management_staff_reviewed)))

; [insurance:underwriting_procedure_compliance] 保險業訂定核保處理制度及程序符合規定
(assert (= underwriting_procedure_compliance
   (and underwriting_staff_qualification_defined
        underwriting_process_defined
        insurance_needs_assessed
        insurance_amount_and_premium_assessed
        senior_customer_appropriateness_assessed
        premium_source_assessed
        applicant_and_insured_identity_confirmed
        beneficiary_confirmation_procedure
        contract_change_and_signature_procedure
        personal_data_preservation_procedure
        risk_and_premium_based_on_actuarial_data
        no_unqualified_underwriting
        no_unassessed_appropriateness
        no_backdated_policy
        proper_signature_and_evidence_reviewed
        proper_financial_underwriting_and_reporting
        no_damaging_behavior_to_insured
        other_regulatory_compliance)))

; [insurance:internet_only_insurance_restrictions] 純網路保險公司不得有保險業務員及相關限制
(assert (= internet_only_insurance_restrictions
   (and no_insurance_agents
        no_brokers
        internal_sales_procedure_defined
        basic_customer_data_collected
        customer_eligibility_assessed
        insurance_purpose_and_needs_assessed
        premium_source_assessed
        senior_customer_ability_assessed
        (not mispricing_or_improper_discount)
        (not false_or_misleading_promotion)
        (not induce_contract_termination_or_loan_payment)
        (not induce_violation_of_disclosure)
        (not no_appropriateness_confirmation_for_seniors)
        (not other_damaging_behavior_to_customers)
        recording_and_review_of_sales_process
        recording_and_review_includes_required_items
        recording_and_review_retention_period_met
        post_sale_customer_contact_and_recording
        post_sale_record_retention_period_met
        other_regulatory_compliance)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法定規定時處罰
(assert (= penalty
   (or (not act_148_3_internal_handling_established)
       (not act_144_actuarial_staff_assigned)
       (not act_144_board_approval_obtained)
       (not internet_only_insurance_restrictions)
       (not act_148_3_internal_control_established)
       (not underwriting_procedure_compliance)
       (not act_144_reports_fair_and_true)
       (not act_144_external_review_actuary_hired))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= actuarial_staff_hired false))
(assert (= signing_actuary_assigned false))
(assert (= external_review_actuary_hired false))
(assert (= signing_actuary_board_approved false))
(assert (= external_review_actuary_board_approved false))
(assert (= signing_actuary_report_fair_and_true false))
(assert (= external_review_report_fair_and_true false))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_handling_system_established false))
(assert (= gm_or_authorized_manager_reviewed false))
(assert (= underwriting_staff_reviewed false))
(assert (= claims_staff_reviewed false))
(assert (= actuarial_staff_reviewed false))
(assert (= policy_service_staff_reviewed false))
(assert (= legal_staff_reviewed false))
(assert (= investment_staff_reviewed false))
(assert (= risk_management_staff_reviewed false))
(assert (= underwriting_staff_qualification_defined false))
(assert (= underwriting_process_defined false))
(assert (= insurance_needs_assessed false))
(assert (= insurance_amount_and_premium_assessed false))
(assert (= senior_customer_appropriateness_assessed false))
(assert (= premium_source_assessed false))
(assert (= applicant_and_insured_identity_confirmed false))
(assert (= beneficiary_confirmation_procedure false))
(assert (= contract_change_and_signature_procedure false))
(assert (= personal_data_preservation_procedure false))
(assert (= risk_and_premium_based_on_actuarial_data false))
(assert (= no_unqualified_underwriting false))
(assert (= no_unassessed_appropriateness false))
(assert (= no_backdated_policy false))
(assert (= proper_signature_and_evidence_reviewed false))
(assert (= proper_financial_underwriting_and_reporting false))
(assert (= no_damaging_behavior_to_insured false))
(assert (= other_regulatory_compliance false))
(assert (= no_insurance_agents true))
(assert (= no_brokers true))
(assert (= internal_sales_procedure_defined true))
(assert (= basic_customer_data_collected true))
(assert (= customer_eligibility_assessed true))
(assert (= insurance_purpose_and_needs_assessed true))
(assert (= senior_customer_ability_assessed true))
(assert (= mispricing_or_improper_discount false))
(assert (= false_or_misleading_promotion false))
(assert (= induce_contract_termination_or_loan_payment false))
(assert (= induce_violation_of_disclosure false))
(assert (= no_appropriateness_confirmation_for_seniors false))
(assert (= other_damaging_behavior_to_customers false))
(assert (= recording_and_review_of_sales_process true))
(assert (= recording_and_review_includes_required_items true))
(assert (= recording_and_review_retention_period_met true))
(assert (= post_sale_customer_contact_and_recording true))
(assert (= post_sale_record_retention_period_met true))
(assert (= internet_only_insurance_restrictions true))
(assert (= act_144_actuarial_staff_assigned false))
(assert (= act_144_board_approval_obtained false))
(assert (= act_144_external_review_actuary_hired false))
(assert (= act_144_reports_fair_and_true false))
(assert (= act_148_3_internal_control_established false))
(assert (= act_148_3_internal_handling_established false))
(assert (= act_171_1_violate_internal_control false))
(assert (= act_171_1_violate_internal_handling false))
(assert (= penalty false))
(assert (= product_sales_precheck_responsibilities false))
(assert (= underwriting_procedure_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 65
; Total facts: 65
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
