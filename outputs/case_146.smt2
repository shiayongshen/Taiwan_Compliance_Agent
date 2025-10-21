; SMT2 file generated from compliance case automatic
; Case ID: case_146
; Generated at: 2025-10-21T21:58:10.938185
;
; This file can be executed with Z3:
;   z3 case_146.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advertisement_and_promotion_management Bool)
(declare-const agent_misconduct_49 Bool)
(declare-const audit_committee_control_6 Bool)
(declare-const audit_committee_established Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const authorize_third_party_to_operate Bool)
(declare-const collect_illegal_fees_or_benefits Bool)
(declare-const compensation_and_risk_linkage Bool)
(declare-const conceal_important_insurance_contract_info Bool)
(declare-const convicted_of_fraud_or_breach_of_trust_or_forgery Bool)
(declare-const customer_complaints_handling Bool)
(declare-const customer_needs_and_suitability_assessment Bool)
(declare-const dismiss_director_or_supervisor_or_suspend_duties Bool)
(declare-const dismiss_manager_or_staff Bool)
(declare-const employ_unqualified_insurance_solicitors Bool)
(declare-const fail_to_appoint_agent_upon_agent_resignation Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_suitability_for_financial_consumers Bool)
(declare-const fail_to_fill_solicitation_report_truthfully Bool)
(declare-const fail_to_report_to_agent_trade_association Bool)
(declare-const false_report_on_license_application Bool)
(declare-const hold_positions_in_insurance_or_association_while_registered_as_agent Bool)
(declare-const illegal_insurance_claims Bool)
(declare-const improper_coercion_or_inducement Bool)
(declare-const improper_inducement_to_cancel_or_transfer_policy Bool)
(declare-const induce_clients_to_cancel_or_terminate_contracts Bool)
(declare-const insurance_product_information_disclosure Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_includes_audit_committee_management Bool)
(declare-const internal_control_requirements_6 Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_reviewed_and_revised Bool)
(declare-const misappropriation_or_embezzlement_of_premiums_or_claims Bool)
(declare-const misleading_advertisement_or_promotion Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_matters_designated_by_authority Bool)
(declare-const other_necessary_measures Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_solicitors Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const personnel_qualification_and_management Bool)
(declare-const pre_submission_check_mechanism Bool)
(declare-const premium_collection_and_management Bool)
(declare-const restrict_business_scope Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const solicitation_document_control_and_storage Bool)
(declare-const solicitation_handling_exclusion_property_insurance_7 Bool)
(declare-const solicitation_handling_minimum_requirements_7 Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)
(declare-const soliciting_property_insurance Bool)
(declare-const spread_false_information_disturbing_financial_order Bool)
(declare-const submit_false_or_incomplete_business_or_financial_reports Bool)
(declare-const transfer_policy_documents_to_unauthorized_agents Bool)
(declare-const truthful_solicitation_report_management Bool)
(declare-const unauthorized_insurance_agent_operation Bool)
(declare-const unauthorized_insurance_business_operation Bool)
(declare-const unauthorized_suspension_or_resumption_of_business Bool)
(declare-const unauthorized_use_of_insurance_related_advertisement Bool)
(declare-const unauthorized_use_of_license Bool)
(declare-const violate_163_4_financial_or_business_management Bool)
(declare-const violate_163_5_applied_165_1 Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1 Bool)
(declare-const violation_167_2 Bool)
(declare-const violation_167_3 Bool)
(declare-const violation_flag Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_occurred] 保險代理人、經紀人、公證人違反法令或有礙健全經營
(assert (= violation_occurred violation_flag))

; [insurance:penalty_measures] 主管機關可依情節輕重採取處分措施
(assert (= penalty_measures
   (or dismiss_director_or_supervisor_or_suspend_duties
       other_necessary_measures
       restrict_business_scope
       dismiss_manager_or_staff)))

; [insurance:violation_167_2] 違反保險法第163條相關財務或業務管理規定
(assert (= violation_167_2
   (or violate_165_1
       violate_163_5_applied_165_1
       violate_163_7
       violate_163_4_financial_or_business_management)))

; [insurance:violation_167_3] 違反未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序
(assert (= violation_167_3
   (or (not audit_system_executed)
       (not internal_control_executed)
       (not solicitation_handling_system_established)
       (not internal_control_established)
       (not solicitation_handling_system_executed)
       (not audit_system_established))))

; [insurance:agent_misconduct_49] 保險代理人管理規則第49條列舉之違規行為
(assert (= agent_misconduct_49
   (or transfer_policy_documents_to_unauthorized_agents
       fail_to_cancel_license_within_deadline
       false_report_on_license_application
       misleading_advertisement_or_promotion
       fail_to_fill_solicitation_report_truthfully
       collect_illegal_fees_or_benefits
       unauthorized_use_of_license
       fail_to_report_to_agent_trade_association
       other_violations_of_rules_or_laws
       convicted_of_fraud_or_breach_of_trust_or_forgery
       operate_outside_license_scope
       other_behaviors_damaging_insurance_image
       sell_unapproved_foreign_policy_discount_products
       improper_inducement_to_cancel_or_transfer_policy
       pay_commission_to_non_actual_solicitors
       employ_unqualified_insurance_solicitors
       spread_false_information_disturbing_financial_order
       authorize_third_party_to_operate
       submit_false_or_incomplete_business_or_financial_reports
       improper_coercion_or_inducement
       unauthorized_insurance_agent_operation
       unauthorized_suspension_or_resumption_of_business
       illegal_insurance_claims
       hold_positions_in_insurance_or_association_while_registered_as_agent
       fail_to_confirm_suitability_for_financial_consumers
       induce_clients_to_cancel_or_terminate_contracts
       misappropriation_or_embezzlement_of_premiums_or_claims
       unauthorized_use_of_insurance_related_advertisement
       conceal_important_insurance_contract_info
       fail_to_appoint_agent_upon_agent_resignation
       unauthorized_insurance_business_operation)))

; [insurance:internal_control_requirements_6] 保險代理人公司等應依業務性質及規模訂定內部控制及招攬處理制度並適時檢討修訂
(assert (= internal_control_requirements_6
   (and internal_control_system_established
        solicitation_handling_system_established
        internal_control_system_reviewed_and_revised)))

; [insurance:audit_committee_control_6] 設置審計委員會者，內部控制制度應包括審計委員會議事運作管理
(assert (= audit_committee_control_6
   (or internal_control_includes_audit_committee_management
       (not audit_committee_established))))

; [insurance:solicitation_handling_minimum_requirements_7] 招攬處理制度及程序至少應包括第7條規定之11項內容
(assert (= solicitation_handling_minimum_requirements_7
   (and personnel_qualification_and_management
        compensation_and_risk_linkage
        premium_collection_and_management
        insurance_product_information_disclosure
        advertisement_and_promotion_management
        customer_needs_and_suitability_assessment
        truthful_solicitation_report_management
        pre_submission_check_mechanism
        solicitation_document_control_and_storage
        customer_complaints_handling
        other_matters_designated_by_authority)))

; [insurance:solicitation_handling_exclusion_property_insurance_7] 第7條第七款規定於招攬財產保險時不適用
(assert (= solicitation_handling_exclusion_property_insurance_7
   (or (not soliciting_property_insurance)
       (not truthful_solicitation_report_management))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法令或規定時處罰
(assert (= penalty
   (or violation_167_3
       violation_occurred
       (not audit_committee_control_6)
       agent_misconduct_49
       (not internal_control_requirements_6)
       (not solicitation_handling_minimum_requirements_7)
       violation_167_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= fail_to_confirm_suitability_for_financial_consumers true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_established false))
(assert (= solicitation_handling_system_executed false))
(assert (= agent_misconduct_49 true))
(assert (= customer_needs_and_suitability_assessment false))
(assert (= truthful_solicitation_report_management false))
(assert (= advertisement_and_promotion_management false))
(assert (= customer_complaints_handling false))
(assert (= internal_control_system_established false))
(assert (= solicitation_handling_minimum_requirements_7 false))
(assert (= penalty_measures false))
(assert (= restrict_business_scope false))
(assert (= dismiss_manager_or_staff false))
(assert (= dismiss_director_or_supervisor_or_suspend_duties false))
(assert (= other_necessary_measures false))
(assert (= violation_occurred true))
(assert (= violation_167_2 false))
(assert (= violation_167_3 true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 72
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
