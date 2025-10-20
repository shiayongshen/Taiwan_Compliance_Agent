; SMT2 file generated from compliance case automatic
; Case ID: case_153
; Generated at: 2025-10-19T09:28:18.424363
;
; This file can be executed with Z3:
;   z3 case_153.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_or_notary Bool)
(declare-const approved_by_authority Bool)
(declare-const authority_defined_management_rules Bool)
(declare-const authority_defined_minimum_guarantee_deposit Real)
(declare-const authorize_others_to_operate Bool)
(declare-const bank_authority_permission Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_for_agent_or_broker Bool)
(declare-const broker Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_fidelity_duty Bool)
(declare-const broker_prohibited_acts Bool)
(declare-const broker_report_and_fee_disclosure Bool)
(declare-const business_scope_restriction Bool)
(declare-const charge_illegal_fees_or_commissions Bool)
(declare-const coerce_or_induce_contract Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const convicted_of_fraud_or_forgery Bool)
(declare-const corrective_order_issued Bool)
(declare-const damage_insurance_image Bool)
(declare-const director_or_supervisor_dismissed Bool)
(declare-const director_or_supervisor_dismissed_or_suspended Bool)
(declare-const director_supervisor_dismissal_notification Bool)
(declare-const dismissal_notification_sent Bool)
(declare-const employ_unqualified_recruiters Bool)
(declare-const fail_to_appoint_replacement_broker Bool)
(declare-const fail_to_cancel_license_in_time Bool)
(declare-const fail_to_confirm_suitability_for_seniors Bool)
(declare-const fail_to_fill_recruitment_report_truthfully Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_or_incomplete_report Bool)
(declare-const false_report_on_license_application Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosure_made Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance_purchased Bool)
(declare-const hold_conflicting_positions Bool)
(declare-const illegal_insurance_payments Bool)
(declare-const improvement_order_issued Bool)
(declare-const induce_contract_termination_or_loan Bool)
(declare-const induce_policyholder_to_cancel_or_loan Bool)
(declare-const liability_insurance_purchased Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_canceled Bool)
(declare-const license_held Bool)
(declare-const license_revoked Bool)
(declare-const license_used_by_others Bool)
(declare-const management_rules_defined Bool)
(declare-const manager_or_staff_dismissed Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const minimum_guarantee_deposit_defined Bool)
(declare-const misappropriate_insurance_funds Bool)
(declare-const misleading_promotion_or_recruitment Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const ordered_to_correct Bool)
(declare-const other_necessary_measures_taken Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_recruiters Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_amount Real)
(declare-const penalty_fine_imposed Bool)
(declare-const penalty_for_violation_of_management_rules Bool)
(declare-const relevant_insurance_purchased Bool)
(declare-const relevant_insurance_type_compliance Bool)
(declare-const sell_unapproved_foreign_policies Bool)
(declare-const spread_false_information Bool)
(declare-const transfer_application_documents_improperly Bool)
(declare-const unauthorized_suspend_or_terminate_business Bool)
(declare-const unauthorized_use_of_advertisement Bool)
(declare-const violation_penalties Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and approved_by_authority
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_purchased
        license_held)))

; [insurance:relevant_insurance_type_compliance] 保險代理人、公證人須投保責任保險；保險經紀人須投保責任保險及保證保險
(assert (= relevant_insurance_type_compliance
   (or (and agent_or_notary liability_insurance_purchased)
       (and broker liability_insurance_purchased guarantee_insurance_purchased))))

; [insurance:minimum_guarantee_deposit_defined] 主管機關定最低保證金及實施方式，考量經營業務範圍及規模
(assert (= minimum_guarantee_deposit_defined
   (= authority_defined_minimum_guarantee_deposit 1.0)))

; [insurance:management_rules_defined] 主管機關定保險代理人、經紀人、公證人資格取得、申請許可條件、程序及其他管理規則
(assert (= management_rules_defined authority_defined_management_rules))

; [insurance:bank_permission_for_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_for_agent_or_broker
   (and bank_authority_permission
        (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_duty_of_care broker_fidelity_duty)))

; [insurance:broker_must_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_report_and_fee_disclosure
   (and written_analysis_report_provided
        (or (not fee_charged) fee_disclosure_made))))

; [insurance:violation_penalties] 違反法令或有礙健全經營時，主管機關得糾正、限期改善或處分
(assert (= violation_penalties
   (or director_or_supervisor_dismissed_or_suspended
       business_scope_restriction
       other_necessary_measures_taken
       manager_or_staff_dismissed
       improvement_order_issued
       corrective_order_issued)))

; [insurance:director_supervisor_dismissal_notification] 依規定解除董事或監察人職務時，主管機關通知公司登記主管機關註銷登記
(assert (= director_supervisor_dismissal_notification
   (or (not director_or_supervisor_dismissed) dismissal_notification_sent)))

; [insurance:penalty_for_violation_of_management_rules] 違反管理規則財務或業務管理規定、或相關規定者，應限期改正或處罰，情節重大者廢止許可並註銷執業證照
(assert (= penalty_for_violation_of_management_rules
   (or (and penalty_fine_imposed
            (<= 100000.0 penalty_fine_amount)
            (>= 3000000.0 penalty_fine_amount))
       (and license_revoked license_canceled)
       ordered_to_correct)))

; [insurance:broker_prohibited_acts] 保險經紀人及相關人員不得有規則第49條列舉之不當行為
(assert (not (= (or induce_policyholder_to_cancel_or_loan
            license_used_by_others
            authorize_others_to_operate
            convicted_of_fraud_or_forgery
            employ_unqualified_recruiters
            fail_to_appoint_replacement_broker
            misleading_promotion_or_recruitment
            operate_outside_license_scope
            fail_to_confirm_suitability_for_seniors
            hold_conflicting_positions
            induce_contract_termination_or_loan
            conceal_important_contract_info
            sell_unapproved_foreign_policies
            pay_commission_to_non_recruiters
            fail_to_report_to_broker_association
            misappropriate_insurance_funds
            fail_to_cancel_license_in_time
            fail_to_fill_recruitment_report_truthfully
            coerce_or_induce_contract
            damage_insurance_image
            charge_illegal_fees_or_commissions
            unauthorized_suspend_or_terminate_business
            false_or_incomplete_report
            illegal_insurance_payments
            unauthorized_use_of_advertisement
            transfer_application_documents_improperly
            other_violations_of_rules_or_laws
            false_report_on_license_application
            spread_false_information
            contract_with_unapproved_insurer)
        broker_prohibited_acts)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照、或有違反管理規則及不當行為時處罰
(assert (= penalty
   (or (not violation_penalties)
       (not penalty_for_violation_of_management_rules)
       (not relevant_insurance_type_compliance)
       (not broker_report_and_fee_disclosure)
       (not license_and_guarantee_compliance)
       (not broker_duty_of_care_and_fidelity)
       (not management_rules_defined)
       (not broker_prohibited_acts))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_or_notary false))
(assert (= approved_by_authority true))
(assert (= authority_defined_management_rules true))
(assert (= authority_defined_minimum_guarantee_deposit 1000000.0))
(assert (= authorize_others_to_operate false))
(assert (= bank_authority_permission true))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker true))
(assert (= bank_permission_for_agent_or_broker true))
(assert (= broker true))
(assert (= broker_duty_of_care false))
(assert (= broker_fidelity_duty false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_prohibited_acts false))
(assert (= broker_report_and_fee_disclosure false))
(assert (= business_scope_restriction false))
(assert (= charge_illegal_fees_or_commissions false))
(assert (= coerce_or_induce_contract false))
(assert (= conceal_important_contract_info false))
(assert (= contract_with_unapproved_insurer false))
(assert (= convicted_of_fraud_or_forgery false))
(assert (= corrective_order_issued true))
(assert (= damage_insurance_image false))
(assert (= director_or_supervisor_dismissed false))
(assert (= director_or_supervisor_dismissed_or_suspended false))
(assert (= director_supervisor_dismissal_notification false))
(assert (= dismissal_notification_sent false))
(assert (= employ_unqualified_recruiters false))
(assert (= fail_to_appoint_replacement_broker false))
(assert (= fail_to_cancel_license_in_time false))
(assert (= fail_to_confirm_suitability_for_seniors false))
(assert (= fail_to_fill_recruitment_report_truthfully false))
(assert (= fail_to_report_to_broker_association false))
(assert (= false_or_incomplete_report true))
(assert (= false_report_on_license_application false))
(assert (= fee_charged false))
(assert (= fee_disclosure_made false))
(assert (= guarantee_deposit_amount 1000000.0))
(assert (= guarantee_insurance_purchased true))
(assert (= hold_conflicting_positions false))
(assert (= illegal_insurance_payments false))
(assert (= improvement_order_issued false))
(assert (= induce_contract_termination_or_loan false))
(assert (= induce_policyholder_to_cancel_or_loan false))
(assert (= liability_insurance_purchased true))
(assert (= license_and_guarantee_compliance true))
(assert (= license_canceled false))
(assert (= license_held true))
(assert (= license_revoked false))
(assert (= license_used_by_others false))
(assert (= management_rules_defined true))
(assert (= manager_or_staff_dismissed false))
(assert (= minimum_guarantee_deposit 1000000.0))
(assert (= minimum_guarantee_deposit_defined true))
(assert (= misappropriate_insurance_funds false))
(assert (= misleading_promotion_or_recruitment false))
(assert (= operate_outside_license_scope false))
(assert (= ordered_to_correct true))
(assert (= other_necessary_measures_taken false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= pay_commission_to_non_recruiters false))
(assert (= penalty true))
(assert (= penalty_fine_amount 1800000.0))
(assert (= penalty_fine_imposed true))
(assert (= penalty_for_violation_of_management_rules true))
(assert (= relevant_insurance_purchased true))
(assert (= relevant_insurance_type_compliance true))
(assert (= sell_unapproved_foreign_policies false))
(assert (= spread_false_information false))
(assert (= transfer_application_documents_improperly false))
(assert (= unauthorized_suspend_or_terminate_business false))
(assert (= unauthorized_use_of_advertisement false))
(assert (= violation_penalties true))
(assert (= written_analysis_report_provided false))

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
