; SMT2 file generated from compliance case automatic
; Case ID: case_83
; Generated at: 2025-10-19T07:31:05.933961
;
; This file can be executed with Z3:
;   z3 case_83.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_plan_approved_by_board Bool)
(declare-const adjustment_plan_reported_to_authority Bool)
(declare-const adjustment_plan_set_within_one_month Bool)
(declare-const business_execution_compliance Bool)
(declare-const business_execution_done Bool)
(declare-const dispute_processing_continued Bool)
(declare-const dispute_processing_extension_years Int)
(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const financial_underwriting_mechanism_reported Bool)
(declare-const foreign_investment_adjustment_plan_compliance Bool)
(declare-const foreign_investment_adjustment_plan_violation_count Int)
(declare-const foreign_investment_approval_compliance Bool)
(declare-const foreign_investment_approval_revoked Bool)
(declare-const foreign_investment_approved Bool)
(declare-const foreign_investment_documents_submitted Bool)
(declare-const foreign_investment_financial_report_ok Bool)
(declare-const foreign_investment_funds_compliant Bool)
(declare-const foreign_investment_internal_control_ok Bool)
(declare-const foreign_investment_risk_management_ok Bool)
(declare-const insurance_notification_mechanism_defined Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const investor_risk_assessment_reported Bool)
(declare-const longer_retention_law_applied Bool)
(declare-const notification_data_reported Bool)
(declare-const operational_procedures_reported Bool)
(declare-const penalty Bool)
(declare-const personal_data_protection_law_complied Bool)
(declare-const product_type_micro_insurance Bool)
(declare-const product_type_other_special Bool)
(declare-const product_type_property_insurance Bool)
(declare-const public_explanation_provided Bool)
(declare-const reinsurance_mechanism_compliant Bool)
(declare-const reinsurance_risk_spread_compliance Bool)
(declare-const report_content_truthful Bool)
(declare-const report_to_authority_on_time Bool)
(declare-const underwriting_documents_retained Bool)
(declare-const underwriting_exceptions_applied Bool)
(declare-const underwriting_fair_treatment Bool)
(declare-const underwriting_financial_source_checked Bool)
(declare-const underwriting_process_documented Bool)
(declare-const underwriting_processing_compliance Bool)
(declare-const underwriting_query_system_used Bool)
(declare-const underwriting_reported_to_authority Bool)
(declare-const underwriting_risk_assessment_done Bool)
(declare-const underwriting_signature_verified Bool)
(declare-const underwriting_staff_qualified Bool)
(declare-const uninsured_data_retention_period_years Int)
(declare-const uninsured_personal_data_retention_compliant Bool)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反保險法第148條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_1_or_2))

; [insurance:violate_148_2_1] 違反保險法第148條之二第一項規定，未提供說明文件或說明文件不實
(assert (= violate_148_2_1
   (or (not explanation_document_truthful)
       (not explanation_document_provided)
       (not explanation_document_compliant))))

; [insurance:violate_148_2_2] 違反保險法第148條之二第二項規定，未依限報告或公開說明，或內容不實
(assert (= violate_148_2_2
   (or (not report_content_truthful)
       (not public_explanation_provided)
       (not report_to_authority_on_time))))

; [insurance:violate_148_3_1] 違反保險法第148條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反保險法第148條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:internal_control_and_audit_ok] 建立且執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立且執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:underwriting_processing_compliance] 核保處理制度及程序符合招攬及核保理賠辦法第7條規定
(assert (= underwriting_processing_compliance
   (and underwriting_staff_qualified
        underwriting_process_documented
        underwriting_risk_assessment_done
        underwriting_fair_treatment
        underwriting_signature_verified
        underwriting_financial_source_checked
        underwriting_documents_retained)))

; [insurance:underwriting_exceptions_applied] 財務核保機制、生調體檢標準及部分作業程序得不適用於特定保險商品
(assert (= underwriting_exceptions_applied
   (or product_type_other_special
       product_type_property_insurance
       product_type_micro_insurance)))

; [insurance:underwriting_reported_to_authority] 依規定報主管機關備查
(assert (= underwriting_reported_to_authority
   (and financial_underwriting_mechanism_reported
        investor_risk_assessment_reported
        operational_procedures_reported)))

; [insurance:insurance_notification_mechanism_defined] 保險通報機制定義及執行
(assert (= insurance_notification_mechanism_defined
   (and notification_data_reported underwriting_query_system_used)))

; [insurance:uninsured_personal_data_retention_compliant] 未承保件個人資料保存程序符合規定
(assert (let ((a!1 (or (not longer_retention_law_applied)
               (and dispute_processing_continued
                    (>= 1.0 (to_real dispute_processing_extension_years))))))
  (= uninsured_personal_data_retention_compliant
     (and (>= 5.0 (to_real uninsured_data_retention_period_years))
          a!1
          personal_data_protection_law_complied))))

; [insurance:business_execution_compliance] 確實執行招攬、核保及理賠處理制度及程序
(assert (= business_execution_compliance business_execution_done))

; [insurance:reinsurance_risk_spread_compliance] 再保險分出分入及其他危險分散機制符合規定
(assert (= reinsurance_risk_spread_compliance reinsurance_mechanism_compliant))

; [insurance:foreign_investment_approval_compliance] 國外投資管理符合核准及相關規定
(assert (= foreign_investment_approval_compliance
   (and foreign_investment_approved
        foreign_investment_funds_compliant
        foreign_investment_documents_submitted
        foreign_investment_internal_control_ok
        foreign_investment_risk_management_ok
        foreign_investment_financial_report_ok)))

; [insurance:foreign_investment_adjustment_plan_compliance] 國外投資調整計畫訂定及報送符合規定
(assert (= foreign_investment_adjustment_plan_compliance
   (or foreign_investment_funds_compliant
       (and adjustment_plan_set_within_one_month
            adjustment_plan_approved_by_board
            adjustment_plan_reported_to_authority))))

; [insurance:foreign_investment_approval_revoked] 國外投資額度核准被廢止
(assert (let ((a!1 (and (or (not foreign_investment_adjustment_plan_compliance)
                    (not (<= foreign_investment_adjustment_plan_violation_count
                             1)))
                foreign_investment_approved)))
  (= foreign_investment_approval_revoked a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or (not internal_control_and_audit_ok)
       violate_148_3_2
       foreign_investment_approval_revoked
       (not foreign_investment_approval_compliance)
       (not business_execution_compliance)
       (not underwriting_processing_compliance)
       (not internal_handling_ok)
       violate_148_3_1
       (not insurance_notification_mechanism_defined)
       (not underwriting_reported_to_authority)
       (not uninsured_personal_data_retention_compliant)
       violate_148_1_2
       (not reinsurance_risk_spread_compliance)
       violate_148_2_1
       violate_148_2_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 false))
(assert (= violate_148_3_2 false))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= underwriting_staff_qualified false))
(assert (= underwriting_process_documented false))
(assert (= underwriting_risk_assessment_done false))
(assert (= underwriting_fair_treatment false))
(assert (= underwriting_signature_verified false))
(assert (= underwriting_financial_source_checked false))
(assert (= underwriting_documents_retained true))
(assert (= underwriting_processing_compliance false))
(assert (= underwriting_reported_to_authority true))
(assert (= insurance_notification_mechanism_defined true))
(assert (= uninsured_personal_data_retention_compliant true))
(assert (= business_execution_done true))
(assert (= business_execution_compliance true))
(assert (= reinsurance_mechanism_compliant true))
(assert (= reinsurance_risk_spread_compliance true))
(assert (= foreign_investment_approved true))
(assert (= foreign_investment_funds_compliant true))
(assert (= foreign_investment_documents_submitted true))
(assert (= foreign_investment_internal_control_ok true))
(assert (= foreign_investment_risk_management_ok true))
(assert (= foreign_investment_financial_report_ok true))
(assert (= foreign_investment_approval_compliance true))
(assert (= foreign_investment_adjustment_plan_compliance true))
(assert (= foreign_investment_adjustment_plan_violation_count 0))
(assert (= foreign_investment_approval_revoked false))
(assert (= adjustment_plan_approved_by_board false))
(assert (= adjustment_plan_reported_to_authority false))
(assert (= adjustment_plan_set_within_one_month false))
(assert (= explanation_document_provided true))
(assert (= explanation_document_compliant true))
(assert (= explanation_document_truthful true))
(assert (= report_to_authority_on_time true))
(assert (= public_explanation_provided true))
(assert (= report_content_truthful true))
(assert (= financial_underwriting_mechanism_reported true))
(assert (= investor_risk_assessment_reported true))
(assert (= operational_procedures_reported true))
(assert (= notification_data_reported true))
(assert (= underwriting_query_system_used true))
(assert (= product_type_property_insurance true))
(assert (= product_type_micro_insurance false))
(assert (= product_type_other_special false))
(assert (= dispute_processing_continued true))
(assert (= dispute_processing_extension_years 0))
(assert (= longer_retention_law_applied false))
(assert (= personal_data_protection_law_complied true))
(assert (= penalty true))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_ok false))
(assert (= underwriting_exceptions_applied false))
(assert (= uninsured_data_retention_period_years 0))
(assert (= violate_148_1_1_or_2 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 61
; Total facts: 61
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
