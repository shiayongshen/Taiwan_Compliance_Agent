; SMT2 file generated from compliance case automatic
; Case ID: case_154
; Generated at: 2025-10-21T21:33:00.737651
;
; This file can be executed with Z3:
;   z3 case_154.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_misconduct Bool)
(declare-const misconduct_10_conviction_of_fraud_or_breach_of_trust Bool)
(declare-const misconduct_11_operate_outside_license_scope Bool)
(declare-const misconduct_12_illegal_collection_of_money_or_benefits Bool)
(declare-const misconduct_13_illegal_insurance_payments Bool)
(declare-const misconduct_14_spread_false_information_disturb_financial_order Bool)
(declare-const misconduct_15_authorize_others_to_operate_or_use_others_name Bool)
(declare-const misconduct_16_illegal_transfer_of_policy_documents Bool)
(declare-const misconduct_17_employ_unqualified_insurance_recruiters Bool)
(declare-const misconduct_18_fail_to_cancel_license_within_deadline Bool)
(declare-const misconduct_19_unauthorized_suspension_or_termination_of_business Bool)
(declare-const misconduct_1_false_report_on_license_application Bool)
(declare-const misconduct_20_fail_to_appoint_agent_after_resignation Bool)
(declare-const misconduct_21_fail_to_report_to_agent_association Bool)
(declare-const misconduct_22_use_unapproved_advertisement_content Bool)
(declare-const misconduct_23_pay_commission_to_non_actual_recruiters Bool)
(declare-const misconduct_24_fail_to_confirm_suitability_for_financial_consumers Bool)
(declare-const misconduct_25_sell_unapproved_foreign_policy_discount_products Bool)
(declare-const misconduct_26_submit_false_or_incomplete_business_or_financial_reports Bool)
(declare-const misconduct_27_hold_positions_in_insurance_or_association_conflict Bool)
(declare-const misconduct_28_induce_contract_termination_or_use_loans_to_pay_premiums Bool)
(declare-const misconduct_29_fail_to_fill_recruitment_report_truthfully Bool)
(declare-const misconduct_2_unapproved_insurance_business Bool)
(declare-const misconduct_30_other_violations_of_rules_or_laws Bool)
(declare-const misconduct_31_other_behaviors_damaging_insurance_image Bool)
(declare-const misconduct_3_unapproved_insurance_operations Bool)
(declare-const misconduct_4_conceal_important_contract_info Bool)
(declare-const misconduct_5_coerce_or_induce_contracting_freedom_restriction Bool)
(declare-const misconduct_6_false_or_misleading_promotion_or_recruitment Bool)
(declare-const misconduct_7_improper_inducement_of_policyholder Bool)
(declare-const misconduct_8_misappropriation_or_embezzlement Bool)
(declare-const misconduct_9_unauthorized_use_of_license Bool)
(declare-const penalty Bool)
(declare-const violate_163_4_financial_or_business_management Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1_or_163_5_applied Bool)
(declare-const violation_163_4_7_165_1_163_5 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_163_4_7_165_1_163_5] 違反保險法第163條第4項、第7項或第165條第1項及第163條第5項準用規定
(assert (= violation_163_4_7_165_1_163_5
   (or violate_163_4_financial_or_business_management
       violate_163_7
       violate_165_1_or_163_5_applied)))

; [insurance:agent_misconduct] 代理人管理規則第49條列舉之違規行為
(assert (= agent_misconduct
   (or misconduct_14_spread_false_information_disturb_financial_order
       misconduct_11_operate_outside_license_scope
       misconduct_16_illegal_transfer_of_policy_documents
       misconduct_6_false_or_misleading_promotion_or_recruitment
       misconduct_1_false_report_on_license_application
       misconduct_21_fail_to_report_to_agent_association
       misconduct_31_other_behaviors_damaging_insurance_image
       misconduct_24_fail_to_confirm_suitability_for_financial_consumers
       misconduct_12_illegal_collection_of_money_or_benefits
       misconduct_29_fail_to_fill_recruitment_report_truthfully
       misconduct_8_misappropriation_or_embezzlement
       misconduct_30_other_violations_of_rules_or_laws
       misconduct_13_illegal_insurance_payments
       misconduct_27_hold_positions_in_insurance_or_association_conflict
       misconduct_20_fail_to_appoint_agent_after_resignation
       misconduct_18_fail_to_cancel_license_within_deadline
       misconduct_7_improper_inducement_of_policyholder
       misconduct_9_unauthorized_use_of_license
       misconduct_15_authorize_others_to_operate_or_use_others_name
       misconduct_3_unapproved_insurance_operations
       misconduct_5_coerce_or_induce_contracting_freedom_restriction
       misconduct_10_conviction_of_fraud_or_breach_of_trust
       misconduct_19_unauthorized_suspension_or_termination_of_business
       misconduct_25_sell_unapproved_foreign_policy_discount_products
       misconduct_4_conceal_important_contract_info
       misconduct_28_induce_contract_termination_or_use_loans_to_pay_premiums
       misconduct_17_employ_unqualified_insurance_recruiters
       misconduct_26_submit_false_or_incomplete_business_or_financial_reports
       misconduct_23_pay_commission_to_non_actual_recruiters
       misconduct_2_unapproved_insurance_business
       misconduct_22_use_unapproved_advertisement_content)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反保險法第163條第4項、第7項、第165條第1項或第163條第5項準用規定，或代理人管理規則第49條任一違規行為時處罰
(assert (= penalty (or agent_misconduct violation_163_4_7_165_1_163_5)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_misconduct true))
(assert (= misconduct_28_induce_contract_termination_or_use_loans_to_pay_premiums true))
(assert (= misconduct_1_false_report_on_license_application false))
(assert (= misconduct_2_unapproved_insurance_business false))
(assert (= misconduct_3_unapproved_insurance_operations false))
(assert (= misconduct_4_conceal_important_contract_info false))
(assert (= misconduct_5_coerce_or_induce_contracting_freedom_restriction false))
(assert (= misconduct_6_false_or_misleading_promotion_or_recruitment false))
(assert (= misconduct_7_improper_inducement_of_policyholder false))
(assert (= misconduct_8_misappropriation_or_embezzlement false))
(assert (= misconduct_9_unauthorized_use_of_license false))
(assert (= misconduct_10_conviction_of_fraud_or_breach_of_trust false))
(assert (= misconduct_11_operate_outside_license_scope false))
(assert (= misconduct_12_illegal_collection_of_money_or_benefits false))
(assert (= misconduct_13_illegal_insurance_payments false))
(assert (= misconduct_14_spread_false_information_disturb_financial_order false))
(assert (= misconduct_15_authorize_others_to_operate_or_use_others_name false))
(assert (= misconduct_16_illegal_transfer_of_policy_documents false))
(assert (= misconduct_17_employ_unqualified_insurance_recruiters false))
(assert (= misconduct_18_fail_to_cancel_license_within_deadline false))
(assert (= misconduct_19_unauthorized_suspension_or_termination_of_business false))
(assert (= misconduct_20_fail_to_appoint_agent_after_resignation false))
(assert (= misconduct_21_fail_to_report_to_agent_association false))
(assert (= misconduct_22_use_unapproved_advertisement_content false))
(assert (= misconduct_23_pay_commission_to_non_actual_recruiters false))
(assert (= misconduct_24_fail_to_confirm_suitability_for_financial_consumers false))
(assert (= misconduct_25_sell_unapproved_foreign_policy_discount_products false))
(assert (= misconduct_26_submit_false_or_incomplete_business_or_financial_reports false))
(assert (= misconduct_27_hold_positions_in_insurance_or_association_conflict false))
(assert (= misconduct_29_fail_to_fill_recruitment_report_truthfully false))
(assert (= misconduct_30_other_violations_of_rules_or_laws false))
(assert (= misconduct_31_other_behaviors_damaging_insurance_image false))
(assert (= violate_163_4_financial_or_business_management false))
(assert (= violate_163_7 false))
(assert (= violate_165_1_or_163_5_applied false))
(assert (= violation_163_4_7_165_1_163_5 false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 4
; Total variables: 37
; Total facts: 37
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
