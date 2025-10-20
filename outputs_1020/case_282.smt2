; SMT2 file generated from compliance case automatic
; Case ID: case_282
; Generated at: 2025-10-19T12:02:43.729693
;
; This file can be executed with Z3:
;   z3 case_282.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const act_144_actuarial_staff_assigned Bool)
(declare-const act_144_board_approval_obtained Bool)
(declare-const act_144_external_review_engaged Bool)
(declare-const act_144_reports_fair_and_true Bool)
(declare-const actuarial_staff_hired Bool)
(declare-const applicant_and_insured_identity_and_signature_confirmed Bool)
(declare-const applicant_and_insured_identity_confirmed Bool)
(declare-const applicant_identity_confirmed Bool)
(declare-const applicant_insured_risk_assessed Bool)
(declare-const applicant_understands_premium_usage Bool)
(declare-const assessment_of_65_plus_clients_done Bool)
(declare-const authorization_levels_defined Bool)
(declare-const beneficiary_designation_confirmed Bool)
(declare-const beneficiary_designation_or_change_consented Bool)
(declare-const benefit_items_set Bool)
(declare-const board_approval_obtained Bool)
(declare-const business_execution_compliant Bool)
(declare-const business_execution_per_regulations Bool)
(declare-const content_has_major_errors_or_omissions Bool)
(declare-const content_violates_law_severely Bool)
(declare-const contract_change_affecting_risk_assessed Bool)
(declare-const contract_change_and_signature_confirmed Bool)
(declare-const corrections_completed_within_35_working_days Bool)
(declare-const corrections_completed_within_65_working_days Bool)
(declare-const cumulative_rejection_count Int)
(declare-const disciplinary_action_taken Bool)
(declare-const domestic_data_primary Bool)
(declare-const exemptions_applied Bool)
(declare-const exemptions_for_certain_insurance_products Bool)
(declare-const experience_data_recent_and_relevant Bool)
(declare-const extended_retention_due_to_dispute Bool)
(declare-const external_actuarial_reviewer_hired Bool)
(declare-const external_reviewer_report_fair_and_true Bool)
(declare-const financial_and_occupational_assessment_done Bool)
(declare-const financial_underwriting_mechanism_defined Bool)
(declare-const foreign_currency_risk_assessed Bool)
(declare-const foreign_data_used_if_no_domestic Bool)
(declare-const income_financial_verification_for_certain_insurances Bool)
(declare-const insurance_amount_and_premium_reasonable Bool)
(declare-const insurance_reporting_mechanism_defined Bool)
(declare-const insurance_reporting_mechanism_implemented Bool)
(declare-const insurance_reporting_mechanism_operational Bool)
(declare-const insured_consent_confirmed Bool)
(declare-const insured_identity_confirmed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_established_and_executed Bool)
(declare-const internal_handling_executed Bool)
(declare-const investment_type_risk_acknowledged Bool)
(declare-const investment_type_risk_assessed Bool)
(declare-const medical_investigation_standards_defined Bool)
(declare-const no_financial_underwriting_or_reporting Bool)
(declare-const no_insurance_for_non_aggressive_investors_with_loans Bool)
(declare-const no_overselling_beyond_financial_capacity Bool)
(declare-const no_premium_source_assessment Bool)
(declare-const no_product_content_assessment Bool)
(declare-const no_signature_or_proof_of_intent Bool)
(declare-const other_harmful_acts Bool)
(declare-const penalty Bool)
(declare-const personal_data_deleted_after_retention Bool)
(declare-const personal_data_handled_per_pdp_law Bool)
(declare-const personal_data_preservation_compliant Bool)
(declare-const personnel_disciplinary_action_taken Bool)
(declare-const policy_backdating Bool)
(declare-const premium_source_assessed Bool)
(declare-const premium_source_assessment Bool)
(declare-const product_must_be_returned_or_sales_stopped_if_noncompliant Bool)
(declare-const property_insurance_rate_setting_compliant Bool)
(declare-const rate_reference_data_collected Bool)
(declare-const rate_setting_method_defined Bool)
(declare-const rate_within_approved_range Bool)
(declare-const reinsurance_arrangement_defined Bool)
(declare-const reinsurance_evaluation_done Bool)
(declare-const reporting_done Bool)
(declare-const reporting_to_authority_done Bool)
(declare-const required_documents_complete Bool)
(declare-const risk_and_premium_based_on_actuarial_data Bool)
(declare-const risk_control_mechanism_defined Bool)
(declare-const sales_follow_approval_procedures Bool)
(declare-const serious_violation_of_other_specified_articles Bool)
(declare-const signatory_false_or_major_error Bool)
(declare-const signed_by_authorized_personnel Bool)
(declare-const signing_actuary_assigned Bool)
(declare-const signing_actuary_report_fair_and_true Bool)
(declare-const submission_method_compliant Bool)
(declare-const submitted_documents_false Bool)
(declare-const suitability_assessment_for_65_plus_clients Bool)
(declare-const training_for_fair_treatment_of_65_plus Bool)
(declare-const unaccepted_data_retention_period_compliant Bool)
(declare-const unaccepted_data_retention_years Int)
(declare-const underwriting_criteria_defined Bool)
(declare-const underwriting_fairness_and_compliance Bool)
(declare-const underwriting_financial_and_occupational_assessment Bool)
(declare-const underwriting_procedures_compliant Bool)
(declare-const underwriting_processes_defined Bool)
(declare-const underwriting_prohibited_acts_absent Bool)
(declare-const underwriting_staff_qualified Bool)
(declare-const underwriting_staff_qualified_and_trained Bool)
(declare-const underwriting_system_defined Bool)
(declare-const unfair_treatment_of_disabled Bool)
(declare-const unqualified_underwriting Bool)
(declare-const verification_of_income_financial_occupation_done Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:act_144_actuarial_staff_assigned] 保險業聘用精算人員並指派簽證精算人員
(assert (= act_144_actuarial_staff_assigned
   (and actuarial_staff_hired signing_actuary_assigned)))

; [insurance:act_144_external_review_engaged] 保險業聘請外部複核精算人員
(assert (= act_144_external_review_engaged external_actuarial_reviewer_hired))

; [insurance:act_144_board_approval_obtained] 簽證精算人員指派及外部複核精算人員聘請經董（理）事會同意
(assert (= act_144_board_approval_obtained
   (and signing_actuary_assigned
        external_actuarial_reviewer_hired
        board_approval_obtained)))

; [insurance:act_144_reports_fair_and_true] 簽證報告及複核報告內容公正且無虛偽隱匿遺漏錯誤
(assert (= act_144_reports_fair_and_true
   (and signing_actuary_report_fair_and_true
        external_reviewer_report_fair_and_true)))

; [insurance:internal_control_established_and_executed] 保險業建立並執行內部控制及稽核制度
(assert (= internal_control_established_and_executed
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_established_and_executed] 保險業建立並執行內部處理制度及程序
(assert (= internal_handling_established_and_executed
   (and internal_handling_established internal_handling_executed)))

; [insurance:underwriting_staff_qualified_and_trained] 核保人員具資格且接受公平對待65歲以上客戶教育訓練
(assert (= underwriting_staff_qualified_and_trained
   (and underwriting_staff_qualified training_for_fair_treatment_of_65_plus)))

; [insurance:underwriting_procedures_compliant] 核保制度及程序符合規定並包含必要項目
(assert (= underwriting_procedures_compliant
   (and underwriting_system_defined
        underwriting_processes_defined
        underwriting_criteria_defined
        financial_underwriting_mechanism_defined
        medical_investigation_standards_defined
        insurance_reporting_mechanism_defined
        authorization_levels_defined
        reinsurance_arrangement_defined)))

; [insurance:applicant_insured_risk_assessed] 評估要保人與被保險人保險需求及適合度政策符合規定
(assert (= applicant_insured_risk_assessed
   (and applicant_understands_premium_usage
        insurance_amount_and_premium_reasonable
        foreign_currency_risk_assessed
        investment_type_risk_assessed
        investment_type_risk_acknowledged
        no_overselling_beyond_financial_capacity
        no_insurance_for_non_aggressive_investors_with_loans)))

; [insurance:underwriting_financial_and_occupational_assessment] 評估保險金額、保險費與收入、財務狀況及職業相當性
(assert (= underwriting_financial_and_occupational_assessment
   financial_and_occupational_assessment_done))

; [insurance:income_financial_verification_for_certain_insurances] 一定保險金額以上人壽、傷害及旅行平安保險查證收入財務職業資訊合理可信
(assert (= income_financial_verification_for_certain_insurances
   verification_of_income_financial_occupation_done))

; [insurance:suitability_assessment_for_65_plus_clients] 評估銷售有解約金保險商品予65歲以上客戶之適當性
(assert (= suitability_assessment_for_65_plus_clients
   assessment_of_65_plus_clients_done))

; [insurance:premium_source_assessment] 評估繳交保險費資金來源是否為解約、貸款或保險單借款
(assert (= premium_source_assessment premium_source_assessed))

; [insurance:applicant_and_insured_identity_confirmed] 確認要保人及被保險人身分及同意程序
(assert (= applicant_and_insured_identity_confirmed
   (and applicant_identity_confirmed
        insured_identity_confirmed
        insured_consent_confirmed)))

; [insurance:beneficiary_designation_confirmed] 確認受益人指定或變更經被保險人同意
(assert (= beneficiary_designation_confirmed
   beneficiary_designation_or_change_consented))

; [insurance:contract_change_and_signature_confirmed] 確認保險契約變更及要保人被保險人身分及簽章程序
(assert (= contract_change_and_signature_confirmed
   (and contract_change_affecting_risk_assessed
        applicant_and_insured_identity_and_signature_confirmed)))

; [insurance:personal_data_preservation_compliant] 保存承保及未承保件個人資料符合規定
(assert (= personal_data_preservation_compliant
   (and (>= 5 unaccepted_data_retention_years)
        personal_data_handled_per_pdp_law
        personal_data_deleted_after_retention)))

; [insurance:underwriting_fairness_and_compliance] 核保作業基於精算及統計資料且無不公平待遇
(assert (= underwriting_fairness_and_compliance
   (and risk_and_premium_based_on_actuarial_data
        (not unfair_treatment_of_disabled))))

; [insurance:underwriting_prohibited_acts_absent] 無未具資格核保、未依商品內容評估、保單追溯生效等禁止行為
(assert (= underwriting_prohibited_acts_absent
   (and (not unqualified_underwriting)
        (not no_product_content_assessment)
        (not policy_backdating)
        (not no_signature_or_proof_of_intent)
        (not no_financial_underwriting_or_reporting)
        (not no_premium_source_assessment)
        (not other_harmful_acts))))

; [insurance:exemptions_for_certain_insurance_products] 財產保險、微型保險及特定保險商品得不適用部分規定
(assert (= exemptions_for_certain_insurance_products exemptions_applied))

; [insurance:reporting_to_authority_done] 依規定報主管機關備查
(assert (= reporting_to_authority_done reporting_done))

; [insurance:insurance_reporting_mechanism_operational] 保險通報機制運作正常
(assert (= insurance_reporting_mechanism_operational
   insurance_reporting_mechanism_implemented))

; [insurance:unaccepted_data_retention_period_compliant] 未承保資料保存期限符合規定
(assert (let ((a!1 (or (>= 5 unaccepted_data_retention_years)
               (and (not (<= unaccepted_data_retention_years 5))
                    extended_retention_due_to_dispute))))
  (= unaccepted_data_retention_period_compliant a!1)))

; [insurance:business_execution_compliant] 保險業確實執行招攬、核保及理賠制度及程序
(assert (= business_execution_compliant business_execution_per_regulations))

; [insurance:personnel_disciplinary_action_taken] 對未依規定執行業務之人員予以警告或適當處置
(assert (= personnel_disciplinary_action_taken disciplinary_action_taken))

; [insurance:property_insurance_rate_setting_compliant] 財產保險商品費率釐訂符合規定及合理性
(assert (= property_insurance_rate_setting_compliant
   (and benefit_items_set
        rate_reference_data_collected
        experience_data_recent_and_relevant
        domestic_data_primary
        foreign_data_used_if_no_domestic
        rate_setting_method_defined
        reinsurance_evaluation_done
        risk_control_mechanism_defined
        rate_within_approved_range)))

; [insurance:product_must_be_returned_or_sales_stopped_if_noncompliant] 保險商品有重大不符規定情形時主管機關得退回或停止銷售
(assert (= product_must_be_returned_or_sales_stopped_if_noncompliant
   (or (not sales_follow_approval_procedures)
       (not signed_by_authorized_personnel)
       (not submission_method_compliant)
       signatory_false_or_major_error
       (not required_documents_complete)
       content_has_major_errors_or_omissions
       (not corrections_completed_within_65_working_days)
       content_violates_law_severely
       (not corrections_completed_within_35_working_days)
       (<= 3 cumulative_rejection_count)
       submitted_documents_false
       serious_violation_of_other_specified_articles)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法條規定時處罰
(assert (= penalty
   (or (not applicant_and_insured_identity_confirmed)
       (not underwriting_prohibited_acts_absent)
       (not act_144_board_approval_obtained)
       (not act_144_reports_fair_and_true)
       (not act_144_external_review_engaged)
       (not property_insurance_rate_setting_compliant)
       (not premium_source_assessment)
       (not underwriting_procedures_compliant)
       (not act_144_actuarial_staff_assigned)
       (not reporting_to_authority_done)
       (not exemptions_for_certain_insurance_products)
       (not personnel_disciplinary_action_taken)
       product_must_be_returned_or_sales_stopped_if_noncompliant
       (not suitability_assessment_for_65_plus_clients)
       (not underwriting_fairness_and_compliance)
       (not internal_handling_established_and_executed)
       (not beneficiary_designation_confirmed)
       (not internal_control_established_and_executed)
       (not underwriting_financial_and_occupational_assessment)
       (not contract_change_and_signature_confirmed)
       (not insurance_reporting_mechanism_operational)
       (not income_financial_verification_for_certain_insurances)
       (not personal_data_preservation_compliant)
       (not business_execution_compliant)
       (not underwriting_staff_qualified_and_trained)
       (not unaccepted_data_retention_period_compliant)
       (not applicant_insured_risk_assessed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= actuarial_staff_hired false))
(assert (= signing_actuary_assigned false))
(assert (= external_actuarial_reviewer_hired false))
(assert (= board_approval_obtained false))
(assert (= signing_actuary_report_fair_and_true false))
(assert (= external_reviewer_report_fair_and_true false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= underwriting_staff_qualified false))
(assert (= training_for_fair_treatment_of_65_plus false))
(assert (= underwriting_system_defined false))
(assert (= underwriting_processes_defined false))
(assert (= underwriting_criteria_defined false))
(assert (= financial_underwriting_mechanism_defined false))
(assert (= medical_investigation_standards_defined false))
(assert (= insurance_reporting_mechanism_defined false))
(assert (= insurance_reporting_mechanism_implemented false))
(assert (= authorization_levels_defined false))
(assert (= reinsurance_arrangement_defined false))
(assert (= applicant_understands_premium_usage false))
(assert (= insurance_amount_and_premium_reasonable false))
(assert (= foreign_currency_risk_assessed false))
(assert (= investment_type_risk_assessed false))
(assert (= investment_type_risk_acknowledged false))
(assert (= no_overselling_beyond_financial_capacity false))
(assert (= no_insurance_for_non_aggressive_investors_with_loans false))
(assert (= financial_and_occupational_assessment_done false))
(assert (= verification_of_income_financial_occupation_done false))
(assert (= assessment_of_65_plus_clients_done false))
(assert (= premium_source_assessed false))
(assert (= applicant_identity_confirmed true))
(assert (= insured_identity_confirmed true))
(assert (= insured_consent_confirmed true))
(assert (= applicant_and_insured_identity_and_signature_confirmed true))
(assert (= beneficiary_designation_or_change_consented true))
(assert (= benefit_items_set false))
(assert (= rate_reference_data_collected false))
(assert (= experience_data_recent_and_relevant false))
(assert (= domestic_data_primary false))
(assert (= foreign_data_used_if_no_domestic false))
(assert (= rate_setting_method_defined false))
(assert (= reinsurance_evaluation_done false))
(assert (= risk_control_mechanism_defined false))
(assert (= rate_within_approved_range false))
(assert (= reporting_done false))
(assert (= personal_data_handled_per_pdp_law true))
(assert (= personal_data_deleted_after_retention true))
(assert (= unaccepted_data_retention_years 5))
(assert (= extended_retention_due_to_dispute false))
(assert (= unqualified_underwriting true))
(assert (= no_product_content_assessment true))
(assert (= policy_backdating false))
(assert (= no_signature_or_proof_of_intent false))
(assert (= no_financial_underwriting_or_reporting true))
(assert (= no_premium_source_assessment true))
(assert (= other_harmful_acts true))
(assert (= unfair_treatment_of_disabled false))
(assert (= exemptions_applied false))
(assert (= reporting_to_authority_done false))
(assert (= internal_handling_established_and_executed false))
(assert (= internal_control_established_and_executed false))
(assert (= underwriting_staff_qualified_and_trained false))
(assert (= underwriting_procedures_compliant false))
(assert (= applicant_insured_risk_assessed false))
(assert (= underwriting_financial_and_occupational_assessment false))
(assert (= income_financial_verification_for_certain_insurances false))
(assert (= suitability_assessment_for_65_plus_clients false))
(assert (= premium_source_assessment false))
(assert (= applicant_and_insured_identity_confirmed true))
(assert (= beneficiary_designation_confirmed true))
(assert (= contract_change_affecting_risk_assessed false))
(assert (= contract_change_and_signature_confirmed false))
(assert (= personal_data_preservation_compliant true))
(assert (= underwriting_fairness_and_compliance false))
(assert (= underwriting_prohibited_acts_absent false))
(assert (= exemptions_for_certain_insurance_products false))
(assert (= business_execution_per_regulations false))
(assert (= business_execution_compliant false))
(assert (= disciplinary_action_taken false))
(assert (= personnel_disciplinary_action_taken false))
(assert (= property_insurance_rate_setting_compliant false))
(assert (= content_violates_law_severely true))
(assert (= signed_by_authorized_personnel false))
(assert (= content_has_major_errors_or_omissions true))
(assert (= submitted_documents_false false))
(assert (= signatory_false_or_major_error false))
(assert (= sales_follow_approval_procedures false))
(assert (= submission_method_compliant false))
(assert (= required_documents_complete false))
(assert (= serious_violation_of_other_specified_articles true))
(assert (= corrections_completed_within_65_working_days false))
(assert (= corrections_completed_within_35_working_days false))
(assert (= cumulative_rejection_count 3))
(assert (= penalty true))
(assert (= product_must_be_returned_or_sales_stopped_if_noncompliant true))
(assert (= act_144_actuarial_staff_assigned false))
(assert (= act_144_board_approval_obtained false))
(assert (= act_144_external_review_engaged false))
(assert (= act_144_reports_fair_and_true false))
(assert (= insurance_reporting_mechanism_operational false))
(assert (= risk_and_premium_based_on_actuarial_data false))
(assert (= unaccepted_data_retention_period_compliant false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 29
; Total variables: 104
; Total facts: 104
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
