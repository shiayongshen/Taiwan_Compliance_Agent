; SMT2 file generated from compliance case automatic
; Case ID: case_137
; Generated at: 2025-10-21T02:48:22.221189
;
; This file can be executed with Z3:
;   z3 case_137.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_fund Real)
(declare-const gaap_evaluation_amount Real)
(declare-const government_claim Real)
(declare-const life_insurance_loan Real)
(declare-const loan_asset_agreement_reschedule Real)
(declare-const loan_asset_classification Real)
(declare-const loan_asset_classification_exclusion Real)
(declare-const loan_class_1_amount Real)
(declare-const loan_class_2_amount Real)
(declare-const loan_class_3_amount Real)
(declare-const loan_class_4_amount Real)
(declare-const loan_class_5_amount Real)
(declare-const loan_class_7_overdue_unsecured_amounts Real)
(declare-const loan_credit_bad Real)
(declare-const loan_provision_minimum Real)
(declare-const loan_provision_minimum_gaap Real)
(declare-const loan_provision_special_increase Real)
(declare-const loan_secured Real)
(declare-const loans_approval_flag Bool)
(declare-const loans_limits_flag Bool)
(declare-const loans_unsecured_flag Bool)
(declare-const overdue_months Int)
(declare-const owner_equity_total Real)
(declare-const penalty Bool)
(declare-const premium_advance Real)
(declare-const provision_amount Real)
(declare-const real_estate_investment_limit Real)
(declare-const real_estate_investment_total Real)
(declare-const real_estate_social_housing_exemption Bool)
(declare-const real_estate_valuation_compliance Bool)
(declare-const real_estate_valuation_done Bool)
(declare-const self_use_real_estate_amount Real)
(declare-const social_housing_rental_only Bool)
(declare-const special_provision_increase_required Bool)
(declare-const violation_138_1 Bool)
(declare-const violation_138_1_flag Bool)
(declare-const violation_138_2_2_flag Bool)
(declare-const violation_138_2_4_5_7_138_3_1_2_3 Bool)
(declare-const violation_138_2_4_flag Bool)
(declare-const violation_138_2_5_flag Bool)
(declare-const violation_138_2_7_flag Bool)
(declare-const violation_138_3 Bool)
(declare-const violation_138_3_1_flag Bool)
(declare-const violation_138_3_2_flag Bool)
(declare-const violation_138_3_3_flag Bool)
(declare-const violation_138_3_flag Bool)
(declare-const violation_138_5 Bool)
(declare-const violation_138_5_flag Bool)
(declare-const violation_138_business_scope Bool)
(declare-const violation_143 Bool)
(declare-const violation_143_5_and_143_6_measures Bool)
(declare-const violation_143_5_flag Bool)
(declare-const violation_143_6_measures_flag Bool)
(declare-const violation_143_flag Bool)
(declare-const violation_146_1_1_2_3_5_flag Bool)
(declare-const violation_146_1_1_3_5_7_6_flag Bool)
(declare-const violation_146_1_2_3_4_5_6_7_9 Bool)
(declare-const violation_146_1_8_flag Bool)
(declare-const violation_146_2_1_2_4_flag Bool)
(declare-const violation_146_3_1_2_4_flag Bool)
(declare-const violation_146_3_8_loans_approval Bool)
(declare-const violation_146_3_8_loans_unsecured Bool)
(declare-const violation_146_4_1_2_3_flag Bool)
(declare-const violation_146_5_1_flag Bool)
(declare-const violation_146_5_3_4_flag Bool)
(declare-const violation_146_5_post_flag Bool)
(declare-const violation_146_6_1_2_3_flag Bool)
(declare-const violation_146_7_loans_limits Bool)
(declare-const violation_146_9_1_2_3_flag Bool)
(declare-const violation_146_investment Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_138_business_scope] 違反138條第1、3、5項業務範圍規定
(assert (= violation_138_business_scope violation_138_1))

; [insurance:violation_138_1] 違反138條第1項規定
(assert (= violation_138_1 violation_138_1_flag))

; [insurance:violation_138_3] 違反138條第3項規定
(assert (= violation_138_3 violation_138_3_flag))

; [insurance:violation_138_5] 違反138條第5項規定
(assert (= violation_138_5 violation_138_5_flag))

; [insurance:violation_138_2_4_5_7_138_3_1_2_3] 違反138條之二第2、4、5、7項及138條之三第1、2、3項賠償準備金提存額度及方式規定
(assert (= violation_138_2_4_5_7_138_3_1_2_3
   (or violation_138_2_2_flag
       violation_138_2_4_flag
       violation_138_2_5_flag
       violation_138_2_7_flag
       violation_138_3_1_flag
       violation_138_3_2_flag
       violation_138_3_3_flag)))

; [insurance:violation_143] 違反143條規定
(assert (= violation_143 violation_143_flag))

; [insurance:violation_143_5_and_143_6_measures] 違反143條之五或主管機關依143條之六措施規定
(assert (= violation_143_5_and_143_6_measures
   (or violation_143_5_flag violation_143_6_measures_flag)))

; [insurance:violation_146_investment] 違反146條相關專設帳簿管理、投資資產運用、衍生性商品交易等規定
(assert (= violation_146_investment
   (or violation_146_1_8_flag violation_146_1_1_3_5_7_6_flag)))

; [insurance:violation_146_1_2_3_4_5_6_7_9] 違反146條之一至九相關投資條件、範圍、申報方式等規定
(assert (= violation_146_1_2_3_4_5_6_7_9
   (or violation_146_4_1_2_3_flag
       violation_146_5_1_flag
       violation_146_1_1_2_3_5_flag
       violation_146_3_1_2_4_flag
       violation_146_5_post_flag
       violation_146_5_3_4_flag
       violation_146_6_1_2_3_flag
       violation_146_2_1_2_4_flag
       violation_146_9_1_2_3_flag)))

; [insurance:violation_146_3_8_loans_unsecured] 依146-3第3項或146-8第1項規定放款無十足擔保或條件優於同類放款
(assert (= violation_146_3_8_loans_unsecured loans_unsecured_flag))

; [insurance:violation_146_3_8_loans_approval] 擔保放款未經董事會三分之二出席及四分之三同意或違反放款限額規定
(assert (= violation_146_3_8_loans_approval loans_approval_flag))

; [insurance:violation_146_7_loans_limits] 違反146-7條放款或其他交易限額及決議程序規定
(assert (= violation_146_7_loans_limits loans_limits_flag))

; [insurance:real_estate_investment_limit] 不動產投資限額符合146-2條規定
(assert (let ((a!1 (and (<= (+ real_estate_investment_total
                       (* (- 1.0) self_use_real_estate_amount))
                    (* (/ 3.0 10.0) capital_fund))
                (<= self_use_real_estate_amount owner_equity_total))))
  (= real_estate_investment_limit (ite a!1 1.0 0.0))))

; [insurance:real_estate_valuation_compliance] 不動產取得及處分經合法鑑價機構評價
(assert (= real_estate_valuation_compliance real_estate_valuation_done))

; [insurance:real_estate_social_housing_exemption] 依住宅法興辦社會住宅且僅供租賃者不受即時利用限制
(assert (= real_estate_social_housing_exemption social_housing_rental_only))

; [insurance:loan_asset_classification] 放款資產分類依逾期期間及擔保情形
(assert (let ((a!1 (or (and (<= 1 overdue_months)
                    (not (>= 12 overdue_months))
                    (= loan_credit_bad 1.0))
               (and (<= 1 overdue_months)
                    (>= 12 overdue_months)
                    (= loan_secured 1.0))
               (and (<= 1 overdue_months)
                    (>= 3 overdue_months)
                    (not (= loan_secured 1.0)))))
      (a!2 (or (and (<= 12 overdue_months) (= loan_secured 1.0))
               (and (<= 3 overdue_months)
                    (>= 6 overdue_months)
                    (not (= loan_secured 1.0)))))
      (a!3 (ite (and (<= 12 overdue_months) (not (= loan_secured 1.0))) 4 0)))
(let ((a!4 (ite (and (<= 6 overdue_months)
                     (>= 12 overdue_months)
                     (not (= loan_secured 1.0)))
                3
                a!3)))
  (= loan_asset_classification (to_real (ite a!1 1 (ite a!2 2 a!4)))))))

; [insurance:loan_asset_classification_exclusion] 協議分期償還放款資產不得列為第一類
(assert (let ((a!1 (ite (or (not (= 1.0 loan_asset_classification))
                    (not (= loan_asset_agreement_reschedule 1.0)))
                1.0
                0.0)))
  (= loan_asset_classification_exclusion a!1)))

; [insurance:loan_provision_minimum] 備抵呆帳金額不得低於各類放款資產標準比例
(assert (let ((a!1 (and (>= provision_amount
                    (+ (* (/ 1.0 200.0) loan_class_1_amount)
                       (* (- (/ 1.0 200.0)) life_insurance_loan)
                       (* (- (/ 1.0 200.0)) premium_advance)
                       (* (- (/ 1.0 200.0)) government_claim)
                       (* (/ 1.0 50.0) loan_class_2_amount)
                       (* (/ 1.0 10.0) loan_class_3_amount)
                       (* (/ 1.0 2.0) loan_class_4_amount)
                       loan_class_5_amount))
                (>= provision_amount
                    (+ (* (/ 1.0 100.0) loan_class_1_amount)
                       (* (- (/ 1.0 100.0)) life_insurance_loan)
                       (* (- (/ 1.0 100.0)) premium_advance)
                       (* (- (/ 1.0 100.0)) government_claim)
                       (* (/ 1.0 100.0) loan_class_2_amount)
                       (* (/ 1.0 100.0) loan_class_3_amount)
                       (* (/ 1.0 100.0) loan_class_4_amount)
                       (* (/ 1.0 100.0) loan_class_5_amount)))
                (>= provision_amount loan_class_7_overdue_unsecured_amounts))))
  (= loan_provision_minimum (ite a!1 1.0 0.0))))

; [insurance:loan_provision_minimum_gaap] 最低備抵呆帳金額不得低於一般公認會計原則評估金額
(assert (= loan_provision_minimum_gaap
   (ite (>= provision_amount gaap_evaluation_amount) 1.0 0.0)))

; [insurance:loan_provision_special_increase] 主管機關得要求提高特定放款資產備抵呆帳
(assert (= loan_provision_special_increase
   (ite special_provision_increase_required 1.0 0.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關條文規定時處罰
(assert (= penalty
   (or (not (= 0.0 loan_provision_minimum_gaap))
       violation_146_7_loans_limits
       violation_143
       violation_138_2_4_5_7_138_3_1_2_3
       violation_146_investment
       violation_138_business_scope
       violation_146_3_8_loans_approval
       (not real_estate_valuation_compliance)
       (not (= 0.0 real_estate_investment_limit))
       violation_146_1_2_3_4_5_6_7_9
       violation_143_5_and_143_6_measures
       (not (= 0.0 loan_provision_minimum))
       violation_146_3_8_loans_unsecured)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_146_investment true))
(assert (= violation_146_1_1_3_5_7_6_flag true))
(assert (= real_estate_valuation_done false))
(assert (= real_estate_valuation_compliance false))
(assert (= real_estate_investment_total 10000000))
(assert (= self_use_real_estate_amount 0))
(assert (= capital_fund 20000000))
(assert (= owner_equity_total 15000000))
(assert (= social_housing_rental_only false))
(assert (= real_estate_social_housing_exemption false))
(assert (= penalty true))
(assert (= violation_138_1_flag false))
(assert (= violation_138_3_flag false))
(assert (= violation_138_5_flag false))
(assert (= violation_138_2_2_flag false))
(assert (= violation_138_2_4_flag false))
(assert (= violation_138_2_5_flag false))
(assert (= violation_138_2_7_flag false))
(assert (= violation_138_3_1_flag false))
(assert (= violation_138_3_2_flag false))
(assert (= violation_138_3_3_flag false))
(assert (= violation_143_flag false))
(assert (= violation_143_5_flag false))
(assert (= violation_143_6_measures_flag false))
(assert (= loans_unsecured_flag false))
(assert (= loans_approval_flag false))
(assert (= loans_limits_flag false))
(assert (= loan_asset_agreement_reschedule 0))
(assert (= loan_class_1_amount 0))
(assert (= loan_class_2_amount 0))
(assert (= loan_class_3_amount 0))
(assert (= loan_class_4_amount 0))
(assert (= loan_class_5_amount 0))
(assert (= loan_class_7_overdue_unsecured_amounts 0))
(assert (= provision_amount 0))
(assert (= gaap_evaluation_amount 0))
(assert (= loan_provision_minimum 0))
(assert (= loan_provision_minimum_gaap 0))
(assert (= loan_provision_special_increase 0))
(assert (= loan_secured 0))
(assert (= loan_credit_bad 0))
(assert (= overdue_months 0))
(assert (= violation_138_business_scope false))
(assert (= violation_138_1 false))
(assert (= violation_138_2_4_5_7_138_3_1_2_3 false))
(assert (= violation_143 false))
(assert (= violation_143_5_and_143_6_measures false))
(assert (= violation_146_1_2_3_4_5_6_7_9 false))
(assert (= violation_146_3_8_loans_unsecured false))
(assert (= violation_146_3_8_loans_approval false))
(assert (= violation_146_7_loans_limits false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 70
; Total facts: 51
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
