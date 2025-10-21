; SMT2 file generated from compliance case automatic
; Case ID: case_350
; Generated at: 2025-10-21T07:46:23.735208
;
; This file can be executed with Z3:
;   z3 case_350.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const explanation_doc_false Bool)
(declare-const explanation_doc_not_according_to_rule Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const not_proactively_disclose Bool)
(declare-const not_provide_explanation_doc Bool)
(declare-const not_report_to_authority_in_time Bool)
(declare-const penalty Bool)
(declare-const report_or_disclosure_false Bool)
(declare-const violate_148_1_1 Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反保險法第148條之一第1項或第2項規定
(assert (= violate_148_1_2 (or violate_148_1_1 violate_148_1_2)))

; [insurance:violate_148_2_1] 違反保險法第148條之二第1項規定：未提供說明文件供查閱、或說明文件未依規定記載、或說明文件記載不實
(assert (= violate_148_2_1
   (or explanation_doc_false
       explanation_doc_not_according_to_rule
       not_provide_explanation_doc)))

; [insurance:violate_148_2_2] 違反保險法第148條之二第2項規定：未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2
   (or not_report_to_authority_in_time
       not_proactively_disclose
       report_or_disclosure_false)))

; [insurance:violate_148_3_1] 違反保險法第148條之三第1項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not audit_system_executed)
       (not audit_system_established)
       (not internal_control_executed)
       (not internal_control_established))))

; [insurance:violate_148_3_2] 違反保險法第148條之三第2項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_system_established)
       (not internal_handling_system_executed))))

; [insurance:internal_control_and_audit_ok] 已建立且執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established
        internal_control_executed
        audit_system_established
        audit_system_executed)))

; [insurance:internal_handling_ok] 已建立且執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_system_established internal_handling_system_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第148條之一第1項或第2項、第148條之二第1項、第148條之二第2項、第148條之三第1項或第2項規定時處罰
(assert (= penalty
   (or violate_148_1_2
       violate_148_2_1
       violate_148_2_2
       violate_148_3_1
       violate_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_2 true))
(assert (= violate_148_1_1 false))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 false))
(assert (= violate_148_3_2 false))
(assert (= not_provide_explanation_doc false))
(assert (= explanation_doc_not_according_to_rule true))
(assert (= explanation_doc_false false))
(assert (= not_report_to_authority_in_time false))
(assert (= not_proactively_disclose false))
(assert (= report_or_disclosure_false false))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= audit_system_established true))
(assert (= audit_system_executed true))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_system_executed true))
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
; Total variables: 21
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
