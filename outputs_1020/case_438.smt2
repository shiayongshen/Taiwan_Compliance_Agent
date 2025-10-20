; SMT2 file generated from compliance case automatic
; Case ID: case_438
; Generated at: 2025-10-19T15:57:49.276710
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
(declare-const contract_or_major_commitment_made_without_approval Bool)
(declare-const counseling_not_improved Bool)
(declare-const days_after_deadline Int)
(declare-const financial_deterioration_condition Bool)
(declare-const financial_deterioration_penalty_condition Bool)
(declare-const financial_or_business_deteriorated Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_impact_actions_without_approval Bool)
(declare-const payment_limit Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervision_disposition_required Bool)
(declare-const supervision_payment_limit Real)
(declare-const supervision_restriction_agreed Bool)
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
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未於期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level)
        (not capital_increase_completed)
        (not improvement_plan_completed)
        (not merger_completed))))

; [insurance:capital_level_4_penalty_period] 資本嚴重不足且逾期九十日未完成增資、改善計畫或合併
(assert (= capital_level_4_penalty_period
   (ite (and capital_level_4_noncompliance (<= 90 days_after_deadline)) 1 0)))

; [insurance:financial_deterioration_condition] 財務或業務狀況顯著惡化且不能支付債務或履行契約或有損及被保險人權益之虞
(assert (= financial_deterioration_condition
   (or unable_to_pay_debt
       financial_or_business_deteriorated
       risk_to_insured_rights
       unable_to_fulfill_contract)))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_submitted))

; [insurance:financial_deterioration_penalty_condition] 損益、淨值加速惡化或輔導未改善且有財務惡化情事之虞
(assert (= financial_deterioration_penalty_condition
   (and financial_deterioration_condition
        (or counseling_not_improved profit_loss_accelerated_deterioration))))

; [insurance:supervision_disposition_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervision_disposition_required
   (or (= capital_level_4_penalty_period 1)
       financial_deterioration_penalty_condition)))

; [insurance:supervision_restriction_agreed] 監管處分期間，監管人同意下之限制行為
(assert (= supervision_restriction_agreed
   (and (<= payment_limit supervision_payment_limit)
        (not contract_or_major_commitment_made_without_approval)
        (not other_major_financial_impact_actions_without_approval))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且逾期未完成增資、改善計畫或合併，或財務惡化且未改善時處罰
(assert (= penalty
   (or (= capital_level_4_penalty_period 1)
       financial_deterioration_penalty_condition)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio 1.0))
(assert (= capital_increase_completed false))
(assert (= improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= days_after_deadline 180))
(assert (= financial_or_business_deteriorated true))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= risk_to_insured_rights false))
(assert (= improvement_plan_submitted false))
(assert (= counseling_not_improved false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= contract_or_major_commitment_made_without_approval false))
(assert (= other_major_financial_impact_actions_without_approval false))
(assert (= payment_limit 168.0))
(assert (= supervision_payment_limit 168.0))
(assert (= capital_level 0))
(assert (= capital_level_4_noncompliance false))
(assert (= capital_level_4_penalty_period 0))
(assert (= financial_deterioration_condition false))
(assert (= financial_deterioration_penalty_condition false))
(assert (= improvement_plan_approved false))
(assert (= penalty false))
(assert (= supervision_disposition_required false))
(assert (= supervision_restriction_agreed false))

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
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
