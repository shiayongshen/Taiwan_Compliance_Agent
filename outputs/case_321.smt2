; SMT2 file generated from compliance case automatic
; Case ID: case_321
; Generated at: 2025-10-21T07:12:54.243025
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
(declare-const capital_severely_insufficient Bool)
(declare-const capital_significantly_insufficient Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const own_capital Real)
(declare-const risk_capital Real)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (not (>= (/ own_capital risk_capital) (/ 1.0 2.0)))
               (not (<= 0.0 net_worth))))
      (a!2 (and (>= (/ own_capital risk_capital) (/ 1.0 2.0))
                (not (>= (/ own_capital risk_capital) (/ 3.0 2.0)))
                (<= 0.0 net_worth_ratio_prev1)
                (not (<= 2.0 net_worth_ratio_prev1))
                (<= 0.0 net_worth_ratio_prev2)
                (not (<= 2.0 net_worth_ratio_prev2))))
      (a!3 (and (>= (/ own_capital risk_capital) (/ 3.0 2.0))
                (not (>= (/ own_capital risk_capital) 2.0))))
      (a!4 (ite (and (>= (/ own_capital risk_capital) 2.0)
                     (or (<= 3.0 net_worth_ratio_prev1)
                         (<= 3.0 net_worth_ratio_prev2)))
                1
                0)))
  (= capital_level (ite a!1 4 (ite a!2 3 (ite a!3 2 a!4))))))

; [insurance:capital_level_corrected] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）依低等級原則決定
(assert (let ((a!1 (or (not (<= 0.0 net_worth))
               (not (>= (/ own_capital risk_capital) (/ 1.0 2.0)))))
      (a!2 (or (and (not (<= 3.0 net_worth_ratio_prev1))
                    (<= 2.0 net_worth_ratio_prev1))
               (and (not (<= 3.0 net_worth_ratio_prev2))
                    (<= 2.0 net_worth_ratio_prev2))))
      (a!4 (and (>= (/ own_capital risk_capital) (/ 3.0 2.0))
                (not (>= (/ own_capital risk_capital) 2.0))))
      (a!5 (ite (and (>= (/ own_capital risk_capital) 2.0)
                     (or (<= 3.0 net_worth_ratio_prev1)
                         (<= 3.0 net_worth_ratio_prev2)))
                1
                0)))
(let ((a!3 (and (>= (/ own_capital risk_capital) (/ 1.0 2.0))
                (not (>= (/ own_capital risk_capital) (/ 3.0 2.0)))
                a!2)))
  (= capital_level (ite a!1 4 (ite a!3 3 (ite a!4 2 a!5)))))))

; [insurance:capital_adequate] 資本適足：資本適足率≥200且最近二期淨值比率至少一期≥3
(assert (= capital_adequate
   (and (>= (/ own_capital risk_capital) 2.0)
        (or (<= 3.0 net_worth_ratio_prev1) (<= 3.0 net_worth_ratio_prev2)))))

; [insurance:capital_insufficient] 資本不足：資本適足率在150以上未達200，或最近二期淨值比率均未達3且至少一期≥2
(assert (let ((a!1 (and (>= (/ own_capital risk_capital) (/ 3.0 2.0))
                (not (>= (/ own_capital risk_capital) 2.0)))))
(let ((a!2 (or a!1
               (and (not (<= 3.0 net_worth_ratio_prev1))
                    (not (<= 3.0 net_worth_ratio_prev2))
                    (or (<= 2.0 net_worth_ratio_prev1)
                        (<= 2.0 net_worth_ratio_prev2))))))
  (= capital_insufficient a!2))))

; [insurance:capital_significantly_insufficient] 資本顯著不足：資本適足率在50以上未達150，且最近二期淨值比率均未達2且≥0
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

; [meta:penalty_conditions] 處罰條件：資本嚴重不足時處罰
(assert (= penalty capital_severely_insufficient))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 100000000))
(assert (= risk_capital 1000000000))
(assert (= net_worth 1000000))
(assert (= net_worth_ratio_prev1 (/ 5.0 2.0)))
(assert (= net_worth_ratio_prev2 (/ 5.0 2.0)))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 11
; Total facts: 6
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
