; SMT2 file generated from compliance case automatic
; Case ID: case_378
; Generated at: 2025-10-21T22:27:51.315897
;
; This file can be executed with Z3:
;   z3 case_378.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_submission_days Int)
(declare-const annual_report_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_ratio_minimum Real)
(declare-const capital_reporting_compliance Bool)
(declare-const minimum_capital_ratio Real)
(declare-const minimum_net_worth_ratio Real)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_minimum Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const risk_capital Real)
(declare-const semiannual_report_submission_days Int)
(declare-const semiannual_report_submitted Bool)
(declare-const under_supervision Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (not (>= (/ own_capital risk_capital) (/ 1.0 4.0)))
               (not (<= 0.0 net_worth))))
      (a!2 (and (>= (/ own_capital risk_capital) (/ 1.0 4.0))
                (not (>= (/ own_capital risk_capital) 1.0))))
      (a!3 (ite (and (>= (/ own_capital risk_capital) 1.0)
                     (<= 100.0 net_worth_ratio))
                1
                0)))
(let ((a!4 (ite (and (>= (/ own_capital risk_capital) 1.0)
                     (not (<= 100.0 net_worth_ratio)))
                2
                a!3)))
  (= capital_level (ite a!1 4 (ite a!2 3 a!4))))))

; [insurance:capital_ratio_minimum] 自有資本與風險資本比率不得低於一定比率
(assert (let ((a!1 (ite (>= (* 100.0 (/ own_capital risk_capital))
                    minimum_capital_ratio)
                1.0
                0.0)))
  (= capital_ratio_minimum a!1)))

; [insurance:net_worth_ratio_minimum] 淨值比率不得低於一定比率
(assert (= net_worth_ratio_minimum
   (ite (>= net_worth_ratio minimum_net_worth_ratio) 1.0 0.0)))

; [insurance:capital_reporting_compliance] 保險業依規定申報資本等級相關資訊
(assert (= capital_reporting_compliance
   (or (and annual_report_submitted (>= 90 annual_report_submission_days))
       (and semiannual_report_submitted
            (>= 60 semiannual_report_submission_days))
       under_supervision)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本比率或淨值比率低於最低標準，或未依規定申報資本等級資訊時處罰
(assert (= penalty
   (or (not (= net_worth_ratio_minimum 1.0))
       (not (= capital_ratio_minimum 1.0))
       (not capital_reporting_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 1500000))
(assert (= risk_capital 1000000))
(assert (= net_worth 1000000))
(assert (= net_worth_ratio 150.0))
(assert (= minimum_capital_ratio 200.0))
(assert (= minimum_net_worth_ratio 100.0))
(assert (= annual_report_submitted true))
(assert (= annual_report_submission_days 7))
(assert (= semiannual_report_submitted true))
(assert (= semiannual_report_submission_days 7))
(assert (= under_supervision false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 16
; Total facts: 11
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
