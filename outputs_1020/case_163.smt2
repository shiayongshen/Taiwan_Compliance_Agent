; SMT2 file generated from compliance case automatic
; Case ID: case_163
; Generated at: 2025-10-19T09:39:57.823946
;
; This file can be executed with Z3:
;   z3 case_163.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_handling Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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

; [insurance:internal_control_established] 已建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_control_executed] 已執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_control_ok] 內部控制及稽核制度已建立且執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_established] 已建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:internal_handling_executed] 已執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:internal_handling_ok] 內部處理制度及程序已建立且執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:violation_internal_control] 違反內部控制及稽核制度規定
(assert (not (= internal_control_ok violation_internal_control)))

; [insurance:violation_internal_handling] 違反內部處理制度及程序規定
(assert (not (= internal_handling_ok violation_internal_handling)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制或內部處理制度規定時處罰
(assert (= penalty (or violation_internal_control violation_internal_handling)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= capital_level 0))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= penalty false))
(assert (= violation_internal_control false))
(assert (= violation_internal_handling false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 17
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
