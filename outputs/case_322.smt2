; SMT2 file generated from compliance case automatic
; Case ID: case_322
; Generated at: 2025-10-21T07:13:57.009131
;
; This file can be executed with Z3:
;   z3 case_322.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const concealed_or_destroyed_documents Bool)
(declare-const documents_concealed_or_destroyed Bool)
(declare-const inspection_refused Bool)
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
(declare-const late_or_false_report Bool)
(declare-const late_or_false_report_or_unpaid_fee Bool)
(declare-const no_response_or_false_response Bool)
(declare-const penalty Bool)
(declare-const refused_inspection_or_open_vault Bool)
(declare-const unjustified_no_response Bool)
(declare-const violation_inspection Bool)
(declare-const violation_internal_control Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 銀行已建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 銀行已建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 銀行已建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 銀行內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_executed] 銀行內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_executed] 銀行內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_control_ok] 銀行內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 銀行內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 銀行內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:inspection_refused] 拒絕檢查或拒絕開啟金庫或其他庫房
(assert (= inspection_refused refused_inspection_or_open_vault))

; [bank:documents_concealed_or_destroyed] 隱匿或毀損有關業務或財務狀況之帳冊文件
(assert (= documents_concealed_or_destroyed concealed_or_destroyed_documents))

; [bank:unjustified_no_response] 對檢查人員詢問無正當理由不為答復或答復不實
(assert (= unjustified_no_response no_response_or_false_response))

; [bank:late_or_false_report] 逾期提報財務報告、財產目錄或其他有關資料及報告，或提報不實、不全或未於規定期限內繳納查核費用
(assert (= late_or_false_report late_or_false_report_or_unpaid_fee))

; [bank:violation_internal_control] 未依規定建立或執行內部控制及稽核、內部處理、內部作業制度及程序
(assert (not (= (and internal_control_ok internal_handling_ok internal_operation_ok)
        violation_internal_control)))

; [bank:violation_inspection] 拒絕檢查、隱匿文件、無正當理由不答復或逾期提報等違規行為
(assert (= violation_inspection
   (or unjustified_no_response
       documents_concealed_or_destroyed
       inspection_refused
       late_or_false_report)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反檢查規定或未建立或執行內部控制制度時處罰
(assert (= penalty (or violation_inspection violation_internal_control)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= concealed_or_destroyed_documents false))
(assert (= documents_concealed_or_destroyed false))
(assert (= inspection_refused false))
(assert (= internal_control_system_established true))
(assert (= internal_control_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_control_executed false))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_established true))
(assert (= internal_handling_system_executed false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_system_established true))
(assert (= internal_operation_established true))
(assert (= internal_operation_system_executed false))
(assert (= internal_operation_executed false))
(assert (= late_or_false_report_or_unpaid_fee false))
(assert (= late_or_false_report false))
(assert (= no_response_or_false_response true))
(assert (= unjustified_no_response true))
(assert (= refused_inspection_or_open_vault false))
(assert (= violation_inspection true))
(assert (= violation_internal_control true))
(assert (= penalty true))

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
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
