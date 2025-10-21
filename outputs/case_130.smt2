; SMT2 file generated from compliance case automatic
; Case ID: case_130
; Generated at: 2025-10-21T02:32:51.820014
;
; This file can be executed with Z3:
;   z3 case_130.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_system_compliance Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const internal_control_audit_solicitation_compliance Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const penalty Bool)
(declare-const solicitation_handling_compliance Bool)
(declare-const solicitation_handling_established Bool)
(declare-const solicitation_handling_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_compliance] 建立且確實執行內部控制制度
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:audit_system_compliance] 建立且確實執行稽核制度
(assert (= audit_system_compliance (and audit_system_established audit_system_executed)))

; [insurance:solicitation_handling_compliance] 建立且確實執行招攬處理制度及程序
(assert (= solicitation_handling_compliance
   (and solicitation_handling_established solicitation_handling_executed)))

; [insurance:internal_control_audit_solicitation_compliance] 內部控制、稽核及招攬處理制度均建立且確實執行
(assert (= internal_control_audit_solicitation_compliance
   (and internal_control_compliance
        audit_system_compliance
        solicitation_handling_compliance)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行內部控制、稽核或招攬處理制度時處罰
(assert (not (= internal_control_audit_solicitation_compliance penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= audit_system_established true))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_established true))
(assert (= solicitation_handling_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 11
; Total facts: 6
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
