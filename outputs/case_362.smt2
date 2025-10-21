; SMT2 file generated from compliance case automatic
; Case ID: case_362
; Generated at: 2025-10-21T08:04:57.231220
;
; This file can be executed with Z3:
;   z3 case_362.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const derivative_experience_months Int)
(declare-const derivative_internship_years Int)
(declare-const derivative_personnel_qualified Int)
(declare-const derivative_training_months Int)
(declare-const foreign_exchange_derivative_filing_completed Bool)
(declare-const foreign_exchange_derivative_permit_applied Bool)
(declare-const foreign_exchange_derivative_permit_required Bool)
(declare-const foreign_exchange_filing_completed Bool)
(declare-const foreign_exchange_permit_obtained Bool)
(declare-const foreign_exchange_permit_required Bool)
(declare-const has_derivative_license Bool)
(declare-const has_structured_product_qualification Bool)
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
(declare-const passed_structured_product_exam Bool)
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

; [bank:derivative_personnel_qualified] 衍生性金融商品業務人員具備專業資格條件
(assert (= derivative_personnel_qualified
   (ite (or passed_structured_product_exam
            (<= 6 derivative_experience_months)
            (<= 1 derivative_internship_years)
            (<= 3 derivative_training_months)
            has_derivative_license
            has_structured_product_qualification)
        1
        0)))

; [bank:foreign_exchange_permit_required] 外匯業務須經本行許可或完成函報備查程序
(assert (= foreign_exchange_permit_required
   (or foreign_exchange_filing_completed foreign_exchange_permit_obtained)))

; [bank:foreign_exchange_derivative_permit_required] 外匯衍生性商品業務須依類別申請許可或函報備查
(assert (= foreign_exchange_derivative_permit_required
   (or foreign_exchange_derivative_permit_applied
       foreign_exchange_derivative_filing_completed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度及程序時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= derivative_training_months 0))
(assert (= has_derivative_license false))
(assert (= derivative_internship_years 0))
(assert (= derivative_experience_months 0))
(assert (= has_structured_product_qualification false))
(assert (= passed_structured_product_exam false))
(assert (= foreign_exchange_permit_obtained false))
(assert (= foreign_exchange_filing_completed false))
(assert (= foreign_exchange_permit_required true))
(assert (= foreign_exchange_derivative_permit_applied false))
(assert (= foreign_exchange_derivative_filing_completed false))
(assert (= foreign_exchange_derivative_permit_required true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 29
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
