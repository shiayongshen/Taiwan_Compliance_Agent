; SMT2 file generated from compliance case automatic
; Case ID: case_126
; Generated at: 2025-10-21T02:24:03.064465
;
; This file can be executed with Z3:
;   z3 case_126.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_completed_within_one_month Bool)
(declare-const adjustment_plan_approved_by_board Bool)
(declare-const adjustment_plan_violation_count Int)
(declare-const approved_ratio Real)
(declare-const approved_ratio_value Real)
(declare-const capital_fund Real)
(declare-const foreign_currency_investment_in_domestic_foreign_currency_securities Real)
(declare-const foreign_currency_non_investment_reserve Real)
(declare-const foreign_currency_non_investment_reserve_fully_invested_in_same_currency Bool)
(declare-const foreign_investment_adjustment_plan_completed Bool)
(declare-const foreign_investment_adjustment_plan_required Bool)
(declare-const foreign_investment_adjustment_plan_violation Bool)
(declare-const foreign_investment_allowed_types Int)
(declare-const foreign_investment_compliance Bool)
(declare-const foreign_investment_exclusion_amount Real)
(declare-const foreign_investment_gross Real)
(declare-const foreign_investment_limit Real)
(declare-const foreign_investment_total Real)
(declare-const investment_type_foreign_deposit Bool)
(declare-const investment_type_foreign_insurance_related Bool)
(declare-const investment_type_foreign_securities Bool)
(declare-const investment_type_other_approved Bool)
(declare-const meets_fund_usage_ratio_requirements Bool)
(declare-const non_investment_foreign_currency_reserve_40_percent Bool)
(declare-const penalty Bool)
(declare-const violate_article_138_1_3_5_or_2 Bool)
(declare-const violate_article_138_2_4_5_7_or_138_3_1_2_3 Bool)
(declare-const violate_article_143 Bool)
(declare-const violate_article_143_5_or_143_6_measures Bool)
(declare-const violate_article_146_1_2_3_5_or_146_5_3_4 Bool)
(declare-const violate_article_146_1_3_5_7_6_or_8 Bool)
(declare-const violate_article_146_2_1_2_4 Bool)
(declare-const violate_article_146_3_1_2_4 Bool)
(declare-const violate_article_146_3_3_loan_board_approval Bool)
(declare-const violate_article_146_3_3_loan_without_sufficient_collateral Bool)
(declare-const violate_article_146_4_1_2_3 Bool)
(declare-const violate_article_146_5_1_or_146_5_unauthorized_investment Bool)
(declare-const violate_article_146_6_1_2_3 Bool)
(declare-const violate_article_146_7_1_3_loan_or_transaction_limit Bool)
(declare-const violate_article_146_9_1_2_3 Bool)
(declare-const violation_of_investment_regulations Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:foreign_investment_allowed_types] 保險業國外投資限於外匯存款、國外有價證券、國外保險相關事業及主管機關核准之其他投資
(assert (= foreign_investment_allowed_types
   (ite (or investment_type_foreign_deposit
            investment_type_foreign_securities
            investment_type_other_approved
            investment_type_foreign_insurance_related)
        1
        0)))

; [insurance:foreign_investment_limit] 國外投資總額不得超過核定比例且最高不得超過資金45%
(assert (= foreign_investment_limit
   (ite (<= foreign_investment_total (* (/ 9.0 20.0) capital_fund)) 1.0 0.0)))

; [insurance:foreign_investment_exclusion_amount] 不計入國外投資限額之金額計算
(assert (let ((a!1 (* (+ 1.0 (* (- 1.0) approved_ratio))
              (ite (<= (ite non_investment_foreign_currency_reserve_40_percent
                            1.0
                            0.0)
                       foreign_currency_non_investment_reserve)
                   (ite non_investment_foreign_currency_reserve_40_percent
                        1.0
                        0.0)
                   foreign_currency_non_investment_reserve))))
  (= foreign_investment_exclusion_amount
     (+ a!1
        (* (- 1.0)
           foreign_currency_investment_in_domestic_foreign_currency_securities)))))

; [insurance:foreign_investment_total_calculation] 國外投資總額計算不含不計入國外投資額度
(assert (= foreign_investment_total
   (+ foreign_investment_gross (* (- 1.0) foreign_investment_exclusion_amount))))

; [insurance:foreign_investment_approved_ratio] 核定比例由主管機關核定並可變動
(assert (= approved_ratio approved_ratio_value))

; [insurance:foreign_investment_compliance] 國外投資符合主管機關核定比例及投資範圍
(assert (= foreign_investment_compliance
   (and (= foreign_investment_allowed_types 1)
        (<= foreign_investment_total (* (/ 9.0 20.0) capital_fund)))))

; [insurance:foreign_investment_adjustment_plan_required] 不計入國外投資額度核准後發生違規應訂定調整計畫並通過董事會
(assert (= foreign_investment_adjustment_plan_required
   (or (not foreign_currency_non_investment_reserve_fully_invested_in_same_currency)
       (not meets_fund_usage_ratio_requirements))))

; [insurance:foreign_investment_adjustment_plan_completed] 調整計畫經董事會通過並於一個月內完成改正
(assert (= foreign_investment_adjustment_plan_completed
   (and adjustment_plan_approved_by_board adjustment_completed_within_one_month)))

; [insurance:foreign_investment_adjustment_plan_violation] 未依規定辦理調整計畫或調整計畫未完成且累計超過兩次
(assert (= foreign_investment_adjustment_plan_violation
   (and (or (not foreign_investment_adjustment_plan_required)
            (not foreign_investment_adjustment_plan_completed))
        (<= 3 adjustment_plan_violation_count))))

; [insurance:violation_of_investment_regulations] 違反保險法相關投資規定
(assert (= violation_of_investment_regulations
   (or violate_article_146_9_1_2_3
       violate_article_143_5_or_143_6_measures
       violate_article_146_5_1_or_146_5_unauthorized_investment
       violate_article_146_2_1_2_4
       violate_article_143
       violate_article_146_3_3_loan_board_approval
       violate_article_146_3_3_loan_without_sufficient_collateral
       violate_article_146_3_1_2_4
       violate_article_138_2_4_5_7_or_138_3_1_2_3
       violate_article_146_1_2_3_5_or_146_5_3_4
       violate_article_138_1_3_5_or_2
       violate_article_146_1_3_5_7_6_or_8
       violate_article_146_4_1_2_3
       violate_article_146_7_1_3_loan_or_transaction_limit
       violate_article_146_6_1_2_3)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法相關投資規定或未依調整計畫完成改正且累計超過兩次
(assert (= penalty
   (or foreign_investment_adjustment_plan_violation
       violation_of_investment_regulations)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= foreign_investment_gross 7252000000))
(assert (= capital_fund 23500000000))
(assert (= approved_ratio_value (/ 3.0 10.0)))
(assert (= approved_ratio (/ 3.0 10.0)))
(assert (= investment_type_foreign_deposit false))
(assert (= investment_type_foreign_securities true))
(assert (= investment_type_foreign_insurance_related false))
(assert (= investment_type_other_approved false))
(assert (= foreign_currency_non_investment_reserve 0))
(assert (= foreign_currency_investment_in_domestic_foreign_currency_securities 0))
(assert (= non_investment_foreign_currency_reserve_40_percent false))
(assert (= foreign_currency_non_investment_reserve_fully_invested_in_same_currency true))
(assert (= meets_fund_usage_ratio_requirements true))
(assert (= adjustment_plan_approved_by_board false))
(assert (= adjustment_completed_within_one_month false))
(assert (= adjustment_plan_violation_count 0))
(assert (= violate_article_146_1_2_3_5_or_146_5_3_4 true))
(assert (= violation_of_investment_regulations true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 41
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
