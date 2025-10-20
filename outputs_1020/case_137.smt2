; SMT2 file generated from compliance case automatic
; Case ID: case_137
; Generated at: 2025-10-19T08:58:48.668610
;
; This file can be executed with Z3:
;   z3 case_137.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const allowance_amount Real)
(declare-const allowance_gaap_amount Real)
(declare-const capital_fund Real)
(declare-const gov_claim Real)
(declare-const life_insurance_loan Real)
(declare-const loan_146_3_3_or_146_8_1_no_board_approval Bool)
(declare-const loan_146_3_3_or_146_8_1_unsecured Bool)
(declare-const loan_allowance_minimum_gaap Real)
(declare-const loan_allowance_minimum_met Bool)
(declare-const loan_asset_classification_attention Bool)
(declare-const loan_asset_classification_difficult_recovery Bool)
(declare-const loan_asset_classification_evidence_provided Bool)
(declare-const loan_asset_classification_first_class Bool)
(declare-const loan_asset_classification_no_recovery Bool)
(declare-const loan_asset_classification_not_first_class Bool)
(declare-const loan_asset_classification_recoverable Bool)
(declare-const loan_class_1_amount Real)
(declare-const loan_class_2_amount Real)
(declare-const loan_class_3_amount Real)
(declare-const loan_class_4_amount Real)
(declare-const loan_class_5_amount Real)
(declare-const loan_evidence_provided Bool)
(declare-const loan_other_credit_bad Bool)
(declare-const loan_overdue_months Int)
(declare-const loan_secured_sufficient Bool)
(declare-const loan_unrecoverable Bool)
(declare-const loan_without_board_approval Bool)
(declare-const loan_without_sufficient_collateral Bool)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const prepaid_premium Real)
(declare-const real_estate_investment_limit_ok Bool)
(declare-const real_estate_investment_social_housing_exception Bool)
(declare-const real_estate_valuation_legal Bool)
(declare-const self_use_real_estate_investment Bool)
(declare-const social_housing_only_rental Bool)
(declare-const total_real_estate_investment Real)
(declare-const unsecured_overdue_loan_amount Real)
(declare-const violation_138_1_3_5 Bool)
(declare-const violation_138_2_2_4_5_7_138_3_1_2_3 Bool)
(declare-const violation_138_2_related_reserve Bool)
(declare-const violation_138_business_scope Bool)
(declare-const violation_143 Bool)
(declare-const violation_143_5_and_measures Bool)
(declare-const violation_143_5_or_measures_true Bool)
(declare-const violation_143_true Bool)
(declare-const violation_146_1_1_2_3_5 Bool)
(declare-const violation_146_1_3_5_6_7_8 Bool)
(declare-const violation_146_1_investment Bool)
(declare-const violation_146_2_1_2_4 Bool)
(declare-const violation_146_2_real_estate Bool)
(declare-const violation_146_3 Bool)
(declare-const violation_146_3_1_2_4 Bool)
(declare-const violation_146_4 Bool)
(declare-const violation_146_4_1_2_3 Bool)
(declare-const violation_146_5 Bool)
(declare-const violation_146_5_1_unapproved Bool)
(declare-const violation_146_5_3_4 Bool)
(declare-const violation_146_5_later Bool)
(declare-const violation_146_5_later_investment Bool)
(declare-const violation_146_5_unapproved_investment Bool)
(declare-const violation_146_6_1_2_3 Bool)
(declare-const violation_146_6_reporting Bool)
(declare-const violation_146_7_1_3 Bool)
(declare-const violation_146_7_loan_limit Bool)
(declare-const violation_146_9 Bool)
(declare-const violation_146_9_1_2_3 Bool)
(declare-const violation_146_related_fund_use Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_138_business_scope] 違反138條第1、3、5項業務範圍規定
(assert (= violation_138_business_scope violation_138_1_3_5))

; [insurance:violation_138_2_related_reserve] 違反138條之2第2、4、5、7項及138條之3第1、2、3項賠償準備金提存額度及方式規定
(assert (= violation_138_2_related_reserve violation_138_2_2_4_5_7_138_3_1_2_3))

; [insurance:violation_143] 違反143條規定
(assert (= violation_143 violation_143_true))

; [insurance:violation_143_5_and_measures] 違反143條之5或主管機關依143條之6規定措施
(assert (= violation_143_5_and_measures violation_143_5_or_measures_true))

; [insurance:violation_146_related_fund_use] 違反146條第1、3、5、6、7項及8項衍生性商品交易規定
(assert (= violation_146_related_fund_use violation_146_1_3_5_6_7_8))

; [insurance:violation_146_1_investment] 違反146條之一第1、2、3、5項投資條件及規範
(assert (= violation_146_1_investment violation_146_1_1_2_3_5))

; [insurance:violation_146_5] 違反146條之五第3、4項規定
(assert (= violation_146_5 violation_146_5_3_4))

; [insurance:violation_146_2_real_estate] 違反146條之二第1、2、4項不動產投資條件限制
(assert (= violation_146_2_real_estate violation_146_2_1_2_4))

; [insurance:violation_146_3] 違反146條之三第1、2、4項規定
(assert (= violation_146_3 violation_146_3_1_2_4))

; [insurance:violation_146_4] 違反146條之四第1、2、3項投資規範及額度
(assert (= violation_146_4 violation_146_4_1_2_3))

; [insurance:violation_146_5_unapproved_investment] 違反146條之五第1項前段未經核准投資或文件程序不備
(assert (= violation_146_5_unapproved_investment violation_146_5_1_unapproved))

; [insurance:violation_146_5_later_investment] 違反146條之五後段運用、投資範圍或限額規定
(assert (= violation_146_5_later_investment violation_146_5_later))

; [insurance:violation_146_6_reporting] 違反146條之六第1、2、3項投資申報方式
(assert (= violation_146_6_reporting violation_146_6_1_2_3))

; [insurance:violation_146_9] 違反146條之九第1、2、3項規定
(assert (= violation_146_9 violation_146_9_1_2_3))

; [insurance:loan_without_sufficient_collateral] 依146條之三第3項或146條之八第1項放款無十足擔保或條件優於同類放款
(assert (= loan_without_sufficient_collateral loan_146_3_3_or_146_8_1_unsecured))

; [insurance:loan_without_board_approval] 擔保放款達規定金額未經董事會三分之二出席及四分之三同意或違反放款限額規定
(assert (= loan_without_board_approval loan_146_3_3_or_146_8_1_no_board_approval))

; [insurance:violation_146_7_loan_limit] 違反146條之七第1項放款或其他交易限額及第3項決議程序或限額規定
(assert (= violation_146_7_loan_limit violation_146_7_1_3))

; [insurance:real_estate_investment_limit_ok] 不動產投資符合146-2條規定限制
(assert (let ((a!1 (<= (+ total_real_estate_investment
                  (* (- 1.0) (ite self_use_real_estate_investment 1.0 0.0)))
               (* (/ 3.0 10.0) capital_fund))))
  (= real_estate_investment_limit_ok
     (and a!1
          (>= owner_equity (ite self_use_real_estate_investment 1.0 0.0))
          real_estate_valuation_legal))))

; [insurance:real_estate_investment_social_housing_exception] 依住宅法興辦社會住宅且僅供租賃者不受即時利用限制
(assert (= real_estate_investment_social_housing_exception social_housing_only_rental))

; [insurance:loan_asset_classification_attention] 放款資產分類為應予注意
(assert (= loan_asset_classification_attention
   (or loan_other_credit_bad
       (and (<= 1 loan_overdue_months)
            (>= 12 loan_overdue_months)
            loan_secured_sufficient)
       (and (<= 1 loan_overdue_months)
            (>= 3 loan_overdue_months)
            (not loan_secured_sufficient)))))

; [insurance:loan_asset_classification_recoverable] 放款資產分類為可望收回
(assert (= loan_asset_classification_recoverable
   (or (and (<= 12 loan_overdue_months) loan_secured_sufficient)
       (and (<= 3 loan_overdue_months)
            (>= 6 loan_overdue_months)
            (not loan_secured_sufficient)))))

; [insurance:loan_asset_classification_difficult_recovery] 放款資產分類為收回困難
(assert (= loan_asset_classification_difficult_recovery
   (and (<= 6 loan_overdue_months)
        (>= 12 loan_overdue_months)
        (not loan_secured_sufficient))))

; [insurance:loan_asset_classification_no_recovery] 放款資產分類為收回無望
(assert (= loan_asset_classification_no_recovery
   (or loan_unrecoverable
       (and (<= 12 loan_overdue_months) (not loan_secured_sufficient)))))

; [insurance:loan_asset_classification_not_first_class] 協議分期償還放款資產不得列為第一類
(assert (not (= loan_asset_classification_first_class
        loan_asset_classification_not_first_class)))

; [insurance:loan_asset_classification_evidence_provided] 協議分期償還放款資產提供相關佐證資料
(assert (= loan_asset_classification_evidence_provided loan_evidence_provided))

; [insurance:loan_allowance_minimum_met] 備抵呆帳金額符合最低標準
(assert (let ((a!1 (or (>= allowance_amount
                   (+ (* (/ 1.0 200.0) loan_class_1_amount)
                      (* (- (/ 1.0 200.0)) life_insurance_loan)
                      (* (- (/ 1.0 200.0)) prepaid_premium)
                      (* (- (/ 1.0 200.0)) gov_claim)
                      (* (/ 1.0 50.0) loan_class_2_amount)
                      (* (/ 1.0 10.0) loan_class_3_amount)
                      (* (/ 1.0 2.0) loan_class_4_amount)
                      loan_class_5_amount))
               (>= allowance_amount
                   (+ (* (/ 1.0 100.0) loan_class_1_amount)
                      (* (- (/ 1.0 100.0)) life_insurance_loan)
                      (* (- (/ 1.0 100.0)) prepaid_premium)
                      (* (- (/ 1.0 100.0)) gov_claim)
                      (* (/ 1.0 100.0) loan_class_2_amount)
                      (* (/ 1.0 100.0) loan_class_3_amount)
                      (* (/ 1.0 100.0) loan_class_4_amount)
                      (* (/ 1.0 100.0) loan_class_5_amount)))
               (>= allowance_amount unsecured_overdue_loan_amount))))
  (= loan_allowance_minimum_met a!1)))

; [insurance:loan_allowance_minimum_gaap] 備抵呆帳金額不得低於一般公認會計原則評估數額
(assert (= loan_allowance_minimum_gaap
   (ite (>= allowance_amount allowance_gaap_amount) 1.0 0.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or violation_146_related_fund_use
       violation_143_5_and_measures
       violation_146_5
       loan_without_sufficient_collateral
       violation_146_4
       violation_138_business_scope
       violation_146_3
       violation_146_6_reporting
       violation_146_9
       violation_138_2_related_reserve
       violation_146_5_unapproved_investment
       violation_146_1_investment
       violation_146_7_loan_limit
       violation_146_5_later_investment
       violation_143
       violation_146_2_real_estate
       loan_without_board_approval)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_146_2_1_2_4 true))
(assert (= violation_146_2_real_estate true))
(assert (= violation_146_related_fund_use true))
(assert (= penalty true))
(assert (= violation_138_1_3_5 false))
(assert (= violation_138_2_2_4_5_7_138_3_1_2_3 false))
(assert (= violation_138_2_related_reserve false))
(assert (= violation_138_business_scope false))
(assert (= violation_143 false))
(assert (= violation_143_true false))
(assert (= violation_143_5_or_measures_true false))
(assert (= violation_143_5_and_measures false))
(assert (= violation_146_1_1_2_3_5 false))
(assert (= violation_146_1_investment false))
(assert (= violation_146_5_3_4 false))
(assert (= violation_146_5 false))
(assert (= violation_146_5_1_unapproved false))
(assert (= violation_146_5_unapproved_investment false))
(assert (= violation_146_5_later false))
(assert (= violation_146_5_later_investment false))
(assert (= violation_146_3_1_2_4 false))
(assert (= violation_146_3 false))
(assert (= violation_146_4_1_2_3 false))
(assert (= violation_146_4 false))
(assert (= violation_146_6_1_2_3 false))
(assert (= violation_146_6_reporting false))
(assert (= violation_146_9_1_2_3 false))
(assert (= violation_146_9 false))
(assert (= loan_146_3_3_or_146_8_1_unsecured false))
(assert (= loan_without_sufficient_collateral false))
(assert (= loan_146_3_3_or_146_8_1_no_board_approval false))
(assert (= loan_without_board_approval false))
(assert (= allowance_amount 0.0))
(assert (= allowance_gaap_amount 0.0))
(assert (= capital_fund 0.0))
(assert (= gov_claim 0.0))
(assert (= life_insurance_loan 0.0))
(assert (= loan_allowance_minimum_gaap 0.0))
(assert (= loan_allowance_minimum_met false))
(assert (= loan_asset_classification_attention false))
(assert (= loan_asset_classification_difficult_recovery false))
(assert (= loan_asset_classification_evidence_provided false))
(assert (= loan_asset_classification_first_class false))
(assert (= loan_asset_classification_no_recovery false))
(assert (= loan_asset_classification_not_first_class false))
(assert (= loan_asset_classification_recoverable false))
(assert (= loan_class_1_amount 0.0))
(assert (= loan_class_2_amount 0.0))
(assert (= loan_class_3_amount 0.0))
(assert (= loan_class_4_amount 0.0))
(assert (= loan_class_5_amount 0.0))
(assert (= loan_evidence_provided false))
(assert (= loan_other_credit_bad false))
(assert (= loan_overdue_months 0))
(assert (= loan_secured_sufficient false))
(assert (= loan_unrecoverable false))
(assert (= owner_equity 0.0))
(assert (= prepaid_premium 0.0))
(assert (= real_estate_investment_limit_ok false))
(assert (= real_estate_investment_social_housing_exception false))
(assert (= real_estate_valuation_legal false))
(assert (= self_use_real_estate_investment false))
(assert (= social_housing_only_rental false))
(assert (= total_real_estate_investment 0.0))
(assert (= unsecured_overdue_loan_amount 0.0))
(assert (= violation_146_1_3_5_6_7_8 false))
(assert (= violation_146_7_1_3 false))
(assert (= violation_146_7_loan_limit false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 29
; Total variables: 68
; Total facts: 68
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
