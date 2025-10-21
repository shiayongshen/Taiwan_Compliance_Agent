; SMT2 file generated from compliance case automatic
; Case ID: case_48
; Generated at: 2025-10-21T00:09:37.296395
;
; This file can be executed with Z3:
;   z3 case_48.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const April_1 Bool)
(declare-const IF Bool)
(declare-const May_31 Bool)
(declare-const accounting_and_reporting Bool)
(declare-const agent Bool)
(declare-const annual_report_submitted Bool)
(declare-const applicant_email Bool)
(declare-const applicant_phone Bool)
(declare-const audit_system_established Bool)
(declare-const authorize_others_to_operate Bool)
(declare-const basic_info_understood Bool)
(declare-const bond_deposited Bool)
(declare-const broker Bool)
(declare-const broker_appointed_as_required Bool)
(declare-const broker_company_license_revoked_for_no_resume Bool)
(declare-const broker_company_no_license_cancellation Bool)
(declare-const broker_company_report_stop_reinsurance_stop Bool)
(declare-const broker_company_stop_period_limit Bool)
(declare-const broker_company_stop_resume_dissolve Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_of_care_and_loyalty Bool)
(declare-const broker_license_canceled Bool)
(declare-const broker_or_agent_or_bank Bool)
(declare-const broker_report_and_fee_disclosure Bool)
(declare-const broker_shareholding_disclosure Bool)
(declare-const broker_understanding_and_report Bool)
(declare-const charge_illegal_fees Bool)
(declare-const coerce_or_induce_contract Bool)
(declare-const company_dissolved Bool)
(declare-const company_stopped Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const correction_followed_up Bool)
(declare-const correction_reported Bool)
(declare-const criminal_conviction_for_fraud Bool)
(declare-const damage_insurance_image Bool)
(declare-const days_since_event Int)
(declare-const days_since_stop Int)
(declare-const dissolve_reported_and_approved Bool)
(declare-const document_retention Bool)
(declare-const documents_retained Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_loyalty Bool)
(declare-const elderly_consumer_protection_included Bool)
(declare-const electronic_policy_contact_info Bool)
(declare-const electronic_policy_issued Bool)
(declare-const embezzle_insurance_funds Bool)
(declare-const employ_unqualified_recruiters Bool)
(declare-const extension_count Int)
(declare-const extension_request_days_before_expiry Int)
(declare-const extension_requested Bool)
(declare-const fail_to_appoint_broker_after_employment Bool)
(declare-const fail_to_cancel_license_in_time Bool)
(declare-const fail_to_confirm_suitability_for_elderly Bool)
(declare-const fail_to_fill_recruitment_report Bool)
(declare-const fail_to_report_to_trade_association Bool)
(declare-const false_or_incomplete_report Bool)
(declare-const false_report_on_license_application Bool)
(declare-const fee_disclosure_provided Bool)
(declare-const fixed_office Bool)
(declare-const fixed_office_and_accounting Bool)
(declare-const handling_system_established Bool)
(declare-const hold_conflicting_positions Bool)
(declare-const illegal_insurance_payments Bool)
(declare-const induce_contract_termination_or_loan Bool)
(declare-const induce_policy_surrender_or_loan Bool)
(declare-const inspection_and_correction Bool)
(declare-const inspection_conducted Bool)
(declare-const insurance_brokerage_stopped Bool)
(declare-const insurance_insured Bool)
(declare-const insurance_type_guarantee Bool)
(declare-const insurance_type_responsibility Bool)
(declare-const insured_email Bool)
(declare-const insured_phone Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_required Bool)
(declare-const internal_operation_regulation Bool)
(declare-const internal_operation_regulation_established Bool)
(declare-const internal_operation_regulation_implemented Bool)
(declare-const large_scale Bool)
(declare-const license_issued Bool)
(declare-const license_required Bool)
(declare-const license_revoked Bool)
(declare-const misleading_promotion Bool)
(declare-const needs_and_risk_assessed Bool)
(declare-const non_calendar_fiscal_year Bool)
(declare-const notary Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_violations Bool)
(declare-const pay_commission_to_non_actual_recruiters Bool)
(declare-const penalty Bool)
(declare-const permit_granted Bool)
(declare-const permit_others_to_use_license Bool)
(declare-const prohibited_behaviors Bool)
(declare-const publicly_listed Bool)
(declare-const reinsurance_brokerage_stopped Bool)
(declare-const resume_applied Bool)
(declare-const resume_reported_and_approved Bool)
(declare-const sell_unapproved_foreign_policies Bool)
(declare-const separate_accounting_books Bool)
(declare-const shareholding_disclosed Bool)
(declare-const single_license Bool)
(declare-const spread_false_information Bool)
(declare-const stop_period_days Int)
(declare-const stop_period_expired Bool)
(declare-const stop_period_expiring Bool)
(declare-const stop_reported_and_approved Bool)
(declare-const transfer_documents_without_consent Bool)
(declare-const unauthorized_advertisement Bool)
(declare-const unauthorized_stop_resume_dissolve Bool)
(declare-const violate_business_management Bool)
(declare-const violate_financial_management Bool)
(declare-const violation_financial_or_business_management Bool)
(declare-const within_designated_scope Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_required] 保險代理人、經紀人、公證人須經主管機關許可並領有執業證照
(assert (= license_required
   (and permit_granted bond_deposited insurance_insured license_issued)))

; [insurance:insurance_insured] 保險代理人、公證人投保責任保險，經紀人投保責任保險及保證保險
(assert (= insurance_insured
   (or (and broker insurance_type_responsibility insurance_type_guarantee)
       (and notary insurance_type_responsibility)
       (and agent insurance_type_responsibility))))

; [insurance:single_license] 兼有代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license (>= 1 (+ (ite agent 1 0) (ite broker 1 0) (ite notary 1 0)))))

; [insurance:fixed_office_and_accounting] 保險代理人、經紀人、公證人應有固定業務處所並專設帳簿記載業務收支
(assert (= fixed_office_and_accounting (and fixed_office separate_accounting_books)))

; [insurance:internal_control_required] 公開發行或具一定規模之代理人公司、經紀人公司應建立內部控制、稽核及招攬處理制度與程序
(assert (= internal_control_required
   (or (not (or large_scale publicly_listed))
       (and internal_control_established
            audit_system_established
            handling_system_established))))

; [insurance:broker_duty_of_care] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care (and broker duty_of_care duty_of_loyalty)))

; [insurance:broker_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂保險契約前應主動提供書面分析報告並明確告知報酬標準
(assert (= broker_report_and_fee_disclosure
   (or (not (and broker within_designated_scope))
       (and written_analysis_report_provided fee_disclosure_provided))))

; [insurance:broker_company_stop_resume_dissolve] 經紀人公司停業、復業、解散應依規定申請並報主管機關核准及辦理登記
(assert (= broker_company_stop_resume_dissolve
   (or stop_reported_and_approved
       dissolve_reported_and_approved
       resume_reported_and_approved)))

; [insurance:broker_company_stop_period_limit] 經紀人公司停業期間以一年為限，正當理由得申請展延一次，並於屆滿前十五日提出
(assert (= broker_company_stop_period_limit
   (and (>= 365 stop_period_days)
        (or (not extension_requested) (>= 1 extension_count))
        (or (not stop_period_expiring)
            (<= 15 extension_request_days_before_expiry)))))

; [insurance:broker_company_license_revocation_for_no_resume] 經紀人公司停業屆滿未申請復業且未依規定任用經紀人者，廢止許可並註銷執業證照
(assert (= broker_company_license_revoked_for_no_resume
   (and stop_period_expired
        (not resume_applied)
        (not broker_appointed_as_required))))

; [insurance:broker_company_license_revocation_for_no_license_cancellation] 經紀人公司停業、解散或被註銷許可未辦理繳銷所任用經紀人執業證照者，應於三十日內委由公會辦理註銷登記
(assert (= broker_company_no_license_cancellation
   (and (or license_revoked company_stopped company_dissolved)
        (not broker_license_canceled)
        (>= 30 days_since_event))))

; [insurance:broker_company_report_stop_reinsurance_stop] 同時經營保險經紀及再保險經紀業務之公司停止其中一業務，應於一個月內報主管機關備查
(assert (let ((a!1 (or (not (and insurance_brokerage_stopped
                         (not reinsurance_brokerage_stopped)))
               (>= 30 days_since_stop))))
  (= broker_company_report_stop_reinsurance_stop a!1)))

; [insurance:accounting_and_reporting] 個人執業經紀人、經紀人公司及銀行應專設帳簿並於指定期間彙報主管機關
(assert (= accounting_and_reporting
   (and separate_accounting_books
        (or April_1 May_31 non_calendar_fiscal_year)
        annual_report_submitted)))

; [insurance:inspection_and_correction] 主管機關得隨時檢查並令限期報告，經紀人應確實辦理改善並持續追蹤覆查
(assert (= inspection_and_correction
   (and inspection_conducted correction_reported correction_followed_up)))

; [insurance:prohibited_behaviors] 個人執業經紀人、經紀人公司、銀行及受任用經紀人不得有違反規定之行為
(assert (not (= (or damage_insurance_image
            fail_to_confirm_suitability_for_elderly
            fail_to_report_to_trade_association
            false_or_incomplete_report
            criminal_conviction_for_fraud
            charge_illegal_fees
            coerce_or_induce_contract
            unauthorized_stop_resume_dissolve
            fail_to_appoint_broker_after_employment
            embezzle_insurance_funds
            induce_contract_termination_or_loan
            sell_unapproved_foreign_policies
            employ_unqualified_recruiters
            unauthorized_advertisement
            false_report_on_license_application
            hold_conflicting_positions
            fail_to_cancel_license_in_time
            fail_to_fill_recruitment_report
            other_violations
            pay_commission_to_non_actual_recruiters
            contract_with_unapproved_insurer
            spread_false_information
            permit_others_to_use_license
            induce_policy_surrender_or_loan
            misleading_promotion
            transfer_documents_without_consent
            authorize_others_to_operate
            illegal_insurance_payments
            operate_outside_license_scope
            conceal_important_contract_info)
        prohibited_behaviors)))

; [insurance:broker_duty_of_care_and_loyalty] 個人執業經紀人、經紀人公司及銀行執行業務時應盡善良管理人注意義務及忠實義務
(assert (= broker_duty_of_care_and_loyalty
   (and broker_or_agent_or_bank duty_of_care duty_of_loyalty)))

; [insurance:document_retention] 個人執業經紀人、經紀人公司及銀行應留存業務相關文件備查
(assert (= document_retention (and broker_or_agent_or_bank documents_retained)))

; [insurance:electronic_policy_contact_info] 招攬保險業務以電子保單出單者，應取得要保人及被保險人聯絡方式並提供保險人
(assert (= electronic_policy_contact_info
   (or (not electronic_policy_issued)
       (and applicant_phone
            insured_phone
            applicant_email
            insured_email
            contact_info_provided_to_insurer))))

; [insurance:internal_operation_regulation] 經紀人公司及銀行應訂定內部作業規範並落實執行，包含保障65歲以上高齡消費者權益規定
(assert (= internal_operation_regulation
   (and internal_operation_regulation_established
        internal_operation_regulation_implemented
        elderly_consumer_protection_included)))

; [insurance:broker_understanding_and_report] 經紀人洽訂保險契約前應充分了解要保人及被保險人基本資料、需求及風險屬性，並依規定提供書面分析報告
(assert (= broker_understanding_and_report
   (and broker
        basic_info_understood
        needs_and_risk_assessed
        written_analysis_report_provided)))

; [insurance:broker_shareholding_disclosure] 經紀人洽訂保險契約前應揭露與保險公司持股超過10%之資訊
(assert (= broker_shareholding_disclosure (or shareholding_disclosed (not broker))))

; [insurance:violation_financial_or_business_management] 違反財務或業務管理規定者應限期改正或處罰
(assert (= violation_financial_or_business_management
   (or violate_business_management violate_financial_management)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、繳存保證金、投保相關保險、執業證照、內部管理規定或有禁止行為時處罰
(assert (= penalty
   (or broker_company_license_revoked_for_no_resume
       broker_company_no_license_cancellation
       (not prohibited_behaviors)
       (not broker_company_stop_resume_dissolve)
       violation_financial_or_business_management
       (not license_required)
       (not internal_control_required))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= broker true))
(assert (= permit_granted true))
(assert (= bond_deposited true))
(assert (= license_issued true))
(assert (= insurance_type_responsibility true))
(assert (= insurance_type_guarantee true))
(assert (= insurance_insured true))
(assert (= company_stopped true))
(assert (= stop_period_expired true))
(assert (= resume_applied false))
(assert (= broker_appointed_as_required false))
(assert (= license_revoked true))
(assert (= broker_license_canceled false))
(assert (= days_since_event 7))
(assert (= stop_reported_and_approved false))
(assert (= resume_reported_and_approved false))
(assert (= dissolve_reported_and_approved false))
(assert (= extension_requested false))
(assert (= extension_count 0))
(assert (= stop_period_days 365))
(assert (= stop_period_expiring false))
(assert (= extension_request_days_before_expiry 0))
(assert (= annual_report_submitted false))
(assert (= separate_accounting_books true))
(assert (= fixed_office true))
(assert (= fixed_office_and_accounting true))
(assert (= internal_control_required false))
(assert (= internal_control_established false))
(assert (= audit_system_established false))
(assert (= handling_system_established false))
(assert (= inspection_conducted true))
(assert (= correction_reported false))
(assert (= correction_followed_up false))
(assert (= violate_financial_management true))
(assert (= violate_business_management true))
(assert (= violation_financial_or_business_management true))
(assert (= prohibited_behaviors false))
(assert (= broker_company_stop_resume_dissolve false))
(assert (= broker_company_license_revoked_for_no_resume true))
(assert (= broker_company_no_license_cancellation true))
(assert (= broker_duty_of_care true))
(assert (= duty_of_care true))
(assert (= duty_of_loyalty true))
(assert (= broker_duty_of_care_and_loyalty true))
(assert (= broker_report_and_fee_disclosure false))
(assert (= written_analysis_report_provided false))
(assert (= fee_disclosure_provided false))
(assert (= within_designated_scope true))
(assert (= basic_info_understood false))
(assert (= needs_and_risk_assessed false))
(assert (= broker_understanding_and_report false))
(assert (= shareholding_disclosed false))
(assert (= broker_shareholding_disclosure false))
(assert (= document_retention false))
(assert (= documents_retained false))
(assert (= internal_operation_regulation_established false))
(assert (= internal_operation_regulation_implemented false))
(assert (= elderly_consumer_protection_included false))
(assert (= internal_operation_regulation false))
(assert (= license_required true))
(assert (= single_license true))
(assert (= agent false))
(assert (= notary false))
(assert (= publicly_listed false))
(assert (= large_scale false))
(assert (= broker_or_agent_or_bank true))
(assert (= electronic_policy_issued false))
(assert (= applicant_phone true))
(assert (= insured_phone true))
(assert (= applicant_email true))
(assert (= insured_email true))
(assert (= contact_info_provided_to_insurer true))
(assert (= electronic_policy_contact_info true))
(assert (= false_report_on_license_application false))
(assert (= contract_with_unapproved_insurer false))
(assert (= conceal_important_contract_info false))
(assert (= coerce_or_induce_contract false))
(assert (= misleading_promotion false))
(assert (= induce_policy_surrender_or_loan false))
(assert (= embezzle_insurance_funds false))
(assert (= permit_others_to_use_license false))
(assert (= criminal_conviction_for_fraud false))
(assert (= operate_outside_license_scope false))
(assert (= charge_illegal_fees false))
(assert (= illegal_insurance_payments false))
(assert (= spread_false_information false))
(assert (= authorize_others_to_operate false))
(assert (= transfer_documents_without_consent false))
(assert (= employ_unqualified_recruiters false))
(assert (= fail_to_cancel_license_in_time true))
(assert (= unauthorized_stop_resume_dissolve false))
(assert (= fail_to_appoint_broker_after_employment true))
(assert (= fail_to_report_to_trade_association true))
(assert (= unauthorized_advertisement false))
(assert (= pay_commission_to_non_actual_recruiters false))
(assert (= fail_to_confirm_suitability_for_elderly false))
(assert (= sell_unapproved_foreign_policies false))
(assert (= false_or_incomplete_report true))
(assert (= hold_conflicting_positions false))
(assert (= induce_contract_termination_or_loan false))
(assert (= fail_to_fill_recruitment_report false))
(assert (= other_violations false))
(assert (= damage_insurance_image false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 24
; Total variables: 116
; Total facts: 104
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
