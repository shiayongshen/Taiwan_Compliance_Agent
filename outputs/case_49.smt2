; SMT2 file generated from compliance case automatic
; Case ID: case_49
; Generated at: 2025-10-21T00:11:55.419144
;
; This file can be executed with Z3:
;   z3 case_49.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_reports_submitted_on_time Bool)
(declare-const application_conditions_met Bool)
(declare-const application_procedures_followed Bool)
(declare-const approved_by_authority Bool)
(declare-const authority_defined_minimum_guarantee_deposit Real)
(declare-const authorize_third_party_to_operate Bool)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_authority_approval_for_agent_or_broker Bool)
(declare-const bank_operates_as_agent Bool)
(declare-const bank_operates_as_broker Bool)
(declare-const board_and_supervisor_qualifications_met Bool)
(declare-const branch_establishment_conditions_met Bool)
(declare-const broker_company_fails_to_apply_resume_and_employ_broker Bool)
(declare-const broker_company_fails_to_cancel_broker_license_after_license_revocation Bool)
(declare-const broker_company_fails_to_cancel_broker_license_on_stop_or_dissolve Bool)
(declare-const broker_company_fails_to_report_stop_of_insurance_or_reinsurance_brokerage Bool)
(declare-const broker_company_fails_to_report_stop_or_resume Bool)
(declare-const broker_discloses_compensation_standard Bool)
(declare-const broker_duty_of_care_and_fiduciary Bool)
(declare-const broker_exercises_duty_of_care Bool)
(declare-const broker_fails_to_cancel_license_within_30_days_after_company_stop_or_dissolve_or_revocation Bool)
(declare-const broker_fulfills_fiduciary_duty Bool)
(declare-const broker_provide_written_analysis_report Bool)
(declare-const broker_provides_written_report Bool)
(declare-const broker_receives_compensation Bool)
(declare-const charge_unapproved_fees_or_commissions Bool)
(declare-const coerce_or_induce_contracting Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const continuous_follow_up_done Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const criminal_conviction_for_fraud_or_forgery Bool)
(declare-const dismissal_reasons_complied Bool)
(declare-const education_and_training_compliant Bool)
(declare-const employ_unqualified_insurance_solicitor Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_financial_consumer_suitability Bool)
(declare-const fail_to_employ_broker_after_employee_leaves Bool)
(declare-const fail_to_fill_out_solicitation_report_truthfully Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_information_on_license_application Bool)
(declare-const financial_and_business_management_compliant Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance_covered Bool)
(declare-const hold_positions_in_insurance_or_association Bool)
(declare-const holding_practice_license Bool)
(declare-const illegal_insurance_payments Bool)
(declare-const improper_inducement_to_cancel_or_loan Bool)
(declare-const improvement_reports_submitted_to_board_and_audit_committee Bool)
(declare-const induce_contract_termination_or_loan_payment Bool)
(declare-const inspection_reports_improvements_done Bool)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const liability_insurance_covered Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_revocation_procedures_complied Bool)
(declare-const management_rules_compliance Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const misappropriate_insurance_funds Bool)
(declare-const misleading_promotion_or_recruitment Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_acts_damaging_insurance_image Bool)
(declare-const other_mandatory_requirements_complied Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_solicitor Bool)
(declare-const penalty Bool)
(declare-const prohibited_conduct_compliance Bool)
(declare-const qualification_requirements_met Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const reporting_and_improvement_compliance Bool)
(declare-const required_documents_submitted Bool)
(declare-const sell_unapproved_foreign_policy_discount_benefit Bool)
(declare-const special_account_books_maintained Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const submit_false_or_incomplete_reports Bool)
(declare-const transfer_documents_to_unassigned_broker_or_agent Bool)
(declare-const unauthorized_stop_or_suspend_or_dissolve Bool)
(declare-const unauthorized_use_of_advertisement Bool)
(declare-const unauthorized_use_of_license Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_insurance_law_163_7 Bool)
(declare-const violation_broker_management_rules Bool)
(declare-const violation_financial_or_business_management Bool)
(declare-const violation_financial_or_business_management_or_broker_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and approved_by_authority
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_covered
        holding_practice_license)))

; [insurance:relevant_insurance_covered] 依身份投保相關保險：保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= relevant_insurance_covered
   (or (and is_agent liability_insurance_covered)
       (and is_notary liability_insurance_covered)
       (and is_broker liability_insurance_covered guarantee_insurance_covered))))

; [insurance:minimum_guarantee_deposit] 主管機關依經營業務範圍及規模等因素定最低保證金及實施方式
(assert (= minimum_guarantee_deposit authority_defined_minimum_guarantee_deposit))

; [insurance:management_rules_compliance] 遵守主管機關定之管理規則，包括資格取得、申請許可條件、程序、文件、董事監察人資格、解任事由、分支機構條件、財務與業務管理、教育訓練、廢止許可及其他事項
(assert (= management_rules_compliance
   (and qualification_requirements_met
        application_conditions_met
        application_procedures_followed
        required_documents_submitted
        board_and_supervisor_qualifications_met
        dismissal_reasons_complied
        branch_establishment_conditions_met
        financial_and_business_management_compliant
        education_and_training_compliant
        license_revocation_procedures_complied
        other_mandatory_requirements_complied)))

; [insurance:bank_authority_approval_for_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_authority_approval_for_agent_or_broker
   (and bank_approved_by_authority
        (or bank_operates_as_agent bank_operates_as_broker))))

; [insurance:broker_duty_of_care_and_fiduciary] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fiduciary
   (and broker_exercises_duty_of_care broker_fulfills_fiduciary_duty)))

; [insurance:broker_provide_written_analysis_report] 保險經紀人於主管機關指定範圍內洽訂契約前，主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (= broker_provide_written_analysis_report
   (and broker_provides_written_report
        (or broker_discloses_compensation_standard
            (not broker_receives_compensation)))))

; [insurance:violation_financial_or_business_management] 違反財務或業務管理規定
(assert (= violation_financial_or_business_management
   (or violate_financial_management_rules violate_business_management_rules)))

; [insurance:violation_broker_management_rules] 違反保險經紀人管理規則第27條規定
(assert (= violation_broker_management_rules
   (or broker_company_fails_to_report_stop_or_resume
       broker_fails_to_cancel_license_within_30_days_after_company_stop_or_dissolve_or_revocation
       broker_company_fails_to_report_stop_of_insurance_or_reinsurance_brokerage
       broker_company_fails_to_apply_resume_and_employ_broker
       broker_company_fails_to_cancel_broker_license_after_license_revocation
       broker_company_fails_to_cancel_broker_license_on_stop_or_dissolve)))

; [insurance:violation_financial_or_business_management_or_broker_rules] 違反財務或業務管理規定、保險經紀人管理規則第27條或保險法第163條第7項規定
(assert (= violation_financial_or_business_management_or_broker_rules
   (or violate_insurance_law_163_7
       violation_broker_management_rules
       violation_financial_or_business_management)))

; [insurance:reporting_and_improvement_compliance] 個人執業經紀人、經紀人公司及銀行應專設帳簿並於規定期限內彙報主管機關，並確實辦理改善及持續追蹤覆查
(assert (= reporting_and_improvement_compliance
   (and special_account_books_maintained
        annual_reports_submitted_on_time
        inspection_reports_improvements_done
        continuous_follow_up_done
        improvement_reports_submitted_to_board_and_audit_committee)))

; [insurance:prohibited_conduct_compliance] 個人執業經紀人、經紀人公司、銀行及受任用經紀人不得有保險經紀人管理規則第49條所列禁止行為
(assert (= prohibited_conduct_compliance
   (and (not false_information_on_license_application)
        (not contract_with_unapproved_insurer)
        (not conceal_important_contract_info)
        (not coerce_or_induce_contracting)
        (not misleading_promotion_or_recruitment)
        (not improper_inducement_to_cancel_or_loan)
        (not misappropriate_insurance_funds)
        (not unauthorized_use_of_license)
        (not criminal_conviction_for_fraud_or_forgery)
        (not operate_outside_license_scope)
        (not charge_unapproved_fees_or_commissions)
        (not illegal_insurance_payments)
        (not spread_false_information_disturb_financial_order)
        (not authorize_third_party_to_operate)
        (not transfer_documents_to_unassigned_broker_or_agent)
        (not employ_unqualified_insurance_solicitor)
        (not fail_to_cancel_license_within_deadline)
        (not unauthorized_stop_or_suspend_or_dissolve)
        (not fail_to_employ_broker_after_employee_leaves)
        (not fail_to_report_to_broker_association)
        (not unauthorized_use_of_advertisement)
        (not pay_commission_to_non_actual_solicitor)
        (not fail_to_confirm_financial_consumer_suitability)
        (not sell_unapproved_foreign_policy_discount_benefit)
        (not submit_false_or_incomplete_reports)
        (not hold_positions_in_insurance_or_association)
        (not induce_contract_termination_or_loan_payment)
        (not fail_to_fill_out_solicitation_report_truthfully)
        (not other_violations_of_rules_or_laws)
        (not other_acts_damaging_insurance_image))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反主管機關管理規則財務或業務管理規定、保險經紀人管理規則第27條規定、保險法第163條第7項規定，或有禁止行為時處罰
(assert (= penalty
   (or violation_financial_or_business_management_or_broker_rules
       (not prohibited_conduct_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approved_by_authority true))
(assert (= guarantee_deposit_amount 500000))
(assert (= authority_defined_minimum_guarantee_deposit 500000))
(assert (= liability_insurance_covered true))
(assert (= guarantee_insurance_covered true))
(assert (= is_broker true))
(assert (= holding_practice_license false))
(assert (= annual_reports_submitted_on_time false))
(assert (= special_account_books_maintained true))
(assert (= inspection_reports_improvements_done false))
(assert (= continuous_follow_up_done false))
(assert (= improvement_reports_submitted_to_board_and_audit_committee false))
(assert (= broker_company_fails_to_report_stop_or_resume true))
(assert (= unauthorized_stop_or_suspend_or_dissolve true))
(assert (= violate_financial_management_rules true))
(assert (= violate_business_management_rules false))
(assert (= violation_financial_or_business_management true))
(assert (= violation_broker_management_rules true))
(assert (= violation_financial_or_business_management_or_broker_rules true))
(assert (= prohibited_conduct_compliance false))
(assert (= management_rules_compliance false))
(assert (= license_and_guarantee_compliance false))
(assert (= broker_provides_written_report true))
(assert (= broker_receives_compensation false))
(assert (= broker_discloses_compensation_standard true))
(assert (= broker_exercises_duty_of_care true))
(assert (= broker_fulfills_fiduciary_duty true))
(assert (= qualification_requirements_met true))
(assert (= application_conditions_met true))
(assert (= application_procedures_followed true))
(assert (= required_documents_submitted true))
(assert (= board_and_supervisor_qualifications_met true))
(assert (= dismissal_reasons_complied true))
(assert (= branch_establishment_conditions_met true))
(assert (= financial_and_business_management_compliant false))
(assert (= education_and_training_compliant true))
(assert (= license_revocation_procedures_complied false))
(assert (= other_mandatory_requirements_complied true))
(assert (= is_agent false))
(assert (= is_notary false))
(assert (= bank_approved_by_authority false))
(assert (= bank_operates_as_agent false))
(assert (= bank_operates_as_broker false))
(assert (= bank_authority_approval_for_agent_or_broker false))
(assert (= false_information_on_license_application false))
(assert (= contract_with_unapproved_insurer false))
(assert (= conceal_important_contract_info false))
(assert (= coerce_or_induce_contracting false))
(assert (= misleading_promotion_or_recruitment false))
(assert (= improper_inducement_to_cancel_or_loan false))
(assert (= misappropriate_insurance_funds false))
(assert (= unauthorized_use_of_license false))
(assert (= criminal_conviction_for_fraud_or_forgery false))
(assert (= operate_outside_license_scope false))
(assert (= charge_unapproved_fees_or_commissions false))
(assert (= illegal_insurance_payments false))
(assert (= spread_false_information_disturb_financial_order false))
(assert (= authorize_third_party_to_operate true))
(assert (= transfer_documents_to_unassigned_broker_or_agent false))
(assert (= employ_unqualified_insurance_solicitor false))
(assert (= fail_to_cancel_license_within_deadline true))
(assert (= fail_to_employ_broker_after_employee_leaves false))
(assert (= fail_to_report_to_broker_association false))
(assert (= unauthorized_use_of_advertisement false))
(assert (= pay_commission_to_non_actual_solicitor false))
(assert (= fail_to_confirm_financial_consumer_suitability false))
(assert (= sell_unapproved_foreign_policy_discount_benefit false))
(assert (= submit_false_or_incomplete_reports true))
(assert (= hold_positions_in_insurance_or_association false))
(assert (= induce_contract_termination_or_loan_payment false))
(assert (= fail_to_fill_out_solicitation_report_truthfully false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= other_acts_damaging_insurance_image false))
(assert (= reporting_and_improvement_compliance false))
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
; Total variables: 85
; Total facts: 75
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
