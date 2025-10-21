; SMT2 file generated from compliance case automatic
; Case ID: case_174
; Generated at: 2025-10-21T03:56:14.011345
;
; This file can be executed with Z3:
;   z3 case_174.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const compliance_ok Bool)
(declare-const control_procedures_established Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const inspection_cooperation Bool)
(declare-const inspection_evaded Bool)
(declare-const inspection_obstructed Bool)
(declare-const inspection_refused Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const other_required_matters_established Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures_established
        training_held
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_required_matters_established)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_implemented))

; [aml:compliance_ok] 已建立且確實執行洗錢防制內部控制與稽核制度
(assert (= compliance_ok (and internal_control_established internal_control_executed)))

; [aml:inspection_cooperation] 未規避、拒絕或妨礙查核
(assert (not (= (or inspection_evaded inspection_obstructed inspection_refused)
        inspection_cooperation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行洗錢防制內部控制制度，或規避拒絕妨礙查核時處罰
(assert (= penalty (or (not compliance_ok) (not inspection_cooperation))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held true))
(assert (= dedicated_personnel_assigned true))
(assert (= risk_assessment_report_updated true))
(assert (= audit_procedures_established true))
(assert (= other_required_matters_established true))
(assert (= internal_control_implemented true))
(assert (= inspection_evaded false))
(assert (= inspection_refused false))
(assert (= inspection_obstructed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 15
; Total facts: 10
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
