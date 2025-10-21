; SMT2 file generated from compliance case automatic
; Case ID: case_430
; Generated at: 2025-10-21T22:42:20.140900
;
; This file can be executed with Z3:
;   z3 case_430.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration Bool)
(declare-const accelerated_deterioration_and_no_improvement Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficiency Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const capital_plan_completed Bool)
(declare-const improvement_after_counseling Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const severe_insufficiency_and_no_capital_plan Bool)
(declare-const significant_deterioration_and_no_approved_plan Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficiency] 資本等級嚴重不足判定
(assert (= capital_level_severe_insufficiency
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_level_significant_deterioration] 資本等級顯著惡化判定
(assert (= capital_level_significant_deterioration
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級不足判定
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級適足判定
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_level_4_measures_executed level_4_measures_executed))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_level_3_measures_executed level_3_measures_executed))

; [insurance:capital_level_2_measures_executed] 資本不足等級措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:severe_insufficiency_and_no_capital_plan] 嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= severe_insufficiency_and_no_capital_plan
   (and (= 4 capital_level) (not capital_plan_completed))))

; [insurance:significant_deterioration_and_no_approved_plan] 財務或業務狀況顯著惡化且未提出或未核定改善計畫
(assert (= significant_deterioration_and_no_approved_plan
   (and capital_level_significant_deterioration (not improvement_plan_approved))))

; [insurance:accelerated_deterioration_and_no_improvement] 損益、淨值加速惡化且經輔導仍未改善
(assert (= accelerated_deterioration_and_no_improvement
   (and accelerated_deterioration (not improvement_after_counseling))))

; [insurance:penalty_conditions] 處罰條件：嚴重不足且未完成增資或改善計畫，或財務顯著惡化未提出核定計畫，或加速惡化未改善
(assert (= penalty
   (or accelerated_deterioration_and_no_improvement
       (and (= 4 capital_level) (not capital_plan_completed))
       (and capital_level_significant_deterioration
            (not improvement_plan_approved)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 45.0))
(assert (= net_worth -100.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_plan_completed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= improvement_plan_approved false))
(assert (= improvement_after_counseling false))
(assert (= accelerated_deterioration false))
(assert (= level_3_measures_executed false))
(assert (= level_4_measures_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 23
; Total facts: 11
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
