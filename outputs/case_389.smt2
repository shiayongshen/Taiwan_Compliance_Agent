; SMT2 file generated from compliance case automatic
; Case ID: case_389
; Generated at: 2025-10-21T08:40:16.702381
;
; This file can be executed with Z3:
;   z3 case_389.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_audited Bool)
(declare-const annual_report_submitted Bool)
(declare-const capital_info_reported_annual Bool)
(declare-const capital_info_reported_compliance Bool)
(declare-const capital_info_reported_exemption Bool)
(declare-const capital_info_reported_required Bool)
(declare-const capital_info_reported_semiannual Bool)
(declare-const capital_level Int)
(declare-const capital_ratio_minimum Real)
(declare-const minimum_net_worth_ratio Real)
(declare-const minimum_ratio Real)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_minimum Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const risk_capital Real)
(declare-const semiannual_report_audited Bool)
(declare-const semiannual_report_reviewed Bool)
(declare-const semiannual_report_submitted Bool)
(declare-const under_government_takeover Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (not (<= (/ 1.0 4.0) (/ own_capital risk_capital)))
               (not (<= 0.0 net_worth))))
      (a!2 (and (<= (/ 1.0 4.0) (/ own_capital risk_capital))
                (not (<= 1.0 (/ own_capital risk_capital)))))
      (a!3 (and (<= 1.0 (/ own_capital risk_capital))
                (not (<= (/ 3.0 2.0) (/ own_capital risk_capital))))))
(let ((a!4 (ite a!3 2 (ite (<= (/ 3.0 2.0) (/ own_capital risk_capital)) 1 0))))
  (= capital_level (ite a!1 4 (ite a!2 3 a!4))))))

; [insurance:capital_ratio_minimum] 自有資本與風險資本比率不得低於一定比率
(assert (= capital_ratio_minimum
   (ite (>= (/ own_capital risk_capital) minimum_ratio) 1.0 0.0)))

; [insurance:net_worth_ratio_minimum] 淨值比率不得低於一定比率
(assert (= net_worth_ratio_minimum
   (ite (>= net_worth_ratio minimum_net_worth_ratio) 1.0 0.0)))

; [insurance:capital_info_reported_annual] 每營業年度終了後三個月內申報經會計師查核之資本適足率及淨值比率
(assert (= capital_info_reported_annual
   (and annual_report_submitted annual_report_audited)))

; [insurance:capital_info_reported_semiannual] 每半營業年度終了後二個月內申報經會計師核閱之資本適足率及經會計師查核之淨值比率
(assert (= capital_info_reported_semiannual
   (and semiannual_report_submitted
        semiannual_report_reviewed
        semiannual_report_audited)))

; [insurance:capital_info_reported_required] 依規定申報資本等級相關資訊
(assert (= capital_info_reported_required
   (or capital_info_reported_annual capital_info_reported_semiannual)))

; [insurance:capital_info_reported_exemption] 依法接管之保險業不適用申報規定
(assert (= capital_info_reported_exemption under_government_takeover))

; [insurance:capital_info_reported_compliance] 申報資本等級相關資訊合規
(assert (= capital_info_reported_compliance
   (or capital_info_reported_exemption capital_info_reported_required)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定申報資本等級相關資訊且非依法接管保險業時處罰
(assert (= penalty
   (and (not capital_info_reported_compliance) (not under_government_takeover))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital -11362000000))
(assert (= risk_capital 100000000000))
(assert (= net_worth -5000000000))
(assert (= annual_report_submitted false))
(assert (= annual_report_audited false))
(assert (= semiannual_report_submitted false))
(assert (= semiannual_report_reviewed false))
(assert (= semiannual_report_audited false))
(assert (= under_government_takeover false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 21
; Total facts: 9
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
