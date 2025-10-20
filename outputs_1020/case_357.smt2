; SMT2 file generated from compliance case automatic
; Case ID: case_357
; Generated at: 2025-10-19T13:56:33.910848
;
; This file can be executed with Z3:
;   z3 case_357.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_insufficient_measures_executed_flag Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_and_not_completed Bool)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_severely_insufficient_measures_executed_flag Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_executed_flag Bool)
(declare-const financial_deterioration_and_plan_not_improved Bool)
(declare-const financial_deterioration_and_plan_not_improved_flag Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_deterioration_flag Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_flag Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_completed_flag Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_flag Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (and (not (<= 2.0 net_worth_ratio)) (<= 0.0 net_worth_ratio))
               (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))))
      (a!2 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio)))))
(let ((a!3 (ite a!1 3 (ite a!2 2 (ite (<= 200.0 capital_adequacy_ratio) 1 0)))))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!3)))
  (= capital_level a!4)))))

; [insurance:capital_level_lowest_rule] 資本等級以較低等級為準
(assert true)

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施執行完成
(assert (= capital_severely_insufficient_measures_executed
   capital_severely_insufficient_measures_executed_flag))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施執行完成
(assert (= capital_significantly_insufficient_measures_executed
   capital_significantly_insufficient_measures_executed_flag))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施執行完成
(assert (= capital_insufficient_measures_executed
   capital_insufficient_measures_executed_flag))

; [insurance:improvement_plan_submitted] 已提交增資、財務或業務改善計畫
(assert (= improvement_plan_submitted improvement_plan_submitted_flag))

; [insurance:improvement_plan_completed] 已完成增資、財務或業務改善計畫
(assert (= improvement_plan_completed improvement_plan_completed_flag))

; [insurance:capital_severely_insufficient_and_not_completed] 資本嚴重不足且未於期限完成增資或改善計畫
(assert (= capital_severely_insufficient_and_not_completed
   (and (= 4 capital_level) (not improvement_plan_completed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration financial_or_business_deterioration_flag))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_flag))

; [insurance:financial_deterioration_and_plan_not_improved] 損益、淨值加速惡化或輔導未改善且有損及被保險人權益之虞
(assert (= financial_deterioration_and_plan_not_improved
   financial_deterioration_and_plan_not_improved_flag))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未完成改善計畫，或財務惡化且未改善時處罰
(assert (= penalty
   (or capital_severely_insufficient_and_not_completed
       (and financial_or_business_deterioration (not improvement_plan_approved))
       financial_deterioration_and_plan_not_improved)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio (/ 5.0 2.0)))
(assert (= improvement_plan_submitted_flag false))
(assert (= improvement_plan_completed_flag false))
(assert (= capital_insufficient_measures_executed_flag false))
(assert (= capital_significantly_insufficient_measures_executed_flag false))
(assert (= capital_severely_insufficient_measures_executed_flag false))
(assert (= financial_or_business_deterioration_flag true))
(assert (= improvement_plan_approved_flag false))
(assert (= financial_deterioration_and_plan_not_improved_flag false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_level 0))
(assert (= capital_severely_insufficient_and_not_completed false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= financial_deterioration_and_plan_not_improved false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_completed false))
(assert (= improvement_plan_submitted false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 22
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
