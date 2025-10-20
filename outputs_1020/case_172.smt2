; SMT2 file generated from compliance case automatic
; Case ID: case_172
; Generated at: 2025-10-19T09:49:44.287534
;
; This file can be executed with Z3:
;   z3 case_172.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_or_improvement_plan_completed Bool)
(declare-const capital_level_severe_insufficient Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const days_after_deadline Int)
(declare-const financial_or_business_deteriorated Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_not_improved_after_guidance Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const money_laundering_improvement_completed Bool)
(declare-const money_laundering_improvement_completed_flag Bool)
(declare-const money_laundering_improvement_ordered Bool)
(declare-const money_laundering_internal_control_established Bool)
(declare-const money_laundering_internal_control_established_flag Bool)
(declare-const money_laundering_internal_control_executed Bool)
(declare-const money_laundering_internal_control_executed_flag Bool)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_deterioration Bool)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervisory_consent_contract_commitment Bool)
(declare-const supervisory_consent_other_major_financial_matters Bool)
(declare-const supervisory_consent_payment_exceed_limit Bool)
(declare-const supervisory_measures_applicable Bool)
(declare-const supervisory_restrictions Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級為嚴重不足
(assert (= capital_level_severe_insufficient
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_level_significant_deterioration] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= capital_level_significant_deterioration
   (or risk_to_insured_rights
       financial_or_business_deteriorated
       unable_to_pay_debt
       unable_to_fulfill_contract)))

; [insurance:improvement_plan_submitted_and_approved] 提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值呈現加速惡化且經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration
   (and profit_loss_accelerated_deterioration
        net_worth_accelerated_deterioration
        improvement_plan_not_improved_after_guidance)))

; [insurance:supervisory_measures_applicable] 主管機關得為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_applicable
   (or (and capital_level_significant_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_accelerated_deterioration)
       (and capital_level_severe_insufficient
            (not capital_increase_or_improvement_plan_completed)
            (>= 90 days_after_deadline)))))

; [insurance:supervisory_restrictions] 保險業監管處分限制行為
(assert (= supervisory_restrictions
   (and (not supervisory_consent_payment_exceed_limit)
        (not supervisory_consent_contract_commitment)
        (not supervisory_consent_other_major_financial_matters))))

; [insurance:internal_control_and_audit_established_and_executed] 建立並執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_established_and_executed] 建立並執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [money_laundering:internal_control_and_audit_established] 金融機構及指定非金融事業建立洗錢防制內部控制與稽核制度
(assert (= money_laundering_internal_control_established
   money_laundering_internal_control_established_flag))

; [money_laundering:internal_control_and_audit_executed] 金融機構及指定非金融事業執行洗錢防制內部控制與稽核制度
(assert (= money_laundering_internal_control_executed
   money_laundering_internal_control_executed_flag))

; [money_laundering:improvement_order_issued_and_completed] 違反洗錢防制規定被限期改善且已完成改善
(assert (= money_laundering_improvement_completed
   (and money_laundering_improvement_ordered
        money_laundering_improvement_completed_flag)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法及洗錢防制法相關規定時處罰
(assert (let ((a!1 (or (and capital_level_significant_deterioration
                    improvement_plan_submitted_and_approved
                    improvement_plan_accelerated_deterioration)
               (not internal_handling_ok)
               (and capital_level_severe_insufficient
                    (not capital_increase_or_improvement_plan_completed)
                    (not (<= days_after_deadline 90)))
               (and money_laundering_improvement_ordered
                    (not money_laundering_improvement_completed_flag))
               (not internal_control_and_audit_ok))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 80.0))
(assert (= capital_increase_or_improvement_plan_completed false))
(assert (= capital_level_severe_insufficient false))
(assert (= capital_level_significant_deterioration true))
(assert (= days_after_deadline 7))
(assert (= financial_or_business_deteriorated true))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_not_improved_after_guidance false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= money_laundering_improvement_ordered true))
(assert (= money_laundering_improvement_completed_flag false))
(assert (= money_laundering_improvement_completed false))
(assert (= money_laundering_internal_control_established_flag false))
(assert (= money_laundering_internal_control_established false))
(assert (= money_laundering_internal_control_executed_flag false))
(assert (= money_laundering_internal_control_executed false))
(assert (= net_worth 100.0))
(assert (= net_worth_accelerated_deterioration false))
(assert (= penalty true))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= risk_to_insured_rights false))
(assert (= supervisory_consent_contract_commitment false))
(assert (= supervisory_consent_other_major_financial_matters false))
(assert (= supervisory_consent_payment_exceed_limit false))
(assert (= supervisory_measures_applicable false))
(assert (= supervisory_restrictions true))
(assert (= unable_to_fulfill_contract false))
(assert (= unable_to_pay_debt false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 36
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
