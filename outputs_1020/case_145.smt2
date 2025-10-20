; SMT2 file generated from compliance case automatic
; Case ID: case_145
; Generated at: 2025-10-19T09:13:48.363305
;
; This file can be executed with Z3:
;   z3 case_145.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_fixed_office_and_accounting Bool)
(declare-const agent_license_requirements Bool)
(declare-const agent_or_notary_responsibility_insurance Bool)
(declare-const agent_prohibited_behaviors Bool)
(declare-const agent_violates_law_or_hinders_sound_operation Bool)
(declare-const agent_violation Bool)
(declare-const approved_by_authority Bool)
(declare-const audit_system_established Bool)
(declare-const authorize_others_to_operate_or_use_others_name Bool)
(declare-const broker_responsibility_and_guarantee_insurance Bool)
(declare-const collect_money_or_other_benefits_improperly Bool)
(declare-const convicted_of_embezzlement_fraud_breach_of_trust_or_forgery Bool)
(declare-const corrected_within_deadline Bool)
(declare-const deposit_guarantee_amount Real)
(declare-const director_dismissal_notification Bool)
(declare-const dismiss_director_or_supervisor_or_suspend_duties Bool)
(declare-const embezzle_or_misappropriate_premiums_or_claims Bool)
(declare-const employ_unqualified_personnel_for_insurance_sales Bool)
(declare-const exaggerate_or_mislead_in_promotion_or_recruitment Bool)
(declare-const execute_unapproved_insurance_business Bool)
(declare-const fail_to_cancel_license_within_specified_period Bool)
(declare-const fail_to_confirm_suitability_for_financial_consumers Bool)
(declare-const fail_to_fill_out_sales_report_truthfully Bool)
(declare-const fail_to_reappoint_agent_after_resignation Bool)
(declare-const fail_to_report_to_agent_trade_association Bool)
(declare-const false_report_on_license_application Bool)
(declare-const fine_amount Real)
(declare-const has_agent_license Bool)
(declare-const has_broker_license Bool)
(declare-const has_certain_scale Bool)
(declare-const has_dedicated_accounting_books Bool)
(declare-const has_fixed_office Bool)
(declare-const has_notary_license Bool)
(declare-const hold_positions_in_insurance_or_association_conflicts Bool)
(declare-const induce_clients_to_cancel_or_terminate_contracts_or_pay_by_loan Bool)
(declare-const induce_policyholder_to_cancel_or_transfer_or_loan Bool)
(declare-const insured_relevant_insurance Bool)
(declare-const intentionally_hide_important_contract_info Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_requirement Bool)
(declare-const is_broker Bool)
(declare-const is_public_company Bool)
(declare-const license_issued Bool)
(declare-const license_revoked_and_certificate_cancelled Bool)
(declare-const minimum_guarantee_amount Real)
(declare-const notify_registration_authority_to_cancel_director_or_supervisor_registration Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const operate_without_approved_registration Bool)
(declare-const order_dismiss_manager_or_staff Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_necessary_measures Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_salesperson Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const relevant_insurance_types Bool)
(declare-const restrict_business_scope Bool)
(declare-const sell_unapproved_foreign_policy_discount_benefit_certificates Bool)
(declare-const single_license_for_multiple_qualifications Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const spread_false_statements_or_disrupt_financial_order Bool)
(declare-const submit_false_or_incomplete_business_or_financial_reports Bool)
(declare-const transfer_policy_documents_to_unauthorized_agents Bool)
(declare-const unauthorized_suspension_or_resumption_of_business Bool)
(declare-const use_illegal_methods_for_improper_insurance_payments Bool)
(declare-const use_improper_means_to_force_or_induce_contract Bool)
(declare-const use_license_for_others_without_executing_business Bool)
(declare-const use_unapproved_advertising_or_promotion Bool)
(declare-const violate_financial_or_business_management_rule_163_4 Bool)
(declare-const violate_rule_163_5_applied Bool)
(declare-const violate_rule_163_7 Bool)
(declare-const violate_rule_165_1 Bool)
(declare-const violation_management_rule Bool)
(declare-const violation_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_violation] 保險代理人、經紀人、公證人違反法令或有礙健全經營
(assert (= agent_violation agent_violates_law_or_hinders_sound_operation))

; [insurance:penalty_measures] 主管機關可依情節輕重採取處分措施
(assert (= penalty_measures
   (or dismiss_director_or_supervisor_or_suspend_duties
       other_necessary_measures
       order_dismiss_manager_or_staff
       restrict_business_scope)))

; [insurance:director_dismissal_notification] 解除董事或監察人職務時通知主管機關註銷登記
(assert (= director_dismissal_notification
   (or (not dismiss_director_or_supervisor_or_suspend_duties)
       notify_registration_authority_to_cancel_director_or_supervisor_registration)))

; [insurance:violation_management_rule] 違反財務或業務管理規定或相關規定
(assert (= violation_management_rule
   (or violate_financial_or_business_management_rule_163_4
       violate_rule_163_7
       violate_rule_165_1
       violate_rule_163_5_applied)))

; [insurance:violation_penalty] 違反管理規則應限期改正或處罰
(assert (= violation_penalty
   (or (and (not corrected_within_deadline)
            (<= 100000.0 fine_amount)
            (>= 3000000.0 fine_amount))
       license_revoked_and_certificate_cancelled
       corrected_within_deadline)))

; [insurance:agent_prohibited_behaviors] 代理人不得有違規行為
(assert (not (= (or induce_policyholder_to_cancel_or_transfer_or_loan
            collect_money_or_other_benefits_improperly
            pay_commission_to_non_actual_salesperson
            fail_to_fill_out_sales_report_truthfully
            unauthorized_suspension_or_resumption_of_business
            sell_unapproved_foreign_policy_discount_benefit_certificates
            false_report_on_license_application
            operate_without_approved_registration
            operate_outside_license_scope
            induce_clients_to_cancel_or_terminate_contracts_or_pay_by_loan
            transfer_policy_documents_to_unauthorized_agents
            embezzle_or_misappropriate_premiums_or_claims
            convicted_of_embezzlement_fraud_breach_of_trust_or_forgery
            submit_false_or_incomplete_business_or_financial_reports
            other_violations_of_rules_or_laws
            exaggerate_or_mislead_in_promotion_or_recruitment
            fail_to_report_to_agent_trade_association
            fail_to_reappoint_agent_after_resignation
            use_illegal_methods_for_improper_insurance_payments
            spread_false_statements_or_disrupt_financial_order
            fail_to_confirm_suitability_for_financial_consumers
            hold_positions_in_insurance_or_association_conflicts
            intentionally_hide_important_contract_info
            fail_to_cancel_license_within_specified_period
            authorize_others_to_operate_or_use_others_name
            employ_unqualified_personnel_for_insurance_sales
            use_unapproved_advertising_or_promotion
            use_improper_means_to_force_or_induce_contract
            execute_unapproved_insurance_business
            other_behaviors_damaging_insurance_image
            use_license_for_others_without_executing_business)
        agent_prohibited_behaviors)))

; [insurance:agent_license_requirements] 代理人應經主管機關許可、繳存保證金、投保相關保險並領有執業證照
(assert (= agent_license_requirements
   (and approved_by_authority
        (>= deposit_guarantee_amount minimum_guarantee_amount)
        insured_relevant_insurance
        license_issued)))

; [insurance:relevant_insurance_types] 保險代理人、公證人投保責任保險，經紀人投保責任保險及保證保險
(assert (= relevant_insurance_types
   (and agent_or_notary_responsibility_insurance
        (or (not is_broker) broker_responsibility_and_guarantee_insurance))))

; [insurance:agent_fixed_office_and_accounting] 代理人應有固定業務處所並專設帳簿記載業務收支
(assert (= agent_fixed_office_and_accounting
   (and has_fixed_office has_dedicated_accounting_books)))

; [insurance:single_license_for_multiple_qualifications] 兼有代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license_for_multiple_qualifications
   (>= 1
       (+ (ite has_agent_license 1 0)
          (ite has_broker_license 1 0)
          (ite has_notary_license 1 0)))))

; [insurance:internal_control_requirement] 公開發行或具一定規模代理人公司應建立內部控制、稽核及招攬處理制度
(assert (= internal_control_requirement
   (or (not (or is_public_company has_certain_scale))
       (and internal_control_established
            audit_system_established
            solicitation_handling_system_established))))

; [meta:penalty_default_false] 預設不處罰
(assert (or (not (and (not agent_violation)
              (not violation_management_rule)
              (not agent_prohibited_behaviors)
              (not agent_license_requirements)
              (not agent_fixed_office_and_accounting)
              (not single_license_for_multiple_qualifications)
              (not internal_control_requirement)))
    (not penalty)))

; [meta:penalty_conditions] 處罰條件：違反代理人管理規則或保險法相關規定時處罰
(assert (= penalty
   (or agent_violation
       (not agent_license_requirements)
       violation_management_rule
       agent_prohibited_behaviors
       (not single_license_for_multiple_qualifications)
       (not agent_fixed_office_and_accounting)
       (not internal_control_requirement))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_violates_law_or_hinders_sound_operation true))
(assert (= agent_violation true))
(assert (= fail_to_confirm_suitability_for_financial_consumers true))
(assert (= fail_to_fill_out_sales_report_truthfully true))
(assert (= corrected_within_deadline true))
(assert (= fine_amount 1800000.0))
(assert (= penalty true))
(assert (= penalty_measures false))
(assert (= agent_prohibited_behaviors false))
(assert (= agent_license_requirements true))
(assert (= agent_fixed_office_and_accounting true))
(assert (= single_license_for_multiple_qualifications false))
(assert (= internal_control_requirement false))
(assert (= approved_by_authority true))
(assert (= has_fixed_office true))
(assert (= has_dedicated_accounting_books true))
(assert (= license_issued true))
(assert (= deposit_guarantee_amount 1000000.0))
(assert (= minimum_guarantee_amount 1000000.0))
(assert (= insured_relevant_insurance true))
(assert (= agent_or_notary_responsibility_insurance true))
(assert (= is_broker false))
(assert (= broker_responsibility_and_guarantee_insurance false))
(assert (= has_agent_license true))
(assert (= has_broker_license false))
(assert (= has_notary_license false))
(assert (= is_public_company false))
(assert (= has_certain_scale false))
(assert (= internal_control_established false))
(assert (= audit_system_established false))
(assert (= solicitation_handling_system_established false))
(assert (= dismiss_director_or_supervisor_or_suspend_duties false))
(assert (= notify_registration_authority_to_cancel_director_or_supervisor_registration false))
(assert (= restrict_business_scope false))
(assert (= order_dismiss_manager_or_staff false))
(assert (= other_necessary_measures false))
(assert (= license_revoked_and_certificate_cancelled false))
(assert (= authorize_others_to_operate_or_use_others_name false))
(assert (= collect_money_or_other_benefits_improperly false))
(assert (= convicted_of_embezzlement_fraud_breach_of_trust_or_forgery false))
(assert (= director_dismissal_notification false))
(assert (= embezzle_or_misappropriate_premiums_or_claims false))
(assert (= employ_unqualified_personnel_for_insurance_sales false))
(assert (= exaggerate_or_mislead_in_promotion_or_recruitment false))
(assert (= execute_unapproved_insurance_business false))
(assert (= fail_to_cancel_license_within_specified_period false))
(assert (= fail_to_reappoint_agent_after_resignation false))
(assert (= fail_to_report_to_agent_trade_association false))
(assert (= false_report_on_license_application false))
(assert (= hold_positions_in_insurance_or_association_conflicts false))
(assert (= induce_clients_to_cancel_or_terminate_contracts_or_pay_by_loan false))
(assert (= induce_policyholder_to_cancel_or_transfer_or_loan false))
(assert (= intentionally_hide_important_contract_info false))
(assert (= operate_outside_license_scope false))
(assert (= operate_without_approved_registration false))
(assert (= other_behaviors_damaging_insurance_image false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= pay_commission_to_non_actual_salesperson false))
(assert (= relevant_insurance_types false))
(assert (= sell_unapproved_foreign_policy_discount_benefit_certificates false))
(assert (= spread_false_statements_or_disrupt_financial_order false))
(assert (= submit_false_or_incomplete_business_or_financial_reports false))
(assert (= transfer_policy_documents_to_unauthorized_agents false))
(assert (= unauthorized_suspension_or_resumption_of_business false))
(assert (= use_illegal_methods_for_improper_insurance_payments false))
(assert (= use_improper_means_to_force_or_induce_contract false))
(assert (= use_license_for_others_without_executing_business false))
(assert (= use_unapproved_advertising_or_promotion false))
(assert (= violate_financial_or_business_management_rule_163_4 false))
(assert (= violate_rule_163_5_applied false))
(assert (= violate_rule_163_7 false))
(assert (= violate_rule_165_1 false))
(assert (= violation_management_rule false))
(assert (= violation_penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 74
; Total facts: 74
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
