; SMT2 file generated from compliance case automatic
; Case ID: case_469
; Generated at: 2025-10-21T10:27:03.389867
;
; This file can be executed with Z3:
;   z3 case_469.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const exception_approved_cultural_public_use Bool)
(declare-const exception_main_part_self_use Bool)
(declare-const exception_rebuild_self_use Bool)
(declare-const exception_short_term_prepurchase Bool)
(declare-const investment_business_warehouse_amount Real)
(declare-const investment_non_self_use_real_estate_amount Real)
(declare-const investment_non_self_use_real_estate_limit Real)
(declare-const investment_non_self_use_real_estate_prohibited Bool)
(declare-const investment_self_use_real_estate_amount Real)
(declare-const investment_self_use_real_estate_limit Real)
(declare-const net_worth Real)
(declare-const net_worth_at_investment_time Real)
(declare-const penalty Bool)
(declare-const real_estate_transaction_related_party_approval Bool)
(declare-const real_estate_transaction_with_related_party Bool)
(declare-const total_deposit_balance Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:investment_self_use_real_estate_limit] 自用不動產投資限額不得超過投資時淨值，營業用倉庫投資不得超過存款總餘額5%
(assert (let ((a!1 (ite (and (<= investment_self_use_real_estate_amount
                         net_worth_at_investment_time)
                     (<= investment_business_warehouse_amount
                         (* (/ 1.0 20.0) total_deposit_balance)))
                1.0
                0.0)))
  (= investment_self_use_real_estate_limit a!1)))

; [bank:investment_non_self_use_real_estate_prohibited] 禁止投資非自用不動產，除特定例外情形
(assert (= investment_non_self_use_real_estate_prohibited
   (or exception_approved_cultural_public_use
       exception_short_term_prepurchase
       exception_rebuild_self_use
       (= 0.0 investment_non_self_use_real_estate_amount)
       exception_main_part_self_use)))

; [bank:investment_non_self_use_real_estate_limit] 非自用不動產投資總額不得超過銀行淨值20%，且與自用不動產投資合計不得超過投資時淨值
(assert (let ((a!1 (ite (and (<= investment_non_self_use_real_estate_amount
                         (* (/ 1.0 5.0) net_worth))
                     (<= (+ investment_non_self_use_real_estate_amount
                            investment_self_use_real_estate_amount)
                         net_worth_at_investment_time))
                1.0
                0.0)))
  (= investment_non_self_use_real_estate_limit a!1)))

; [bank:real_estate_transaction_related_party_approval] 與持股3%以上企業、負責人、職員、主要股東或利害關係人交易須董事會三分之二出席且四分之三同意
(assert (= real_estate_transaction_related_party_approval
   (or (not real_estate_transaction_with_related_party)
       (and (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
            (<= (/ 3.0 4.0) board_approval_ratio)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行法第75條投資限制或董事會審議規定時處罰
(assert (let ((a!1 (or (and (not investment_non_self_use_real_estate_prohibited)
                    (not (= investment_non_self_use_real_estate_limit 1.0)))
               (not real_estate_transaction_related_party_approval)
               (not (= investment_self_use_real_estate_limit 1.0)))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= investment_non_self_use_real_estate_amount 1833000000))
(assert (= net_worth 8600000000))
(assert (= net_worth_at_investment_time 8600000000))
(assert (= investment_self_use_real_estate_amount 0))
(assert (= investment_business_warehouse_amount 0))
(assert (= total_deposit_balance 100000000000))
(assert (= real_estate_transaction_with_related_party false))
(assert (= board_attendance_ratio 0))
(assert (= board_approval_ratio 0))
(assert (= exception_main_part_self_use false))
(assert (= exception_short_term_prepurchase false))
(assert (= exception_rebuild_self_use false))
(assert (= exception_approved_cultural_public_use false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 18
; Total facts: 13
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
