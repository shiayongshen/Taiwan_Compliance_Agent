; SMT2 file generated from compliance case automatic
; Case ID: case_367
; Generated at: 2025-10-19T14:09:33.186076
;
; This file can be executed with Z3:
;   z3 case_367.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_execution_compliance Bool)
(declare-const business_execution_followed Bool)
(declare-const business_execution_penalty_needed Bool)
(declare-const business_recruitment_agent_management_followed Bool)
(declare-const business_recruitment_channel_rules_defined Bool)
(declare-const business_recruitment_compensation_linked Bool)
(declare-const business_recruitment_compliance Bool)
(declare-const business_recruitment_contract_requirements_met Bool)
(declare-const business_recruitment_customer_eligibility_checked Bool)
(declare-const business_recruitment_customer_info_collected Bool)
(declare-const business_recruitment_customer_needs_assessed Bool)
(declare-const business_recruitment_elderly_client_risk_assessed Bool)
(declare-const business_recruitment_fee_collection_managed Bool)
(declare-const business_recruitment_honest_report_fulfilled Bool)
(declare-const business_recruitment_other_regulations_complied Bool)
(declare-const business_recruitment_post_sale_followup_done Bool)
(declare-const business_recruitment_premium_source_checked Bool)
(declare-const business_recruitment_product_suitability_policy_defined Bool)
(declare-const business_recruitment_prohibited_acts_avoided Bool)
(declare-const business_recruitment_recording_and_review_done Bool)
(declare-const business_recruitment_recording_contents_complete Bool)
(declare-const business_recruitment_recording_retained Bool)
(declare-const business_recruitment_system_defined Bool)
(declare-const business_recruitment_training_annual Bool)
(declare-const explanation_document_properly_recorded Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const penalty Bool)
(declare-const public_explanation_provided Bool)
(declare-const report_or_explanation_truthful Bool)
(declare-const reported_to_authority_on_time Bool)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_1_or_2))

; [insurance:violate_148_2_1] 違反第一百四十八條之二第一項規定：未提供說明文件供查閱、或說明文件未依規定記載、或說明文件記載不實
(assert (= violate_148_2_1
   (or (not explanation_document_provided)
       (not explanation_document_truthful)
       (not explanation_document_properly_recorded))))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定：未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2
   (or (not report_or_explanation_truthful)
       (not public_explanation_provided)
       (not reported_to_authority_on_time))))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:internal_control_and_audit_ok] 建立並執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立並執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:business_recruitment_compliance] 保險業招攬及核保理賠辦法第6條規定之招攬制度及程序符合要求
(assert (= business_recruitment_compliance
   (and business_recruitment_system_defined
        business_recruitment_training_annual
        business_recruitment_compensation_linked
        business_recruitment_fee_collection_managed
        business_recruitment_channel_rules_defined
        business_recruitment_customer_info_collected
        business_recruitment_customer_eligibility_checked
        business_recruitment_customer_needs_assessed
        business_recruitment_premium_source_checked
        business_recruitment_elderly_client_risk_assessed
        business_recruitment_product_suitability_policy_defined
        business_recruitment_honest_report_fulfilled
        business_recruitment_prohibited_acts_avoided
        business_recruitment_agent_management_followed
        business_recruitment_contract_requirements_met
        business_recruitment_recording_and_review_done
        business_recruitment_recording_contents_complete
        business_recruitment_recording_retained
        business_recruitment_post_sale_followup_done
        business_recruitment_other_regulations_complied)))

; [insurance:business_execution_compliance] 保險業確實執行招攬、核保及理賠制度及程序
(assert (= business_execution_compliance business_execution_followed))

; [insurance:business_execution_penalty_needed] 招攬、核保及理賠人員未依規定執行業務
(assert (not (= business_execution_followed business_execution_penalty_needed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反148-1-2、148-2-1、148-2-2、148-3-1、148-3-2規定，或招攬核保理賠人員未依規定執行業務時處罰
(assert (= penalty
   (or violate_148_2_1
       violate_148_3_2
       violate_148_1_2
       business_execution_penalty_needed
       violate_148_3_1
       violate_148_2_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_1_or_2 true))
(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 false))
(assert (= violate_148_3_2 false))
(assert (= business_execution_followed false))
(assert (= business_execution_compliance false))
(assert (= business_execution_penalty_needed true))
(assert (= business_recruitment_system_defined false))
(assert (= business_recruitment_training_annual false))
(assert (= business_recruitment_compensation_linked false))
(assert (= business_recruitment_fee_collection_managed false))
(assert (= business_recruitment_channel_rules_defined false))
(assert (= business_recruitment_customer_info_collected false))
(assert (= business_recruitment_customer_eligibility_checked false))
(assert (= business_recruitment_customer_needs_assessed false))
(assert (= business_recruitment_premium_source_checked false))
(assert (= business_recruitment_elderly_client_risk_assessed false))
(assert (= business_recruitment_product_suitability_policy_defined false))
(assert (= business_recruitment_honest_report_fulfilled false))
(assert (= business_recruitment_prohibited_acts_avoided false))
(assert (= business_recruitment_agent_management_followed false))
(assert (= business_recruitment_contract_requirements_met false))
(assert (= business_recruitment_recording_and_review_done false))
(assert (= business_recruitment_recording_contents_complete false))
(assert (= business_recruitment_recording_retained false))
(assert (= business_recruitment_post_sale_followup_done false))
(assert (= business_recruitment_other_regulations_complied false))
(assert (= explanation_document_provided true))
(assert (= explanation_document_properly_recorded true))
(assert (= explanation_document_truthful true))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= internal_control_and_audit_ok true))
(assert (= internal_handling_ok true))
(assert (= public_explanation_provided true))
(assert (= reported_to_authority_on_time true))
(assert (= report_or_explanation_truthful true))
(assert (= penalty true))
(assert (= business_recruitment_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 43
; Total facts: 43
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
