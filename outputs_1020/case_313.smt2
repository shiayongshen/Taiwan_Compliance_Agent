; SMT2 file generated from compliance case automatic
; Case ID: case_313
; Generated at: 2025-10-19T12:50:31.056486
;
; This file can be executed with Z3:
;   z3 case_313.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const control_procedures_established Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const inspection_cooperation Bool)
(declare-const inspection_not_obstructed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_execution_confirmed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_execution_confirmed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_execution_confirmed Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_systems_compliant Bool)
(declare-const other_required_matters_established Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held Bool)
(declare-const violation_confirmed Bool)
(declare-const violation_of_law Bool)

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
(assert (= internal_control_executed internal_control_execution_confirmed))

; [bank:internal_control_established] 銀行建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 銀行建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 銀行建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 銀行內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_execution_confirmed))

; [bank:internal_handling_executed] 銀行內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_execution_confirmed))

; [bank:internal_operation_executed] 銀行內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_execution_confirmed))

; [aml:inspection_cooperation] 金融機構及指定非金融事業配合查核
(assert (= inspection_cooperation inspection_not_obstructed))

; [bank:violation_of_law] 銀行違反法令、章程或有礙健全經營
(assert (= violation_of_law violation_confirmed))

; [bank:penalty_conditions_129_7] 銀行未依規定建立內部控制、內部處理、內部作業制度或未確實執行
(assert (= internal_systems_compliant
   (and internal_control_established
        internal_handling_established
        internal_operation_established
        internal_control_executed
        internal_handling_executed
        internal_operation_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反洗錢防制法第7條或銀行法第129條第7款規定時處罰
(assert (= penalty
   (or (not internal_control_executed)
       (not inspection_cooperation)
       (not internal_systems_compliant)
       (not internal_control_established))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_required_matters_established false))
(assert (= inspection_not_obstructed true))
(assert (= internal_control_execution_confirmed false))
(assert (= internal_control_system_established false))
(assert (= internal_handling_system_established false))
(assert (= internal_operation_system_established false))
(assert (= internal_handling_execution_confirmed false))
(assert (= internal_operation_execution_confirmed false))
(assert (= violation_confirmed true))
(assert (= inspection_cooperation false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_systems_compliant false))
(assert (= penalty false))
(assert (= violation_of_law false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 24
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
