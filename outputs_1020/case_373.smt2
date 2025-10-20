; SMT2 file generated from compliance case automatic
; Case ID: case_373
; Generated at: 2025-10-19T14:20:19.737225
;
; This file can be executed with Z3:
;   z3 case_373.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const conceal_or_destroy_documents Bool)
(declare-const derivative_business_internal_system_established Bool)
(declare-const derivative_business_operation_established Bool)
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
(declare-const internal_systems_compliance Bool)
(declare-const late_or_false_report Bool)
(declare-const penalty Bool)
(declare-const refuse_inspection Bool)
(declare-const refuse_open_vault Bool)
(declare-const unjustified_nonresponse_or_false_reply Bool)
(declare-const violation_internal_systems Bool)

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

; [bank:derivative_business_operation_established] 衍生性金融商品業務內部作業制度及程序已訂定
(assert (= derivative_business_operation_established
   derivative_business_internal_system_established))

; [bank:internal_systems_compliance] 內部控制、內部處理及內部作業制度均已建立且確實執行
(assert (= internal_systems_compliance
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed
        internal_operation_established
        internal_operation_executed)))

; [bank:violation_internal_systems] 未依規定建立或確實執行內部控制、內部處理或內部作業制度
(assert (not (= internal_systems_compliance violation_internal_systems)))

; [bank:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理或內部作業制度時處罰
(assert (= penalty
   (or conceal_or_destroy_documents
       unjustified_nonresponse_or_false_reply
       violation_internal_systems
       refuse_open_vault
       late_or_false_report
       refuse_inspection)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= derivative_business_internal_system_established false))
(assert (= conceal_or_destroy_documents false))
(assert (= late_or_false_report true))
(assert (= refuse_inspection false))
(assert (= refuse_open_vault false))
(assert (= unjustified_nonresponse_or_false_reply false))
(assert (= violation_internal_systems true))
(assert (= penalty true))
(assert (= derivative_business_operation_established false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_systems_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 22
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
