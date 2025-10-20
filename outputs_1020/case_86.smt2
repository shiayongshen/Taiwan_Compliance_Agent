; SMT2 file generated from compliance case automatic
; Case ID: case_86
; Generated at: 2025-10-19T07:36:37.843401
;
; This file can be executed with Z3:
;   z3 case_86.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_and_reporting_compliance Bool)
(declare-const agent_or_notary Bool)
(declare-const annual_financial_reports_submitted Bool)
(declare-const application_form_included Bool)
(declare-const application_submitted Bool)
(declare-const approval_obtained Bool)
(declare-const authority_inspection_and_reporting_compliance Bool)
(declare-const authorize_others_to_operate Bool)
(declare-const board_or_shareholders_resolution_attached Bool)
(declare-const broker Bool)
(declare-const broker_appointed_according_to_rule7 Bool)
(declare-const broker_company_cancel_broker_license_on_license_revocation Bool)
(declare-const broker_company_cancel_broker_license_on_stop_or_dissolve Bool)
(declare-const broker_company_or_bank_shareholding_disclosure Bool)
(declare-const broker_company_revoke_license_if_no_resume_and_no_broker Bool)
(declare-const broker_company_shareholding_in_insurer_percent Real)
(declare-const broker_company_stop_period_limit_and_extension Bool)
(declare-const broker_company_stop_reinsurance_stop_reporting Bool)
(declare-const broker_company_stop_resume_dissolve_reporting Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_duty_of_care_and_fidelity_executed Bool)
(declare-const broker_fidelity_duty Bool)
(declare-const broker_license_cancelled Bool)
(declare-const broker_registration_cancelled_by_association_within_30_days Bool)
(declare-const broker_understanding_and_report_before_contract Bool)
(declare-const broker_written_report_and_fee_disclosure Bool)
(declare-const charge_illegal_fees_or_commissions Bool)
(declare-const coerce_or_induce_contract Bool)
(declare-const company_dissolve_applied Bool)
(declare-const company_license_revoked Bool)
(declare-const company_stop_applied Bool)
(declare-const compliance_with_laws_and_protection_of_elderly Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const contract_change_application_included Bool)
(declare-const contract_termination_application_included Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const criminal_conviction_for_fraud_or_forgery Bool)
(declare-const customer_needs_understood Bool)
(declare-const damage_insurance_image Bool)
(declare-const document_retention_compliance Bool)
(declare-const document_signed_or_electronically_confirmed Bool)
(declare-const documents_retained Bool)
(declare-const duty_of_care_executed Bool)
(declare-const electronic_policy_contact_info_provided Bool)
(declare-const employ_unqualified_personnel Bool)
(declare-const endorsement_application_included Bool)
(declare-const extension_approved Bool)
(declare-const extension_request_days_before_expiry Int)
(declare-const extension_requested Bool)
(declare-const fail_to_appoint_broker_after_employee_leaves Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_consumer_suitability Bool)
(declare-const fail_to_fill_out_recruitment_report_truthfully Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_report_on_license_application Bool)
(declare-const fee_charged Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const fidelity_duty_executed Bool)
(declare-const follow_up_and_reporting_done Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance_covered Bool)
(declare-const guarantee_minimum_amount Real)
(declare-const hold_conflicting_positions Bool)
(declare-const illegal_insurance_payments Bool)
(declare-const improvement_measures_implemented Bool)
(declare-const induce_contract_termination_or_loan_payment Bool)
(declare-const induce_policy_surrender_or_loan Bool)
(declare-const inspection_cooperation Bool)
(declare-const insurance_brokerage_stopped Bool)
(declare-const insurance_fee_receipt_included Bool)
(declare-const insured_basic_info_understood Bool)
(declare-const insured_contact_info_obtained Bool)
(declare-const insurer_shareholding_in_broker_company_or_bank_percent Real)
(declare-const internal_operation_compliance Bool)
(declare-const internal_operation_rules_established Bool)
(declare-const internal_operation_rules_executed Bool)
(declare-const liability_insurance_covered Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_issued Bool)
(declare-const license_permitted Bool)
(declare-const license_revoked Bool)
(declare-const misappropriate_insurance_funds Bool)
(declare-const misleading_promotion_or_recruitment Bool)
(declare-const needs_and_suitability_report_included Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_specified_documents_included Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_broker Bool)
(declare-const penalty Bool)
(declare-const permit_others_to_use_license Bool)
(declare-const policy_issued_electronically Bool)
(declare-const product_suitability_confirmed Bool)
(declare-const prohibited_behaviors Bool)
(declare-const registration_completed Bool)
(declare-const reinsurance_brokerage_stopped Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const report_to_authority_within_1_month Bool)
(declare-const reporting_date Int)
(declare-const reporting_end_date Int)
(declare-const reporting_start_date Int)
(declare-const required_documents_for_life_insurance Bool)
(declare-const required_documents_for_property_insurance Bool)
(declare-const resume_application_submitted Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const shareholding_info_disclosed Bool)
(declare-const special_account_books_maintained Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const stop_period_expired Bool)
(declare-const stop_period_months Int)
(declare-const submit_false_or_incomplete_reports Bool)
(declare-const transfer_application_documents_to_unauthorized_person Bool)
(declare-const unauthorized_advertisement_content Bool)
(declare-const unauthorized_stop_resume_dissolve Bool)
(declare-const understand_customer_needs_and_suitability Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        relevant_insurance_covered
        license_issued)))

; [insurance:relevant_insurance_covered] 相關保險依身份分類投保
(assert (= relevant_insurance_covered
   (or (and agent_or_notary liability_insurance_covered)
       (and broker liability_insurance_covered guarantee_insurance_covered))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_duty_of_care broker_fidelity_duty)))

; [insurance:broker_written_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_written_report_and_fee_disclosure
   (and written_analysis_report_provided
        (or fee_standard_disclosed (not fee_charged)))))

; [insurance:broker_company_stop_resume_dissolve_reporting] 經紀人公司停業、復業、解散應依規定申請核准並辦理登記
(assert (= broker_company_stop_resume_dissolve_reporting
   (and application_submitted
        board_or_shareholders_resolution_attached
        approval_obtained
        registration_completed)))

; [insurance:broker_company_stop_period_limit_and_extension] 經紀人公司停業期間以一年為限，得申請一次展延，應於屆滿前十五日提出
(assert (= broker_company_stop_period_limit_and_extension
   (and (>= 12 stop_period_months)
        (or extension_approved (not extension_requested))
        (or (not extension_requested)
            (>= 15 extension_request_days_before_expiry)))))

; [insurance:broker_company_revoke_license_if_no_resume_and_no_broker] 經紀人公司停業屆滿未申請復業且未依規定任用經紀人者，廢止許可並註銷執業證照
(assert (let ((a!1 (or (not (and stop_period_expired
                         (not resume_application_submitted)
                         (not broker_appointed_according_to_rule7)))
               license_revoked)))
  (= broker_company_revoke_license_if_no_resume_and_no_broker a!1)))

; [insurance:broker_company_cancel_broker_license_on_stop_or_dissolve] 經紀人公司停業或解散應繳銷所任用經紀人執業證照
(assert (= broker_company_cancel_broker_license_on_stop_or_dissolve
   (or (not (or company_stop_applied company_dissolve_applied))
       broker_license_cancelled)))

; [insurance:broker_company_cancel_broker_license_on_license_revocation] 經主管機關註銷經紀人公司執業證照，未辦理繳銷所任用經紀人執業證照者，應於三十日內委由經紀人公會辦理註銷登記
(assert (let ((a!1 (or broker_registration_cancelled_by_association_within_30_days
               (not (and company_license_revoked (not broker_license_cancelled))))))
  (= broker_company_cancel_broker_license_on_license_revocation a!1)))

; [insurance:broker_company_stop_reinsurance_stop_reporting] 同時經營保險經紀及再保險經紀業務之經紀人公司停止其中一業務，應於一個月內報主管機關備查
(assert (= broker_company_stop_reinsurance_stop_reporting
   (or report_to_authority_within_1_month
       (not (or insurance_brokerage_stopped reinsurance_brokerage_stopped)))))

; [insurance:accounting_and_reporting_compliance] 個人執業經紀人、經紀人公司及銀行應專設帳簿並於指定期間彙報主管機關
(assert (= accounting_and_reporting_compliance
   (and special_account_books_maintained
        (>= reporting_date reporting_start_date)
        (<= reporting_date reporting_end_date)
        annual_financial_reports_submitted)))

; [insurance:authority_inspection_and_reporting_compliance] 主管機關得隨時檢查並令限期報告，經紀人應確實辦理改善並持續追蹤覆查
(assert (= authority_inspection_and_reporting_compliance
   (and inspection_cooperation
        improvement_measures_implemented
        follow_up_and_reporting_done)))

; [insurance:prohibited_behaviors] 個人執業經紀人、經紀人公司、銀行及受任用經紀人不得有違規行為
(assert (not (= (or criminal_conviction_for_fraud_or_forgery
            hold_conflicting_positions
            fail_to_report_to_broker_association
            other_violations_of_rules_or_laws
            spread_false_information_disturb_financial_order
            damage_insurance_image
            misleading_promotion_or_recruitment
            sell_unapproved_foreign_policy_discount_products
            induce_contract_termination_or_loan_payment
            operate_outside_license_scope
            fail_to_cancel_license_within_deadline
            misappropriate_insurance_funds
            authorize_others_to_operate
            contract_with_unapproved_insurer
            fail_to_appoint_broker_after_employee_leaves
            pay_commission_to_non_actual_broker
            fail_to_fill_out_recruitment_report_truthfully
            illegal_insurance_payments
            unauthorized_advertisement_content
            submit_false_or_incomplete_reports
            employ_unqualified_personnel
            permit_others_to_use_license
            charge_illegal_fees_or_commissions
            unauthorized_stop_resume_dissolve
            conceal_important_contract_info
            induce_policy_surrender_or_loan
            false_report_on_license_application
            transfer_application_documents_to_unauthorized_person
            fail_to_confirm_consumer_suitability
            coerce_or_induce_contract)
        prohibited_behaviors)))

; [insurance:broker_duty_of_care_and_fidelity_executed] 個人執業經紀人、經紀人公司及銀行執行善良管理人注意義務及忠實義務
(assert (= broker_duty_of_care_and_fidelity_executed
   (and duty_of_care_executed fidelity_duty_executed)))

; [insurance:document_retention_compliance] 個人執業經紀人、經紀人公司及銀行應留存相關文件備查
(assert (= document_retention_compliance documents_retained))

; [insurance:electronic_policy_contact_info_provided] 保險人以電子保單出單時，應取得要保人及被保險人聯絡方式並提供保險人
(assert (= electronic_policy_contact_info_provided
   (and policy_issued_electronically
        insured_contact_info_obtained
        contact_info_provided_to_insurer)))

; [insurance:internal_operation_compliance] 經紀人公司及銀行應訂定並落實內部作業規範，確保遵循相關法令及保障高齡消費者權益
(assert (= internal_operation_compliance
   (and internal_operation_rules_established
        internal_operation_rules_executed
        compliance_with_laws_and_protection_of_elderly)))

; [insurance:broker_understanding_and_report_before_contract] 經紀人洽訂保險契約前應充分了解要保人及被保險人資料並依規定提供書面分析報告及報酬告知
(assert (= broker_understanding_and_report_before_contract
   (and insured_basic_info_understood
        written_analysis_report_provided
        (or fee_standard_disclosed (not fee_charged)))))

; [insurance:broker_company_or_bank_shareholding_disclosure] 經紀人公司或銀行持有保險公司超過10%表決權股份，洽訂契約前應揭露該資訊
(assert (let ((a!1 (not (or (not (<= broker_company_shareholding_in_insurer_percent
                             10.0))
                    (not (<= insurer_shareholding_in_broker_company_or_bank_percent
                             10.0))))))
  (= broker_company_or_bank_shareholding_disclosure
     (or shareholding_info_disclosed a!1))))

; [insurance:understand_customer_needs_and_suitability] 個人執業經紀人、經紀人公司及銀行應確實瞭解要保人需求及商品適合度並完成簽章或電子確認
(assert (= understand_customer_needs_and_suitability
   (and customer_needs_understood
        product_suitability_confirmed
        document_signed_or_electronically_confirmed)))

; [insurance:required_documents_for_property_insurance] 財產保險相關文件應包括指定文件
(assert (= required_documents_for_property_insurance
   (and application_form_included
        endorsement_application_included
        insurance_fee_receipt_included
        needs_and_suitability_report_included
        contract_termination_application_included
        other_specified_documents_included)))

; [insurance:required_documents_for_life_insurance] 人身保險相關文件應包括指定文件
(assert (= required_documents_for_life_insurance
   (and application_form_included
        contract_change_application_included
        insurance_fee_receipt_included
        needs_and_suitability_report_included
        contract_termination_application_included
        other_specified_documents_included)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法及保險經紀人管理規則相關規定時處罰
(assert (= penalty
   (or (not internal_operation_compliance)
       (not relevant_insurance_covered)
       (not broker_duty_of_care_and_fidelity_executed)
       (not accounting_and_reporting_compliance)
       (not broker_company_cancel_broker_license_on_stop_or_dissolve)
       (not authority_inspection_and_reporting_compliance)
       (not electronic_policy_contact_info_provided)
       (not required_documents_for_property_insurance)
       (not understand_customer_needs_and_suitability)
       (not prohibited_behaviors)
       (not broker_duty_of_care_and_fidelity)
       (not broker_company_revoke_license_if_no_resume_and_no_broker)
       (not broker_company_cancel_broker_license_on_license_revocation)
       (not broker_company_stop_period_limit_and_extension)
       (not broker_company_stop_reinsurance_stop_reporting)
       (not broker_company_stop_resume_dissolve_reporting)
       (not broker_company_or_bank_shareholding_disclosure)
       (not required_documents_for_life_insurance)
       (not broker_written_report_and_fee_disclosure)
       (not broker_understanding_and_report_before_contract)
       (not license_and_guarantee_compliance)
       (not document_retention_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= license_issued false))
(assert (= company_license_revoked true))
(assert (= application_submitted false))
(assert (= board_or_shareholders_resolution_attached false))
(assert (= approval_obtained false))
(assert (= registration_completed false))
(assert (= stop_period_expired true))
(assert (= resume_application_submitted false))
(assert (= broker_appointed_according_to_rule7 false))
(assert (= license_revoked true))
(assert (= broker_license_cancelled false))
(assert (= broker_registration_cancelled_by_association_within_30_days false))
(assert (= company_stop_applied false))
(assert (= company_dissolve_applied false))
(assert (= insurance_brokerage_stopped true))
(assert (= reinsurance_brokerage_stopped false))
(assert (= report_to_authority_within_1_month false))
(assert (= special_account_books_maintained false))
(assert (= annual_financial_reports_submitted false))
(assert (= reporting_date 0))
(assert (= reporting_start_date 0))
(assert (= reporting_end_date 0))
(assert (= inspection_cooperation false))
(assert (= improvement_measures_implemented false))
(assert (= follow_up_and_reporting_done false))
(assert (= false_report_on_license_application false))
(assert (= contract_with_unapproved_insurer false))
(assert (= conceal_important_contract_info false))
(assert (= coerce_or_induce_contract false))
(assert (= misleading_promotion_or_recruitment false))
(assert (= induce_policy_surrender_or_loan false))
(assert (= misappropriate_insurance_funds false))
(assert (= permit_others_to_use_license false))
(assert (= criminal_conviction_for_fraud_or_forgery false))
(assert (= operate_outside_license_scope false))
(assert (= charge_illegal_fees_or_commissions false))
(assert (= illegal_insurance_payments false))
(assert (= spread_false_information_disturb_financial_order false))
(assert (= authorize_others_to_operate false))
(assert (= transfer_application_documents_to_unauthorized_person false))
(assert (= employ_unqualified_personnel false))
(assert (= fail_to_cancel_license_within_deadline false))
(assert (= unauthorized_stop_resume_dissolve true))
(assert (= fail_to_appoint_broker_after_employee_leaves false))
(assert (= fail_to_report_to_broker_association false))
(assert (= unauthorized_advertisement_content false))
(assert (= pay_commission_to_non_actual_broker false))
(assert (= fail_to_confirm_consumer_suitability false))
(assert (= sell_unapproved_foreign_policy_discount_products false))
(assert (= submit_false_or_incomplete_reports true))
(assert (= hold_conflicting_positions false))
(assert (= induce_contract_termination_or_loan_payment false))
(assert (= fail_to_fill_out_recruitment_report_truthfully false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= damage_insurance_image false))
(assert (= broker true))
(assert (= agent_or_notary false))
(assert (= liability_insurance_covered false))
(assert (= guarantee_insurance_covered false))
(assert (= relevant_insurance_covered false))
(assert (= broker_duty_of_care false))
(assert (= broker_fidelity_duty false))
(assert (= written_analysis_report_provided false))
(assert (= fee_charged false))
(assert (= fee_standard_disclosed false))
(assert (= broker_company_stop_resume_dissolve_reporting false))
(assert (= stop_period_months 6))
(assert (= extension_requested false))
(assert (= extension_approved false))
(assert (= extension_request_days_before_expiry 0))
(assert (= broker_company_stop_period_limit_and_extension false))
(assert (= broker_company_revoke_license_if_no_resume_and_no_broker true))
(assert (= broker_company_cancel_broker_license_on_stop_or_dissolve true))
(assert (= broker_company_cancel_broker_license_on_license_revocation true))
(assert (= broker_company_stop_reinsurance_stop_reporting false))
(assert (= accounting_and_reporting_compliance false))
(assert (= authority_inspection_and_reporting_compliance false))
(assert (= prohibited_behaviors false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_duty_of_care_and_fidelity_executed false))
(assert (= document_retention_compliance false))
(assert (= documents_retained false))
(assert (= electronic_policy_contact_info_provided false))
(assert (= policy_issued_electronically false))
(assert (= insured_contact_info_obtained false))
(assert (= contact_info_provided_to_insurer false))
(assert (= internal_operation_compliance false))
(assert (= internal_operation_rules_established false))
(assert (= internal_operation_rules_executed false))
(assert (= compliance_with_laws_and_protection_of_elderly false))
(assert (= broker_understanding_and_report_before_contract false))
(assert (= insured_basic_info_understood false))
(assert (= broker_company_or_bank_shareholding_disclosure false))
(assert (= broker_company_shareholding_in_insurer_percent 0.0))
(assert (= insurer_shareholding_in_broker_company_or_bank_percent 0.0))
(assert (= shareholding_info_disclosed false))
(assert (= understand_customer_needs_and_suitability false))
(assert (= customer_needs_understood false))
(assert (= product_suitability_confirmed false))
(assert (= document_signed_or_electronically_confirmed false))
(assert (= required_documents_for_property_insurance false))
(assert (= application_form_included false))
(assert (= endorsement_application_included false))
(assert (= insurance_fee_receipt_included false))
(assert (= needs_and_suitability_report_included false))
(assert (= contract_termination_application_included false))
(assert (= other_specified_documents_included false))
(assert (= required_documents_for_life_insurance false))
(assert (= contract_change_application_included false))
(assert (= broker_written_report_and_fee_disclosure false))
(assert (= duty_of_care_executed false))
(assert (= fidelity_duty_executed false))
(assert (= guarantee_deposit_amount 0.0))
(assert (= guarantee_minimum_amount 0.0))
(assert (= license_and_guarantee_compliance false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 24
; Total variables: 117
; Total facts: 117
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
