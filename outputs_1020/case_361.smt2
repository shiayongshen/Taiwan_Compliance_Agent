; SMT2 file generated from compliance case automatic
; Case ID: case_361
; Generated at: 2025-10-19T14:02:57.506213
;
; This file can be executed with Z3:
;   z3 case_361.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const derivative_business_management_qualified Bool)
(declare-const derivative_business_staff_qualified Bool)
(declare-const derivative_experience_months Int)
(declare-const derivative_internship_years Int)
(declare-const derivative_license_held Bool)
(declare-const derivative_training_months Int)
(declare-const foreign_exchange_derivative_filing_done Bool)
(declare-const foreign_exchange_derivative_permit_obtained Bool)
(declare-const foreign_exchange_derivative_permit_required Bool)
(declare-const foreign_exchange_derivative_type Int)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_compliance Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const penalty Bool)
(declare-const structured_product_sales_passed Bool)

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

; [bank:internal_control_compliance] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_compliance] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_compliance] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_compliance
   (and internal_operation_established internal_operation_executed)))

; [bank:derivative_business_staff_qualified] 衍生性金融商品業務人員具備專業資格
(assert (= derivative_business_staff_qualified
   (or structured_product_sales_passed
       (<= 6 derivative_experience_months)
       (<= 3 derivative_training_months)
       derivative_license_held
       (<= 1 derivative_internship_years))))

; [bank:derivative_business_management_qualified] 衍生性金融商品業務經辦及管理人員具備資格
(assert (= derivative_business_management_qualified
   (or structured_product_sales_passed
       (<= 6 derivative_experience_months)
       (<= 3 derivative_training_months)
       derivative_license_held
       (<= 1 derivative_internship_years))))

; [bank:foreign_exchange_derivative_permit_required] 外匯衍生性商品業務申請許可或函報備查
(assert (= foreign_exchange_derivative_permit_required
   (or (and (= 1 foreign_exchange_derivative_type)
            (not foreign_exchange_derivative_permit_obtained))
       (and (= 2 foreign_exchange_derivative_type)
            (not foreign_exchange_derivative_filing_done))
       (and (= 3 foreign_exchange_derivative_type)
            (not foreign_exchange_derivative_filing_done)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度或未具備衍生性金融商品業務人員資格，或未依規定申請外匯衍生性商品業務許可時處罰
(assert (= penalty
   (or foreign_exchange_derivative_permit_required
       (not internal_operation_compliance)
       (not derivative_business_management_qualified)
       (not derivative_business_staff_qualified)
       (not internal_control_compliance)
       (not internal_handling_compliance))))

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
(assert (= derivative_license_held false))
(assert (= derivative_internship_years 0))
(assert (= derivative_experience_months 0))
(assert (= structured_product_sales_passed false))
(assert (= foreign_exchange_derivative_type 1))
(assert (= foreign_exchange_derivative_permit_obtained false))
(assert (= foreign_exchange_derivative_filing_done false))
(assert (= derivative_business_management_qualified false))
(assert (= derivative_business_staff_qualified false))
(assert (= foreign_exchange_derivative_permit_required false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_compliance false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_compliance false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 27
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
