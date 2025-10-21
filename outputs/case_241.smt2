; SMT2 file generated from compliance case automatic
; Case ID: case_241
; Generated at: 2025-10-21T05:20:53.073605
;
; This file can be executed with Z3:
;   z3 case_241.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const fhc_internal_control_established Bool)
(declare-const fhc_internal_control_executed Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:internal_control_established] 金融控股公司已建立內部控制及稽核制度
(assert (= internal_control_established fhc_internal_control_established))

; [fhc:internal_control_executed] 金融控股公司已確實執行內部控制及稽核制度
(assert (= internal_control_executed fhc_internal_control_executed))

; [fhc:internal_control_compliance] 金融控股公司建立且確實執行內部控制及稽核制度
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [fhc:penalty_default_false] 預設不處罰
(assert (not penalty))

; [fhc:penalty_conditions] 處罰條件：未建立或未確實執行內部控制及稽核制度時處罰
(assert (not (= internal_control_compliance penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fhc_internal_control_established false))
(assert (= fhc_internal_control_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 5
; Total variables: 6
; Total facts: 6
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
