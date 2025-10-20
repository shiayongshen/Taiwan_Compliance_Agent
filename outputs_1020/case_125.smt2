; SMT2 file generated from compliance case automatic
; Case ID: case_125
; Generated at: 2025-10-19T08:36:23.201895
;
; This file can be executed with Z3:
;   z3 case_125.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const financial_and_business_document_provided Bool)
(declare-const inspection_cooperation_compliance Bool)
(declare-const inspection_violation Bool)
(declare-const internal_control_and_handling_compliance Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_violation Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_handling_violation Bool)
(declare-const loan_and_transaction_limit_compliance Bool)
(declare-const loan_and_transaction_limit_followed Bool)
(declare-const major_information_reported_and_disclosed Bool)
(declare-const not_hide_or_destroy_documents Bool)
(declare-const not_refuse_inspection Bool)
(declare-const penalty Bool)
(declare-const related_financial_institution_cooperated Bool)
(declare-const related_financial_institution_cooperation_compliance Bool)
(declare-const related_financial_institution_violation Bool)
(declare-const related_party_transaction_compliance Bool)
(declare-const related_party_transaction_limit_followed Bool)
(declare-const report_and_document_compliance Bool)
(declare-const timely_report_and_fee_payment Bool)
(declare-const truthful_and_timely_response Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established] 保險業已建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_control_executed] 保險業已執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_established] 保險業已建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:internal_handling_executed] 保險業已執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:internal_control_compliance] 保險業內部控制及稽核制度建立且執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance] 保險業內部處理制度及程序建立且執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [insurance:internal_control_and_handling_compliance] 保險業內部控制及稽核制度與內部處理制度均合規
(assert (= internal_control_and_handling_compliance
   (and internal_control_compliance internal_handling_compliance)))

; [insurance:loan_and_transaction_limit_compliance] 保險業對同一人、同一關係人或同一關係企業之放款或其他交易符合主管機關限制規定
(assert (= loan_and_transaction_limit_compliance loan_and_transaction_limit_followed))

; [insurance:related_party_transaction_compliance] 保險業與利害關係人從事放款以外之其他交易符合主管機關限制規定
(assert (= related_party_transaction_compliance
   related_party_transaction_limit_followed))

; [insurance:report_and_document_compliance] 保險業依規定據實編製說明文件並於重大訊息發生時依規定報告及公開說明
(assert (= report_and_document_compliance
   (and financial_and_business_document_provided
        major_information_reported_and_disclosed)))

; [insurance:inspection_cooperation_compliance] 保險業配合主管機關檢查，未拒絕檢查、未隱匿毀損帳冊文件、未不實答復、未逾期提報或未逾期繳納查核費用
(assert (= inspection_cooperation_compliance
   (and not_refuse_inspection
        not_hide_or_destroy_documents
        truthful_and_timely_response
        timely_report_and_fee_payment)))

; [insurance:related_financial_institution_cooperation_compliance] 保險業之關係企業或其他金融機構配合主管機關檢查，未怠於提供財務報告、帳冊、文件或相關交易資料
(assert (= related_financial_institution_cooperation_compliance
   related_financial_institution_cooperated))

; [insurance:internal_control_violation] 違反內部控制及稽核制度建立或執行規定
(assert (= internal_control_violation
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:internal_handling_violation] 違反內部處理制度及程序建立或執行規定
(assert (= internal_handling_violation
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:inspection_violation] 違反主管機關檢查配合義務，包括拒絕檢查、隱匿毀損帳冊文件、不實答復、逾期提報或逾期繳納查核費用
(assert (= inspection_violation
   (or (not truthful_and_timely_response)
       (not not_hide_or_destroy_documents)
       (not timely_report_and_fee_payment)
       (not not_refuse_inspection))))

; [insurance:related_financial_institution_violation] 保險業之關係企業或其他金融機構怠於提供財務報告、帳冊、文件或相關交易資料
(assert (not (= related_financial_institution_cooperated
        related_financial_institution_violation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制或內部處理制度建立或執行，或違反檢查配合義務，或關係企業怠於提供資料時處罰
(assert (= penalty
   (or inspection_violation
       related_financial_institution_violation
       internal_control_violation
       internal_handling_violation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= not_refuse_inspection true))
(assert (= not_hide_or_destroy_documents false))
(assert (= truthful_and_timely_response false))
(assert (= timely_report_and_fee_payment true))
(assert (= related_financial_institution_cooperated true))
(assert (= loan_and_transaction_limit_followed false))
(assert (= related_party_transaction_limit_followed false))
(assert (= financial_and_business_document_provided false))
(assert (= major_information_reported_and_disclosed false))
(assert (= inspection_cooperation_compliance false))
(assert (= inspection_violation false))
(assert (= internal_control_and_handling_compliance false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_violation false))
(assert (= internal_handling_compliance false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_violation false))
(assert (= loan_and_transaction_limit_compliance false))
(assert (= penalty false))
(assert (= related_financial_institution_cooperation_compliance false))
(assert (= related_financial_institution_violation false))
(assert (= related_party_transaction_compliance false))
(assert (= report_and_document_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 30
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
