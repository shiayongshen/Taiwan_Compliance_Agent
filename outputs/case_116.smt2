; SMT2 file generated from compliance case automatic
; Case ID: case_116
; Generated at: 2025-10-21T02:05:04.149791
;
; This file can be executed with Z3:
;   z3 case_116.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const compliance_systems_ok Bool)
(declare-const foreign_unit_legal_compliance_risk_control Bool)
(declare-const foreign_unit_legal_compliance_risk_control_established_and_verified Bool)
(declare-const foreign_unit_legal_compliance_supervised Bool)
(declare-const foreign_unit_legal_compliance_supervised_flag Bool)
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
(declare-const legal_compliance_communication_system_established Bool)
(declare-const legal_compliance_evaluation_and_supervision_defined Bool)
(declare-const legal_compliance_evaluation_defined Bool)
(declare-const legal_compliance_implementation_supervised Bool)
(declare-const legal_compliance_internal_rules_implementation_supervised Bool)
(declare-const legal_compliance_opinion_issued_and_signed Bool)
(declare-const legal_compliance_opinion_signed Bool)
(declare-const legal_compliance_rules_updated Bool)
(declare-const legal_compliance_self_assessment_done_semianually_and_reported Bool)
(declare-const legal_compliance_self_assessment_periodic Bool)
(declare-const legal_compliance_self_assessment_records_retained Bool)
(declare-const legal_compliance_self_assessment_records_retained_5_years Bool)
(declare-const legal_compliance_self_assessment_responsible Bool)
(declare-const legal_compliance_self_assessment_responsible_person_assigned Bool)
(declare-const legal_compliance_training_given Bool)
(declare-const legal_compliance_training_provided Bool)
(declare-const legal_compliance_unit_established Bool)
(declare-const operation_and_management_rules_updated Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

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

; [bank:compliance_systems_ok] 內部控制、處理及作業制度均建立且確實執行
(assert (= compliance_systems_ok
   (and internal_control_ok internal_handling_ok internal_operation_ok)))

; [bank:legal_compliance_unit_established] 法令遵循單位建立清楚適當之法令規章傳達、諮詢、協調與溝通系統
(assert (= legal_compliance_unit_established
   legal_compliance_communication_system_established))

; [bank:legal_compliance_rules_updated] 各項作業及管理規章配合相關法規適時更新
(assert (= legal_compliance_rules_updated operation_and_management_rules_updated))

; [bank:legal_compliance_opinion_signed] 新商品、服務及新種業務申請前，法令遵循主管出具符合法令及內部規範之意見並簽署負責
(assert (= legal_compliance_opinion_signed legal_compliance_opinion_issued_and_signed))

; [bank:legal_compliance_evaluation_defined] 訂定法令遵循評估內容與程序，督導各單位定期自行評估執行情形
(assert (= legal_compliance_evaluation_defined
   legal_compliance_evaluation_and_supervision_defined))

; [bank:legal_compliance_training_provided] 對各單位人員施以適當合宜之法規訓練
(assert (= legal_compliance_training_provided legal_compliance_training_given))

; [bank:legal_compliance_implementation_supervised] 督導各單位法令遵循主管落實執行相關內部規範之導入、建置與實施
(assert (= legal_compliance_implementation_supervised
   legal_compliance_internal_rules_implementation_supervised))

; [bank:foreign_unit_legal_compliance_supervised] 督導國外營業單位蒐集當地金融法規資料及落實執行法令遵循自行評估作業
(assert (= foreign_unit_legal_compliance_supervised
   foreign_unit_legal_compliance_supervised_flag))

; [bank:foreign_unit_legal_compliance_risk_control] 建立法令遵循風險自行評估及監控機制，並委請外部專家驗證有效性
(assert (= foreign_unit_legal_compliance_risk_control
   foreign_unit_legal_compliance_risk_control_established_and_verified))

; [bank:legal_compliance_self_assessment_periodic] 法令遵循自行評估作業每半年至少辦理一次，結果送法令遵循單位備查
(assert (= legal_compliance_self_assessment_periodic
   legal_compliance_self_assessment_done_semianually_and_reported))

; [bank:legal_compliance_self_assessment_responsible] 各單位自行評估作業由主管指定專人辦理
(assert (= legal_compliance_self_assessment_responsible
   legal_compliance_self_assessment_responsible_person_assigned))

; [bank:legal_compliance_self_assessment_records_retained] 自行評估工作底稿及資料至少保存五年
(assert (= legal_compliance_self_assessment_records_retained
   legal_compliance_self_assessment_records_retained_5_years))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、處理、作業制度或未確實執行時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established true))
(assert (= internal_operation_system_executed true))
(assert (= legal_compliance_communication_system_established false))
(assert (= operation_and_management_rules_updated false))
(assert (= penalty true))
(assert (= foreign_unit_legal_compliance_supervised_flag false))
(assert (= foreign_unit_legal_compliance_risk_control_established_and_verified false))
(assert (= legal_compliance_opinion_issued_and_signed false))
(assert (= legal_compliance_evaluation_and_supervision_defined false))
(assert (= legal_compliance_training_given false))
(assert (= legal_compliance_internal_rules_implementation_supervised false))
(assert (= legal_compliance_self_assessment_done_semianually_and_reported false))
(assert (= legal_compliance_self_assessment_responsible_person_assigned false))
(assert (= legal_compliance_self_assessment_records_retained_5_years false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 23
; Total variables: 39
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
