; SMT2 file generated from compliance case automatic
; Case ID: case_196
; Generated at: 2025-10-19T10:11:57.456976
;
; This file can be executed with Z3:
;   z3 case_196.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const aml_compliance_ok Bool)
(declare-const audit_procedures_established Bool)
(declare-const bank_compliance_ok Bool)
(declare-const bank_internal_control_established Bool)
(declare-const bank_internal_control_executed Bool)
(declare-const bank_internal_handling_established Bool)
(declare-const bank_internal_handling_executed Bool)
(declare-const bank_internal_operation_established Bool)
(declare-const bank_internal_operation_executed Bool)
(declare-const control_procedures_established Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_handling_implemented Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_operation_implemented Bool)
(declare-const internal_operation_system_established Bool)
(declare-const other_designated_matters_complied Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held_regularly Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures_established
        training_held_regularly
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_complied)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_implemented))

; [bank:internal_control_established] 銀行建立內部控制及稽核制度
(assert (= bank_internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 銀行建立內部處理制度及程序
(assert (= bank_internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 銀行建立內部作業制度及程序
(assert (= bank_internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 銀行內部控制制度確實執行
(assert (= bank_internal_control_executed internal_control_implemented))

; [bank:internal_handling_executed] 銀行內部處理制度確實執行
(assert (= bank_internal_handling_executed internal_handling_implemented))

; [bank:internal_operation_executed] 銀行內部作業制度確實執行
(assert (= bank_internal_operation_executed internal_operation_implemented))

; [aml:compliance_ok] 洗錢防制內部控制制度建立且確實執行
(assert (= aml_compliance_ok
   (and internal_control_established internal_control_executed)))

; [bank:compliance_ok] 銀行內部控制、處理及作業制度建立且確實執行
(assert (= bank_compliance_ok
   (and bank_internal_control_established
        bank_internal_control_executed
        bank_internal_handling_established
        bank_internal_handling_executed
        bank_internal_operation_established
        bank_internal_operation_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行洗錢防制內部控制制度，或銀行未建立或未確實執行內部控制、處理及作業制度時處罰
(assert (= penalty (or (not aml_compliance_ok) (not bank_compliance_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held_regularly false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_complied false))
(assert (= internal_control_implemented false))
(assert (= internal_control_system_established false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_implemented false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_implemented false))
(assert (= penalty true))
(assert (= aml_compliance_ok false))
(assert (= bank_compliance_ok false))
(assert (= bank_internal_control_established false))
(assert (= bank_internal_control_executed false))
(assert (= bank_internal_handling_established false))
(assert (= bank_internal_handling_executed false))
(assert (= bank_internal_operation_established false))
(assert (= bank_internal_operation_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 23
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
