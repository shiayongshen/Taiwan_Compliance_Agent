; SMT2 file generated from compliance case automatic
; Case ID: case_416
; Generated at: 2025-10-21T09:07:58.966424
;
; This file can be executed with Z3:
;   z3 case_416.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_license_obtained Bool)
(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_increase_within_deadline Bool)
(declare-const capital_level Int)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficient Bool)
(declare-const capital_level_severe_measures_completed Bool)
(declare-const capital_level_severe_measures_within_deadline Bool)
(declare-const capital_level_significant_insufficient Bool)
(declare-const deposit_guarantee_completed Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_not_improved Bool)
(declare-const improvement_plan_not_improved_after_guidance Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const insurance_business_not_permitted Bool)
(declare-const insurance_business_permitted Bool)
(declare-const license_permitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const premium_collection_compliant Bool)
(declare-const premium_commission_rebate Bool)
(declare-const premium_false_accounting Bool)
(declare-const premium_price_error Bool)
(declare-const profit_loss_net_worth_accelerated_deterioration Bool)
(declare-const registration_completed Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const supervisory_measures_applicable Bool)
(declare-const supervisory_measures_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級嚴重不足
(assert (= capital_level_severe_insufficient
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_level_significant_insufficient] 資本等級顯著不足
(assert (= capital_level_significant_insufficient
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級不足
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級適足
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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

; [insurance:capital_level_severe_measures_completed] 嚴重不足等級增資、財務或業務改善計畫或合併完成
(assert (= capital_level_severe_measures_completed
   (and capital_level_severe_insufficient capital_increase_completed)))

; [insurance:capital_level_severe_measures_within_deadline] 嚴重不足等級增資、財務或業務改善計畫或合併於主管機關規定期限內完成
(assert (= capital_level_severe_measures_within_deadline
   (and capital_level_severe_insufficient capital_increase_within_deadline)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or cannot_fulfill_contract risk_to_insured_interest cannot_pay_debt)))

; [insurance:improvement_plan_submitted_and_approved] 提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值呈現加速惡化
(assert (= improvement_plan_accelerated_deterioration
   profit_loss_net_worth_accelerated_deterioration))

; [insurance:improvement_plan_not_improved_after_guidance] 經輔導仍未改善
(assert (= improvement_plan_not_improved_after_guidance improvement_plan_not_improved))

; [insurance:supervisory_measures_applicable] 主管機關得依情節輕重為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_applicable
   (or (and capital_level_severe_insufficient
            (not capital_level_severe_measures_within_deadline))
       (and (not capital_level_severe_insufficient)
            financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            (or improvement_plan_accelerated_deterioration
                improvement_plan_not_improved_after_guidance)))))

; [insurance:supervisory_measures_executed] 主管機關為監管、接管、勒令停業清理或命令解散之處分已執行
(assert (= supervisory_measures_executed supervisory_measures_applicable))

; [insurance:insurance_business_permitted] 保險業經主管機關許可並依法設立登記、繳存保證金及領得營業執照後開始營業
(assert (= insurance_business_permitted
   (and license_permitted
        registration_completed
        deposit_guarantee_completed
        business_license_obtained)))

; [insurance:insurance_business_not_permitted] 保險業未經主管機關許可或未依法設立登記、繳存保證金或未領得營業執照不得開始營業
(assert (not (= insurance_business_permitted insurance_business_not_permitted)))

; [insurance:premium_collection_compliant] 保險業收取保費不得錯價、放佣或以不真實支出入帳
(assert (= premium_collection_compliant
   (and (not premium_price_error)
        (not premium_commission_rebate)
        (not premium_false_accounting))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未完成增資改善計畫、財務或業務狀況惡化未提出或未改善計畫、未經許可開始營業或錯誤收取保費時處罰
(assert (= penalty
   (or (and capital_level_severe_insufficient
            (not capital_level_severe_measures_within_deadline))
       (not premium_collection_compliant)
       insurance_business_not_permitted
       (and financial_or_business_deterioration
            (not improvement_plan_submitted_and_approved)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= premium_price_error true))
(assert (= premium_commission_rebate false))
(assert (= premium_false_accounting false))
(assert (= premium_collection_compliant false))
(assert (= license_permitted true))
(assert (= registration_completed true))
(assert (= deposit_guarantee_completed true))
(assert (= business_license_obtained true))
(assert (= insurance_business_permitted true))
(assert (= insurance_business_not_permitted false))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_interest false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= improvement_plan_not_improved false))
(assert (= improvement_plan_not_improved_after_guidance false))
(assert (= capital_level_severe_insufficient false))
(assert (= capital_increase_completed false))
(assert (= capital_increase_within_deadline false))
(assert (= supervisory_measures_applicable true))
(assert (= supervisory_measures_executed true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 36
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
