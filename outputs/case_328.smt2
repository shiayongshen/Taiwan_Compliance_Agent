; SMT2 file generated from compliance case automatic
; Case ID: case_328
; Generated at: 2025-10-21T07:25:03.519330
;
; This file can be executed with Z3:
;   z3 case_328.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const compliance_communication_established Bool)
(declare-const compliance_communication_system_established Bool)
(declare-const compliance_evaluation_and_supervision Bool)
(declare-const compliance_evaluation_and_supervision_done Bool)
(declare-const compliance_new_business_opinion_signed Bool)
(declare-const compliance_regulations_updated Bool)
(declare-const compliance_self_assessment_document_retention Bool)
(declare-const compliance_self_assessment_done_semesterly Bool)
(declare-const compliance_self_assessment_frequency Int)
(declare-const compliance_supervision_done Bool)
(declare-const compliance_supervision_implementation Bool)
(declare-const compliance_training_done Bool)
(declare-const compliance_training_provided Bool)
(declare-const foreign_branch_compliance_supervised Bool)
(declare-const foreign_branch_compliance_supervision Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const new_business_compliance_opinion_signed Bool)
(declare-const penalty Bool)
(declare-const regulations_updated_timely Bool)
(declare-const self_assessment_documents_retained_5_years Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_control_ok] 建立並確實執行內部控制及稽核制度
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 建立並確實執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 建立並確實執行內部作業制度及程序
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:compliance_communication_established] 建立法令規章傳達、諮詢、協調與溝通系統
(assert (= compliance_communication_established
   compliance_communication_system_established))

; [bank:compliance_regulations_updated] 確認作業及管理規章配合相關法規適時更新
(assert (= compliance_regulations_updated regulations_updated_timely))

; [bank:compliance_new_business_opinion_signed] 新商品及新業務申請前法令遵循主管出具意見並簽署負責
(assert (= compliance_new_business_opinion_signed
   new_business_compliance_opinion_signed))

; [bank:compliance_evaluation_and_supervision] 訂定法令遵循評估內容與程序並督導各單位定期自行評估
(assert (= compliance_evaluation_and_supervision
   compliance_evaluation_and_supervision_done))

; [bank:compliance_training_provided] 對各單位人員施以適當合宜之法規訓練
(assert (= compliance_training_provided compliance_training_done))

; [bank:compliance_supervision_implementation] 督導法令遵循主管落實執行相關內部規範
(assert (= compliance_supervision_implementation compliance_supervision_done))

; [bank:foreign_branch_compliance_supervision] 督導國外營業單位執行法令遵循相關事項
(assert (= foreign_branch_compliance_supervision foreign_branch_compliance_supervised))

; [bank:compliance_self_assessment_frequency] 法令遵循自行評估每半年至少辦理一次
(assert (= compliance_self_assessment_frequency
   (ite compliance_self_assessment_done_semesterly 1 0)))

; [bank:compliance_self_assessment_document_retention] 自行評估工作底稿及資料至少保存五年
(assert (= compliance_self_assessment_document_retention
   self_assessment_documents_retained_5_years))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度及程序時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_system_executed true))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= internal_operation_system_established true))
(assert (= internal_operation_system_executed true))
(assert (= internal_operation_established true))
(assert (= internal_operation_executed true))
(assert (= compliance_communication_system_established true))
(assert (= compliance_communication_established true))
(assert (= regulations_updated_timely true))
(assert (= compliance_regulations_updated true))
(assert (= new_business_compliance_opinion_signed true))
(assert (= compliance_new_business_opinion_signed true))
(assert (= compliance_evaluation_and_supervision_done true))
(assert (= compliance_evaluation_and_supervision true))
(assert (= compliance_training_done true))
(assert (= compliance_training_provided true))
(assert (= compliance_supervision_done true))
(assert (= compliance_supervision_implementation true))
(assert (= foreign_branch_compliance_supervised true))
(assert (= foreign_branch_compliance_supervision true))
(assert (= compliance_self_assessment_done_semesterly true))
(assert (= compliance_self_assessment_frequency 2))
(assert (= self_assessment_documents_retained_5_years true))
(assert (= compliance_self_assessment_document_retention true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 34
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
