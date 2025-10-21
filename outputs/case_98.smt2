; SMT2 file generated from compliance case automatic
; Case ID: case_98
; Generated at: 2025-10-21T01:35:34.703064
;
; This file can be executed with Z3:
;   z3 case_98.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bond_deposited Bool)
(declare-const broker_duty_of_care_and_fiduciary Bool)
(declare-const broker_report_and_fee_disclosed Bool)
(declare-const duty_of_care_observed Bool)
(declare-const fee_charged Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const fiduciary_duty_observed Bool)
(declare-const financial_and_business_management_compliant Bool)
(declare-const financial_and_business_management_followed Bool)
(declare-const guarantee_insurance_purchased Bool)
(declare-const insurance_purchased Bool)
(declare-const insurance_type_compliant Bool)
(declare-const is_agent_or_notary Bool)
(declare-const is_broker Bool)
(declare-const liability_insurance_purchased Bool)
(declare-const license_obtained Bool)
(declare-const licensed_and_bonded Bool)
(declare-const management_rules_complied Bool)
(declare-const management_rules_followed Bool)
(declare-const no_coercion_or_illegal_inducement Bool)
(declare-const no_commission_payment_to_non_actual_recruiters Bool)
(declare-const no_concealment_of_important_contract_info Bool)
(declare-const no_conflict_of_interest_or_ineligible_positions Bool)
(declare-const no_contract_with_unapproved_insurers Bool)
(declare-const no_conviction_for_fraud_or_forgery Bool)
(declare-const no_employment_of_unqualified_recruiters Bool)
(declare-const no_failure_to_cancel_license_in_time Bool)
(declare-const no_failure_to_confirm_suitability_for_seniors Bool)
(declare-const no_failure_to_reappoint_broker_after_resignation Bool)
(declare-const no_failure_to_report_to_broker_association Bool)
(declare-const no_false_declaration_on_license_application Bool)
(declare-const no_false_or_incomplete_business_or_financial_reports Bool)
(declare-const no_false_or_misleading_promotion Bool)
(declare-const no_false_recruitment_reports_for_seniors Bool)
(declare-const no_illegal_commission_or_fee_collection Bool)
(declare-const no_illegal_insurance_claims Bool)
(declare-const no_improper_inducement_to_cancel_or_loan Bool)
(declare-const no_inducement_to_terminate_contracts_or_loans Bool)
(declare-const no_misappropriation_of_funds Bool)
(declare-const no_operation_outside_license_scope Bool)
(declare-const no_other_actions_damaging_insurance_reputation Bool)
(declare-const no_other_violations_of_rules_or_laws Bool)
(declare-const no_prohibited_acts Bool)
(declare-const no_sale_of_unapproved_foreign_policies Bool)
(declare-const no_spreading_false_information Bool)
(declare-const no_unauthorized_advertisement_content Bool)
(declare-const no_unauthorized_delegation_or_nominee_operation Bool)
(declare-const no_unauthorized_suspension_or_termination_of_business Bool)
(declare-const no_unauthorized_transfer_of_application_documents Bool)
(declare-const no_unauthorized_use_of_license Bool)
(declare-const other_management_rules_compliant Bool)
(declare-const other_management_rules_followed Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const written_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:licensed_and_bonded] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= licensed_and_bonded
   (and license_obtained
        bond_deposited
        insurance_purchased
        practice_certificate_held)))

; [insurance:insurance_type_for_agent_broker_notary] 保險代理人、公證人須投保責任保險；保險經紀人須投保責任保險及保證保險
(assert (= insurance_type_compliant
   (and (or (not is_agent_or_notary) liability_insurance_purchased)
        (or (not is_broker)
            (and liability_insurance_purchased guarantee_insurance_purchased)))))

; [insurance:agent_broker_notary_must_comply_management_rules] 保險代理人、經紀人、公證人應遵守主管機關定之管理規則
(assert (= management_rules_complied management_rules_followed))

; [insurance:broker_duty_of_care_and_fiduciary] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fiduciary
   (and duty_of_care_observed fiduciary_duty_observed)))

; [insurance:broker_must_provide_written_report_and_disclose_fee] 保險經紀人洽訂保險契約前應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_report_and_fee_disclosed
   (and written_report_provided (or (not fee_charged) fee_standard_disclosed))))

; [insurance:broker_must_comply_financial_and_business_management_rules] 保險經紀人違反財務或業務管理規定應限期改正或處罰
(assert (= financial_and_business_management_compliant
   financial_and_business_management_followed))

; [insurance:broker_must_comply_other_management_rules] 保險經紀人違反主管機關管理規則或相關法令應限期改正或處罰
(assert (= other_management_rules_compliant other_management_rules_followed))

; [insurance:broker_must_not_commit_prohibited_acts] 保險經紀人不得有第49條所列禁止行為
(assert (= no_prohibited_acts
   (and no_false_declaration_on_license_application
        no_contract_with_unapproved_insurers
        no_concealment_of_important_contract_info
        no_coercion_or_illegal_inducement
        no_false_or_misleading_promotion
        no_improper_inducement_to_cancel_or_loan
        no_misappropriation_of_funds
        no_unauthorized_use_of_license
        no_conviction_for_fraud_or_forgery
        no_operation_outside_license_scope
        no_illegal_commission_or_fee_collection
        no_illegal_insurance_claims
        no_spreading_false_information
        no_unauthorized_delegation_or_nominee_operation
        no_unauthorized_transfer_of_application_documents
        no_employment_of_unqualified_recruiters
        no_failure_to_cancel_license_in_time
        no_unauthorized_suspension_or_termination_of_business
        no_failure_to_reappoint_broker_after_resignation
        no_failure_to_report_to_broker_association
        no_unauthorized_advertisement_content
        no_commission_payment_to_non_actual_recruiters
        no_failure_to_confirm_suitability_for_seniors
        no_sale_of_unapproved_foreign_policies
        no_false_or_incomplete_business_or_financial_reports
        no_conflict_of_interest_or_ineligible_positions
        no_inducement_to_terminate_contracts_or_loans
        no_false_recruitment_reports_for_seniors
        no_other_violations_of_rules_or_laws
        no_other_actions_damaging_insurance_reputation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、繳存保證金、投保相關保險、管理規則或禁止行為時處罰
(assert (= penalty
   (or (not broker_report_and_fee_disclosed)
       (not other_management_rules_compliant)
       (not insurance_type_compliant)
       (not broker_duty_of_care_and_fiduciary)
       (not financial_and_business_management_compliant)
       (not licensed_and_bonded)
       (not no_prohibited_acts)
       (not management_rules_complied))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_obtained true))
(assert (= bond_deposited true))
(assert (= insurance_purchased true))
(assert (= practice_certificate_held true))
(assert (= is_broker true))
(assert (= liability_insurance_purchased true))
(assert (= guarantee_insurance_purchased true))
(assert (= management_rules_followed false))
(assert (= financial_and_business_management_followed true))
(assert (= other_management_rules_followed true))
(assert (= duty_of_care_observed true))
(assert (= fiduciary_duty_observed true))
(assert (= written_report_provided true))
(assert (= fee_charged true))
(assert (= fee_standard_disclosed true))
(assert (= no_false_declaration_on_license_application true))
(assert (= no_contract_with_unapproved_insurers true))
(assert (= no_concealment_of_important_contract_info true))
(assert (= no_coercion_or_illegal_inducement true))
(assert (= no_false_or_misleading_promotion true))
(assert (= no_improper_inducement_to_cancel_or_loan true))
(assert (= no_misappropriation_of_funds true))
(assert (= no_unauthorized_use_of_license true))
(assert (= no_conviction_for_fraud_or_forgery true))
(assert (= no_operation_outside_license_scope false))
(assert (= no_illegal_commission_or_fee_collection false))
(assert (= no_illegal_insurance_claims true))
(assert (= no_spreading_false_information true))
(assert (= no_unauthorized_delegation_or_nominee_operation true))
(assert (= no_unauthorized_transfer_of_application_documents true))
(assert (= no_employment_of_unqualified_recruiters true))
(assert (= no_failure_to_cancel_license_in_time true))
(assert (= no_unauthorized_suspension_or_termination_of_business true))
(assert (= no_failure_to_reappoint_broker_after_resignation true))
(assert (= no_failure_to_report_to_broker_association true))
(assert (= no_unauthorized_advertisement_content true))
(assert (= no_commission_payment_to_non_actual_recruiters true))
(assert (= no_failure_to_confirm_suitability_for_seniors true))
(assert (= no_sale_of_unapproved_foreign_policies true))
(assert (= no_false_or_incomplete_business_or_financial_reports true))
(assert (= no_conflict_of_interest_or_ineligible_positions true))
(assert (= no_inducement_to_terminate_contracts_or_loans true))
(assert (= no_false_recruitment_reports_for_seniors true))
(assert (= no_other_violations_of_rules_or_laws true))
(assert (= no_other_actions_damaging_insurance_reputation true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 55
; Total facts: 45
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
