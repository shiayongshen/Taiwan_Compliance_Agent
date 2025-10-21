; SMT2 file generated from compliance case automatic
; Case ID: case_149
; Generated at: 2025-10-21T03:16:52.098419
;
; This file can be executed with Z3:
;   z3 case_149.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_and_broker_compliance Bool)
(declare-const agent_showed_qualification Bool)
(declare-const applicant_and_insured_basic_info_complete Bool)
(declare-const applicant_and_insured_relationship_known Bool)
(declare-const assess_premium_source_and_appropriateness Bool)
(declare-const assessed_customer_understanding_and_risks Bool)
(declare-const commission_payee_differs_from_agent Bool)
(declare-const comply_broker_management_rules Bool)
(declare-const confirmed_customer_can_bear_loss Bool)
(declare-const confirmed_customer_understands_premium_and_affordability Bool)
(declare-const confirmed_premium_source_compliance Bool)
(declare-const consumer_understands_premium_usage Bool)
(declare-const contact_records_kept Bool)
(declare-const customer_age_over_65 Bool)
(declare-const execute_sales_underwriting_claim_procedures Bool)
(declare-const execute_sales_underwriting_claim_procedures_flag Bool)
(declare-const explained_contract_cancellation_rights Bool)
(declare-const explained_important_terms_and_exclusions Bool)
(declare-const explained_investment_risks Bool)
(declare-const explained_policy_costs Bool)
(declare-const explanation_doc_false Bool)
(declare-const explanation_doc_not_compliant Bool)
(declare-const fail_confirm_suitability_for_elderly Bool)
(declare-const false_or_misleading_promotion Bool)
(declare-const financial_consumer_info_complete Bool)
(declare-const financial_consumer_understanding Bool)
(declare-const implement_financial_underwriting_and_reporting Bool)
(declare-const implement_risk_assessment_and_premium_calculation Bool)
(declare-const improper_discount_or_commission Bool)
(declare-const induce_contract_termination_or_loan_payment Bool)
(declare-const induce_violate_disclosure_obligation Bool)
(declare-const informed_customer_about_product_and_company Bool)
(declare-const informed_loan_risk Bool)
(declare-const informed_surrender_loss Bool)
(declare-const insurance_amount_and_premium_match_needs Bool)
(declare-const insurance_is_foreign_currency Bool)
(declare-const insurance_is_investment_type Bool)
(declare-const insurance_suitability_evaluated Bool)
(declare-const internal_control_and_handling_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const misappropriate_or_embezzle_premium Bool)
(declare-const no_improper_discount_or_inducement Bool)
(declare-const no_induce_contract_termination_or_loan_payment Bool)
(declare-const no_other_harmful_acts Bool)
(declare-const non_sales_staff_assigned_for_contact Bool)
(declare-const not_proactively_disclose Bool)
(declare-const not_provide_explanation_doc Bool)
(declare-const not_report_to_authority_in_time Bool)
(declare-const other_harmful_acts Bool)
(declare-const other_regulatory_basic_info_complete Bool)
(declare-const pay_loan_referral_fee_except_exemption Bool)
(declare-const penalty Bool)
(declare-const post_sale_contact_compliant Bool)
(declare-const premium_source_is_loan_or_surrender_or_borrow Bool)
(declare-const preserve_personal_data_properly Bool)
(declare-const prohibit_improper_sales_acts Bool)
(declare-const provide_inappropriate_products Bool)
(declare-const recording_or_electronic_trace_kept Bool)
(declare-const report_or_disclosure_false Bool)
(declare-const reviewed_by_appropriate_unit Bool)
(declare-const sales_process_recorded_and_reviewed Bool)
(declare-const sales_process_recording_complete Bool)
(declare-const set_insurance_conditions Bool)
(declare-const understand_exchange_rate_risk Bool)
(declare-const understand_financial_consumer Bool)
(declare-const understand_insurance_purpose_and_needs Bool)
(declare-const understand_premium_source Bool)
(declare-const underwriting_process_compliant Bool)
(declare-const underwriting_staff_qualified Bool)
(declare-const underwriting_suitability_evaluated Bool)
(declare-const unfair_treatment_due_to_disability Bool)
(declare-const unqualified_sales_personnel Bool)
(declare-const use_unauthorized_promotional_material Bool)
(declare-const verify_applicant_and_insured_identity Bool)
(declare-const verify_beneficiary_consent Bool)
(declare-const verify_contract_changes_and_signatures Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_1_2_flag Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反保險法第148條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_2_flag))

; [insurance:violate_148_2_1] 違反保險法第148條之二第一項規定：未提供說明文件供查閱、或說明文件未依規定記載、或說明文件記載不實
(assert (= violate_148_2_1
   (or explanation_doc_not_compliant
       not_provide_explanation_doc
       explanation_doc_false)))

; [insurance:violate_148_2_2] 違反保險法第148條之二第二項規定：未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2
   (or not_report_to_authority_in_time
       report_or_disclosure_false
       not_proactively_disclose)))

; [insurance:violate_148_3_1] 違反保險法第148條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反保險法第148條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:internal_control_and_handling_ok] 已建立且執行內部控制及稽核制度與內部處理制度及程序
(assert (= internal_control_and_handling_ok
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed)))

; [insurance:financial_consumer_info_complete] 保險業提供金融消費者基本資料完整
(assert (= financial_consumer_info_complete
   (and applicant_and_insured_basic_info_complete
        applicant_and_insured_relationship_known
        other_regulatory_basic_info_complete)))

; [insurance:financial_consumer_understanding] 保險業充分瞭解金融消費者及其投保條件、審查原則
(assert (= financial_consumer_understanding
   (and understand_financial_consumer
        set_insurance_conditions
        understand_insurance_purpose_and_needs)))

; [insurance:insurance_suitability_evaluated] 保險業評估保險商品適合度符合規定
(assert (= insurance_suitability_evaluated
   (and consumer_understands_premium_usage
        insurance_amount_and_premium_match_needs
        (or understand_exchange_rate_risk (not insurance_is_foreign_currency)))))

; [insurance:sales_process_recorded_and_reviewed] 銷售過程以錄音、錄影或電子設備留存並覆審
(assert (= sales_process_recorded_and_reviewed
   (and recording_or_electronic_trace_kept reviewed_by_appropriate_unit)))

; [insurance:sales_process_recording_complete] 銷售過程錄音錄影或電子設備留存內容完整
(assert (= sales_process_recording_complete
   (and agent_showed_qualification
        informed_customer_about_product_and_company
        explained_important_terms_and_exclusions
        explained_contract_cancellation_rights
        confirmed_customer_understands_premium_and_affordability
        (or (not insurance_is_investment_type)
            (and explained_investment_risks
                 explained_policy_costs
                 confirmed_customer_can_bear_loss)))))

; [insurance:post_sale_contact_compliant] 銷售後電話、視訊或遠距訪問符合規定並保存紀錄
(assert (= post_sale_contact_compliant
   (and non_sales_staff_assigned_for_contact
        contact_records_kept
        (or (not premium_source_is_loan_or_surrender_or_borrow)
            (and confirmed_premium_source_compliance
                 informed_loan_risk
                 informed_surrender_loss))
        (or (not customer_age_over_65)
            assessed_customer_understanding_and_risks))))

; [insurance:agent_and_broker_compliance] 業務往來保險經紀人遵守管理規則及合約約定
(assert (= agent_and_broker_compliance
   (and comply_broker_management_rules
        no_improper_discount_or_inducement
        no_induce_contract_termination_or_loan_payment
        understand_premium_source
        no_other_harmful_acts)))

; [insurance:underwriting_process_compliant] 核保處理制度及程序符合規定
(assert (= underwriting_process_compliant
   (and underwriting_staff_qualified
        underwriting_suitability_evaluated
        (not provide_inappropriate_products)
        verify_applicant_and_insured_identity
        verify_beneficiary_consent
        verify_contract_changes_and_signatures
        preserve_personal_data_properly
        implement_risk_assessment_and_premium_calculation
        (not unfair_treatment_due_to_disability)
        implement_financial_underwriting_and_reporting
        assess_premium_source_and_appropriateness)))

; [insurance:prohibit_improper_sales_acts] 禁止保險業及業務人員不當招攬行為
(assert (= prohibit_improper_sales_acts
   (and (not unqualified_sales_personnel)
        (not improper_discount_or_commission)
        (not false_or_misleading_promotion)
        (not induce_contract_termination_or_loan_payment)
        (not use_unauthorized_promotional_material)
        (not induce_violate_disclosure_obligation)
        (not commission_payee_differs_from_agent)
        (not misappropriate_or_embezzle_premium)
        (not fail_confirm_suitability_for_elderly)
        (not pay_loan_referral_fee_except_exemption)
        (not other_harmful_acts))))

; [insurance:execute_sales_underwriting_claim_procedures] 確實執行招攬、核保及理賠處理制度及程序
(assert (= execute_sales_underwriting_claim_procedures
   execute_sales_underwriting_claim_procedures_flag))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or (not execute_sales_underwriting_claim_procedures)
       (not internal_control_and_handling_ok)
       (not underwriting_process_compliant)
       (not prohibit_improper_sales_acts)
       (not insurance_suitability_evaluated)
       (not post_sale_contact_compliant)
       (not sales_process_recorded_and_reviewed)
       (not agent_and_broker_compliance)
       (not financial_consumer_understanding)
       violate_148_2_2
       (not sales_process_recording_complete)
       violate_148_3_2
       violate_148_3_1
       violate_148_1_2
       (not financial_consumer_info_complete)
       violate_148_2_1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_2_flag true))
(assert (= violate_148_1_2 true))
(assert (= execute_sales_underwriting_claim_procedures_flag false))
(assert (= execute_sales_underwriting_claim_procedures false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= financial_consumer_info_complete false))
(assert (= applicant_and_insured_basic_info_complete false))
(assert (= applicant_and_insured_relationship_known false))
(assert (= other_regulatory_basic_info_complete false))
(assert (= financial_consumer_understanding false))
(assert (= understand_financial_consumer false))
(assert (= set_insurance_conditions false))
(assert (= understand_insurance_purpose_and_needs false))
(assert (= insurance_suitability_evaluated false))
(assert (= consumer_understands_premium_usage false))
(assert (= insurance_amount_and_premium_match_needs false))
(assert (= insurance_is_foreign_currency false))
(assert (= sales_process_recorded_and_reviewed false))
(assert (= recording_or_electronic_trace_kept false))
(assert (= reviewed_by_appropriate_unit false))
(assert (= sales_process_recording_complete false))
(assert (= agent_showed_qualification false))
(assert (= informed_customer_about_product_and_company false))
(assert (= explained_important_terms_and_exclusions false))
(assert (= explained_contract_cancellation_rights false))
(assert (= confirmed_customer_understands_premium_and_affordability false))
(assert (= insurance_is_investment_type false))
(assert (= post_sale_contact_compliant false))
(assert (= non_sales_staff_assigned_for_contact false))
(assert (= contact_records_kept false))
(assert (= premium_source_is_loan_or_surrender_or_borrow true))
(assert (= confirmed_premium_source_compliance false))
(assert (= informed_loan_risk false))
(assert (= informed_surrender_loss false))
(assert (= customer_age_over_65 false))
(assert (= assessed_customer_understanding_and_risks false))
(assert (= agent_and_broker_compliance false))
(assert (= comply_broker_management_rules false))
(assert (= no_improper_discount_or_inducement false))
(assert (= no_induce_contract_termination_or_loan_payment false))
(assert (= understand_premium_source false))
(assert (= no_other_harmful_acts false))
(assert (= underwriting_process_compliant false))
(assert (= underwriting_staff_qualified false))
(assert (= underwriting_suitability_evaluated false))
(assert (= provide_inappropriate_products false))
(assert (= verify_applicant_and_insured_identity false))
(assert (= verify_beneficiary_consent false))
(assert (= verify_contract_changes_and_signatures false))
(assert (= preserve_personal_data_properly false))
(assert (= implement_risk_assessment_and_premium_calculation false))
(assert (= unfair_treatment_due_to_disability false))
(assert (= implement_financial_underwriting_and_reporting false))
(assert (= assess_premium_source_and_appropriateness false))
(assert (= prohibit_improper_sales_acts false))
(assert (= unqualified_sales_personnel true))
(assert (= improper_discount_or_commission false))
(assert (= false_or_misleading_promotion true))
(assert (= induce_contract_termination_or_loan_payment false))
(assert (= use_unauthorized_promotional_material false))
(assert (= induce_violate_disclosure_obligation false))
(assert (= commission_payee_differs_from_agent false))
(assert (= misappropriate_or_embezzle_premium false))
(assert (= fail_confirm_suitability_for_elderly false))
(assert (= pay_loan_referral_fee_except_exemption false))
(assert (= other_harmful_acts true))
(assert (= not_provide_explanation_doc false))
(assert (= explanation_doc_not_compliant false))
(assert (= explanation_doc_false false))
(assert (= not_report_to_authority_in_time false))
(assert (= not_proactively_disclose false))
(assert (= report_or_disclosure_false false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 85
; Total facts: 75
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
