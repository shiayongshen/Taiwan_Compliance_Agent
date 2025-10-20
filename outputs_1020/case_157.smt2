; SMT2 file generated from compliance case automatic
; Case ID: case_157
; Generated at: 2025-10-19T09:34:14.272846
;
; This file can be executed with Z3:
;   z3 case_157.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_lower_priority Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_prev Real)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))
               (and (not (<= 2.0 net_worth_ratio)) (<= 0.0 net_worth_ratio))))
      (a!2 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio))))
      (a!3 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))
                1
                0)))
(let ((a!4 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                (ite a!1 3 (ite a!2 2 a!3)))))
  (= capital_level a!4))))

; [insurance:capital_level_lower_priority] 資本等級以較低等級為準（同時符合多等級時）
(assert (= (ite capital_level_lower_priority 1 0) capital_level))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_level_4_measures_executed capital_level_4_measures_completed))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_level_3_measures_executed capital_level_3_measures_completed))

; [insurance:capital_level_2_measures_executed] 資本不足等級措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:internal_control_compliance] 建立並執行內部控制及稽核制度
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance] 建立並執行內部處理制度及程序
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成等級4措施，或資本顯著不足且未完成等級3措施，或資本不足且未完成等級2措施，或未建立或未執行內部控制或內部處理制度時處罰
(assert (= penalty
   (or (and (= 3 capital_level) (not capital_level_3_measures_executed))
       (not internal_control_compliance)
       (not internal_handling_compliance)
       (and (= 4 capital_level) (not capital_level_4_measures_executed))
       (and (= 2 capital_level) (not capital_level_2_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth_ratio 3.0))
(assert (= net_worth_ratio_prev 3.0))
(assert (= capital_level_2_measures_executed false))
(assert (= capital_level_3_measures_completed false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level_4_measures_executed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_compliance false))
(assert (= net_worth 1000000.0))
(assert (= penalty true))
(assert (= capital_level 0))
(assert (= capital_level_lower_priority false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 20
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
