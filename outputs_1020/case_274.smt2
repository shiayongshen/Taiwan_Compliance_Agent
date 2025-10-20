; SMT2 file generated from compliance case automatic
; Case ID: case_274
; Generated at: 2025-10-19T11:52:10.535803
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
(declare-const internal_control_established_flag Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_executed_flag Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_established_flag Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_executed_flag Bool)
(declare-const internal_handling_ok Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const severely_insufficient_measures_executed_flag Bool)
(declare-const significantly_insufficient_measures_executed_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_established_flag))

; [insurance:internal_control_executed] 執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_executed_flag))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_established_flag))

; [insurance:internal_handling_executed] 執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_executed_flag))

; [insurance:internal_control_ok] 內部控制及稽核制度建立且執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 內部處理制度及程序建立且執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施執行完成
(assert (= capital_insufficient_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施執行完成
(assert (= capital_significantly_insufficient_measures_executed
   significantly_insufficient_measures_executed_flag))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施執行完成
(assert (= capital_severely_insufficient_measures_executed
   severely_insufficient_measures_executed_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行內部控制或稽核制度，或未建立或未執行內部處理制度或程序，或資本不足等級未執行對應措施時處罰
(assert (= penalty
   (or (not internal_handling_ok)
       (and (= 2 capital_level) (not capital_insufficient_measures_executed))
       (and (= 4 capital_level)
            (not capital_severely_insufficient_measures_executed))
       (not internal_control_ok)
       (and (= 3 capital_level)
            (not capital_significantly_insufficient_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= internal_control_established_flag false))
(assert (= internal_control_executed_flag false))
(assert (= internal_handling_established_flag false))
(assert (= internal_handling_executed_flag false))
(assert (= severely_insufficient_measures_executed_flag false))
(assert (= significantly_insufficient_measures_executed_flag false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_level 0))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 22
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
