; SMT2 file generated from compliance case automatic
; Case ID: case_197
; Generated at: 2025-10-21T04:18:09.383657
;
; This file can be executed with Z3:
;   z3 case_197.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures Bool)
(declare-const capital_level Int)
(declare-const capital_level_corrected Int)
(declare-const capital_severely_insufficient_measures Bool)
(declare-const capital_significantly_insufficient_measures Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const severely_insufficient_measures_executed Bool)
(declare-const significantly_insufficient_measures_executed Bool)

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
(assert (let ((a!1 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio))
                    (not (<= 2.0 net_worth_ratio))))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                (ite a!1 2 (ite (<= 200.0 capital_adequacy_ratio) 1 0)))))
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_corrected] 資本等級修正（以較低等級為準）
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
  (= capital_level_corrected a!3)))))

; [insurance:improvement_plan_submitted] 增資、財務或業務改善計畫已提出
(assert true)

; [insurance:improvement_plan_executed] 增資、財務或業務改善計畫已執行
(assert true)

; [insurance:capital_insufficient_measures] 資本不足等級措施執行完成
(assert (= capital_insufficient_measures
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:capital_significantly_insufficient_measures] 資本顯著不足等級措施執行完成
(assert (= capital_significantly_insufficient_measures
   significantly_insufficient_measures_executed))

; [insurance:capital_severely_insufficient_measures] 資本嚴重不足等級措施執行完成
(assert (= capital_severely_insufficient_measures
   severely_insufficient_measures_executed))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：資本不足等級達一定程度且未執行對應措施時處罰
(assert (= penalty
   (or (and (= 4 capital_level_corrected)
            (not capital_severely_insufficient_measures))
       (and (= 3 capital_level_corrected)
            (not capital_significantly_insufficient_measures))
       (and (= 2 capital_level_corrected) (not capital_insufficient_measures)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= severely_insufficient_measures_executed false))
(assert (= significantly_insufficient_measures_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 13
; Total facts: 7
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
