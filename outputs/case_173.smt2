; SMT2 file generated from compliance case automatic
; Case ID: case_173
; Generated at: 2025-10-21T03:55:31.355009
;
; This file can be executed with Z3:
;   z3 case_173.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_adequate Bool)
(declare-const capital_insufficient Bool)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_level_consistent Bool)
(declare-const capital_level_lower_priority Bool)
(declare-const capital_severely_insufficient Bool)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const insufficient_measures_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const severely_insufficient_measures_executed Bool)
(declare-const significantly_insufficient_measures_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

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

; [insurance:capital_level_lower_priority] 資本等級以較低等級為準
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
  (= (ite capital_level_lower_priority 1 0) a!3)))))

; [insurance:capital_level_consistent] 資本等級一致性檢查
(assert (= capital_level_consistent
   (= capital_level (ite capital_level_lower_priority 1 0))))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_severely_insufficient_measures_executed
   severely_insufficient_measures_executed))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_significantly_insufficient_measures_executed
   significantly_insufficient_measures_executed))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施已執行
(assert (= capital_insufficient_measures_executed insufficient_measures_executed))

; [insurance:capital_severely_insufficient] 資本是否嚴重不足
(assert (= capital_severely_insufficient (= 4 capital_level)))

; [insurance:capital_significantly_insufficient] 資本是否顯著不足
(assert (= capital_significantly_insufficient (= 3 capital_level)))

; [insurance:capital_insufficient] 資本是否不足
(assert (= capital_insufficient (= 2 capital_level)))

; [insurance:capital_adequate] 資本是否適足
(assert (= capital_adequate (= 1 capital_level)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或資本等級不足且未執行對應措施時處罰
(assert (= penalty
   (or (and capital_significantly_insufficient
            (not capital_significantly_insufficient_measures_executed))
       (and capital_severely_insufficient
            (not capital_severely_insufficient_measures_executed))
       (and capital_insufficient (not capital_insufficient_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= insufficient_measures_executed false))
(assert (= significantly_insufficient_measures_executed false))
(assert (= severely_insufficient_measures_executed false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 17
; Total facts: 7
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
