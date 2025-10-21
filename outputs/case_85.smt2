; SMT2 file generated from compliance case automatic
; Case ID: case_85
; Generated at: 2025-10-21T01:08:42.771667
;
; This file can be executed with Z3:
;   z3 case_85.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const explanation_document_properly_recorded Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const internal_audit_established Bool)
(declare-const internal_audit_executed Bool)
(declare-const internal_control_and_handling_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const penalty Bool)
(declare-const public_explanation_made Bool)
(declare-const report_and_explanation_truthful Bool)
(declare-const reported_to_authority_on_time Bool)
(declare-const violate_148_1 Bool)
(declare-const violate_148_1_rule Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1] 違反保險法第148條之一第一項或第二項規定
(assert (= violate_148_1 violate_148_1_rule))

; [insurance:violate_148_2_1] 違反保險法第148條之二第一項規定：未提供說明文件供查閱、或說明文件未依規定記載、或說明文件記載不實
(assert (= violate_148_2_1
   (or (not explanation_document_properly_recorded)
       (not explanation_document_truthful)
       (not explanation_document_provided))))

; [insurance:violate_148_2_2] 違反保險法第148條之二第二項規定：未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2
   (or (not report_and_explanation_truthful)
       (not public_explanation_made)
       (not reported_to_authority_on_time))))

; [insurance:violate_148_3_1] 違反保險法第148條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established)
       (not internal_audit_executed)
       (not internal_control_executed)
       (not internal_audit_established))))

; [insurance:violate_148_3_2] 違反保險法第148條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:internal_control_and_handling_ok] 內部控制及稽核制度與內部處理制度及程序均已建立且執行
(assert (= internal_control_and_handling_ok
   (and internal_control_established
        internal_control_executed
        internal_audit_established
        internal_audit_executed
        internal_handling_established
        internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or violate_148_1
       violate_148_2_1
       violate_148_2_2
       violate_148_3_1
       violate_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1 false))
(assert (= violate_148_1_rule false))
(assert (= violate_148_2_1 false))
(assert (= explanation_document_provided true))
(assert (= explanation_document_properly_recorded true))
(assert (= explanation_document_truthful true))
(assert (= violate_148_2_2 false))
(assert (= reported_to_authority_on_time true))
(assert (= public_explanation_made true))
(assert (= report_and_explanation_truthful true))
(assert (= violate_148_3_1 true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_audit_established false))
(assert (= internal_audit_executed false))
(assert (= violate_148_3_2 true))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
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
; Total variables: 20
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
