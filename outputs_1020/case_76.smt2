; SMT2 file generated from compliance case automatic
; Case ID: case_76
; Generated at: 2025-10-19T07:19:36.900101
;
; This file can be executed with Z3:
;   z3 case_76.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_license_required Bool)
(declare-const agent_broker_qualification_conditions Bool)
(declare-const agent_broker_regulations_applied Bool)
(declare-const agent_company_and_bank_internal_operation_compliance Bool)
(declare-const agent_contract_must_include_required_items Bool)
(declare-const agent_duty_of_care_and_information_disclosure Bool)
(declare-const agent_must_obtain_contact_info_for_e_policy Bool)
(declare-const agent_prohibited_behaviors Bool)
(declare-const agent_type Bool)
(declare-const application_procedure_followed Bool)
(declare-const authorize_others_to_operate Bool)
(declare-const bank_license_permitted Bool)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permitted_to_operate_agent_or_broker Bool)
(declare-const board_and_manager_qualifications_met Bool)
(declare-const branch_establishment_conditions_met Bool)
(declare-const breach_of_contract_liability_included Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_must_provide_written_analysis_report Bool)
(declare-const broker_receives_compensation Bool)
(declare-const coerce_or_induce_contract Bool)
(declare-const collect_illegal_commission_or_benefit Bool)
(declare-const commission_payment_method_included Bool)
(declare-const commission_payment_standard_included Bool)
(declare-const compensation_standard_disclosed Bool)
(declare-const compliance_with_elderly_consumer_protection Bool)
(declare-const compliance_with_laws_and_regulations Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const conflict_of_interest_prevention_included Bool)
(declare-const contact_info_obtained Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const contract_authority_scope_included Bool)
(declare-const contract_party_names_included Bool)
(declare-const contract_period_included Bool)
(declare-const contract_termination_clause_included Bool)
(declare-const criminal_conviction_for_fraud_or_forgery Bool)
(declare-const deposit_guarantee Bool)
(declare-const dismissal_reasons_complied Bool)
(declare-const dispute_resolution_clause_included Bool)
(declare-const documents_retained Bool)
(declare-const duty_of_care_observed Bool)
(declare-const duty_of_fidelity_observed Bool)
(declare-const education_and_training_completed Bool)
(declare-const employ_unqualified_personnel Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_suitability_for_elderly_clients Bool)
(declare-const fail_to_fill_out_sales_report_truthfully Bool)
(declare-const fail_to_reappoint_agent_after_resignation Bool)
(declare-const fail_to_report_to_agent_association Bool)
(declare-const false_declaration_on_license_application Bool)
(declare-const financial_and_business_management_compliant Bool)
(declare-const financial_institution_account_included Bool)
(declare-const hold_positions_in_insurance_or_association Bool)
(declare-const illegal_insurance_payment Bool)
(declare-const important_rights_obligations_disclosed Bool)
(declare-const induce_client_to_terminate_contract_with_loans_or_deposits Bool)
(declare-const induce_policyholder_to_cancel_or_loan Bool)
(declare-const insurance_policy_guarantee Bool)
(declare-const insurance_policy_responsibility Bool)
(declare-const insurance_policy_subscribed Bool)
(declare-const insurance_policy_type_correct Bool)
(declare-const internal_operation_regulations_established Bool)
(declare-const internal_operation_regulations_executed Bool)
(declare-const legal_compliance_clause_included Bool)
(declare-const license_permitted Bool)
(declare-const license_revocation_procedures_followed Bool)
(declare-const license_used_by_others Bool)
(declare-const main_content_disclosed Bool)
(declare-const minimum_guarantee_amount Real)
(declare-const misappropriate_or_embezzle_premium_or_claim Bool)
(declare-const misleading_promotion_or_advertisement Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_compliance_matters_met Bool)
(declare-const other_regulatory_requirements_included Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_agent Bool)
(declare-const penalty Bool)
(declare-const policy_issued_electronically Bool)
(declare-const prohibited_behaviors_clause_included Bool)
(declare-const qualification_conditions_met Bool)
(declare-const required_documents_submitted Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const submit_false_or_incomplete_reports Bool)
(declare-const transfer_application_documents_without_consent Bool)
(declare-const unauthorized_insurance_agent_operation Bool)
(declare-const unauthorized_insurance_business_operation Bool)
(declare-const unauthorized_suspension_or_termination_of_business Bool)
(declare-const unauthorized_use_of_advertisement_content Bool)
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
        (<= minimum_guarantee_amount (ite deposit_guarantee 1.0 0.0))
        insurance_policy_subscribed)))

; [insurance:insurance_policy_type_correct] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= insurance_policy_type_correct
   (and agent_type
        insurance_policy_responsibility
        (not insurance_policy_guarantee))))

; [insurance:agent_broker_qualification_conditions] 保險代理人、經紀人、公證人資格取得、申請許可及管理規則遵守
(assert (= agent_broker_qualification_conditions
   (and qualification_conditions_met
        application_procedure_followed
        required_documents_submitted
        board_and_manager_qualifications_met
        dismissal_reasons_complied
        branch_establishment_conditions_met
        financial_and_business_management_compliant
        education_and_training_completed
        license_revocation_procedures_followed
        other_compliance_matters_met)))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_operate_agent_or_broker
   (and bank_license_permitted
        (or bank_operate_agent bank_operate_broker)
        agent_broker_regulations_applied)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and duty_of_care_observed duty_of_fidelity_observed)))

; [insurance:broker_must_provide_written_analysis_report] 保險經紀人於洽訂保險契約前應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_must_provide_written_analysis_report
   (and written_analysis_report_provided
        (or compensation_standard_disclosed (not broker_receives_compensation)))))

; [insurance:violation_financial_or_business_management] 違反財務或業務管理規定應限期改正或處罰
(assert (= violation_financial_or_business_management
   (or violate_related_regulations
       violate_financial_management
       violate_business_management)))

; [insurance:agent_duty_of_care_and_information_disclosure] 代理人應盡善良管理人注意義務，向要保人說明保險商品主要內容與重要權利義務，並留存相關文件
(assert (= agent_duty_of_care_and_information_disclosure
   (and duty_of_care_observed
        main_content_disclosed
        important_rights_obligations_disclosed
        documents_retained)))

; [insurance:agent_must_obtain_contact_info_for_e_policy] 電子保單出單時應取得要保人及被保險人聯絡方式並提供保險人
(assert (= agent_must_obtain_contact_info_for_e_policy
   (and policy_issued_electronically
        contact_info_obtained
        contact_info_provided_to_insurer)))

; [insurance:agent_company_and_bank_internal_operation_compliance] 代理人公司及銀行應訂定並落實內部作業規範，確保遵循相關法令及高齡消費者保障規定
(assert (= agent_company_and_bank_internal_operation_compliance
   (and internal_operation_regulations_established
        internal_operation_regulations_executed
        compliance_with_laws_and_regulations
        compliance_with_elderly_consumer_protection)))

; [insurance:agent_prohibited_behaviors] 代理人及相關人員不得有違反規定之不當行為
(assert (not (= (or criminal_conviction_for_fraud_or_forgery
            induce_policyholder_to_cancel_or_loan
            misappropriate_or_embezzle_premium_or_claim
            license_used_by_others
            unauthorized_suspension_or_termination_of_business
            employ_unqualified_personnel
            fail_to_fill_out_sales_report_truthfully
            fail_to_report_to_agent_association
            fail_to_confirm_suitability_for_elderly_clients
            unauthorized_insurance_business_operation
            misleading_promotion_or_advertisement
            transfer_application_documents_without_consent
            unauthorized_insurance_agent_operation
            sell_unapproved_foreign_policy_discount_products
            unauthorized_use_of_advertisement_content
            induce_client_to_terminate_contract_with_loans_or_deposits
            fail_to_reappoint_agent_after_resignation
            other_violations_of_rules_or_laws
            operate_outside_license_scope
            authorize_others_to_operate
            conceal_important_contract_info
            illegal_insurance_payment
            collect_illegal_commission_or_benefit
            false_declaration_on_license_application
            submit_false_or_incomplete_reports
            spread_false_information_disturb_financial_order
            pay_commission_to_non_actual_agent
            fail_to_cancel_license_within_deadline
            coerce_or_induce_contract
            hold_positions_in_insurance_or_association
            other_behaviors_damaging_insurance_image)
        agent_prohibited_behaviors)))

; [insurance:agent_contract_must_include_required_items] 保險代理合約內容應包括主管機關規定之各項必要事項
(assert (= agent_contract_must_include_required_items
   (and contract_party_names_included
        contract_period_included
        contract_authority_scope_included
        commission_payment_standard_included
        commission_payment_method_included
        legal_compliance_clause_included
        prohibited_behaviors_clause_included
        conflict_of_interest_prevention_included
        breach_of_contract_liability_included
        dispute_resolution_clause_included
        contract_termination_clause_included
        financial_institution_account_included
        other_regulatory_requirements_included)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險投保、管理規則、善良管理義務、禁止行為或合約規定時處罰
(assert (= penalty
   (or (not broker_must_provide_written_analysis_report)
       (not bank_permitted_to_operate_agent_or_broker)
       (not agent_must_obtain_contact_info_for_e_policy)
       (not broker_duty_of_care_and_fidelity)
       (not agent_company_and_bank_internal_operation_compliance)
       (not agent_prohibited_behaviors)
       (not agent_broker_license_required)
       (not insurance_policy_type_correct)
       (not agent_contract_must_include_required_items)
       (not agent_broker_qualification_conditions)
       (not agent_duty_of_care_and_information_disclosure))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= unauthorized_insurance_business_operation true))
(assert (= unauthorized_insurance_agent_operation true))
(assert (= agent_broker_license_required false))
(assert (= violate_related_regulations true))
(assert (= violation_financial_or_business_management true))
(assert (= agent_prohibited_behaviors true))
(assert (= submit_false_or_incomplete_reports true))
(assert (= agent_broker_qualification_conditions false))
(assert (= application_procedure_followed false))
(assert (= required_documents_submitted false))
(assert (= board_and_manager_qualifications_met false))
(assert (= dismissal_reasons_complied false))
(assert (= branch_establishment_conditions_met false))
(assert (= financial_and_business_management_compliant false))
(assert (= education_and_training_completed false))
(assert (= license_revocation_procedures_followed false))
(assert (= other_compliance_matters_met false))
(assert (= agent_company_and_bank_internal_operation_compliance false))
(assert (= internal_operation_regulations_established false))
(assert (= internal_operation_regulations_executed false))
(assert (= compliance_with_laws_and_regulations false))
(assert (= compliance_with_elderly_consumer_protection false))
(assert (= agent_duty_of_care_and_information_disclosure false))
(assert (= duty_of_care_observed false))
(assert (= main_content_disclosed false))
(assert (= important_rights_obligations_disclosed false))
(assert (= documents_retained false))
(assert (= agent_must_obtain_contact_info_for_e_policy false))
(assert (= policy_issued_electronically false))
(assert (= contact_info_obtained false))
(assert (= contact_info_provided_to_insurer false))
(assert (= agent_contract_must_include_required_items false))
(assert (= contract_party_names_included false))
(assert (= contract_period_included false))
(assert (= contract_authority_scope_included false))
(assert (= commission_payment_standard_included false))
(assert (= commission_payment_method_included false))
(assert (= legal_compliance_clause_included false))
(assert (= prohibited_behaviors_clause_included false))
(assert (= conflict_of_interest_prevention_included false))
(assert (= breach_of_contract_liability_included false))
(assert (= dispute_resolution_clause_included false))
(assert (= contract_termination_clause_included false))
(assert (= financial_institution_account_included false))
(assert (= other_regulatory_requirements_included false))
(assert (= false_declaration_on_license_application false))
(assert (= conceal_important_contract_info true))
(assert (= authorize_others_to_operate false))
(assert (= transfer_application_documents_without_consent false))
(assert (= employ_unqualified_personnel false))
(assert (= fail_to_cancel_license_within_deadline false))
(assert (= unauthorized_suspension_or_termination_of_business false))
(assert (= fail_to_reappoint_agent_after_resignation false))
(assert (= fail_to_report_to_agent_association false))
(assert (= unauthorized_use_of_advertisement_content false))
(assert (= pay_commission_to_non_actual_agent false))
(assert (= fail_to_confirm_suitability_for_elderly_clients false))
(assert (= sell_unapproved_foreign_policy_discount_products false))
(assert (= hold_positions_in_insurance_or_association false))
(assert (= induce_client_to_terminate_contract_with_loans_or_deposits false))
(assert (= induce_policyholder_to_cancel_or_loan false))
(assert (= misappropriate_or_embezzle_premium_or_claim false))
(assert (= license_used_by_others false))
(assert (= criminal_conviction_for_fraud_or_forgery false))
(assert (= operate_outside_license_scope false))
(assert (= collect_illegal_commission_or_benefit false))
(assert (= illegal_insurance_payment false))
(assert (= spread_false_information_disturb_financial_order false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= other_behaviors_damaging_insurance_image false))
(assert (= agent_broker_regulations_applied false))
(assert (= bank_license_permitted false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= bank_permitted_to_operate_agent_or_broker false))
(assert (= agent_type false))
(assert (= insurance_policy_subscribed false))
(assert (= insurance_policy_type_correct false))
(assert (= insurance_policy_responsibility false))
(assert (= insurance_policy_guarantee false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= duty_of_fidelity_observed false))
(assert (= broker_must_provide_written_analysis_report false))
(assert (= written_analysis_report_provided false))
(assert (= broker_receives_compensation false))
(assert (= compensation_standard_disclosed false))
(assert (= deposit_guarantee false))
(assert (= minimum_guarantee_amount 0.0))
(assert (= penalty true))
(assert (= coerce_or_induce_contract false))
(assert (= fail_to_fill_out_sales_report_truthfully false))
(assert (= misleading_promotion_or_advertisement false))
(assert (= qualification_conditions_met false))
(assert (= violate_business_management false))
(assert (= violate_financial_management false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 96
; Total facts: 96
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
