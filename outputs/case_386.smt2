; SMT2 file generated from compliance case automatic
; Case ID: case_386
; Generated at: 2025-10-21T08:38:14.118435
;
; This file can be executed with Z3:
;   z3 case_386.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_4_noncompliance Bool)
(declare-const capital_level_4_penalty_period Int)
(declare-const days_since_deadline Int)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_deterioration_flag Bool)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const supervisory_measures_applicable Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)

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

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未於期限內完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level)
        (not capital_increase_completed)
        (not financial_or_business_improvement_plan_completed)
        (not merger_completed))))

; [insurance:capital_level_4_penalty_period] 資本嚴重不足且未於期限屆滿次日起九十日內完成改善
(assert (let ((a!1 (ite (and capital_level_4_noncompliance
                     (>= 90.0 (to_real days_since_deadline)))
                1
                0)))
  (= capital_level_4_penalty_period a!1)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約或損及被保險人權益
(assert (= financial_or_business_deterioration
   (and financial_or_business_deterioration_flag
        (or unable_to_fulfill_contract
            unable_to_pay_debt
            risk_to_insured_interest))))

; [insurance:improvement_plan_submitted_and_approved] 已提出並經主管機關核定財務或業務改善計畫
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值加速惡化且經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration
   (and profit_loss_accelerated_deterioration (not improvement_plan_effective))))

; [insurance:supervisory_measures_applicable] 符合監管、接管、勒令停業清理或命令解散之處分條件
(assert (= supervisory_measures_applicable
   (or (= capital_level_4_penalty_period 1)
       (and financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_accelerated_deterioration))))

; [insurance:penalty_conditions] 處罰條件：符合監管、接管、勒令停業清理或命令解散之處分條件時處罰
(assert (= penalty supervisory_measures_applicable))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_deterioration_flag false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_effective false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= merger_completed false))
(assert (= days_since_deadline 7))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= risk_to_insured_interest false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 23
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
