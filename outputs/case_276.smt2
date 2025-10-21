; SMT2 file generated from compliance case automatic
; Case ID: case_276
; Generated at: 2025-10-21T06:10:07.818295
;
; This file can be executed with Z3:
;   z3 case_276.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const derivative_internal_operation_compliant Bool)
(declare-const derivative_internal_operation_meets_regulations Bool)
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
(declare-const investment_compliant Bool)
(declare-const investment_meets_regulations Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

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

; [bank:investment_compliant] 投資有價證券符合主管機關規定
(assert (= investment_compliant investment_meets_regulations))

; [bank:derivative_internal_operation_compliant] 衍生性金融商品業務內部作業制度及程序符合規定
(assert (= derivative_internal_operation_compliant
   derivative_internal_operation_meets_regulations))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度或違反投資及衍生性金融商品業務規定時處罰
(assert (= penalty
   (or (not investment_compliant)
       (not internal_control_ok)
       (not derivative_internal_operation_compliant)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= derivative_internal_operation_meets_regulations false))
(assert (= derivative_internal_operation_compliant false))
(assert (= internal_control_system_established false))
(assert (= internal_control_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_executed false))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_established true))
(assert (= internal_handling_system_executed true))
(assert (= internal_handling_executed true))
(assert (= internal_operation_system_established true))
(assert (= internal_operation_established true))
(assert (= internal_operation_system_executed true))
(assert (= internal_operation_executed true))
(assert (= investment_meets_regulations false))
(assert (= investment_compliant false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 20
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
