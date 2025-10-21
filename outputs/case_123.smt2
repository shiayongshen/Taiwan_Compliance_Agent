; SMT2 file generated from compliance case automatic
; Case ID: case_123
; Generated at: 2025-10-21T02:19:57.126307
;
; This file can be executed with Z3:
;   z3 case_123.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const aml_anti_money_laundering_procedures Bool)
(declare-const aml_audit_procedures_implemented Bool)
(declare-const aml_dedicated_personnel_assigned Bool)
(declare-const aml_internal_control_compliant Bool)
(declare-const aml_internal_control_content_ok Bool)
(declare-const aml_internal_control_established Bool)
(declare-const aml_internal_control_executed Bool)
(declare-const aml_internal_control_system_established Bool)
(declare-const aml_internal_control_system_executed Bool)
(declare-const aml_other_required_matters_complied Bool)
(declare-const aml_regular_training_held Bool)
(declare-const aml_risk_assessment_report_updated Bool)
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
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_control_ok] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [aml:aml_internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= aml_internal_control_established aml_internal_control_system_established))

; [aml:aml_internal_control_content_ok] 洗錢防制內部控制制度內容符合規定
(assert (= aml_internal_control_content_ok
   (and aml_anti_money_laundering_procedures
        aml_regular_training_held
        aml_dedicated_personnel_assigned
        aml_risk_assessment_report_updated
        aml_audit_procedures_implemented
        aml_other_required_matters_complied)))

; [aml:aml_internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= aml_internal_control_executed aml_internal_control_system_executed))

; [aml:aml_internal_control_compliant] 洗錢防制內部控制制度建立且內容符合且確實執行
(assert (= aml_internal_control_compliant
   (and aml_internal_control_established
        aml_internal_control_content_ok
        aml_internal_control_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行未建立或未確實執行內部控制、內部處理或內部作業制度時處罰，或金融機構未建立或未確實執行洗錢防制內部控制制度時處罰
(assert (= penalty
   (or (not internal_handling_ok)
       (not aml_internal_control_compliant)
       (not internal_operation_ok)
       (not internal_control_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= aml_internal_control_system_established false))
(assert (= aml_internal_control_system_executed false))
(assert (= aml_anti_money_laundering_procedures false))
(assert (= aml_audit_procedures_implemented false))
(assert (= aml_dedicated_personnel_assigned false))
(assert (= aml_other_required_matters_complied false))
(assert (= aml_regular_training_held false))
(assert (= aml_risk_assessment_report_updated false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 28
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
