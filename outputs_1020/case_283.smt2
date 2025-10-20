; SMT2 file generated from compliance case automatic
; Case ID: case_283
; Generated at: 2025-10-19T12:04:15.125626
;
; This file can be executed with Z3:
;   z3 case_283.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const credit_amount Real)
(declare-const credit_conditions Bool)
(declare-const credit_secured Bool)
(declare-const credit_to_enterprise_pct Real)
(declare-const credit_to_major_shareholder Real)
(declare-const credit_to_officer Real)
(declare-const credit_to_related_person Real)
(declare-const credit_to_responsible_person Real)
(declare-const credit_unsecured Bool)
(declare-const full_collateral_provided Bool)
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
(declare-const loan_type_consumer Bool)
(declare-const loan_type_government Bool)
(declare-const major_shareholder_defined Bool)
(declare-const minor_children_shares Real)
(declare-const other_similar_credit_conditions Bool)
(declare-const penalty Bool)
(declare-const regulator_threshold_amount Real)
(declare-const secured_credit_requirements_met Bool)
(declare-const shareholder_is_natural_person Bool)
(declare-const shareholder_own_shares Real)
(declare-const shareholder_total_including_spouse_children Real)
(declare-const shareholding_pct Real)
(declare-const spouse_shares Real)
(declare-const unsecured_credit_restriction Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:unsecured_credit_restriction] 銀行不得對持有實收資本3%以上之企業或相關利害關係人為無擔保授信，消費者貸款及政府貸款除外
(assert (let ((a!1 (= (and (or (= credit_to_major_shareholder 1.0)
                       (= credit_to_officer 1.0)
                       (= credit_to_related_person 1.0)
                       (= credit_to_responsible_person 1.0)
                       (<= 3.0 credit_to_enterprise_pct))
                   credit_unsecured
                   (not (or loan_type_consumer loan_type_government)))
              unsecured_credit_restriction)))
  (not a!1)))

; [bank:major_shareholder_definition] 主要股東定義：持股銀行已發行股份總數1%以上，且自然人主要股東之配偶與未成年子女持股計入本人
(assert (let ((a!1 (and (<= 1.0 shareholding_pct)
                (or (not shareholder_is_natural_person)
                    (= shareholder_total_including_spouse_children
                       (+ shareholder_own_shares
                          spouse_shares
                          minor_children_shares))))))
  (= major_shareholder_defined a!1)))

; [bank:secured_credit_requirements] 銀行對持有實收資本5%以上之企業或相關利害關係人為擔保授信，應有十足擔保且條件不得優於同類授信
(assert (let ((a!1 (not (and (or (= credit_to_responsible_person 1.0)
                         (= credit_to_officer 1.0)
                         (<= 5.0 credit_to_enterprise_pct)
                         (= credit_to_major_shareholder 1.0)
                         (= credit_to_related_person 1.0))
                     credit_secured)))
      (a!2 (and full_collateral_provided
                (not (and credit_conditions other_similar_credit_conditions))
                (or (not (>= credit_amount regulator_threshold_amount))
                    (and (<= (/ 6667.0 10000.0) board_attendance_ratio)
                         (<= (/ 3.0 4.0) board_approval_ratio))))))
  (= secured_credit_requirements_met (or a!1 a!2))))

; [bank:internal_control_established] 銀行建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 銀行建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 銀行建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 銀行確實執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_executed] 銀行確實執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_executed] 銀行確實執行內部作業制度及程序
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_systems_compliance] 銀行建立並確實執行內部控制、內部處理及內部作業制度
(assert (= internal_systems_compliance
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed
        internal_operation_established
        internal_operation_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反無擔保授信限制或擔保授信條件或未建立或未確實執行內部制度時處罰
(assert (= penalty
   (or (not secured_credit_requirements_met)
       (not internal_systems_compliance)
       (not unsecured_credit_restriction))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= credit_to_enterprise_pct 5.0))
(assert (= credit_to_responsible_person 1.0))
(assert (= credit_to_officer 1.0))
(assert (= credit_to_major_shareholder 1.0))
(assert (= credit_to_related_person 1.0))
(assert (= credit_unsecured true))
(assert (= loan_type_consumer false))
(assert (= loan_type_government false))
(assert (= credit_secured false))
(assert (= full_collateral_provided false))
(assert (= credit_conditions false))
(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 3.0 5.0)))
(assert (= credit_amount 10000000.0))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= shareholding_pct 1.0))
(assert (= shareholder_is_natural_person true))
(assert (= shareholder_own_shares 1.0))
(assert (= spouse_shares 0.0))
(assert (= minor_children_shares 0.0))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_systems_compliance false))
(assert (= major_shareholder_defined false))
(assert (= other_similar_credit_conditions false))
(assert (= penalty false))
(assert (= regulator_threshold_amount 0.0))
(assert (= secured_credit_requirements_met false))
(assert (= shareholder_total_including_spouse_children 0.0))
(assert (= unsecured_credit_restriction false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 39
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
