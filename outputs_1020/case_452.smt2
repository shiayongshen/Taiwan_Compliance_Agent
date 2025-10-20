; SMT2 file generated from compliance case automatic
; Case ID: case_452
; Generated at: 2025-10-19T16:22:24.347656
;
; This file can be executed with Z3:
;   z3 case_452.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_improvement_completed Bool)
(declare-const capital_level_severe_insufficient Bool)
(declare-const capital_level_severe_insufficient_and_no_improvement Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const capital_level_significant_deterioration_and_no_approved_plan Bool)
(declare-const capital_level_significant_deterioration_and_no_improvement_after_counseling Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_after_counseling Bool)
(declare-const improvement_plan_approved Bool)
(declare-const net_worth Real)
(declare-const penalty Bool)
(declare-const risk_to_insured_rights Bool)
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
   (or unable_to_fulfill_contract
       unable_to_pay_debt
       risk_to_insured_rights
       financial_or_business_deterioration)))

; [insurance:capital_level_severe_insufficient_and_no_improvement] 嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_severe_insufficient_and_no_improvement
   (and capital_level_severe_insufficient (not capital_improvement_completed))))

; [insurance:capital_level_significant_deterioration_and_no_approved_plan] 財務或業務狀況顯著惡化且未提出或未經核定改善計畫
(assert (= capital_level_significant_deterioration_and_no_approved_plan
   (and capital_level_significant_deterioration (not improvement_plan_approved))))

; [insurance:capital_level_significant_deterioration_and_no_improvement_after_counseling] 損益、淨值加速惡化或經輔導仍未改善
(assert (= capital_level_significant_deterioration_and_no_improvement_after_counseling
   (and capital_level_significant_deterioration
        (not improvement_after_counseling))))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或財務狀況惡化未提出或未改善時處罰
(assert (= penalty
   (or capital_level_severe_insufficient_and_no_improvement
       capital_level_significant_deterioration_and_no_approved_plan
       capital_level_significant_deterioration_and_no_improvement_after_counseling)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= capital_improvement_completed false))
(assert (= capital_level_severe_insufficient false))
(assert (= capital_level_severe_insufficient_and_no_improvement false))
(assert (= capital_level_significant_deterioration true))
(assert (= capital_level_significant_deterioration_and_no_approved_plan true))
(assert (= capital_level_significant_deterioration_and_no_improvement_after_counseling false))
(assert (= financial_or_business_deterioration true))
(assert (= improvement_after_counseling false))
(assert (= improvement_plan_approved false))
(assert (= penalty true))
(assert (= risk_to_insured_rights false))
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
; Total constraints: 7
; Total variables: 15
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
