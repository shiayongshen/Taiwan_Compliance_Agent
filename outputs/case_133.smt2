; SMT2 file generated from compliance case automatic
; Case ID: case_133
; Generated at: 2025-10-21T02:40:55.402714
;
; This file can be executed with Z3:
;   z3 case_133.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const applicant_email Bool)
(declare-const applicant_mobile Bool)
(declare-const applicant_other_contact Bool)
(declare-const applicant_phone Bool)
(declare-const audit_committee_established Bool)
(declare-const audit_committee_inclusion_met Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const authorize_others_to_operate Bool)
(declare-const broker_company_shareholding_in_insurer_percent Real)
(declare-const charge_illegal_fees_or_commissions Bool)
(declare-const client_basic_info_collected Bool)
(declare-const client_needs_and_risk_assessed Bool)
(declare-const client_understanding_and_report_met Bool)
(declare-const coerce_or_induce_or_restrict_contract_freedom Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const conflict_info_disclosed_to_client Bool)
(declare-const conflict_of_interest_disclosed Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const contract_with_unregistered_insurer Bool)
(declare-const convicted_of_fraud_or_breach_or_forgery Bool)
(declare-const director_dismissal_notification Bool)
(declare-const disclose_main_content_and_rights Bool)
(declare-const dismiss_director_or_supervisor_or_suspend_duties Bool)
(declare-const dismiss_manager_or_staff Bool)
(declare-const document_retention_met Bool)
(declare-const documents_retained_and_archived Bool)
(declare-const duty_of_care_and_loyalty_met Bool)
(declare-const electronic_policy_contact_info_met Bool)
(declare-const employ_unqualified_personnel Bool)
(declare-const exercise_duty_of_care Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_suitability_for_elderly_clients Bool)
(declare-const fail_to_fill_solicitation_report_truthfully Bool)
(declare-const fail_to_reappoint_broker_after_resignation Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_report_on_license_application Bool)
(declare-const hold_positions_in_insurance_or_association Bool)
(declare-const illegal_insurance_payments Bool)
(declare-const includes_protection_for_elderly_clients Bool)
(declare-const induce_contract_termination_or_loan_payment Bool)
(declare-const induce_policy_surrender_or_transfer_or_loan Bool)
(declare-const insured_email Bool)
(declare-const insured_mobile Bool)
(declare-const insured_other_contact Bool)
(declare-const insured_phone Bool)
(declare-const insurer_shareholding_in_broker_company_percent Real)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_includes_audit_committee_management Bool)
(declare-const internal_control_procedures_defined Bool)
(declare-const internal_control_requirements_met Bool)
(declare-const internal_control_reviewed_timely Bool)
(declare-const internal_operation_implemented Bool)
(declare-const internal_operation_specification_met Bool)
(declare-const internal_operation_specified Bool)
(declare-const item_10_met Bool)
(declare-const item_11_met Bool)
(declare-const item_1_met Bool)
(declare-const item_2_met Bool)
(declare-const item_3_met Bool)
(declare-const item_4_met Bool)
(declare-const item_5_met Bool)
(declare-const item_6_met Bool)
(declare-const item_7_met Bool)
(declare-const item_8_met Bool)
(declare-const item_9_met Bool)
(declare-const license_used_by_others Bool)
(declare-const maintain_insured_interest Bool)
(declare-const misappropriate_insurance_funds Bool)
(declare-const misleading_advertisement_or_recruitment Bool)
(declare-const notify_registration_authority Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_actions_damaging_insurance_image Bool)
(declare-const other_necessary_measures Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_solicitor Bool)
(declare-const penalty Bool)
(declare-const penalty_167_2 Bool)
(declare-const penalty_167_3 Bool)
(declare-const policy_issued_electronically Bool)
(declare-const prohibited_acts_complied Bool)
(declare-const property_insurance Bool)
(declare-const restriction_on_business_scope Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const solicitation_handling_minimum_items_met Bool)
(declare-const solicitation_handling_system_defined Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const submit_false_or_incomplete_reports Bool)
(declare-const transfer_policy_documents_to_unauthorized_person Bool)
(declare-const unauthorized_suspend_or_resume_or_terminate_business Bool)
(declare-const use_unapproved_advertisement_content Bool)
(declare-const violate_163_5_applied Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1 Bool)
(declare-const violate_financial_or_business_management_rules Bool)
(declare-const violation Bool)
(declare-const violation_167_2 Bool)
(declare-const violation_167_3 Bool)
(declare-const violation_penalty_scope Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_agent:violation_penalty_scope] 保險代理人、經紀人、公證人違反法令或有礙健全經營時主管機關可處分範圍
(assert (= violation_penalty_scope
   (and violation
        (or dismiss_manager_or_staff
            restriction_on_business_scope
            other_necessary_measures
            dismiss_director_or_supervisor_or_suspend_duties))))

; [insurance_agent:director_dismissal_notification] 依規定解除董事或監察人職務時通知主管機關註銷登記
(assert (= director_dismissal_notification
   (or (not dismiss_director_or_supervisor_or_suspend_duties)
       notify_registration_authority)))

; [insurance_agent:violation_167_2] 違反相關管理規則應限期改正或處罰
(assert (= violation_167_2
   (or violate_financial_or_business_management_rules
       violate_163_5_applied
       violate_163_7
       violate_165_1)))

; [insurance_agent:penalty_167_2] 違反167-2條規定應限期改正或處罰罰鍰，情節重大者廢止許可並註銷執業證照
(assert (= penalty_167_2 violation_167_2))

; [insurance_agent:violation_167_3] 違反未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序
(assert (= violation_167_3
   (or (not internal_control_executed)
       (not solicitation_handling_system_established)
       (not audit_system_established)
       (not audit_system_executed)
       (not solicitation_handling_system_executed)
       (not internal_control_established))))

; [insurance_agent:penalty_167_3] 違反167-3條規定應限期改正或處罰罰鍰
(assert (= penalty_167_3 violation_167_3))

; [insurance_agent:internal_control_requirements] 內部控制制度應依業務性質及規模訂定招攬處理制度及程序與內部控制作業程序並適時檢討修訂
(assert (= internal_control_requirements_met
   (and solicitation_handling_system_defined
        internal_control_procedures_defined
        internal_control_reviewed_timely)))

; [insurance_agent:audit_committee_inclusion] 設置審計委員會者，內部控制制度應包括審計委員會議事運作管理
(assert (= audit_committee_inclusion_met
   (or (not audit_committee_established)
       internal_control_includes_audit_committee_management)))

; [insurance_agent:solicitation_handling_minimum_items] 招攬處理制度及程序至少應包括規定條款（第7條第1至11款，財產保險第7款不適用）
(assert (= solicitation_handling_minimum_items_met
   (and item_1_met
        item_2_met
        item_3_met
        item_4_met
        item_5_met
        item_6_met
        (or property_insurance item_7_met)
        item_8_met
        item_9_met
        item_10_met
        item_11_met)))

; [insurance_broker:prohibited_acts] 經紀人及相關人員不得有第49條列舉之禁止行為
(assert (not (= (or other_violations_of_rules_or_laws
            pay_commission_to_non_actual_solicitor
            sell_unapproved_foreign_policy_discount_products
            other_actions_damaging_insurance_image
            conceal_important_contract_info
            fail_to_fill_solicitation_report_truthfully
            convicted_of_fraud_or_breach_or_forgery
            illegal_insurance_payments
            license_used_by_others
            misleading_advertisement_or_recruitment
            hold_positions_in_insurance_or_association
            fail_to_confirm_suitability_for_elderly_clients
            induce_policy_surrender_or_transfer_or_loan
            use_unapproved_advertisement_content
            transfer_policy_documents_to_unauthorized_person
            authorize_others_to_operate
            spread_false_information_disturb_financial_order
            unauthorized_suspend_or_resume_or_terminate_business
            fail_to_report_to_broker_association
            employ_unqualified_personnel
            coerce_or_induce_or_restrict_contract_freedom
            false_report_on_license_application
            induce_contract_termination_or_loan_payment
            contract_with_unregistered_insurer
            charge_illegal_fees_or_commissions
            misappropriate_insurance_funds
            fail_to_cancel_license_within_deadline
            submit_false_or_incomplete_reports
            fail_to_reappoint_broker_after_resignation
            operate_outside_license_scope)
        prohibited_acts_complied)))

; [insurance_broker:duty_of_care_and_loyalty] 經紀人執行業務應盡善良管理人注意及忠實義務，維護被保險人利益並充分揭露資訊
(assert (= duty_of_care_and_loyalty_met
   (and exercise_duty_of_care
        maintain_insured_interest
        disclose_main_content_and_rights)))

; [insurance_broker:document_retention] 經紀人應將有關文件留存建檔備供查閱
(assert (= document_retention_met documents_retained_and_archived))

; [insurance_broker:electronic_policy_contact_info] 電子保單出單時應取得要保人及被保險人聯絡方式並提供承保保險人
(assert (= electronic_policy_contact_info_met
   (or (not policy_issued_electronically)
       (and (or applicant_mobile applicant_phone)
            (or applicant_email applicant_other_contact)
            (or insured_phone insured_mobile)
            (or insured_email insured_other_contact)
            contact_info_provided_to_insurer))))

; [insurance_broker:internal_operation_specification] 經紀人公司及銀行應依法令及主管機關規定訂定內部作業規範並落實執行
(assert (= internal_operation_specification_met
   (and internal_operation_specified
        internal_operation_implemented
        includes_protection_for_elderly_clients)))

; [insurance_broker:understand_client_and_provide_report] 經紀人洽訂契約前應充分瞭解客戶資料及提供書面分析報告
(assert (= client_understanding_and_report_met
   (and client_basic_info_collected
        client_needs_and_risk_assessed
        written_analysis_report_provided)))

; [insurance_broker:disclose_conflict_of_interest] 經紀人持有保險公司股份超過10%時應於洽訂契約前揭露資訊
(assert (let ((a!1 (not (or (not (<= broker_company_shareholding_in_insurer_percent
                             10.0))
                    (not (<= insurer_shareholding_in_broker_company_percent
                             10.0))))))
  (= conflict_of_interest_disclosed (or a!1 conflict_info_disclosed_to_client))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法令規定或管理規則時處罰
(assert (= penalty
   (or penalty_167_2
       violation
       (not conflict_of_interest_disclosed)
       penalty_167_3
       (not internal_operation_specification_met)
       (not electronic_policy_contact_info_met)
       (not client_understanding_and_report_met)
       (not prohibited_acts_complied)
       (not internal_control_requirements_met)
       (not duty_of_care_and_loyalty_met)
       (not document_retention_met)
       (not solicitation_handling_minimum_items_met)
       (not audit_committee_inclusion_met))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation true))
(assert (= restriction_on_business_scope false))
(assert (= dismiss_manager_or_staff false))
(assert (= dismiss_director_or_supervisor_or_suspend_duties false))
(assert (= other_necessary_measures false))
(assert (= violate_financial_or_business_management_rules true))
(assert (= violate_163_7 false))
(assert (= violate_165_1 false))
(assert (= violate_163_5_applied false))
(assert (= violation_167_2 true))
(assert (= penalty_167_2 true))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= audit_system_established true))
(assert (= audit_system_executed true))
(assert (= solicitation_handling_system_established true))
(assert (= solicitation_handling_system_executed false))
(assert (= violation_167_3 true))
(assert (= penalty_167_3 true))
(assert (= solicitation_handling_system_defined true))
(assert (= internal_control_procedures_defined true))
(assert (= internal_control_reviewed_timely true))
(assert (= internal_control_requirements_met false))
(assert (= audit_committee_established false))
(assert (= audit_committee_inclusion_met true))
(assert (= item_1_met true))
(assert (= item_2_met true))
(assert (= item_3_met true))
(assert (= item_4_met true))
(assert (= item_5_met true))
(assert (= item_6_met true))
(assert (= item_7_met true))
(assert (= item_8_met true))
(assert (= item_9_met true))
(assert (= item_10_met true))
(assert (= item_11_met true))
(assert (= prohibited_acts_complied true))
(assert (= duty_of_care_and_loyalty_met false))
(assert (= exercise_duty_of_care false))
(assert (= maintain_insured_interest true))
(assert (= disclose_main_content_and_rights false))
(assert (= document_retention_met true))
(assert (= documents_retained_and_archived true))
(assert (= electronic_policy_contact_info_met true))
(assert (= policy_issued_electronically false))
(assert (= internal_operation_specification_met true))
(assert (= internal_operation_specified true))
(assert (= internal_operation_implemented true))
(assert (= includes_protection_for_elderly_clients true))
(assert (= client_basic_info_collected true))
(assert (= client_needs_and_risk_assessed false))
(assert (= client_understanding_and_report_met false))
(assert (= written_analysis_report_provided false))
(assert (= conflict_of_interest_disclosed true))
(assert (= broker_company_shareholding_in_insurer_percent 0.0))
(assert (= insurer_shareholding_in_broker_company_percent 0.0))
(assert (= conflict_info_disclosed_to_client true))
(assert (= notify_registration_authority false))
(assert (= director_dismissal_notification false))
(assert (= false_report_on_license_application false))
(assert (= contract_with_unregistered_insurer false))
(assert (= conceal_important_contract_info false))
(assert (= coerce_or_induce_or_restrict_contract_freedom false))
(assert (= misleading_advertisement_or_recruitment false))
(assert (= induce_policy_surrender_or_transfer_or_loan false))
(assert (= misappropriate_insurance_funds false))
(assert (= license_used_by_others false))
(assert (= convicted_of_fraud_or_breach_or_forgery false))
(assert (= operate_outside_license_scope false))
(assert (= charge_illegal_fees_or_commissions false))
(assert (= illegal_insurance_payments false))
(assert (= spread_false_information_disturb_financial_order false))
(assert (= authorize_others_to_operate false))
(assert (= transfer_policy_documents_to_unauthorized_person false))
(assert (= employ_unqualified_personnel false))
(assert (= fail_to_cancel_license_within_deadline false))
(assert (= unauthorized_suspend_or_resume_or_terminate_business false))
(assert (= fail_to_reappoint_broker_after_resignation false))
(assert (= fail_to_report_to_broker_association false))
(assert (= use_unapproved_advertisement_content false))
(assert (= pay_commission_to_non_actual_solicitor false))
(assert (= fail_to_confirm_suitability_for_elderly_clients false))
(assert (= sell_unapproved_foreign_policy_discount_products false))
(assert (= submit_false_or_incomplete_reports false))
(assert (= hold_positions_in_insurance_or_association false))
(assert (= induce_contract_termination_or_loan_payment false))
(assert (= fail_to_fill_solicitation_report_truthfully false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= other_actions_damaging_insurance_image false))
(assert (= violation_penalty_scope true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 103
; Total facts: 91
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
