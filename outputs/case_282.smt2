; SMT2 file generated from compliance case automatic
; Case ID: case_282
; Generated at: 2025-10-21T06:19:16.638437
;
; This file can be executed with Z3:
;   z3 case_282.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const actuarial_staff_assigned Bool)
(declare-const actuarial_staff_hired Bool)
(declare-const authorization_levels_defined Bool)
(declare-const authorized_personnel_declaration_correct Bool)
(declare-const beneficiary_consent_verified Bool)
(declare-const board_approval_obtained Bool)
(declare-const board_approved Bool)
(declare-const contract_change_affecting_risk_assessed Bool)
(declare-const contract_change_and_signature_verification_ok Bool)
(declare-const corrections_completed_within_deadlines Bool)
(declare-const disciplinary_action_taken Bool)
(declare-const external_actuary_hired Bool)
(declare-const external_actuary_hired_flag Bool)
(declare-const external_actuary_report_fair Bool)
(declare-const external_actuary_report_true Bool)
(declare-const financial_underwriting_and_risk_assessment_ok Bool)
(declare-const financial_underwriting_mechanism_defined Bool)
(declare-const financial_underwriting_mechanism_implemented Bool)
(declare-const foreign_currency_risk_assessed Bool)
(declare-const identity_and_consent_verification_ok Bool)
(declare-const inappropriate_products_not_offered Bool)
(declare-const income_financial_status_verification_done Bool)
(declare-const insurance_product_pre_approval_compliant Bool)
(declare-const insurance_product_rate_setting_compliant Bool)
(declare-const insurance_product_risk_control_compliant Bool)
(declare-const insurance_reporting_mechanism_defined Bool)
(declare-const insurance_reporting_mechanism_implemented Bool)
(declare-const insurance_type_amount_premium_appropriate Bool)
(declare-const insured_identity_verified Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const investment_insurance_risk_and_funds_assessed Bool)
(declare-const major_regulatory_requirements_met Bool)
(declare-const medical_exam_standards_defined Bool)
(declare-const no_major_errors_or_omissions Bool)
(declare-const non_aggressive_investment_loan_premium_not_accepted Bool)
(declare-const penalty Bool)
(declare-const personal_data_deleted_after_period Bool)
(declare-const personal_data_handling_compliant Bool)
(declare-const personal_data_preservation_compliant Bool)
(declare-const personal_data_preservation_period_compliant Bool)
(declare-const policyholder_and_insured_appropriateness_ok Bool)
(declare-const policyholder_and_insured_identity_and_signature_verified Bool)
(declare-const policyholder_identity_verified Bool)
(declare-const policyholder_understands_premium_usage Bool)
(declare-const premium_source_appropriate Bool)
(declare-const premium_source_assessed_and_appropriate Bool)
(declare-const premium_source_checked Bool)
(declare-const product_content_complies_laws Bool)
(declare-const rate_setting_no_unreasonable_pricing Bool)
(declare-const rate_setting_original_data_acquired Bool)
(declare-const rate_setting_reference_data_recent_and_relevant Bool)
(declare-const rate_setting_risk_and_contract_terms_consistent Bool)
(declare-const reinsurance_arrangement_defined Bool)
(declare-const reinsurance_arrangement_evaluated Bool)
(declare-const rejection_count_below_limit Bool)
(declare-const reporting_documents_retained Bool)
(declare-const reporting_mechanism_and_documentation_ok Bool)
(declare-const reports_fair_and_true Bool)
(declare-const required_documents_complete Bool)
(declare-const risk_assessment_procedures_implemented Bool)
(declare-const sales_approval_procedures_followed Bool)
(declare-const sales_limit_warning_and_control_mechanism_established Bool)
(declare-const sales_limit_within_risk_tolerance Bool)
(declare-const signed_by_authorized_personnel Bool)
(declare-const signing_actuary_assigned Bool)
(declare-const signing_actuary_report_fair Bool)
(declare-const signing_actuary_report_true Bool)
(declare-const staff_disciplinary_action_taken Bool)
(declare-const submission_method_compliant Bool)
(declare-const submitted_documents_truthful Bool)
(declare-const training_fair_treatment_65_plus_done Bool)
(declare-const underwriting_and_claims_execution_compliant Bool)
(declare-const underwriting_and_claims_procedures_executed Bool)
(declare-const underwriting_and_claims_staff_compliant Bool)
(declare-const underwriting_evaluation_documents_retained Bool)
(declare-const underwriting_guidelines_defined Bool)
(declare-const underwriting_procedures_compliant Bool)
(declare-const underwriting_staff_qualified Bool)
(declare-const underwriting_staff_qualified_and_trained Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:act_144_actuarial_staff_assigned] 保險業聘用精算人員並指派簽證精算人員
(assert (= actuarial_staff_assigned
   (and actuarial_staff_hired signing_actuary_assigned)))

; [insurance:act_144_external_actuary_hired] 保險業聘請外部複核精算人員
(assert (= external_actuary_hired external_actuary_hired_flag))

; [insurance:act_144_board_approval_obtained] 簽證精算人員指派及外部複核精算人員聘請經董（理）事會同意
(assert (= board_approval_obtained
   (and signing_actuary_assigned external_actuary_hired_flag board_approved)))

; [insurance:act_144_reports_fair_and_true] 簽證及複核報告內容公正且無虛偽隱匿遺漏錯誤
(assert (= reports_fair_and_true
   (and signing_actuary_report_fair
        signing_actuary_report_true
        external_actuary_report_fair
        external_actuary_report_true)))

; [insurance:internal_control_established_and_executed] 保險業建立並執行內部控制及稽核制度
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_established_and_executed] 保險業建立並執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:underwriting_staff_qualified_and_trained] 核保人員具資格且接受公平對待65歲以上客戶教育訓練
(assert (= underwriting_staff_qualified_and_trained
   (and underwriting_staff_qualified training_fair_treatment_65_plus_done)))

; [insurance:underwriting_procedures_compliant] 核保程序符合規定包括核保準則、財務核保機制等
(assert (= underwriting_procedures_compliant
   (and underwriting_guidelines_defined
        financial_underwriting_mechanism_defined
        medical_exam_standards_defined
        insurance_reporting_mechanism_defined
        authorization_levels_defined
        reinsurance_arrangement_defined)))

; [insurance:policyholder_insured_understanding_and_appropriateness] 要保人及被保險人保險需求及適合度評估符合規定
(assert (= policyholder_and_insured_appropriateness_ok
   (and policyholder_understands_premium_usage
        insurance_type_amount_premium_appropriate
        foreign_currency_risk_assessed
        investment_insurance_risk_and_funds_assessed
        inappropriate_products_not_offered
        non_aggressive_investment_loan_premium_not_accepted)))

; [insurance:financial_underwriting_and_risk_assessment_procedures] 財務核保機制及風險評估作業程序符合規定
(assert (= financial_underwriting_and_risk_assessment_ok
   (and financial_underwriting_mechanism_implemented
        risk_assessment_procedures_implemented
        income_financial_status_verification_done)))

; [insurance:insurance_reporting_mechanism_and_documentation_ok] 保險通報機制及相關文件保存符合規定
(assert (= reporting_mechanism_and_documentation_ok
   (and insurance_reporting_mechanism_implemented
        reporting_documents_retained
        underwriting_evaluation_documents_retained)))

; [insurance:premium_source_assessed_and_appropriate] 繳交保險費資金來源評估適當
(assert (= premium_source_assessed_and_appropriate
   (and premium_source_checked premium_source_appropriate)))

; [insurance:identity_and_consent_verification_ok] 要保人、被保險人及受益人身份及同意確認程序符合規定
(assert (= identity_and_consent_verification_ok
   (and policyholder_identity_verified
        insured_identity_verified
        beneficiary_consent_verified)))

; [insurance:contract_change_and_signature_verification_ok] 保險契約變更及簽章確認程序符合規定
(assert (= contract_change_and_signature_verification_ok
   (and contract_change_affecting_risk_assessed
        policyholder_and_insured_identity_and_signature_verified)))

; [insurance:personal_data_preservation_compliant] 個人資料保存期限及銷毀程序符合規定
(assert (= personal_data_preservation_compliant
   (and personal_data_preservation_period_compliant
        personal_data_handling_compliant
        personal_data_deleted_after_period)))

; [insurance:underwriting_and_claims_execution_compliant] 保險業確實執行招攬、核保及理賠制度及程序
(assert (= underwriting_and_claims_execution_compliant
   underwriting_and_claims_procedures_executed))

; [insurance:underwriting_and_claims_staff_disciplinary_action] 對未依規定執行業務之招攬、核保及理賠人員予以警告或適當處置
(assert (= staff_disciplinary_action_taken
   (or underwriting_and_claims_staff_compliant disciplinary_action_taken)))

; [insurance:insurance_product_rate_setting_compliant] 保險商品費率釐訂符合適足性、合理性及公平性
(assert (= insurance_product_rate_setting_compliant
   (and rate_setting_reference_data_recent_and_relevant
        rate_setting_risk_and_contract_terms_consistent
        rate_setting_original_data_acquired
        rate_setting_no_unreasonable_pricing)))

; [insurance:insurance_product_risk_control_compliant] 保險商品風險控管機制符合規定
(assert (= insurance_product_risk_control_compliant
   (and reinsurance_arrangement_evaluated
        sales_limit_warning_and_control_mechanism_established
        sales_limit_within_risk_tolerance)))

; [insurance:insurance_product_pre_approval_compliant] 保險商品送審資料符合規定且無重大錯誤或缺漏
(assert (= insurance_product_pre_approval_compliant
   (and product_content_complies_laws
        signed_by_authorized_personnel
        no_major_errors_or_omissions
        submitted_documents_truthful
        authorized_personnel_declaration_correct
        sales_approval_procedures_followed
        submission_method_compliant
        required_documents_complete
        major_regulatory_requirements_met
        corrections_completed_within_deadlines
        rejection_count_below_limit)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法及相關規定時處罰
(assert (= penalty
   (or (not insurance_product_rate_setting_compliant)
       (not insurance_product_pre_approval_compliant)
       (not reporting_mechanism_and_documentation_ok)
       (not underwriting_procedures_compliant)
       (not board_approval_obtained)
       (not underwriting_and_claims_execution_compliant)
       (not premium_source_assessed_and_appropriate)
       (not identity_and_consent_verification_ok)
       (not personal_data_preservation_compliant)
       (not contract_change_and_signature_verification_ok)
       (not internal_handling_ok)
       (not insurance_product_risk_control_compliant)
       (not internal_control_ok)
       (not underwriting_staff_qualified_and_trained)
       (not reports_fair_and_true)
       (not policyholder_and_insured_appropriateness_ok)
       (not actuarial_staff_assigned)
       (not external_actuary_hired)
       (not financial_underwriting_and_risk_assessment_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= actuarial_staff_hired false))
(assert (= signing_actuary_assigned false))
(assert (= external_actuary_hired_flag false))
(assert (= board_approved false))
(assert (= signing_actuary_report_fair false))
(assert (= signing_actuary_report_true false))
(assert (= external_actuary_report_fair false))
(assert (= external_actuary_report_true false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= underwriting_staff_qualified false))
(assert (= training_fair_treatment_65_plus_done false))
(assert (= underwriting_guidelines_defined false))
(assert (= financial_underwriting_mechanism_defined false))
(assert (= medical_exam_standards_defined false))
(assert (= insurance_reporting_mechanism_defined false))
(assert (= authorization_levels_defined false))
(assert (= reinsurance_arrangement_defined false))
(assert (= policyholder_understands_premium_usage false))
(assert (= insurance_type_amount_premium_appropriate false))
(assert (= foreign_currency_risk_assessed false))
(assert (= investment_insurance_risk_and_funds_assessed false))
(assert (= inappropriate_products_not_offered false))
(assert (= non_aggressive_investment_loan_premium_not_accepted false))
(assert (= financial_underwriting_mechanism_implemented false))
(assert (= risk_assessment_procedures_implemented false))
(assert (= income_financial_status_verification_done false))
(assert (= insurance_reporting_mechanism_implemented false))
(assert (= reporting_documents_retained false))
(assert (= underwriting_evaluation_documents_retained false))
(assert (= premium_source_checked false))
(assert (= premium_source_appropriate false))
(assert (= policyholder_identity_verified false))
(assert (= insured_identity_verified false))
(assert (= beneficiary_consent_verified false))
(assert (= contract_change_affecting_risk_assessed false))
(assert (= policyholder_and_insured_identity_and_signature_verified false))
(assert (= personal_data_preservation_period_compliant false))
(assert (= personal_data_handling_compliant false))
(assert (= personal_data_deleted_after_period false))
(assert (= underwriting_and_claims_procedures_executed false))
(assert (= underwriting_and_claims_staff_compliant false))
(assert (= disciplinary_action_taken false))
(assert (= rate_setting_reference_data_recent_and_relevant false))
(assert (= rate_setting_risk_and_contract_terms_consistent false))
(assert (= rate_setting_original_data_acquired false))
(assert (= rate_setting_no_unreasonable_pricing false))
(assert (= reinsurance_arrangement_evaluated false))
(assert (= sales_limit_warning_and_control_mechanism_established false))
(assert (= sales_limit_within_risk_tolerance false))
(assert (= product_content_complies_laws false))
(assert (= signed_by_authorized_personnel false))
(assert (= no_major_errors_or_omissions false))
(assert (= submitted_documents_truthful false))
(assert (= authorized_personnel_declaration_correct false))
(assert (= sales_approval_procedures_followed false))
(assert (= submission_method_compliant false))
(assert (= required_documents_complete false))
(assert (= major_regulatory_requirements_met false))
(assert (= corrections_completed_within_deadlines false))
(assert (= rejection_count_below_limit false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 84
; Total facts: 63
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
