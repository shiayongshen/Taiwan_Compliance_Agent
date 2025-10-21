; SMT2 file generated from compliance case automatic
; Case ID: case_153
; Generated at: 2025-10-21T03:24:56.149946
;
; This file can be executed with Z3:
;   z3 case_153.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_or_notary Bool)
(declare-const apply_agent_broker_regulations Bool)
(declare-const approved_by_authority Bool)
(declare-const authority_defined_management_rules Bool)
(declare-const authority_defined_minimum_guarantee_deposit Bool)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_and_application Bool)
(declare-const broker Bool)
(declare-const broker_duties_complied Bool)
(declare-const broker_prohibited_acts_compliance Bool)
(declare-const broker_report_and_fee_disclosure_complied Bool)
(declare-const business_scope_restriction Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const conflict_of_interest_or_registration_violation Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const correction_completed Bool)
(declare-const corrective_order_issued Bool)
(declare-const criminal_conviction_for_fraud_or_breach Bool)
(declare-const damage_insurance_image Bool)
(declare-const deregistration_notified Bool)
(declare-const director_or_supervisor_dismissed Bool)
(declare-const director_or_supervisor_dismissed_or_suspended Bool)
(declare-const director_supervisor_deregistration_done Bool)
(declare-const disrupt_financial_order Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_fidelity Bool)
(declare-const employ_unqualified_personnel Bool)
(declare-const failure_to_cancel_license_in_time Bool)
(declare-const failure_to_confirm_consumer_suitability Bool)
(declare-const failure_to_fill_out_prospectus_truthfully Bool)
(declare-const failure_to_reappoint_broker_after_resignation Bool)
(declare-const failure_to_report_to_broker_association Bool)
(declare-const false_or_incomplete_business_or_financial_reports Bool)
(declare-const false_or_misleading_promotion Bool)
(declare-const false_report_at_license_application Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosure_made Bool)
(declare-const financial_and_business_management_violation Bool)
(declare-const financial_and_business_management_violation_penalty Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance_subscribed Bool)
(declare-const illegal_insurance_claims Bool)
(declare-const improper_coercion_or_inducement Bool)
(declare-const improper_commission_payment Bool)
(declare-const improper_fee_collection Bool)
(declare-const improper_inducement_to_cancel_or_loan Bool)
(declare-const improper_transfer_of_application_documents Bool)
(declare-const improvement_order_issued Bool)
(declare-const induce_cancellation_or_termination_of_contract Bool)
(declare-const liability_insurance_subscribed Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_issued Bool)
(declare-const license_revoked Bool)
(declare-const management_rules_defined Bool)
(declare-const manager_or_staff_dismissed Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const minimum_guarantee_deposit_defined Bool)
(declare-const misappropriation_of_funds Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_necessary_measures_taken Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const penalty Bool)
(declare-const relevant_insurance_subscribed Bool)
(declare-const sale_of_unapproved_foreign_policy_discount_certificates Bool)
(declare-const unauthorized_delegation_or_operation Bool)
(declare-const unauthorized_suspension_or_termination_of_business Bool)
(declare-const unauthorized_use_of_advertisement Bool)
(declare-const unauthorized_use_of_license Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_related_regulations Bool)
(declare-const violation_penalties_applicable Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and approved_by_authority
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_subscribed
        license_issued)))

; [insurance:relevant_insurance_type_compliance] 相關保險類型依身份區分：保險代理人、公證人為責任保險；保險經紀人為責任保險及保證保險
(assert (= relevant_insurance_subscribed
   (or (and agent_or_notary liability_insurance_subscribed)
       (and broker
            liability_insurance_subscribed
            guarantee_insurance_subscribed))))

; [insurance:minimum_guarantee_deposit_defined] 最低保證金及實施方式由主管機關依經營業務範圍及規模定之
(assert (= minimum_guarantee_deposit_defined
   authority_defined_minimum_guarantee_deposit))

; [insurance:management_rules_defined] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他應遵行事項由主管機關定之
(assert (= management_rules_defined authority_defined_management_rules))

; [insurance:bank_permission_and_application] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_application
   (and bank_approved_by_authority
        (or bank_operate_as_agent bank_operate_as_broker)
        apply_agent_broker_regulations)))

; [insurance:broker_duties] 保險經紀人應以善良管理人注意義務洽訂保險契約或提供服務，並負忠實義務
(assert (= broker_duties_complied (and duty_of_care duty_of_fidelity)))

; [insurance:broker_report_and_fee_disclosure] 保險經紀人洽訂契約前，於主管機關指定範圍內主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (= broker_report_and_fee_disclosure_complied
   (and written_analysis_report_provided
        (or (not fee_charged) fee_disclosure_made))))

; [insurance:violation_penalties] 違反法令或有礙健全經營時，主管機關得糾正、限期改善，並視情節輕重處分
(assert (= violation_penalties_applicable
   (or business_scope_restriction
       corrective_order_issued
       other_necessary_measures_taken
       improvement_order_issued
       director_or_supervisor_dismissed_or_suspended
       manager_or_staff_dismissed)))

; [insurance:director_supervisor_deregistration] 依規定解除董事或監察人職務時，主管機關通知登記主管機關註銷其登記
(assert (= director_supervisor_deregistration_done
   (or (not director_or_supervisor_dismissed) deregistration_notified)))

; [insurance:financial_and_business_management_violation] 違反財務或業務管理規定或相關規定者，應限期改正或處罰，情節重大者廢止許可並註銷執照
(assert (= financial_and_business_management_violation
   (or violate_related_regulations
       violate_financial_management_rules
       violate_business_management_rules)))

; [insurance:financial_and_business_management_violation_penalty] 違反財務或業務管理規定者，未限期改正或未廢止許可者處罰
(assert (= financial_and_business_management_violation_penalty
   (and financial_and_business_management_violation
        (or (not correction_completed) (not license_revoked)))))

; [insurance:broker_prohibited_acts_compliance] 保險經紀人及相關人員不得有規則第49條所列禁止行為
(assert (= broker_prohibited_acts_compliance
   (and (not false_report_at_license_application)
        (not contract_with_unapproved_insurer)
        (not conceal_important_contract_info)
        (not improper_coercion_or_inducement)
        (not false_or_misleading_promotion)
        (not improper_inducement_to_cancel_or_loan)
        (not misappropriation_of_funds)
        (not unauthorized_use_of_license)
        (not criminal_conviction_for_fraud_or_breach)
        (not operate_outside_license_scope)
        (not improper_fee_collection)
        (not illegal_insurance_claims)
        (not disrupt_financial_order)
        (not unauthorized_delegation_or_operation)
        (not improper_transfer_of_application_documents)
        (not employ_unqualified_personnel)
        (not failure_to_cancel_license_in_time)
        (not unauthorized_suspension_or_termination_of_business)
        (not failure_to_reappoint_broker_after_resignation)
        (not failure_to_report_to_broker_association)
        (not unauthorized_use_of_advertisement)
        (not improper_commission_payment)
        (not failure_to_confirm_consumer_suitability)
        (not sale_of_unapproved_foreign_policy_discount_certificates)
        (not false_or_incomplete_business_or_financial_reports)
        (not conflict_of_interest_or_registration_violation)
        (not induce_cancellation_or_termination_of_contract)
        (not failure_to_fill_out_prospectus_truthfully)
        (not other_violations_of_rules_or_laws)
        (not damage_insurance_image))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險投保、執業證照規定或違反管理規則及禁止行為時處罰
(assert (= penalty
   (or (not management_rules_defined)
       (not license_and_guarantee_compliance)
       (not financial_and_business_management_violation_penalty)
       (not broker_prohibited_acts_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= broker true))
(assert (= approved_by_authority true))
(assert (= guarantee_deposit_amount 500000))
(assert (= minimum_guarantee_deposit 1000000))
(assert (= liability_insurance_subscribed true))
(assert (= guarantee_insurance_subscribed true))
(assert (= license_issued true))
(assert (= authority_defined_management_rules true))
(assert (= management_rules_defined true))
(assert (= bank_approved_by_authority true))
(assert (= bank_operate_as_broker true))
(assert (= apply_agent_broker_regulations true))
(assert (= broker_prohibited_acts_compliance false))
(assert (= false_or_incomplete_business_or_financial_reports false))
(assert (= improper_inducement_to_cancel_or_loan true))
(assert (= violate_related_regulations true))
(assert (= financial_and_business_management_violation true))
(assert (= corrective_order_issued true))
(assert (= improvement_order_issued true))
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
; Total variables: 75
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
