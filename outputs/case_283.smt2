; SMT2 file generated from compliance case automatic
; Case ID: case_283
; Generated at: 2025-10-21T06:20:41.365642
;
; This file can be executed with Z3:
;   z3 case_283.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const board_approval_ratio Real)
(declare-const board_meeting_attendance_ratio Real)
(declare-const central_authority_threshold Real)
(declare-const collateral_condition_advantage Bool)
(declare-const consumer_loan_limit Real)
(declare-const full_collateral_provided Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const major_shareholder_definition Bool)
(declare-const no_unsecured_credit_over_3_percent Bool)
(declare-const paid_in_capital Real)
(declare-const secured_credit_over_5_percent_requirements Bool)
(declare-const secured_credit_to_related_parties Real)
(declare-const unsecured_consumer_loan Real)
(declare-const unsecured_credit_to_related_parties Real)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:no_unsecured_credit_over_3_percent] 銀行不得對持有實收資本總額超過3%之企業或相關利害關係人提供無擔保授信，消費者貸款及政府貸款除外
(assert (= no_unsecured_credit_over_3_percent
   (and (>= (/ 3.0 100.0)
            (/ unsecured_credit_to_related_parties paid_in_capital))
        (<= unsecured_consumer_loan consumer_loan_limit))))

; [bank:major_shareholder_definition] 主要股東定義：持有銀行已發行股份總數1%以上，且自然人主要股東之配偶與未成年子女持股計入本人
(assert major_shareholder_definition)

; [bank:secured_credit_over_5_percent_requirements] 銀行對持有實收資本總額超過5%之企業或相關利害關係人提供擔保授信，須有十足擔保且條件不得優於同類授信，且達一定金額須董事會通過
(assert (let ((a!1 (and (<= (/ 1.0 20.0)
                    (/ secured_credit_to_related_parties paid_in_capital))
                full_collateral_provided
                (not collateral_condition_advantage)
                (or (not (>= secured_credit_to_related_parties
                             central_authority_threshold))
                    (and (<= (/ 6667.0 10000.0) board_meeting_attendance_ratio)
                         (<= (/ 3.0 4.0) board_approval_ratio))))))
  (= secured_credit_over_5_percent_requirements a!1)))

; [bank:internal_control_established] 銀行已建立內部控制及稽核制度
(assert internal_control_established)

; [bank:internal_handling_established] 銀行已建立內部處理制度及程序
(assert internal_handling_established)

; [bank:internal_operation_established] 銀行已建立內部作業制度及程序
(assert internal_operation_established)

; [bank:internal_control_executed] 銀行內部控制及稽核制度確實執行
(assert internal_control_executed)

; [bank:internal_handling_executed] 銀行內部處理制度及程序確實執行
(assert internal_handling_executed)

; [bank:internal_operation_executed] 銀行內部作業制度及程序確實執行
(assert internal_operation_executed)

; [bank:internal_control_ok] 銀行內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 銀行內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 銀行內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反無擔保授信限制、擔保授信條件或未建立及執行內部控制制度時處罰
(assert (= penalty
   (or (not internal_handling_ok)
       (not secured_credit_over_5_percent_requirements)
       (not internal_operation_ok)
       (not no_unsecured_credit_over_3_percent)
       (not internal_control_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= paid_in_capital 1000000000))
(assert (= unsecured_credit_to_related_parties 40000000))
(assert (= unsecured_consumer_loan 5000000))
(assert (= consumer_loan_limit 10000000))
(assert (= secured_credit_to_related_parties 60000000))
(assert (= full_collateral_provided false))
(assert (= collateral_condition_advantage true))
(assert (= board_meeting_attendance_ratio (/ 3.0 5.0)))
(assert (= board_approval_ratio (/ 7.0 10.0)))
(assert (= central_authority_threshold 50000000))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= major_shareholder_definition true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 23
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
