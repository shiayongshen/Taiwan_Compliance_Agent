; SMT2 file generated from compliance case automatic
; Case ID: case_305
; Generated at: 2025-10-19T12:40:02.134171
;
; This file can be executed with Z3:
;   z3 case_305.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const insurance_capital Real)
(declare-const investment_amount_146_1_3 Real)
(declare-const issuer_equity Real)
(declare-const loan_amount_146_3_4 Real)
(declare-const loan_amount_per_unit Real)
(declare-const loan_and_investment_limit_combined_ok Bool)
(declare-const loan_guaranteed_by_bank_or_approved_credit_institution Bool)
(declare-const loan_related_party_board_approval Bool)
(declare-const loan_related_party_conditions_not_better Bool)
(declare-const loan_related_party_full_collateral Bool)
(declare-const loan_secured_by_life_insurance_policy Bool)
(declare-const loan_secured_by_movable_or_immovable_property Bool)
(declare-const loan_secured_by_qualified_securities Bool)
(declare-const loan_type_valid Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const regulator_specified_amount Real)
(declare-const related_party_loan_amount Real)
(declare-const related_party_loan_board_approval Bool)
(declare-const related_party_loan_conditions_not_better_than_others Bool)
(declare-const related_party_loan_has_full_collateral Bool)
(declare-const related_party_loan_secured Bool)
(declare-const risk_capital Real)
(declare-const single_loan_limit_ok Bool)
(declare-const total_assets_excluding_investment_type_insurance_special_account Real)
(declare-const total_loan_amount_1_to_3 Real)
(declare-const total_loan_limit_ok Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:loan_type_valid] 放款類型符合規定之四款之一
(assert (= loan_type_valid
   (or loan_secured_by_movable_or_immovable_property
       loan_secured_by_qualified_securities
       loan_guaranteed_by_bank_or_approved_credit_institution
       loan_secured_by_life_insurance_policy)))

; [insurance:single_loan_limit_ok] 第一款至第三款放款每一單位放款金額不超過資金5%
(assert (= single_loan_limit_ok (<= loan_amount_per_unit (* 5.0 insurance_capital))))

; [insurance:total_loan_limit_ok] 第一款至第三款放款總額不超過資金35%
(assert (= total_loan_limit_ok (<= total_loan_amount_1_to_3 (* 35.0 insurance_capital))))

; [insurance:related_party_loan_secured] 利害關係人擔保放款有十足擔保且條件不優於其他同類放款
(assert (= related_party_loan_secured
   (and related_party_loan_has_full_collateral
        related_party_loan_conditions_not_better_than_others)))

; [insurance:related_party_loan_board_approval] 利害關係人擔保放款達主管機關規定金額以上，經董事會三分之二以上出席及四分之三以上同意
(assert (= related_party_loan_board_approval
   (or (not (>= related_party_loan_amount regulator_specified_amount))
       (and (<= (/ 6667.0 100.0) board_attendance_ratio)
            (<= 75.0 board_approval_ratio)))))

; [insurance:loan_and_investment_limit_combined_ok] 依146-3第四款及146-1第三款合併計算放款及投資限額不超過資金10%及公司業主權益10%
(assert (= loan_and_investment_limit_combined_ok
   (and (<= (+ investment_amount_146_1_3 loan_amount_146_3_4)
            (* 10.0 insurance_capital))
        (<= (+ investment_amount_146_1_3 loan_amount_146_3_4)
            (* 10.0 issuer_equity)))))

; [insurance:capital_adequacy_ratio] 資本適足率計算公式
(assert (= capital_adequacy_ratio (* 100.0 (/ own_capital risk_capital))))

; [insurance:net_worth_ratio] 淨值比率計算公式
(assert (= net_worth_ratio
   (* 100.0
      (/ net_worth
         total_assets_excluding_investment_type_insurance_special_account))))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:loan_related_party_full_collateral] 利害關係人擔保放款有十足擔保
(assert (= loan_related_party_full_collateral related_party_loan_has_full_collateral))

; [insurance:loan_related_party_conditions_not_better] 利害關係人擔保放款條件不得優於其他同類放款
(assert (= loan_related_party_conditions_not_better
   related_party_loan_conditions_not_better_than_others))

; [insurance:loan_related_party_board_approval] 利害關係人擔保放款達主管機關規定金額以上，經董事會三分之二以上出席及四分之三以上同意
(assert (= loan_related_party_board_approval
   (or (not (>= related_party_loan_amount regulator_specified_amount))
       (and (<= (/ 6667.0 100.0) board_attendance_ratio)
            (<= 75.0 board_approval_ratio)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反放款類型、限額、擔保及董事會決議規定時處罰
(assert (= penalty
   (or (not single_loan_limit_ok)
       (not total_loan_limit_ok)
       (not loan_type_valid)
       (not loan_and_investment_limit_combined_ok)
       (not loan_related_party_conditions_not_better)
       (and (>= related_party_loan_amount regulator_specified_amount)
            (not loan_related_party_board_approval))
       (not loan_related_party_full_collateral))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= loan_guaranteed_by_bank_or_approved_credit_institution false))
(assert (= loan_secured_by_movable_or_immovable_property false))
(assert (= loan_secured_by_qualified_securities false))
(assert (= loan_secured_by_life_insurance_policy false))
(assert (= loan_type_valid false))
(assert (= single_loan_limit_ok false))
(assert (= total_loan_limit_ok false))
(assert (= related_party_loan_has_full_collateral false))
(assert (= related_party_loan_conditions_not_better_than_others false))
(assert (= related_party_loan_amount 100000000.0))
(assert (= regulator_specified_amount 50000000.0))
(assert (= board_attendance_ratio 50.0))
(assert (= board_approval_ratio 50.0))
(assert (= loan_related_party_board_approval false))
(assert (= investment_amount_146_1_3 60000000.0))
(assert (= loan_amount_146_3_4 50000000.0))
(assert (= insurance_capital 1000000000.0))
(assert (= issuer_equity 1000000000.0))
(assert (= loan_amount_per_unit 60000000.0))
(assert (= loan_and_investment_limit_combined_ok false))
(assert (= own_capital 500000000.0))
(assert (= risk_capital 1000000000.0))
(assert (= net_worth 100000000.0))
(assert (= total_assets_excluding_investment_type_insurance_special_account 5000000000.0))
(assert (= capital_adequacy_ratio 0.0))
(assert (= capital_level 0))
(assert (= loan_related_party_conditions_not_better false))
(assert (= loan_related_party_full_collateral false))
(assert (= net_worth_ratio 0.0))
(assert (= penalty false))
(assert (= related_party_loan_board_approval false))
(assert (= related_party_loan_secured false))
(assert (= total_loan_amount_1_to_3 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 33
; Total facts: 33
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
