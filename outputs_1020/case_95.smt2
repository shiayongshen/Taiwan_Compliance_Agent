; SMT2 file generated from compliance case automatic
; Case ID: case_95
; Generated at: 2025-10-19T07:56:27.914747
;
; This file can be executed with Z3:
;   z3 case_95.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_held Bool)
(declare-const approved_by_authority Bool)
(declare-const audit_system_established Bool)
(declare-const authorize_others_to_operate Bool)
(declare-const broker_company_shareholding_ratio Real)
(declare-const broker_compliance_with_prohibited_acts Bool)
(declare-const broker_disclose_shareholding_info Bool)
(declare-const broker_document_retention Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_duty_to_understand_and_document Bool)
(declare-const broker_exercises_duty_of_care Bool)
(declare-const broker_exercises_fidelity Bool)
(declare-const broker_internal_operation_compliance Bool)
(declare-const broker_license_held Bool)
(declare-const broker_provide_written_report_and_disclose_fee Bool)
(declare-const certain_scale_threshold Real)
(declare-const charge_unapproved_fees_or_commissions Bool)
(declare-const coerce_or_induce_contract Bool)
(declare-const company_scale Real)
(declare-const conceal_important_contract_info Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const criminal_conviction_for_fraud_or_forgery Bool)
(declare-const damage_insurance_reputation Bool)
(declare-const document_signed_or_electronically_confirmed Bool)
(declare-const documents_retained_and_archived Bool)
(declare-const employ_unqualified_recruiters Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_suitability_for_elderly_clients Bool)
(declare-const fail_to_fill_recruitment_report_truthfully Bool)
(declare-const fail_to_reappoint_broker_after_resignation Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_report_on_license_application Bool)
(declare-const fee_charged Real)
(declare-const fee_disclosed_clearly Bool)
(declare-const fixed_office_and_accounting Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance_purchased Bool)
(declare-const has_dedicated_accounting_books Bool)
(declare-const has_fixed_office Bool)
(declare-const hold_conflicting_positions Bool)
(declare-const illegal_insurance_claims Bool)
(declare-const induce_contract_termination_or_loan_payment Bool)
(declare-const induce_policy_cancellation_or_loan Bool)
(declare-const insurance_company_shareholding_ratio Real)
(declare-const insured_needs_understood Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_requirement Bool)
(declare-const internal_operation_regulations_established Bool)
(declare-const internal_operation_regulations_executed Bool)
(declare-const is_agent_or_notary Bool)
(declare-const is_broker Bool)
(declare-const is_publicly_listed Bool)
(declare-const liability_insurance_purchased Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_held Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const misappropriate_insurance_funds Bool)
(declare-const misleading_promotion_or_recruitment Bool)
(declare-const notary_license_held Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_recruiters Bool)
(declare-const penalty Bool)
(declare-const permit_others_use_license Bool)
(declare-const product_suitability_assessed Bool)
(declare-const relevant_insurance_purchased Bool)
(declare-const relevant_insurance_type_compliance Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const shareholding_info_disclosed Bool)
(declare-const single_license_requirement Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const spread_false_information Bool)
(declare-const submit_false_or_incomplete_reports Bool)
(declare-const transfer_application_documents_without_consent Bool)
(declare-const unauthorized_suspension_or_termination_of_business Bool)
(declare-const unauthorized_use_of_insurance_advertisement Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and approved_by_authority
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_purchased
        license_held)))

; [insurance:relevant_insurance_type_compliance] 保險代理人、公證人須投保責任保險；保險經紀人須投保責任保險及保證保險
(assert (= relevant_insurance_type_compliance
   (or (and is_agent_or_notary liability_insurance_purchased)
       (and is_broker
            liability_insurance_purchased
            guarantee_insurance_purchased))))

; [insurance:single_license_requirement] 兼有保險代理人、經紀人、公證人資格者，僅得擇一申領執業證照
(assert (= single_license_requirement
   (>= 1
       (+ (ite agent_license_held 1 0)
          (ite broker_license_held 1 0)
          (ite notary_license_held 1 0)))))

; [insurance:fixed_office_and_accounting] 保險代理人、經紀人、公證人應有固定業務處所，並專設帳簿記載業務收支
(assert (= fixed_office_and_accounting
   (and has_fixed_office has_dedicated_accounting_books)))

; [insurance:internal_control_requirement] 保險代理人公司、經紀人公司為公開發行公司或具一定規模者，應建立內部控制、稽核制度與招攬處理制度及程序
(assert (let ((a!1 (or (not (or is_publicly_listed
                        (>= company_scale certain_scale_threshold)))
               (and internal_control_established
                    audit_system_established
                    solicitation_handling_system_established))))
  (= internal_control_requirement a!1)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人之注意義務及忠實義務為被保險人洽訂保險契約或提供相關服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercises_duty_of_care broker_exercises_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (let ((a!1 (and written_analysis_report_provided
                (or (not (= fee_charged 1.0)) fee_disclosed_clearly))))
  (= broker_provide_written_report_and_disclose_fee a!1)))

; [insurance:broker_duty_to_understand_and_document] 個人執業經紀人、經紀人公司及銀行應確實瞭解要保人需求及商品適合度，並於文件簽章或電子方式記錄
(assert (= broker_duty_to_understand_and_document
   (and insured_needs_understood
        product_suitability_assessed
        document_signed_or_electronically_confirmed)))

; [insurance:broker_document_retention] 個人執業經紀人、經紀人公司及銀行應將有關文件留存建檔備供查閱
(assert (= broker_document_retention documents_retained_and_archived))

; [insurance:broker_internal_operation_compliance] 經紀人公司及銀行應依法令及主管機關規定訂定內部作業規範並落實執行
(assert (= broker_internal_operation_compliance
   (and internal_operation_regulations_established
        internal_operation_regulations_executed)))

; [insurance:broker_disclose_shareholding_info] 經紀人公司或銀行持有保險公司表決權股份超過10%或反之，經紀人應於洽訂保險契約前揭露該資訊
(assert (let ((a!1 (not (or (not (<= broker_company_shareholding_ratio 10.0))
                    (not (<= insurance_company_shareholding_ratio 10.0))))))
  (= broker_disclose_shareholding_info (or a!1 shareholding_info_disclosed))))

; [insurance:broker_compliance_with_prohibited_acts] 個人執業經紀人、經紀人公司、銀行及受任用經紀人不得有保險經紀人管理規則第49條所列違法行為
(assert (not (= (or authorize_others_to_operate
            unauthorized_use_of_insurance_advertisement
            induce_policy_cancellation_or_loan
            employ_unqualified_recruiters
            misappropriate_insurance_funds
            fail_to_confirm_suitability_for_elderly_clients
            contract_with_unapproved_insurer
            induce_contract_termination_or_loan_payment
            fail_to_fill_recruitment_report_truthfully
            sell_unapproved_foreign_policy_discount_products
            fail_to_reappoint_broker_after_resignation
            permit_others_use_license
            criminal_conviction_for_fraud_or_forgery
            illegal_insurance_claims
            pay_commission_to_non_actual_recruiters
            false_report_on_license_application
            fail_to_report_to_broker_association
            coerce_or_induce_contract
            transfer_application_documents_without_consent
            misleading_promotion_or_recruitment
            operate_outside_license_scope
            hold_conflicting_positions
            other_violations_of_rules_or_laws
            charge_unapproved_fees_or_commissions
            spread_false_information
            damage_insurance_reputation
            fail_to_cancel_license_within_deadline
            unauthorized_suspension_or_termination_of_business
            submit_false_or_incomplete_reports
            conceal_important_contract_info)
        broker_compliance_with_prohibited_acts)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反許可、保證金、保險投保、執業證照規定或違反管理規則及禁止行為時處罰
(assert (= penalty
   (or (not internal_control_requirement)
       (not license_and_guarantee_compliance)
       (not relevant_insurance_type_compliance)
       (not fixed_office_and_accounting)
       (not broker_duty_of_care_and_fidelity)
       (not broker_duty_to_understand_and_document)
       (not broker_disclose_shareholding_info)
       (not broker_compliance_with_prohibited_acts)
       (not broker_internal_operation_compliance)
       (not single_license_requirement)
       (not broker_document_retention)
       (not broker_provide_written_report_and_disclose_fee))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_license_held false))
(assert (= approved_by_authority true))
(assert (= audit_system_established true))
(assert (= authorize_others_to_operate false))
(assert (= broker_company_shareholding_ratio 0.0))
(assert (= broker_compliance_with_prohibited_acts false))
(assert (= broker_disclose_shareholding_info true))
(assert (= broker_document_retention true))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= broker_duty_to_understand_and_document true))
(assert (= broker_exercises_duty_of_care true))
(assert (= broker_exercises_fidelity true))
(assert (= broker_internal_operation_compliance true))
(assert (= broker_license_held true))
(assert (= broker_provide_written_report_and_disclose_fee false))
(assert (= certain_scale_threshold 100.0))
(assert (= charge_unapproved_fees_or_commissions true))
(assert (= coerce_or_induce_contract false))
(assert (= company_scale 50.0))
(assert (= conceal_important_contract_info false))
(assert (= contract_with_unapproved_insurer false))
(assert (= criminal_conviction_for_fraud_or_forgery false))
(assert (= damage_insurance_reputation false))
(assert (= document_signed_or_electronically_confirmed true))
(assert (= documents_retained_and_archived true))
(assert (= employ_unqualified_recruiters false))
(assert (= fail_to_cancel_license_within_deadline false))
(assert (= fail_to_confirm_suitability_for_elderly_clients false))
(assert (= fail_to_fill_recruitment_report_truthfully false))
(assert (= fail_to_reappoint_broker_after_resignation false))
(assert (= fail_to_report_to_broker_association false))
(assert (= false_report_on_license_application false))
(assert (= fee_charged (/ 1.0 4.0)))
(assert (= fee_disclosed_clearly false))
(assert (= fixed_office_and_accounting true))
(assert (= guarantee_deposit_amount 1000000.0))
(assert (= guarantee_insurance_purchased true))
(assert (= has_dedicated_accounting_books true))
(assert (= has_fixed_office true))
(assert (= hold_conflicting_positions false))
(assert (= illegal_insurance_claims false))
(assert (= induce_contract_termination_or_loan_payment false))
(assert (= induce_policy_cancellation_or_loan false))
(assert (= insurance_company_shareholding_ratio 0.0))
(assert (= insured_needs_understood true))
(assert (= internal_control_established true))
(assert (= internal_control_requirement true))
(assert (= internal_operation_regulations_established true))
(assert (= internal_operation_regulations_executed true))
(assert (= is_agent_or_notary false))
(assert (= is_broker true))
(assert (= is_publicly_listed false))
(assert (= liability_insurance_purchased true))
(assert (= license_and_guarantee_compliance true))
(assert (= license_held true))
(assert (= minimum_guarantee_deposit 500000.0))
(assert (= misappropriate_insurance_funds false))
(assert (= misleading_promotion_or_recruitment false))
(assert (= notary_license_held false))
(assert (= operate_outside_license_scope false))
(assert (= other_violations_of_rules_or_laws true))
(assert (= pay_commission_to_non_actual_recruiters false))
(assert (= penalty true))
(assert (= permit_others_use_license false))
(assert (= product_suitability_assessed true))
(assert (= relevant_insurance_purchased true))
(assert (= relevant_insurance_type_compliance true))
(assert (= sell_unapproved_foreign_policy_discount_products false))
(assert (= shareholding_info_disclosed true))
(assert (= single_license_requirement true))
(assert (= solicitation_handling_system_established true))
(assert (= spread_false_information false))
(assert (= submit_false_or_incomplete_reports false))
(assert (= transfer_application_documents_without_consent false))
(assert (= unauthorized_suspension_or_termination_of_business false))
(assert (= unauthorized_use_of_insurance_advertisement false))
(assert (= written_analysis_report_provided true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 77
; Total facts: 77
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
