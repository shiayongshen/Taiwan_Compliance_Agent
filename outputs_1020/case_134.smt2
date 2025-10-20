; SMT2 file generated from compliance case automatic
; Case ID: case_134
; Generated at: 2025-10-19T08:54:13.688072
;
; This file can be executed with Z3:
;   z3 case_134.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const broker_rule_49_violation Bool)
(declare-const penalty Bool)
(declare-const rule_49_10_operate_outside_license_scope Bool)
(declare-const rule_49_11_illegal_fee_or_commission Bool)
(declare-const rule_49_12_illegal_insurance_payment Bool)
(declare-const rule_49_13_spread_false_info_disturb_financial_order Bool)
(declare-const rule_49_14_authorize_others_to_operate Bool)
(declare-const rule_49_15_illegal_transfer_of_application_documents Bool)
(declare-const rule_49_16_employ_unqualified_recruiter Bool)
(declare-const rule_49_17_fail_to_cancel_license_in_time Bool)
(declare-const rule_49_18_unauthorized_suspend_or_terminate_business Bool)
(declare-const rule_49_19_fail_to_appoint_broker_after_resignation Bool)
(declare-const rule_49_1_false_report Bool)
(declare-const rule_49_20_fail_to_report_to_broker_association Bool)
(declare-const rule_49_21_use_unapproved_advertisement Bool)
(declare-const rule_49_22_pay_commission_to_non_actual_recruiter Bool)
(declare-const rule_49_23_fail_to_confirm_suitability_for_seniors Bool)
(declare-const rule_49_24_sell_unapproved_foreign_policy_discount_certificates Bool)
(declare-const rule_49_25_false_or_incomplete_business_or_financial_reports Bool)
(declare-const rule_49_26_conflict_of_interest_positions Bool)
(declare-const rule_49_27_induce_contract_termination_or_loan_payment Bool)
(declare-const rule_49_28_fail_to_fill_recruitment_report_truthfully Bool)
(declare-const rule_49_29_other_violations_of_rules_or_laws Bool)
(declare-const rule_49_2_contract_without_approval Bool)
(declare-const rule_49_30_other_actions_damaging_insurance_image Bool)
(declare-const rule_49_3_hide_important_contract_info Bool)
(declare-const rule_49_4_force_or_induce_unfair_contract Bool)
(declare-const rule_49_5_false_or_misleading_promotion Bool)
(declare-const rule_49_6_improper_induce_policyholder Bool)
(declare-const rule_49_7_misappropriate_insurance_funds Bool)
(declare-const rule_49_8_unauthorized_use_license Bool)
(declare-const rule_49_9_convicted_fraud_or_forgery Bool)
(declare-const violate_163_4_financial_or_business_management Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1_or_163_5_applied Bool)
(declare-const violation_163_4_7_165_1_163_5 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_163_4_7_165_1_163_5] 違反保險法第163條第4項財務或業務管理規定、第7項規定，或違反第165條第1項及第163條第5項準用規定
(assert (= violation_163_4_7_165_1_163_5
   (or violate_163_4_financial_or_business_management
       violate_163_7
       violate_165_1_or_163_5_applied)))

; [insurance:broker_rule_49_violation] 違反保險經紀人管理規則第49條任一款規定
(assert (= broker_rule_49_violation
   (or rule_49_16_employ_unqualified_recruiter
       rule_49_11_illegal_fee_or_commission
       rule_49_13_spread_false_info_disturb_financial_order
       rule_49_9_convicted_fraud_or_forgery
       rule_49_15_illegal_transfer_of_application_documents
       rule_49_30_other_actions_damaging_insurance_image
       rule_49_4_force_or_induce_unfair_contract
       rule_49_18_unauthorized_suspend_or_terminate_business
       rule_49_17_fail_to_cancel_license_in_time
       rule_49_27_induce_contract_termination_or_loan_payment
       rule_49_19_fail_to_appoint_broker_after_resignation
       rule_49_6_improper_induce_policyholder
       rule_49_21_use_unapproved_advertisement
       rule_49_14_authorize_others_to_operate
       rule_49_20_fail_to_report_to_broker_association
       rule_49_8_unauthorized_use_license
       rule_49_12_illegal_insurance_payment
       rule_49_1_false_report
       rule_49_22_pay_commission_to_non_actual_recruiter
       rule_49_23_fail_to_confirm_suitability_for_seniors
       rule_49_29_other_violations_of_rules_or_laws
       rule_49_10_operate_outside_license_scope
       rule_49_25_false_or_incomplete_business_or_financial_reports
       rule_49_24_sell_unapproved_foreign_policy_discount_certificates
       rule_49_26_conflict_of_interest_positions
       rule_49_3_hide_important_contract_info
       rule_49_28_fail_to_fill_recruitment_report_truthfully
       rule_49_2_contract_without_approval
       rule_49_5_false_or_misleading_promotion
       rule_49_7_misappropriate_insurance_funds)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反保險法第163條相關規定或保險經紀人管理規則第49條任一款規定時處罰
(assert (= penalty (or broker_rule_49_violation violation_163_4_7_165_1_163_5)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= broker_rule_49_violation true))
(assert (= rule_49_16_employ_unqualified_recruiter true))
(assert (= rule_49_11_illegal_fee_or_commission true))
(assert (= penalty true))
(assert (= rule_49_1_false_report false))
(assert (= rule_49_2_contract_without_approval false))
(assert (= rule_49_3_hide_important_contract_info false))
(assert (= rule_49_4_force_or_induce_unfair_contract false))
(assert (= rule_49_5_false_or_misleading_promotion false))
(assert (= rule_49_6_improper_induce_policyholder false))
(assert (= rule_49_7_misappropriate_insurance_funds false))
(assert (= rule_49_8_unauthorized_use_license false))
(assert (= rule_49_9_convicted_fraud_or_forgery false))
(assert (= rule_49_10_operate_outside_license_scope false))
(assert (= rule_49_12_illegal_insurance_payment false))
(assert (= rule_49_13_spread_false_info_disturb_financial_order false))
(assert (= rule_49_14_authorize_others_to_operate false))
(assert (= rule_49_15_illegal_transfer_of_application_documents false))
(assert (= rule_49_17_fail_to_cancel_license_in_time false))
(assert (= rule_49_18_unauthorized_suspend_or_terminate_business false))
(assert (= rule_49_19_fail_to_appoint_broker_after_resignation false))
(assert (= rule_49_20_fail_to_report_to_broker_association false))
(assert (= rule_49_21_use_unapproved_advertisement false))
(assert (= rule_49_22_pay_commission_to_non_actual_recruiter false))
(assert (= rule_49_23_fail_to_confirm_suitability_for_seniors false))
(assert (= rule_49_24_sell_unapproved_foreign_policy_discount_certificates false))
(assert (= rule_49_25_false_or_incomplete_business_or_financial_reports false))
(assert (= rule_49_26_conflict_of_interest_positions false))
(assert (= rule_49_27_induce_contract_termination_or_loan_payment false))
(assert (= rule_49_28_fail_to_fill_recruitment_report_truthfully false))
(assert (= rule_49_29_other_violations_of_rules_or_laws false))
(assert (= rule_49_30_other_actions_damaging_insurance_image false))
(assert (= violate_163_4_financial_or_business_management false))
(assert (= violate_163_7 false))
(assert (= violate_165_1_or_163_5_applied false))
(assert (= violation_163_4_7_165_1_163_5 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 4
; Total variables: 36
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
