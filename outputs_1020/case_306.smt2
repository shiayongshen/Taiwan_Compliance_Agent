; SMT2 file generated from compliance case automatic
; Case ID: case_306
; Generated at: 2025-10-19T12:41:17.586490
;
; This file can be executed with Z3:
;   z3 case_306.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const financial_underwriting_compliance Bool)
(declare-const financial_underwriting_implemented Bool)
(declare-const fund_source_assessed Bool)
(declare-const fund_source_assessment_compliance Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const penalty Bool)
(declare-const personal_data_protection_compliance Bool)
(declare-const personal_data_protection_implemented Bool)
(declare-const underwriting_and_claims_execution Bool)
(declare-const underwriting_claims_procedures_executed Bool)
(declare-const underwriting_document_compliance Bool)
(declare-const underwriting_documents_reviewed Bool)
(declare-const underwriting_policy_compliance Bool)
(declare-const underwriting_policy_implemented Bool)
(declare-const underwriting_qualification_compliance Bool)
(declare-const underwriting_staff_qualified Bool)
(declare-const underwriting_training_completed Bool)
(declare-const underwriting_training_compliance Bool)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_handling Bool)
(declare-const violation_underwriting_and_claims_execution Bool)
(declare-const violation_underwriting_policy Bool)

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

; [insurance:underwriting_policy_compliance] 核保制度符合招攬及核保理賠辦法第7條規定
(assert (= underwriting_policy_compliance underwriting_policy_implemented))

; [insurance:underwriting_document_compliance] 審閱要保人及被保險人簽章及相關證據文件
(assert (= underwriting_document_compliance underwriting_documents_reviewed))

; [insurance:financial_underwriting_compliance] 落實財務核保程序及保險通報機制
(assert (= financial_underwriting_compliance financial_underwriting_implemented))

; [insurance:fund_source_assessment_compliance] 評估繳交保險費資金來源適當性
(assert (= fund_source_assessment_compliance fund_source_assessed))

; [insurance:personal_data_protection_compliance] 未承保件個人資料保存及刪除符合個資法規定
(assert (= personal_data_protection_compliance personal_data_protection_implemented))

; [insurance:underwriting_and_claims_execution] 確實執行招攬、核保及理賠處理制度及程序
(assert (= underwriting_and_claims_execution underwriting_claims_procedures_executed))

; [insurance:violation_internal_control] 違反內部控制及稽核制度建立或執行規定
(assert (not (= internal_control_compliance violation_internal_control)))

; [insurance:violation_internal_handling] 違反內部處理制度及程序建立或執行規定
(assert (not (= internal_handling_compliance violation_internal_handling)))

; [insurance:violation_underwriting_policy] 違反核保制度規定（含資格、文件、財務核保等）
(assert (not (= (and underwriting_training_compliance
             underwriting_qualification_compliance
             underwriting_policy_compliance
             underwriting_document_compliance
             financial_underwriting_compliance
             fund_source_assessment_compliance
             personal_data_protection_compliance)
        violation_underwriting_policy)))

; [insurance:violation_underwriting_and_claims_execution] 違反招攬、核保及理賠處理制度及程序執行規定
(assert (not (= underwriting_and_claims_execution
        violation_underwriting_and_claims_execution)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制、內部處理制度或招攬核保理賠程序執行規定時處罰
(assert (= penalty
   (or violation_underwriting_policy
       violation_underwriting_and_claims_execution
       violation_internal_handling
       violation_internal_control)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= underwriting_training_completed false))
(assert (= underwriting_staff_qualified false))
(assert (= underwriting_policy_implemented false))
(assert (= underwriting_documents_reviewed false))
(assert (= financial_underwriting_implemented false))
(assert (= fund_source_assessed false))
(assert (= personal_data_protection_implemented false))
(assert (= underwriting_claims_procedures_executed false))
(assert (= financial_underwriting_compliance false))
(assert (= fund_source_assessment_compliance false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_compliance false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= penalty false))
(assert (= personal_data_protection_compliance false))
(assert (= underwriting_and_claims_execution false))
(assert (= underwriting_document_compliance false))
(assert (= underwriting_policy_compliance false))
(assert (= underwriting_qualification_compliance false))
(assert (= underwriting_training_compliance false))
(assert (= violation_internal_control false))
(assert (= violation_internal_handling false))
(assert (= violation_underwriting_and_claims_execution false))
(assert (= violation_underwriting_policy false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 31
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
