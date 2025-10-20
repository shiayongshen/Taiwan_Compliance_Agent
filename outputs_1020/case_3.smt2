; SMT2 file generated from compliance case automatic
; Case ID: case_3
; Generated at: 2025-10-19T04:46:40.391872
;
; This file can be executed with Z3:
;   z3 case_3.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_insufficient_plan_executed Bool)
(declare-const capital_insufficient_plan_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_severely_additional_measures_executed Bool)
(declare-const capital_significantly_additional_measures_executed Bool)
(declare-const level_2_measures_ok Bool)
(declare-const level_3_measures_ok Bool)
(declare-const level_4_measures_ok Bool)
(declare-const net_worth Real)
(declare-const net_worth_prev Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const risk_capital Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足, 0=未分類）
(assert (let ((a!1 (or (not (>= (/ own_capital risk_capital) (/ 1.0 2.0)))
               (not (<= 0.0 net_worth))))
      (a!2 (and (>= (/ own_capital risk_capital) (/ 1.0 2.0))
                (not (>= (/ own_capital risk_capital) (/ 3.0 2.0)))))
      (a!3 (not (<= 2.0
                    (ite (<= net_worth_prev net_worth) net_worth_prev net_worth))))
      (a!5 (and (>= (/ own_capital risk_capital) (/ 3.0 2.0))
                (not (>= (/ own_capital risk_capital) 2.0))))
      (a!6 (not (<= 3.0
                    (ite (<= net_worth_prev net_worth) net_worth_prev net_worth)))))
(let ((a!4 (and a!3
                (<= 0.0
                    (ite (<= net_worth_prev net_worth) net_worth_prev net_worth))))
      (a!7 (and a!6
                (<= 2.0
                    (ite (<= net_worth_prev net_worth) net_worth_prev net_worth)))))
(let ((a!8 (ite (or a!5 a!7) 2 (ite (>= (/ own_capital risk_capital) 2.0) 1 0))))
  (= capital_level (ite a!1 4 (ite (or a!2 a!4) 3 a!8)))))))

; [insurance:level_2_measures_ok] 資本不足等級措施執行完成
(assert (= level_2_measures_ok
   (and capital_insufficient_plan_submitted capital_insufficient_plan_executed)))

; [insurance:level_3_measures_ok] 資本顯著不足等級措施執行完成
(assert (= level_3_measures_ok
   (and level_2_measures_ok capital_significantly_additional_measures_executed)))

; [insurance:level_4_measures_ok] 資本嚴重不足等級措施執行完成
(assert (= level_4_measures_ok
   (and level_3_measures_ok capital_severely_additional_measures_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本不足等級且未執行對應措施時處罰
(assert (= penalty
   (or (and (= 3 capital_level) (not level_3_measures_ok))
       (and (= 2 capital_level) (not level_2_measures_ok))
       (and (= 4 capital_level) (not level_4_measures_ok)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 1790000.0))
(assert (= risk_capital 1000000.0))
(assert (= net_worth 500.0))
(assert (= net_worth_prev 500.0))
(assert (= capital_insufficient_plan_submitted true))
(assert (= capital_insufficient_plan_executed false))
(assert (= capital_significantly_additional_measures_executed false))
(assert (= capital_severely_additional_measures_executed false))
(assert (= capital_level 0))
(assert (= level_2_measures_ok false))
(assert (= level_3_measures_ok false))
(assert (= level_4_measures_ok false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 13
; Total facts: 13
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
