; SMT2 file generated from compliance case automatic
; Case ID: case_86
; Generated at: 2025-10-21T01:13:44.755978
;
; This file can be executed with Z3:
;   z3 case_86.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_or_notary Bool)
(declare-const annual_report_submitted Bool)
(declare-const applicant_contact_info_obtained Bool)
(declare-const authority_inspect_and_request_report Bool)
(declare-const authorize_others_to_operate_or_execute Bool)
(declare-const bank_as_agent Bool)
(declare-const bank_as_broker Bool)
(declare-const bank_permission_and_separate_application Bool)
(declare-const bank_permitted Bool)
(declare-const basic_info_understood Bool)
(declare-const broker Bool)
(declare-const broker_cancel_certificate_within_30_days Bool)
(declare-const broker_certificate_cancelled_within_30_days Bool)
(declare-const broker_certificates_cancelled Bool)
(declare-const broker_company_and_bank_internal_procedures_compliance Bool)
(declare-const broker_company_and_bank_report_improvement_to_board_and_audit Bool)
(declare-const broker_company_cancel_certificates_on_stop_or_dissolve Bool)
(declare-const broker_company_reappoint_broker_after_resume Bool)
(declare-const broker_company_report_stop_reinsurance_stop_within_1_month Bool)
(declare-const broker_company_report_stop_resume_dissolve Bool)
(declare-const broker_company_shareholding_percent Real)
(declare-const broker_company_stop_period_limit_and_extension Bool)
(declare-const broker_disclose_shareholding_info_before_contract Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_duty_of_care_and_fidelity_in_business Bool)
(declare-const broker_fidelity_duty Bool)
(declare-const broker_obtain_and_provide_contact_info_for_e_policy Bool)
(declare-const broker_reappointed Bool)
(declare-const broker_understand_and_provide_written_report_before_contract Bool)
(declare-const broker_written_report_and_fee_disclosure Bool)
(declare-const charge_unapproved_fees_or_commissions Bool)
(declare-const coerce_or_induce_contract Bool)
(declare-const company_certificate_cancelled Bool)
(declare-const company_dissolved Bool)
(declare-const company_license_revoked Bool)
(declare-const company_stopped Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const criminal_conviction_for_fraud_or_forgery Bool)
(declare-const deficiencies_improved Bool)
(declare-const dissolve_applied Bool)
(declare-const dissolve_reported_and_approved Bool)
(declare-const documents_retained Bool)
(declare-const documents_signed_or_electronically_confirmed Bool)
(declare-const duty_of_care_exercised Bool)
(declare-const duty_of_fidelity_exercised Bool)
(declare-const employ_unqualified_insurance_solicitor Bool)
(declare-const extension_request_days_before_expiry Int)
(declare-const extension_requested Bool)
(declare-const extension_times Int)
(declare-const fail_to_cancel_license_within_deadlines Bool)
(declare-const fail_to_confirm_consumer_suitability Bool)
(declare-const fail_to_fill_solicitation_report_truthfully Bool)
(declare-const fail_to_reappoint_broker_after_resignation Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_declaration_on_license_application Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosed_clearly Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const has_practice_certificate Bool)
(declare-const hold_positions_in_insurance_or_association Bool)
(declare-const illegal_insurance_payments Bool)
(declare-const improper_inducement_to_cancel_or_transfer Bool)
(declare-const improve_and_report_on_deficiencies Bool)
(declare-const improvement_report_submitted Bool)
(declare-const improvement_report_to_audit_committee_submitted Bool)
(declare-const improvement_report_to_board_submitted Bool)
(declare-const induce_contract_termination_or_loan_payment Bool)
(declare-const inspection_conducted Bool)
(declare-const insurance_brokerage_stopped Bool)
(declare-const insurance_company_shareholding_percent Real)
(declare-const insurance_issues_e_policy Bool)
(declare-const insured_contact_info_obtained Bool)
(declare-const insured_interest_protected Bool)
(declare-const internal_management_rule_compliance Bool)
(declare-const internal_procedures_established Bool)
(declare-const internal_procedures_executed Bool)
(declare-const keep_separate_books_and_annual_report Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_revoked Bool)
(declare-const licensed Bool)
(declare-const main_content_and_rights_explained Bool)
(declare-const management_rules_complied Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const misappropriate_insurance_funds Bool)
(declare-const misleading_promotion_or_recruitment Bool)
(declare-const needs_and_risk_understood Bool)
(declare-const needs_understood Bool)
(declare-const operate_both_insurance_and_reinsurance Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_solicitor Bool)
(declare-const penalty Bool)
(declare-const permit_others_to_use_license Bool)
(declare-const prohibited_behaviors Bool)
(declare-const reinsurance_brokerage_stopped Bool)
(declare-const relevant_insurance_subscribed Bool)
(declare-const relevant_insurance_type_compliance Bool)
(declare-const report_requested_within_deadline Bool)
(declare-const reported_to_authority_within_1_month Bool)
(declare-const resume_reported_and_approved Bool)
(declare-const sell_unapproved_foreign_policy_discount_certificates Bool)
(declare-const senior_consumer_protection_included Bool)
(declare-const separate_books_kept Bool)
(declare-const shareholding_info_disclosed Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const stop_applied Bool)
(declare-const stop_period_days Int)
(declare-const stop_period_expired Bool)
(declare-const stop_reported_and_approved Bool)
(declare-const submit_false_or_incomplete_business_or_financial_reports Bool)
(declare-const subscribed_guarantee_insurance Bool)
(declare-const subscribed_liability_insurance Bool)
(declare-const suitability_confirmed Bool)
(declare-const transfer_documents_to_unassigned_broker_or_agent Bool)
(declare-const unauthorized_stop_resume_dissolve Bool)
(declare-const understand_needs_and_suitability_and_sign_documents Bool)
(declare-const use_unapproved_advertisement_content Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_related_regulations Bool)
(declare-const violation_financial_or_business_management_rules Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and licensed
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_subscribed
        has_practice_certificate)))

; [insurance:relevant_insurance_type_compliance] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= relevant_insurance_type_compliance
   (or (and agent_or_notary subscribed_liability_insurance)
       (and broker
            subscribed_liability_insurance
            subscribed_guarantee_insurance))))

; [insurance:internal_management_rule_compliance] 遵守主管機關定之管理規則，包括資格取得、申請許可條件、程序、文件、董事監察人資格、解任事由、分支機構條件、財務與業務管理、教育訓練、廢止許可及其他應遵行事項
(assert (= internal_management_rule_compliance management_rules_complied))

; [insurance:bank_permission_and_separate_application] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_separate_application
   (or bank_as_agent bank_as_broker (not bank_permitted))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_duty_of_care broker_fidelity_duty)))

; [insurance:broker_must_provide_written_report_and_disclose_fee] 保險經紀人洽訂保險契約前，於主管機關指定範圍內，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_written_report_and_fee_disclosure
   (and written_analysis_report_provided
        (or (not fee_charged) fee_disclosed_clearly))))

; [insurance:violation_financial_or_business_management_rules] 違反管理規則中財務或業務管理規定或相關規定者，應限期改正或處罰
(assert (= violation_financial_or_business_management_rules
   (or violate_related_regulations
       violate_business_management_rules
       violate_financial_management_rules)))

; [insurance:broker_company_must_report_stop_resume_dissolve] 經紀人公司停業、復業、解散應報主管機關核准並辦理登記
(assert (= broker_company_report_stop_resume_dissolve
   (or dissolve_reported_and_approved
       stop_reported_and_approved
       resume_reported_and_approved)))

; [insurance:broker_company_stop_period_limit_and_extension] 經紀人公司停業期間以一年為限，正當理由得申請一次展延，並應於屆滿前十五日提出
(assert (let ((a!1 (and (>= 365 stop_period_days)
                (or (not extension_requested)
                    (and (>= 1 extension_times)
                         (<= 15 extension_request_days_before_expiry))))))
  (= broker_company_stop_period_limit_and_extension a!1)))

; [insurance:broker_company_must_reappoint_broker_after_resume] 經紀人公司停業屆滿未申請復業並依規定任用經紀人者，主管機關廢止許可並註銷執業證照
(assert (let ((a!1 (or license_revoked
               (not (and stop_period_expired (not broker_reappointed))))))
  (= broker_company_reappoint_broker_after_resume a!1)))

; [insurance:broker_company_must_cancel_certificates_on_stop_or_dissolve] 經紀人公司申請停業應繳銷所任用經紀人執業證照，申請解散應繳銷經紀人及公司執業證照
(assert (= broker_company_cancel_certificates_on_stop_or_dissolve
   (and (or broker_certificates_cancelled (not stop_applied))
        (or (not dissolve_applied)
            (and broker_certificates_cancelled company_certificate_cancelled)))))

; [insurance:broker_must_cancel_certificate_within_30_days_after_company_stop_dissolve_or_revocation] 經紀人公司停業、解散或主管機關註銷公司執業證照，未辦理繳銷經紀人執業證照者，經紀人應於三十日內委由公會辦理註銷登記
(assert (= broker_cancel_certificate_within_30_days
   (or (not (or company_license_revoked company_stopped company_dissolved))
       broker_certificate_cancelled_within_30_days)))

; [insurance:broker_company_must_report_stop_reinsurance_stop_within_1_month] 同時經營保險經紀及再保險經紀業務之經紀人公司停止其中一業務，應於一個月內報主管機關備查
(assert (let ((a!1 (or (not (and operate_both_insurance_and_reinsurance
                         (or insurance_brokerage_stopped
                             reinsurance_brokerage_stopped)))
               reported_to_authority_within_1_month)))
  (= broker_company_report_stop_reinsurance_stop_within_1_month a!1)))

; [insurance:must_keep_separate_books_and_annual_report] 個人執業經紀人、經紀人公司及銀行應專設帳簿，並於每年4/1至5/31彙報主管機關或指定機構
(assert (= keep_separate_books_and_annual_report
   (and separate_books_kept annual_report_submitted)))

; [insurance:authority_may_inspect_and_request_report] 主管機關得隨時派員檢查或令限期內報告營業狀況
(assert (= authority_inspect_and_request_report
   (or inspection_conducted report_requested_within_deadline)))

; [insurance:must_improve_and_report_on_deficiencies] 對主管機關檢查意見或缺失事項應確實改善並於期限內函送主管機關
(assert (= improve_and_report_on_deficiencies
   (and deficiencies_improved improvement_report_submitted)))

; [insurance:broker_company_and_bank_must_report_improvement_to_board_and_audit_committee] 經紀人公司及銀行應將改善辦理情形書面提報董事會及交付監察人或審計委員會查閱
(assert (= broker_company_and_bank_report_improvement_to_board_and_audit
   (and improvement_report_to_board_submitted
        improvement_report_to_audit_committee_submitted)))

; [insurance:prohibited_behaviors] 個人執業經紀人、經紀人公司、銀行及受任用經紀人不得有違反規定之行為
(assert (not (= (or induce_contract_termination_or_loan_payment
            conceal_important_contract_info
            permit_others_to_use_license
            operate_outside_license_scope
            authorize_others_to_operate_or_execute
            hold_positions_in_insurance_or_association
            criminal_conviction_for_fraud_or_forgery
            contract_with_unapproved_insurer
            submit_false_or_incomplete_business_or_financial_reports
            improper_inducement_to_cancel_or_transfer
            employ_unqualified_insurance_solicitor
            fail_to_fill_solicitation_report_truthfully
            unauthorized_stop_resume_dissolve
            illegal_insurance_payments
            pay_commission_to_non_actual_solicitor
            misappropriate_insurance_funds
            fail_to_cancel_license_within_deadlines
            other_violations_of_rules_or_laws
            transfer_documents_to_unassigned_broker_or_agent
            fail_to_report_to_broker_association
            fail_to_confirm_consumer_suitability
            false_declaration_on_license_application
            use_unapproved_advertisement_content
            fail_to_reappoint_broker_after_resignation
            misleading_promotion_or_recruitment
            spread_false_information_disturb_financial_order
            coerce_or_induce_contract
            sell_unapproved_foreign_policy_discount_certificates
            charge_unapproved_fees_or_commissions
            other_behaviors_damaging_insurance_image)
        prohibited_behaviors)))

; [insurance:broker_must_duty_of_care_and_fidelity_in_business] 個人執業經紀人、經紀人公司及銀行執行或經營業務時應盡善良管理人注意及忠實義務，維護被保險人利益，充分說明及揭露資訊
(assert (= broker_duty_of_care_and_fidelity_in_business
   (and duty_of_care_exercised
        duty_of_fidelity_exercised
        insured_interest_protected
        main_content_and_rights_explained
        documents_retained)))

; [insurance:broker_must_obtain_and_provide_contact_info_for_e_policy] 保險人以電子保單出單時，應取得要保人及被保險人聯絡方式並提供予保險人
(assert (= broker_obtain_and_provide_contact_info_for_e_policy
   (or (not insurance_issues_e_policy)
       (and applicant_contact_info_obtained
            insured_contact_info_obtained
            contact_info_provided_to_insurer))))

; [insurance:broker_company_and_bank_must_establish_and_execute_internal_procedures] 經紀人公司及銀行應依法令及主管機關規定訂定內部作業規範並落實執行，包含保障65歲以上高齡消費者投保權益規定
(assert (= broker_company_and_bank_internal_procedures_compliance
   (and internal_procedures_established
        internal_procedures_executed
        senior_consumer_protection_included)))

; [insurance:broker_must_understand_and_provide_written_report_before_contract] 經紀人洽訂保險契約前應充分了解要保人及被保險人基本資料、需求及風險屬性，並依主管機關規定主動提供書面分析報告
(assert (= broker_understand_and_provide_written_report_before_contract
   (and basic_info_understood
        needs_and_risk_understood
        written_analysis_report_provided)))

; [insurance:broker_must_disclose_shareholding_info_before_contract] 經紀人公司或銀行持有單一保險公司表決權股份超過10%或反之，經紀人洽訂保險契約前應揭露該資訊
(assert (let ((a!1 (not (or (not (<= broker_company_shareholding_percent 10.0))
                    (not (<= insurance_company_shareholding_percent 10.0))))))
  (= broker_disclose_shareholding_info_before_contract
     (or shareholding_info_disclosed a!1))))

; [insurance:must_understand_needs_and_suitability_and_sign_documents] 個人執業經紀人、經紀人公司及銀行應確實瞭解要保人需求及商品適合度，並於文件簽章或電子方式確認
(assert (= understand_needs_and_suitability_and_sign_documents
   (and needs_understood
        suitability_confirmed
        documents_signed_or_electronically_confirmed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險投保、執業證照、管理規則、停業復業規定、帳簿報告義務、禁止行為等任一規定時處罰
(assert (= penalty
   (or (not broker_company_report_stop_reinsurance_stop_within_1_month)
       (not license_and_guarantee_compliance)
       (not broker_company_and_bank_internal_procedures_compliance)
       (not internal_management_rule_compliance)
       (not keep_separate_books_and_annual_report)
       (not broker_written_report_and_fee_disclosure)
       (not broker_obtain_and_provide_contact_info_for_e_policy)
       (not understand_needs_and_suitability_and_sign_documents)
       (not broker_company_report_stop_resume_dissolve)
       (not prohibited_behaviors)
       (not broker_cancel_certificate_within_30_days)
       (not authority_inspect_and_request_report)
       (not improve_and_report_on_deficiencies)
       (not bank_permission_and_separate_application)
       (not broker_company_stop_period_limit_and_extension)
       (not broker_company_and_bank_report_improvement_to_board_and_audit)
       (not broker_understand_and_provide_written_report_before_contract)
       (not broker_disclose_shareholding_info_before_contract)
       (not broker_company_reappoint_broker_after_resume)
       (not broker_company_cancel_certificates_on_stop_or_dissolve)
       (not broker_duty_of_care_and_fidelity_in_business)
       (not relevant_insurance_type_compliance)
       (not broker_duty_of_care_and_fidelity))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= licensed true))
(assert (= broker true))
(assert (= annual_report_submitted false))
(assert (= submit_false_or_incomplete_business_or_financial_reports true))
(assert (= stop_applied false))
(assert (= company_stopped true))
(assert (= stop_period_days 180))
(assert (= stop_reported_and_approved false))
(assert (= unauthorized_stop_resume_dissolve true))
(assert (= license_revoked true))
(assert (= broker_certificates_cancelled false))
(assert (= company_license_revoked true))
(assert (= broker_cancel_certificate_within_30_days false))
(assert (= broker_certificate_cancelled_within_30_days false))
(assert (= management_rules_complied false))
(assert (= internal_management_rule_compliance false))
(assert (= violate_financial_management_rules true))
(assert (= violate_business_management_rules true))
(assert (= violate_related_regulations true))
(assert (= violation_financial_or_business_management_rules true))
(assert (= license_and_guarantee_compliance false))
(assert (= relevant_insurance_subscribed false))
(assert (= relevant_insurance_type_compliance false))
(assert (= broker_duty_of_care false))
(assert (= broker_fidelity_duty false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_written_report_and_fee_disclosure false))
(assert (= broker_company_report_stop_resume_dissolve false))
(assert (= broker_company_stop_period_limit_and_extension false))
(assert (= broker_company_reappoint_broker_after_resume true))
(assert (= broker_company_cancel_certificates_on_stop_or_dissolve false))
(assert (= broker_company_report_stop_reinsurance_stop_within_1_month true))
(assert (= keep_separate_books_and_annual_report false))
(assert (= authority_inspect_and_request_report false))
(assert (= improve_and_report_on_deficiencies false))
(assert (= broker_company_and_bank_report_improvement_to_board_and_audit false))
(assert (= prohibited_behaviors false))
(assert (= broker_duty_of_care_and_fidelity_in_business false))
(assert (= broker_obtain_and_provide_contact_info_for_e_policy false))
(assert (= broker_company_and_bank_internal_procedures_compliance false))
(assert (= broker_understand_and_provide_written_report_before_contract false))
(assert (= broker_disclose_shareholding_info_before_contract false))
(assert (= understand_needs_and_suitability_and_sign_documents false))
(assert (= fee_charged false))
(assert (= fee_disclosed_clearly false))
(assert (= false_declaration_on_license_application false))
(assert (= contract_with_unapproved_insurer false))
(assert (= conceal_important_contract_info false))
(assert (= coerce_or_induce_contract false))
(assert (= misleading_promotion_or_recruitment false))
(assert (= improper_inducement_to_cancel_or_transfer false))
(assert (= misappropriate_insurance_funds false))
(assert (= permit_others_to_use_license false))
(assert (= criminal_conviction_for_fraud_or_forgery false))
(assert (= operate_outside_license_scope false))
(assert (= charge_unapproved_fees_or_commissions false))
(assert (= illegal_insurance_payments false))
(assert (= spread_false_information_disturb_financial_order false))
(assert (= authorize_others_to_operate_or_execute false))
(assert (= transfer_documents_to_unassigned_broker_or_agent false))
(assert (= employ_unqualified_insurance_solicitor false))
(assert (= fail_to_cancel_license_within_deadlines false))
(assert (= fail_to_reappoint_broker_after_resignation false))
(assert (= fail_to_report_to_broker_association false))
(assert (= use_unapproved_advertisement_content false))
(assert (= pay_commission_to_non_actual_solicitor false))
(assert (= fail_to_confirm_consumer_suitability false))
(assert (= sell_unapproved_foreign_policy_discount_certificates false))
(assert (= hold_positions_in_insurance_or_association false))
(assert (= induce_contract_termination_or_loan_payment false))
(assert (= fail_to_fill_solicitation_report_truthfully false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= other_behaviors_damaging_insurance_image false))
(assert (= broker_reappointed false))
(assert (= stop_period_expired true))
(assert (= extension_requested false))
(assert (= extension_times 0))
(assert (= extension_request_days_before_expiry 0))
(assert (= agent_or_notary false))
(assert (= bank_permitted false))
(assert (= bank_as_agent false))
(assert (= bank_as_broker false))
(assert (= broker_company_shareholding_percent 0.0))
(assert (= insurance_company_shareholding_percent 0.0))
(assert (= insurance_issues_e_policy false))
(assert (= applicant_contact_info_obtained false))
(assert (= insured_contact_info_obtained false))
(assert (= contact_info_provided_to_insurer false))
(assert (= basic_info_understood false))
(assert (= needs_and_risk_understood false))
(assert (= written_analysis_report_provided false))
(assert (= needs_understood false))
(assert (= suitability_confirmed false))
(assert (= documents_signed_or_electronically_confirmed false))
(assert (= documents_retained false))
(assert (= duty_of_care_exercised false))
(assert (= duty_of_fidelity_exercised false))
(assert (= insured_interest_protected false))
(assert (= main_content_and_rights_explained false))
(assert (= improvement_report_submitted false))
(assert (= improvement_report_to_board_submitted false))
(assert (= improvement_report_to_audit_committee_submitted false))
(assert (= inspection_conducted false))
(assert (= report_requested_within_deadline false))
(assert (= operate_both_insurance_and_reinsurance false))
(assert (= insurance_brokerage_stopped false))
(assert (= reinsurance_brokerage_stopped false))
(assert (= reported_to_authority_within_1_month false))
(assert (= resume_reported_and_approved false))
(assert (= dissolve_applied false))
(assert (= dissolve_reported_and_approved false))
(assert (= company_dissolved false))
(assert (= company_certificate_cancelled false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 26
; Total variables: 126
; Total facts: 113
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
