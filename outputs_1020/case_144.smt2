; SMT2 file generated from compliance case automatic
; Case ID: case_144
; Generated at: 2025-10-19T09:09:39.703289
;
; This file can be executed with Z3:
;   z3 case_144.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_misconduct Bool)
(declare-const authorize_others_to_operate_or_use_others_name Bool)
(declare-const coerce_or_induce_contract_freedom_violation Bool)
(declare-const collect_illegal_fees_or_rewards Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const convicted_of_fraud_or_breach_of_trust_or_forgery Bool)
(declare-const correction_order_issued Bool)
(declare-const employ_unqualified_insurance_solicitors Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_consumer_suitability Bool)
(declare-const fail_to_fill_solicitation_report_truthfully Bool)
(declare-const fail_to_reappoint_agent_after_resignation Bool)
(declare-const fail_to_report_to_agent_association Bool)
(declare-const false_report_on_license_application Bool)
(declare-const hold_conflicting_positions Bool)
(declare-const illegal_insurance_claims Bool)
(declare-const improper_inducement_of_policy_cancellation_or_loan Bool)
(declare-const induce_contract_termination_or_loan_payment Bool)
(declare-const license_revoked Bool)
(declare-const license_used_by_others Bool)
(declare-const misappropriation_or_embezzlement_of_premiums_or_claims Bool)
(declare-const misleading_promotion_or_advertisement Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_solicitor Bool)
(declare-const penalty Bool)
(declare-const penalty_imposed Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const serious_violation Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const submit_false_or_incomplete_financial_reports Bool)
(declare-const submit_non_affiliated_agent_documents Bool)
(declare-const unauthorized_business_suspension_or_resumption Bool)
(declare-const unauthorized_insurance_agent_operation Bool)
(declare-const unauthorized_insurance_business_execution Bool)
(declare-const use_unapproved_advertisement_content Bool)
(declare-const violate_article_163_paragraph_7 Bool)
(declare-const violate_article_165_paragraph_1_or_163_paragraph_5 Bool)
(declare-const violate_financial_or_business_management_rules Bool)
(declare-const violation_of_management_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_misconduct] 代理人違反保險代理人管理規則第49條任一不當行為
(assert (= agent_misconduct
   (or misleading_promotion_or_advertisement
       employ_unqualified_insurance_solicitors
       false_report_on_license_application
       unauthorized_insurance_business_execution
       sell_unapproved_foreign_policy_discount_products
       submit_false_or_incomplete_financial_reports
       license_used_by_others
       fail_to_reappoint_agent_after_resignation
       spread_false_information_disturb_financial_order
       improper_inducement_of_policy_cancellation_or_loan
       misappropriation_or_embezzlement_of_premiums_or_claims
       use_unapproved_advertisement_content
       hold_conflicting_positions
       coerce_or_induce_contract_freedom_violation
       induce_contract_termination_or_loan_payment
       conceal_important_contract_info
       convicted_of_fraud_or_breach_of_trust_or_forgery
       unauthorized_insurance_agent_operation
       pay_commission_to_non_actual_solicitor
       collect_illegal_fees_or_rewards
       fail_to_report_to_agent_association
       other_violations_of_rules_or_laws
       fail_to_fill_solicitation_report_truthfully
       submit_non_affiliated_agent_documents
       authorize_others_to_operate_or_use_others_name
       fail_to_cancel_license_within_deadline
       operate_outside_license_scope
       fail_to_confirm_consumer_suitability
       illegal_insurance_claims
       unauthorized_business_suspension_or_resumption
       other_behaviors_damaging_insurance_image)))

; [insurance:violation_of_management_rules] 違反保險法第163條第4項管理規則財務或業務管理規定、163條第7項規定、165條第1項或163條第5項準用規定
(assert (= violation_of_management_rules
   (or violate_article_165_paragraph_1_or_163_paragraph_5
       violate_financial_or_business_management_rules
       violate_article_163_paragraph_7)))

; [insurance:correction_order_issued] 違反管理規則者已限期改正
(assert correction_order_issued)

; [insurance:penalty_imposed] 違反管理規則者處以罰鍰
(assert (= penalty_imposed
   (and violation_of_management_rules (not correction_order_issued))))

; [insurance:serious_violation] 情節重大者
(assert serious_violation)

; [insurance:license_revoked] 情節重大者廢止許可並註銷執業證照
(assert (= license_revoked (and violation_of_management_rules serious_violation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則且未限期改正，或情節重大者廢止許可並註銷執業證照
(assert (= penalty
   (or (and violation_of_management_rules (not correction_order_issued))
       license_revoked)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_misconduct true))
(assert (= misleading_promotion_or_advertisement true))
(assert (= fail_to_fill_solicitation_report_truthfully true))
(assert (= correction_order_issued true))
(assert (= violation_of_management_rules true))
(assert (= penalty_imposed false))
(assert (= penalty false))
(assert (= serious_violation false))
(assert (= license_revoked false))
(assert (= false_report_on_license_application false))
(assert (= unauthorized_insurance_agent_operation false))
(assert (= unauthorized_insurance_business_execution false))
(assert (= conceal_important_contract_info false))
(assert (= coerce_or_induce_contract_freedom_violation false))
(assert (= improper_inducement_of_policy_cancellation_or_loan false))
(assert (= misappropriation_or_embezzlement_of_premiums_or_claims false))
(assert (= license_used_by_others false))
(assert (= convicted_of_fraud_or_breach_of_trust_or_forgery false))
(assert (= operate_outside_license_scope false))
(assert (= collect_illegal_fees_or_rewards false))
(assert (= illegal_insurance_claims false))
(assert (= spread_false_information_disturb_financial_order false))
(assert (= authorize_others_to_operate_or_use_others_name false))
(assert (= submit_non_affiliated_agent_documents false))
(assert (= employ_unqualified_insurance_solicitors false))
(assert (= fail_to_cancel_license_within_deadline false))
(assert (= unauthorized_business_suspension_or_resumption false))
(assert (= fail_to_reappoint_agent_after_resignation false))
(assert (= fail_to_report_to_agent_association false))
(assert (= use_unapproved_advertisement_content false))
(assert (= pay_commission_to_non_actual_solicitor false))
(assert (= fail_to_confirm_consumer_suitability false))
(assert (= sell_unapproved_foreign_policy_discount_products false))
(assert (= submit_false_or_incomplete_financial_reports false))
(assert (= hold_conflicting_positions false))
(assert (= induce_contract_termination_or_loan_payment false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= other_behaviors_damaging_insurance_image false))
(assert (= violate_financial_or_business_management_rules false))
(assert (= violate_article_163_paragraph_7 false))
(assert (= violate_article_165_paragraph_1_or_163_paragraph_5 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 41
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
