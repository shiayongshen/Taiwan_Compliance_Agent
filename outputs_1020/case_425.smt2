; SMT2 file generated from compliance case automatic
; Case ID: case_425
; Generated at: 2025-10-19T15:34:39.198885
;
; This file can be executed with Z3:
;   z3 case_425.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed_within_deadline Bool)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficiency Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const contract_or_major_commitment_made Bool)
(declare-const days_after_deadline Int)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_improvement_plan_completed_within_deadline Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_flag Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_guidance_not_effective Bool)
(declare-const improvement_plan_not_improved_after_guidance Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_and_audit_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const major_financial_impact_event Bool)
(declare-const merger_completed_within_deadline Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const payment_amount Real)
(declare-const penalty Bool)
(declare-const profit_loss_net_worth_accelerated_deterioration Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const supervision_or_takeover_or_shutdown_decision Bool)
(declare-const supervision_payment_exceeded Bool)
(declare-const supervision_payment_limit Real)
(declare-const supervision_restrictions_agreed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficiency] 資本等級嚴重不足判定
(assert (= capital_level_severe_insufficiency
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

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

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_level_4_measures_executed capital_level_4_measures_completed))

; [insurance:capital_level_3_measures_executed] 資本顯著惡化等級措施已執行
(assert (= capital_level_3_measures_executed capital_level_3_measures_completed))

; [insurance:capital_level_2_measures_executed] 資本不足等級措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or risk_to_insured_interest cannot_pay_debt cannot_fulfill_contract)))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_flag))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值呈現加速惡化
(assert (= improvement_plan_accelerated_deterioration
   profit_loss_net_worth_accelerated_deterioration))

; [insurance:improvement_plan_not_improved_after_guidance] 經輔導仍未改善
(assert (= improvement_plan_not_improved_after_guidance
   improvement_plan_guidance_not_effective))

; [insurance:supervision_or_takeover_or_shutdown_decision] 主管機關為監管、接管、勒令停業清理或命令解散之處分
(assert (let ((a!1 (or (and capital_level_severe_insufficiency
                    (not (and capital_increase_completed_within_deadline
                              financial_or_business_improvement_plan_completed_within_deadline
                              merger_completed_within_deadline))
                    (>= 90.0 (to_real days_after_deadline)))
               (and (not capital_level_severe_insufficiency)
                    financial_or_business_deterioration
                    improvement_plan_approved
                    (or improvement_plan_accelerated_deterioration
                        improvement_plan_not_improved_after_guidance)))))
  (= supervision_or_takeover_or_shutdown_decision a!1)))

; [insurance:supervision_restrictions_agreed] 監管處分期間保險業未經監管人同意不得超限支付款項或處分財產等
(assert (let ((a!1 (and (not (or (<= payment_amount supervision_payment_limit)
                         (not supervision_payment_exceeded)))
                (not (or (not contract_or_major_commitment_made)
                         (not major_financial_impact_event))))))
  (= supervision_restrictions_agreed a!1)))

; [insurance:internal_control_and_audit_compliance] 建立並執行內部控制及稽核制度
(assert (= internal_control_and_audit_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance] 建立並執行內部處理制度及程序
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反資本嚴重不足增資或改善計畫期限、財務或業務惡化未改善、或未建立執行內部控制及處理制度時處罰
(assert (let ((a!1 (or (and (not capital_level_severe_insufficiency)
                    financial_or_business_deterioration
                    improvement_plan_approved
                    (or improvement_plan_accelerated_deterioration
                        improvement_plan_not_improved_after_guidance))
               (and capital_level_severe_insufficiency
                    (not (and capital_increase_completed_within_deadline
                              financial_or_business_improvement_plan_completed_within_deadline
                              merger_completed_within_deadline)))
               (not internal_control_and_audit_compliance)
               (not internal_handling_compliance))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_interest false))
(assert (= capital_increase_completed_within_deadline false))
(assert (= financial_or_business_improvement_plan_completed_within_deadline false))
(assert (= merger_completed_within_deadline false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_approved_flag false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= improvement_plan_guidance_not_effective false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level_3_measures_completed false))
(assert (= days_after_deadline 0))
(assert (= payment_amount 0.0))
(assert (= supervision_payment_limit 0.0))
(assert (= supervision_payment_exceeded false))
(assert (= contract_or_major_commitment_made false))
(assert (= major_financial_impact_event false))
(assert (= supervision_restrictions_agreed false))
(assert (= penalty true))
(assert (= supervision_or_takeover_or_shutdown_decision false))
(assert (= capital_level 0))
(assert (= capital_level_2_measures_executed false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_4_measures_executed false))
(assert (= capital_level_adequate false))
(assert (= capital_level_insufficient false))
(assert (= capital_level_severe_insufficiency false))
(assert (= capital_level_significant_deterioration false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_not_improved_after_guidance false))
(assert (= internal_control_and_audit_compliance false))
(assert (= internal_handling_compliance false))
(assert (= profit_loss_net_worth_accelerated_deterioration false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 43
; Total facts: 43
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
