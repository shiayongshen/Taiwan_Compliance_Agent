; SMT2 file generated from compliance case automatic
; Case ID: case_321
; Generated at: 2025-10-19T13:03:22.240919
;
; This file can be executed with Z3:
;   z3 case_321.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequate Bool)
(declare-const capital_insufficient Bool)
(declare-const capital_level Int)
(declare-const capital_significantly_insufficient Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const risk_capital Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (not (<= 0.0 net_worth))
               (not (<= (/ 1.0 2.0) (/ own_capital risk_capital)))))
      (a!2 (and (<= (/ 1.0 2.0) (/ own_capital risk_capital))
                (not (<= (/ 3.0 2.0) (/ own_capital risk_capital)))
                (<= 0.0 net_worth_ratio_prev1)
                (not (<= 2.0 net_worth_ratio_prev1))
                (<= 0.0 net_worth_ratio_prev2)
                (not (<= 2.0 net_worth_ratio_prev2))))
      (a!3 (and (<= (/ 3.0 2.0) (/ own_capital risk_capital))
                (not (<= 2.0 (/ own_capital risk_capital)))))
      (a!4 (ite (and (<= 2.0 (/ own_capital risk_capital))
                     (or (<= 3.0 net_worth_ratio_prev1)
                         (<= 3.0 net_worth_ratio_prev2)))
                1
                0)))
  (= capital_level (ite a!1 4 (ite a!2 3 (ite a!3 2 a!4))))))

; [insurance:capital_adequate] 資本適足條件
(assert (= capital_adequate
   (and (>= (/ own_capital risk_capital) 2.0)
        (or (<= 3.0 net_worth_ratio_prev1) (<= 3.0 net_worth_ratio_prev2)))))

; [insurance:capital_insufficient] 資本不足條件
(assert (let ((a!1 (and (>= (/ own_capital risk_capital) (/ 3.0 2.0))
                (not (>= (/ own_capital risk_capital) 2.0)))))
(let ((a!2 (or a!1
               (and (not (<= 3.0 net_worth_ratio_prev1))
                    (not (<= 3.0 net_worth_ratio_prev2))
                    (<= 2.0 net_worth_ratio_prev1)))))
  (= capital_insufficient a!2))))

; [insurance:capital_significantly_insufficient] 資本顯著不足條件
(assert (let ((a!1 (and (>= (/ own_capital risk_capital) (/ 1.0 2.0))
                (not (>= (/ own_capital risk_capital) (/ 3.0 2.0))))))
(let ((a!2 (or a!1
               (and (not (<= 2.0 net_worth_ratio_prev1))
                    (not (<= 2.0 net_worth_ratio_prev2))
                    (<= 0.0 net_worth_ratio_prev1)))))
  (= capital_significantly_insufficient a!2))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足時處罰
(assert (= penalty (= 4 capital_level)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 1400000.0))
(assert (= risk_capital 1000000.0))
(assert (= net_worth 500.0))
(assert (= net_worth_ratio_prev1 (/ 5.0 2.0)))
(assert (= net_worth_ratio_prev2 (/ 5.0 2.0)))
(assert (= penalty true))
(assert (= capital_adequate false))
(assert (= capital_insufficient false))
(assert (= capital_level 0))
(assert (= capital_significantly_insufficient false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 10
; Total facts: 10
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
