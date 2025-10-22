; SMT2 file generated from compliance case automatic
; Case ID: case_340
; Generated at: 2025-10-22T19:53:50.561928
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

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (or (not (<= 0.0 net_worth))
               (not (<= (/ 1.0 2.0) (/ own_capital risk_capital)))))
      (a!2 (and (<= (/ 1.0 2.0) (/ own_capital risk_capital))
                (not (<= (/ 3.0 2.0) (/ own_capital risk_capital)))
                (not (<= (/ 1.0 50.0) net_worth_ratio_prev1))
                (<= 0.0 net_worth_ratio_prev2)))
      (a!3 (and (<= (/ 3.0 2.0) (/ own_capital risk_capital))
                (not (<= 2.0 (/ own_capital risk_capital)))
                (or (<= (/ 1.0 50.0) net_worth_ratio_prev1)
                    (<= (/ 3.0 100.0) net_worth_ratio_prev2))))
      (a!4 (ite (and (<= 2.0 (/ own_capital risk_capital))
                     (or (<= (/ 3.0 100.0) net_worth_ratio_prev1)
                         (<= (/ 3.0 100.0) net_worth_ratio_prev2)))
                1
                0)))
  (= capital_level (ite a!1 4 (ite a!2 3 (ite a!3 2 a!4))))))

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

(assert (= own_capital (/ 2.0 5.0)))
(assert (= risk_capital 1.0))
(assert (= net_worth 1.0))
(assert (= net_worth_ratio_prev1 (/ 1.0 100.0)))
(assert (= net_worth_ratio_prev2 (/ 1.0 100.0)))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= merger_completed false))

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
; Total facts: 8
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
