; SMT2 file generated from compliance case automatic
; Case ID: case_156
; Generated at: 2025-10-19T09:33:10.453756
;
; This file can be executed with Z3:
;   z3 case_156.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_and_no_improvement Bool)
(declare-const accelerated_loss_and_net_worth_decline Bool)
(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_level_adjusted Int)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const improvement_after_guidance Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_by_authority Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const penalty Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const serious_financial_deterioration Bool)
(declare-const severely_insufficient_measures_executed Bool)
(declare-const significantly_insufficient_measures_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (and (<= 0.0 net_worth_ratio_prev1)
                    (not (<= 2.0 net_worth_ratio_prev1)))
               (and (<= 0.0 net_worth_ratio_prev2)
                    (not (<= 2.0 net_worth_ratio_prev2)))))
      (a!2 (and (<= 150.0 capital_adequacy_ratio)
                (not (<= 200.0 capital_adequacy_ratio))
                (or (not (<= 2.0 net_worth_ratio_prev1))
                    (not (<= 2.0 net_worth_ratio_prev2))))))
(let ((a!3 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     a!1)
                3
                (ite a!2 2 (ite (<= 200.0 capital_adequacy_ratio) 1 0)))))
(let ((a!4 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!3)))
  (= capital_level a!4)))))

; [insurance:capital_level_adjusted] 資本等級調整，若同時符合多等級，取較低等級
(assert (let ((a!1 (ite (= 3 capital_level)
                3
                (ite (= 2 capital_level) 2 (ite (= 1 capital_level) 1 0)))))
  (= capital_level_adjusted (ite (= 4 capital_level) 4 a!1))))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施執行完成
(assert (= capital_severely_insufficient_measures_executed
   severely_insufficient_measures_executed))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施執行完成
(assert (= capital_significantly_insufficient_measures_executed
   significantly_insufficient_measures_executed))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施執行完成
(assert (= capital_insufficient_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:serious_financial_deterioration] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= serious_financial_deterioration
   (or cannot_fulfill_contract risk_to_insured_interest cannot_pay_debt)))

; [insurance:improvement_plan_approved] 財務或業務改善計畫已提出並經主管機關核定
(assert (= improvement_plan_approved
   (and improvement_plan_submitted improvement_plan_approved_by_authority)))

; [insurance:accelerated_deterioration_and_no_improvement] 損益、淨值加速惡化且經輔導仍未改善
(assert (= accelerated_deterioration_and_no_improvement
   (and accelerated_loss_and_net_worth_decline (not improvement_after_guidance))))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或財務狀況惡化未改善時處罰
(assert (= penalty
   (or (and accelerated_deterioration_and_no_improvement
            (not improvement_plan_approved))
       (and serious_financial_deterioration (not improvement_plan_approved))
       (and (= 4 capital_level)
            (not capital_severely_insufficient_measures_executed)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio_prev1 (/ 5.0 2.0)))
(assert (= net_worth_ratio_prev2 (/ 5.0 2.0)))
(assert (= capital_level 1))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= serious_financial_deterioration false))
(assert (= improvement_plan_approved false))
(assert (= accelerated_deterioration_and_no_improvement false))
(assert (= accelerated_loss_and_net_worth_decline false))
(assert (= cannot_fulfill_contract false))
(assert (= cannot_pay_debt false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_level_adjusted 0))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= improvement_after_guidance false))
(assert (= improvement_plan_approved_by_authority false))
(assert (= improvement_plan_executed false))
(assert (= improvement_plan_submitted false))
(assert (= penalty false))
(assert (= risk_to_insured_interest false))
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
; Total constraints: 10
; Total variables: 23
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
