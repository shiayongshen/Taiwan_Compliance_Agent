; SMT2 file generated from compliance case automatic
; Case ID: case_108
; Generated at: 2025-10-21T01:51:57.993486
;
; This file can be executed with Z3:
;   z3 case_108.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_done Bool)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_done Bool)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_done Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const penalty_171_1 Bool)
(declare-const penalty_171_2 Bool)
(declare-const penalty_171_3 Bool)
(declare-const penalty_171_4 Bool)
(declare-const penalty_171_5 Bool)
(declare-const report_content_truthful Bool)
(declare-const report_publicly_explained Bool)
(declare-const report_submitted_on_time Bool)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_148_1_1_or_2_flag Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (not (<= 2.0 net_worth_ratio)) (<= 0.0 net_worth_ratio))
               (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))))
      (a!2 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                (ite a!1 3 a!2))))
  (= capital_level a!3))))

; [insurance:violate_148_1_1_or_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_1_or_2 violate_148_1_1_or_2_flag))

; [insurance:violate_148_2_1] 違反第一百四十八條之二第一項規定（未提供說明文件、說明文件未依規定記載或記載不實）
(assert (= violate_148_2_1
   (or (not explanation_document_provided)
       (not explanation_document_truthful)
       (not explanation_document_compliant))))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定（未依限報告或公開說明，或報告內容不實）
(assert (= violate_148_2_2
   (or (not report_submitted_on_time)
       (not report_content_truthful)
       (not report_publicly_explained))))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定（未建立或未執行內部控制或稽核制度）
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定（未建立或未執行內部處理制度或程序）
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:penalty_171_1] 違反第148-1第一項或第二項規定，處罰六十萬以上六百萬元
(assert (= penalty_171_1 violate_148_1_1_or_2))

; [insurance:penalty_171_2] 違反第148-2第一項規定，處罰六十萬以上六百萬元
(assert (= penalty_171_2 violate_148_2_1))

; [insurance:penalty_171_3] 違反第148-2第二項規定，處罰三十萬以上三百萬元
(assert (= penalty_171_3 violate_148_2_2))

; [insurance:penalty_171_4] 違反第148-3第一項規定，處罰六十萬以上一千二百萬元
(assert (= penalty_171_4 violate_148_3_1))

; [insurance:penalty_171_5] 違反第148-3第二項規定，處罰六十萬以上一千二百萬元
(assert (= penalty_171_5 violate_148_3_2))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施已執行
(assert (= capital_insufficient_measures_executed capital_insufficient_measures_done))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_significantly_insufficient_measures_executed
   capital_significantly_insufficient_measures_done))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_severely_insufficient_measures_executed
   capital_severely_insufficient_measures_done))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一規定或資本不足等級未執行對應措施時處罰
(assert (= penalty
   (or (and (= 4 capital_level)
            (not capital_severely_insufficient_measures_executed))
       violate_148_3_2
       violate_148_2_2
       (and (= 3 capital_level)
            (not capital_significantly_insufficient_measures_executed))
       violate_148_3_1
       violate_148_2_1
       (and (= 2 capital_level) (not capital_insufficient_measures_executed))
       violate_148_1_1_or_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio (/ 5.0 2.0)))
(assert (= capital_level 1))
(assert (= violate_148_1_1_or_2_flag true))
(assert (= violate_148_1_1_or_2 true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 true))
(assert (= violate_148_3_2 false))
(assert (= explanation_document_provided true))
(assert (= explanation_document_compliant true))
(assert (= explanation_document_truthful true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= report_submitted_on_time true))
(assert (= report_publicly_explained true))
(assert (= report_content_truthful true))
(assert (= capital_insufficient_measures_done false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_done false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= capital_severely_insufficient_measures_done false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= penalty true))
(assert (= penalty_171_1 true))
(assert (= penalty_171_2 false))
(assert (= penalty_171_3 false))
(assert (= penalty_171_4 true))
(assert (= penalty_171_5 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 32
; Total facts: 32
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
