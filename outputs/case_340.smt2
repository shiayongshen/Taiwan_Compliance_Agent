; SMT2 file generated from compliance case automatic
; Case ID: case_340
; Generated at: 2025-10-21T07:37:14.452815
;
; This file can be executed with Z3:
;   z3 case_340.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const risk_capital Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (or (not (>= (/ own_capital risk_capital) (/ 1.0 2.0)))
               (not (<= 0.0 net_worth))))
      (a!2 (and (>= (/ own_capital risk_capital) (/ 1.0 2.0))
                (not (>= (/ own_capital risk_capital) (/ 3.0 2.0)))
                (<= 0.0 net_worth_ratio_prev1)
                (not (<= 2.0 net_worth_ratio_prev1))))
      (a!3 (and (>= (/ own_capital risk_capital) (/ 3.0 2.0))
                (not (>= (/ own_capital risk_capital) 2.0)))))
(let ((a!4 (or a!3
               (and (not (<= 3.0 net_worth_ratio_prev1))
                    (<= 2.0 net_worth_ratio_prev2)))))
(let ((a!5 (ite a!4 2 (ite (>= (/ own_capital risk_capital) 2.0) 1 0))))
  (= capital_level (ite a!1 4 (ite a!2 3 a!5)))))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併時處罰
(assert (= penalty
   (and (= 4 capital_level)
        (not (or capital_increase_completed
                 financial_or_business_improvement_plan_completed
                 merger_completed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 180))
(assert (= risk_capital 100))
(assert (= net_worth 50))
(assert (= net_worth_ratio_prev1 50))
(assert (= net_worth_ratio_prev2 50))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 3
; Total variables: 10
; Total facts: 9
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
