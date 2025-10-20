; SMT2 file generated from compliance case automatic
; Case ID: case_67
; Generated at: 2025-10-19T07:06:14.739339
;
; This file can be executed with Z3:
;   z3 case_67.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_and_guarantee Bool)
(declare-const agent_rule_violation Bool)
(declare-const agent_type Bool)
(declare-const bank_engage_agent Bool)
(declare-const bank_engage_broker Bool)
(declare-const bank_permitted Bool)
(declare-const bank_permitted_agent_or_broker Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_report_and_fee_disclosed Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_minimum_amount Real)
(declare-const guarantee_minimum_amount_defined_by_authority Bool)
(declare-const holding_practice_certificate Bool)
(declare-const insurance_type Bool)
(declare-const license_permitted Bool)
(declare-const management_rules_defined Bool)
(declare-const management_rules_set_by_authority Bool)
(declare-const minimum_guarantee_amount_set Bool)
(declare-const penalty Bool)
(declare-const relevant_insurance_subscribed Bool)
(declare-const relevant_insurance_type_ok Bool)
(declare-const violation_authorize_others_to_operate Bool)
(declare-const violation_coerce_or_induce_contract Bool)
(declare-const violation_conceal_important_contract_info Bool)
(declare-const violation_conflict_of_interest_or_registration_violation Bool)
(declare-const violation_convicted_of_fraud_or_forgery Bool)
(declare-const violation_damage_insurance_image Bool)
(declare-const violation_employ_unqualified_sales_agents Bool)
(declare-const violation_fail_to_appoint_agent_after_resignation Bool)
(declare-const violation_fail_to_cancel_certificate_within_deadline Bool)
(declare-const violation_fail_to_confirm_suitability_for_seniors Bool)
(declare-const violation_fail_to_fill_sales_report_truthfully Bool)
(declare-const violation_fail_to_report_to_agent_association Bool)
(declare-const violation_false_or_incomplete_financial_or_business_reports Bool)
(declare-const violation_false_or_misleading_promotion Bool)
(declare-const violation_false_report_on_license_application Bool)
(declare-const violation_illegal_claim_payment Bool)
(declare-const violation_illegal_collection_of_funds_or_benefits Bool)
(declare-const violation_induce_contract_termination_or_loan_payment Bool)
(declare-const violation_induce_policy_surrender_or_loan Bool)
(declare-const violation_misappropriate_or_embezzle_premium_or_claim Bool)
(declare-const violation_operate_outside_certificate_scope Bool)
(declare-const violation_other_rule_or_law_violations Bool)
(declare-const violation_pay_commission_to_non_actual_sales_agents Bool)
(declare-const violation_sell_unapproved_foreign_policy_discount_benefits Bool)
(declare-const violation_spread_false_information_disturb_financial_order Bool)
(declare-const violation_submit_application_documents_of_unauthorized_agents Bool)
(declare-const violation_unapproved_agent_business Bool)
(declare-const violation_unapproved_insurance_business Bool)
(declare-const violation_unauthorized_suspend_or_terminate_business Bool)
(declare-const violation_unauthorized_use_of_certificate Bool)
(declare-const violation_use_unapproved_advertisement Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_license_and_guarantee
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        relevant_insurance_subscribed
        holding_practice_certificate)))

; [insurance:relevant_insurance_type] 相關保險類型：保險代理人、公證人為責任保險；保險經紀人為責任保險及保證保險
(assert (= relevant_insurance_type_ok (and agent_type insurance_type)))

; [insurance:minimum_guarantee_amount_set] 主管機關依經營及執行業務範圍及規模定最低保證金及實施方式
(assert (= minimum_guarantee_amount_set guarantee_minimum_amount_defined_by_authority))

; [insurance:management_rules_defined] 主管機關定保險代理人、經紀人、公證人資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則
(assert (= management_rules_defined management_rules_set_by_authority))

; [insurance:bank_permitted_to_engage_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_agent_or_broker
   (and bank_permitted (or bank_engage_agent bank_engage_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約或提供服務，並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人洽訂保險契約前，於主管機關指定範圍內，主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (= broker_report_and_fee_disclosed
   (and broker_provide_written_report
        (or broker_disclose_fee_standard (not broker_charge_fee)))))

; [insurance:agent_rule_violation] 違反代理人管理規則第49條各款行為之一
(assert (= agent_rule_violation
   (or violation_false_or_misleading_promotion
       violation_fail_to_fill_sales_report_truthfully
       violation_operate_outside_certificate_scope
       violation_damage_insurance_image
       violation_fail_to_appoint_agent_after_resignation
       violation_unapproved_insurance_business
       violation_coerce_or_induce_contract
       violation_unauthorized_use_of_certificate
       violation_misappropriate_or_embezzle_premium_or_claim
       violation_fail_to_cancel_certificate_within_deadline
       violation_fail_to_confirm_suitability_for_seniors
       violation_false_or_incomplete_financial_or_business_reports
       violation_pay_commission_to_non_actual_sales_agents
       violation_conflict_of_interest_or_registration_violation
       violation_illegal_collection_of_funds_or_benefits
       violation_submit_application_documents_of_unauthorized_agents
       violation_authorize_others_to_operate
       violation_use_unapproved_advertisement
       violation_induce_policy_surrender_or_loan
       violation_illegal_claim_payment
       violation_fail_to_report_to_agent_association
       violation_sell_unapproved_foreign_policy_discount_benefits
       violation_induce_contract_termination_or_loan_payment
       violation_unauthorized_suspend_or_terminate_business
       violation_conceal_important_contract_info
       violation_false_report_on_license_application
       violation_other_rule_or_law_violations
       violation_convicted_of_fraud_or_forgery
       violation_spread_false_information_disturb_financial_order
       violation_employ_unqualified_sales_agents
       violation_unapproved_agent_business)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反代理人管理規則第49條任一規定時處罰
(assert (= penalty
   (or (not management_rules_defined)
       (not relevant_insurance_type_ok)
       (not agent_license_and_guarantee)
       agent_rule_violation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_license_and_guarantee false))
(assert (= agent_rule_violation true))
(assert (= violation_illegal_collection_of_funds_or_benefits true))
(assert (= license_permitted false))
(assert (= guarantee_deposit_amount 0.0))
(assert (= guarantee_minimum_amount 1000000.0))
(assert (= guarantee_minimum_amount_defined_by_authority true))
(assert (= relevant_insurance_subscribed false))
(assert (= relevant_insurance_type_ok false))
(assert (= management_rules_defined true))
(assert (= management_rules_set_by_authority true))
(assert (= minimum_guarantee_amount_set true))
(assert (= bank_permitted true))
(assert (= bank_engage_agent true))
(assert (= bank_engage_broker false))
(assert (= bank_permitted_agent_or_broker true))
(assert (= holding_practice_certificate false))
(assert (= agent_type true))
(assert (= insurance_type true))
(assert (= broker_charge_fee false))
(assert (= broker_disclose_fee_standard false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_fulfill_fidelity false))
(assert (= broker_provide_written_report false))
(assert (= broker_report_and_fee_disclosed false))
(assert (= violation_false_report_on_license_application false))
(assert (= violation_unapproved_agent_business false))
(assert (= violation_unapproved_insurance_business false))
(assert (= violation_conceal_important_contract_info false))
(assert (= violation_coerce_or_induce_contract false))
(assert (= violation_false_or_misleading_promotion false))
(assert (= violation_induce_policy_surrender_or_loan false))
(assert (= violation_misappropriate_or_embezzle_premium_or_claim false))
(assert (= violation_unauthorized_use_of_certificate false))
(assert (= violation_convicted_of_fraud_or_forgery false))
(assert (= violation_operate_outside_certificate_scope false))
(assert (= violation_illegal_claim_payment false))
(assert (= violation_spread_false_information_disturb_financial_order false))
(assert (= violation_authorize_others_to_operate false))
(assert (= violation_submit_application_documents_of_unauthorized_agents false))
(assert (= violation_employ_unqualified_sales_agents false))
(assert (= violation_fail_to_cancel_certificate_within_deadline false))
(assert (= violation_unauthorized_suspend_or_terminate_business false))
(assert (= violation_fail_to_appoint_agent_after_resignation false))
(assert (= violation_fail_to_report_to_agent_association false))
(assert (= violation_use_unapproved_advertisement false))
(assert (= violation_pay_commission_to_non_actual_sales_agents false))
(assert (= violation_fail_to_confirm_suitability_for_seniors false))
(assert (= violation_sell_unapproved_foreign_policy_discount_benefits false))
(assert (= violation_false_or_incomplete_financial_or_business_reports false))
(assert (= violation_conflict_of_interest_or_registration_violation false))
(assert (= violation_induce_contract_termination_or_loan_payment false))
(assert (= violation_fail_to_fill_sales_report_truthfully false))
(assert (= violation_other_rule_or_law_violations false))
(assert (= violation_damage_insurance_image false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 57
; Total facts: 57
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
