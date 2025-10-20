; SMT2 file generated from compliance case automatic
; Case ID: case_183
; Generated at: 2025-10-19T10:00:48.956125
;
; This file can be executed with Z3:
;   z3 case_183.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_and_no_measures Bool)
(declare-const business_improvement_plan_completed Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_severe_insufficient_and_no_measures Bool)
(declare-const financial_improvement_plan_completed Bool)
(declare-const financial_or_business_deterioration_significant Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_deterioration_accelerated Bool)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const profit_loss_deterioration_accelerated Bool)
(declare-const significant_deterioration_and_no_plan Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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

; [insurance:capital_level_severe_insufficient_and_no_measures] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_severe_insufficient_and_no_measures
   (and (= 4 capital_level)
        (not (or financial_improvement_plan_completed
                 business_improvement_plan_completed
                 merger_completed
                 capital_increase_completed)))))

; [insurance:capital_level_significant_deterioration_and_no_measures] 財務或業務狀況顯著惡化且未提出或未核定改善計畫
(assert (= significant_deterioration_and_no_plan
   (and financial_or_business_deterioration_significant
        (or (not improvement_plan_submitted) (not improvement_plan_approved)))))

; [insurance:capital_level_accelerated_deterioration_and_no_measures] 損益、淨值加速惡化且未改善
(assert (= accelerated_deterioration_and_no_measures
   (and profit_loss_deterioration_accelerated
        net_worth_deterioration_accelerated
        (not improvement_plan_executed))))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或財務業務顯著惡化未提出或未核定改善計畫，或損益淨值加速惡化未改善
(assert (= penalty
   (or accelerated_deterioration_and_no_measures
       capital_severe_insufficient_and_no_measures
       significant_deterioration_and_no_plan)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 50.0))
(assert (= net_worth_ratio 3.0))
(assert (= capital_increase_completed false))
(assert (= financial_improvement_plan_completed false))
(assert (= business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= financial_or_business_deterioration_significant true))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_executed false))
(assert (= profit_loss_deterioration_accelerated false))
(assert (= net_worth_deterioration_accelerated false))
(assert (= capital_level 1))
(assert (= accelerated_deterioration_and_no_measures false))
(assert (= capital_severe_insufficient_and_no_measures false))
(assert (= penalty false))
(assert (= significant_deterioration_and_no_plan false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 18
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
