; SMT2 file generated from compliance case automatic
; Case ID: case_159
; Generated at: 2025-10-21T03:34:59.343604
;
; This file can be executed with Z3:
;   z3 case_159.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const asset_disposal_approved Bool)
(declare-const asset_disposed Bool)
(declare-const branch_restriction_or_closure Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_ok Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_ok Bool)
(declare-const capital_significantly_insufficient_measures_ok Bool)
(declare-const credit_restriction Bool)
(declare-const disposition_149_3_1_executed Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const penalty Bool)
(declare-const responsible_person_avg_pay_12m Real)
(declare-const responsible_person_deregistered Bool)
(declare-const responsible_person_reduced_pay Bool)
(declare-const responsible_person_removed Bool)
(declare-const responsible_person_suspended Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio_prev1))
                    (not (<= 3.0 net_worth_ratio_prev2))
                    (<= 2.0 net_worth_ratio_prev1))))
      (a!2 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio_prev1)
                         (<= 3.0 net_worth_ratio_prev2)))
                1
                0)))
(let ((a!3 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio_prev1)
                     (not (<= 2.0 net_worth_ratio_prev1))
                     (<= 0.0 net_worth_ratio_prev2)
                     (not (<= 2.0 net_worth_ratio_prev2)))
                3
                (ite a!1 2 a!2))))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!3)))
  (= capital_level a!4)))))

; [insurance:capital_insufficient_measures_ok] 資本不足等級措施執行完成
(assert (= capital_insufficient_measures_ok
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:capital_significantly_insufficient_measures_ok] 資本顯著不足等級措施執行完成
(assert (let ((a!1 (and capital_insufficient_measures_ok
                responsible_person_removed
                responsible_person_deregistered
                responsible_person_suspended
                asset_disposal_approved
                asset_disposed
                credit_restriction
                (>= (/ (ite responsible_person_reduced_pay 1.0 0.0)
                       responsible_person_avg_pay_12m)
                    0.0)
                (<= (/ (ite responsible_person_reduced_pay 1.0 0.0)
                       responsible_person_avg_pay_12m)
                    (/ 7.0 10.0))
                branch_restriction_or_closure)))
  (= capital_significantly_insufficient_measures_ok a!1)))

; [insurance:capital_severely_insufficient_measures_ok] 資本嚴重不足等級措施執行完成
(assert (= capital_severely_insufficient_measures_ok
   (and capital_significantly_insufficient_measures_ok
        disposition_149_3_1_executed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：資本不足等級未執行對應措施時處罰
(assert (= penalty
   (or (and (= 3 capital_level)
            (not capital_significantly_insufficient_measures_ok))
       (and (= 2 capital_level) (not capital_insufficient_measures_ok))
       (and (= 4 capital_level) (not capital_severely_insufficient_measures_ok)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -1000000))
(assert (= net_worth_ratio_prev1 (/ 3.0 2.0)))
(assert (= net_worth_ratio_prev2 (/ 3.0 2.0)))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= responsible_person_removed false))
(assert (= responsible_person_deregistered false))
(assert (= responsible_person_suspended false))
(assert (= asset_disposal_approved false))
(assert (= asset_disposed false))
(assert (= credit_restriction false))
(assert (= responsible_person_reduced_pay false))
(assert (= responsible_person_avg_pay_12m 1000000.0))
(assert (= branch_restriction_or_closure false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 21
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
