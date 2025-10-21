; SMT2 file generated from compliance case automatic
; Case ID: case_76
; Generated at: 2025-10-21T21:54:25.260862
;
; This file can be executed with Z3:
;   z3 case_76.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agency_scope_included Bool)
(declare-const agent_broker_license_required Bool)
(declare-const agent_broker_qualification_compliance Bool)
(declare-const agent_broker_regulations_applied Bool)
(declare-const agent_contract_mandatory_items_compliance Bool)
(declare-const agent_duty_of_care_and_disclosure Bool)
(declare-const agent_e_policy_contact_info_provided Bool)
(declare-const agent_internal_operation_compliance Bool)
(declare-const agent_prohibited_acts_compliance Bool)
(declare-const application_procedures_followed Bool)
(declare-const bank_agent_broker_permit_compliance Bool)
(declare-const bank_as_agent Bool)
(declare-const bank_as_broker Bool)
(declare-const bank_permitted Bool)
(declare-const board_supervisor_manager_qualifications_met Bool)
(declare-const branch_establishment_conditions_met Bool)
(declare-const breach_of_contract_liability_included Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_written_report_and_fee_disclosure Bool)
(declare-const commission_payment_method_included Bool)
(declare-const commission_payment_standard_included Bool)
(declare-const commission_payment_to_non_actual_agents Bool)
(declare-const compliance_with_laws_and_regulations Bool)
(declare-const conflict_of_interest_prevention_included Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const contract_party_names_included Bool)
(declare-const contract_period_included Bool)
(declare-const contract_termination_clause_included Bool)
(declare-const criminal_conviction_for_fraud_or_forgery Bool)
(declare-const deposit_bond_paid Bool)
(declare-const dismissal_reasons_complied Bool)
(declare-const dispute_resolution_clause_included Bool)
(declare-const disrupt_financial_order Bool)
(declare-const documents_retained Bool)
(declare-const duty_of_care_observed Bool)
(declare-const duty_of_fidelity_observed Bool)
(declare-const e_policy_issued Bool)
(declare-const education_training_completed Bool)
(declare-const employment_of_unqualified_personnel Bool)
(declare-const failure_to_appoint_agent_upon_resignation Bool)
(declare-const failure_to_cancel_license_within_deadline Bool)
(declare-const failure_to_confirm_suitability_for_elderly_clients Bool)
(declare-const failure_to_fill_out_recruitment_report_truthfully Bool)
(declare-const failure_to_report_to_agent_association Bool)
(declare-const false_information_on_license_application Bool)
(declare-const false_or_incomplete_business_or_financial_reports Bool)
(declare-const false_or_misleading_promotion Bool)
(declare-const fee_charged Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const financial_and_business_management_compliant Bool)
(declare-const financial_institution_account_included Bool)
(declare-const guarantee_insurance_purchased Bool)
(declare-const holding_positions_in_insurance_or_association Bool)
(declare-const illegal_insurance_claims Bool)
(declare-const improper_coercion_or_inducement Bool)
(declare-const improper_collection_of_money_or_benefits Bool)
(declare-const improper_commission_payment Bool)
(declare-const improper_inducement_to_cancel_or_loan Bool)
(declare-const inducement_to_terminate_or_loan_for_clients Bool)
(declare-const insured_and_applicant_contact_info_collected Bool)
(declare-const intentional_concealment_of_important_contract_info Bool)
(declare-const internal_operation_rules_established Bool)
(declare-const internal_operation_rules_executed Bool)
(declare-const is_agent_or_notary Bool)
(declare-const is_broker Bool)
(declare-const legal_compliance_clause_included Bool)
(declare-const liability_insurance_purchased Bool)
(declare-const license_certificate_held Bool)
(declare-const license_permitted Bool)
(declare-const license_revocation_procedures_followed Bool)
(declare-const main_content_and_rights_duties_fully_explained Bool)
(declare-const misappropriation_or_embezzlement Bool)
(declare-const operation_outside_license_scope Bool)
(declare-const other_acts_damaging_insurance_image Bool)
(declare-const other_mandatory_requirements_complied Bool)
(declare-const other_regulatory_requirements_included Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const penalty Bool)
(declare-const prohibited_acts_clause_included Bool)
(declare-const protection_of_elderly_consumer_rights_ensured Bool)
(declare-const qualification_conditions_met Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_compliance Bool)
(declare-const required_documents_submitted Bool)
(declare-const sale_of_unapproved_foreign_policy_discount_products Bool)
(declare-const unauthorized_delegation_or_operation Bool)
(declare-const unauthorized_insurance_agent_operation Bool)
(declare-const unauthorized_insurance_business_operation Bool)
(declare-const unauthorized_suspension_or_termination_of_business Bool)
(declare-const unauthorized_transfer_of_application_documents Bool)
(declare-const unauthorized_use_of_advertising_content Bool)
(declare-const unauthorized_use_of_license Bool)
(declare-const violate_business_management Bool)
(declare-const violate_financial_management Bool)
(declare-const violate_related_regulations Bool)
(declare-const violation_financial_or_business_management Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_license_required] 保險代理人、經紀人、公證人須經主管機關許可並繳存保證金及投保相關保險
(assert (= agent_broker_license_required
   (and license_permitted
        deposit_bond_paid
        related_insurance_purchased
        license_certificate_held)))

; [insurance:related_insurance_type_compliance] 保險代理人、公證人須投保責任保險；保險經紀人須投保責任保險及保證保險
(assert (= related_insurance_type_compliance
   (and (or liability_insurance_purchased (not is_agent_or_notary))
        (or (not is_broker)
            (and liability_insurance_purchased guarantee_insurance_purchased)))))

; [insurance:agent_broker_qualification_compliance] 保險代理人、經紀人、公證人資格取得及管理規則遵守
(assert (= agent_broker_qualification_compliance
   (and qualification_conditions_met
        application_procedures_followed
        required_documents_submitted
        board_supervisor_manager_qualifications_met
        dismissal_reasons_complied
        branch_establishment_conditions_met
        financial_and_business_management_compliant
        education_training_completed
        license_revocation_procedures_followed
        other_mandatory_requirements_complied)))

; [insurance:bank_agent_broker_permit_compliance] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_agent_broker_permit_compliance
   (and bank_permitted
        (or bank_as_agent bank_as_broker)
        agent_broker_regulations_applied)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and duty_of_care_observed duty_of_fidelity_observed)))

; [insurance:broker_written_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂契約前，應主動提供書面分析報告並明確告知報酬標準
(assert (= broker_written_report_and_fee_disclosure
   (and written_analysis_report_provided
        (or fee_standard_disclosed (not fee_charged)))))

; [insurance:violation_financial_or_business_management] 違反財務或業務管理規定應限期改正或處罰
(assert (= violation_financial_or_business_management
   (or violate_business_management
       violate_financial_management
       violate_related_regulations)))

; [insurance:agent_duty_of_care_and_disclosure] 個人執業代理人、代理人公司及銀行應盡善良管理人注意義務，充分說明保險商品主要內容與權利義務，並留存文件
(assert (= agent_duty_of_care_and_disclosure
   (and duty_of_care_observed
        main_content_and_rights_duties_fully_explained
        documents_retained)))

; [insurance:agent_e_policy_contact_info_provided] 以電子保單出單者，應取得要保人及被保險人聯絡方式並提供予承保保險人
(assert (= agent_e_policy_contact_info_provided
   (and e_policy_issued
        insured_and_applicant_contact_info_collected
        contact_info_provided_to_insurer)))

; [insurance:agent_internal_operation_compliance] 代理人公司及銀行應訂定並落實執行內部作業規範，確保遵循相關法令及保障高齡消費者權益
(assert (= agent_internal_operation_compliance
   (and internal_operation_rules_established
        internal_operation_rules_executed
        compliance_with_laws_and_regulations
        protection_of_elderly_consumer_rights_ensured)))

; [insurance:agent_prohibited_acts_compliance] 代理人及相關人員不得有保險代理人管理規則第49條所列禁止行為
(assert (= agent_prohibited_acts_compliance
   (and (not false_information_on_license_application)
        (not unauthorized_insurance_agent_operation)
        (not unauthorized_insurance_business_operation)
        (not intentional_concealment_of_important_contract_info)
        (not improper_coercion_or_inducement)
        (not false_or_misleading_promotion)
        (not improper_inducement_to_cancel_or_loan)
        (not misappropriation_or_embezzlement)
        (not unauthorized_use_of_license)
        (not criminal_conviction_for_fraud_or_forgery)
        (not operation_outside_license_scope)
        (not improper_collection_of_money_or_benefits)
        (not illegal_insurance_claims)
        (not disrupt_financial_order)
        (not unauthorized_delegation_or_operation)
        (not unauthorized_transfer_of_application_documents)
        (not employment_of_unqualified_personnel)
        (not failure_to_cancel_license_within_deadline)
        (not unauthorized_suspension_or_termination_of_business)
        (not failure_to_appoint_agent_upon_resignation)
        (not failure_to_report_to_agent_association)
        (not unauthorized_use_of_advertising_content)
        (not improper_commission_payment)
        (not commission_payment_to_non_actual_agents)
        (not failure_to_confirm_suitability_for_elderly_clients)
        (not sale_of_unapproved_foreign_policy_discount_products)
        (not false_or_incomplete_business_or_financial_reports)
        (not holding_positions_in_insurance_or_association)
        (not inducement_to_terminate_or_loan_for_clients)
        (not failure_to_fill_out_recruitment_report_truthfully)
        (not other_violations_of_rules_or_laws)
        (not other_acts_damaging_insurance_image))))

; [insurance:agent_contract_mandatory_items_compliance] 保險代理合約應包含法定至少十二項內容
(assert (= agent_contract_mandatory_items_compliance
   (and contract_party_names_included
        contract_period_included
        agency_scope_included
        commission_payment_standard_included
        commission_payment_method_included
        legal_compliance_clause_included
        prohibited_acts_clause_included
        conflict_of_interest_prevention_included
        breach_of_contract_liability_included
        dispute_resolution_clause_included
        contract_termination_clause_included
        financial_institution_account_included
        other_regulatory_requirements_included)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法定規定時處罰
(assert (= penalty
   (or violation_financial_or_business_management
       (not agent_contract_mandatory_items_compliance)
       (not agent_internal_operation_compliance)
       (not agent_e_policy_contact_info_provided)
       (not agent_duty_of_care_and_disclosure)
       (not broker_written_report_and_fee_disclosure)
       (not broker_duty_of_care_and_fidelity)
       (not related_insurance_type_compliance)
       (not bank_agent_broker_permit_compliance)
       (not agent_broker_qualification_compliance)
       (not agent_broker_license_required)
       (not agent_prohibited_acts_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= unauthorized_insurance_business_operation true))
(assert (= agent_broker_license_required false))
(assert (= agent_prohibited_acts_compliance false))
(assert (= violate_business_management true))
(assert (= violation_financial_or_business_management true))
(assert (= agent_broker_qualification_compliance false))
(assert (= qualification_conditions_met false))
(assert (= application_procedures_followed false))
(assert (= required_documents_submitted false))
(assert (= board_supervisor_manager_qualifications_met false))
(assert (= dismissal_reasons_complied false))
(assert (= branch_establishment_conditions_met false))
(assert (= financial_and_business_management_compliant false))
(assert (= education_training_completed false))
(assert (= license_revocation_procedures_followed false))
(assert (= other_mandatory_requirements_complied false))
(assert (= related_insurance_purchased false))
(assert (= related_insurance_type_compliance false))
(assert (= liability_insurance_purchased false))
(assert (= guarantee_insurance_purchased false))
(assert (= license_certificate_held false))
(assert (= agent_contract_mandatory_items_compliance false))
(assert (= contract_party_names_included false))
(assert (= contract_period_included false))
(assert (= agency_scope_included false))
(assert (= commission_payment_standard_included false))
(assert (= commission_payment_method_included false))
(assert (= legal_compliance_clause_included false))
(assert (= prohibited_acts_clause_included false))
(assert (= conflict_of_interest_prevention_included false))
(assert (= breach_of_contract_liability_included false))
(assert (= dispute_resolution_clause_included false))
(assert (= contract_termination_clause_included false))
(assert (= financial_institution_account_included false))
(assert (= other_regulatory_requirements_included false))
(assert (= agent_duty_of_care_and_disclosure false))
(assert (= duty_of_care_observed false))
(assert (= main_content_and_rights_duties_fully_explained false))
(assert (= documents_retained false))
(assert (= agent_e_policy_contact_info_provided false))
(assert (= e_policy_issued true))
(assert (= insured_and_applicant_contact_info_collected false))
(assert (= contact_info_provided_to_insurer false))
(assert (= agent_internal_operation_compliance false))
(assert (= internal_operation_rules_established false))
(assert (= internal_operation_rules_executed false))
(assert (= compliance_with_laws_and_regulations false))
(assert (= protection_of_elderly_consumer_rights_ensured false))
(assert (= false_information_on_license_application false))
(assert (= unauthorized_insurance_agent_operation false))
(assert (= intentional_concealment_of_important_contract_info true))
(assert (= improper_coercion_or_inducement false))
(assert (= false_or_misleading_promotion false))
(assert (= improper_inducement_to_cancel_or_loan false))
(assert (= misappropriation_or_embezzlement false))
(assert (= unauthorized_use_of_license false))
(assert (= criminal_conviction_for_fraud_or_forgery false))
(assert (= operation_outside_license_scope false))
(assert (= improper_collection_of_money_or_benefits false))
(assert (= illegal_insurance_claims false))
(assert (= disrupt_financial_order false))
(assert (= unauthorized_delegation_or_operation false))
(assert (= unauthorized_transfer_of_application_documents false))
(assert (= employment_of_unqualified_personnel false))
(assert (= failure_to_cancel_license_within_deadline false))
(assert (= unauthorized_suspension_or_termination_of_business false))
(assert (= failure_to_appoint_agent_upon_resignation false))
(assert (= failure_to_report_to_agent_association false))
(assert (= unauthorized_use_of_advertising_content false))
(assert (= improper_commission_payment false))
(assert (= commission_payment_to_non_actual_agents false))
(assert (= failure_to_confirm_suitability_for_elderly_clients false))
(assert (= sale_of_unapproved_foreign_policy_discount_products false))
(assert (= false_or_incomplete_business_or_financial_reports true))
(assert (= holding_positions_in_insurance_or_association false))
(assert (= inducement_to_terminate_or_loan_for_clients false))
(assert (= failure_to_fill_out_recruitment_report_truthfully false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= other_acts_damaging_insurance_image false))
(assert (= bank_permitted false))
(assert (= bank_as_agent false))
(assert (= bank_as_broker false))
(assert (= bank_agent_broker_permit_compliance false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= duty_of_fidelity_observed false))
(assert (= broker_written_report_and_fee_disclosure false))
(assert (= written_analysis_report_provided false))
(assert (= fee_charged false))
(assert (= fee_standard_disclosed false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 97
; Total facts: 91
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
