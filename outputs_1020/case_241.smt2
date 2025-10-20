; SMT2 file generated from compliance case automatic
; Case ID: case_241
; Generated at: 2025-10-19T11:09:26.705404
;
; This file can be executed with Z3:
;   z3 case_241.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:internal_control_established] 金融控股公司已建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [fhc:internal_control_executed] 金融控股公司已確實執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行內部控制及稽核制度時處罰
(assert (= penalty
   (or (not internal_control_established) (not internal_control_executed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 4
; Total variables: 5
; Total facts: 5
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
