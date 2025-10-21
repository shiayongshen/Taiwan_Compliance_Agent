; SMT2 file generated from compliance case automatic
; Case ID: case_313
; Generated at: 2025-10-21T07:02:49.160647
;
; This file can be executed with Z3:
;   z3 case_313.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const aml_internal_control_compliance Bool)
(declare-const aml_penalty_after_improvement Bool)
(declare-const aml_penalty_due_to_obstruction Bool)
(declare-const aml_penalty_due_to_violation Bool)
(declare-const aml_violation Bool)
(declare-const audit_procedures_established Bool)
(declare-const bank_internal_control_established Bool)
(declare-const bank_internal_control_executed Bool)
(declare-const bank_internal_control_ok Bool)
(declare-const bank_internal_handling_established Bool)
(declare-const bank_internal_handling_executed Bool)
(declare-const bank_internal_handling_ok Bool)
(declare-const bank_internal_operation_established Bool)
(declare-const bank_internal_operation_executed Bool)
(declare-const bank_internal_operation_ok Bool)
(declare-const control_procedures_established Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const improvement_completed Bool)
(declare-const improvement_ordered Bool)
(declare-const inspection_obstruction Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_implemented Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_implemented Bool)
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

; [bank:internal_control_established] 銀行建立內部控制及稽核制度
(assert (= bank_internal_control_established internal_control_established))

; [bank:internal_handling_established] 銀行建立內部處理制度及程序
(assert (= bank_internal_handling_established internal_handling_established))

; [bank:internal_operation_established] 銀行建立內部作業制度及程序
(assert (= bank_internal_operation_established internal_operation_established))

; [bank:internal_control_executed] 銀行內部控制及稽核制度確實執行
(assert (= bank_internal_control_executed internal_control_implemented))

; [bank:internal_handling_executed] 銀行內部處理制度及程序確實執行
(assert (= bank_internal_handling_executed internal_handling_implemented))

; [bank:internal_operation_executed] 銀行內部作業制度及程序確實執行
(assert (= bank_internal_operation_executed internal_operation_implemented))

; [bank:internal_control_ok] 銀行建立內部控制及稽核制度且確實執行
(assert (= bank_internal_control_ok
   (and bank_internal_control_established bank_internal_control_executed)))

; [bank:internal_handling_ok] 銀行建立內部處理制度及程序且確實執行
(assert (= bank_internal_handling_ok
   (and bank_internal_handling_established bank_internal_handling_executed)))

; [bank:internal_operation_ok] 銀行建立內部作業制度及程序且確實執行
(assert (= bank_internal_operation_ok
   (and bank_internal_operation_established bank_internal_operation_executed)))

; [aml:internal_control_compliance] 洗錢防制內部控制制度建立且執行合規
(assert (= aml_internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [aml:improvement_ordered] 主管機關限期令改善
(assert true)

; [aml:improvement_completed] 限期改善已完成
(assert true)

; [aml:penalty_condition_violation] 違反未建立制度或未依規定執行
(assert (= aml_violation
   (or (not aml_internal_control_compliance) (not internal_control_established))))

; [aml:penalty_after_improvement] 屆期未改善
(assert (= aml_penalty_after_improvement
   (and improvement_ordered (not improvement_completed))))

; [aml:penalty_due_to_violation] 違反規定且未改善處罰
(assert (= aml_penalty_due_to_violation
   (and aml_violation aml_penalty_after_improvement)))

; [aml:penalty_due_to_obstruction] 規避、拒絕或妨礙查核
(assert (= aml_penalty_due_to_obstruction inspection_obstruction))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反洗錢防制法第7條規定未建立或未執行制度且未改善，或規避查核時處罰
(assert (= penalty (or aml_penalty_due_to_violation aml_penalty_due_to_obstruction)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_required_matters_established false))
(assert (= internal_control_established false))
(assert (= internal_control_implemented false))
(assert (= internal_control_executed false))
(assert (= bank_internal_control_established false))
(assert (= bank_internal_control_executed false))
(assert (= bank_internal_handling_established false))
(assert (= internal_handling_established false))
(assert (= bank_internal_handling_executed false))
(assert (= internal_handling_implemented false))
(assert (= bank_internal_operation_established false))
(assert (= internal_operation_established false))
(assert (= bank_internal_operation_executed false))
(assert (= internal_operation_implemented false))
(assert (= aml_violation true))
(assert (= improvement_ordered true))
(assert (= improvement_completed false))
(assert (= inspection_obstruction false))
(assert (= aml_penalty_after_improvement true))
(assert (= aml_penalty_due_to_violation true))
(assert (= aml_penalty_due_to_obstruction false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 31
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
