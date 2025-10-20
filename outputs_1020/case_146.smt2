; SMT2 file generated from compliance case automatic
; Case ID: case_146
; Generated at: 2025-10-19T09:16:38.551176
;
; This file can be executed with Z3:
;   z3 case_146.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advertisement_and_promotion_management_defined Bool)
(declare-const agent_rule_violation Bool)
(declare-const audit_committee_control_included Bool)
(declare-const audit_committee_established Bool)
(declare-const audit_committee_management_in_internal_control Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const authorization_of_third_party_to_operate Bool)
(declare-const compensation_and_risk_linkage_defined Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const conviction_for_fraud_or_breach_of_trust_or_forgery Bool)
(declare-const customer_complaint_handling_defined Bool)
(declare-const customer_needs_and_suitability_assessment_defined Bool)
(declare-const director_deregistration_done Bool)
(declare-const dismissal_of_manager_or_staff Bool)
(declare-const dismissal_or_suspension_of_director_or_supervisor Bool)
(declare-const disruption_of_financial_order_by_false_statements Bool)
(declare-const dissemination_of_false_information_disturbing_financial_order Bool)
(declare-const employment_of_unqualified_insurance_solicitors Bool)
(declare-const employment_of_unqualified_personnel Bool)
(declare-const failure_to_appoint_agent_after_resignation Bool)
(declare-const failure_to_appoint_agent_upon_agent_resignation Bool)
(declare-const failure_to_cancel_license_within_deadline Bool)
(declare-const failure_to_cancel_license_within_specified_deadlines Bool)
(declare-const failure_to_confirm_suitability_for_financial_consumers Bool)
(declare-const failure_to_fill_solicitation_report_truthfully Bool)
(declare-const failure_to_report_to_agent_association Bool)
(declare-const failure_to_report_to_association Bool)
(declare-const false_report_on_license_application Bool)
(declare-const holding_positions_in_insurance_or_association_conflicts Bool)
(declare-const improper_claims_handling Bool)
(declare-const improper_coercion_or_inducement Bool)
(declare-const improper_collection_of_money_or_benefits Bool)
(declare-const improper_commission_payment Bool)
(declare-const improper_commission_payment_to_non_actual_solicitors Bool)
(declare-const improper_inducement_to_cancel_or_transfer_policy Bool)
(declare-const improper_insurance_payment_methods Bool)
(declare-const inducement_to_cancel_or_terminate_contract_or_use_of_loans_or_deposits_to_pay_premiums Bool)
(declare-const internal_control_compliant Bool)
(declare-const internal_control_defined_by_business_nature_and_scale Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_reviewed_and_revised_timely Bool)
(declare-const misappropriation_or_embezzlement_of_premiums_or_claims Bool)
(declare-const misleading_advertisement_or_promotion Bool)
(declare-const notification_to_registration_authority Bool)
(declare-const operation_outside_license_scope Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_designated_matters_defined Bool)
(declare-const other_necessary_measures Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const pre_submission_check_mechanism_defined Bool)
(declare-const premium_collection_and_management_defined Bool)
(declare-const product_information_and_disclosure_defined Bool)
(declare-const property_insurance_solicitation Bool)
(declare-const qualification_and_training_defined Bool)
(declare-const restriction_of_business_scope Bool)
(declare-const sale_of_unapproved_foreign_policy_discount_benefits Bool)
(declare-const solicitation_document_control_and_storage_defined Bool)
(declare-const solicitation_handling_compliant Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)
(declare-const solicitation_report_exclusion Bool)
(declare-const solicitation_report_management_defined Bool)
(declare-const submission_of_false_or_incomplete_financial_or_business_reports Bool)
(declare-const unauthorized_advertisement_use Bool)
(declare-const unauthorized_business_suspension_or_resumption Bool)
(declare-const unauthorized_insurance_agent_operation Bool)
(declare-const unauthorized_insurance_business_operation Bool)
(declare-const unauthorized_operation_by_third_party Bool)
(declare-const unauthorized_policy_document_handling Bool)
(declare-const unauthorized_suspension_or_resumption_of_business Bool)
(declare-const unauthorized_transfer_of_policy_documents Bool)
(declare-const unauthorized_use_of_advertisement_content Bool)
(declare-const unauthorized_use_of_license Bool)
(declare-const violation_167_2 Bool)
(declare-const violation_167_3 Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_occurred] 保險代理人、經紀人、公證人違反法令或有礙健全經營
(assert violation_occurred)

; [insurance:penalty_measures] 主管機關可採取處分措施
(assert (= penalty_measures
   (or dismissal_of_manager_or_staff
       dismissal_or_suspension_of_director_or_supervisor
       restriction_of_business_scope
       other_necessary_measures)))

; [insurance:director_deregistration] 解除董事或監察人職務時通知主管機關註銷登記
(assert (= director_deregistration_done
   (or notification_to_registration_authority
       (not dismissal_or_suspension_of_director_or_supervisor))))

; [insurance:violation_167_2] 違反財務或業務管理規定或相關規定
(assert violation_167_2)

; [insurance:violation_167_3] 未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序
(assert (= violation_167_3
   (or (not solicitation_handling_system_executed)
       (not solicitation_handling_system_established)
       (not audit_system_established)
       (not internal_control_executed)
       (not audit_system_executed)
       (not internal_control_established))))

; [insurance:agent_rule_violation] 保險代理人管理規則第49條違反行為
(assert (= agent_rule_violation
   (or improper_claims_handling
       unauthorized_business_suspension_or_resumption
       unauthorized_insurance_business_operation
       improper_collection_of_money_or_benefits
       improper_coercion_or_inducement
       employment_of_unqualified_personnel
       operation_outside_license_scope
       unauthorized_transfer_of_policy_documents
       failure_to_cancel_license_within_specified_deadlines
       unauthorized_insurance_agent_operation
       improper_insurance_payment_methods
       unauthorized_policy_document_handling
       misleading_advertisement_or_promotion
       sale_of_unapproved_foreign_policy_discount_benefits
       conceal_important_contract_info
       authorization_of_third_party_to_operate
       other_behaviors_damaging_insurance_image
       submission_of_false_or_incomplete_financial_or_business_reports
       false_report_on_license_application
       unauthorized_advertisement_use
       unauthorized_operation_by_third_party
       inducement_to_cancel_or_terminate_contract_or_use_of_loans_or_deposits_to_pay_premiums
       holding_positions_in_insurance_or_association_conflicts
       failure_to_cancel_license_within_deadline
       employment_of_unqualified_insurance_solicitors
       improper_inducement_to_cancel_or_transfer_policy
       dissemination_of_false_information_disturbing_financial_order
       failure_to_report_to_association
       disruption_of_financial_order_by_false_statements
       failure_to_appoint_agent_upon_agent_resignation
       failure_to_fill_solicitation_report_truthfully
       improper_commission_payment
       unauthorized_use_of_advertisement_content
       failure_to_report_to_agent_association
       failure_to_appoint_agent_after_resignation
       conviction_for_fraud_or_breach_of_trust_or_forgery
       other_violations_of_rules_or_laws
       misappropriation_or_embezzlement_of_premiums_or_claims
       unauthorized_suspension_or_resumption_of_business
       failure_to_confirm_suitability_for_financial_consumers
       unauthorized_use_of_license
       improper_commission_payment_to_non_actual_solicitors)))

; [insurance:internal_control_requirements] 內部控制制度應依業務性質及規模訂定並適時檢討修訂
(assert (= internal_control_compliant
   (and internal_control_defined_by_business_nature_and_scale
        internal_control_reviewed_and_revised_timely)))

; [insurance:audit_committee_requirement] 設置審計委員會者，內部控制制度應包括審計委員會議事運作管理
(assert (= audit_committee_control_included
   (or (not audit_committee_established)
       audit_committee_management_in_internal_control)))

; [insurance:solicitation_handling_minimum_requirements] 招攬處理制度及程序至少應包括規定項目
(assert (= solicitation_handling_compliant
   (and qualification_and_training_defined
        compensation_and_risk_linkage_defined
        premium_collection_and_management_defined
        product_information_and_disclosure_defined
        advertisement_and_promotion_management_defined
        customer_needs_and_suitability_assessment_defined
        solicitation_report_management_defined
        pre_submission_check_mechanism_defined
        solicitation_document_control_and_storage_defined
        customer_complaint_handling_defined
        other_designated_matters_defined)))

; [insurance:solicitation_report_exclusion_for_property_insurance] 招攬財產保險時不適用招攬報告書管理規定
(assert (= solicitation_report_exclusion
   (or (not property_insurance_solicitation)
       (not solicitation_report_management_defined))))

; [meta:penalty_default_false] 預設不處罰
(assert (or (not penalty)
    (not (and (not violation_occurred)
              (not violation_167_2)
              (not violation_167_3)
              (not agent_rule_violation)))))

; [meta:penalty_conditions] 處罰條件：違反相關法令或管理規定時處罰
(assert (let ((a!1 (or violation_167_3
               (and violation_occurred
                    (not (or dismissal_of_manager_or_staff
                             dismissal_or_suspension_of_director_or_supervisor
                             restriction_of_business_scope
                             other_necessary_measures)))
               agent_rule_violation
               violation_167_2)))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_occurred true))
(assert (= violation_167_2 true))
(assert (= violation_167_3 true))
(assert (= agent_rule_violation true))
(assert (= failure_to_confirm_suitability_for_financial_consumers true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_established false))
(assert (= solicitation_handling_system_executed false))
(assert (= failure_to_fill_solicitation_report_truthfully true))
(assert (= product_information_and_disclosure_defined false))
(assert (= customer_needs_and_suitability_assessment_defined false))
(assert (= customer_complaint_handling_defined false))
(assert (= advertisement_and_promotion_management_defined false))
(assert (= qualification_and_training_defined false))
(assert (= compensation_and_risk_linkage_defined false))
(assert (= premium_collection_and_management_defined false))
(assert (= solicitation_report_management_defined false))
(assert (= pre_submission_check_mechanism_defined false))
(assert (= solicitation_document_control_and_storage_defined false))
(assert (= other_designated_matters_defined false))
(assert (= restriction_of_business_scope false))
(assert (= dismissal_of_manager_or_staff false))
(assert (= dismissal_or_suspension_of_director_or_supervisor false))
(assert (= other_necessary_measures false))
(assert (= penalty_measures false))
(assert (= audit_committee_control_included false))
(assert (= audit_committee_established false))
(assert (= audit_committee_management_in_internal_control false))
(assert (= authorization_of_third_party_to_operate false))
(assert (= conceal_important_contract_info false))
(assert (= conviction_for_fraud_or_breach_of_trust_or_forgery false))
(assert (= director_deregistration_done false))
(assert (= disruption_of_financial_order_by_false_statements false))
(assert (= dissemination_of_false_information_disturbing_financial_order false))
(assert (= employment_of_unqualified_insurance_solicitors false))
(assert (= employment_of_unqualified_personnel false))
(assert (= failure_to_appoint_agent_after_resignation false))
(assert (= failure_to_appoint_agent_upon_agent_resignation false))
(assert (= failure_to_cancel_license_within_deadline false))
(assert (= failure_to_cancel_license_within_specified_deadlines false))
(assert (= failure_to_report_to_agent_association false))
(assert (= failure_to_report_to_association false))
(assert (= false_report_on_license_application false))
(assert (= holding_positions_in_insurance_or_association_conflicts false))
(assert (= improper_claims_handling false))
(assert (= improper_coercion_or_inducement false))
(assert (= improper_collection_of_money_or_benefits false))
(assert (= improper_commission_payment false))
(assert (= improper_commission_payment_to_non_actual_solicitors false))
(assert (= improper_inducement_to_cancel_or_transfer_policy false))
(assert (= improper_insurance_payment_methods false))
(assert (= inducement_to_cancel_or_terminate_contract_or_use_of_loans_or_deposits_to_pay_premiums false))
(assert (= internal_control_compliant false))
(assert (= internal_control_defined_by_business_nature_and_scale false))
(assert (= internal_control_reviewed_and_revised_timely false))
(assert (= misappropriation_or_embezzlement_of_premiums_or_claims false))
(assert (= misleading_advertisement_or_promotion false))
(assert (= notification_to_registration_authority false))
(assert (= operation_outside_license_scope false))
(assert (= other_behaviors_damaging_insurance_image false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= penalty false))
(assert (= property_insurance_solicitation false))
(assert (= sale_of_unapproved_foreign_policy_discount_benefits false))
(assert (= solicitation_handling_compliant false))
(assert (= solicitation_report_exclusion false))
(assert (= submission_of_false_or_incomplete_financial_or_business_reports false))
(assert (= unauthorized_advertisement_use false))
(assert (= unauthorized_business_suspension_or_resumption false))
(assert (= unauthorized_insurance_agent_operation false))
(assert (= unauthorized_insurance_business_operation false))
(assert (= unauthorized_operation_by_third_party false))
(assert (= unauthorized_policy_document_handling false))
(assert (= unauthorized_suspension_or_resumption_of_business false))
(assert (= unauthorized_transfer_of_policy_documents false))
(assert (= unauthorized_use_of_advertisement_content false))
(assert (= unauthorized_use_of_license false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 80
; Total facts: 80
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
