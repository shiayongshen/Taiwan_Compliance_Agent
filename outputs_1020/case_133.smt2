; SMT2 file generated from compliance case automatic
; Case ID: case_133
; Generated at: 2025-10-19T08:52:54.280849
;
; This file can be executed with Z3:
;   z3 case_133.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_committee_established Bool)
(declare-const authorize_others_to_operate Bool)
(declare-const broker_shareholding_in_insurer Bool)
(declare-const charge_illegal_fees_or_commissions Bool)
(declare-const coerce_or_induce_contract Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const contact_info_for_e_policy Bool)
(declare-const contact_provided_to_insurer Bool)
(declare-const contract_with_unregistered_insurer Bool)
(declare-const corrected_within_deadline Bool)
(declare-const corrected_within_deadline_167_3 Bool)
(declare-const criminal_conviction_for_fraud_or_forgery Bool)
(declare-const damage_insurance_image Bool)
(declare-const disclose_fee_standard_before_receiving_fee Bool)
(declare-const disclose_shareholding_info_before_contract Bool)
(declare-const dismiss_manager_or_staff Bool)
(declare-const dismiss_or_suspend_director_or_supervisor Bool)
(declare-const document_retention Bool)
(declare-const duty_of_care_and_loyalty Bool)
(declare-const embezzle_insurance_funds Bool)
(declare-const employ_unqualified_personnel Bool)
(declare-const exclude_clause_7 Bool)
(declare-const exercise_duty_of_care Bool)
(declare-const exercise_duty_of_loyalty Bool)
(declare-const explain_and_disclose_insurance_info Bool)
(declare-const fail_to_cancel_license_in_time Bool)
(declare-const fail_to_confirm_suitability_for_elderly Bool)
(declare-const fail_to_fill_solicitation_report Bool)
(declare-const fail_to_reappoint_agents_after_resignation Bool)
(declare-const fail_to_report_to_association Bool)
(declare-const false_or_incomplete_report Bool)
(declare-const false_report_on_license_application Bool)
(declare-const hold_positions_in_insurance_and_association Bool)
(declare-const illegal_insurance_payments Bool)
(declare-const impede_sound_operation Bool)
(declare-const include_advertisement_and_promotion_management Bool)
(declare-const include_compensation_and_risk_assessment Bool)
(declare-const include_customer_complaints_handling Bool)
(declare-const include_customer_need_assessment Bool)
(declare-const include_document_control_and_storage Bool)
(declare-const include_other_designated_matters Bool)
(declare-const include_pre_submission_check Bool)
(declare-const include_premium_collection_and_management Bool)
(declare-const include_product_information_disclosure Bool)
(declare-const include_protection_for_elderly Bool)
(declare-const include_qualification_and_insurance_type Bool)
(declare-const include_report_filling_and_verification Bool)
(declare-const induce_contract_termination_or_loan Bool)
(declare-const induce_policy_cancellation_or_loan Bool)
(declare-const insurance_policy_is_electronic Bool)
(declare-const insured_email_provided Bool)
(declare-const insured_phone_provided Bool)
(declare-const insurer_shareholding_in_broker Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_defined_by_business_nature_and_scale Bool)
(declare-const internal_control_includes_audit_committee_management Bool)
(declare-const internal_control_reviewed_and_revised Bool)
(declare-const internal_operation_regulation Bool)
(declare-const internal_operation_regulation_established Bool)
(declare-const internal_operation_regulation_executed Bool)
(declare-const license_revoked Bool)
(declare-const license_used_by_others Bool)
(declare-const maintain_insured_interest Bool)
(declare-const misleading_advertisement Bool)
(declare-const not_establish_audit_system Bool)
(declare-const not_establish_internal_control Bool)
(declare-const not_establish_solicitation_system Bool)
(declare-const not_execute_audit_system Bool)
(declare-const not_execute_internal_control Bool)
(declare-const not_execute_solicitation_system Bool)
(declare-const notify_deregistration Bool)
(declare-const notify_registration_authority Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_approved_contact_provided Bool)
(declare-const other_necessary_measures Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_agents Bool)
(declare-const penalty Bool)
(declare-const penalty_167_2 Bool)
(declare-const penalty_167_3 Bool)
(declare-const penalty_fine_imposed Bool)
(declare-const penalty_fine_imposed_167_3 Bool)
(declare-const penalty_measures Bool)
(declare-const pre_contract_duty Bool)
(declare-const prohibited_acts Bool)
(declare-const property_insurance_solicited Bool)
(declare-const provide_written_analysis_report Bool)
(declare-const restrict_business_scope Bool)
(declare-const retain_documents_for_inspection Bool)
(declare-const sell_unapproved_foreign_products Bool)
(declare-const shareholding_disclosure Bool)
(declare-const solicitation_system_compliance Bool)
(declare-const solicitation_system_exemption_property_insurance Bool)
(declare-const spread_false_information Bool)
(declare-const transfer_documents_to_unauthorized_person Bool)
(declare-const unauthorized_suspend_or_terminate_business Bool)
(declare-const unauthorized_use_of_advertisement Bool)
(declare-const understand_client_basic_info Bool)
(declare-const violate_article_163_4 Bool)
(declare-const violate_article_163_5_applied Bool)
(declare-const violate_article_163_7 Bool)
(declare-const violate_article_165_1 Bool)
(declare-const violate_financial_or_business_management Bool)
(declare-const violate_internal_control_or_audit Bool)
(declare-const violate_law Bool)
(declare-const violation_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_agent:violation_penalty] 保險代理人、經紀人、公證人違反法令或有礙健全經營時主管機關可處分
(assert (= violation_penalty (or impede_sound_operation violate_law)))

; [insurance_agent:penalty_measures] 主管機關可採取限制經營範圍、解除職務、停止職務或其他處置
(assert (= penalty_measures
   (or other_necessary_measures
       restrict_business_scope
       dismiss_manager_or_staff
       dismiss_or_suspend_director_or_supervisor)))

; [insurance_agent:notify_deregistration] 解除董事或監察人職務時通知主管機關註銷登記
(assert (= notify_deregistration
   (or notify_registration_authority
       (not dismiss_or_suspend_director_or_supervisor))))

; [insurance:violate_financial_or_business_management] 違反財務或業務管理規定
(assert (= violate_financial_or_business_management
   (or violate_article_163_5_applied
       violate_article_165_1
       violate_article_163_7
       violate_article_163_4)))

; [insurance:penalty_167_2] 違反第167-2條規定應限期改正或處罰，情節重大者廢止許可並註銷執照
(assert (= penalty_167_2
   (or (not corrected_within_deadline) penalty_fine_imposed license_revoked)))

; [insurance:violate_internal_control_or_audit] 違反內部控制、稽核制度或招攬處理制度或程序
(assert (= violate_internal_control_or_audit
   (or not_establish_internal_control
       not_execute_audit_system
       not_execute_internal_control
       not_establish_audit_system
       not_establish_solicitation_system
       not_execute_solicitation_system)))

; [insurance:penalty_167_3] 違反第167-3條規定應限期改正或處罰
(assert (= penalty_167_3
   (or (not corrected_within_deadline_167_3) penalty_fine_imposed_167_3)))

; [insurance_agent:internal_control_compliance] 保險代理人公司、保險經紀人公司、銀行內部控制制度符合規定
(assert (= internal_control_compliance
   (and internal_control_defined_by_business_nature_and_scale
        internal_control_reviewed_and_revised
        (or (not audit_committee_established)
            internal_control_includes_audit_committee_management))))

; [insurance_agent:solicitation_system_compliance] 招攬處理制度及程序符合規定
(assert (= solicitation_system_compliance
   (and include_qualification_and_insurance_type
        include_compensation_and_risk_assessment
        include_premium_collection_and_management
        include_product_information_disclosure
        include_advertisement_and_promotion_management
        include_customer_need_assessment
        include_report_filling_and_verification
        include_pre_submission_check
        include_document_control_and_storage
        include_customer_complaints_handling
        include_other_designated_matters)))

; [insurance_agent:solicitation_system_exemption_property_insurance] 招攬財產保險時不適用第七款規定
(assert (= solicitation_system_exemption_property_insurance
   (or (not property_insurance_solicited) exclude_clause_7)))

; [insurance_broker:prohibited_acts] 個人執業經紀人、經紀人公司、銀行及受任用經紀人不得有禁止行為
(assert (not (= (or charge_illegal_fees_or_commissions
            hold_positions_in_insurance_and_association
            false_report_on_license_application
            fail_to_reappoint_agents_after_resignation
            coerce_or_induce_contract
            pay_commission_to_non_actual_agents
            fail_to_fill_solicitation_report
            conceal_important_contract_info
            employ_unqualified_personnel
            fail_to_report_to_association
            spread_false_information
            criminal_conviction_for_fraud_or_forgery
            false_or_incomplete_report
            embezzle_insurance_funds
            illegal_insurance_payments
            induce_contract_termination_or_loan
            fail_to_cancel_license_in_time
            operate_outside_license_scope
            unauthorized_suspend_or_terminate_business
            damage_insurance_image
            misleading_advertisement
            transfer_documents_to_unauthorized_person
            unauthorized_use_of_advertisement
            contract_with_unregistered_insurer
            other_violations_of_rules_or_laws
            authorize_others_to_operate
            induce_policy_cancellation_or_loan
            sell_unapproved_foreign_products
            fail_to_confirm_suitability_for_elderly
            license_used_by_others)
        prohibited_acts)))

; [insurance_broker:duty_of_care_and_loyalty] 個人執業經紀人、經紀人公司及銀行應盡善良管理人注意及忠實義務
(assert (= duty_of_care_and_loyalty
   (and exercise_duty_of_care
        exercise_duty_of_loyalty
        maintain_insured_interest
        explain_and_disclose_insurance_info)))

; [insurance_broker:document_retention] 個人執業經紀人、經紀人公司及銀行應留存文件備查
(assert document_retention)

; [insurance_broker:contact_info_for_e_policy] 電子保單應取得要保人及被保險人聯絡方式並提供保險人
(assert (= contact_info_for_e_policy
   (or (not insurance_policy_is_electronic)
       (and insured_phone_provided
            insured_email_provided
            other_approved_contact_provided
            contact_provided_to_insurer))))

; [insurance_broker:internal_operation_regulation] 經紀人公司及銀行應訂定並執行內部作業規範，保障高齡消費者權益
(assert (= internal_operation_regulation
   (and internal_operation_regulation_established
        internal_operation_regulation_executed
        include_protection_for_elderly)))

; [insurance_broker:pre_contract_duty] 經紀人洽訂契約前應充分瞭解客戶資料並提供書面分析報告及報酬標準
(assert (= pre_contract_duty
   (and understand_client_basic_info
        provide_written_analysis_report
        disclose_fee_standard_before_receiving_fee)))

; [insurance_broker:shareholding_disclosure] 經紀人持股超過10%應於洽訂契約前揭露資訊
(assert shareholding_disclosure)

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令或規定時處罰
(assert (= penalty
   (or (not document_retention)
       (not duty_of_care_and_loyalty)
       (not contact_info_for_e_policy)
       (not penalty_167_2)
       (not shareholding_disclosure)
       (not prohibited_acts)
       (not pre_contract_duty)
       (not internal_operation_regulation)
       (not solicitation_system_compliance)
       (not penalty_167_3)
       (not internal_control_compliance)
       (and violation_penalty (not penalty_measures)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_law true))
(assert (= impede_sound_operation true))
(assert (= not_execute_internal_control true))
(assert (= not_execute_solicitation_system true))
(assert (= corrected_within_deadline false))
(assert (= penalty_fine_imposed true))
(assert (= penalty_fine_imposed_167_3 false))
(assert (= license_revoked false))
(assert (= penalty_measures false))
(assert (= restrict_business_scope false))
(assert (= dismiss_manager_or_staff false))
(assert (= dismiss_or_suspend_director_or_supervisor false))
(assert (= notify_registration_authority false))
(assert (= internal_control_defined_by_business_nature_and_scale true))
(assert (= internal_control_reviewed_and_revised true))
(assert (= audit_committee_established false))
(assert (= internal_control_includes_audit_committee_management false))
(assert (= include_qualification_and_insurance_type true))
(assert (= include_compensation_and_risk_assessment true))
(assert (= include_premium_collection_and_management true))
(assert (= include_product_information_disclosure false))
(assert (= include_advertisement_and_promotion_management true))
(assert (= include_customer_need_assessment false))
(assert (= include_report_filling_and_verification true))
(assert (= include_pre_submission_check true))
(assert (= include_document_control_and_storage true))
(assert (= include_customer_complaints_handling true))
(assert (= include_other_designated_matters true))
(assert (= solicitation_system_compliance false))
(assert (= prohibited_acts true))
(assert (= duty_of_care_and_loyalty false))
(assert (= retain_documents_for_inspection false))
(assert (= contact_info_for_e_policy false))
(assert (= internal_operation_regulation_established false))
(assert (= internal_operation_regulation_executed false))
(assert (= include_protection_for_elderly false))
(assert (= internal_operation_regulation false))
(assert (= internal_control_compliance false))
(assert (= exercise_duty_of_care false))
(assert (= exercise_duty_of_loyalty false))
(assert (= maintain_insured_interest false))
(assert (= explain_and_disclose_insurance_info false))
(assert (= understand_client_basic_info false))
(assert (= provide_written_analysis_report false))
(assert (= disclose_fee_standard_before_receiving_fee false))
(assert (= pre_contract_duty false))
(assert (= broker_shareholding_in_insurer false))
(assert (= insurer_shareholding_in_broker false))
(assert (= disclose_shareholding_info_before_contract false))
(assert (= shareholding_disclosure false))
(assert (= penalty_167_2 true))
(assert (= penalty_167_3 false))
(assert (= penalty true))
(assert (= authorize_others_to_operate false))
(assert (= charge_illegal_fees_or_commissions false))
(assert (= coerce_or_induce_contract false))
(assert (= conceal_important_contract_info false))
(assert (= contact_provided_to_insurer false))
(assert (= contract_with_unregistered_insurer false))
(assert (= corrected_within_deadline_167_3 false))
(assert (= criminal_conviction_for_fraud_or_forgery false))
(assert (= damage_insurance_image false))
(assert (= document_retention false))
(assert (= embezzle_insurance_funds false))
(assert (= employ_unqualified_personnel false))
(assert (= exclude_clause_7 false))
(assert (= fail_to_cancel_license_in_time false))
(assert (= fail_to_confirm_suitability_for_elderly false))
(assert (= fail_to_fill_solicitation_report false))
(assert (= fail_to_reappoint_agents_after_resignation false))
(assert (= fail_to_report_to_association false))
(assert (= false_or_incomplete_report false))
(assert (= false_report_on_license_application false))
(assert (= hold_positions_in_insurance_and_association false))
(assert (= illegal_insurance_payments false))
(assert (= induce_contract_termination_or_loan false))
(assert (= induce_policy_cancellation_or_loan false))
(assert (= insurance_policy_is_electronic false))
(assert (= insured_email_provided false))
(assert (= insured_phone_provided false))
(assert (= license_used_by_others false))
(assert (= misleading_advertisement false))
(assert (= not_establish_audit_system false))
(assert (= not_establish_internal_control false))
(assert (= not_establish_solicitation_system false))
(assert (= not_execute_audit_system false))
(assert (= notify_deregistration false))
(assert (= operate_outside_license_scope false))
(assert (= other_approved_contact_provided false))
(assert (= other_necessary_measures false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= pay_commission_to_non_actual_agents false))
(assert (= property_insurance_solicited false))
(assert (= sell_unapproved_foreign_products false))
(assert (= solicitation_system_exemption_property_insurance false))
(assert (= spread_false_information false))
(assert (= transfer_documents_to_unauthorized_person false))
(assert (= unauthorized_suspend_or_terminate_business false))
(assert (= unauthorized_use_of_advertisement false))
(assert (= violate_article_163_4 false))
(assert (= violate_article_163_5_applied false))
(assert (= violate_article_163_7 false))
(assert (= violate_article_165_1 false))
(assert (= violate_financial_or_business_management false))
(assert (= violate_internal_control_or_audit false))
(assert (= violation_penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 106
; Total facts: 106
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
