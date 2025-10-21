; SMT2 file generated from compliance case automatic
; Case ID: case_219
; Generated at: 2025-10-21T04:52:03.860713
;
; This file can be executed with Z3:
;   z3 case_219.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const derivative_business_operation_established Bool)
(declare-const derivative_business_operation_executed Bool)
(declare-const derivative_business_operation_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert true)

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert true)

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert true)

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert true)

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert true)

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert true)

; [bank:derivative_business_operation_established] 建立衍生性金融商品業務內部作業制度及程序
(assert true)

; [bank:derivative_business_operation_executed] 衍生性金融商品業務內部作業制度及程序確實執行
(assert true)

; [bank:internal_control_ok] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:derivative_business_operation_ok] 衍生性金融商品業務內部作業制度及程序建立且確實執行
(assert (= derivative_business_operation_ok
   (and derivative_business_operation_established
        derivative_business_operation_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度及程序時處罰
(assert (= penalty
   (or (not derivative_business_operation_ok)
       (not internal_operation_ok)
       (not internal_handling_ok)
       (not internal_control_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= derivative_business_operation_established true))
(assert (= derivative_business_operation_executed true))
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
; Total variables: 13
; Total facts: 9
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
