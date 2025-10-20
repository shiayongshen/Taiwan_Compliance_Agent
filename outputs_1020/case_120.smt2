; SMT2 file generated from compliance case automatic
; Case ID: case_120
; Generated at: 2025-10-19T08:30:35.846376
;
; This file can be executed with Z3:
;   z3 case_120.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_insufficient_measures_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const explanation_documents_false Bool)
(declare-const explanation_documents_not_according_to_regulations Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const not_proactively_public_explanation Bool)
(declare-const not_provide_explanation_documents Bool)
(declare-const not_report_to_authority_in_time Bool)
(declare-const penalty Bool)
(declare-const report_or_public_explanation_false Bool)
(declare-const violation_148_1_2 Bool)
(declare-const violation_148_2_1 Bool)
(declare-const violation_148_2_2 Bool)
(declare-const violation_148_3_1 Bool)
(declare-const violation_148_3_2 Bool)
(declare-const violation_149 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_adequacy_ratio] 資本適足率
(assert true)

; [insurance:net_worth_ratio] 淨值比率
(assert true)

; [insurance:net_worth] 淨值
(assert true)

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:violation_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert true)

; [insurance:violation_148_2_1] 違反第一百四十八條之二第一項規定
(assert (= violation_148_2_1
   (or explanation_documents_not_according_to_regulations
       explanation_documents_false
       not_provide_explanation_documents)))

; [insurance:violation_148_2_2] 違反第一百四十八條之二第二項規定
(assert (= violation_148_2_2
   (or not_report_to_authority_in_time
       report_or_public_explanation_false
       not_proactively_public_explanation)))

; [insurance:violation_148_3_1] 違反第一百四十八條之三第一項規定
(assert (= violation_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violation_148_3_2] 違反第一百四十八條之三第二項規定
(assert (= violation_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:violation_149] 違反第一百四十九條規定，主管機關得予以處分
(assert true)

; [insurance:capital_insufficient_measures_submitted] 資本不足者已提出增資、財務或業務改善計畫
(assert true)

; [insurance:capital_insufficient_measures_executed] 資本不足者已依計畫確實執行
(assert true)

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足者已執行對應措施
(assert true)

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足者已執行對應措施
(assert true)

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反相關條文規定或資本不足且未執行對應措施時處罰
(assert (= penalty
   (or violation_148_1_2
       violation_148_2_1
       violation_148_2_2
       (and (= 3 capital_level)
            (not capital_significantly_insufficient_measures_executed))
       violation_148_3_2
       violation_148_3_1
       (and (= 4 capital_level)
            (not capital_severely_insufficient_measures_executed))
       (and (= 2 capital_level) (not capital_insufficient_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= capital_level 1))
(assert (= violation_148_1_2 true))
(assert (= violation_148_2_1 true))
(assert (= violation_148_2_2 false))
(assert (= violation_148_3_1 true))
(assert (= violation_148_3_2 true))
(assert (= violation_149 true))
(assert (= capital_insufficient_measures_submitted false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= explanation_documents_false true))
(assert (= explanation_documents_not_according_to_regulations true))
(assert (= not_provide_explanation_documents false))
(assert (= not_report_to_authority_in_time false))
(assert (= not_proactively_public_explanation false))
(assert (= report_or_public_explanation_false false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
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
; Total constraints: 16
; Total variables: 25
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
