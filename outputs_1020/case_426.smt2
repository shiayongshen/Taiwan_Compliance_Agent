; SMT2 file generated from compliance case automatic
; Case ID: case_426
; Generated at: 2025-10-19T15:36:35.518828
;
; This file can be executed with Z3:
;   z3 case_426.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_or_no_improvement Bool)
(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_improvement_plan_completed Bool)
(declare-const capital_improvement_plan_overdue Bool)
(declare-const capital_level Int)
(declare-const capital_level_4_penalty_condition Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficiency Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const contract_or_major_commitment_made_without_approval Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_after_guidance Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_completed_within_deadline Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_deterioration Bool)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_impact_actions Bool)
(declare-const payment_limit Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const regulatory_action_required Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervisory_payment_limit Real)
(declare-const supervisory_restrictions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficiency] 資本等級為嚴重不足
(assert (= capital_level_severe_insufficiency
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_level_significant_deterioration] 資本等級為顯著惡化
(assert (= capital_level_significant_deterioration
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級為不足
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級為適足
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著惡化, 4=嚴重不足）
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

; [insurance:capital_improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限內完成
(assert (= capital_improvement_plan_completed
   improvement_plan_completed_within_deadline))

; [insurance:capital_improvement_plan_overdue] 增資、財務或業務改善計畫或合併未於主管機關規定期限內完成
(assert (not (= improvement_plan_completed_within_deadline
        capital_improvement_plan_overdue)))

; [insurance:capital_level_4_penalty_condition] 資本嚴重不足且未於期限完成增資或改善計畫
(assert (= capital_level_4_penalty_condition
   (and (= 4 capital_level) capital_improvement_plan_overdue)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or risk_to_insured_rights cannot_fulfill_contract cannot_pay_debt)))

; [insurance:improvement_plan_submitted_and_approved] 已提出並經主管機關核定財務或業務改善計畫
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= accelerated_deterioration_or_no_improvement
   (or profit_loss_accelerated_deterioration
       net_worth_accelerated_deterioration
       (not improvement_after_guidance))))

; [insurance:regulatory_action_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= regulatory_action_required
   (or capital_level_4_penalty_condition
       (and (not capital_level_4_penalty_condition)
            financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            accelerated_deterioration_or_no_improvement))))

; [insurance:supervisory_restrictions] 監管處分限制保險業行為
(assert (= supervisory_restrictions
   (and (<= payment_limit supervisory_payment_limit)
        (not contract_or_major_commitment_made_without_approval)
        (not other_major_financial_impact_actions))))

; [insurance:internal_control_and_audit_ok] 建立且執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立且執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未完成改善計畫或財務業務惡化未改善，或未建立執行內部控制、稽核、處理制度
(assert (= penalty
   (or (not internal_control_and_audit_ok)
       capital_level_4_penalty_condition
       (not internal_handling_ok)
       (and (not capital_level_4_penalty_condition)
            financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            accelerated_deterioration_or_no_improvement))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_completed_within_deadline false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_rights false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= net_worth_accelerated_deterioration false))
(assert (= improvement_after_guidance false))
(assert (= contract_or_major_commitment_made_without_approval false))
(assert (= other_major_financial_impact_actions false))
(assert (= payment_limit 1000000.0))
(assert (= supervisory_payment_limit 1000000.0))
(assert (= accelerated_deterioration_or_no_improvement false))
(assert (= capital_improvement_plan_completed false))
(assert (= capital_improvement_plan_overdue false))
(assert (= capital_level 0))
(assert (= capital_level_4_penalty_condition false))
(assert (= capital_level_adequate false))
(assert (= capital_level_insufficient false))
(assert (= capital_level_severe_insufficiency false))
(assert (= capital_level_significant_deterioration false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_ok false))
(assert (= penalty false))
(assert (= regulatory_action_required false))
(assert (= supervisory_restrictions false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 36
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
