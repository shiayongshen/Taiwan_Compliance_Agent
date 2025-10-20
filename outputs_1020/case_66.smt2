; SMT2 file generated from compliance case automatic
; Case ID: case_66
; Generated at: 2025-10-19T07:04:04.825342
;
; This file can be executed with Z3:
;   z3 case_66.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const explanation_doc_false Bool)
(declare-const explanation_doc_not_according_to_rule Bool)
(declare-const internal_audit_established Bool)
(declare-const internal_audit_executed Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const not_proactively_disclose Bool)
(declare-const not_provide_explanation_doc Bool)
(declare-const not_report_to_authority_in_time Bool)
(declare-const penalty Bool)
(declare-const report_or_disclosure_false Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_1_2_flag Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反保險法第148條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_2_flag))

; [insurance:violate_148_2_1] 違反保險法第148條之二第一項規定：未提供說明文件供查閱、或說明文件未依規定記載、或說明文件記載不實
(assert (= violate_148_2_1
   (or explanation_doc_false
       explanation_doc_not_according_to_rule
       not_provide_explanation_doc)))

; [insurance:violate_148_2_2] 違反保險法第148條之二第二項規定：未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2
   (or report_or_disclosure_false
       not_proactively_disclose
       not_report_to_authority_in_time)))

; [insurance:violate_148_3_1] 違反保險法第148條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established)
       (not internal_audit_established)
       (not internal_control_executed)
       (not internal_audit_executed))))

; [insurance:violate_148_3_2] 違反保險法第148條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:internal_control_and_audit_ok] 已建立且執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established
        internal_control_executed
        internal_audit_established
        internal_audit_executed)))

; [insurance:internal_handling_ok] 已建立且執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

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

(assert (= violate_148_1_2_flag true))
(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 true))
(assert (= violate_148_3_2 true))
(assert (= not_provide_explanation_doc false))
(assert (= explanation_doc_not_according_to_rule false))
(assert (= explanation_doc_false false))
(assert (= not_report_to_authority_in_time false))
(assert (= not_proactively_disclose false))
(assert (= report_or_disclosure_false false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_audit_established false))
(assert (= internal_audit_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_ok false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 21
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
