; SMT2 file generated from compliance case automatic
; Case ID: case_389
; Generated at: 2025-10-19T14:38:57.960409
;
; This file can be executed with Z3:
;   z3 case_389.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_submission_days Int)
(declare-const annual_report_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_level_2_condition Bool)
(declare-const capital_level_3_condition Bool)
(declare-const capital_level_4_condition Bool)
(declare-const capital_ratio_minimum Real)
(declare-const minimum_capital_ratio Real)
(declare-const minimum_net_worth_ratio Real)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_minimum Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const reporting_compliance Bool)
(declare-const reporting_exemption Bool)
(declare-const risk_capital Real)
(declare-const semiannual_report_submission_days Int)
(declare-const semiannual_report_submitted Bool)
(declare-const special_report_ordered Bool)
(declare-const under_supervision Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足）
(assert (let ((a!1 (or (not (<= 0.0 net_worth))
               (not (<= (/ 1.0 4.0) (/ own_capital risk_capital)))))
      (a!2 (and (<= (/ 1.0 4.0) (/ own_capital risk_capital))
                (not (<= 1.0 (/ own_capital risk_capital))))))
(let ((a!3 (ite a!2 3 (ite (<= 1.0 (/ own_capital risk_capital)) 1 0))))
  (= capital_level (ite a!1 4 a!3)))))

; [insurance:capital_ratio_minimum] 自有資本與風險資本之比率不得低於一定比率
(assert (= capital_ratio_minimum
   (ite (>= (/ own_capital risk_capital) minimum_capital_ratio) 1.0 0.0)))

; [insurance:net_worth_ratio_minimum] 淨值比率不得低於一定比率
(assert (= net_worth_ratio_minimum
   (ite (>= net_worth_ratio minimum_net_worth_ratio) 1.0 0.0)))

; [insurance:capital_level_2_condition] 資本不足等級條件
(assert (let ((a!1 (and (>= (/ own_capital risk_capital) minimum_capital_ratio)
                (>= net_worth_ratio minimum_net_worth_ratio)
                (not (<= (/ 1.0 4.0) (/ own_capital risk_capital))))))
  (= capital_level_2_condition a!1)))

; [insurance:capital_level_3_condition] 資本顯著不足等級條件
(assert (let ((a!1 (and (<= (/ 1.0 4.0) (/ own_capital risk_capital))
                (not (<= 1.0 (/ own_capital risk_capital))))))
  (= capital_level_3_condition a!1)))

; [insurance:capital_level_4_condition] 資本嚴重不足等級條件
(assert (let ((a!1 (or (not (<= 0.0 net_worth))
               (not (<= (/ 1.0 4.0) (/ own_capital risk_capital))))))
  (= capital_level_4_condition a!1)))

; [insurance:reporting_compliance] 保險業依規定申報資本等級相關資訊
(assert (= reporting_compliance
   (or (and annual_report_submitted (>= 90 annual_report_submission_days))
       (and semiannual_report_submitted
            (>= 60 semiannual_report_submission_days))
       special_report_ordered)))

; [insurance:reporting_exemption] 依法接管之保險業不適用申報規定
(assert (= reporting_exemption under_supervision))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本比率或淨值比率低於最低標準，或未依規定申報且不適用接管豁免時處罰
(assert (let ((a!1 (and (or (not (= capital_ratio_minimum 1.0))
                    (not (= net_worth_ratio_minimum 1.0)))
                (not reporting_exemption)
                (not reporting_compliance))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital -11362000000.0))
(assert (= risk_capital 10000000000.0))
(assert (= net_worth -1000000000.0))
(assert (= annual_report_submitted true))
(assert (= annual_report_submission_days 7))
(assert (= semiannual_report_submitted true))
(assert (= semiannual_report_submission_days 7))
(assert (= special_report_ordered false))
(assert (= under_supervision false))
(assert (= capital_level 0))
(assert (= capital_level_2_condition false))
(assert (= capital_level_3_condition false))
(assert (= capital_level_4_condition false))
(assert (= capital_ratio_minimum 0.0))
(assert (= minimum_capital_ratio 0.0))
(assert (= minimum_net_worth_ratio 0.0))
(assert (= net_worth_ratio 0.0))
(assert (= net_worth_ratio_minimum 0.0))
(assert (= penalty false))
(assert (= reporting_compliance false))
(assert (= reporting_exemption false))

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
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
