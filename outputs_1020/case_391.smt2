; SMT2 file generated from compliance case automatic
; Case ID: case_391
; Generated at: 2025-10-19T14:42:20.518146
;
; This file can be executed with Z3:
;   z3 case_391.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_execution_compliance Bool)
(declare-const business_execution_done Bool)
(declare-const business_execution_penalty_needed Bool)
(declare-const business_recruitment_65plus_risk_assessed Bool)
(declare-const business_recruitment_agent_management_compliant Bool)
(declare-const business_recruitment_channel_rules_defined Bool)
(declare-const business_recruitment_compensation_linked Bool)
(declare-const business_recruitment_compliance Bool)
(declare-const business_recruitment_contract_defined Bool)
(declare-const business_recruitment_customer_eligibility_checked Bool)
(declare-const business_recruitment_customer_info_collected Bool)
(declare-const business_recruitment_customer_needs_assessed Bool)
(declare-const business_recruitment_defined Bool)
(declare-const business_recruitment_fee_management Bool)
(declare-const business_recruitment_honest_report Bool)
(declare-const business_recruitment_premium_source_checked Bool)
(declare-const business_recruitment_product_suitability_policy Bool)
(declare-const business_recruitment_prohibited_acts_avoided Bool)
(declare-const business_recruitment_qualification Bool)
(declare-const business_recruitment_recording_65plus_sales Bool)
(declare-const business_recruitment_recording_reviewed Bool)
(declare-const business_recruitment_recording_saved_5years Bool)
(declare-const business_recruitment_training_65plus Bool)
(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const penalty Bool)
(declare-const public_explanation_provided Bool)
(declare-const report_content_truthful Bool)
(declare-const report_to_authority_on_time Bool)
(declare-const underwriting_appropriate_approval Bool)
(declare-const underwriting_beneficiary_confirmed Bool)
(declare-const underwriting_compliance Bool)
(declare-const underwriting_contract_change_confirmed Bool)
(declare-const underwriting_customer_needs_assessed Bool)
(declare-const underwriting_defined Bool)
(declare-const underwriting_financial_source_checked Bool)
(declare-const underwriting_financial_underwriting_implemented Bool)
(declare-const underwriting_identity_confirmed Bool)
(declare-const underwriting_no_harm_to_rights Bool)
(declare-const underwriting_no_unfair_treatment Bool)
(declare-const underwriting_no_unqualified_staff Bool)
(declare-const underwriting_personal_data_protected Bool)
(declare-const underwriting_process_defined Bool)
(declare-const underwriting_product_suitability_assessed Bool)
(declare-const underwriting_training_65plus Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_1_2_flag Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_2_flag))

; [insurance:violate_148_2_1] 違反第一百四十八條之二第一項規定：未提供說明文件供查閱、或說明文件未依規定記載、或說明文件記載不實
(assert (= violate_148_2_1
   (or (not explanation_document_truthful)
       (not explanation_document_compliant)
       (not explanation_document_provided))))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定：未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2
   (or (not report_to_authority_on_time)
       (not report_content_truthful)
       (not public_explanation_provided))))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:internal_control_ok] 建立內部控制及稽核制度且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:business_recruitment_compliance] 保險業招攬及核保理賠辦法第6條規定之招攬制度及程序符合要求
(assert (= business_recruitment_compliance
   (and business_recruitment_defined
        business_recruitment_training_65plus
        business_recruitment_qualification
        business_recruitment_compensation_linked
        business_recruitment_fee_management
        business_recruitment_channel_rules_defined
        business_recruitment_customer_info_collected
        business_recruitment_customer_eligibility_checked
        business_recruitment_customer_needs_assessed
        business_recruitment_premium_source_checked
        business_recruitment_65plus_risk_assessed
        business_recruitment_product_suitability_policy
        business_recruitment_honest_report
        business_recruitment_prohibited_acts_avoided
        business_recruitment_agent_management_compliant
        business_recruitment_contract_defined
        business_recruitment_recording_65plus_sales
        business_recruitment_recording_reviewed
        business_recruitment_recording_saved_5years)))

; [insurance:underwriting_compliance] 保險業招攬及核保理賠辦法第7條規定之核保制度及程序符合要求
(assert (= underwriting_compliance
   (and underwriting_defined
        underwriting_training_65plus
        underwriting_process_defined
        underwriting_customer_needs_assessed
        underwriting_product_suitability_assessed
        underwriting_financial_underwriting_implemented
        underwriting_identity_confirmed
        underwriting_beneficiary_confirmed
        underwriting_contract_change_confirmed
        underwriting_personal_data_protected
        underwriting_no_unqualified_staff
        underwriting_appropriate_approval
        underwriting_no_unfair_treatment
        underwriting_financial_source_checked
        underwriting_no_harm_to_rights)))

; [insurance:business_execution_compliance] 保險業確實執行依第六條、第七條、第八條及前條所訂定之招攬、核保及理賠處理制度及程序
(assert (= business_execution_compliance business_execution_done))

; [insurance:business_execution_penalty_needed] 招攬、核保及理賠人員未依規定執行業務
(assert (not (= business_execution_compliance business_execution_penalty_needed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關條文或未依規定執行業務時處罰
(assert (= penalty
   (or violate_148_1_2
       violate_148_2_1
       violate_148_2_2
       violate_148_3_1
       violate_148_3_2
       (not business_execution_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_3_2 true))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= violate_148_3_1 false))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= violate_148_1_2_flag false))
(assert (= violate_148_1_2 false))
(assert (= business_execution_done false))
(assert (= business_execution_compliance false))
(assert (= business_execution_penalty_needed true))
(assert (= business_recruitment_defined false))
(assert (= business_recruitment_training_65plus false))
(assert (= business_recruitment_qualification false))
(assert (= business_recruitment_compensation_linked false))
(assert (= business_recruitment_fee_management false))
(assert (= business_recruitment_channel_rules_defined false))
(assert (= business_recruitment_customer_info_collected false))
(assert (= business_recruitment_customer_eligibility_checked false))
(assert (= business_recruitment_customer_needs_assessed false))
(assert (= business_recruitment_premium_source_checked false))
(assert (= business_recruitment_65plus_risk_assessed false))
(assert (= business_recruitment_product_suitability_policy false))
(assert (= business_recruitment_honest_report false))
(assert (= business_recruitment_prohibited_acts_avoided false))
(assert (= business_recruitment_agent_management_compliant false))
(assert (= business_recruitment_contract_defined false))
(assert (= business_recruitment_recording_65plus_sales false))
(assert (= business_recruitment_recording_reviewed false))
(assert (= business_recruitment_recording_saved_5years false))
(assert (= underwriting_defined false))
(assert (= underwriting_training_65plus false))
(assert (= underwriting_process_defined false))
(assert (= underwriting_customer_needs_assessed false))
(assert (= underwriting_product_suitability_assessed false))
(assert (= underwriting_financial_underwriting_implemented false))
(assert (= underwriting_identity_confirmed false))
(assert (= underwriting_beneficiary_confirmed false))
(assert (= underwriting_contract_change_confirmed false))
(assert (= underwriting_personal_data_protected false))
(assert (= underwriting_no_unqualified_staff false))
(assert (= underwriting_appropriate_approval false))
(assert (= underwriting_no_unfair_treatment false))
(assert (= underwriting_financial_source_checked false))
(assert (= underwriting_no_harm_to_rights false))
(assert (= underwriting_compliance false))
(assert (= explanation_document_provided true))
(assert (= explanation_document_compliant true))
(assert (= explanation_document_truthful true))
(assert (= report_to_authority_on_time true))
(assert (= public_explanation_provided true))
(assert (= report_content_truthful true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= business_recruitment_compliance false))
(assert (= internal_control_ok false))
(assert (= internal_handling_ok false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 58
; Total facts: 58
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
