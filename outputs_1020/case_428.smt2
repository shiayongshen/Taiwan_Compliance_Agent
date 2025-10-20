; SMT2 file generated from compliance case automatic
; Case ID: case_428
; Generated at: 2025-10-19T15:39:11.410805
;
; This file can be executed with Z3:
;   z3 case_428.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_insufficient_measures_completed Bool)
(declare-const capital_level_insufficient_measures_executed Bool)
(declare-const capital_level_none Bool)
(declare-const capital_level_severe Bool)
(declare-const capital_level_severe_measures_completed Bool)
(declare-const capital_level_severe_measures_executed Bool)
(declare-const capital_level_significant Bool)
(declare-const capital_level_significant_measures_completed Bool)
(declare-const capital_level_significant_measures_executed Bool)
(declare-const capital_level_value Int)
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
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)

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

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著惡化, 4=嚴重不足）
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
  (= capital_level
     (ite (<= 0 capital_level_value)
          (ite (<= 50.0 capital_adequacy_ratio) a!2 4)
          0)))))

; [insurance:capital_level_severe] 資本等級是否為嚴重不足
(assert (= capital_level_severe (= 4 capital_level)))

; [insurance:capital_level_significant] 資本等級是否為顯著惡化
(assert (= capital_level_significant (= 3 capital_level)))

; [insurance:capital_level_insufficient] 資本等級是否為不足
(assert (= capital_level_insufficient (= 2 capital_level)))

; [insurance:capital_level_adequate] 資本等級是否為適足
(assert (= capital_level_adequate (= 1 capital_level)))

; [insurance:capital_level_none] 資本等級是否為未分類
(assert (= capital_level_none (= 0 capital_level)))

; [insurance:capital_level_severe_measures_executed] 嚴重不足等級增資、財務或業務改善計畫或合併完成
(assert (= capital_level_severe_measures_executed
   capital_level_severe_measures_completed))

; [insurance:capital_level_significant_measures_executed] 顯著惡化等級改善計畫完成
(assert (= capital_level_significant_measures_executed
   capital_level_significant_measures_completed))

; [insurance:capital_level_insufficient_measures_executed] 不足等級改善計畫完成
(assert (= capital_level_insufficient_measures_executed
   capital_level_insufficient_measures_completed))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行內部控制或內部處理制度，或資本嚴重不足且未完成改善計畫時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (and (= 4 capital_level) (not capital_level_severe_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth_ratio 1.0))
(assert (= capital_level_value 1))
(assert (= internal_control_established_flag true))
(assert (= internal_control_executed_flag true))
(assert (= internal_handling_established_flag true))
(assert (= internal_handling_executed_flag true))
(assert (= capital_level 0))
(assert (= capital_level_adequate false))
(assert (= capital_level_insufficient false))
(assert (= capital_level_insufficient_measures_completed false))
(assert (= capital_level_insufficient_measures_executed false))
(assert (= capital_level_none false))
(assert (= capital_level_severe false))
(assert (= capital_level_severe_measures_completed false))
(assert (= capital_level_severe_measures_executed false))
(assert (= capital_level_significant false))
(assert (= capital_level_significant_measures_completed false))
(assert (= capital_level_significant_measures_executed false))
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
; Total constraints: 17
; Total variables: 26
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
