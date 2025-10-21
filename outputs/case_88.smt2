; SMT2 file generated from compliance case automatic
; Case ID: case_88
; Generated at: 2025-10-21T01:20:57.376559
;
; This file can be executed with Z3:
;   z3 case_88.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_and_guarantee_ok Bool)
(declare-const agent_type Int)
(declare-const applicant_email Bool)
(declare-const applicant_other_contact Bool)
(declare-const applicant_phone Bool)
(declare-const application_date Int)
(declare-const application_form_included Bool)
(declare-const authority_exemption Bool)
(declare-const authorize_others_to_operate Bool)
(declare-const bank_engage_agent Bool)
(declare-const bank_engage_broker Bool)
(declare-const bank_permitted Bool)
(declare-const bank_permitted_to_engage_agent_or_broker Bool)
(declare-const broker_appointed Bool)
(declare-const broker_appointment_or_change_reported Bool)
(declare-const broker_capital_adjustment_completed Bool)
(declare-const broker_capital_adjustment_due_to_share_transfer Bool)
(declare-const broker_capital_contribution_cash_only Bool)
(declare-const broker_changed Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_company_shareholding_ratio Real)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_disclose_shareholding_info_before_contract Bool)
(declare-const broker_document_retention Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_duty_of_care_and_fidelity_in_business Bool)
(declare-const broker_electronic_policy_contact_info_provided Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_exercise_fidelity Bool)
(declare-const broker_internal_operation_specification_and_execution Bool)
(declare-const broker_minimum_paid_in_capital_ok Bool)
(declare-const broker_prohibited_acts Bool)
(declare-const broker_provide_written_analysis_report Bool)
(declare-const broker_provide_written_analysis_report_and_disclose_fee Bool)
(declare-const broker_required_documents_for_life_insurance Bool)
(declare-const broker_required_documents_for_property_insurance Bool)
(declare-const broker_resignation_reported_and_certificate_cancelled Bool)
(declare-const broker_resigned Bool)
(declare-const broker_understand_client_and_provide_written_report_before_contract Bool)
(declare-const broker_understand_client_needs_and_suitability Bool)
(declare-const business_type Int)
(declare-const capital_adjustment_completed Bool)
(declare-const capital_adjustment_completed_date Int)
(declare-const capital_adjustment_completed_within_6_months Bool)
(declare-const capital_amount_and_implementation_defined Bool)
(declare-const capital_amount_and_implementation_set_by_authority Bool)
(declare-const capital_contribution_cash_only Bool)
(declare-const certificate_cancelled Bool)
(declare-const charge_fee Bool)
(declare-const charge_illegal_fees_or_commissions Bool)
(declare-const client_info_understood Bool)
(declare-const client_needs_and_suitability_report_included Bool)
(declare-const client_needs_understood Bool)
(declare-const coerce_or_induce_contract Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const conflict_of_interest_or_insurance_agent_registration_violation Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const contract_change_application_included Bool)
(declare-const contract_termination_application_included Bool)
(declare-const contract_with_unregistered_insurer Bool)
(declare-const criminal_conviction_for_fraud_or_forgery Bool)
(declare-const damage_insurance_image Bool)
(declare-const days_since_appointment_or_change Int)
(declare-const days_since_resignation Int)
(declare-const document_signed_or_electronically_confirmed Bool)
(declare-const documents_retained Bool)
(declare-const employ_unqualified_recruiters Bool)
(declare-const endorsement_application_included Bool)
(declare-const exercise_duty_of_care Bool)
(declare-const exercise_fidelity Bool)
(declare-const fail_to_confirm_suitability_for_seniors Bool)
(declare-const fail_to_fill_out_recruitment_report_truthfully Bool)
(declare-const fail_to_reappoint_broker_on_resignation Bool)
(declare-const fail_to_report_license_cancellation_within_deadline Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_or_incomplete_business_or_financial_reports Bool)
(declare-const false_report_on_license_application Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const guarantee_insurance_purchased Bool)
(declare-const illegal_insurance_payments Bool)
(declare-const induce_policy_cancellation_or_loan_payment Bool)
(declare-const induce_policyholder_to_cancel_or_loan Bool)
(declare-const insurance_fee_receipt_included Bool)
(declare-const insurance_policy_electronic Bool)
(declare-const insured_email Bool)
(declare-const insured_other_contact Bool)
(declare-const insured_phone Bool)
(declare-const insurer_shareholding_ratio Real)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_specified Bool)
(declare-const liability_insurance_purchased Bool)
(declare-const license_issue_date Int)
(declare-const license_permitted Bool)
(declare-const management_rules_defined Bool)
(declare-const management_rules_set_by_authority Bool)
(declare-const misappropriate_insurance_funds Bool)
(declare-const misleading_promotion_or_recruitment Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_authority_specified_documents_included Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const paid_in_capital Real)
(declare-const pay_commission_to_non_actual_recruiters Bool)
(declare-const penalty Bool)
(declare-const penalty_imposed_for_violation Bool)
(declare-const permit_others_use_certificate Bool)
(declare-const practice_certificate_held Bool)
(declare-const product_suitability_confirmed Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_ok Bool)
(declare-const report_to_broker_association Bool)
(declare-const resignation_reported_to_authority Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const senior_consumer_protection_included Bool)
(declare-const share_transfer_due_to_inheritance Bool)
(declare-const share_transfer_ratio Real)
(declare-const shareholding_info_disclosed Bool)
(declare-const spread_false_information Bool)
(declare-const transfer_application_documents_without_consent Bool)
(declare-const unauthorized_advertisement_content Bool)
(declare-const unauthorized_suspension_or_termination_of_business Bool)
(declare-const violate_163_5th_paragraph_applied Bool)
(declare-const violate_163_7th_paragraph Bool)
(declare-const violate_165_1st_paragraph Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_related_provisions Bool)
(declare-const violation_financial_or_business_management_rules Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_guarantee_ok] 保險代理人、經紀人、公證人已取得主管機關許可、繳存保證金並投保相關保險，且領有執業證照
(assert (= agent_license_and_guarantee_ok
   (and license_permitted
        guarantee_deposit_paid
        related_insurance_purchased
        practice_certificate_held)))

; [insurance:related_insurance_type_ok] 保險代理人、公證人投保責任保險，經紀人投保責任保險及保證保險
(assert (= related_insurance_type_ok
   (or (and (= 2 agent_type)
            liability_insurance_purchased
            guarantee_insurance_purchased)
       (and (= 3 agent_type) liability_insurance_purchased)
       (and (= 1 agent_type) liability_insurance_purchased))))

; [insurance:capital_amount_and_implementation_set_by_authority] 保證金最低金額及實施方式由主管機關依經營業務範圍及規模定之
(assert (= capital_amount_and_implementation_set_by_authority
   capital_amount_and_implementation_defined))

; [insurance:management_rules_set_by_authority] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= management_rules_set_by_authority management_rules_defined))

; [insurance:bank_permitted_to_engage_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_engage_agent_or_broker
   (and bank_permitted (or bank_engage_agent bank_engage_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_exercise_fidelity)))

; [insurance:broker_provide_written_analysis_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (= broker_provide_written_analysis_report_and_disclose_fee
   (and broker_provide_written_analysis_report
        (or (not broker_charge_fee) broker_disclose_fee_standard))))

; [insurance:violation_financial_or_business_management_rules] 違反財務或業務管理規定或相關準用規定
(assert (= violation_financial_or_business_management_rules
   (or violate_related_provisions
       violate_financial_management_rules
       violate_business_management_rules)))

; [insurance:penalty_imposed_for_violation] 違反規定者應限期改正或處罰，情節重大者廢止許可並註銷執業證照
(assert (= penalty_imposed_for_violation
   (or violate_163_7th_paragraph
       violate_163_5th_paragraph_applied
       violate_165_1st_paragraph
       violation_financial_or_business_management_rules)))

; [broker:resignation_reported_and_certificate_cancelled] 經紀人離職後十五日內申報並繳銷執業證照，並向經紀人商業同業公會報備
(assert (= broker_resignation_reported_and_certificate_cancelled
   (and broker_resigned
        (>= 15 days_since_resignation)
        resignation_reported_to_authority
        certificate_cancelled
        report_to_broker_association)))

; [broker:appointment_or_change_reported] 經紀人公司及銀行增加任用或變更經紀人後七日內向經紀人商業同業公會報備
(assert (= broker_appointment_or_change_reported
   (and (or broker_appointed broker_changed)
        (>= 7 days_since_appointment_or_change)
        report_to_broker_association)))

; [broker:minimum_paid_in_capital] 經紀人公司最低實收資本額依申請業務類型及時點規定
(assert (let ((a!1 (not (and (not (<= 20210303 application_date)) (= 1 business_type))))
      (a!2 (not (and (not (<= 20210303 application_date)) (= 2 business_type))))
      (a!3 (not (and (not (<= 20210303 application_date)) (= 3 business_type))))
      (a!4 (and (not (and (<= 20210303 application_date) (= 2 business_type)))
                (<= 20210303 application_date)
                (= 3 business_type)
                (<= 10000000.0 paid_in_capital)))
      (a!9 (and (not (<= 20210303 application_date))
                (= 1 business_type)
                (<= 20000000.0 paid_in_capital))))
(let ((a!5 (and (not (and (<= 20210303 application_date) (= 1 business_type)))
                (or (and (<= 20210303 application_date)
                         (= 2 business_type)
                         (<= 10000000.0 paid_in_capital))
                    a!4))))
(let ((a!6 (and a!3
                (or a!5
                    (and (<= 20210303 application_date)
                         (= 1 business_type)
                         (<= 5000000.0 paid_in_capital))))))
(let ((a!7 (or (and (not (<= 20210303 application_date))
                    (= 3 business_type)
                    (<= 30000000.0 paid_in_capital))
               a!6)))
(let ((a!8 (or (and a!2 a!7)
               (and (not (<= 20210303 application_date))
                    (= 2 business_type)
                    (<= 20000000.0 paid_in_capital)))))
(let ((a!10 (or (not (or (and a!1 a!8) a!9)) broker_minimum_paid_in_capital_ok)))
  (and (or (and a!1 a!8) a!9 (not broker_minimum_paid_in_capital_ok)) a!10))))))))

; [broker:capital_adjustment_completed] 已領有執業證照之經紀人公司於規定期限內完成資本額調整
(assert (let ((a!1 (or (and (not (<= 20190624 license_issue_date))
                    (>= 20190624 capital_adjustment_completed_date))
               (and (<= 20190624 license_issue_date)
                    capital_adjustment_completed))))
  (= broker_capital_adjustment_completed a!1)))

; [broker:capital_adjustment_due_to_share_transfer] 股權或資本總額移轉達50%以上時，於交割日次日起6個月內完成資本額調整，繼承除外
(assert (let ((a!1 (or (not (and (<= 50.0 share_transfer_ratio)
                         (not share_transfer_due_to_inheritance)))
               capital_adjustment_completed_within_6_months)))
  (= broker_capital_adjustment_due_to_share_transfer a!1)))

; [broker:capital_contribution_cash_only] 經紀人公司發起人及股東出資以現金為限
(assert (= broker_capital_contribution_cash_only capital_contribution_cash_only))

; [broker:prohibited_acts] 個人執業經紀人、經紀人公司、銀行及受任用經紀人不得有違規行為
(assert (not (= (or misappropriate_insurance_funds
            employ_unqualified_recruiters
            false_report_on_license_application
            fail_to_reappoint_broker_on_resignation
            induce_policy_cancellation_or_loan_payment
            transfer_application_documents_without_consent
            damage_insurance_image
            fail_to_fill_out_recruitment_report_truthfully
            misleading_promotion_or_recruitment
            false_or_incomplete_business_or_financial_reports
            induce_policyholder_to_cancel_or_loan
            operate_outside_license_scope
            spread_false_information
            unauthorized_advertisement_content
            coerce_or_induce_contract
            pay_commission_to_non_actual_recruiters
            fail_to_report_license_cancellation_within_deadline
            permit_others_use_certificate
            conceal_important_contract_info
            illegal_insurance_payments
            contract_with_unregistered_insurer
            conflict_of_interest_or_insurance_agent_registration_violation
            unauthorized_suspension_or_termination_of_business
            charge_illegal_fees_or_commissions
            sell_unapproved_foreign_policy_discount_products
            fail_to_report_to_broker_association
            criminal_conviction_for_fraud_or_forgery
            other_violations_of_rules_or_laws
            fail_to_confirm_suitability_for_seniors
            authorize_others_to_operate)
        broker_prohibited_acts)))

; [broker:duty_of_care_and_fidelity_in_business] 個人執業經紀人、經紀人公司及銀行執行業務時盡善良管理人注意及忠實義務，維護被保險人利益
(assert (= broker_duty_of_care_and_fidelity_in_business
   (and exercise_duty_of_care exercise_fidelity)))

; [broker:document_retention] 個人執業經紀人、經紀人公司及銀行應留存相關文件備查
(assert (= broker_document_retention documents_retained))

; [broker:electronic_policy_contact_info_provided] 保險人以電子保單出單時，應取得要保人及被保險人聯絡方式並提供予保險人
(assert (= broker_electronic_policy_contact_info_provided
   (or (not insurance_policy_electronic)
       (and (or applicant_other_contact applicant_phone applicant_email)
            (or insured_phone insured_other_contact insured_email)
            contact_info_provided_to_insurer))))

; [broker:internal_operation_specification_and_execution] 經紀人公司及銀行應訂定內部作業規範並落實執行，包含保障65歲以上高齡消費者權益
(assert (= broker_internal_operation_specification_and_execution
   (and internal_operation_specified
        internal_operation_executed
        senior_consumer_protection_included)))

; [broker:understand_client_and_provide_written_report_before_contract] 經紀人洽訂保險契約前應充分了解客戶資料及需求，並依主管機關規定提供書面分析報告及明確告知報酬標準
(assert (= broker_understand_client_and_provide_written_report_before_contract
   (and client_info_understood
        written_analysis_report_provided
        (or (not charge_fee) fee_standard_disclosed))))

; [broker:disclose_shareholding_info_before_contract] 經紀人洽訂保險契約前應揭露單一保險公司或經紀人公司持股超過10%資訊
(assert (let ((a!1 (not (or (not (<= broker_company_shareholding_ratio 10.0))
                    (not (<= insurer_shareholding_ratio 10.0))))))
  (= broker_disclose_shareholding_info_before_contract
     (or a!1 shareholding_info_disclosed))))

; [broker:understand_client_needs_and_suitability] 個人執業經紀人、經紀人公司及銀行應確實了解要保人需求及商品適合度，並於文件簽章或電子方式確認
(assert (= broker_understand_client_needs_and_suitability
   (or authority_exemption
       (and client_needs_understood
            product_suitability_confirmed
            document_signed_or_electronically_confirmed))))

; [broker:required_documents_for_property_insurance] 財產保險相關文件應包括指定文件
(assert (= broker_required_documents_for_property_insurance
   (and application_form_included
        endorsement_application_included
        insurance_fee_receipt_included
        client_needs_and_suitability_report_included
        contract_termination_application_included
        other_authority_specified_documents_included)))

; [broker:required_documents_for_life_insurance] 人身保險相關文件應包括指定文件
(assert (= broker_required_documents_for_life_insurance
   (and application_form_included
        contract_change_application_included
        insurance_fee_receipt_included
        client_needs_and_suitability_report_included
        contract_termination_application_included
        other_authority_specified_documents_included)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險投保、執業證照、管理規則、財務或業務管理規定、經紀人違規行為等任一規定時處罰
(assert (= penalty
   (or (not related_insurance_type_ok)
       (not broker_resignation_reported_and_certificate_cancelled)
       (not management_rules_set_by_authority)
       (not agent_license_and_guarantee_ok)
       (not broker_duty_of_care_and_fidelity_in_business)
       (not broker_understand_client_and_provide_written_report_before_contract)
       (not broker_disclose_shareholding_info_before_contract)
       (not broker_document_retention)
       (not broker_understand_client_needs_and_suitability)
       violation_financial_or_business_management_rules
       (not broker_internal_operation_specification_and_execution)
       (not broker_appointment_or_change_reported)
       (not broker_minimum_paid_in_capital_ok)
       (not broker_capital_adjustment_completed)
       (not broker_required_documents_for_life_insurance)
       (not broker_capital_contribution_cash_only)
       (not capital_amount_and_implementation_set_by_authority)
       (not broker_capital_adjustment_due_to_share_transfer)
       (not broker_duty_of_care_and_fidelity)
       (not bank_permitted_to_engage_agent_or_broker)
       (not broker_electronic_policy_contact_info_provided)
       (not broker_prohibited_acts)
       (not broker_required_documents_for_property_insurance)
       (not broker_provide_written_analysis_report_and_disclose_fee))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted true))
(assert (= guarantee_deposit_paid true))
(assert (= related_insurance_purchased true))
(assert (= practice_certificate_held true))
(assert (= agent_license_and_guarantee_ok true))
(assert (= agent_type 2))
(assert (= broker_minimum_paid_in_capital_ok false))
(assert (= paid_in_capital 3000000))
(assert (= license_issue_date 20150102))
(assert (= capital_adjustment_completed false))
(assert (= capital_adjustment_completed_date 0))
(assert (= broker_capital_adjustment_completed false))
(assert (= broker_resigned true))
(assert (= days_since_resignation 45))
(assert (= resignation_reported_to_authority false))
(assert (= certificate_cancelled false))
(assert (= report_to_broker_association false))
(assert (= broker_resignation_reported_and_certificate_cancelled false))
(assert (= violate_financial_management_rules false))
(assert (= violate_business_management_rules false))
(assert (= violate_related_provisions false))
(assert (= violation_financial_or_business_management_rules false))
(assert (= broker_prohibited_acts true))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= broker_provide_written_analysis_report true))
(assert (= broker_charge_fee false))
(assert (= broker_disclose_fee_standard true))
(assert (= broker_provide_written_analysis_report_and_disclose_fee true))
(assert (= broker_appointment_or_change_reported true))
(assert (= broker_capital_adjustment_due_to_share_transfer true))
(assert (= capital_amount_and_implementation_defined true))
(assert (= capital_amount_and_implementation_set_by_authority true))
(assert (= management_rules_defined true))
(assert (= management_rules_set_by_authority true))
(assert (= bank_permitted false))
(assert (= bank_engage_agent false))
(assert (= bank_engage_broker false))
(assert (= bank_permitted_to_engage_agent_or_broker false))
(assert (= broker_duty_of_care_and_fidelity_in_business true))
(assert (= exercise_duty_of_care true))
(assert (= exercise_fidelity true))
(assert (= broker_document_retention true))
(assert (= documents_retained true))
(assert (= broker_electronic_policy_contact_info_provided true))
(assert (= insurance_policy_electronic false))
(assert (= broker_internal_operation_specification_and_execution true))
(assert (= internal_operation_specified true))
(assert (= internal_operation_executed true))
(assert (= senior_consumer_protection_included true))
(assert (= broker_understand_client_and_provide_written_report_before_contract true))
(assert (= client_info_understood true))
(assert (= written_analysis_report_provided true))
(assert (= charge_fee false))
(assert (= fee_standard_disclosed true))
(assert (= broker_disclose_shareholding_info_before_contract true))
(assert (= broker_company_shareholding_ratio 5.0))
(assert (= insurer_shareholding_ratio 0.0))
(assert (= shareholding_info_disclosed true))
(assert (= broker_understand_client_needs_and_suitability true))
(assert (= authority_exemption false))
(assert (= client_needs_understood true))
(assert (= product_suitability_confirmed true))
(assert (= document_signed_or_electronically_confirmed true))
(assert (= broker_required_documents_for_property_insurance true))
(assert (= application_form_included true))
(assert (= endorsement_application_included true))
(assert (= insurance_fee_receipt_included true))
(assert (= client_needs_and_suitability_report_included true))
(assert (= contract_termination_application_included true))
(assert (= other_authority_specified_documents_included true))
(assert (= broker_required_documents_for_life_insurance true))
(assert (= contract_change_application_included true))
(assert (= false_report_on_license_application false))
(assert (= contract_with_unregistered_insurer false))
(assert (= conceal_important_contract_info false))
(assert (= coerce_or_induce_contract false))
(assert (= misleading_promotion_or_recruitment false))
(assert (= induce_policyholder_to_cancel_or_loan false))
(assert (= misappropriate_insurance_funds false))
(assert (= permit_others_use_certificate false))
(assert (= criminal_conviction_for_fraud_or_forgery false))
(assert (= operate_outside_license_scope false))
(assert (= charge_illegal_fees_or_commissions false))
(assert (= illegal_insurance_payments false))
(assert (= spread_false_information false))
(assert (= authorize_others_to_operate false))
(assert (= transfer_application_documents_without_consent false))
(assert (= employ_unqualified_recruiters false))
(assert (= fail_to_report_license_cancellation_within_deadline true))
(assert (= unauthorized_suspension_or_termination_of_business false))
(assert (= fail_to_reappoint_broker_on_resignation false))
(assert (= fail_to_report_to_broker_association true))
(assert (= unauthorized_advertisement_content false))
(assert (= pay_commission_to_non_actual_recruiters false))
(assert (= fail_to_confirm_suitability_for_seniors false))
(assert (= sell_unapproved_foreign_policy_discount_products false))
(assert (= false_or_incomplete_business_or_financial_reports false))
(assert (= conflict_of_interest_or_insurance_agent_registration_violation false))
(assert (= induce_policy_cancellation_or_loan_payment false))
(assert (= fail_to_fill_out_recruitment_report_truthfully false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= damage_insurance_image false))
(assert (= penalty_imposed_for_violation true))
(assert (= violate_163_5th_paragraph_applied false))
(assert (= violate_163_7th_paragraph false))
(assert (= violate_165_1st_paragraph false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 27
; Total variables: 129
; Total facts: 107
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
