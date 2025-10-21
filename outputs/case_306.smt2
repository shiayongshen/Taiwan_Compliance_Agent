; SMT2 file generated from compliance case automatic
; Case ID: case_306
; Generated at: 2025-10-21T22:14:57.613656
;
; This file can be executed with Z3:
;   z3 case_306.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const financial_underwriting_and_reporting_done Bool)
(declare-const financial_underwriting_compliance Bool)
(declare-const fund_source_assessed_and_appropriate Bool)
(declare-const fund_source_assessment_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_penalty Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_penalty Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const penalty Bool)
(declare-const personal_data_handled_according_to_law Bool)
(declare-const personal_data_handling_compliance Bool)
(declare-const prohibited_practices_occurred Bool)
(declare-const prohibited_underwriting_practices Bool)
(declare-const underwriting_document_compliance Bool)
(declare-const underwriting_documents_reviewed Bool)
(declare-const underwriting_penalty Bool)
(declare-const underwriting_policy_compliance Bool)
(declare-const underwriting_policy_established_and_executed Bool)
(declare-const underwriting_qualification_compliance Bool)
(declare-const underwriting_staff_qualified Bool)
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

; [insurance:internal_control_ok] 內部控制及稽核制度建立且執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 內部處理制度及程序建立且執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:underwriting_training_compliance] 核保人員每年參加公平對待65歲以上客戶相關教育訓練
(assert (= underwriting_training_compliance underwriting_training_completed))

; [insurance:underwriting_qualification_compliance] 核保人員具資格執行核保簽署作業
(assert (= underwriting_qualification_compliance underwriting_staff_qualified))

; [insurance:underwriting_policy_compliance] 依規定訂定核保處理制度及程序並執行
(assert (= underwriting_policy_compliance underwriting_policy_established_and_executed))

; [insurance:underwriting_document_compliance] 審閱要保人及被保險人簽章及相關證據文件
(assert (= underwriting_document_compliance underwriting_documents_reviewed))

; [insurance:financial_underwriting_compliance] 落實財務核保程序及保險通報機制並保留相關文件
(assert (= financial_underwriting_compliance financial_underwriting_and_reporting_done))

; [insurance:fund_source_assessment_compliance] 評估繳交保險費資金來源是否為解約、貸款或保險單借款並評估適當性
(assert (= fund_source_assessment_compliance fund_source_assessed_and_appropriate))

; [insurance:prohibited_underwriting_practices] 無違反禁止事項（如無資格人員執行核保、未依規定評估適合度等）
(assert (not (= prohibited_practices_occurred prohibited_underwriting_practices)))

; [insurance:personal_data_handling_compliance] 未承保件個人資料保存及銷毀符合規定
(assert (= personal_data_handling_compliance personal_data_handled_according_to_law))

; [insurance:internal_control_penalty] 違反內部控制及稽核制度建立或執行規定
(assert (not (= internal_control_ok internal_control_penalty)))

; [insurance:internal_handling_penalty] 違反內部處理制度及程序建立或執行規定
(assert (not (= internal_handling_ok internal_handling_penalty)))

; [insurance:underwriting_penalty] 違反核保相關規定
(assert (= underwriting_penalty
   (or (not fund_source_assessment_compliance)
       (not underwriting_policy_compliance)
       prohibited_practices_occurred
       (not underwriting_training_compliance)
       (not underwriting_document_compliance)
       (not financial_underwriting_compliance)
       (not underwriting_qualification_compliance))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制、內部處理制度或核保相關規定時處罰
(assert (= penalty
   (or internal_control_penalty internal_handling_penalty underwriting_penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= underwriting_training_completed false))
(assert (= underwriting_staff_qualified false))
(assert (= underwriting_policy_established_and_executed false))
(assert (= underwriting_documents_reviewed false))
(assert (= financial_underwriting_and_reporting_done false))
(assert (= fund_source_assessed_and_appropriate false))
(assert (= prohibited_practices_occurred true))
(assert (= personal_data_handled_according_to_law true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 30
; Total facts: 12
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
