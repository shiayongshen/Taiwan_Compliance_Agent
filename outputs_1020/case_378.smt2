; SMT2 file generated from compliance case automatic
; Case ID: case_378
; Generated at: 2025-10-19T14:25:19.772206
;
; This file can be executed with Z3:
;   z3 case_378.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_submission_months Int)
(declare-const annual_report_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_ratio_ok Bool)
(declare-const capital_report_compliance Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const required_net_worth_ratio Real)
(declare-const required_ratio Real)
(declare-const risk_capital Real)
(declare-const semiannual_report_submission_months Int)
(declare-const semiannual_report_submitted Bool)
(declare-const under_supervision Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (not (<= 0.0 net_worth))
               (not (<= (* (/ 1.0 4.0) required_ratio)
                        (/ own_capital risk_capital)))))
      (a!2 (and (>= (/ own_capital risk_capital) (* (/ 1.0 4.0) required_ratio))
                (not (<= required_ratio (/ own_capital risk_capital)))))
      (a!3 (ite (and (>= (/ own_capital risk_capital) required_ratio)
                     (>= net_worth_ratio required_net_worth_ratio))
                1
                0)))
  (= capital_level (ite a!1 4 (ite a!2 3 a!3)))))

; [insurance:capital_ratio_ok] 自有資本與風險資本比率及淨值比率均不低於一定比率
(assert (= capital_ratio_ok
   (and (>= (/ own_capital risk_capital) required_ratio)
        (>= net_worth_ratio required_net_worth_ratio))))

; [insurance:capital_report_compliance] 依規定申報資本等級相關資訊
(assert (= capital_report_compliance
   (or (and semiannual_report_submitted
            (>= 2 semiannual_report_submission_months))
       (not under_supervision)
       (and annual_report_submitted (>= 3 annual_report_submission_months)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本比率不足或未依規定申報時處罰
(assert (= penalty (or (not capital_ratio_ok) (not capital_report_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 180.0))
(assert (= risk_capital 1000.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= required_ratio 200.0))
(assert (= required_net_worth_ratio 0.0))
(assert (= annual_report_submitted true))
(assert (= annual_report_submission_months 1))
(assert (= semiannual_report_submitted true))
(assert (= semiannual_report_submission_months 1))
(assert (= under_supervision false))
(assert (= capital_level 0))
(assert (= capital_ratio_ok false))
(assert (= capital_report_compliance false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 5
; Total variables: 15
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
