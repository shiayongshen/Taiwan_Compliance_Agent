; SMT2 file generated from compliance case automatic
; Case ID: case_385
; Generated at: 2025-10-21T08:37:20.583950
;
; This file can be executed with Z3:
;   z3 case_385.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const compliance_148_1_2 Bool)
(declare-const compliance_148_2_1 Bool)
(declare-const compliance_148_2_2 Bool)
(declare-const compliance_148_3_1 Bool)
(declare-const compliance_148_3_2 Bool)
(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const penalty Bool)
(declare-const public_explanation_provided Bool)
(declare-const report_or_explanation_truthful Bool)
(declare-const reported_to_authority_on_time Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_1_or_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_or_2))

; [insurance:violate_148_2_1] 違反第一百四十八條之二第一項規定：未提供說明文件供查閱、或說明文件未依規定記載、或說明文件記載不實
(assert (= violate_148_2_1
   (or (not explanation_document_provided)
       (not explanation_document_compliant)
       (not explanation_document_truthful))))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定：未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2
   (or (not public_explanation_provided)
       (not report_or_explanation_truthful)
       (not reported_to_authority_on_time))))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:internal_control_ok] 建立且執行內部控制及稽核制度
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立且執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:compliance_148_1_2] 符合第一百四十八條之一第一項及第二項規定
(assert (not (= violate_148_1_2 compliance_148_1_2)))

; [insurance:compliance_148_2_1] 符合第一百四十八條之二第一項規定
(assert (not (= violate_148_2_1 compliance_148_2_1)))

; [insurance:compliance_148_2_2] 符合第一百四十八條之二第二項規定
(assert (not (= violate_148_2_2 compliance_148_2_2)))

; [insurance:compliance_148_3_1] 符合第一百四十八條之三第一項規定
(assert (= compliance_148_3_1 internal_control_ok))

; [insurance:compliance_148_3_2] 符合第一百四十八條之三第二項規定
(assert (= compliance_148_3_2 internal_handling_ok))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第一百四十八條之一、第一百四十八條之二或第一百四十八條之三相關規定時處罰
(assert (= penalty
   (or violate_148_1_2
       violate_148_2_1
       violate_148_2_2
       violate_148_3_1
       violate_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_or_2 false))
(assert (= violate_148_1_2 false))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 false))
(assert (= violate_148_3_2 true))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed false))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= explanation_document_provided true))
(assert (= explanation_document_compliant true))
(assert (= explanation_document_truthful true))
(assert (= reported_to_authority_on_time true))
(assert (= public_explanation_provided true))
(assert (= report_or_explanation_truthful true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 24
; Total facts: 16
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
