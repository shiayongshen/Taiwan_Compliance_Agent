; SMT2 file generated from compliance case automatic
; Case ID: case_206
; Generated at: 2025-10-21T04:31:48.939576
;
; This file can be executed with Z3:
;   z3 case_206.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_completed Bool)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_severely_insufficient_penalty_condition Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_penalty Bool)
(declare-const capital_significantly_insufficient_penalty_condition Bool)
(declare-const capital_significantly_insufficient_penalty_condition2 Bool)
(declare-const financial_deterioration_measures_submitted Bool)
(declare-const financial_deterioration_penalty Bool)
(declare-const financial_deterioration_penalty_condition Bool)
(declare-const improvement_effective Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const risk_to_insured Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))
               (and (not (<= 2.0 net_worth_ratio_prev1))
                    (not (<= 2.0 net_worth_ratio_prev2))
                    (<= 0.0 net_worth_ratio_prev1))))
      (a!2 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio_prev1))
                    (not (<= 3.0 net_worth_ratio_prev2))
                    (or (<= 2.0 net_worth_ratio_prev1)
                        (<= 2.0 net_worth_ratio_prev2)))))
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

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級增資、財務或業務改善計畫或合併已於主管機關規定期限完成
(assert (= capital_severely_insufficient_measures_executed
   capital_severely_insufficient_measures_completed))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級改善計畫已提出且經主管機關核定，且損益、淨值未加速惡化或已改善
(assert (= capital_significantly_insufficient_measures_executed
   (and improvement_plan_submitted
        improvement_plan_approved
        (or improvement_effective (not profit_loss_accelerated_deterioration)))))

; [insurance:capital_severely_insufficient_penalty_condition] 資本嚴重不足且未於期限完成增資、改善計畫或合併
(assert (= capital_severely_insufficient_penalty_condition
   (and (= 4 capital_level)
        (not capital_severely_insufficient_measures_executed))))

; [insurance:capital_significantly_insufficient_penalty_condition] 資本顯著不足且損益、淨值加速惡化或未改善
(assert (= capital_significantly_insufficient_penalty_condition
   (and (= 3 capital_level)
        (or profit_loss_accelerated_deterioration (not improvement_effective)))))

; [insurance:capital_significantly_insufficient_penalty_condition2] 資本顯著不足且未提出或未經核定改善計畫
(assert (= capital_significantly_insufficient_penalty_condition2
   (and (= 3 capital_level)
        (or (not improvement_plan_submitted) (not improvement_plan_approved)))))

; [insurance:capital_significantly_insufficient_penalty] 資本顯著不足違規處罰條件
(assert (= capital_significantly_insufficient_penalty
   (or capital_significantly_insufficient_penalty_condition
       capital_significantly_insufficient_penalty_condition2)))

; [insurance:financial_deterioration_penalty_condition] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_deterioration_penalty_condition
   (or risk_to_insured cannot_pay_debt cannot_fulfill_contract)))

; [insurance:financial_deterioration_measures_submitted] 財務或業務改善計畫已提出且經主管機關核定
(assert (= financial_deterioration_measures_submitted
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:financial_deterioration_penalty] 財務或業務狀況惡化且未改善或損益淨值加速惡化
(assert (let ((a!1 (and financial_deterioration_penalty_condition
                (or (not financial_deterioration_measures_submitted)
                    (and profit_loss_accelerated_deterioration
                         (not improvement_effective))))))
  (= financial_deterioration_penalty a!1)))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成改善計畫，或資本顯著不足且未改善，或財務狀況惡化未改善時處罰
(assert (= penalty
   (or capital_significantly_insufficient_penalty
       financial_deterioration_penalty
       (not capital_severely_insufficient_measures_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -1000000))
(assert (= net_worth_ratio_prev1 (/ 3.0 2.0)))
(assert (= net_worth_ratio_prev2 (/ 3.0 2.0)))
(assert (= cannot_fulfill_contract false))
(assert (= cannot_pay_debt false))
(assert (= risk_to_insured false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_effective false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= capital_severely_insufficient_measures_completed false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= financial_deterioration_measures_submitted false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 23
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
