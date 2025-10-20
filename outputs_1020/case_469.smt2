; SMT2 file generated from compliance case automatic
; Case ID: case_469
; Generated at: 2025-10-19T16:43:17.166144
;
; This file can be executed with Z3:
;   z3 case_469.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_by_authority Bool)
(declare-const approved_cultural_or_public_use Bool)
(declare-const board_approval_ratio Real)
(declare-const board_meeting_attendance_ratio Real)
(declare-const investment_non_self_use_real_estate_allowed Bool)
(declare-const investment_non_self_use_real_estate_limit Real)
(declare-const investment_operating_warehouse_amount Real)
(declare-const investment_self_use_real_estate_amount Real)
(declare-const investment_self_use_real_estate_limit Real)
(declare-const main_part_of_business_location_self_use Bool)
(declare-const net_worth Real)
(declare-const net_worth_at_investment_time Real)
(declare-const penalty Bool)
(declare-const real_estate_transaction_compliance Bool)
(declare-const real_estate_transaction_with_related_party Bool)
(declare-const rebuild_existing_real_estate_self_use Bool)
(declare-const short_term_prepurchase_for_self_use Bool)
(declare-const total_deposits Real)
(declare-const total_non_self_use_real_estate_investment Real)
(declare-const total_self_use_real_estate_investment Real)
(declare-const transaction_conforms_to_business_practice Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:investment_self_use_real_estate_limit] 自用不動產投資不得超過投資時淨值，營業用倉庫投資不得超過存款總餘額5%
(assert (let ((a!1 (ite (and (<= investment_self_use_real_estate_amount
                         net_worth_at_investment_time)
                     (<= investment_operating_warehouse_amount
                         (* (/ 1.0 20.0) total_deposits)))
                1.0
                0.0)))
  (= investment_self_use_real_estate_limit a!1)))

; [bank:investment_non_self_use_real_estate_allowed] 非自用不動產投資例外條件
(assert (= investment_non_self_use_real_estate_allowed
   (or main_part_of_business_location_self_use
       (and approved_cultural_or_public_use approved_by_authority)
       short_term_prepurchase_for_self_use
       rebuild_existing_real_estate_self_use)))

; [bank:investment_non_self_use_real_estate_limit] 非自用不動產投資總額不得超過銀行淨值20%，且與自用不動產投資合計不得超過投資時淨值
(assert (let ((a!1 (ite (and (<= total_non_self_use_real_estate_investment
                         (* (/ 1.0 5.0) net_worth))
                     (<= (+ total_non_self_use_real_estate_investment
                            total_self_use_real_estate_investment)
                         net_worth_at_investment_time))
                1.0
                0.0)))
  (= investment_non_self_use_real_estate_limit a!1)))

; [bank:real_estate_transaction_compliance] 與持有實收資本3%以上企業或利害關係人不動產交易須合於營業常規並經董事會三分之二出席及四分之三同意
(assert (= real_estate_transaction_compliance
   (or (not real_estate_transaction_with_related_party)
       (and transaction_conforms_to_business_practice
            (<= (/ 6666666667.0 10000000000.0) board_meeting_attendance_ratio)
            (<= (/ 3.0 4.0) board_approval_ratio)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行法第75條及相關投資限制規定時處罰
(assert (let ((a!1 (or (not (= investment_self_use_real_estate_limit 1.0))
               (and (not investment_non_self_use_real_estate_allowed)
                    (not (<= total_non_self_use_real_estate_investment 0.0)))
               (and real_estate_transaction_with_related_party
                    (not real_estate_transaction_compliance))
               (not (= investment_non_self_use_real_estate_limit 1.0)))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= investment_self_use_real_estate_amount 0.0))
(assert (= net_worth_at_investment_time 86000000000.0))
(assert (= investment_operating_warehouse_amount 0.0))
(assert (= total_non_self_use_real_estate_investment 1833000000.0))
(assert (= net_worth 8600000000.0))
(assert (= total_self_use_real_estate_investment 0.0))
(assert (= total_deposits 0.0))
(assert (= main_part_of_business_location_self_use false))
(assert (= short_term_prepurchase_for_self_use false))
(assert (= rebuild_existing_real_estate_self_use false))
(assert (= approved_cultural_or_public_use false))
(assert (= approved_by_authority false))
(assert (= real_estate_transaction_with_related_party false))
(assert (= transaction_conforms_to_business_practice false))
(assert (= board_meeting_attendance_ratio 0.0))
(assert (= board_approval_ratio 0.0))
(assert (= penalty true))
(assert (= investment_non_self_use_real_estate_allowed false))
(assert (= investment_non_self_use_real_estate_limit 0.0))
(assert (= investment_self_use_real_estate_limit 0.0))
(assert (= real_estate_transaction_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 21
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
