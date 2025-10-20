; SMT2 file generated from compliance case automatic
; Case ID: case_439
; Generated at: 2025-10-19T15:59:02.288510
;
; This file can be executed with Z3:
;   z3 case_439.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_improvement_completed_within_deadline Bool)
(declare-const capital_level Int)
(declare-const capital_level_severely_insufficient_and_no_improvement Bool)
(declare-const contract_or_major_commitment_made Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_status_significantly_deteriorated Bool)
(declare-const improvement_plan_accelerated_deterioration_or_no_improvement Bool)
(declare-const improvement_plan_approved_by_authority Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_impacting_actions Bool)
(declare-const payment_amount Real)
(declare-const penalty Bool)
(declare-const profit_loss_and_net_worth_accelerated_deterioration Bool)
(declare-const risk_of_harming_insured_rights Bool)
(declare-const supervisory_measures_in_effect Bool)
(declare-const supervisory_measures_required Bool)
(declare-const supervisory_payment_limit Real)
(declare-const supervisory_restrictions Bool)
(declare-const unable_to_fulfill_contractual_responsibilities Bool)
(declare-const unable_to_pay_debts Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_severely_insufficient_and_no_improvement] 資本嚴重不足且未於期限內完成增資、改善計畫或合併
(assert (= capital_level_severely_insufficient_and_no_improvement
   (and (= 4 capital_level) (not capital_improvement_completed_within_deadline))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or unable_to_fulfill_contractual_responsibilities
       risk_of_harming_insured_rights
       financial_or_business_status_significantly_deteriorated
       unable_to_pay_debts)))

; [insurance:improvement_plan_submitted_and_approved] 保險業已提出且主管機關核定財務或業務改善計畫
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved_by_authority)))

; [insurance:improvement_plan_accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration_or_no_improvement
   (or profit_loss_and_net_worth_accelerated_deterioration
       (not improvement_plan_effective))))

; [insurance:supervisory_measures_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_required
   (or capital_level_severely_insufficient_and_no_improvement
       (and (not capital_level_severely_insufficient_and_no_improvement)
            financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_accelerated_deterioration_or_no_improvement))))

; [insurance:supervisory_restrictions] 監管處分限制保險業行為
(assert (let ((a!1 (and supervisory_measures_in_effect
                (not (or (not other_major_financial_impacting_actions)
                         (not contract_or_major_commitment_made)
                         (<= payment_amount supervisory_payment_limit))))))
  (= supervisory_restrictions a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或財務業務惡化且未改善，或違反監管限制時處罰
(assert (= penalty
   (or (not supervisory_restrictions)
       (and (= 4 capital_level)
            (not capital_improvement_completed_within_deadline))
       (and financial_or_business_deterioration
            (not improvement_plan_effective)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= capital_improvement_completed_within_deadline false))
(assert (= financial_or_business_deterioration true))
(assert (= financial_or_business_status_significantly_deteriorated true))
(assert (= unable_to_pay_debts false))
(assert (= unable_to_fulfill_contractual_responsibilities false))
(assert (= risk_of_harming_insured_rights false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved_by_authority false))
(assert (= improvement_plan_effective false))
(assert (= improvement_plan_accelerated_deterioration_or_no_improvement true))
(assert (= contract_or_major_commitment_made false))
(assert (= other_major_financial_impacting_actions false))
(assert (= payment_amount 0.0))
(assert (= supervisory_measures_in_effect true))
(assert (= supervisory_measures_required true))
(assert (= supervisory_restrictions true))
(assert (= penalty true))
(assert (= capital_level 0))
(assert (= capital_level_severely_insufficient_and_no_improvement false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= profit_loss_and_net_worth_accelerated_deterioration false))
(assert (= supervisory_payment_limit 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 25
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
