; SMT2 file generated from compliance case automatic
; Case ID: case_0
; Generated at: 2025-10-19T04:43:00.845501
;
; This file can be executed with Z3:
;   z3 case_0.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequate Bool)
(declare-const capital_insufficient Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient Bool)
(declare-const capital_significantly_insufficient Bool)
(declare-const measures_for_insufficient_executed Bool)
(declare-const measures_for_severely_insufficient_executed Bool)
(declare-const measures_for_significantly_insufficient_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const risk_capital Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足）
(assert (let ((a!1 (or (not (>= (/ own_capital risk_capital) (/ 1.0 2.0)))
               (not (<= 0.0 net_worth))))
      (a!2 (and (>= (/ own_capital risk_capital) (/ 1.0 2.0))
                (not (>= (/ own_capital risk_capital) (/ 3.0 2.0)))
                (<= 0.0 net_worth_ratio_prev1)
                (not (<= 2.0 net_worth_ratio_prev1))))
      (a!3 (and (>= (/ own_capital risk_capital) (/ 3.0 2.0))
                (not (>= (/ own_capital risk_capital) 2.0)))))
(let ((a!4 (ite a!3 2 (ite (>= (/ own_capital risk_capital) 2.0) 1 0))))
  (= capital_level (ite a!1 4 (ite a!2 3 a!4))))))

; [insurance:capital_adequate] 資本適足：資本適足率≥200且最近二期淨值比率至少一期≥3
(assert (= capital_adequate
   (and (>= (/ own_capital risk_capital) 2.0)
        (or (<= 3.0 net_worth_ratio_prev1) (<= 3.0 net_worth_ratio_prev2)))))

; [insurance:capital_insufficient] 資本不足：資本適足率≥150且<200，或最近二期淨值比率均未達3且至少一期≥2
(assert (let ((a!1 (and (>= (/ own_capital risk_capital) (/ 3.0 2.0))
                (not (>= (/ own_capital risk_capital) 2.0)))))
(let ((a!2 (or a!1
               (and (not (<= 3.0 net_worth_ratio_prev1))
                    (not (<= 3.0 net_worth_ratio_prev2))
                    (or (<= 2.0 net_worth_ratio_prev1)
                        (<= 2.0 net_worth_ratio_prev2))))))
  (= capital_insufficient a!2))))

; [insurance:capital_significantly_insufficient] 資本顯著不足：資本適足率≥50且<150，且最近二期淨值比率均未達2且≥0
(assert (let ((a!1 (and (>= (/ own_capital risk_capital) (/ 1.0 2.0))
                (not (>= (/ own_capital risk_capital) (/ 3.0 2.0)))
                (not (<= 2.0 net_worth_ratio_prev1))
                (not (<= 2.0 net_worth_ratio_prev2))
                (<= 0.0 net_worth_ratio_prev1)
                (<= 0.0 net_worth_ratio_prev2))))
  (= capital_significantly_insufficient a!1)))

; [insurance:capital_severely_insufficient] 資本嚴重不足：資本適足率<50或淨值<0
(assert (let ((a!1 (or (not (>= (/ own_capital risk_capital) (/ 1.0 2.0)))
               (not (<= 0.0 net_worth)))))
  (= capital_severely_insufficient a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足或資本顯著不足或資本不足時未採取主管機關規定措施
(assert (= penalty
   (or (and capital_significantly_insufficient
            (not measures_for_significantly_insufficient_executed))
       (and capital_insufficient (not measures_for_insufficient_executed))
       (and capital_severely_insufficient
            (not measures_for_severely_insufficient_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 1110900.0))
(assert (= risk_capital 1000000.0))
(assert (= net_worth 29700.0))
(assert (= net_worth_ratio_prev1 (/ 297.0 100.0)))
(assert (= net_worth_ratio_prev2 (/ 297.0 100.0)))
(assert (= measures_for_insufficient_executed false))
(assert (= measures_for_significantly_insufficient_executed false))
(assert (= measures_for_severely_insufficient_executed false))
(assert (= penalty true))
(assert (= capital_adequate false))
(assert (= capital_insufficient false))
(assert (= capital_level 0))
(assert (= capital_severely_insufficient false))
(assert (= capital_significantly_insufficient false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 14
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
