; SMT2 file generated from compliance case automatic
; Case ID: case_95
; Generated at: 2025-10-21T01:31:31.828736
;
; This file can be executed with Z3:
;   z3 case_95.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const IF Bool)
(declare-const act_10_operate_outside_license_scope Bool)
(declare-const act_11_illegal_fee_collection Bool)
(declare-const act_12_illegal_insurance_payment Bool)
(declare-const act_13_spread_false_information Bool)
(declare-const act_14_authorize_others_to_operate Bool)
(declare-const act_15_illegal_transfer_of_application_documents Bool)
(declare-const act_16_employ_unqualified_personnel Bool)
(declare-const act_17_fail_to_cancel_license_in_time Bool)
(declare-const act_18_unauthorized_suspension_or_termination Bool)
(declare-const act_19_fail_to_appoint_replacement_broker Bool)
(declare-const act_1_false_report_on_license_application Bool)
(declare-const act_20_fail_to_report_to_broker_association Bool)
(declare-const act_21_use_unapproved_advertisement Bool)
(declare-const act_22_pay_commission_to_non_actual_recruiter Bool)
(declare-const act_23_fail_to_confirm_suitability_for_elderly Bool)
(declare-const act_24_sell_unapproved_foreign_policy_discount_benefits Bool)
(declare-const act_25_false_or_incomplete_financial_reports Bool)
(declare-const act_26_conflict_of_interest_or_insurance_officer Bool)
(declare-const act_27_induce_contract_termination_or_loan Bool)
(declare-const act_28_fail_to_fill_recruitment_report_truthfully Bool)
(declare-const act_29_other_violations_of_rules_or_laws Bool)
(declare-const act_2_contract_with_unapproved_insurer Bool)
(declare-const act_30_other_acts_damaging_insurance_image Bool)
(declare-const act_3_conceal_important_contract_info Bool)
(declare-const act_4_coerce_or_induce_unfair_contract Bool)
(declare-const act_5_false_or_misleading_promotion Bool)
(declare-const act_6_improper_inducement_to_cancel_or_loan Bool)
(declare-const act_7_misappropriation_of_funds Bool)
(declare-const act_8_unauthorized_use_of_license Bool)
(declare-const act_9_conviction_of_fraud_or_forgery Bool)
(declare-const agent_or_notary Bool)
(declare-const broker Bool)
(declare-const broker_company_shareholding_in_insurance_company Real)
(declare-const broker_exercises_diligence Bool)
(declare-const broker_fulfills_loyalty Bool)
(declare-const broker_in_specified_scope Bool)
(declare-const discloses_fee_standard Bool)
(declare-const discloses_shareholding_info Bool)
(declare-const disclosure_of_shareholding Bool)
(declare-const documents_retained Bool)
(declare-const fixed_office_and_accounting Bool)
(declare-const good_faith_and_duty_of_loyalty Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const has_agent_certificate Bool)
(declare-const has_broker_certificate Bool)
(declare-const has_dedicated_accounting_books Bool)
(declare-const has_fixed_office Bool)
(declare-const has_guarantee_insurance Bool)
(declare-const has_internal_control_and_audit_and_handling_procedures Bool)
(declare-const has_internal_operation_regulations Bool)
(declare-const has_liability_insurance Bool)
(declare-const has_notary_certificate Bool)
(declare-const has_practice_certificate Bool)
(declare-const insurance_company_shareholding_in_broker_company Real)
(declare-const insurance_policy_type_compliance Bool)
(declare-const insurance_policy_valid Bool)
(declare-const internal_control_requirement Bool)
(declare-const internal_operation_compliance Bool)
(declare-const internal_operation_regulations_implemented Bool)
(declare-const is_agent_company Bool)
(declare-const is_broker_company Bool)
(declare-const is_publicly_listed_or_large_scale Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const licensed Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const penalty Bool)
(declare-const prohibited_acts Bool)
(declare-const provides_written_analysis_report Bool)
(declare-const receives_fee Bool)
(declare-const single_practice_certificate Bool)
(declare-const understanding_customer_needs_and_documentation Bool)
(declare-const understands_customer_needs Bool)
(declare-const written_analysis_report_and_fee_disclosure Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照
(assert (= license_and_guarantee_compliance
   (and licensed
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        insurance_policy_valid
        has_practice_certificate)))

; [insurance:insurance_policy_type_compliance] 保險代理人、公證人投保責任保險，保險經紀人投保責任保險及保證保險
(assert (= insurance_policy_type_compliance
   (or (and agent_or_notary has_liability_insurance)
       (and broker has_liability_insurance has_guarantee_insurance))))

; [insurance:single_practice_certificate] 兼有代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_practice_certificate
   (>= 1
       (+ (ite has_agent_certificate 1 0)
          (ite has_broker_certificate 1 0)
          (ite has_notary_certificate 1 0)))))

; [insurance:fixed_office_and_accounting] 保險代理人、經紀人、公證人應有固定業務處所，並專設帳簿記載業務收支
(assert (= fixed_office_and_accounting
   (and has_fixed_office has_dedicated_accounting_books)))

; [insurance:internal_control_requirement] 公開發行公司或具一定規模之代理人公司、經紀人公司應建立內部控制、稽核制度與招攬處理制度及程序
(assert (let ((a!1 (or (not (and is_publicly_listed_or_large_scale
                         (or is_agent_company is_broker_company)))
               has_internal_control_and_audit_and_handling_procedures)))
  (= internal_control_requirement a!1)))

; [insurance:good_faith_and_duty_of_loyalty] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= good_faith_and_duty_of_loyalty
   (and broker_exercises_diligence broker_fulfills_loyalty)))

; [insurance:written_analysis_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (let ((a!1 (or (not broker_in_specified_scope)
               (and provides_written_analysis_report
                    (or (not receives_fee) discloses_fee_standard)))))
  (= written_analysis_report_and_fee_disclosure a!1)))

; [insurance:internal_operation_compliance] 經紀人公司及銀行應依法令及主管機關規定訂定內部作業規範並落實執行
(assert (= internal_operation_compliance
   (and has_internal_operation_regulations
        internal_operation_regulations_implemented)))

; [insurance:understanding_customer_needs_and_documentation] 經紀人應確實瞭解要保人需求及商品適合度，並留存相關文件
(assert (= understanding_customer_needs_and_documentation
   (and understands_customer_needs documents_retained)))

; [insurance:disclosure_of_shareholding] 經紀人於洽訂保險契約前，應揭露單一保險公司或經紀人公司持股超過10%資訊
(assert (let ((a!1 (not (or (not (<= broker_company_shareholding_in_insurance_company
                             10.0))
                    (not (<= insurance_company_shareholding_in_broker_company
                             10.0))))))
  (= disclosure_of_shareholding (or a!1 discloses_shareholding_info))))

; [insurance:prohibited_acts] 經紀人不得有保險經紀人管理規則第49條所列禁止行為
(assert (not (= (or act_11_illegal_fee_collection
            act_15_illegal_transfer_of_application_documents
            act_8_unauthorized_use_of_license
            act_13_spread_false_information
            act_30_other_acts_damaging_insurance_image
            act_24_sell_unapproved_foreign_policy_discount_benefits
            act_23_fail_to_confirm_suitability_for_elderly
            act_1_false_report_on_license_application
            act_16_employ_unqualified_personnel
            act_25_false_or_incomplete_financial_reports
            act_14_authorize_others_to_operate
            act_5_false_or_misleading_promotion
            act_29_other_violations_of_rules_or_laws
            act_17_fail_to_cancel_license_in_time
            act_27_induce_contract_termination_or_loan
            act_22_pay_commission_to_non_actual_recruiter
            act_18_unauthorized_suspension_or_termination
            act_9_conviction_of_fraud_or_forgery
            act_7_misappropriation_of_funds
            act_10_operate_outside_license_scope
            act_12_illegal_insurance_payment
            act_6_improper_inducement_to_cancel_or_loan
            act_4_coerce_or_induce_unfair_contract
            act_20_fail_to_report_to_broker_association
            act_28_fail_to_fill_recruitment_report_truthfully
            act_2_contract_with_unapproved_insurer
            act_3_conceal_important_contract_info
            act_26_conflict_of_interest_or_insurance_officer
            act_19_fail_to_appoint_replacement_broker
            act_21_use_unapproved_advertisement)
        prohibited_acts)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險投保、執業證照、內部控制或禁止行為等規定時處罰
(assert (= penalty
   (or (not disclosure_of_shareholding)
       (not internal_control_requirement)
       (not prohibited_acts)
       (not fixed_office_and_accounting)
       (not internal_operation_compliance)
       (not license_and_guarantee_compliance)
       (not single_practice_certificate)
       (not insurance_policy_type_compliance)
       (not good_faith_and_duty_of_loyalty)
       (not understanding_customer_needs_and_documentation)
       (not written_analysis_report_and_fee_disclosure))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= licensed true))
(assert (= guarantee_deposit_amount 50000))
(assert (= minimum_guarantee_deposit 50000))
(assert (= insurance_policy_valid true))
(assert (= has_practice_certificate true))
(assert (= agent_or_notary false))
(assert (= broker true))
(assert (= has_liability_insurance true))
(assert (= has_guarantee_insurance true))
(assert (= has_agent_certificate false))
(assert (= has_broker_certificate true))
(assert (= has_notary_certificate false))
(assert (= has_fixed_office true))
(assert (= has_dedicated_accounting_books true))
(assert (= is_publicly_listed_or_large_scale false))
(assert (= is_agent_company false))
(assert (= is_broker_company true))
(assert (= has_internal_control_and_audit_and_handling_procedures true))
(assert (= broker_exercises_diligence false))
(assert (= broker_fulfills_loyalty false))
(assert (= broker_in_specified_scope false))
(assert (= provides_written_analysis_report true))
(assert (= receives_fee true))
(assert (= discloses_fee_standard false))
(assert (= has_internal_operation_regulations true))
(assert (= internal_operation_regulations_implemented true))
(assert (= understands_customer_needs true))
(assert (= documents_retained true))
(assert (= broker_company_shareholding_in_insurance_company 0.0))
(assert (= insurance_company_shareholding_in_broker_company 0.0))
(assert (= discloses_shareholding_info true))
(assert (= act_11_illegal_fee_collection true))
(assert (= act_10_operate_outside_license_scope false))
(assert (= act_1_false_report_on_license_application false))
(assert (= act_2_contract_with_unapproved_insurer false))
(assert (= act_3_conceal_important_contract_info false))
(assert (= act_4_coerce_or_induce_unfair_contract false))
(assert (= act_5_false_or_misleading_promotion false))
(assert (= act_6_improper_inducement_to_cancel_or_loan false))
(assert (= act_7_misappropriation_of_funds false))
(assert (= act_8_unauthorized_use_of_license false))
(assert (= act_9_conviction_of_fraud_or_forgery false))
(assert (= act_12_illegal_insurance_payment false))
(assert (= act_13_spread_false_information false))
(assert (= act_14_authorize_others_to_operate false))
(assert (= act_15_illegal_transfer_of_application_documents false))
(assert (= act_16_employ_unqualified_personnel false))
(assert (= act_17_fail_to_cancel_license_in_time false))
(assert (= act_18_unauthorized_suspension_or_termination false))
(assert (= act_19_fail_to_appoint_replacement_broker false))
(assert (= act_20_fail_to_report_to_broker_association false))
(assert (= act_21_use_unapproved_advertisement false))
(assert (= act_22_pay_commission_to_non_actual_recruiter false))
(assert (= act_23_fail_to_confirm_suitability_for_elderly false))
(assert (= act_24_sell_unapproved_foreign_policy_discount_benefits false))
(assert (= act_25_false_or_incomplete_financial_reports false))
(assert (= act_26_conflict_of_interest_or_insurance_officer false))
(assert (= act_27_induce_contract_termination_or_loan false))
(assert (= act_28_fail_to_fill_recruitment_report_truthfully false))
(assert (= act_29_other_violations_of_rules_or_laws false))
(assert (= act_30_other_acts_damaging_insurance_image false))

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
; Total facts: 61
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
