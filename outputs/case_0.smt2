; SMT2 file generated from compliance case automatic
; Case ID: case_0
; Generated at: 2025-10-20T22:41:07.378722
;
; This file can be executed with Z3:
;   z3 case_0.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const asset_disposal_approved Bool)
(declare-const asset_disposed Bool)
(declare-const branch_reduction Bool)
(declare-const capital_level Int)
(declare-const credit_restriction Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const level_2_measures_executed Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const responsible_person_compensation_reduced Bool)
(declare-const responsible_person_removed Bool)
(declare-const responsible_person_suspended Bool)
(declare-const risk_capital Real)
(declare-const special_disposition_149_3_1 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足）
(assert (let ((a!1 (or (not (<= 0.0 net_worth))
               (not (>= (/ own_capital risk_capital) (/ 1.0 2.0)))))
      (a!2 (and (>= (/ own_capital risk_capital) (/ 1.0 2.0))
                (not (>= (/ own_capital risk_capital) (/ 3.0 2.0)))))
      (a!4 (and (>= (/ own_capital risk_capital) (/ 3.0 2.0))
                (not (>= (/ own_capital risk_capital) 2.0))))
      (a!6 (ite (and (>= (/ own_capital risk_capital) 2.0)
                     (or (>= net_worth_ratio_prev1 (/ 3.0 100.0))
                         (>= net_worth_ratio_prev2 (/ 3.0 100.0))))
                1
                0)))
(let ((a!3 (or a!2
               (and (not (>= net_worth_ratio_prev1 (/ 3.0 100.0)))
                    (not (>= net_worth_ratio_prev2 (/ 3.0 100.0)))
                    (>= net_worth_ratio_prev1 (/ 1.0 50.0)))))
      (a!5 (or a!4
               (and (not (>= net_worth_ratio_prev1 (/ 1.0 50.0)))
                    (not (>= net_worth_ratio_prev2 (/ 1.0 50.0)))
                    (>= net_worth_ratio_prev1 0.0)))))
  (= capital_level (ite a!1 4 (ite a!3 3 (ite a!5 2 a!6)))))))

; [insurance:level_2_measures_executed] 資本不足等級措施執行完成
(assert (= level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:level_3_measures_executed] 資本顯著不足等級措施執行完成
(assert (= level_3_measures_executed
   (and level_2_measures_executed
        responsible_person_removed
        responsible_person_suspended
        asset_disposal_approved
        asset_disposed
        credit_restriction
        responsible_person_compensation_reduced
        branch_reduction)))

; [insurance:level_4_measures_executed] 資本嚴重不足等級措施執行完成
(assert (= level_4_measures_executed
   (and level_3_measures_executed special_disposition_149_3_1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本等級不足且未執行對應措施時處罰
(assert (= penalty
   (or (and (= 3 capital_level) (not level_3_measures_executed))
       (and (= 2 capital_level) (not level_2_measures_executed))
       (and (= 4 capital_level) (not level_4_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital (/ 11109.0 100.0)))
(assert (= risk_capital 100.0))
(assert (= net_worth (/ 297.0 100.0)))
(assert (= net_worth_ratio_prev1 (/ 297.0 100.0)))
(assert (= net_worth_ratio_prev2 (/ 297.0 100.0)))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_executed false))
(assert (= asset_disposal_approved false))
(assert (= asset_disposed false))
(assert (= branch_reduction false))
(assert (= credit_restriction true))
(assert (= responsible_person_compensation_reduced false))
(assert (= responsible_person_removed false))
(assert (= responsible_person_suspended false))
(assert (= special_disposition_149_3_1 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 20
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
