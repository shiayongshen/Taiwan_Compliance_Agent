; SMT2 file generated from compliance case automatic
; Case ID: case_151
; Generated at: 2025-10-21T03:19:00.246483
;
; This file can be executed with Z3:
;   z3 case_151.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_misconduct Bool)
(declare-const correction_ordered Bool)
(declare-const license_revoked Bool)
(declare-const major_violation Bool)
(declare-const misconduct_10_convicted_fraud_or_forgery Bool)
(declare-const misconduct_11_outside_license_scope Bool)
(declare-const misconduct_12_illegal_collection_of_money_or_benefits Bool)
(declare-const misconduct_13_illegal_insurance_payment Bool)
(declare-const misconduct_14_spread_false_information Bool)
(declare-const misconduct_15_authorize_others_to_operate Bool)
(declare-const misconduct_16_transfer_unassigned_policy_documents Bool)
(declare-const misconduct_17_employ_unqualified_recruiters Bool)
(declare-const misconduct_18_fail_to_cancel_license_in_time Bool)
(declare-const misconduct_19_unauthorized_suspend_or_terminate_business Bool)
(declare-const misconduct_1_false_report Bool)
(declare-const misconduct_20_fail_to_reappoint_agent_after_resignation Bool)
(declare-const misconduct_21_fail_to_report_to_trade_association Bool)
(declare-const misconduct_22_use_unapproved_advertisement Bool)
(declare-const misconduct_23_pay_commission_to_non_actual_recruiters Bool)
(declare-const misconduct_24_fail_to_confirm_consumer_suitability Bool)
(declare-const misconduct_25_sell_unapproved_foreign_policy_discount_products Bool)
(declare-const misconduct_26_submit_false_or_incomplete_reports Bool)
(declare-const misconduct_27_hold_positions_in_insurance_or_association Bool)
(declare-const misconduct_28_induce_contract_termination_or_loan_payment Bool)
(declare-const misconduct_29_fail_to_fill_recruitment_report_truthfully Bool)
(declare-const misconduct_2_unapproved_agent_business Bool)
(declare-const misconduct_30_other_violations_of_rules_or_laws Bool)
(declare-const misconduct_31_other_damaging_insurance_image Bool)
(declare-const misconduct_3_unapproved_insurance_business Bool)
(declare-const misconduct_4_hide_important_contract_info Bool)
(declare-const misconduct_5_force_or_induce_contract Bool)
(declare-const misconduct_6_false_advertisement Bool)
(declare-const misconduct_7_induce_policy_surrender_or_loan Bool)
(declare-const misconduct_8_misappropriate_premium_or_claim Bool)
(declare-const misconduct_9_unauthorized_use_license Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_amount Real)
(declare-const penalty_fine_range Real)
(declare-const violate_163_4_financial_or_business_management Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1_or_163_5_applied Bool)
(declare-const violation_163_4_7_165_1_163_5 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_163_4_7_165_1_163_5] 違反保險法第163條第4項、第7項及第165條第1項或第163條第5項準用規定
(assert (= violation_163_4_7_165_1_163_5
   (or violate_163_4_financial_or_business_management
       violate_163_7
       violate_165_1_or_163_5_applied)))

; [insurance:correction_ordered] 已限期改正違規事項
(assert true)

; [insurance:penalty_fine_range] 罰鍰金額介於新臺幣十萬元以上三百萬元以下
(assert (= penalty_fine_range
   (ite (and (<= 100000.0 penalty_fine_amount)
             (>= 3000000.0 penalty_fine_amount))
        1.0
        0.0)))

; [insurance:major_violation] 情節重大
(assert true)

; [insurance:license_revoked] 廢止許可並註銷執業證照
(assert true)

; [insurance:agent_misconduct] 代理人違反保險代理人管理規則第49條各款行為
(assert (= agent_misconduct
   (or misconduct_4_hide_important_contract_info
       misconduct_14_spread_false_information
       misconduct_16_transfer_unassigned_policy_documents
       misconduct_12_illegal_collection_of_money_or_benefits
       misconduct_21_fail_to_report_to_trade_association
       misconduct_11_outside_license_scope
       misconduct_13_illegal_insurance_payment
       misconduct_15_authorize_others_to_operate
       misconduct_6_false_advertisement
       misconduct_7_induce_policy_surrender_or_loan
       misconduct_30_other_violations_of_rules_or_laws
       misconduct_10_convicted_fraud_or_forgery
       misconduct_17_employ_unqualified_recruiters
       misconduct_19_unauthorized_suspend_or_terminate_business
       misconduct_20_fail_to_reappoint_agent_after_resignation
       misconduct_22_use_unapproved_advertisement
       misconduct_24_fail_to_confirm_consumer_suitability
       misconduct_23_pay_commission_to_non_actual_recruiters
       misconduct_25_sell_unapproved_foreign_policy_discount_products
       misconduct_9_unauthorized_use_license
       misconduct_27_hold_positions_in_insurance_or_association
       misconduct_5_force_or_induce_contract
       misconduct_28_induce_contract_termination_or_loan_payment
       misconduct_1_false_report
       misconduct_29_fail_to_fill_recruitment_report_truthfully
       misconduct_2_unapproved_agent_business
       misconduct_26_submit_false_or_incomplete_reports
       misconduct_31_other_damaging_insurance_image
       misconduct_3_unapproved_insurance_business
       misconduct_18_fail_to_cancel_license_in_time
       misconduct_8_misappropriate_premium_or_claim)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則或保險代理人管理規則第49條任一規定時處罰
(assert (= penalty (or violation_163_4_7_165_1_163_5 agent_misconduct)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= misconduct_7_induce_policy_surrender_or_loan true))
(assert (= agent_misconduct true))
(assert (= correction_ordered true))
(assert (= penalty_fine_amount 600000))
(assert (= penalty true))
(assert (= violation_163_4_7_165_1_163_5 false))
(assert (= violate_163_4_financial_or_business_management false))
(assert (= violate_163_7 false))
(assert (= violate_165_1_or_163_5_applied false))
(assert (= license_revoked false))
(assert (= major_violation false))
(assert (= misconduct_1_false_report false))
(assert (= misconduct_2_unapproved_agent_business false))
(assert (= misconduct_3_unapproved_insurance_business false))
(assert (= misconduct_4_hide_important_contract_info false))
(assert (= misconduct_5_force_or_induce_contract false))
(assert (= misconduct_6_false_advertisement false))
(assert (= misconduct_8_misappropriate_premium_or_claim false))
(assert (= misconduct_9_unauthorized_use_license false))
(assert (= misconduct_10_convicted_fraud_or_forgery false))
(assert (= misconduct_11_outside_license_scope false))
(assert (= misconduct_12_illegal_collection_of_money_or_benefits false))
(assert (= misconduct_13_illegal_insurance_payment false))
(assert (= misconduct_14_spread_false_information false))
(assert (= misconduct_15_authorize_others_to_operate false))
(assert (= misconduct_16_transfer_unassigned_policy_documents false))
(assert (= misconduct_17_employ_unqualified_recruiters false))
(assert (= misconduct_18_fail_to_cancel_license_in_time false))
(assert (= misconduct_19_unauthorized_suspend_or_terminate_business false))
(assert (= misconduct_20_fail_to_reappoint_agent_after_resignation false))
(assert (= misconduct_21_fail_to_report_to_trade_association false))
(assert (= misconduct_22_use_unapproved_advertisement false))
(assert (= misconduct_23_pay_commission_to_non_actual_recruiters false))
(assert (= misconduct_24_fail_to_confirm_consumer_suitability false))
(assert (= misconduct_25_sell_unapproved_foreign_policy_discount_products false))
(assert (= misconduct_26_submit_false_or_incomplete_reports false))
(assert (= misconduct_27_hold_positions_in_insurance_or_association false))
(assert (= misconduct_28_induce_contract_termination_or_loan_payment false))
(assert (= misconduct_29_fail_to_fill_recruitment_report_truthfully false))
(assert (= misconduct_30_other_violations_of_rules_or_laws false))
(assert (= misconduct_31_other_damaging_insurance_image false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 42
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
