; SMT2 file generated from compliance case automatic
; Case ID: case_388
; Generated at: 2025-10-21T08:39:35.298203
;
; This file can be executed with Z3:
;   z3 case_388.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_audited Bool)
(declare-const annual_report_submission_days Int)
(declare-const annual_report_submitted Bool)
(declare-const capital_adequacy_minimum_met Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_value Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const reporting_annual_compliance Bool)
(declare-const reporting_compliance Bool)
(declare-const reporting_semiannual_compliance Bool)
(declare-const required_net_worth_ratio Real)
(declare-const required_ratio Real)
(declare-const risk_capital Real)
(declare-const semiannual_report_audited Bool)
(declare-const semiannual_report_reviewed Bool)
(declare-const semiannual_report_submission_days Int)
(declare-const semiannual_report_submitted Bool)
(declare-const under_supervision Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_adequacy_ratio] 自有資本與風險資本之比率
(assert (= capital_adequacy_ratio (/ own_capital risk_capital)))

; [insurance:net_worth_ratio] 淨值比率
(assert (= net_worth_ratio net_worth_ratio_value))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (not (<= 0.0 net_worth))
               (not (<= (* (/ 1.0 4.0) required_ratio) capital_adequacy_ratio)))))
(let ((a!2 (ite a!1
                4
                (ite (<= required_ratio capital_adequacy_ratio)
                     (ite (>= capital_adequacy_ratio required_ratio) 1 0)
                     3))))
  (= capital_level a!2))))

; [insurance:capital_adequacy_minimum_met] 自有資本與風險資本比率及淨值比率均不低於一定比率
(assert (= capital_adequacy_minimum_met
   (and (>= capital_adequacy_ratio required_ratio)
        (>= net_worth_ratio required_net_worth_ratio))))

; [insurance:reporting_annual_compliance] 每營業年度終了後三個月內申報經會計師查核之資本適足率及淨值比率
(assert (= reporting_annual_compliance
   (and annual_report_submitted
        annual_report_audited
        (>= 90 annual_report_submission_days))))

; [insurance:reporting_semiannual_compliance] 每半營業年度終了後二個月內申報經會計師核閱之資本適足率及經會計師查核之淨值比率
(assert (= reporting_semiannual_compliance
   (and semiannual_report_submitted
        semiannual_report_reviewed
        semiannual_report_audited
        (>= 60 semiannual_report_submission_days))))

; [insurance:reporting_compliance] 保險業依規定申報資本等級相關資訊
(assert (= reporting_compliance
   (or under_supervision
       (and reporting_annual_compliance reporting_semiannual_compliance))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本比率或淨值比率低於規定或未依規定申報時處罰
(assert (= penalty (or (not capital_adequacy_minimum_met) (not reporting_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital -9272100000))
(assert (= risk_capital 1000000000))
(assert (= capital_adequacy_ratio (/ -92721.0 100.0)))
(assert (= net_worth -1000000000))
(assert (= net_worth_ratio -50.0))
(assert (= net_worth_ratio_value 0.0))
(assert (= required_ratio 2.0))
(assert (= required_net_worth_ratio 0.0))
(assert (= annual_report_submitted false))
(assert (= annual_report_audited false))
(assert (= annual_report_submission_days 7))
(assert (= semiannual_report_submitted false))
(assert (= semiannual_report_reviewed false))
(assert (= semiannual_report_audited false))
(assert (= semiannual_report_submission_days 7))
(assert (= under_supervision true))
(assert (= reporting_annual_compliance false))
(assert (= reporting_semiannual_compliance false))
(assert (= reporting_compliance true))
(assert (= capital_adequacy_minimum_met false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 22
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
