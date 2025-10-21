; SMT2 file generated from compliance case automatic
; Case ID: case_346
; Generated at: 2025-10-21T07:42:15.163501
;
; This file can be executed with Z3:
;   z3 case_346.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const doc_compliant_record Bool)
(declare-const doc_provided_for_review Bool)
(declare-const doc_truthful Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const penalty Bool)
(declare-const report_public_disclosed Bool)
(declare-const report_submitted_on_time Bool)
(declare-const report_truthful Bool)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_148_1_1_or_2_flag Bool)
(declare-const violate_148_2_1_doc_issue Bool)
(declare-const violate_148_2_2_report_issue Bool)
(declare-const violate_148_3_1_internal_control Bool)
(declare-const violate_148_3_2_internal_handling Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_1_or_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_1_or_2 violate_148_1_1_or_2_flag))

; [insurance:violate_148_2_1_doc_issue] 違反第一百四十八條之二第一項規定，未提供說明文件供查閱、或說明文件未依規定記載或記載不實
(assert (= violate_148_2_1_doc_issue
   (or (not doc_truthful)
       (not doc_compliant_record)
       (not doc_provided_for_review))))

; [insurance:violate_148_2_2_report_issue] 違反第一百四十八條之二第二項規定，未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2_report_issue
   (or (not report_submitted_on_time)
       (not report_truthful)
       (not report_public_disclosed))))

; [insurance:violate_148_3_1_internal_control] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1_internal_control
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2_internal_handling] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2_internal_handling
   (or (not internal_handling_established) (not internal_handling_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or violate_148_1_1_or_2
       violate_148_2_1_doc_issue
       violate_148_2_2_report_issue
       violate_148_3_1_internal_control
       violate_148_3_2_internal_handling)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_1_or_2_flag true))
(assert (= violate_148_1_1_or_2 true))
(assert (= doc_provided_for_review false))
(assert (= doc_compliant_record false))
(assert (= doc_truthful true))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed false))
(assert (= report_submitted_on_time true))
(assert (= report_public_disclosed true))
(assert (= report_truthful true))
(assert (= violate_148_2_1_doc_issue true))
(assert (= violate_148_2_2_report_issue false))
(assert (= violate_148_3_1_internal_control true))
(assert (= violate_148_3_2_internal_handling true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 17
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
