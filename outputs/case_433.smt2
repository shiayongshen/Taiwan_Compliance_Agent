; SMT2 file generated from compliance case automatic
; Case ID: case_433
; Generated at: 2025-10-21T09:45:19.326787
;
; This file can be executed with Z3:
;   z3 case_433.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_or_no_improvement Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_severe_insufficient Bool)
(declare-const company_bonds_investment_amount_per_company Real)
(declare-const company_equity_per_company Real)
(declare-const company_stock_investment_amount_per_company Real)
(declare-const company_stock_investment_shares_per_company Int)
(declare-const company_stock_investment_total Real)
(declare-const contract_commitment_limit Real)
(declare-const financial_bonds_investment_amount Real)
(declare-const financial_or_business_deterioration Bool)
(declare-const foreign_investment_exclusion_approved_foreign_currency_insurance Bool)
(declare-const foreign_investment_exclusion_approved_foreign_insurance_related Bool)
(declare-const foreign_investment_exclusion_domestic_foreign_currency_securities Bool)
(declare-const foreign_investment_exclusion_other_approved Bool)
(declare-const foreign_investment_exclusions Bool)
(declare-const foreign_investment_limit Real)
(declare-const foreign_investment_total Real)
(declare-const fund_investment_total Real)
(declare-const fund_investment_units_per_fund Int)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_overdue Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const insurance_or_representative_director Bool)
(declare-const insurance_or_representative_management_participation Bool)
(declare-const insurance_or_representative_manager_appointment Bool)
(declare-const insurance_or_representative_supervisor Bool)
(declare-const insurance_or_representative_trust_supervisor Bool)
(declare-const insurance_or_representative_voting_rights Bool)
(declare-const investment_invalid_roles Bool)
(declare-const investment_limit_company_bonds_per_company Real)
(declare-const investment_limit_company_bonds_per_company_equity Real)
(declare-const investment_limit_company_stock_per_company Real)
(declare-const investment_limit_company_stock_per_company_shares Int)
(declare-const investment_limit_financial_bonds Real)
(declare-const investment_limit_fund_per_issued_units Real)
(declare-const investment_limit_fund_total Real)
(declare-const investment_limit_securitized_products Real)
(declare-const investment_limit_stock_and_securitized_total Real)
(declare-const investment_prohibited_roles Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const no_improvement_after_guidance Bool)
(declare-const other_major_financial_matters_restricted Bool)
(declare-const payment_limit Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const securitized_products_investment_total Real)
(declare-const supervision_contract_commitment_limit Real)
(declare-const supervision_payment_limit Real)
(declare-const supervisory_measures_required Bool)
(declare-const supervisory_restrictions Bool)
(declare-const total_funds Real)
(declare-const total_issued_units_per_fund Int)
(declare-const total_shares_issued_per_company Int)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const under_supervision Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級為嚴重不足
(assert (not (= (<= 2 capital_level) capital_level_severe_insufficient)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未定義）
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

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限內完成
(assert (= improvement_plan_completed improvement_plan_submitted))

; [insurance:improvement_plan_overdue] 資本嚴重不足且未於期限內完成增資、財務或業務改善計畫或合併
(assert (= improvement_plan_overdue
   (and (= 4 capital_level) (not improvement_plan_completed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or risk_to_insured_interest unable_to_fulfill_contract unable_to_pay_debt)))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_submitted))

; [insurance:accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= accelerated_deterioration_or_no_improvement
   (or no_improvement_after_guidance profit_loss_accelerated_deterioration)))

; [insurance:supervisory_measures_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (let ((a!1 (or (and (= 4 capital_level) (not improvement_plan_completed))
               (and (not (= 4 capital_level))
                    financial_or_business_deterioration
                    improvement_plan_approved
                    accelerated_deterioration_or_no_improvement))))
  (= supervisory_measures_required a!1)))

; [insurance:supervisory_restrictions] 監管處分限制保險業行為
(assert (= supervisory_restrictions
   (and under_supervision
        (or (<= payment_limit supervision_payment_limit)
            (<= contract_commitment_limit supervision_contract_commitment_limit)
            other_major_financial_matters_restricted))))

; [insurance:investment_limit_financial_bonds] 金融債券等投資不得超過資金35%
(assert (= investment_limit_financial_bonds
   (ite (<= (/ financial_bonds_investment_amount total_funds) (/ 7.0 20.0))
        1.0
        0.0)))

; [insurance:investment_limit_company_stock_per_company] 每一公司股票投資不得超過資金5%
(assert (= investment_limit_company_stock_per_company
   (ite (<= (/ company_stock_investment_amount_per_company total_funds)
            (/ 1.0 20.0))
        1.0
        0.0)))

; [insurance:investment_limit_company_stock_per_company_shares] 每一公司股票投資不得超過該公司已發行股份總數10%
(assert (let ((a!1 (ite (<= (to_real (div company_stock_investment_shares_per_company
                                  total_shares_issued_per_company))
                    (/ 1.0 10.0))
                1
                0)))
  (= investment_limit_company_stock_per_company_shares a!1)))

; [insurance:investment_limit_company_bonds_per_company] 每一公司公司債及免保證商業本票投資不得超過資金5%
(assert (= investment_limit_company_bonds_per_company
   (ite (<= (/ company_bonds_investment_amount_per_company total_funds)
            (/ 1.0 20.0))
        1.0
        0.0)))

; [insurance:investment_limit_company_bonds_per_company_equity] 每一公司公司債及免保證商業本票投資不得超過公司業主權益10%
(assert (= investment_limit_company_bonds_per_company_equity
   (ite (<= (/ company_bonds_investment_amount_per_company
               company_equity_per_company)
            (/ 1.0 10.0))
        1.0
        0.0)))

; [insurance:investment_limit_fund_total] 證券投資信託基金及共同信託基金投資總額不得超過資金10%
(assert (= investment_limit_fund_total
   (ite (<= (/ fund_investment_total total_funds) (/ 1.0 10.0)) 1.0 0.0)))

; [insurance:investment_limit_fund_per_issued_units] 每一基金受益憑證投資不得超過已發行受益憑證總額10%
(assert (let ((a!1 (ite (<= (to_real (div fund_investment_units_per_fund
                                  total_issued_units_per_fund))
                    (/ 1.0 10.0))
                1.0
                0.0)))
  (= investment_limit_fund_per_issued_units a!1)))

; [insurance:investment_limit_securitized_products] 證券化商品及其他核准有價證券投資總額不得超過資金10%
(assert (= investment_limit_securitized_products
   (ite (<= (/ securitized_products_investment_total total_funds) (/ 1.0 10.0))
        1.0
        0.0)))

; [insurance:investment_limit_stock_and_securitized_total] 第三款及第四款投資總額不得超過資金35%
(assert (let ((a!1 (ite (<= (/ (+ company_stock_investment_total
                          securitized_products_investment_total)
                       total_funds)
                    (/ 7.0 20.0))
                1.0
                0.0)))
  (= investment_limit_stock_and_securitized_total a!1)))

; [insurance:investment_prohibited_roles] 不得以保險業或代表人擔任被投資公司董事、監察人、行使表決權、指派經理人、擔任信託監察人或參與經營
(assert (not (= (or insurance_or_representative_management_participation
            insurance_or_representative_supervisor
            insurance_or_representative_director
            insurance_or_representative_voting_rights
            insurance_or_representative_trust_supervisor
            insurance_or_representative_manager_appointment)
        investment_prohibited_roles)))

; [insurance:investment_invalid_roles] 有禁止情事者相關行為無效
(assert (= investment_invalid_roles
   (or insurance_or_representative_management_participation
       insurance_or_representative_supervisor
       insurance_or_representative_director
       insurance_or_representative_voting_rights
       insurance_or_representative_trust_supervisor
       insurance_or_representative_manager_appointment)))

; [insurance:foreign_investment_limit] 國外投資總額不得超過資金45%
(assert (= foreign_investment_limit
   (ite (<= (/ foreign_investment_total total_funds) (/ 9.0 20.0)) 1.0 0.0)))

; [insurance:foreign_investment_exclusions] 國外投資限額不計入特定核准項目金額
(assert (= foreign_investment_exclusions
   (and foreign_investment_exclusion_approved_foreign_currency_insurance
        foreign_investment_exclusion_domestic_foreign_currency_securities
        foreign_investment_exclusion_approved_foreign_insurance_related
        foreign_investment_exclusion_other_approved)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未完成改善計畫或財務業務惡化未改善且未接受監管處分，或違反投資限制規定時處罰
(assert (= penalty
   (or (not (= investment_limit_financial_bonds 1.0))
       (and financial_or_business_deterioration
            (not improvement_plan_approved)
            (not supervisory_measures_required))
       (not investment_prohibited_roles)
       (not (= foreign_investment_limit 1.0))
       (not (= investment_limit_fund_per_issued_units 1.0))
       (not (= investment_limit_securitized_products 1.0))
       (not (= investment_limit_company_stock_per_company 1.0))
       (not (= investment_limit_company_stock_per_company_shares 1))
       (not (= investment_limit_company_bonds_per_company 1.0))
       (not (= investment_limit_stock_and_securitized_total 1.0))
       (not (= investment_limit_fund_total 1.0))
       (and (= 4 capital_level)
            (not improvement_plan_completed)
            (not supervisory_measures_required))
       (not (= investment_limit_company_bonds_per_company_equity 1.0)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -1000000.0))
(assert (= net_worth_ratio -10.0))
(assert (= capital_level 4))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_completed false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_approved false))
(assert (= accelerated_deterioration_or_no_improvement false))
(assert (= under_supervision true))
(assert (= other_major_financial_matters_restricted true))
(assert (= supervisory_restrictions true))
(assert (= insurance_or_representative_voting_rights true))
(assert (= investment_prohibited_roles false))
(assert (= investment_invalid_roles true))
(assert (= total_funds 1000000000.0))
(assert (= financial_bonds_investment_amount 400000000.0))
(assert (= investment_limit_financial_bonds 0.0))
(assert (= company_stock_investment_amount_per_company 60000000.0))
(assert (= investment_limit_company_stock_per_company 6.0))
(assert (= company_stock_investment_shares_per_company 1500000))
(assert (= total_shares_issued_per_company 10000000))
(assert (= investment_limit_company_stock_per_company_shares 15))
(assert (= company_bonds_investment_amount_per_company 60000000.0))
(assert (= company_equity_per_company 500000000.0))
(assert (= investment_limit_company_bonds_per_company 6.0))
(assert (= investment_limit_company_bonds_per_company_equity 12.0))
(assert (= fund_investment_total 200000000.0))
(assert (= investment_limit_fund_total 20.0))
(assert (= fund_investment_units_per_fund 1500000))
(assert (= total_issued_units_per_fund 10000000))
(assert (= investment_limit_fund_per_issued_units 15.0))
(assert (= securitized_products_investment_total 500000000.0))
(assert (= investment_limit_securitized_products 50.0))
(assert (= company_stock_investment_total 600000000.0))
(assert (= investment_limit_stock_and_securitized_total 50.0))
(assert (= foreign_investment_total 600000000.0))
(assert (= foreign_investment_limit 60.0))
(assert (= foreign_investment_exclusion_approved_foreign_currency_insurance true))
(assert (= foreign_investment_exclusion_domestic_foreign_currency_securities true))
(assert (= foreign_investment_exclusion_approved_foreign_insurance_related true))
(assert (= foreign_investment_exclusion_other_approved true))
(assert (= foreign_investment_exclusions true))
(assert (= insurance_or_representative_director false))
(assert (= insurance_or_representative_supervisor false))
(assert (= insurance_or_representative_manager_appointment false))
(assert (= insurance_or_representative_trust_supervisor false))
(assert (= insurance_or_representative_management_participation false))
(assert (= improvement_plan_overdue true))
(assert (= supervisory_measures_required true))
(assert (= penalty true))
(assert (= payment_limit 100000000.0))
(assert (= supervision_payment_limit 50000000.0))
(assert (= contract_commitment_limit 100000000.0))
(assert (= supervision_contract_commitment_limit 50000000.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 24
; Total variables: 61
; Total facts: 55
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
