; SMT2 file generated from compliance case automatic
; Case ID: case_320
; Generated at: 2025-10-19T13:02:23.765649
;
; This file can be executed with Z3:
;   z3 case_320.smt2
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
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const penalty Bool)
(declare-const severely_insufficient_measures_executed Bool)
(declare-const significantly_insufficient_measures_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))
               (and (not (<= 2.0 net_worth_ratio_prev1))
                    (not (<= 2.0 net_worth_ratio_prev2))
                    (<= 0.0 net_worth_ratio_prev1))))
      (a!2 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio_prev1))
                    (not (<= 3.0 net_worth_ratio_prev2))
                    (<= 2.0 net_worth_ratio_prev1))))
      (a!3 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio_prev1)
                         (<= 3.0 net_worth_ratio_prev2)))
                1
                0)))
(let ((a!4 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                (ite a!1 3 (ite a!2 2 a!3)))))
  (= capital_level a!4))))

; [insurance:capital_insufficient_measures_submitted] 資本不足者已提出增資、財務或業務改善計畫
(assert (= capital_insufficient_measures_submitted improvement_plan_submitted))

; [insurance:capital_insufficient_measures_executed] 資本不足者已依計畫確實執行
(assert (= capital_insufficient_measures_executed improvement_plan_executed))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足者已執行主管機關規定之措施
(assert (= capital_significantly_insufficient_measures_executed
   significantly_insufficient_measures_executed))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足者已執行主管機關規定之措施
(assert (= capital_severely_insufficient_measures_executed
   severely_insufficient_measures_executed))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資、改善計畫或合併，或資本顯著不足、資本不足未執行對應措施時處罰
(assert (let ((a!1 (or (and (= 2 capital_level)
                    (or (not capital_insufficient_measures_submitted)
                        (not capital_insufficient_measures_executed)))
               (and (= 4 capital_level)
                    (not capital_severely_insufficient_measures_executed))
               (and (= 3 capital_level)
                    (not capital_significantly_insufficient_measures_executed)))))
  (= penalty a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio_prev1 3.0))
(assert (= net_worth_ratio_prev2 3.0))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= severely_insufficient_measures_executed false))
(assert (= significantly_insufficient_measures_executed false))
(assert (= capital_insufficient_measures_submitted false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= capital_level 0))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 14
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
