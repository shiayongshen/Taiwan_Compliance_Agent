; SMT2 file generated from compliance case automatic
; Case ID: case_154
; Generated at: 2025-10-19T09:29:25.092046
;
; This file can be executed with Z3:
;   z3 case_154.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_misconduct Bool)
(declare-const authorize_others_to_operate Bool)
(declare-const charge_illegal_fees_or_commissions Bool)
(declare-const coerce_or_induce_contracting Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const convicted_of_fraud_or_forgery Bool)
(declare-const correction_deadline_issued Bool)
(declare-const correction_ordered Bool)
(declare-const employ_unqualified_insurance_solicitors Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_suitability_for_financial_consumers Bool)
(declare-const fail_to_fill_solicitation_report_truthfully Bool)
(declare-const fail_to_reappoint_agent_after_resignation Bool)
(declare-const fail_to_report_to_agent_association Bool)
(declare-const false_report_on_license_application Bool)
(declare-const fine_amount Real)
(declare-const fine_imposed Bool)
(declare-const hold_conflicting_positions_in_insurance_or_associations Bool)
(declare-const illegal_insurance_claims Bool)
(declare-const improper_inducement_to_cancel_or_transfer Bool)
(declare-const induce_clients_to_cancel_or_terminate_contracts_improperly Bool)
(declare-const license_revoked Bool)
(declare-const misappropriate_or_embezzle_premiums_or_claims Bool)
(declare-const misleading_advertisement_or_recruitment Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_solicitors Bool)
(declare-const penalty Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const serious_violation Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const submit_false_or_incomplete_business_or_financial_reports Bool)
(declare-const transfer_application_documents_improperly Bool)
(declare-const unauthorized_insurance_agent_operation Bool)
(declare-const unauthorized_insurance_business_execution Bool)
(declare-const unauthorized_suspension_or_termination_of_business Bool)
(declare-const unauthorized_use_of_license Bool)
(declare-const use_unapproved_advertisement_content Bool)
(declare-const violate_article_163_5_applied Bool)
(declare-const violate_article_163_7 Bool)
(declare-const violate_article_165_1 Bool)
(declare-const violate_business_management_rule Bool)
(declare-const violate_financial_management_rule Bool)
(declare-const violation_management_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_management_rules] 違反第163條第4項管理規則中財務或業務管理規定、163條第7項規定，或違反165條第1項及163條第5項準用規定
(assert (= violation_management_rules
   (or violate_article_163_7
       violate_article_163_5_applied
       violate_business_management_rule
       violate_financial_management_rule
       violate_article_165_1)))

; [insurance:correction_ordered] 違反管理規則者已限期改正
(assert (= correction_ordered correction_deadline_issued))

; [insurance:fine_imposed] 違反管理規則者處以新臺幣十萬元以上三百萬元以下罰鍰
(assert (= fine_imposed (and (<= 100000.0 fine_amount) (>= 300000.0 fine_amount))))

; [insurance:license_revoked] 情節重大者廢止許可並註銷執業證照
(assert (= license_revoked serious_violation))

; [insurance:agent_misconduct] 代理人違反保險代理人管理規則第49條任一款行為
(assert (= agent_misconduct
   (or coerce_or_induce_contracting
       use_unapproved_advertisement_content
       unauthorized_suspension_or_termination_of_business
       employ_unqualified_insurance_solicitors
       pay_commission_to_non_actual_solicitors
       convicted_of_fraud_or_forgery
       unauthorized_insurance_agent_operation
       submit_false_or_incomplete_business_or_financial_reports
       other_violations_of_rules_or_laws
       sell_unapproved_foreign_policy_discount_products
       operate_outside_license_scope
       fail_to_cancel_license_within_deadline
       spread_false_information_disturb_financial_order
       misappropriate_or_embezzle_premiums_or_claims
       fail_to_fill_solicitation_report_truthfully
       unauthorized_insurance_business_execution
       fail_to_reappoint_agent_after_resignation
       illegal_insurance_claims
       fail_to_confirm_suitability_for_financial_consumers
       fail_to_report_to_agent_association
       charge_illegal_fees_or_commissions
       improper_inducement_to_cancel_or_transfer
       unauthorized_use_of_license
       hold_conflicting_positions_in_insurance_or_associations
       false_report_on_license_application
       transfer_application_documents_improperly
       misleading_advertisement_or_recruitment
       induce_clients_to_cancel_or_terminate_contracts_improperly
       authorize_others_to_operate
       conceal_important_contract_info
       other_behaviors_damaging_insurance_image)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則或代理人管理規則第49條任一規定時處罰
(assert (= penalty (or agent_misconduct violation_management_rules)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_misconduct true))
(assert (= fail_to_fill_solicitation_report_truthfully true))
(assert (= correction_deadline_issued true))
(assert (= fine_amount 1800000.0))
(assert (= violate_financial_management_rule false))
(assert (= violate_business_management_rule false))
(assert (= violate_article_163_7 false))
(assert (= violate_article_165_1 false))
(assert (= violate_article_163_5_applied false))
(assert (= authorize_others_to_operate false))
(assert (= charge_illegal_fees_or_commissions false))
(assert (= coerce_or_induce_contracting false))
(assert (= conceal_important_contract_info false))
(assert (= convicted_of_fraud_or_forgery false))
(assert (= correction_ordered false))
(assert (= employ_unqualified_insurance_solicitors false))
(assert (= fail_to_cancel_license_within_deadline false))
(assert (= fail_to_confirm_suitability_for_financial_consumers false))
(assert (= fail_to_reappoint_agent_after_resignation false))
(assert (= fail_to_report_to_agent_association false))
(assert (= false_report_on_license_application false))
(assert (= fine_imposed false))
(assert (= hold_conflicting_positions_in_insurance_or_associations false))
(assert (= illegal_insurance_claims false))
(assert (= improper_inducement_to_cancel_or_transfer false))
(assert (= induce_clients_to_cancel_or_terminate_contracts_improperly false))
(assert (= license_revoked false))
(assert (= misappropriate_or_embezzle_premiums_or_claims false))
(assert (= misleading_advertisement_or_recruitment false))
(assert (= operate_outside_license_scope false))
(assert (= other_behaviors_damaging_insurance_image false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= pay_commission_to_non_actual_solicitors false))
(assert (= penalty false))
(assert (= sell_unapproved_foreign_policy_discount_products false))
(assert (= serious_violation false))
(assert (= spread_false_information_disturb_financial_order false))
(assert (= submit_false_or_incomplete_business_or_financial_reports false))
(assert (= transfer_application_documents_improperly false))
(assert (= unauthorized_insurance_agent_operation false))
(assert (= unauthorized_insurance_business_execution false))
(assert (= unauthorized_suspension_or_termination_of_business false))
(assert (= unauthorized_use_of_license false))
(assert (= use_unapproved_advertisement_content false))
(assert (= violation_management_rules false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 45
; Total facts: 45
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
