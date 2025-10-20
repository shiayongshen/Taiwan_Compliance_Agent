; SMT2 file generated from compliance case automatic
; Case ID: case_11
; Generated at: 2025-10-19T05:04:28.606255
;
; This file can be executed with Z3:
;   z3 case_11.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const penalty Bool)
(declare-const public_explanation_made Bool)
(declare-const report_content_truthful Bool)
(declare-const report_submitted_on_time Bool)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_article_148_1_2 Bool)
(declare-const violate_article_148_2_1 Bool)
(declare-const violate_article_148_2_2 Bool)
(declare-const violate_article_148_3_1 Bool)
(declare-const violate_article_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_article_148_1_2] 違反保險法第148條之一第一項或第二項規定
(assert (= violate_article_148_1_2 violate_148_1_1_or_2))

; [insurance:violate_article_148_2_1] 違反保險法第148條之二第一項規定，未提供說明文件或說明文件不實
(assert (= violate_article_148_2_1
   (or (not explanation_document_compliant)
       (not explanation_document_provided)
       (not explanation_document_truthful))))

; [insurance:violate_article_148_2_2] 違反保險法第148條之二第二項規定，未依限報告或公開說明，或內容不實
(assert (= violate_article_148_2_2
   (or (not report_submitted_on_time)
       (not public_explanation_made)
       (not report_content_truthful))))

; [insurance:violate_article_148_3_1] 違反保險法第148條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violate_article_148_3_1
   (or (not internal_control_established)
       (not internal_control_executed)
       (not audit_system_executed)
       (not audit_system_established))))

; [insurance:violate_article_148_3_2] 違反保險法第148條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violate_article_148_3_2
   (or (not internal_handling_system_established)
       (not internal_handling_system_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or violate_article_148_1_2
       violate_article_148_2_1
       violate_article_148_2_2
       violate_article_148_3_1
       violate_article_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= explanation_document_compliant true))
(assert (= explanation_document_provided true))
(assert (= explanation_document_truthful true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= penalty true))
(assert (= public_explanation_made true))
(assert (= report_content_truthful true))
(assert (= report_submitted_on_time true))
(assert (= violate_148_1_1_or_2 true))
(assert (= violate_article_148_1_2 true))
(assert (= violate_article_148_2_1 false))
(assert (= violate_article_148_2_2 false))
(assert (= violate_article_148_3_1 true))
(assert (= violate_article_148_3_2 true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 19
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
