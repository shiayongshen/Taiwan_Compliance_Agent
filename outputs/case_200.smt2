; SMT2 file generated from compliance case automatic
; Case ID: case_200
; Generated at: 2025-10-21T04:22:30.579876
;
; This file can be executed with Z3:
;   z3 case_200.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const financial_or_business_deteriorated Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const insufficient_and_no_measures Bool)
(declare-const insufficient_measures_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const penalty Bool)
(declare-const serious_insufficient_and_no_measures Bool)
(declare-const severely_insufficient_measures_completed Bool)
(declare-const severely_insufficient_measures_executed Bool)
(declare-const significant_deterioration_and_no_measures Bool)
(declare-const significantly_insufficient_measures_completed Bool)
(declare-const significantly_insufficient_measures_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (and (not (<= 3.0 net_worth_ratio_prev1))
                (not (<= 3.0 net_worth_ratio_prev2))
                (<= 2.0
                    (ite (>= net_worth_ratio_prev1 net_worth_ratio_prev2)
                         net_worth_ratio_prev1
                         net_worth_ratio_prev2))))
      (a!3 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (or (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))
               a!1)))
(let ((a!4 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                (ite a!2 3 a!3))))
  (= capital_level a!4)))))

; [insurance:severely_insufficient_measures_executed] 資本嚴重不足等級措施已執行
(assert (= severely_insufficient_measures_executed
   severely_insufficient_measures_completed))

; [insurance:significantly_insufficient_measures_executed] 資本顯著不足等級措施已執行
(assert (= significantly_insufficient_measures_executed
   significantly_insufficient_measures_completed))

; [insurance:insufficient_measures_executed] 資本不足等級措施已執行
(assert (= insufficient_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:serious_insufficient_and_no_measures] 資本嚴重不足且未依規定完成增資或改善計畫
(assert (= serious_insufficient_and_no_measures
   (and (= 4 capital_level) (not severely_insufficient_measures_executed))))

; [insurance:significant_deterioration_and_no_measures] 資本顯著不足且未執行改善計畫且財務或業務狀況顯著惡化
(assert (= significant_deterioration_and_no_measures
   (and (= 3 capital_level)
        (not significantly_insufficient_measures_executed)
        financial_or_business_deteriorated)))

; [insurance:insufficient_and_no_measures] 資本不足且未執行改善計畫
(assert (= insufficient_and_no_measures
   (and (= 2 capital_level) (not insufficient_measures_executed))))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或資本顯著不足且財務惡化未改善，或資本不足且未執行改善計畫
(assert (= penalty
   (or significant_deterioration_and_no_measures
       insufficient_and_no_measures
       serious_insufficient_and_no_measures)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio_prev1 (/ 5.0 2.0)))
(assert (= net_worth_ratio_prev2 (/ 27.0 10.0)))
(assert (= financial_or_business_deteriorated true))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= severely_insufficient_measures_completed false))
(assert (= significantly_insufficient_measures_completed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 17
; Total facts: 9
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
