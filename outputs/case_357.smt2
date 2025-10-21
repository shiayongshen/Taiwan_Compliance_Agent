; SMT2 file generated from compliance case automatic
; Case ID: case_357
; Generated at: 2025-10-21T07:57:37.100399
;
; This file can be executed with Z3:
;   z3 case_357.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const financial_or_business_deteriorated Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const serious_insufficient_and_no_measures Bool)
(declare-const severely_insufficient_measures_executed Bool)
(declare-const significantly_insufficient_measures_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_lower_priority] 資本等級以較低等級為準
(assert true)

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_severely_insufficient_measures_executed
   severely_insufficient_measures_executed))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_significantly_insufficient_measures_executed
   significantly_insufficient_measures_executed))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施已執行
(assert (= capital_insufficient_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:serious_insufficient_and_no_measures] 資本嚴重不足且未完成增資、改善計畫或合併
(assert (= serious_insufficient_and_no_measures
   (and (= 4 capital_level)
        (not (or capital_severely_insufficient_measures_executed
                 capital_insufficient_measures_executed
                 capital_significantly_insufficient_measures_executed)))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且未改善
(assert (= financial_or_business_deterioration
   (and financial_or_business_deteriorated (not improvement_plan_executed))))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資、改善計畫或合併，或財務業務顯著惡化且未改善時處罰
(assert (= penalty
   (or serious_insufficient_and_no_measures financial_or_business_deterioration)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= financial_or_business_deteriorated false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_executed false))
(assert (= improvement_plan_submitted false))
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
; Total facts: 11
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
