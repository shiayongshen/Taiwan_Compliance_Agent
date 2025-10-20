; SMT2 file generated from compliance case automatic
; Case ID: case_342
; Generated at: 2025-10-19T13:35:47.793474
;
; This file can be executed with Z3:
;   z3 case_342.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_completed Bool)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_level_consistent Bool)
(declare-const capital_severely_insufficient_measures_completed Bool)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_completed Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_improved Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervisory_measures_applicable Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (and (or (not (<= 2.0 net_worth_ratio_prev1))
                    (not (<= 2.0 net_worth_ratio_prev2)))
                (<= 0.0 net_worth_ratio_prev1)
                (<= 0.0 net_worth_ratio_prev2))))
(let ((a!2 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               a!1)))
(let ((a!3 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio_prev1)
                     (<= 0.0 net_worth_ratio_prev2)
                     (not (<= 2.0 net_worth_ratio_prev1))
                     (not (<= 2.0 net_worth_ratio_prev2)))
                3
                (ite a!2 2 (ite (<= 200.0 capital_adequacy_ratio) 1 0)))))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!3)))
  (= capital_level a!4))))))

; [insurance:capital_level_consistency] 資本等級劃分一致性（以較低等級為準）
(assert capital_level_consistent)

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施已執行（增資、財務或業務改善計畫或合併完成）
(assert (= capital_severely_insufficient_measures_executed
   capital_severely_insufficient_measures_completed))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施已執行（增資、財務或業務改善計畫或合併完成）
(assert (= capital_significantly_insufficient_measures_executed
   capital_significantly_insufficient_measures_completed))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施已執行（增資、財務或業務改善計畫或合併完成）
(assert (= capital_insufficient_measures_executed
   capital_insufficient_measures_completed))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or risk_to_insured_rights cannot_fulfill_contract cannot_pay_debt)))

; [insurance:improvement_plan_submitted_and_approved] 已提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值呈現加速惡化且經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration
   (and profit_loss_accelerated_deterioration (not improvement_plan_improved))))

; [insurance:supervisory_measures_applicable] 主管機關得為監管、接管、勒令停業清理或命令解散之處分
(assert (let ((a!1 (or (and (= 4 capital_level)
                    (not capital_severely_insufficient_measures_executed))
               (and (not (= 4 capital_level))
                    financial_or_business_deterioration
                    improvement_plan_submitted_and_approved
                    improvement_plan_accelerated_deterioration))))
  (= supervisory_measures_applicable a!1)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或財務業務惡化且未改善時處罰
(assert (let ((a!1 (or (and (= 4 capital_level)
                    (not capital_severely_insufficient_measures_executed))
               (and (not (= 4 capital_level))
                    financial_or_business_deterioration
                    improvement_plan_accelerated_deterioration))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio_prev1 (/ 5.0 2.0)))
(assert (= net_worth_ratio_prev2 (/ 5.0 2.0)))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_rights false))
(assert (= financial_or_business_deterioration true))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_improved false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= capital_severely_insufficient_measures_completed false))
(assert (= capital_significantly_insufficient_measures_completed false))
(assert (= capital_insufficient_measures_completed false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= capital_insufficient_measures_executed false))
(assert (= penalty true))
(assert (= supervisory_measures_applicable false))
(assert (= capital_level 0))
(assert (= capital_level_consistent false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= profit_loss_accelerated_deterioration false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 24
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
