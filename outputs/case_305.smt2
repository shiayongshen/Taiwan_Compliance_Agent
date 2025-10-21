; SMT2 file generated from compliance case automatic
; Case ID: case_305
; Generated at: 2025-10-21T22:13:22.296067
;
; This file can be executed with Z3:
;   z3 case_305.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authority_specified_amount Real)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const combined_loan_and_investment_amount Real)
(declare-const derivative_trading_compliance Bool)
(declare-const derivative_trading_meets_regulations Bool)
(declare-const insurance_fund Real)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const issuer_equity Real)
(declare-const loan_amount_per_unit_first_to_third Real)
(declare-const loan_compliance Bool)
(declare-const loan_guaranteed_by_bank_or_authority Bool)
(declare-const loan_investment_combined_limit_ok Bool)
(declare-const loan_limit_compliance Bool)
(declare-const loan_related_party_board_approval_ok Bool)
(declare-const loan_related_party_compliance Bool)
(declare-const loan_related_party_guarantee_ok Bool)
(declare-const loan_secured_by_life_insurance_policy Bool)
(declare-const loan_secured_by_movable_or_immovable Bool)
(declare-const loan_secured_by_qualified_securities Bool)
(declare-const loan_single_limit_ok Bool)
(declare-const loan_total_amount_first_to_third Real)
(declare-const loan_total_limit_ok Bool)
(declare-const loan_type_valid Bool)
(declare-const net_worth_ratio Real)
(declare-const non_investment_assets Real)
(declare-const own_capital Real)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const related_party_loan_amount Real)
(declare-const related_party_loan_conditions_not_better Bool)
(declare-const related_party_loan_has_full_guarantee Bool)
(declare-const risk_capital Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:loan_type_valid] 放款類型符合規定（銀行或主管機關認可信用保證、動產不動產擔保、有價證券質押、人壽保險單質押）
(assert (= loan_type_valid
   (or loan_guaranteed_by_bank_or_authority
       loan_secured_by_life_insurance_policy
       loan_secured_by_qualified_securities
       loan_secured_by_movable_or_immovable)))

; [insurance:loan_single_limit_ok] 第一款至第三款放款每一單位放款金額不超過資金5%
(assert (= loan_single_limit_ok
   (<= loan_amount_per_unit_first_to_third (* 5.0 insurance_fund))))

; [insurance:loan_total_limit_ok] 第一款至第三款放款總額不超過資金35%
(assert (= loan_total_limit_ok
   (<= loan_total_amount_first_to_third (* 35.0 insurance_fund))))

; [insurance:loan_related_party_guarantee_ok] 利害關係人擔保放款有十足擔保且條件不優於其他同類放款
(assert (= loan_related_party_guarantee_ok
   (and related_party_loan_has_full_guarantee
        related_party_loan_conditions_not_better)))

; [insurance:loan_related_party_board_approval_ok] 利害關係人擔保放款達主管機關規定金額以上，經三分之二以上董事出席及四分之三以上同意
(assert (= loan_related_party_board_approval_ok
   (or (not (>= related_party_loan_amount authority_specified_amount))
       (and (<= (/ 666667.0 10000.0) board_attendance_ratio)
            (<= 75.0 board_approval_ratio)))))

; [insurance:loan_related_party_compliance] 利害關係人擔保放款符合擔保及董事會決議規定
(assert (= loan_related_party_compliance
   (and loan_related_party_guarantee_ok loan_related_party_board_approval_ok)))

; [insurance:loan_investment_combined_limit_ok] 依146-3第四款及第一項第三款放款合併計算不超過資金10%及該公司業主權益10%
(assert (= loan_investment_combined_limit_ok
   (and (<= combined_loan_and_investment_amount (* 10.0 insurance_fund))
        (<= combined_loan_and_investment_amount (* 10.0 issuer_equity)))))

; [insurance:capital_adequacy_ratio] 資本適足率計算（自有資本/風險資本*100）
(assert (= capital_adequacy_ratio (* 100.0 (/ own_capital risk_capital))))

; [insurance:net_worth_ratio] 淨值比率計算（業主權益/非投資型保險專設帳簿資產總額*100）
(assert (= net_worth_ratio (* 100.0 (/ owner_equity non_investment_assets))))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:loan_limit_compliance] 放款限額符合規定
(assert (= loan_limit_compliance
   (and loan_single_limit_ok
        loan_total_limit_ok
        loan_investment_combined_limit_ok)))

; [insurance:loan_compliance] 放款符合類型及限額規定
(assert (= loan_compliance
   (and loan_type_valid loan_limit_compliance loan_related_party_compliance)))

; [insurance:internal_control_ok] 建立內部控制及稽核制度且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:derivative_trading_compliance] 衍生性商品交易符合主管機關規定
(assert (= derivative_trading_compliance derivative_trading_meets_regulations))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反放款類型、限額、利害關係人擔保規定、內部控制、內部處理制度或衍生性商品交易規定時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not loan_compliance)
       (not derivative_trading_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= loan_guaranteed_by_bank_or_authority false))
(assert (= loan_secured_by_movable_or_immovable false))
(assert (= loan_secured_by_qualified_securities false))
(assert (= loan_secured_by_life_insurance_policy false))
(assert (= loan_amount_per_unit_first_to_third 600.0))
(assert (= insurance_fund 10000.0))
(assert (= loan_total_amount_first_to_third 4000.0))
(assert (= loan_total_limit_ok false))
(assert (= loan_single_limit_ok false))
(assert (= combined_loan_and_investment_amount 1500.0))
(assert (= issuer_equity 10000.0))
(assert (= loan_investment_combined_limit_ok false))
(assert (= related_party_loan_has_full_guarantee false))
(assert (= related_party_loan_conditions_not_better false))
(assert (= related_party_loan_amount 2000.0))
(assert (= authority_specified_amount 1000.0))
(assert (= board_attendance_ratio 50.0))
(assert (= board_approval_ratio 60.0))
(assert (= loan_related_party_guarantee_ok false))
(assert (= loan_related_party_board_approval_ok false))
(assert (= loan_related_party_compliance false))
(assert (= loan_type_valid false))
(assert (= loan_limit_compliance false))
(assert (= loan_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= derivative_trading_meets_regulations false))
(assert (= derivative_trading_compliance false))
(assert (= own_capital 500000.0))
(assert (= risk_capital 1000000.0))
(assert (= capital_adequacy_ratio 50.0))
(assert (= owner_equity 100000.0))
(assert (= non_investment_assets 1000000.0))
(assert (= net_worth_ratio 10.0))

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
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
