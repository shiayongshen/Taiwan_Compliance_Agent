; SMT2 file generated from compliance case automatic
; Case ID: case_75
; Generated at: 2025-10-19T07:15:19.134508
;
; This file can be executed with Z3:
;   z3 case_75.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const internal_audit_established Bool)
(declare-const internal_audit_executed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const penalty Bool)
(declare-const penalty_171_1 Bool)
(declare-const penalty_171_2 Bool)
(declare-const penalty_171_3 Bool)
(declare-const penalty_171_4 Bool)
(declare-const report_content_truthful Bool)
(declare-const report_public_disclosed Bool)
(declare-const report_submitted_on_time Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_1_2_flag Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_2_flag))

; [insurance:violate_148_2_1] 違反第一百四十八條之二第一項規定：未提供說明文件、文件未依規定記載或記載不實
(assert (= violate_148_2_1
   (or (not explanation_document_compliant)
       (not explanation_document_provided)
       (not explanation_document_truthful))))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定：未依限報告或公開說明，或報告內容不實
(assert (= violate_148_2_2
   (or (not report_submitted_on_time)
       (not report_content_truthful)
       (not report_public_disclosed))))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established)
       (not internal_audit_executed)
       (not internal_control_executed)
       (not internal_audit_established))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:penalty_171_1] 保險法第171-1條處罰條件：違反148-1_2或148-2_1規定
(assert (= penalty_171_1 (or violate_148_1_2 violate_148_2_1)))

; [insurance:penalty_171_2] 保險法第171-1條處罰條件：違反148-2_2規定
(assert (= penalty_171_2 violate_148_2_2))

; [insurance:penalty_171_3] 保險法第171-1條處罰條件：違反148-3_1規定
(assert (= penalty_171_3 violate_148_3_1))

; [insurance:penalty_171_4] 保險法第171-1條處罰條件：違反148-3_2規定
(assert (= penalty_171_4 violate_148_3_2))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法第171-1條任一規定時處罰
(assert (= penalty (or penalty_171_1 penalty_171_2 penalty_171_3 penalty_171_4)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_2_flag true))
(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 false))
(assert (= violate_148_3_2 true))
(assert (= explanation_document_provided true))
(assert (= explanation_document_compliant true))
(assert (= explanation_document_truthful true))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= internal_audit_established true))
(assert (= internal_audit_executed true))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= report_submitted_on_time true))
(assert (= report_public_disclosed true))
(assert (= report_content_truthful true))
(assert (= penalty_171_1 true))
(assert (= penalty_171_2 false))
(assert (= penalty_171_3 false))
(assert (= penalty_171_4 true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 23
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
