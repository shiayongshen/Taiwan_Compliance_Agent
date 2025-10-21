; SMT2 file generated from compliance case automatic
; Case ID: case_381
; Generated at: 2025-10-21T08:32:03.286109
;
; This file can be executed with Z3:
;   z3 case_381.smt2
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
(declare-const days_after_deadline Int)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const financial_or_business_status_significantly_deteriorated Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const profit_and_loss_accelerated_deterioration Bool)
(declare-const risk_of_harming_insured_rights Bool)
(declare-const supervisory_consent_contract_commitment Bool)
(declare-const supervisory_consent_other_major_financial_matters Bool)
(declare-const supervisory_consent_payment_exceed_limit Bool)
(declare-const supervisory_measures_applicable Bool)
(declare-const supervisory_restrictions Bool)
(declare-const unable_to_fulfill_contractual_obligations Bool)
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

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level)
        (not capital_increase_completed)
        (not financial_or_business_improvement_plan_completed)
        (not merger_completed))))

; [insurance:capital_level_4_penalty_period] 資本嚴重不足且逾期九十日未完成增資、改善計畫或合併
(assert (= capital_level_4_penalty_period
   (ite (and capital_level_4_noncompliance (<= 90 days_after_deadline)) 1 0)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or risk_of_harming_insured_rights
       unable_to_pay_debts
       financial_or_business_status_significantly_deteriorated
       unable_to_fulfill_contractual_obligations)))

; [insurance:improvement_plan_submitted_and_approved] 已提出並經主管機關核定財務或業務改善計畫
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值加速惡化或經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration
   (or profit_and_loss_accelerated_deterioration
       (not improvement_plan_effective))))

; [insurance:supervisory_measures_applicable] 符合監管、接管、勒令停業清理或命令解散之處分條件
(assert (let ((a!1 (or (= capital_level_4_penalty_period 1)
               (and (not (= capital_level_4_penalty_period 1))
                    financial_or_business_deterioration
                    improvement_plan_submitted_and_approved
                    improvement_plan_accelerated_deterioration))))
  (= supervisory_measures_applicable a!1)))

; [insurance:supervisory_restrictions] 監管處分期間保險業不得超過主管機關規定限額支付款項或處分財產等行為
(assert (= supervisory_restrictions
   (and (not supervisory_consent_payment_exceed_limit)
        (not supervisory_consent_contract_commitment)
        (not supervisory_consent_other_major_financial_matters))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且逾期未完成增資或改善計畫，或財務業務顯著惡化且未依規定提出改善計畫，或違反監管限制時處罰
(assert (let ((a!1 (or (= capital_level_4_penalty_period 1)
               (not supervisory_restrictions)
               (and (not (= capital_level_4_penalty_period 1))
                    financial_or_business_deterioration
                    (not improvement_plan_submitted_and_approved)))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio 1.0))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= days_after_deadline 130))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_effective false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= capital_level 4))
(assert (= capital_level_4_noncompliance true))
(assert (= capital_level_4_penalty_period true))
(assert (= supervisory_restrictions true))
(assert (= supervisory_consent_payment_exceed_limit false))
(assert (= supervisory_consent_contract_commitment false))
(assert (= supervisory_consent_other_major_financial_matters false))
(assert (= penalty true))
(assert (= financial_or_business_status_significantly_deteriorated false))
(assert (= profit_and_loss_accelerated_deterioration false))
(assert (= unable_to_pay_debts false))
(assert (= unable_to_fulfill_contractual_obligations false))
(assert (= risk_of_harming_insured_rights false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 27
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
