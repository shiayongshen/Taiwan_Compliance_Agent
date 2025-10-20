; SMT2 file generated from compliance case automatic
; Case ID: case_328
; Generated at: 2025-10-19T13:22:45.706351
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
(declare-const compliance_internal_norms_implemented Bool)
(declare-const compliance_new_business_opinion_signed Bool)
(declare-const compliance_regulations_updated Bool)
(declare-const compliance_self_assessment_performed Bool)
(declare-const compliance_self_assessment_records_kept Bool)
(declare-const compliance_training_done Bool)
(declare-const compliance_training_provided Bool)
(declare-const foreign_branch_compliance_supervised Bool)
(declare-const foreign_branch_compliance_supervised_done Bool)
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
(declare-const internal_norms_implemented Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const new_business_compliance_opinion_signed Bool)
(declare-const penalty Bool)
(declare-const regulations_updated_timely Bool)
(declare-const self_assessment_done_semesterly Bool)
(declare-const self_assessment_records_kept_5years Bool)

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

; [bank:internal_control_ok] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:compliance_communication_established] 建立法令規章傳達、諮詢、協調與溝通系統
(assert (= compliance_communication_established
   compliance_communication_system_established))

; [bank:compliance_regulations_updated] 確認作業及管理規章配合相關法規適時更新
(assert (= compliance_regulations_updated regulations_updated_timely))

; [bank:compliance_new_business_opinion_signed] 新商品及新業務開辦前法令遵循主管出具意見並簽署負責
(assert (= compliance_new_business_opinion_signed
   new_business_compliance_opinion_signed))

; [bank:compliance_evaluation_and_supervision] 訂定法令遵循評估內容與程序，督導定期自行評估並考核
(assert (= compliance_evaluation_and_supervision
   compliance_evaluation_and_supervision_done))

; [bank:compliance_training_provided] 對各單位人員施以適當合宜之法規訓練
(assert (= compliance_training_provided compliance_training_done))

; [bank:compliance_internal_norms_implemented] 督導法令遵循主管落實執行相關內部規範導入、建置與實施
(assert (= compliance_internal_norms_implemented internal_norms_implemented))

; [bank:foreign_branch_compliance_supervised] 督導國外營業單位執行法令遵循相關事項
(assert (= foreign_branch_compliance_supervised
   foreign_branch_compliance_supervised_done))

; [bank:compliance_self_assessment_performed] 法令遵循自行評估作業每半年至少辦理一次並送法令遵循單位備查
(assert (= compliance_self_assessment_performed self_assessment_done_semesterly))

; [bank:compliance_self_assessment_records_kept] 自行評估工作底稿及資料至少保存五年
(assert (= compliance_self_assessment_records_kept self_assessment_records_kept_5years))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度或未落實法令遵循相關規定時處罰
(assert (= penalty
   (or (not compliance_regulations_updated)
       (not compliance_evaluation_and_supervision)
       (not compliance_training_provided)
       (not compliance_communication_established)
       (not internal_handling_ok)
       (not compliance_internal_norms_implemented)
       (not compliance_new_business_opinion_signed)
       (not foreign_branch_compliance_supervised)
       (not internal_control_ok)
       (not compliance_self_assessment_performed)
       (not compliance_self_assessment_records_kept)
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
(assert (= compliance_communication_system_established false))
(assert (= compliance_communication_established false))
(assert (= regulations_updated_timely false))
(assert (= compliance_regulations_updated false))
(assert (= new_business_compliance_opinion_signed false))
(assert (= compliance_new_business_opinion_signed false))
(assert (= compliance_evaluation_and_supervision_done false))
(assert (= compliance_evaluation_and_supervision false))
(assert (= compliance_training_done false))
(assert (= compliance_training_provided false))
(assert (= internal_norms_implemented false))
(assert (= compliance_internal_norms_implemented false))
(assert (= foreign_branch_compliance_supervised_done false))
(assert (= foreign_branch_compliance_supervised false))
(assert (= self_assessment_done_semesterly false))
(assert (= compliance_self_assessment_performed false))
(assert (= self_assessment_records_kept_5years false))
(assert (= compliance_self_assessment_records_kept false))
(assert (= penalty true))
(assert (= internal_control_ok false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_ok false))

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
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
