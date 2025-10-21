; SMT2 file generated from compliance case automatic
; Case ID: case_319
; Generated at: 2025-10-21T07:10:58.525332
;
; This file can be executed with Z3:
;   z3 case_319.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_or_notary Bool)
(declare-const annual_financial_reports_submitted Bool)
(declare-const approved_by_authority Bool)
(declare-const authority_defined_management_rules Bool)
(declare-const authority_defined_minimum_guarantee_deposit Bool)
(declare-const authority_or_designated_agency_inspection Bool)
(declare-const authorize_others_to_operate_or_use_others_name Bool)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_and_separate_application Bool)
(declare-const broker_and_company_license_cancelled Bool)
(declare-const broker_bookkeeping_and_reporting_compliance Bool)
(declare-const broker_cancel_registration_if_company_suspend_dissolve_or_license_revoked Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_company_apply_dissolve Bool)
(declare-const broker_company_apply_extension Bool)
(declare-const broker_company_apply_resume Bool)
(declare-const broker_company_apply_suspend Bool)
(declare-const broker_company_cancel_broker_license_on_suspend_or_dissolve Bool)
(declare-const broker_company_dissolve Bool)
(declare-const broker_company_employ_broker_as_required Bool)
(declare-const broker_company_extension_count Int)
(declare-const broker_company_license_revoked Bool)
(declare-const broker_company_operate_both_insurance_and_reinsurance Bool)
(declare-const broker_company_report_and_registration_compliance Bool)
(declare-const broker_company_report_to_authority_on_stop_business Bool)
(declare-const broker_company_revoke_if_no_resume_and_no_broker Bool)
(declare-const broker_company_stop_insurance_brokerage Bool)
(declare-const broker_company_stop_reinsurance_brokerage Bool)
(declare-const broker_company_suspend Bool)
(declare-const broker_company_suspend_duration_months Int)
(declare-const broker_company_suspend_period_expired Bool)
(declare-const broker_company_suspend_period_expiring_soon Bool)
(declare-const broker_company_suspend_period_limit Int)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fee_collection_and_payment_compliance Bool)
(declare-const broker_fulfill_fidelity_obligation Bool)
(declare-const broker_license_cancelled_within_30_days Bool)
(declare-const broker_provide_written_analysis_report Bool)
(declare-const broker_within_authority_scope Bool)
(declare-const charge_unlawful_fees_or_commissions Bool)
(declare-const coerce_or_induce_or_limit_contract_freedom Bool)
(declare-const collect_and_pay_insurance_fee Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const criminal_conviction_for_fraud_or_breach_of_trust Bool)
(declare-const direct_total_payment_to_insurer Bool)
(declare-const employ_unqualified_insurance_solicitors Bool)
(declare-const extension_application_submitted Bool)
(declare-const fail_to_cancel_license_within_legal_period Bool)
(declare-const fail_to_confirm_consumer_suitability Bool)
(declare-const fail_to_employ_broker_after_broker_resignation Bool)
(declare-const fail_to_fill_solicitation_report_truthfully Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_declaration_on_license_application Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance_subscribed Bool)
(declare-const hold_positions_in_insurance_or_association_conflict Bool)
(declare-const improper_inducement_to_cancel_or_transfer Bool)
(declare-const improvement_follow_up_reported Bool)
(declare-const induce_clients_to_cancel_or_terminate_contracts Bool)
(declare-const insurance_broker Bool)
(declare-const liability_insurance_subscribed Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_issued Bool)
(declare-const management_rules_defined Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const minimum_guarantee_deposit_defined Bool)
(declare-const misappropriate_insurance_or_reinsurance_funds Bool)
(declare-const misleading_promotion_or_recruitment Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_solicitor Bool)
(declare-const payer_is_insured_or_beneficiary Bool)
(declare-const payer_statement_provided Bool)
(declare-const penalty Bool)
(declare-const permit_others_to_use_license Bool)
(declare-const prohibited_behaviors Bool)
(declare-const relevant_insurance_subscribed Bool)
(declare-const relevant_insurance_type_compliance Bool)
(declare-const report_and_registration_done Bool)
(declare-const report_to_authority_within_1_month Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const special_account_books_maintained Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const submit_false_or_incomplete_business_or_financial_reports Bool)
(declare-const transfer_application_documents_without_consent Bool)
(declare-const unauthorized_suspend_resume_dissolve_or_terminate_business Bool)
(declare-const unlawful_insurance_claims Bool)
(declare-const use_unapproved_advertisement_content Bool)
(declare-const violate_163_5th_paragraph_applied Bool)
(declare-const violate_163_7th_paragraph Bool)
(declare-const violate_165_1st_paragraph Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violation_financial_or_business_management_rules Bool)
(declare-const violation_penalty Bool)
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

; [insurance:relevant_insurance_type_compliance] 保險代理人、公證人須投保責任保險；保險經紀人須投保責任保險及保證保險
(assert (= relevant_insurance_type_compliance
   (or (and agent_or_notary liability_insurance_subscribed)
       (and insurance_broker
            liability_insurance_subscribed
            guarantee_insurance_subscribed))))

; [insurance:minimum_guarantee_deposit_defined] 主管機關依經營業務範圍及規模定最低保證金及實施方式
(assert (= minimum_guarantee_deposit_defined
   authority_defined_minimum_guarantee_deposit))

; [insurance:management_rules_defined] 主管機關定保險代理人、經紀人、公證人資格取得、申請許可條件、程序及其他管理規則
(assert (= management_rules_defined authority_defined_management_rules))

; [insurance:bank_permission_and_separate_application] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_separate_application
   (and bank_approved_by_authority
        (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity_obligation)))

; [insurance:broker_provide_written_analysis_report] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告
(assert (= broker_provide_written_analysis_report
   (or written_analysis_report_provided (not broker_within_authority_scope))))

; [insurance:broker_disclose_fee_standard] 保險經紀人向要保人或被保險人收取報酬者，應明確告知報酬收取標準
(assert (= broker_disclose_fee_standard
   (or (not broker_charge_fee) fee_standard_disclosed)))

; [insurance:violation_financial_or_business_management_rules] 違反保險法第163條第四項管理規則中財務或業務管理規定，或第163條第七項規定，或第165條第一項或第163條第五項準用規定
(assert (= violation_financial_or_business_management_rules
   (or violate_163_5th_paragraph_applied
       violate_165_1st_paragraph
       violate_business_management_rules
       violate_financial_management_rules
       violate_163_7th_paragraph)))

; [insurance:violation_penalty] 違反上述規定者應限期改正或處罰鍰，情節重大者廢止許可並註銷執業證照
(assert (= violation_penalty violation_financial_or_business_management_rules))

; [insurance:broker_company_report_and_registration_compliance] 經紀人公司停業、復業、解散等應依規定申請核准並辦理登記
(assert (= broker_company_report_and_registration_compliance
   (and (or broker_company_apply_resume
            broker_company_apply_dissolve
            broker_company_apply_suspend)
        report_and_registration_done)))

; [insurance:broker_company_suspend_period_limit] 經紀人公司停業期間以一年為限，得申請一次展延，並應於屆滿前十五日提出
(assert (let ((a!1 (ite (and (>= 12 broker_company_suspend_duration_months)
                     (or (not broker_company_apply_extension)
                         (= 1 broker_company_extension_count))
                     (or extension_application_submitted
                         (not broker_company_suspend_period_expiring_soon)))
                1
                0)))
  (= broker_company_suspend_period_limit a!1)))

; [insurance:broker_company_revoke_if_no_resume_and_no_broker] 經紀人公司未於停業期間屆滿申請復業並依規定任用經紀人者，主管機關廢止許可並註銷執業證照
(assert (= broker_company_revoke_if_no_resume_and_no_broker
   (and broker_company_suspend_period_expired
        (not broker_company_apply_resume)
        (not broker_company_employ_broker_as_required))))

; [insurance:broker_company_cancel_broker_license_on_suspend_or_dissolve] 經紀人公司申請停業或解散，應繳銷所任用經紀人及公司執業證照
(assert (= broker_company_cancel_broker_license_on_suspend_or_dissolve
   (and (or broker_company_apply_dissolve broker_company_apply_suspend)
        broker_and_company_license_cancelled)))

; [insurance:broker_cancel_registration_if_company_suspend_dissolve_or_license_revoked] 經紀人公司停業、解散或主管機關註銷執業證照，未辦理繳銷經紀人執業證照者，經紀人應於三十日內委由公會辦理註銷登記
(assert (= broker_cancel_registration_if_company_suspend_dissolve_or_license_revoked
   (and (or broker_company_license_revoked
            broker_company_suspend
            broker_company_dissolve)
        broker_license_cancelled_within_30_days)))

; [insurance:broker_company_report_to_authority_on_stop_business] 同時經營保險經紀及再保險經紀業務之經紀人公司停止其中一業務，應於一個月內報主管機關備查
(assert (= broker_company_report_to_authority_on_stop_business
   (or (not broker_company_operate_both_insurance_and_reinsurance)
       (and (or broker_company_stop_insurance_brokerage
                broker_company_stop_reinsurance_brokerage)
            report_to_authority_within_1_month))))

; [insurance:broker_fee_collection_and_payment_compliance] 個人執業經紀人、經紀人公司及銀行受要保人委託代收轉付保險費應直接總額解繳保險業，非本人票據須有聲明書
(assert (= broker_fee_collection_and_payment_compliance
   (and (or direct_total_payment_to_insurer (not collect_and_pay_insurance_fee))
        (or payer_is_insured_or_beneficiary payer_statement_provided))))

; [insurance:broker_bookkeeping_and_reporting_compliance] 個人執業經紀人、經紀人公司及銀行應專設帳簿並於指定期間彙報主管機關，並接受檢查及改善
(assert (= broker_bookkeeping_and_reporting_compliance
   (and special_account_books_maintained
        annual_financial_reports_submitted
        authority_or_designated_agency_inspection
        improvement_follow_up_reported)))

; [insurance:prohibited_behaviors] 個人執業經紀人、經紀人公司、銀行及受任用經紀人不得有多項違法或不當行為
(assert (not (= (or pay_commission_to_non_actual_solicitor
            sell_unapproved_foreign_policy_discount_products
            criminal_conviction_for_fraud_or_breach_of_trust
            unauthorized_suspend_resume_dissolve_or_terminate_business
            employ_unqualified_insurance_solicitors
            transfer_application_documents_without_consent
            submit_false_or_incomplete_business_or_financial_reports
            fail_to_fill_solicitation_report_truthfully
            other_behaviors_damaging_insurance_image
            contract_with_unapproved_insurer
            permit_others_to_use_license
            operate_outside_license_scope
            coerce_or_induce_or_limit_contract_freedom
            unlawful_insurance_claims
            other_violations_of_rules_or_laws
            misleading_promotion_or_recruitment
            improper_inducement_to_cancel_or_transfer
            fail_to_employ_broker_after_broker_resignation
            use_unapproved_advertisement_content
            fail_to_confirm_consumer_suitability
            hold_positions_in_insurance_or_association_conflict
            fail_to_report_to_broker_association
            misappropriate_insurance_or_reinsurance_funds
            false_declaration_on_license_application
            fail_to_cancel_license_within_legal_period
            authorize_others_to_operate_or_use_others_name
            charge_unlawful_fees_or_commissions
            conceal_important_contract_info
            induce_clients_to_cancel_or_terminate_contracts
            spread_false_information_disturb_financial_order)
        prohibited_behaviors)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險投保、管理規則、經紀人公司規定或有禁止行為時處罰
(assert (= penalty
   (or (not broker_company_cancel_broker_license_on_suspend_or_dissolve)
       (not relevant_insurance_type_compliance)
       broker_company_revoke_if_no_resume_and_no_broker
       (not management_rules_defined)
       (not license_and_guarantee_compliance)
       (not prohibited_behaviors)
       (not broker_company_report_and_registration_compliance)
       (not (= broker_company_suspend_period_limit 1))
       (not broker_cancel_registration_if_company_suspend_dissolve_or_license_revoked)
       (not broker_fee_collection_and_payment_compliance)
       (not broker_company_report_to_authority_on_stop_business)
       violation_penalty
       (not broker_bookkeeping_and_reporting_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_or_notary false))
(assert (= insurance_broker true))
(assert (= approved_by_authority true))
(assert (= license_issued true))
(assert (= guarantee_deposit_amount 500000))
(assert (= minimum_guarantee_deposit 500000))
(assert (= minimum_guarantee_deposit_defined true))
(assert (= relevant_insurance_subscribed true))
(assert (= liability_insurance_subscribed true))
(assert (= guarantee_insurance_subscribed true))
(assert (= relevant_insurance_type_compliance true))
(assert (= authority_defined_management_rules true))
(assert (= management_rules_defined true))
(assert (= broker_fee_collection_and_payment_compliance false))
(assert (= collect_and_pay_insurance_fee true))
(assert (= direct_total_payment_to_insurer false))
(assert (= broker_bookkeeping_and_reporting_compliance false))
(assert (= special_account_books_maintained false))
(assert (= annual_financial_reports_submitted false))
(assert (= authority_or_designated_agency_inspection false))
(assert (= improvement_follow_up_reported false))
(assert (= violate_financial_management_rules true))
(assert (= violate_business_management_rules true))
(assert (= violation_financial_or_business_management_rules true))
(assert (= violation_penalty true))
(assert (= prohibited_behaviors false))
(assert (= broker_company_apply_suspend true))
(assert (= broker_company_suspend true))
(assert (= broker_company_report_and_registration_compliance false))
(assert (= report_and_registration_done false))
(assert (= broker_company_cancel_broker_license_on_suspend_or_dissolve false))
(assert (= broker_and_company_license_cancelled false))
(assert (= broker_cancel_registration_if_company_suspend_dissolve_or_license_revoked false))
(assert (= broker_license_cancelled_within_30_days false))
(assert (= broker_company_revoke_if_no_resume_and_no_broker false))
(assert (= broker_company_apply_resume false))
(assert (= broker_company_employ_broker_as_required false))
(assert (= broker_company_suspend_period_expired false))
(assert (= broker_company_suspend_duration_months 13))
(assert (= broker_company_suspend_period_limit 12))
(assert (= broker_company_apply_extension false))
(assert (= broker_company_extension_count 0))
(assert (= broker_company_suspend_period_expiring_soon false))
(assert (= extension_application_submitted false))
(assert (= broker_company_dissolve false))
(assert (= broker_company_license_revoked false))
(assert (= broker_company_report_to_authority_on_stop_business true))
(assert (= broker_company_operate_both_insurance_and_reinsurance false))
(assert (= broker_company_stop_insurance_brokerage false))
(assert (= broker_company_stop_reinsurance_brokerage false))
(assert (= report_to_authority_within_1_month false))
(assert (= broker_charge_fee false))
(assert (= fee_standard_disclosed false))
(assert (= broker_disclose_fee_standard true))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_fulfill_fidelity_obligation false))
(assert (= broker_provide_written_analysis_report false))
(assert (= broker_within_authority_scope false))
(assert (= written_analysis_report_provided false))
(assert (= payer_is_insured_or_beneficiary false))
(assert (= payer_statement_provided false))
(assert (= license_and_guarantee_compliance true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 103
; Total facts: 64
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
