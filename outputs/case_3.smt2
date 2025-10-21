; SMT2 file generated from compliance case automatic
; Case ID: case_3
; Generated at: 2025-10-20T22:44:58.320357
;
; This file can be executed with Z3:
;   z3 case_3.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequate Bool)
(declare-const capital_insufficient Bool)
(declare-const capital_insufficient_plan_executed Bool)
(declare-const capital_insufficient_plan_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient Bool)
(declare-const capital_severely_insufficient_additional_measures_executed Bool)
(declare-const capital_significantly_insufficient Bool)
(declare-const capital_significantly_insufficient_additional_measures_executed Bool)
(declare-const level_2_measures_executed Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
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
                (not (<= 2.0 net_worth_ratio_prev1))
                (<= 0.0 net_worth_ratio_prev2)
                (not (<= 2.0 net_worth_ratio_prev2))))
      (a!3 (and (>= (/ own_capital risk_capital) (/ 3.0 2.0))
                (not (>= (/ own_capital risk_capital) 2.0)))))
(let ((a!4 (ite a!3 2 (ite (>= (/ own_capital risk_capital) 2.0) 1 0))))
  (= capital_level (ite a!1 4 (ite a!2 3 a!4))))))

; [insurance:capital_adequate] 資本適足：資本等級為1
(assert (= capital_adequate (= 1 capital_level)))

; [insurance:capital_insufficient] 資本不足：資本等級為2
(assert (= capital_insufficient (= 2 capital_level)))

; [insurance:capital_significantly_insufficient] 資本顯著不足：資本等級為3
(assert (= capital_significantly_insufficient (= 3 capital_level)))

; [insurance:capital_severely_insufficient] 資本嚴重不足：資本等級為4
(assert (= capital_severely_insufficient (= 4 capital_level)))

; [insurance:level_2_measures_executed] 資本不足等級措施執行完成（提出增資或改善計畫且確實執行）
(assert (= level_2_measures_executed
   (and capital_insufficient_plan_submitted capital_insufficient_plan_executed)))

; [insurance:level_3_measures_executed] 資本顯著不足等級措施執行完成（包含資本不足措施及主管機關規定之其他措施）
(assert (= level_3_measures_executed
   (and level_2_measures_executed
        capital_significantly_insufficient_additional_measures_executed)))

; [insurance:level_4_measures_executed] 資本嚴重不足等級措施執行完成（包含資本顯著不足措施及第一百四十九條第三項第一款規定之處分）
(assert (= level_4_measures_executed
   (and level_3_measures_executed
        capital_severely_insufficient_additional_measures_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本不足等級且未執行對應措施時處罰
(assert (= penalty
   (or (and capital_severely_insufficient (not level_4_measures_executed))
       (and capital_significantly_insufficient (not level_3_measures_executed))
       (and capital_insufficient (not level_2_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 1790000))
(assert (= risk_capital 1000000))
(assert (= net_worth 100))
(assert (= net_worth_ratio_prev1 (/ 5.0 2.0)))
(assert (= net_worth_ratio_prev2 (/ 5.0 2.0)))
(assert (= capital_insufficient_plan_submitted true))
(assert (= capital_insufficient_plan_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 18
; Total facts: 7
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
