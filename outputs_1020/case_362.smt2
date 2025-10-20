; SMT2 file generated from compliance case automatic
; Case ID: case_362
; Generated at: 2025-10-19T14:03:54.228615
;
; This file can be executed with Z3:
;   z3 case_362.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const derivative_business_qualified Bool)
(declare-const derivative_experience_months Int)
(declare-const derivative_internship_years Int)
(declare-const derivative_license_held Bool)
(declare-const derivative_training_months Int)
(declare-const foreign_exchange_filing_completed Bool)
(declare-const foreign_exchange_permit Bool)
(declare-const foreign_exchange_permit_granted Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const penalty Bool)
(declare-const structured_product_qualification_passed Bool)

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

; [bank:derivative_business_qualified] 衍生性金融商品業務人員具備專業資格
(assert (= derivative_business_qualified
   (or (<= 1 derivative_internship_years)
       derivative_license_held
       (<= 3 derivative_training_months)
       (<= 6 derivative_experience_months)
       structured_product_qualification_passed)))

; [bank:foreign_exchange_permit] 外匯業務經本行許可或完成備查
(assert (= foreign_exchange_permit
   (or foreign_exchange_permit_granted foreign_exchange_filing_completed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度或未具備衍生性金融商品業務人員資格，或未取得外匯業務許可時處罰
(assert (= penalty
   (or (not (and internal_control_established internal_control_executed))
       (not derivative_business_qualified)
       (not (and internal_handling_established internal_handling_executed))
       (not (and internal_operation_established internal_operation_executed))
       (not foreign_exchange_permit))))

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
(assert (= structured_product_qualification_passed false))
(assert (= foreign_exchange_permit_granted false))
(assert (= foreign_exchange_filing_completed false))
(assert (= derivative_business_qualified false))
(assert (= foreign_exchange_permit false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
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
; Total constraints: 10
; Total variables: 22
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
