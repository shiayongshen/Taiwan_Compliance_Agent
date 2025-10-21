; SMT2 file generated from compliance case automatic
; Case ID: case_419
; Generated at: 2025-10-21T09:12:52.262635
;
; This file can be executed with Z3:
;   z3 case_419.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const combined_investment_limit_compliance Bool)
(declare-const foreign_investment_approved_foreign_insurance_related Bool)
(declare-const foreign_investment_foreign_currency_deposit Bool)
(declare-const foreign_investment_foreign_securities Bool)
(declare-const foreign_investment_other_approved Bool)
(declare-const foreign_investment_total_amount Real)
(declare-const foreign_investment_total_limit_compliance Bool)
(declare-const foreign_investment_type_compliance Bool)
(declare-const insurance_funds Real)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_handling_system_and_procedures_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const investment_amount Real)
(declare-const issuer_equity Real)
(declare-const loan_guaranteed_by_bank_or_approved_credit_institution Bool)
(declare-const loan_secured_by_life_insurance_policy Bool)
(declare-const loan_secured_by_movable_or_immovable_property Bool)
(declare-const loan_secured_by_qualified_securities Bool)
(declare-const loan_type_compliance Bool)
(declare-const penalty Bool)
(declare-const pledged_loan_amount Real)
(declare-const regulatory_threshold_amount Real)
(declare-const related_party_limit_follow_regulations Bool)
(declare-const related_party_loan_amount Real)
(declare-const related_party_loan_and_transaction_limit_compliance Bool)
(declare-const related_party_loan_board_approval_compliance Bool)
(declare-const related_party_loan_conditions_not_better_than_others Bool)
(declare-const related_party_loan_fully_secured Bool)
(declare-const related_party_loan_guarantee_compliance Bool)
(declare-const single_loan_amount Real)
(declare-const single_loan_limit_compliance Bool)
(declare-const total_loan_amount Real)
(declare-const total_loan_limit_compliance Bool)
(declare-const violation_of_internal_control_or_handling Bool)
(declare-const violation_of_loan_and_transaction_limit Bool)
(declare-const violation_of_loan_board_approval_or_limit Bool)
(declare-const violation_of_loan_guarantee_security Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:loan_type_compliance] 放款類型符合規定之四款之一
(assert (= loan_type_compliance
   (or loan_secured_by_movable_or_immovable_property
       loan_guaranteed_by_bank_or_approved_credit_institution
       loan_secured_by_life_insurance_policy
       loan_secured_by_qualified_securities)))

; [insurance:single_loan_limit_compliance] 單一放款金額不超過資金5%
(assert (= single_loan_limit_compliance (<= single_loan_amount (* 5.0 insurance_funds))))

; [insurance:total_loan_limit_compliance] 放款總額不超過資金35%
(assert (= total_loan_limit_compliance (<= total_loan_amount (* 35.0 insurance_funds))))

; [insurance:related_party_loan_guarantee_compliance] 利害關係人擔保放款有十足擔保且條件不優於其他同類放款
(assert (= related_party_loan_guarantee_compliance
   (and related_party_loan_fully_secured
        related_party_loan_conditions_not_better_than_others)))

; [insurance:related_party_loan_board_approval_compliance] 利害關係人擔保放款達主管機關規定金額以上，經董事會三分之二以上出席及四分之三以上同意
(assert (= related_party_loan_board_approval_compliance
   (or (not (>= related_party_loan_amount regulatory_threshold_amount))
       (and (<= (/ 666667.0 10000.0) board_attendance_ratio)
            (<= 75.0 board_approval_ratio)))))

; [insurance:combined_investment_limit_compliance] 合併計算投資及質押放款不超過資金10%及公司業主權益10%
(assert (= combined_investment_limit_compliance
   (and (<= (+ investment_amount pledged_loan_amount) (* 10.0 insurance_funds))
        (<= (+ investment_amount pledged_loan_amount) (* 10.0 issuer_equity)))))

; [insurance:foreign_investment_type_compliance] 國外投資符合規定之四款之一
(assert (= foreign_investment_type_compliance
   (or foreign_investment_foreign_currency_deposit
       foreign_investment_approved_foreign_insurance_related
       foreign_investment_foreign_securities
       foreign_investment_other_approved)))

; [insurance:foreign_investment_total_limit_compliance] 國外投資總額不超過資金45%
(assert (= foreign_investment_total_limit_compliance
   (<= foreign_investment_total_amount (* 45.0 insurance_funds))))

; [insurance:related_party_loan_and_transaction_limit_compliance] 同一人、同一關係人或同一關係企業放款及其他交易限制符合規定
(assert (= related_party_loan_and_transaction_limit_compliance
   related_party_limit_follow_regulations))

; [insurance:internal_control_and_audit_established] 建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   internal_control_and_audit_system_established))

; [insurance:internal_handling_system_established] 建立內部處理制度及程序
(assert (= internal_handling_system_established
   internal_handling_system_and_procedures_established))

; [insurance:violation_of_loan_guarantee_security] 依146-3第三項規定放款無十足擔保或條件優於其他同類放款
(assert (= violation_of_loan_guarantee_security
   (or (not related_party_loan_conditions_not_better_than_others)
       (not related_party_loan_fully_secured))))

; [insurance:violation_of_loan_board_approval_or_limit] 依146-3第三項規定放款未經董事會三分之二出席及四分之三同意，或違反放款限額規定
(assert (let ((a!1 (and (>= related_party_loan_amount regulatory_threshold_amount)
                (or (not (<= (/ 666667.0 10000.0) board_attendance_ratio))
                    (not (<= 75.0 board_approval_ratio))))))
  (= violation_of_loan_board_approval_or_limit
     (or (not single_loan_limit_compliance)
         a!1
         (not total_loan_limit_compliance)))))

; [insurance:violation_of_loan_and_transaction_limit] 違反146-7條放款或其他交易限額或決議程序規定
(assert (not (= related_party_loan_and_transaction_limit_compliance
        violation_of_loan_and_transaction_limit)))

; [insurance:violation_of_internal_control_or_handling] 違反148-3條未建立或未執行內部控制、稽核或內部處理制度程序
(assert (= violation_of_internal_control_or_handling
   (or (not internal_control_and_audit_established)
       (not internal_handling_system_established))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反放款擔保、董事會決議、放款限額、交易限額或內部控制規定時處罰
(assert (= penalty
   (or violation_of_loan_board_approval_or_limit
       violation_of_internal_control_or_handling
       violation_of_loan_and_transaction_limit
       violation_of_loan_guarantee_security)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= loan_guaranteed_by_bank_or_approved_credit_institution false))
(assert (= loan_secured_by_movable_or_immovable_property false))
(assert (= loan_secured_by_qualified_securities false))
(assert (= loan_secured_by_life_insurance_policy false))
(assert (= single_loan_amount 161226000))
(assert (= insurance_funds 476000000))
(assert (= total_loan_amount 161226000))
(assert (= related_party_loan_fully_secured false))
(assert (= related_party_loan_conditions_not_better_than_others false))
(assert (= related_party_loan_amount 161226000))
(assert (= regulatory_threshold_amount 100000000))
(assert (= board_attendance_ratio 50.0))
(assert (= board_approval_ratio 50.0))
(assert (= related_party_limit_follow_regulations false))
(assert (= related_party_loan_and_transaction_limit_compliance false))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_handling_system_and_procedures_established false))
(assert (= internal_handling_system_established false))
(assert (= foreign_investment_total_amount 143000000))
(assert (= foreign_investment_foreign_currency_deposit true))
(assert (= foreign_investment_foreign_securities true))
(assert (= foreign_investment_approved_foreign_insurance_related false))
(assert (= foreign_investment_other_approved false))
(assert (= foreign_investment_type_compliance true))
(assert (= foreign_investment_total_limit_compliance false))
(assert (= combined_investment_limit_compliance false))
(assert (= investment_amount 0))
(assert (= pledged_loan_amount 0))
(assert (= issuer_equity 500000000))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 40
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
