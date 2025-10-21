; SMT2 file generated from compliance case automatic
; Case ID: case_125
; Generated at: 2025-10-21T02:22:20.787010
;
; This file can be executed with Z3:
;   z3 case_125.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const applicant_truthful_disclosure Bool)
(declare-const concealed_or_destroyed_documents Bool)
(declare-const contract_insurance_truthful Bool)
(declare-const document_concealment Bool)
(declare-const financial_disclosure_compliance Bool)
(declare-const financial_disclosure_provided_and_true Bool)
(declare-const inspection_refusal Bool)
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
(declare-const late_or_false_financial_report Bool)
(declare-const late_or_false_report Bool)
(declare-const loan_and_transaction_limit_followed Bool)
(declare-const loan_limit_compliance Bool)
(declare-const penalty Bool)
(declare-const refused_inspection_or_opening Bool)
(declare-const related_entity_failed_to_provide_documents Bool)
(declare-const related_entity_report_failure Bool)
(declare-const related_party_other_transaction_limit_followed Bool)
(declare-const related_party_transaction_compliance Bool)
(declare-const timely_report_and_disclosure Bool)
(declare-const timely_report_compliance Bool)
(declare-const uncooperative_or_false_response Bool)
(declare-const uncooperative_response Bool)

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

; [insurance:loan_limit_compliance] 保險業對同一人、同一關係人或同一關係企業放款及其他交易符合主管機關限制
(assert (= loan_limit_compliance loan_and_transaction_limit_followed))

; [insurance:related_party_transaction_compliance] 保險業與利害關係人從事放款以外其他交易符合主管機關限制
(assert (= related_party_transaction_compliance
   related_party_other_transaction_limit_followed))

; [insurance:inspection_refusal] 保險業負責人或職員拒絕檢查或拒絕開啟金庫或其他庫房
(assert (= inspection_refusal refused_inspection_or_opening))

; [insurance:document_concealment] 保險業負責人或職員隱匿或毀損有關業務或財務狀況帳冊文件
(assert (= document_concealment concealed_or_destroyed_documents))

; [insurance:uncooperative_response] 保險業負責人或職員無故不答復或答復不實檢查人員詢問
(assert (= uncooperative_response uncooperative_or_false_response))

; [insurance:late_or_false_report] 保險業負責人或職員逾期提報或提報不實、不全財務報告、財產目錄或其他資料及報告，或未於規定期限繳納查核費用
(assert (= late_or_false_report late_or_false_financial_report))

; [insurance:related_entity_report_failure] 保險業關係企業或其他金融機構怠於提供財務報告、帳冊、文件或相關交易資料
(assert (= related_entity_report_failure related_entity_failed_to_provide_documents))

; [insurance:internal_control_violation] 違反內部控制或稽核制度規定
(assert (= internal_control_violation
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:internal_handling_violation] 違反內部處理制度或程序規定
(assert (= internal_handling_violation
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:financial_disclosure_compliance] 保險業依規定據實編製說明文件並公開查閱
(assert (= financial_disclosure_compliance financial_disclosure_provided_and_true))

; [insurance:timely_report_compliance] 保險業於重大訊息發生時二日內書面報告主管機關並主動公開說明
(assert (= timely_report_compliance timely_report_and_disclosure))

; [insurance:contract_insurance_truthful] 要保人對保險人書面詢問據實說明
(assert (= contract_insurance_truthful applicant_truthful_disclosure))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反內部控制、內部處理制度或檢查規定時處罰
(assert (= penalty
   (or related_entity_report_failure
       late_or_false_report
       (not timely_report_compliance)
       document_concealment
       (not related_party_transaction_compliance)
       internal_control_violation
       uncooperative_response
       internal_handling_violation
       inspection_refusal
       (not loan_limit_compliance)
       (not financial_disclosure_compliance)
       (not contract_insurance_truthful))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= concealed_or_destroyed_documents true))
(assert (= refused_inspection_or_opening false))
(assert (= uncooperative_or_false_response false))
(assert (= late_or_false_financial_report false))
(assert (= related_entity_failed_to_provide_documents false))
(assert (= loan_and_transaction_limit_followed false))
(assert (= related_party_other_transaction_limit_followed false))
(assert (= applicant_truthful_disclosure true))
(assert (= financial_disclosure_provided_and_true true))
(assert (= timely_report_and_disclosure true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 33
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
