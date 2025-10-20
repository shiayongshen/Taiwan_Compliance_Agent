; SMT2 file generated from compliance case automatic
; Case ID: case_70
; Generated at: 2025-10-19T07:09:53.596565
;
; This file can be executed with Z3:
;   z3 case_70.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const doc_properly_recorded Bool)
(declare-const doc_provided_for_review Bool)
(declare-const doc_truthful Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const penalty Bool)
(declare-const public_explanation_provided Bool)
(declare-const report_content_truthful Bool)
(declare-const reported_to_authority_on_time Bool)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_148_1_1_or_2_flag Bool)
(declare-const violate_148_2_1_doc_issue Bool)
(declare-const violate_148_2_2_report_issue Bool)
(declare-const violate_148_3_1_internal_control Bool)
(declare-const violate_148_3_2_internal_handling Bool)
(declare-const violate_149 Bool)
(declare-const violate_149_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_1_or_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_1_or_2 violate_148_1_1_or_2_flag))

; [insurance:violate_148_2_1_doc_issue] 違反第一百四十八條之二第一項規定，未提供說明文件供查閱、或說明文件未依規定記載或記載不實
(assert (= violate_148_2_1_doc_issue
   (or (not doc_truthful)
       (not doc_properly_recorded)
       (not doc_provided_for_review))))

; [insurance:violate_148_2_2_report_issue] 違反第一百四十八條之二第二項規定，未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2_report_issue
   (or (not report_content_truthful)
       (not public_explanation_provided)
       (not reported_to_authority_on_time))))

; [insurance:violate_148_3_1_internal_control] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1_internal_control
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2_internal_handling] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2_internal_handling
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:violate_149] 違反保險法第149條規定，影響健全經營
(assert (= violate_149 violate_149_flag))

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
(assert (= doc_provided_for_review true))
(assert (= doc_properly_recorded true))
(assert (= doc_truthful true))
(assert (= reported_to_authority_on_time true))
(assert (= public_explanation_provided true))
(assert (= report_content_truthful true))
(assert (= violate_148_2_1_doc_issue false))
(assert (= violate_148_2_2_report_issue false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= violate_148_3_1_internal_control true))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= violate_148_3_2_internal_handling true))
(assert (= violate_149_flag true))
(assert (= violate_149 true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 19
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
