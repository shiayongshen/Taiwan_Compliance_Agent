; SMT2 file generated from compliance case automatic
; Case ID: case_174
; Generated at: 2025-10-19T09:51:18.983621
;
; This file can be executed with Z3:
;   z3 case_174.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures Bool)
(declare-const compliance_rule Bool)
(declare-const control_procedures Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const inspection_cooperation Bool)
(declare-const inspection_obstruction Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implementation Bool)
(declare-const other_designated_matters Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 已建立洗錢防制內部控制與稽核制度，包含六項必要內容
(assert (= internal_control_established
   (and control_procedures
        training_held
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures
        other_designated_matters)))

; [aml:internal_control_executed] 已確實執行洗錢防制內部控制與稽核制度
(assert (= internal_control_executed internal_control_implementation))

; [aml:compliance_rule] 符合洗錢防制法第7條規定
(assert (= compliance_rule (and internal_control_established internal_control_executed)))

; [aml:inspection_cooperation] 未規避、拒絕或妨礙現地或非現地查核
(assert (not (= inspection_obstruction inspection_cooperation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立制度或未確實執行，或規避拒絕妨礙查核時處罰
(assert (= penalty
   (or inspection_obstruction
       (not internal_control_executed)
       (not internal_control_established))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures false))
(assert (= training_held false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures false))
(assert (= other_designated_matters false))
(assert (= internal_control_implementation false))
(assert (= inspection_obstruction false))
(assert (= compliance_rule false))
(assert (= inspection_cooperation false))
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
; Total constraints: 6
; Total variables: 13
; Total facts: 13
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
