; SMT2 file generated from compliance case automatic
; Case ID: case_145
; Generated at: 2025-10-21T03:02:00.252396
;
; This file can be executed with Z3:
;   z3 case_145.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const IF Bool)
(declare-const act_10_convicted_fraud_or_forgery Bool)
(declare-const act_11_outside_license_scope Bool)
(declare-const act_12_illegal_collection Bool)
(declare-const act_13_illegal_insurance_payment Bool)
(declare-const act_14_spread_false_info Bool)
(declare-const act_15_authorize_others_to_operate Bool)
(declare-const act_16_transfer_application_documents Bool)
(declare-const act_17_employ_unqualified_personnel Bool)
(declare-const act_18_fail_to_cancel_license_in_time Bool)
(declare-const act_19_unauthorized_suspend_or_terminate_business Bool)
(declare-const act_1_report_false Bool)
(declare-const act_20_fail_to_reappoint_agent_after_resignation Bool)
(declare-const act_21_fail_to_report_to_trade_association Bool)
(declare-const act_22_use_unapproved_advertisement Bool)
(declare-const act_23_pay_commission_to_non_actual_agent Bool)
(declare-const act_24_fail_to_confirm_suitability_for_elderly Bool)
(declare-const act_25_sell_unapproved_foreign_policy_discount Bool)
(declare-const act_26_false_financial_or_business_report Bool)
(declare-const act_27_conflict_of_interest Bool)
(declare-const act_28_induce_contract_termination_or_loan_payment Bool)
(declare-const act_29_fail_to_fill_solicitation_report Bool)
(declare-const act_2_unapproved_agent_business Bool)
(declare-const act_30_other_violations Bool)
(declare-const act_31_damage_insurance_image Bool)
(declare-const act_3_unapproved_insurance_business Bool)
(declare-const act_4_hide_important_contract_info Bool)
(declare-const act_5_force_or_induce_contract Bool)
(declare-const act_6_false_advertisement Bool)
(declare-const act_7_induce_policy_surrender_or_loan Bool)
(declare-const act_8_misappropriate_funds Bool)
(declare-const act_9_unauthorized_use_license Bool)
(declare-const audit_system_established Bool)
(declare-const bond_deposited Bool)
(declare-const fixed_office_and_accounting Bool)
(declare-const has_agent_license Bool)
(declare-const has_broker_license Bool)
(declare-const has_certain_scale Bool)
(declare-const has_dedicated_accounting_books Bool)
(declare-const has_fixed_office Bool)
(declare-const has_notary_license Bool)
(declare-const insurance_purchased Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_required Bool)
(declare-const is_public_company Bool)
(declare-const license_and_bond_insurance_ok Bool)
(declare-const license_obtained Bool)
(declare-const penalty Bool)
(declare-const prohibited_acts Bool)
(declare-const single_license_only Bool)
(declare-const solicitation_handling_system_established Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_bond_insurance_ok] 保險代理人、經紀人、公證人已取得許可、繳存保證金並投保相關保險
(assert (= license_and_bond_insurance_ok
   (and license_obtained bond_deposited insurance_purchased)))

; [insurance:single_license_only] 兼有代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license_only
   (>= 1
       (+ (ite has_agent_license 1 0)
          (ite has_broker_license 1 0)
          (ite has_notary_license 1 0)))))

; [insurance:fixed_office_and_accounting] 保險代理人、經紀人、公證人有固定業務處所並專設帳簿記載業務收支
(assert (= fixed_office_and_accounting
   (and has_fixed_office has_dedicated_accounting_books)))

; [insurance:internal_control_required] 公開發行公司或具一定規模之代理人公司、經紀人公司建立內部控制、稽核及招攬處理制度與程序
(assert (= internal_control_required
   (or (not (or is_public_company has_certain_scale))
       (and internal_control_established
            audit_system_established
            solicitation_handling_system_established))))

; [insurance:prohibited_acts] 代理人違反代理人管理規則第49條禁止行為
(assert (not (= (or act_23_pay_commission_to_non_actual_agent
            act_19_unauthorized_suspend_or_terminate_business
            act_28_induce_contract_termination_or_loan_payment
            act_4_hide_important_contract_info
            act_1_report_false
            act_11_outside_license_scope
            act_31_damage_insurance_image
            act_25_sell_unapproved_foreign_policy_discount
            act_21_fail_to_report_to_trade_association
            act_6_false_advertisement
            act_7_induce_policy_surrender_or_loan
            act_13_illegal_insurance_payment
            act_2_unapproved_agent_business
            act_26_false_financial_or_business_report
            act_14_spread_false_info
            act_30_other_violations
            act_8_misappropriate_funds
            act_3_unapproved_insurance_business
            act_5_force_or_induce_contract
            act_9_unauthorized_use_license
            act_17_employ_unqualified_personnel
            act_20_fail_to_reappoint_agent_after_resignation
            act_10_convicted_fraud_or_forgery
            act_24_fail_to_confirm_suitability_for_elderly
            act_29_fail_to_fill_solicitation_report
            act_18_fail_to_cancel_license_in_time
            act_16_transfer_application_documents
            act_12_illegal_collection
            act_15_authorize_others_to_operate
            act_27_conflict_of_interest
            act_22_use_unapproved_advertisement)
        prohibited_acts)))

; [insurance:penalty_conditions] 處罰條件：違反代理人管理規則第49條禁止行為或未取得許可、保證金、保險，或違反內部控制規定時處罰
(assert (= penalty
   (or (not internal_control_required)
       (not license_and_bond_insurance_ok)
       prohibited_acts)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= act_24_fail_to_confirm_suitability_for_elderly true))
(assert (= act_29_fail_to_fill_solicitation_report true))
(assert (= license_obtained true))
(assert (= bond_deposited true))
(assert (= insurance_purchased true))
(assert (= has_agent_license true))
(assert (= has_broker_license false))
(assert (= has_notary_license false))
(assert (= single_license_only true))
(assert (= has_fixed_office true))
(assert (= has_dedicated_accounting_books true))
(assert (= fixed_office_and_accounting true))
(assert (= is_public_company false))
(assert (= has_certain_scale false))
(assert (= internal_control_required false))
(assert (= internal_control_established false))
(assert (= audit_system_established false))
(assert (= solicitation_handling_system_established false))
(assert (= prohibited_acts false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 51
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
