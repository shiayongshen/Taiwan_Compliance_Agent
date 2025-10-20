; SMT2 file generated from compliance case automatic
; Case ID: case_324
; Generated at: 2025-10-19T13:11:36.454551
;
; This file can be executed with Z3:
;   z3 case_324.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_foreign_insurance_related_investment Real)
(declare-const approved_non_investment_foreign_currency_insurance Real)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_fund Real)
(declare-const capital_level Int)
(declare-const foreign_investment_approved_insurance_related Real)
(declare-const foreign_investment_exclusions Real)
(declare-const foreign_investment_foreign_currency_deposit Real)
(declare-const foreign_investment_foreign_securities Real)
(declare-const foreign_investment_limit Real)
(declare-const foreign_investment_other_approved Real)
(declare-const foreign_investment_types Int)
(declare-const full_guarantee Bool)
(declare-const guaranteed_loan_amount Real)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_established Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const investment_in_domestic_foreign_currency_securities Real)
(declare-const investment_in_securities Real)
(declare-const issuer_owner_equity Real)
(declare-const legal_valuation_done Bool)
(declare-const level_2_measures_executed Bool)
(declare-const level_3_measures_completed Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_completed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const loan_guarantee_approval Bool)
(declare-const loan_guarantee_condition Bool)
(declare-const loan_investment_combined_limit Real)
(declare-const loan_secured_by_securities Bool)
(declare-const loan_type_limit_per_unit Real)
(declare-const loan_type_limit_total Real)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const no_better_terms_than_others Bool)
(declare-const other_approved_exclusions Real)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const real_estate_immediate_use_and_income Real)
(declare-const real_estate_immediate_use_and_income_confirmed Bool)
(declare-const real_estate_immediate_use_exemption Bool)
(declare-const real_estate_investment_limit Real)
(declare-const real_estate_legal_valuation Bool)
(declare-const regulatory_threshold Real)
(declare-const related_party_loan_limit_and_approval Bool)
(declare-const self_use_real_estate_investment Real)
(declare-const single_loan_amount Real)
(declare-const social_housing_only_rental Bool)
(declare-const total_foreign_investment Real)
(declare-const total_loan_amount Real)
(declare-const total_real_estate_investment Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:real_estate_investment_limit] 不動產投資總額除自用不動產外不得超過資金30%，自用不動產不得超過業主權益總額
(assert (let ((a!1 (and (<= (+ total_real_estate_investment
                       (* (- 1.0) self_use_real_estate_investment))
                    (* 30.0 capital_fund))
                (<= self_use_real_estate_investment owner_equity))))
  (= real_estate_investment_limit (ite a!1 1.0 0.0))))

; [insurance:real_estate_legal_valuation] 不動產取得及處分應經合法不動產鑑價機構評價
(assert (= real_estate_legal_valuation legal_valuation_done))

; [insurance:real_estate_immediate_use_exemption] 依住宅法興辦社會住宅且僅供租賃者，不受即時利用並有收益限制
(assert (= real_estate_immediate_use_exemption social_housing_only_rental))

; [insurance:real_estate_immediate_use_and_income] 不動產投資以即時利用並有收益者為限（除社會住宅外）
(assert (= real_estate_immediate_use_and_income
   (ite (or real_estate_immediate_use_exemption
            real_estate_immediate_use_and_income_confirmed)
        1.0
        0.0)))

; [insurance:loan_type_limit_per_unit] 第一款至第三款放款每一單位放款金額不得超過資金5%
(assert (= loan_type_limit_per_unit
   (ite (<= single_loan_amount (* 5.0 capital_fund)) 1.0 0.0)))

; [insurance:loan_type_limit_total] 第一款至第三款放款總額不得超過資金35%
(assert (= loan_type_limit_total
   (ite (<= total_loan_amount (* 35.0 capital_fund)) 1.0 0.0)))

; [insurance:loan_guarantee_condition] 對負責人、職員或主要股東等利害關係人擔保放款應有十足擔保且條件不得優於其他同類放款
(assert (= loan_guarantee_condition (and full_guarantee no_better_terms_than_others)))

; [insurance:loan_guarantee_approval] 擔保放款達主管機關規定金額以上，應經三分之二以上董事出席及四分之三以上同意
(assert (= loan_guarantee_approval
   (or (not (>= guaranteed_loan_amount regulatory_threshold))
       (and (<= (/ 6666667.0 10000000.0) board_attendance_ratio)
            (<= (/ 3.0 4.0) board_approval_ratio)))))

; [insurance:loan_investment_combined_limit] 有價證券投資與以該公司有價證券為質放款合併計算不得超過資金10%及公司業主權益10%
(assert (let ((a!1 (and (<= (+ investment_in_securities
                       (ite loan_secured_by_securities 1.0 0.0))
                    (* 10.0 capital_fund))
                (<= (+ investment_in_securities
                       (ite loan_secured_by_securities 1.0 0.0))
                    (* 10.0 issuer_owner_equity)))))
  (= loan_investment_combined_limit (ite a!1 1.0 0.0))))

; [insurance:foreign_investment_types] 國外投資限於外匯存款、國外有價證券、核准保險相關事業及其他核准投資
(assert (= foreign_investment_types
   (ite (or (= foreign_investment_other_approved 1.0)
            (= foreign_investment_foreign_securities 1.0)
            (= foreign_investment_foreign_currency_deposit 1.0)
            (= foreign_investment_approved_insurance_related 1.0))
        1
        0)))

; [insurance:foreign_investment_limit] 國外投資總額最高不得超過資金45%，特定項目金額不計入限額
(assert (= foreign_investment_limit
   (ite (<= total_foreign_investment (* 45.0 capital_fund)) 1.0 0.0)))

; [insurance:foreign_investment_exclusions] 不計入國外投資限額之金額包括核准銷售非投資型外幣保險商品、國內外幣計價股權債券憑證、核准國外保險相關事業及其他核准項目
(assert (= foreign_investment_exclusions
   (ite (and (= approved_non_investment_foreign_currency_insurance 1.0)
             (= investment_in_domestic_foreign_currency_securities 1.0)
             (= approved_foreign_insurance_related_investment 1.0)
             (= other_approved_exclusions 1.0))
        1.0
        0.0)))

; [insurance:related_party_loan_limit_and_approval] 對負責人、職員或主要股東等利害關係人擔保放款應有十足擔保且條件不得優於其他同類放款，達規定金額以上須董事會同意
(assert (= related_party_loan_limit_and_approval
   (and loan_guarantee_condition loan_guarantee_approval)))

; [insurance:internal_control_and_audit_established] 建立內部控制及稽核制度
(assert (= internal_control_and_audit_established internal_control_established))

; [insurance:internal_handling_system_established] 建立內部處理制度及程序
(assert (= internal_handling_system_established internal_handling_established))

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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:level_4_measures_executed] 資本嚴重不足等級4措施已執行
(assert (= level_4_measures_executed level_4_measures_completed))

; [insurance:level_3_measures_executed] 資本顯著不足等級3措施已執行
(assert (= level_3_measures_executed level_3_measures_completed))

; [insurance:level_2_measures_executed] 資本不足等級2措施已執行
(assert (= level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反不動產投資限制或未經合法鑑價或不符放款擔保條件或未建立內部控制及稽核制度或資本不足且未執行對應措施時處罰
(assert (= penalty
   (or (and (= 2 capital_level) (not level_2_measures_executed))
       (not real_estate_legal_valuation)
       (and (= 3 capital_level) (not level_3_measures_executed))
       (not (= real_estate_investment_limit 1.0))
       (and (= 4 capital_level) (not level_4_measures_executed))
       (not loan_guarantee_condition)
       (not internal_control_and_audit_established))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 1000000000.0))
(assert (= net_worth_ratio 10.0))
(assert (= capital_fund 2000000000.0))
(assert (= total_real_estate_investment 500000000.0))
(assert (= self_use_real_estate_investment 300000000.0))
(assert (= owner_equity 400000000.0))
(assert (= legal_valuation_done false))
(assert (= social_housing_only_rental false))
(assert (= real_estate_immediate_use_and_income_confirmed false))
(assert (= total_loan_amount 0.0))
(assert (= single_loan_amount 0.0))
(assert (= full_guarantee false))
(assert (= no_better_terms_than_others false))
(assert (= guaranteed_loan_amount 0.0))
(assert (= regulatory_threshold 10000000.0))
(assert (= board_attendance_ratio 0.0))
(assert (= board_approval_ratio 0.0))
(assert (= investment_in_securities 0.0))
(assert (= loan_secured_by_securities false))
(assert (= issuer_owner_equity 0.0))
(assert (= approved_non_investment_foreign_currency_insurance 0.0))
(assert (= investment_in_domestic_foreign_currency_securities 0.0))
(assert (= approved_foreign_insurance_related_investment 0.0))
(assert (= other_approved_exclusions 0.0))
(assert (= foreign_investment_foreign_currency_deposit 1.0))
(assert (= foreign_investment_foreign_securities 0.0))
(assert (= foreign_investment_approved_insurance_related 0.0))
(assert (= foreign_investment_other_approved 0.0))
(assert (= total_foreign_investment 1000000000.0))
(assert (= internal_control_established false))
(assert (= internal_handling_established true))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= level_4_measures_completed false))
(assert (= level_3_measures_completed false))
(assert (= level_4_measures_executed false))
(assert (= level_3_measures_executed false))
(assert (= level_2_measures_executed false))
(assert (= loan_guarantee_condition false))
(assert (= loan_guarantee_approval false))
(assert (= capital_level 0))
(assert (= foreign_investment_exclusions 0.0))
(assert (= foreign_investment_limit 0.0))
(assert (= foreign_investment_types 0))
(assert (= internal_control_and_audit_established false))
(assert (= internal_handling_system_established false))
(assert (= loan_investment_combined_limit 0.0))
(assert (= loan_type_limit_per_unit 0.0))
(assert (= loan_type_limit_total 0.0))
(assert (= penalty false))
(assert (= real_estate_immediate_use_and_income 0.0))
(assert (= real_estate_immediate_use_exemption false))
(assert (= real_estate_investment_limit 0.0))
(assert (= real_estate_legal_valuation false))
(assert (= related_party_loan_limit_and_approval false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 56
; Total facts: 56
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
