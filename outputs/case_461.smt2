; SMT2 file generated from compliance case automatic
; Case ID: case_461
; Generated at: 2025-10-21T10:19:48.189582
;
; This file can be executed with Z3:
;   z3 case_461.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_improvement_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_severe_and_no_improvement Bool)
(declare-const financial_deterioration_and_no_improvement Bool)
(declare-const financial_deterioration_and_no_plan Bool)
(declare-const financial_or_business_deteriorated Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const penalty Bool)
(declare-const profit_and_net_worth_accelerated_deterioration Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_severe_and_no_improvement] 資本嚴重不足且未於期限完成增資、改善計畫或合併
(assert (= capital_level_severe_and_no_improvement
   (and (= 4 capital_level) (not capital_improvement_completed))))

; [insurance:financial_deterioration_and_no_plan] 財務或業務狀況顯著惡化且未提出或未核定改善計畫
(assert (= financial_deterioration_and_no_plan
   (and financial_or_business_deteriorated
        (not improvement_plan_submitted)
        (not improvement_plan_approved))))

; [insurance:financial_deterioration_and_no_improvement] 損益、淨值加速惡化且經輔導仍未改善
(assert (= financial_deterioration_and_no_improvement
   (and profit_and_net_worth_accelerated_deterioration
        (not improvement_plan_executed))))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成改善計畫，或財務惡化未提出或未核定改善計畫，或損益淨值加速惡化未改善時處罰
(assert (= penalty
   (or financial_deterioration_and_no_plan
       financial_deterioration_and_no_improvement
       capital_level_severe_and_no_improvement)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= capital_improvement_completed false))
(assert (= financial_or_business_deteriorated true))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_executed false))
(assert (= profit_and_net_worth_accelerated_deterioration false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 13
; Total facts: 8
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
