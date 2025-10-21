; SMT2 file generated from compliance case automatic
; Case ID: case_354
; Generated at: 2025-10-21T07:51:03.974118
;
; This file can be executed with Z3:
;   z3 case_354.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_insufficient_measures_ok Bool)
(declare-const capital_insufficient_measures_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_level_lowest Int)
(declare-const capital_severely_insufficient_measures_ok Bool)
(declare-const capital_significantly_insufficient_measures_ok Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const severely_insufficient_measures_executed Bool)
(declare-const significantly_insufficient_measures_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (not (<= 2.0 net_worth_ratio)) (<= 0.0 net_worth_ratio))
               (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio))))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                (ite a!1 2 (ite (<= 200.0 capital_adequacy_ratio) 1 0)))))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_lowest] 資本等級以較低等級為準（同時符合多等級時）
(assert (let ((a!1 (ite (= 3 capital_level)
                3
                (ite (= 2 capital_level) 2 (ite (= 1 capital_level) 1 0)))))
  (= capital_level_lowest (ite (= 4 capital_level) 4 a!1))))

; [insurance:capital_insufficient_measures_submitted] 資本不足者已提出增資、財務或業務改善計畫
(assert (= capital_insufficient_measures_submitted improvement_plan_submitted))

; [insurance:capital_insufficient_measures_executed] 資本不足者已依計畫確實執行改善措施
(assert (= capital_insufficient_measures_executed improvement_plan_executed))

; [insurance:capital_insufficient_measures_ok] 資本不足者已提出且執行改善計畫
(assert (= capital_insufficient_measures_ok
   (and capital_insufficient_measures_submitted
        capital_insufficient_measures_executed)))

; [insurance:capital_significantly_insufficient_measures_ok] 資本顯著不足者已採取主管機關規定之措施
(assert (= capital_significantly_insufficient_measures_ok
   significantly_insufficient_measures_executed))

; [insurance:capital_severely_insufficient_measures_ok] 資本嚴重不足者已採取主管機關規定之處分措施
(assert (= capital_severely_insufficient_measures_ok
   severely_insufficient_measures_executed))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：資本不足等級達一定程度且未執行對應措施時處罰
(assert (= penalty
   (or (and (= 3 capital_level)
            (not capital_significantly_insufficient_measures_ok))
       (and (= 2 capital_level) (not capital_insufficient_measures_ok))
       (and (= 4 capital_level) (not capital_severely_insufficient_measures_ok)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 45.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= capital_insufficient_measures_submitted false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_insufficient_measures_ok false))
(assert (= significantly_insufficient_measures_executed false))
(assert (= severely_insufficient_measures_executed false))
(assert (= capital_severely_insufficient_measures_ok false))
(assert (= capital_significantly_insufficient_measures_ok false))
(assert (= capital_level 4))
(assert (= capital_level_lowest 4))
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
; Total variables: 15
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
