; SMT2 file generated from compliance case automatic
; Case ID: case_438
; Generated at: 2025-10-21T09:51:33.657991
;
; This file can be executed with Z3:
;   z3 case_438.smt2
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
(declare-const director_officer_removal_notification Bool)
(declare-const director_officer_removed Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const financial_or_business_status_significantly_worsened Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_required Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const major_contracts_or_obligations_committed Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_worsening Bool)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_matters Bool)
(declare-const payment_amount Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_worsening Bool)
(declare-const regulatory_action_authorized Bool)
(declare-const removal_notification_sent_to_registration_authority Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervision_payment_limit Real)
(declare-const supervision_restrictions Bool)
(declare-const unable_to_fulfill_contractual_responsibilities Bool)
(declare-const unable_to_pay_debts Bool)
(declare-const under_supervision Bool)

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

; [insurance:capital_level_4_penalty_period] 資本嚴重不足且逾期限九十日內未完成增資、改善計畫或合併
(assert (= capital_level_4_penalty_period
   (ite (and capital_level_4_noncompliance
             (<= 0 days_after_deadline)
             (>= 90 days_after_deadline))
        1
        0)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約或損及被保險人權益
(assert (= financial_or_business_deterioration
   (and financial_or_business_status_significantly_worsened
        (or unable_to_pay_debts
            risk_to_insured_rights
            unable_to_fulfill_contractual_responsibilities))))

; [insurance:improvement_plan_required] 主管機關要求提出財務或業務改善計畫並核定
(assert (= improvement_plan_required
   (and financial_or_business_deterioration
        improvement_plan_submitted
        improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值加速惡化或輔導未改善致仍有惡化虞
(assert (= improvement_plan_accelerated_deterioration
   (and profit_loss_accelerated_worsening
        net_worth_accelerated_worsening
        (not improvement_plan_effective))))

; [insurance:regulatory_action_authorized] 主管機關得依情節輕重為監管、接管、勒令停業清理或命令解散
(assert (= regulatory_action_authorized
   (or (= capital_level_4_penalty_period 1)
       (and financial_or_business_deterioration
            improvement_plan_accelerated_deterioration))))

; [insurance:director_officer_removal_notification] 解除董（理）事、監察人（監事）職務時通知主管機關廢止登記
(assert (= director_officer_removal_notification
   (or removal_notification_sent_to_registration_authority
       (not director_officer_removed))))

; [insurance:supervision_restrictions] 監管處分期間保險業不得超限額支付款項、締結重大契約或其他重大財務事項
(assert (= supervision_restrictions
   (or (not under_supervision)
       (and (<= payment_amount supervision_payment_limit)
            (not major_contracts_or_obligations_committed)
            (not other_major_financial_matters)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未於期限內完成增資、改善計畫或合併，或財務業務惡化且未改善時處罰
(assert (= penalty
   (or capital_level_4_noncompliance
       (and financial_or_business_deterioration
            (not improvement_plan_effective)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= days_after_deadline 7))
(assert (= director_officer_removed true))
(assert (= removal_notification_sent_to_registration_authority true))
(assert (= financial_or_business_status_significantly_worsened false))
(assert (= unable_to_pay_debts false))
(assert (= unable_to_fulfill_contractual_responsibilities false))
(assert (= risk_to_insured_rights false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_effective false))
(assert (= profit_loss_accelerated_worsening false))
(assert (= net_worth_accelerated_worsening false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= improvement_plan_required false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 33
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
