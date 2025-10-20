; SMT2 file generated from compliance case automatic
; Case ID: case_345
; Generated at: 2025-10-19T13:39:56.140069
;
; This file can be executed with Z3:
;   z3 case_345.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const applicant_foreign_currency_risk_assessed Bool)
(declare-const applicant_insurance_amount_and_premium_reasonable Bool)
(declare-const applicant_understands_premium_usage Bool)
(declare-const financial_check_procedure_implemented Bool)
(declare-const inappropriate_product_offered Bool)
(declare-const insurance_notification_mechanism_compliance Bool)
(declare-const insurance_reporting_compliance Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_compliance_full Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_compliance_full Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const investment_type_risk_assessed Bool)
(declare-const investment_type_understood Bool)
(declare-const non_aggressive_investor_loan_premium Bool)
(declare-const notification_mechanism_executed Bool)
(declare-const penalty Bool)
(declare-const personal_data_preservation_compliance Bool)
(declare-const personal_data_preservation_procedure_compliant Bool)
(declare-const report_to_authority_completed Bool)
(declare-const staff_discipline_executed Bool)
(declare-const underwriting_appropriateness_compliance Bool)
(declare-const underwriting_execution_compliance Bool)
(declare-const underwriting_financial_check_compliance Bool)
(declare-const underwriting_financial_mechanism_defined Bool)
(declare-const underwriting_guidelines_defined Bool)
(declare-const underwriting_medical_standards_defined Bool)
(declare-const underwriting_policy_compliance Bool)
(declare-const underwriting_policy_executed Bool)
(declare-const underwriting_qualification_compliance Bool)
(declare-const underwriting_staff_discipline Bool)
(declare-const underwriting_staff_qualified Bool)
(declare-const underwriting_systems_executed Bool)
(declare-const underwriting_training_completed Bool)
(declare-const underwriting_training_compliance Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_control_executed] 執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:internal_handling_executed] 執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:internal_control_compliance] 內部控制及稽核制度建立且執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance] 內部處理制度及程序建立且執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [insurance:underwriting_training_compliance] 核保人員每年參加公平對待65歲以上客戶相關教育訓練
(assert (= underwriting_training_compliance underwriting_training_completed))

; [insurance:underwriting_qualification_compliance] 核保人員具資格執行核保簽署作業
(assert (= underwriting_qualification_compliance underwriting_staff_qualified))

; [insurance:underwriting_policy_compliance] 核保政策符合規定且執行
(assert (= underwriting_policy_compliance
   (and underwriting_guidelines_defined
        underwriting_financial_mechanism_defined
        underwriting_medical_standards_defined
        underwriting_policy_executed)))

; [insurance:underwriting_appropriateness_compliance] 評估要保人與被保險人保險需求及適合度政策符合規定
(assert (= underwriting_appropriateness_compliance
   (and applicant_understands_premium_usage
        applicant_insurance_amount_and_premium_reasonable
        applicant_foreign_currency_risk_assessed
        investment_type_risk_assessed
        investment_type_understood
        (not inappropriate_product_offered)
        (not non_aggressive_investor_loan_premium))))

; [insurance:underwriting_financial_check_compliance] 評估保險金額、保險費與要保人或被保險人收入、財務狀況與職業相當性程序符合規定
(assert (= underwriting_financial_check_compliance
   financial_check_procedure_implemented))

; [insurance:insurance_reporting_compliance] 依規定報主管機關備查
(assert (= insurance_reporting_compliance report_to_authority_completed))

; [insurance:insurance_notification_mechanism_compliance] 保險通報機制執行及查詢作業符合規定
(assert (= insurance_notification_mechanism_compliance notification_mechanism_executed))

; [insurance:personal_data_preservation_compliance] 未承保件個人資料保存程序符合規定
(assert (= personal_data_preservation_compliance
   personal_data_preservation_procedure_compliant))

; [insurance:underwriting_execution_compliance] 依第六條、第七條、第八條及前條所訂定之招攬、核保及理賠處理制度及程序確實執行
(assert (= underwriting_execution_compliance underwriting_systems_executed))

; [insurance:underwriting_staff_discipline] 對未依規定執行業務之招攬、核保及理賠人員予以警告或適當處置
(assert (= underwriting_staff_discipline staff_discipline_executed))

; [insurance:internal_control_compliance_full] 內部控制及稽核制度建立且執行符合規定
(assert (= internal_control_compliance_full
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance_full] 內部處理制度及程序建立且執行符合規定
(assert (= internal_handling_compliance_full
   (and internal_handling_established internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行內部控制或稽核制度，或未建立或未執行內部處理制度或程序時處罰
(assert (= penalty
   (or (not internal_control_compliance_full)
       (not internal_handling_compliance_full))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= notification_mechanism_executed false))
(assert (= insurance_notification_mechanism_compliance false))
(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed true))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_system_executed true))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= penalty true))
(assert (= report_to_authority_completed true))
(assert (= personal_data_preservation_procedure_compliant true))
(assert (= personal_data_preservation_compliance true))
(assert (= underwriting_training_completed true))
(assert (= underwriting_training_compliance true))
(assert (= underwriting_staff_qualified true))
(assert (= underwriting_qualification_compliance true))
(assert (= underwriting_guidelines_defined true))
(assert (= underwriting_financial_mechanism_defined true))
(assert (= underwriting_medical_standards_defined true))
(assert (= underwriting_policy_executed true))
(assert (= underwriting_policy_compliance true))
(assert (= applicant_understands_premium_usage true))
(assert (= applicant_insurance_amount_and_premium_reasonable true))
(assert (= applicant_foreign_currency_risk_assessed true))
(assert (= investment_type_risk_assessed true))
(assert (= investment_type_understood true))
(assert (= inappropriate_product_offered false))
(assert (= non_aggressive_investor_loan_premium false))
(assert (= financial_check_procedure_implemented true))
(assert (= underwriting_financial_check_compliance true))
(assert (= underwriting_systems_executed true))
(assert (= underwriting_execution_compliance true))
(assert (= staff_discipline_executed false))
(assert (= underwriting_staff_discipline false))
(assert (= insurance_reporting_compliance false))
(assert (= internal_control_compliance false))
(assert (= internal_control_compliance_full false))
(assert (= internal_handling_compliance false))
(assert (= internal_handling_compliance_full false))
(assert (= underwriting_appropriateness_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 42
; Total facts: 42
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
