; SMT2 file generated from compliance case automatic
; Case ID: case_419
; Generated at: 2025-10-19T15:23:47.927384
;
; This file can be executed with Z3:
;   z3 case_419.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_foreign_currency_securities_market_investment_excluded Bool)
(declare-const approved_foreign_insurance_related_investment_excluded Bool)
(declare-const approved_non_investment_foreign_currency_insurance_amount_excluded Bool)
(declare-const approved_other_foreign_investment_excluded Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const capital Real)
(declare-const company_equity Real)
(declare-const foreign_investment_exclusion_amount_ok Bool)
(declare-const foreign_investment_foreign_currency_deposit Real)
(declare-const foreign_investment_foreign_insurance_related_company Real)
(declare-const foreign_investment_foreign_securities Real)
(declare-const foreign_investment_other_approved Real)
(declare-const foreign_investment_total_amount Real)
(declare-const foreign_investment_total_limit_ok Bool)
(declare-const foreign_investment_type_valid Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_handling_system_and_procedure_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const investment_in_company_securities Real)
(declare-const loan_amount_per_unit_first_to_third Real)
(declare-const loan_and_other_transaction_amount_related_enterprise Real)
(declare-const loan_and_other_transaction_amount_related_person Real)
(declare-const loan_and_other_transaction_amount_same_person Real)
(declare-const loan_guaranteed_by_bank_or_approved_credit_institution Bool)
(declare-const loan_related_party_board_approval_ok Bool)
(declare-const loan_related_party_compliance Bool)
(declare-const loan_related_party_guarantee_ok Bool)
(declare-const loan_secured_by_life_insurance_policy Bool)
(declare-const loan_secured_by_movable_or_immovable_property Bool)
(declare-const loan_secured_by_qualified_securities_146_1 Bool)
(declare-const loan_single_limit_ok Bool)
(declare-const loan_total_amount_first_to_third Real)
(declare-const loan_total_limit_ok Bool)
(declare-const loan_type_valid Bool)
(declare-const penalty Bool)
(declare-const pledge_loan_by_company_securities Bool)
(declare-const regulator_approved_foreign_investment_limit Real)
(declare-const regulator_specified_amount Real)
(declare-const regulator_specified_limit Bool)
(declare-const related_party_loan_amount Real)
(declare-const related_party_loan_and_transaction_limit_ok Bool)
(declare-const related_party_loan_conditions_not_better_than_others Bool)
(declare-const related_party_loan_full_collateral Bool)
(declare-const securities_investment_and_pledge_limit_ok Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:loan_type_valid] 放款類型符合規定之四款之一
(assert (= loan_type_valid
   (or loan_secured_by_qualified_securities_146_1
       loan_secured_by_life_insurance_policy
       loan_secured_by_movable_or_immovable_property
       loan_guaranteed_by_bank_or_approved_credit_institution)))

; [insurance:loan_single_limit_ok] 第一款至第三款放款每一單位放款金額不超過資金5%
(assert (= loan_single_limit_ok
   (<= loan_amount_per_unit_first_to_third (* (/ 1.0 20.0) capital))))

; [insurance:loan_total_limit_ok] 第一款至第三款放款總額不超過資金35%
(assert (= loan_total_limit_ok
   (<= loan_total_amount_first_to_third (* (/ 7.0 20.0) capital))))

; [insurance:loan_related_party_guarantee_ok] 對負責人、職員或主要股東及其利害關係人擔保放款有十足擔保且條件不優於其他同類放款
(assert (= loan_related_party_guarantee_ok
   (and related_party_loan_full_collateral
        related_party_loan_conditions_not_better_than_others)))

; [insurance:loan_related_party_board_approval_ok] 利害關係人擔保放款達主管機關規定金額以上，經董事會三分之二以上出席及四分之三以上同意
(assert (= loan_related_party_board_approval_ok
   (or (not (>= related_party_loan_amount regulator_specified_amount))
       (and (<= (/ 6666667.0 10000000.0) board_attendance_ratio)
            (<= (/ 3.0 4.0) board_approval_ratio)))))

; [insurance:loan_related_party_compliance] 利害關係人擔保放款符合擔保、條件及董事會決議規定
(assert (= loan_related_party_compliance
   (and loan_related_party_guarantee_ok loan_related_party_board_approval_ok)))

; [insurance:securities_investment_and_pledge_limit_ok] 依146-3第4款及146-1第3款及第4款合併計算投資及質押限額不超過資金10%及公司業主權益10%
(assert (let ((a!1 (and (<= (+ investment_in_company_securities
                       (ite pledge_loan_by_company_securities 1.0 0.0))
                    (* (/ 1.0 10.0) capital))
                (<= (+ investment_in_company_securities
                       (ite pledge_loan_by_company_securities 1.0 0.0))
                    (* (/ 1.0 10.0) company_equity)))))
  (= securities_investment_and_pledge_limit_ok a!1)))

; [insurance:foreign_investment_type_valid] 國外投資類型符合規定之四款之一
(assert (= foreign_investment_type_valid
   (or (= foreign_investment_foreign_insurance_related_company 1.0)
       (= foreign_investment_other_approved 1.0)
       (= foreign_investment_foreign_securities 1.0)
       (= foreign_investment_foreign_currency_deposit 1.0))))

; [insurance:foreign_investment_total_limit_ok] 國外投資總額不超過主管機關核定且最高不超過資金45%
(assert (let ((a!1 (<= foreign_investment_total_amount
               (ite (<= regulator_approved_foreign_investment_limit
                        (* (/ 9.0 20.0) capital))
                    regulator_approved_foreign_investment_limit
                    (* (/ 9.0 20.0) capital)))))
  (= foreign_investment_total_limit_ok a!1)))

; [insurance:foreign_investment_exclusion_amount_ok] 不計入國外投資限額之金額符合規定
(assert (= foreign_investment_exclusion_amount_ok
   (and approved_non_investment_foreign_currency_insurance_amount_excluded
        approved_foreign_currency_securities_market_investment_excluded
        approved_foreign_insurance_related_investment_excluded
        approved_other_foreign_investment_excluded)))

; [insurance:related_party_loan_and_transaction_limit_ok] 同一人、同一關係人或同一關係企業放款及其他交易限額符合主管機關規定
(assert (= related_party_loan_and_transaction_limit_ok
   (and (<= loan_and_other_transaction_amount_same_person
            (ite regulator_specified_limit 1.0 0.0))
        (<= loan_and_other_transaction_amount_related_person
            (ite regulator_specified_limit 1.0 0.0))
        (<= loan_and_other_transaction_amount_related_enterprise
            (ite regulator_specified_limit 1.0 0.0)))))

; [insurance:internal_control_and_audit_established] 建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   internal_control_and_audit_system_established))

; [insurance:internal_handling_system_established] 建立內部處理制度及程序
(assert (= internal_handling_system_established
   internal_handling_system_and_procedure_established))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反放款類型、限額、擔保、董事會決議、國外投資限額、利害關係人交易限額、內部控制及處理制度規定時處罰
(assert (= penalty
   (or (not loan_related_party_compliance)
       (not loan_total_limit_ok)
       (not foreign_investment_type_valid)
       (not internal_control_and_audit_established)
       (not securities_investment_and_pledge_limit_ok)
       (not loan_single_limit_ok)
       (not foreign_investment_total_limit_ok)
       (not internal_handling_system_established)
       (not loan_type_valid)
       (not related_party_loan_and_transaction_limit_ok)
       (not foreign_investment_exclusion_amount_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= loan_guaranteed_by_bank_or_approved_credit_institution false))
(assert (= loan_secured_by_movable_or_immovable_property false))
(assert (= loan_secured_by_qualified_securities_146_1 false))
(assert (= loan_secured_by_life_insurance_policy false))
(assert (= loan_amount_per_unit_first_to_third 0.0))
(assert (= capital 58564020.0))
(assert (= loan_total_amount_first_to_third 0.0))
(assert (= related_party_loan_full_collateral false))
(assert (= related_party_loan_conditions_not_better_than_others false))
(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 1.0 2.0)))
(assert (= related_party_loan_amount 0.0))
(assert (= investment_in_company_securities 0.0))
(assert (= pledge_loan_by_company_securities false))
(assert (= company_equity 0.0))
(assert (= foreign_investment_foreign_currency_deposit 47563460.0))
(assert (= foreign_investment_foreign_securities 0.0))
(assert (= foreign_investment_foreign_insurance_related_company 0.0))
(assert (= foreign_investment_other_approved 0.0))
(assert (= foreign_investment_total_amount 47563460.0))
(assert (= regulator_approved_foreign_investment_limit 17569200.0))
(assert (= loan_and_other_transaction_amount_same_person 161226000.0))
(assert (= loan_and_other_transaction_amount_related_person 0.0))
(assert (= loan_and_other_transaction_amount_related_enterprise 0.0))
(assert (= regulator_specified_amount 100000000.0))
(assert (= regulator_specified_limit false))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_handling_system_and_procedure_established false))
(assert (= internal_handling_system_established false))
(assert (= approved_non_investment_foreign_currency_insurance_amount_excluded true))
(assert (= approved_foreign_currency_securities_market_investment_excluded true))
(assert (= approved_foreign_insurance_related_investment_excluded true))
(assert (= approved_other_foreign_investment_excluded true))
(assert (= foreign_investment_exclusion_amount_ok false))
(assert (= foreign_investment_total_limit_ok false))
(assert (= foreign_investment_type_valid false))
(assert (= loan_related_party_board_approval_ok false))
(assert (= loan_related_party_compliance false))
(assert (= loan_related_party_guarantee_ok false))
(assert (= loan_single_limit_ok false))
(assert (= loan_total_limit_ok false))
(assert (= loan_type_valid false))
(assert (= penalty false))
(assert (= related_party_loan_and_transaction_limit_ok false))
(assert (= securities_investment_and_pledge_limit_ok false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 46
; Total facts: 46
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
