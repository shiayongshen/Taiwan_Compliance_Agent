; SMT2 file generated from compliance case automatic
; Case ID: case_412
; Generated at: 2025-10-19T15:13:45.378224
;
; This file can be executed with Z3:
;   z3 case_412.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const internal_control_compliance Real)
(declare-const internal_control_established Real)
(declare-const internal_control_executed Real)
(declare-const internal_control_system_established Real)
(declare-const internal_control_system_executed Real)
(declare-const internal_handling_compliance Real)
(declare-const internal_handling_established Real)
(declare-const internal_handling_executed Real)
(declare-const internal_handling_system_established Real)
(declare-const internal_handling_system_executed Real)
(declare-const internal_systems_compliance Real)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established
   (ite (= internal_control_system_established 1.0) 1.0 0.0)))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established
   (ite (= internal_handling_system_established 1.0) 1.0 0.0)))

; [insurance:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed
   (ite (= internal_control_system_executed 1.0) 1.0 0.0)))

; [insurance:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed
   (ite (= internal_handling_system_executed 1.0) 1.0 0.0)))

; [insurance:internal_control_compliance] 內部控制及稽核制度建立且執行
(assert (= internal_control_compliance
   (ite (and (= internal_control_established 1.0)
             (= internal_control_executed 1.0))
        1.0
        0.0)))

; [insurance:internal_handling_compliance] 內部處理制度及程序建立且執行
(assert (= internal_handling_compliance
   (ite (and (= internal_handling_established 1.0)
             (= internal_handling_executed 1.0))
        1.0
        0.0)))

; [insurance:internal_systems_compliance] 內部控制及稽核制度與內部處理制度均合規
(assert (= internal_systems_compliance
   (ite (and (= internal_control_compliance 1.0)
             (= internal_handling_compliance 1.0))
        1.0
        0.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行內部控制及稽核制度或內部處理制度時處罰
(assert (= penalty
   (or (not (= internal_control_compliance 1.0))
       (not (= internal_handling_compliance 1.0)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established 0.0))
(assert (= internal_control_system_executed 0.0))
(assert (= internal_handling_system_established 0.0))
(assert (= internal_handling_system_executed 0.0))
(assert (= internal_control_established 0.0))
(assert (= internal_control_executed 0.0))
(assert (= internal_handling_established 0.0))
(assert (= internal_handling_executed 0.0))
(assert (= internal_control_compliance 0.0))
(assert (= internal_handling_compliance 0.0))
(assert (= internal_systems_compliance 0.0))
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
; Total variables: 12
; Total facts: 12
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
