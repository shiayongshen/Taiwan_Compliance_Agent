; SMT2 file generated from compliance case automatic
; Case ID: case_66
; Generated at: 2025-10-21T00:38:38.292028
;
; This file can be executed with Z3:
;   z3 case_66.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const penalty Bool)
(declare-const public_explanation_made Bool)
(declare-const report_content_truthful Bool)
(declare-const reported_to_authority_on_time Bool)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反保險法第148條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_1_or_2))

; [insurance:violate_148_2_1] 違反保險法第148條之二第一項規定：未提供說明文件供查閱、或說明文件未依規定記載、或說明文件記載不實
(assert (= violate_148_2_1
   (or (not explanation_document_truthful)
       (not explanation_document_provided)
       (not explanation_document_compliant))))

; [insurance:violate_148_2_2] 違反保險法第148條之二第二項規定：未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2
   (or (not reported_to_authority_on_time)
       (not public_explanation_made)
       (not report_content_truthful))))

; [insurance:violate_148_3_1] 違反保險法第148條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反保險法第148條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:internal_control_and_audit_established] 已建立內部控制及稽核制度
(assert (= internal_control_and_audit_established internal_control_established))

; [insurance:internal_handling_system_established] 已建立內部處理制度及程序
(assert (= internal_handling_system_established internal_handling_established))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or violate_148_1_2
       violate_148_2_1
       violate_148_2_2
       violate_148_3_1
       violate_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= explanation_document_provided false))
(assert (= explanation_document_compliant false))
(assert (= explanation_document_truthful false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= public_explanation_made false))
(assert (= report_content_truthful true))
(assert (= reported_to_authority_on_time true))
(assert (= violate_148_1_1_or_2 true))
(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 true))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 true))
(assert (= violate_148_3_2 true))
(assert (= internal_control_and_audit_established false))
(assert (= internal_handling_system_established false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 19
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
