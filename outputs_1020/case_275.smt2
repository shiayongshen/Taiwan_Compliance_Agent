; SMT2 file generated from compliance case automatic
; Case ID: case_275
; Generated at: 2025-10-19T11:53:06.958817
;
; This file can be executed with Z3:
;   z3 case_275.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authorize_third_party_to_operate_or_execute_business Bool)
(declare-const broker_rule_49_violation Bool)
(declare-const charge_illegal_fees_or_commissions Bool)
(declare-const coerce_or_induce_or_limit_contract_freedom_or_extra_benefit Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const convicted_of_embezzlement_fraud_breach_of_trust_or_forgery Bool)
(declare-const employ_unqualified_insurance_solicitors Bool)
(declare-const fail_to_appoint_broker_upon_employee_departure Bool)
(declare-const fail_to_cancel_license_within_specified_period Bool)
(declare-const fail_to_confirm_suitability_for_financial_consumers_over_65 Bool)
(declare-const fail_to_fill_solicitation_report_truthfully_for_clients_over_65 Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_report_on_license_application Bool)
(declare-const hold_positions_in_insurance_or_association_or_registered_agent Bool)
(declare-const illegal_methods_for_improper_insurance_payments Bool)
(declare-const improperly_induce_policyholder_to_surrender_or_transfer_or_loan Bool)
(declare-const induce_clients_to_terminate_contract_or_pay_premiums_by_loan_or_deposit Bool)
(declare-const misappropriate_or_embezzle_premiums_or_claims Bool)
(declare-const misleading_promotion_or_advertisement_or_improper_business Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_solicitor_except_renewal_commission Bool)
(declare-const penalty Bool)
(declare-const permit_others_to_use_own_license_without_execution Bool)
(declare-const sell_unapproved_foreign_policy_discount_benefit_certificates Bool)
(declare-const spread_false_statements_or_disrupt_financial_order Bool)
(declare-const submit_false_or_incomplete_business_or_financial_reports Bool)
(declare-const transfer_policy_documents_to_unauthorized_agents Bool)
(declare-const unauthorized_suspension_or_resumption_or_termination_of_business Bool)
(declare-const use_unapproved_advertisement_or_promotion_content Bool)
(declare-const violate_163_4_financial_or_business_management Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1_or_163_5_applied Bool)
(declare-const violation_163_4_7_165_1_163_5 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_163_4_7_165_1_163_5] 違反保險法第163條第4項、7項或第165條第1項及第163條第5項準用規定
(assert (= violation_163_4_7_165_1_163_5
   (or violate_163_4_financial_or_business_management
       violate_163_7
       violate_165_1_or_163_5_applied)))

; [insurance:broker_rule_49_violation] 違反保險經紀人管理規則第49條任一款規定
(assert (= broker_rule_49_violation
   (or authorize_third_party_to_operate_or_execute_business
       use_unapproved_advertisement_or_promotion_content
       illegal_methods_for_improper_insurance_payments
       submit_false_or_incomplete_business_or_financial_reports
       coerce_or_induce_or_limit_contract_freedom_or_extra_benefit
       operate_outside_license_scope
       induce_clients_to_terminate_contract_or_pay_premiums_by_loan_or_deposit
       contract_with_unapproved_insurer
       conceal_important_contract_info
       fail_to_appoint_broker_upon_employee_departure
       fail_to_report_to_broker_association
       transfer_policy_documents_to_unauthorized_agents
       employ_unqualified_insurance_solicitors
       fail_to_confirm_suitability_for_financial_consumers_over_65
       pay_commission_to_non_actual_solicitor_except_renewal_commission
       misleading_promotion_or_advertisement_or_improper_business
       improperly_induce_policyholder_to_surrender_or_transfer_or_loan
       fail_to_fill_solicitation_report_truthfully_for_clients_over_65
       hold_positions_in_insurance_or_association_or_registered_agent
       misappropriate_or_embezzle_premiums_or_claims
       fail_to_cancel_license_within_specified_period
       unauthorized_suspension_or_resumption_or_termination_of_business
       spread_false_statements_or_disrupt_financial_order
       sell_unapproved_foreign_policy_discount_benefit_certificates
       other_behaviors_damaging_insurance_image
       permit_others_to_use_own_license_without_execution
       other_violations_of_rules_or_laws
       false_report_on_license_application
       convicted_of_embezzlement_fraud_breach_of_trust_or_forgery
       charge_illegal_fees_or_commissions)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反保險法第163條相關規定或保險經紀人管理規則第49條任一款規定時處罰
(assert (= penalty (or broker_rule_49_violation violation_163_4_7_165_1_163_5)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= permit_others_to_use_own_license_without_execution true))
(assert (= false_report_on_license_application true))
(assert (= broker_rule_49_violation true))
(assert (= violation_163_4_7_165_1_163_5 false))
(assert (= violate_163_4_financial_or_business_management false))
(assert (= violate_163_7 false))
(assert (= violate_165_1_or_163_5_applied false))
(assert (= penalty true))
(assert (= authorize_third_party_to_operate_or_execute_business false))
(assert (= charge_illegal_fees_or_commissions false))
(assert (= coerce_or_induce_or_limit_contract_freedom_or_extra_benefit false))
(assert (= conceal_important_contract_info false))
(assert (= contract_with_unapproved_insurer false))
(assert (= convicted_of_embezzlement_fraud_breach_of_trust_or_forgery false))
(assert (= employ_unqualified_insurance_solicitors false))
(assert (= fail_to_appoint_broker_upon_employee_departure false))
(assert (= fail_to_cancel_license_within_specified_period false))
(assert (= fail_to_confirm_suitability_for_financial_consumers_over_65 false))
(assert (= fail_to_fill_solicitation_report_truthfully_for_clients_over_65 false))
(assert (= fail_to_report_to_broker_association false))
(assert (= hold_positions_in_insurance_or_association_or_registered_agent false))
(assert (= illegal_methods_for_improper_insurance_payments false))
(assert (= improperly_induce_policyholder_to_surrender_or_transfer_or_loan false))
(assert (= induce_clients_to_terminate_contract_or_pay_premiums_by_loan_or_deposit false))
(assert (= misappropriate_or_embezzle_premiums_or_claims false))
(assert (= misleading_promotion_or_advertisement_or_improper_business false))
(assert (= operate_outside_license_scope false))
(assert (= other_behaviors_damaging_insurance_image false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= pay_commission_to_non_actual_solicitor_except_renewal_commission false))
(assert (= sell_unapproved_foreign_policy_discount_benefit_certificates false))
(assert (= spread_false_statements_or_disrupt_financial_order false))
(assert (= submit_false_or_incomplete_business_or_financial_reports false))
(assert (= transfer_policy_documents_to_unauthorized_agents false))
(assert (= unauthorized_suspension_or_resumption_or_termination_of_business false))
(assert (= use_unapproved_advertisement_or_promotion_content false))

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
