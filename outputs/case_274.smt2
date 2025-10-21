; SMT2 file generated from compliance case automatic
; Case ID: case_274
; Generated at: 2025-10-21T06:06:08.017166
;
; This file can be executed with Z3:
;   z3 case_274.smt2
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
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const severely_insufficient_measures_executed Bool)
(declare-const significantly_insufficient_measures_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established_and_executed] 保險業建立並執行內部控制及稽核制度
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_established_and_executed] 保險業建立並執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio)))))
(let ((a!2 (ite a!1
                2
                (ite (and (<= 200.0 capital_adequacy_ratio)
                          (<= 3.0 net_worth_ratio))
                     1
                     0))))
(let ((a!3 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!2)))
(let ((a!4 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!3)))
  (= capital_level a!4))))))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施執行完成
(assert (= capital_insufficient_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施執行完成
(assert (= capital_significantly_insufficient_measures_executed
   significantly_insufficient_measures_executed))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施執行完成
(assert (= capital_severely_insufficient_measures_executed
   severely_insufficient_measures_executed))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行內部控制或內部處理制度，或資本不足等級未執行對應措施時處罰
(assert (= penalty
   (or (and (= 4 capital_level)
            (not capital_severely_insufficient_measures_executed))
       (and (= 3 capital_level)
            (not capital_significantly_insufficient_measures_executed))
       (not internal_control_ok)
       (and (= 2 capital_level) (not capital_insufficient_measures_executed))
       (not internal_handling_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 4.0))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= severely_insufficient_measures_executed false))
(assert (= significantly_insufficient_measures_executed false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 18
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
