; SMT2 file generated from compliance case automatic
; Case ID: case_377
; Generated at: 2025-10-21T08:24:04.385171
;
; This file can be executed with Z3:
;   z3 case_377.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_submission_days Int)
(declare-const annual_report_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_ratio_ok Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const reporting_compliance Bool)
(declare-const required_ratio Real)
(declare-const risk_capital Real)
(declare-const semiannual_report_submission_days Int)
(declare-const semiannual_report_submitted Bool)
(declare-const under_supervision Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (not (<= (* (/ 1.0 4.0) required_ratio)
                    (* 100.0 (/ own_capital risk_capital)))))
      (a!2 (not (<= required_ratio (* 100.0 (/ own_capital risk_capital))))))
(let ((a!3 (and (>= (* 100.0 (/ own_capital risk_capital)) required_ratio) a!2)))
(let ((a!4 (ite (or a!1 (not (<= 0.0 net_worth))) 4 (ite a!3 0 1))))
  (= capital_level a!4)))))

; [insurance:capital_ratio_ok] 自有資本與風險資本比率及淨值比率均不低於一定比率
(assert (let ((a!1 (and (>= (* 100.0 (/ own_capital risk_capital)) required_ratio)
                (>= (* 100.0 (/ net_worth risk_capital)) net_worth_ratio))))
  (= capital_ratio_ok a!1)))

; [insurance:reporting_compliance] 依規定期限申報資本等級相關資訊
(assert (= reporting_compliance
   (or (and annual_report_submitted (>= 90 annual_report_submission_days))
       under_supervision
       (and semiannual_report_submitted
            (>= 60 semiannual_report_submission_days)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本比率不足或未依規定申報且非主管機關接管保險業時處罰
(assert (= penalty
   (and (not under_supervision)
        (or (not capital_ratio_ok) (not reporting_compliance)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 150.0))
(assert (= risk_capital 100.0))
(assert (= net_worth 20.0))
(assert (= required_ratio 200.0))
(assert (= net_worth_ratio 20.0))
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
; Total constraints: 5
; Total variables: 14
; Total facts: 10
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
