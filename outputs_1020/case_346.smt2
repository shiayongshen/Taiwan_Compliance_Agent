; SMT2 file generated from compliance case automatic
; Case ID: case_346
; Generated at: 2025-10-19T13:41:15.673404
;
; This file can be executed with Z3:
;   z3 case_346.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const explanation_document_properly_recorded Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const penalty Bool)
(declare-const penalty_171_1_148_1 Bool)
(declare-const penalty_171_1_148_2_1 Bool)
(declare-const penalty_171_1_148_2_2 Bool)
(declare-const penalty_171_1_148_3_1 Bool)
(declare-const penalty_171_1_148_3_2 Bool)
(declare-const publicly_explained_on_time Bool)
(declare-const report_or_explanation_truthful Bool)
(declare-const reported_to_authority_on_time Bool)
(declare-const violate_148_1 Bool)
(declare-const violate_148_1_1 Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)
(declare-const violate_149 Bool)
(declare-const violate_149_1 Bool)
(declare-const violate_149_2 Bool)
(declare-const violate_149_3 Bool)
(declare-const violate_149_4 Bool)
(declare-const violate_149_5 Bool)
(declare-const violate_149_6 Bool)
(declare-const violate_149_7 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1 (or violate_148_1_1 violate_148_1_2)))

; [insurance:violate_148_2_1] 違反第一百四十八條之二第一項規定：未提供說明文件供查閱、或說明文件未依規定記載、或說明文件記載不實
(assert (= violate_148_2_1
   (or (not explanation_document_truthful)
       (not explanation_document_properly_recorded)
       (not explanation_document_provided))))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定：未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2
   (or (not publicly_explained_on_time)
       (not report_or_explanation_truthful)
       (not reported_to_authority_on_time))))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:violate_149] 違反保險法第149條規定，影響健全經營
(assert (= violate_149
   (or violate_149_1
       violate_149_2
       violate_149_3
       violate_149_4
       violate_149_5
       violate_149_6
       violate_149_7)))

; [insurance:penalty_171_1_148_1] 違反第一百四十八條之一第一項或第二項規定，處罰
(assert (= penalty_171_1_148_1 violate_148_1))

; [insurance:penalty_171_1_148_2_1] 違反第一百四十八條之二第一項規定，處罰
(assert (= penalty_171_1_148_2_1 violate_148_2_1))

; [insurance:penalty_171_1_148_2_2] 違反第一百四十八條之二第二項規定，處罰
(assert (= penalty_171_1_148_2_2 violate_148_2_2))

; [insurance:penalty_171_1_148_3_1] 違反第一百四十八條之三第一項規定，處罰
(assert (= penalty_171_1_148_3_1 violate_148_3_1))

; [insurance:penalty_171_1_148_3_2] 違反第一百四十八條之三第二項規定，處罰
(assert (= penalty_171_1_148_3_2 violate_148_3_2))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or penalty_171_1_148_1
       penalty_171_1_148_2_1
       penalty_171_1_148_2_2
       penalty_171_1_148_3_1
       penalty_171_1_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= explanation_document_provided true))
(assert (= explanation_document_properly_recorded true))
(assert (= explanation_document_truthful true))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed false))
(assert (= penalty true))
(assert (= penalty_171_1_148_1 false))
(assert (= penalty_171_1_148_2_1 false))
(assert (= penalty_171_1_148_2_2 false))
(assert (= penalty_171_1_148_3_1 true))
(assert (= penalty_171_1_148_3_2 true))
(assert (= publicly_explained_on_time true))
(assert (= report_or_explanation_truthful true))
(assert (= reported_to_authority_on_time true))
(assert (= violate_148_1 false))
(assert (= violate_148_1_1 false))
(assert (= violate_148_1_2 false))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 true))
(assert (= violate_148_3_2 true))
(assert (= violate_149 true))
(assert (= violate_149_1 true))
(assert (= violate_149_2 false))
(assert (= violate_149_3 false))
(assert (= violate_149_4 false))
(assert (= violate_149_5 false))
(assert (= violate_149_6 false))
(assert (= violate_149_7 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 31
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
