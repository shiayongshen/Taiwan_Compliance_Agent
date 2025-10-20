; SMT2 file generated from compliance case automatic
; Case ID: case_387
; Generated at: 2025-10-19T14:37:22.117115
;
; This file can be executed with Z3:
;   z3 case_387.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_submission_months Int)
(declare-const annual_report_submitted Bool)
(declare-const capital_info_reported Bool)
(declare-const capital_info_reported_exclude_takeover Bool)
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
(declare-const semiannual_report_submission_months Int)
(declare-const semiannual_report_submitted Bool)
(declare-const special_report_ordered Bool)
(declare-const under_takeover Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (not (<= (/ 1.0 4.0) (/ own_capital risk_capital)))
               (not (<= 0.0 net_worth))))
      (a!2 (and (<= (/ 1.0 4.0) (/ own_capital risk_capital))
                (not (<= 1.0 (/ own_capital risk_capital))))))
(let ((a!3 (ite a!2 3 (ite (<= 1.0 (/ own_capital risk_capital)) 1 0))))
  (= capital_level (ite a!1 4 a!3)))))

; [insurance:capital_ratio_minimum] 自有資本與風險資本比率不得低於一定比率
(assert (= capital_ratio_minimum
   (ite (>= (/ own_capital risk_capital) minimum_ratio) 1.0 0.0)))

; [insurance:net_worth_ratio_minimum] 淨值比率不得低於一定比率
(assert (= net_worth_ratio_minimum
   (ite (>= net_worth_ratio minimum_net_worth_ratio) 1.0 0.0)))

; [insurance:capital_info_reported] 保險業依規定申報資本等級相關資訊
(assert (= capital_info_reported
   (or special_report_ordered
       (and annual_report_submitted (>= 3 annual_report_submission_months))
       (and semiannual_report_submitted
            (>= 2 semiannual_report_submission_months)))))

; [insurance:capital_info_reported_exclude_takeover] 依法接管之保險業不適用申報規定
(assert (= capital_info_reported_exclude_takeover
   (or capital_info_reported (not under_takeover))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本比率或淨值比率低於最低標準，或未依規定申報資本等級資訊時處罰
(assert (= penalty
   (or (not (= capital_ratio_minimum 1.0))
       (not (= net_worth_ratio_minimum 1.0))
       (and (not under_takeover) (not capital_info_reported)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital -54303000000.0))
(assert (= risk_capital 10000000000.0))
(assert (= net_worth -1000000000.0))
(assert (= annual_report_submitted false))
(assert (= annual_report_submission_months 4))
(assert (= semiannual_report_submitted false))
(assert (= semiannual_report_submission_months 3))
(assert (= special_report_ordered false))
(assert (= under_takeover false))
(assert (= capital_info_reported false))
(assert (= capital_info_reported_exclude_takeover false))
(assert (= capital_level 0))
(assert (= capital_ratio_minimum 0.0))
(assert (= minimum_net_worth_ratio 0.0))
(assert (= minimum_ratio 0.0))
(assert (= net_worth_ratio 0.0))
(assert (= net_worth_ratio_minimum 0.0))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 18
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
