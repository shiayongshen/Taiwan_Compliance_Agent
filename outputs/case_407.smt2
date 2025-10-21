; SMT2 file generated from compliance case automatic
; Case ID: case_407
; Generated at: 2025-10-21T08:56:16.412694
;
; This file can be executed with Z3:
;   z3 case_407.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_fee_not_paid Bool)
(declare-const audit_fee_paid Bool)
(declare-const bank_report_requested Bool)
(declare-const central_authority_delegate Bool)
(declare-const central_authority_dispatch Bool)
(declare-const cloud_service_data_encrypted Bool)
(declare-const cloud_service_data_location_compliance Bool)
(declare-const cloud_service_data_ownership Bool)
(declare-const cloud_service_data_protection Bool)
(declare-const cloud_service_policy_defined Bool)
(declare-const cloud_service_policy_established Bool)
(declare-const cloud_service_supervision Bool)
(declare-const cloud_service_supervision_implemented Bool)
(declare-const cloud_service_third_party_audit Bool)
(declare-const cloud_service_third_party_audit_done Bool)
(declare-const customer_data_backup_in_domestic Bool)
(declare-const customer_data_stored_domestically Bool)
(declare-const data_access_limited Bool)
(declare-const data_location_rights Bool)
(declare-const data_ownership_retained Bool)
(declare-const derivative_operation_established Bool)
(declare-const derivative_operation_system_established Bool)
(declare-const false_or_incomplete_report Bool)
(declare-const foreign_data_protection_not_lower_than_domestic Bool)
(declare-const foreign_storage_approved Bool)
(declare-const hide_or_destroy_documents Bool)
(declare-const inspection_authority Bool)
(declare-const inspection_violation_any Bool)
(declare-const inspection_violation_hide_destroy Bool)
(declare-const inspection_violation_late_or_false_report Bool)
(declare-const inspection_violation_no_answer Bool)
(declare-const inspection_violation_refuse_inspect Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const late_report Bool)
(declare-const local_authority_dispatch Bool)
(declare-const no_answer_or_false_answer Bool)
(declare-const penalty Bool)
(declare-const refuse_inspection Bool)
(declare-const specialist_assigned Bool)
(declare-const specialist_audit_assigned Bool)
(declare-const specialist_report_submitted Bool)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_control_or_handling_or_operation Bool)
(declare-const violation_internal_handling Bool)
(declare-const violation_internal_operation Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:inspection_authority] 中央主管機關得隨時派員或委託機構檢查銀行業務財務及相關事項，並可要求限期提報資料
(assert (= inspection_authority
   (or local_authority_dispatch
       central_authority_delegate
       bank_report_requested
       central_authority_dispatch)))

; [bank:specialist_audit_assigned] 中央主管機關得指定專門職業及技術人員查核並提出報告，費用由銀行負擔
(assert (= specialist_audit_assigned
   (and specialist_assigned specialist_report_submitted audit_fee_paid)))

; [bank:internal_control_established] 銀行建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 銀行建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 銀行建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:derivative_operation_established] 銀行訂定衍生性金融商品業務內部作業制度及程序
(assert (= derivative_operation_established derivative_operation_system_established))

; [bank:internal_control_executed] 銀行內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_executed] 銀行內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_executed] 銀行內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:inspection_violation_refuse_inspect] 拒絕檢查或拒絕開啟金庫或其他庫房
(assert (= inspection_violation_refuse_inspect refuse_inspection))

; [bank:inspection_violation_hide_destroy] 隱匿或毀損有關業務或財務狀況之帳冊文件
(assert (= inspection_violation_hide_destroy hide_or_destroy_documents))

; [bank:inspection_violation_no_answer] 對檢查人員詢問無正當理由不為答復或答復不實
(assert (= inspection_violation_no_answer no_answer_or_false_answer))

; [bank:inspection_violation_late_or_false_report] 逾期提報財務報告、財產目錄或其他有關資料及報告，或提報不實、不全或未繳納查核費用
(assert (= inspection_violation_late_or_false_report
   (or false_or_incomplete_report audit_fee_not_paid late_report)))

; [bank:inspection_violation_any] 違反檢查規定任一情事
(assert (= inspection_violation_any
   (or inspection_violation_no_answer
       inspection_violation_refuse_inspect
       inspection_violation_late_or_false_report
       inspection_violation_hide_destroy)))

; [bank:violation_internal_control] 未依規定建立或執行內部控制及稽核制度
(assert (not (= (and internal_control_established internal_control_executed)
        violation_internal_control)))

; [bank:violation_internal_handling] 未依規定建立或執行內部處理制度及程序
(assert (not (= (and internal_handling_established internal_handling_executed)
        violation_internal_handling)))

; [bank:violation_internal_operation] 未依規定建立或執行內部作業制度及程序
(assert (not (= (and internal_operation_established internal_operation_executed)
        violation_internal_operation)))

; [bank:violation_internal_control_or_handling_or_operation] 未依規定建立或執行內部控制、處理或作業制度之一
(assert (= violation_internal_control_or_handling_or_operation
   (or violation_internal_control
       violation_internal_handling
       violation_internal_operation)))

; [bank:cloud_service_policy_established] 金融機構訂定使用雲端服務政策及原則，採取適當風險管控措施
(assert (= cloud_service_policy_established cloud_service_policy_defined))

; [bank:cloud_service_supervision] 金融機構對雲端服務業者負有最終監督義務並具專業技術及資源
(assert (= cloud_service_supervision cloud_service_supervision_implemented))

; [bank:cloud_service_third_party_audit] 金融機構委託或聯合委託第三人查核雲端服務業者並符合規定
(assert (= cloud_service_third_party_audit cloud_service_third_party_audit_done))

; [bank:cloud_service_data_protection] 金融機構對雲端服務業者處理客戶資料採行加密或代碼化等有效保護措施
(assert (= cloud_service_data_protection cloud_service_data_encrypted))

; [bank:cloud_service_data_ownership] 金融機構保有委託資料所有權，雲端服務業者不得存取或利用超出委託範圍資料
(assert (= cloud_service_data_ownership
   (and data_ownership_retained data_access_limited)))

; [bank:cloud_service_data_location_compliance] 金融機構委託雲端服務資料處理及儲存地符合規定
(assert (= cloud_service_data_location_compliance
   (and data_location_rights
        foreign_data_protection_not_lower_than_domestic
        (or customer_data_stored_domestically
            (and foreign_storage_approved customer_data_backup_in_domestic)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反檢查規定或未建立或執行內部控制制度或未依規定執行雲端服務管理時處罰
(assert (= penalty
   (or inspection_violation_any
       violation_internal_control_or_handling_or_operation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= central_authority_dispatch true))
(assert (= bank_report_requested true))
(assert (= false_or_incomplete_report true))
(assert (= inspection_violation_late_or_false_report true))
(assert (= inspection_violation_any true))
(assert (= internal_control_system_established false))
(assert (= internal_control_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_established false))
(assert (= internal_operation_system_executed false))
(assert (= internal_operation_executed false))
(assert (= violation_internal_control true))
(assert (= violation_internal_handling true))
(assert (= violation_internal_operation true))
(assert (= violation_internal_control_or_handling_or_operation true))
(assert (= audit_fee_paid false))
(assert (= audit_fee_not_paid true))
(assert (= specialist_assigned false))
(assert (= specialist_report_submitted false))
(assert (= specialist_audit_assigned false))
(assert (= refuse_inspection false))
(assert (= inspection_violation_refuse_inspect false))
(assert (= hide_or_destroy_documents false))
(assert (= inspection_violation_hide_destroy false))
(assert (= no_answer_or_false_answer false))
(assert (= inspection_violation_no_answer false))
(assert (= cloud_service_policy_defined false))
(assert (= cloud_service_policy_established false))
(assert (= cloud_service_supervision_implemented false))
(assert (= cloud_service_supervision false))
(assert (= cloud_service_third_party_audit_done false))
(assert (= cloud_service_third_party_audit false))
(assert (= cloud_service_data_encrypted false))
(assert (= cloud_service_data_protection false))
(assert (= data_ownership_retained false))
(assert (= data_access_limited false))
(assert (= cloud_service_data_ownership false))
(assert (= data_location_rights false))
(assert (= foreign_data_protection_not_lower_than_domestic false))
(assert (= customer_data_stored_domestically false))
(assert (= foreign_storage_approved false))
(assert (= customer_data_backup_in_domestic false))
(assert (= cloud_service_data_location_compliance false))
(assert (= local_authority_dispatch false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 26
; Total variables: 56
; Total facts: 51
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
