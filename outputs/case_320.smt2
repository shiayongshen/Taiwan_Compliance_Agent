; SMT2 file generated from compliance case automatic
; Case ID: case_320
; Generated at: 2025-10-21T07:12:08.607324
;
; This file can be executed with Z3:
;   z3 case_320.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_improvement_plan_completed Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_insufficient_plan_executed Bool)
(declare-const capital_insufficient_plan_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_penalty_condition Bool)
(declare-const capital_severely_insufficient_plan_completed Bool)
(declare-const capital_significantly_insufficient_penalty_condition Bool)
(declare-const capital_significantly_insufficient_plan_executed Bool)
(declare-const capital_significantly_insufficient_plan_submitted Bool)
(declare-const capital_significantly_worsened_condition Bool)
(declare-const days_after_deadline Int)
(declare-const financial_improvement_plan_completed Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_prev Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))
               (and (not (<= 2.0 net_worth_ratio)) (<= 0.0 net_worth_ratio))))
      (a!2 (or (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio))
               (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))))
      (a!3 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))
                1
                0)))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                (ite a!1 3 (ite a!2 2 a!3)))))
  (= capital_level a!4))))

; [insurance:capital_insufficient_plan_submitted] 資本不足者已提出增資或改善計畫
(assert (= capital_insufficient_plan_submitted
   (or (= 1 capital_level) (and (= 2 capital_level) improvement_plan_submitted))))

; [insurance:capital_insufficient_plan_executed] 資本不足者已執行增資或改善計畫
(assert (= capital_insufficient_plan_executed
   (or (= 1 capital_level) (and (= 2 capital_level) improvement_plan_executed))))

; [insurance:capital_significantly_insufficient_plan_submitted] 資本顯著不足者已提出增資或改善計畫
(assert (= capital_significantly_insufficient_plan_submitted
   (or (= 1 capital_level)
       (= 2 capital_level)
       (and (= 3 capital_level) improvement_plan_submitted))))

; [insurance:capital_significantly_insufficient_plan_executed] 資本顯著不足者已執行增資或改善計畫
(assert (= capital_significantly_insufficient_plan_executed
   (or (= 1 capital_level)
       (= 2 capital_level)
       (and (= 3 capital_level) improvement_plan_executed))))

; [insurance:capital_severely_insufficient_plan_completed] 資本嚴重不足者已完成增資、改善計畫或合併
(assert (= capital_severely_insufficient_plan_completed
   (or (not (= 4 capital_level))
       (and (= 4 capital_level)
            (or capital_increase_completed
                financial_improvement_plan_completed
                merger_completed
                business_improvement_plan_completed)))))

; [insurance:capital_severely_insufficient_penalty_condition] 資本嚴重不足且未於期限完成增資、改善計畫或合併
(assert (= capital_severely_insufficient_penalty_condition
   (and (= 4 capital_level)
        (not capital_severely_insufficient_plan_completed)
        (<= 1 days_after_deadline)
        (>= 90 days_after_deadline))))

; [insurance:capital_significantly_worsened_condition] 資本顯著不足且損益、淨值加速惡化或經輔導仍未改善
(assert (= capital_significantly_worsened_condition
   (and (= 3 capital_level)
        (or profit_loss_accelerated_deterioration
            (not improvement_plan_executed)))))

; [insurance:capital_significantly_insufficient_penalty_condition] 資本顯著不足且未改善致有損及被保險人權益之虞
(assert (= capital_significantly_insufficient_penalty_condition
   (and (= 3 capital_level) (not capital_significantly_worsened_condition))))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未於期限完成增資、改善計畫或合併，或資本顯著不足且未改善致有損及被保險人權益之虞
(assert (= penalty
   (or capital_severely_insufficient_penalty_condition
       capital_significantly_insufficient_penalty_condition)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -1000000))
(assert (= net_worth_ratio -10.0))
(assert (= net_worth_ratio_prev -10.0))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= capital_increase_completed false))
(assert (= financial_improvement_plan_completed false))
(assert (= business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= days_after_deadline 10))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 22
; Total facts: 12
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
