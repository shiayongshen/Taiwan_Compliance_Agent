; SMT2 file generated from compliance case automatic
; Case ID: case_373
; Generated at: 2025-10-21T08:20:06.702067
;
; This file can be executed with Z3:
;   z3 case_373.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const conceal_or_destroy_documents Bool)
(declare-const concealed_or_destroyed_documents Bool)
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
(declare-const late_or_false_or_incomplete_reporting Bool)
(declare-const late_or_false_reporting Bool)
(declare-const penalty Bool)
(declare-const refuse_inspection Bool)
(declare-const refused_inspection_or_opening Bool)
(declare-const uncooperative_or_false_response Bool)
(declare-const uncooperative_response Bool)
(declare-const violation_inspection_reporting Bool)
(declare-const violation_internal_systems Bool)

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

; [bank:violation_internal_systems] 違反內部控制、內部處理或內部作業制度規定
(assert (= violation_internal_systems
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; [bank:refuse_inspection] 拒絕檢查或拒絕開啟金庫或其他庫房
(assert (= refuse_inspection refused_inspection_or_opening))

; [bank:conceal_or_destroy_documents] 隱匿或毀損有關業務或財務狀況之帳冊文件
(assert (= conceal_or_destroy_documents concealed_or_destroyed_documents))

; [bank:uncooperative_response] 對檢查人員詢問無正當理由不為答復或答復不實
(assert (= uncooperative_response uncooperative_or_false_response))

; [bank:late_or_false_reporting] 逾期提報財務報告、財產目錄或其他有關資料及報告，或提報不實、不全或未於規定期限內繳納查核費用
(assert (= late_or_false_reporting late_or_false_or_incomplete_reporting))

; [bank:violation_inspection_reporting] 違反檢查、提報財務報告等規定
(assert (= violation_inspection_reporting
   (or late_or_false_reporting
       refuse_inspection
       uncooperative_response
       conceal_or_destroy_documents)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部制度規定或違反檢查提報規定時處罰
(assert (= penalty (or violation_inspection_reporting violation_internal_systems)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= concealed_or_destroyed_documents false))
(assert (= refused_inspection_or_opening false))
(assert (= uncooperative_or_false_response false))
(assert (= late_or_false_or_incomplete_reporting true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 26
; Total facts: 10
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
