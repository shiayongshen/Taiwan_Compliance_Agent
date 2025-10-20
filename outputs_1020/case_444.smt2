; SMT2 file generated from compliance case automatic
; Case ID: case_444
; Generated at: 2025-10-19T16:08:12.027028
;
; This file can be executed with Z3:
;   z3 case_444.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approval_by_authority Bool)
(declare-const business_improvement_plan_completed Bool)
(declare-const business_license_obtained Bool)
(declare-const business_start_permitted Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficient Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const contract_or_major_obligation_entered Bool)
(declare-const deposit_guarantee_completed Bool)
(declare-const director_or_supervisor_dismissed Bool)
(declare-const establishment_registration_completed Bool)
(declare-const financial_improvement_plan_completed Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_significant_deterioration Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_not_improved_after_guidance Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_deterioration Bool)
(declare-const net_worth_ratio Real)
(declare-const notification_to_registration_authority Bool)
(declare-const other_major_financial_impact Bool)
(declare-const payment_amount Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const prohibited_acts_without_supervisor_consent Bool)
(declare-const registration_cancellation_notification Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const supervisor_inspection_applied Bool)
(declare-const supervisory_duties_performed Bool)
(declare-const supervisory_measures_completed Bool)
(declare-const supervisory_measures_executed Bool)
(declare-const supervisory_measures_required Bool)
(declare-const supervisory_payment_limit Real)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const under_supervisory_measures Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級嚴重不足判定
(assert (= capital_level_severe_insufficient
   (or (not (<= 0.0 net_worth)) (not (<= 50.0 capital_adequacy_ratio)))))

; [insurance:capital_level_significant_deterioration] 資本等級顯著惡化判定
(assert (= capital_level_significant_deterioration
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級不足判定
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級適足判定
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著惡化, 4=嚴重不足, 0=未分類）
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

; [insurance:capital_level_4_measures_completed] 資本嚴重不足等級增資或改善計畫完成
(assert (= capital_level_4_measures_completed
   (and capital_level_severe_insufficient
        (or business_improvement_plan_completed
            merger_completed
            financial_improvement_plan_completed
            capital_increase_completed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約
(assert (= financial_or_business_deterioration
   (or financial_or_business_significant_deterioration
       unable_to_fulfill_contract
       unable_to_pay_debt
       risk_to_insured_interest)))

; [insurance:improvement_plan_submitted_and_approved] 已提出並經主管機關核定財務或業務改善計畫
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值加速惡化且經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration
   (and profit_loss_accelerated_deterioration
        net_worth_accelerated_deterioration
        improvement_plan_not_improved_after_guidance)))

; [insurance:supervisory_measures_required] 需採取監管、接管、勒令停業清理或命令解散處分
(assert (let ((a!1 (or (and capital_level_severe_insufficient
                    (not (or business_improvement_plan_completed
                             merger_completed
                             financial_improvement_plan_completed
                             capital_increase_completed)))
               (and (not capital_level_severe_insufficient)
                    financial_or_business_deterioration
                    improvement_plan_submitted_and_approved
                    improvement_plan_accelerated_deterioration))))
  (= supervisory_measures_required a!1)))

; [insurance:supervisory_measures_executed] 已執行監管、接管、勒令停業清理或命令解散處分
(assert (= supervisory_measures_executed supervisory_measures_completed))

; [insurance:prohibited_acts_without_supervisor_consent] 監管處分期間未經監管人同意禁止行為
(assert (let ((a!1 (and under_supervisory_measures
                (or other_major_financial_impact
                    (not (<= payment_amount supervisory_payment_limit))
                    contract_or_major_obligation_entered))))
  (= prohibited_acts_without_supervisor_consent a!1)))

; [insurance:supervisor_inspection_applied] 監管人執行監管職務時適用檢查規定
(assert (= supervisor_inspection_applied supervisory_duties_performed))

; [insurance:registration_cancellation_notification] 解除董（理）事、監察人職務時通知主管機關廢止登記
(assert (= registration_cancellation_notification
   (and director_or_supervisor_dismissed notification_to_registration_authority)))

; [insurance:business_start_permitted] 保險業經主管機關許可並完成設立登記、繳存保證金及領得營業執照後，得開始營業
(assert (= business_start_permitted
   (and approval_by_authority
        establishment_registration_completed
        deposit_guarantee_completed
        business_license_obtained)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未完成增資或改善計畫，或財務業務顯著惡化未提出改善計畫，或未依規定完成設立登記及許可，或違反監管期間禁止行為時處罰
(assert (let ((a!1 (or (not business_start_permitted)
               prohibited_acts_without_supervisor_consent
               (and (not capital_level_severe_insufficient)
                    financial_or_business_deterioration
                    (not improvement_plan_submitted_and_approved))
               (and capital_level_severe_insufficient
                    (not (or business_improvement_plan_completed
                             merger_completed
                             financial_improvement_plan_completed
                             capital_increase_completed))))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approval_by_authority true))
(assert (= business_improvement_plan_completed false))
(assert (= business_license_obtained true))
(assert (= business_start_permitted true))
(assert (= capital_adequacy_ratio 180.0))
(assert (= capital_increase_completed false))
(assert (= capital_level 2))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level_adequate false))
(assert (= capital_level_insufficient true))
(assert (= capital_level_severe_insufficient false))
(assert (= capital_level_significant_deterioration false))
(assert (= contract_or_major_obligation_entered false))
(assert (= deposit_guarantee_completed true))
(assert (= director_or_supervisor_dismissed false))
(assert (= establishment_registration_completed true))
(assert (= financial_improvement_plan_completed false))
(assert (= financial_or_business_deterioration false))
(assert (= financial_or_business_significant_deterioration false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_not_improved_after_guidance false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= merger_completed false))
(assert (= net_worth 500.0))
(assert (= net_worth_accelerated_deterioration false))
(assert (= net_worth_ratio (/ 5.0 2.0)))
(assert (= notification_to_registration_authority false))
(assert (= other_major_financial_impact false))
(assert (= payment_amount 0.0))
(assert (= penalty true))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= prohibited_acts_without_supervisor_consent true))
(assert (= registration_cancellation_notification false))
(assert (= risk_to_insured_interest false))
(assert (= supervisor_inspection_applied false))
(assert (= supervisory_duties_performed false))
(assert (= supervisory_measures_completed false))
(assert (= supervisory_measures_executed false))
(assert (= supervisory_measures_required false))
(assert (= supervisory_payment_limit 0.0))
(assert (= unable_to_fulfill_contract false))
(assert (= unable_to_pay_debt false))
(assert (= under_supervisory_measures false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 45
; Total facts: 45
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
