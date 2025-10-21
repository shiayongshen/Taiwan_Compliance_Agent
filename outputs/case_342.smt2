; SMT2 file generated from compliance case automatic
; Case ID: case_342
; Generated at: 2025-10-21T07:38:34.565829
;
; This file can be executed with Z3:
;   z3 case_342.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_improvement_plan_completed Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const financial_improvement_plan_completed Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_effective Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const serious_insufficient_and_no_measures Bool)
(declare-const significant_deterioration_and_no_approved_plan Bool)
(declare-const significant_deterioration_and_no_improvement Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio_prev1))
                    (not (<= 3.0 net_worth_ratio_prev2))
                    (or (<= 2.0 net_worth_ratio_prev1)
                        (<= 2.0 net_worth_ratio_prev2)))))
      (a!2 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 2.0 net_worth_ratio_prev1))
                    (not (<= 2.0 net_worth_ratio_prev2))
                    (<= 0.0 net_worth_ratio_prev1)
                    (<= 0.0 net_worth_ratio_prev2))))
      (a!3 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio_prev1)
                         (<= 3.0 net_worth_ratio_prev2)))
                1
                0)))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                (ite a!1 3 (ite a!2 2 a!3)))))
  (= capital_level a!4))))

; [insurance:serious_insufficient_and_no_measures] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= serious_insufficient_and_no_measures
   (and (= 4 capital_level)
        (not (or merger_completed
                 capital_increase_completed
                 financial_improvement_plan_completed
                 business_improvement_plan_completed)))))

; [insurance:significant_deterioration_and_no_approved_plan] 財務或業務狀況顯著惡化且未提出或未核定改善計畫
(assert (= significant_deterioration_and_no_approved_plan
   (and financial_or_business_deterioration
        (not improvement_plan_submitted_and_approved))))

; [insurance:significant_deterioration_and_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= significant_deterioration_and_no_improvement
   (and financial_or_business_deterioration
        improvement_plan_submitted_and_approved
        (or profit_loss_accelerated_deterioration (not improvement_effective)))))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或財務業務顯著惡化未提出或未核定改善計畫，或損益淨值加速惡化且未改善時處罰
(assert (= penalty
   (or serious_insufficient_and_no_measures
       significant_deterioration_and_no_approved_plan
       significant_deterioration_and_no_improvement)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio_prev1 (/ 3.0 2.0)))
(assert (= net_worth_ratio_prev2 (/ 9.0 5.0)))
(assert (= capital_increase_completed false))
(assert (= financial_improvement_plan_completed false))
(assert (= business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= financial_or_business_deterioration true))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= improvement_effective false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 17
; Total facts: 12
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
