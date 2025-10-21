; SMT2 file generated from compliance case automatic
; Case ID: case_272
; Generated at: 2025-10-21T06:03:42.496795
;
; This file can be executed with Z3:
;   z3 case_272.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authority_approval Bool)
(declare-const derivative_operation_system_established Bool)
(declare-const derivative_operation_system_executed Bool)
(declare-const dissolution_application_submitted Bool)
(declare-const dissolution_approved Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_derivative_operation_compliance Bool)
(declare-const internal_derivative_operation_established Bool)
(declare-const internal_derivative_operation_executed Bool)
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
(declare-const internal_systems_compliance Bool)
(declare-const license_revoked Bool)
(declare-const license_revoked_flag Bool)
(declare-const penalty Bool)
(declare-const shareholders_meeting_resolution Bool)

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

; [bank:internal_derivative_operation_established] 建立衍生性金融商品業務內部作業制度及程序
(assert (= internal_derivative_operation_established
   derivative_operation_system_established))

; [bank:internal_derivative_operation_executed] 衍生性金融商品業務內部作業制度及程序確實執行
(assert (= internal_derivative_operation_executed derivative_operation_system_executed))

; [bank:dissolution_approved] 股東會決議解散並經主管機關核准
(assert (= dissolution_approved
   (and shareholders_meeting_resolution
        dissolution_application_submitted
        authority_approval)))

; [bank:license_revoked] 主管機關核准解散後撤銷許可
(assert (= license_revoked (and dissolution_approved license_revoked_flag)))

; [bank:internal_control_compliance] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_compliance] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_compliance] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_compliance
   (and internal_operation_established internal_operation_executed)))

; [bank:internal_derivative_operation_compliance] 衍生性金融商品業務內部作業制度及程序建立且確實執行
(assert (= internal_derivative_operation_compliance
   (and internal_derivative_operation_established
        internal_derivative_operation_executed)))

; [bank:internal_systems_compliance] 銀行內部控制、處理及作業制度均建立且確實執行
(assert (= internal_systems_compliance
   (and internal_control_compliance
        internal_handling_compliance
        internal_operation_compliance
        internal_derivative_operation_compliance)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、處理、作業制度時處罰
(assert (= penalty
   (or (not internal_derivative_operation_compliance)
       (not internal_control_compliance)
       (not internal_operation_compliance)
       (not internal_handling_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established true))
(assert (= internal_operation_system_executed true))
(assert (= derivative_operation_system_established true))
(assert (= derivative_operation_system_executed true))
(assert (= shareholders_meeting_resolution false))
(assert (= dissolution_application_submitted false))
(assert (= authority_approval false))
(assert (= license_revoked_flag false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 28
; Total facts: 13
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
