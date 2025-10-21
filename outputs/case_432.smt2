; SMT2 file generated from compliance case automatic
; Case ID: case_432
; Generated at: 2025-10-21T09:42:17.837687
;
; This file can be executed with Z3:
;   z3 case_432.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_flag Bool)
(declare-const bonds_investment_equity_per_company Real)
(declare-const bonds_investment_per_company Real)
(declare-const bonds_investment_total Real)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_4_penalty_condition Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severely_insufficient Bool)
(declare-const capital_level_significantly_insufficient Bool)
(declare-const company_equity Real)
(declare-const company_total_shares Int)
(declare-const financial_bonds_investment_amount Real)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_deterioration_flag Bool)
(declare-const foreign_investment_exclusion_approved_foreign_currency_insurance Bool)
(declare-const foreign_investment_exclusion_approved_foreign_insurance_related_investment Bool)
(declare-const foreign_investment_exclusion_domestic_foreign_currency_securities Bool)
(declare-const foreign_investment_exclusion_other_approved_items Bool)
(declare-const foreign_investment_exclusions Bool)
(declare-const foreign_investment_limit Real)
(declare-const foreign_investment_limit_net Real)
(declare-const foreign_investment_total Real)
(declare-const fund_investment_per_issued Real)
(declare-const fund_investment_total Real)
(declare-const fund_total_issued Int)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_flag Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_overdue Bool)
(declare-const improvement_plan_submitted_and_executed Bool)
(declare-const insurance_or_representative_assigns_manager Bool)
(declare-const insurance_or_representative_exercises_voting_rights Bool)
(declare-const insurance_or_representative_is_director Bool)
(declare-const insurance_or_representative_is_trust_supervisor Bool)
(declare-const insurance_or_representative_participates_in_management Bool)
(declare-const investment_limit_bonds_per_company Real)
(declare-const investment_limit_bonds_per_company_equity Real)
(declare-const investment_limit_financial_bonds Real)
(declare-const investment_limit_fund_per_issued Real)
(declare-const investment_limit_fund_total Real)
(declare-const investment_limit_securitized_and_others Real)
(declare-const investment_limit_stock_and_bonds_total Real)
(declare-const investment_limit_stock_per_company Real)
(declare-const investment_limit_stock_per_company_shares Int)
(declare-const investment_prohibited_conditions Bool)
(declare-const investment_prohibited_conditions_invalid Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const securitized_and_others_investment_total Real)
(declare-const stock_investment_per_company Real)
(declare-const stock_investment_shares_per_company Int)
(declare-const stock_investment_total Real)
(declare-const supervisory_measures_needed Bool)
(declare-const total_funds Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

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

; [insurance:capital_level_severely_insufficient] 資本等級為嚴重不足
(assert (= capital_level_severely_insufficient (= 4 capital_level)))

; [insurance:capital_level_significantly_insufficient] 資本等級為顯著不足
(assert (= capital_level_significantly_insufficient (= 3 capital_level)))

; [insurance:capital_level_insufficient] 資本等級為不足
(assert (= capital_level_insufficient (= 2 capital_level)))

; [insurance:capital_level_adequate] 資本等級為適足
(assert (= capital_level_adequate (= 1 capital_level)))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限內完成
(assert (= improvement_plan_completed improvement_plan_submitted_and_executed))

; [insurance:improvement_plan_overdue] 未於主管機關規定期限內完成增資、財務或業務改善計畫或合併
(assert (not (= improvement_plan_completed improvement_plan_overdue)))

; [insurance:capital_level_4_penalty_condition] 資本嚴重不足且未於期限完成改善計畫
(assert (= capital_level_4_penalty_condition
   (and capital_level_severely_insufficient improvement_plan_overdue)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration financial_or_business_deterioration_flag))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_flag))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值呈現加速惡化或經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration accelerated_deterioration_flag))

; [insurance:supervisory_measures_needed] 因財務或業務惡化，主管機關得為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_needed
   (or (<= 1 (ite capital_level_4_penalty_condition 1 0))
       (and financial_or_business_deterioration
            improvement_plan_approved
            improvement_plan_accelerated_deterioration))))

; [insurance:investment_limit_financial_bonds] 金融債券等投資不得超過資金35%
(assert (= investment_limit_financial_bonds
   (ite (<= financial_bonds_investment_amount (* (/ 7.0 20.0) total_funds))
        1.0
        0.0)))

; [insurance:investment_limit_stock_per_company] 每一公司股票投資不得超過資金5%
(assert (= investment_limit_stock_per_company
   (ite (<= stock_investment_per_company (* (/ 1.0 20.0) total_funds)) 1.0 0.0)))

; [insurance:investment_limit_stock_per_company_shares] 每一公司股票投資不得超過該公司已發行股份總數10%
(assert (let ((a!1 (ite (<= (to_real stock_investment_shares_per_company)
                    (* (/ 1.0 10.0) (to_real company_total_shares)))
                1
                0)))
  (= investment_limit_stock_per_company_shares a!1)))

; [insurance:investment_limit_bonds_per_company] 每一公司公司債及免保證商業本票投資不得超過資金5%
(assert (= investment_limit_bonds_per_company
   (ite (<= bonds_investment_per_company (* (/ 1.0 20.0) total_funds)) 1.0 0.0)))

; [insurance:investment_limit_bonds_per_company_equity] 每一公司公司債及免保證商業本票投資不得超過公司業主權益10%
(assert (= investment_limit_bonds_per_company_equity
   (ite (<= bonds_investment_equity_per_company (* (/ 1.0 10.0) company_equity))
        1.0
        0.0)))

; [insurance:investment_limit_fund_total] 證券投資信託基金及共同信託基金投資總額不得超過資金10%
(assert (= investment_limit_fund_total
   (ite (<= fund_investment_total (* (/ 1.0 10.0) total_funds)) 1.0 0.0)))

; [insurance:investment_limit_fund_per_issued] 每一基金受益憑證投資不得超過已發行受益憑證總額10%
(assert (let ((a!1 (ite (<= fund_investment_per_issued
                    (* (/ 1.0 10.0) (to_real fund_total_issued)))
                1.0
                0.0)))
  (= investment_limit_fund_per_issued a!1)))

; [insurance:investment_limit_securitized_and_others] 證券化商品及其他核准有價證券投資總額不得超過資金10%
(assert (= investment_limit_securitized_and_others
   (ite (<= securitized_and_others_investment_total
            (* (/ 1.0 10.0) total_funds))
        1.0
        0.0)))

; [insurance:investment_limit_stock_and_bonds_total] 第三款及第四款投資總額不得超過資金35%
(assert (= investment_limit_stock_and_bonds_total
   (ite (<= (+ stock_investment_total bonds_investment_total)
            (* (/ 7.0 20.0) total_funds))
        1.0
        0.0)))

; [insurance:investment_prohibited_conditions] 不得以保險業或代表人擔任被投資公司董事、監察人等情事
(assert (not (= (or insurance_or_representative_is_director
            insurance_or_representative_participates_in_management
            insurance_or_representative_assigns_manager
            insurance_or_representative_is_trust_supervisor
            insurance_or_representative_exercises_voting_rights)
        investment_prohibited_conditions)))

; [insurance:investment_prohibited_conditions_invalid] 違反投資禁止情事者相關行為無效
(assert (not (= investment_prohibited_conditions
        investment_prohibited_conditions_invalid)))

; [insurance:foreign_investment_limit] 國外投資總額不得超過資金45%
(assert (= foreign_investment_limit
   (ite (<= foreign_investment_total (* (/ 9.0 20.0) total_funds)) 1.0 0.0)))

; [insurance:foreign_investment_exclusions] 不計入國外投資限額之金額
(assert (= (ite foreign_investment_exclusions 1 0)
   (+ (ite foreign_investment_exclusion_approved_foreign_currency_insurance 1 0)
      (ite foreign_investment_exclusion_domestic_foreign_currency_securities
           1
           0)
      (ite foreign_investment_exclusion_approved_foreign_insurance_related_investment
           1
           0)
      (ite foreign_investment_exclusion_other_approved_items 1 0))))

; [insurance:foreign_investment_limit_net] 國外投資淨額不得超過資金45%扣除不計入金額
(assert (let ((a!1 (<= (+ foreign_investment_total
                  (* (- 1.0) (ite foreign_investment_exclusions 1.0 0.0)))
               (* (/ 9.0 20.0) total_funds))))
  (= foreign_investment_limit_net (ite a!1 1.0 0.0))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未於期限完成改善計畫，或財務業務惡化且未改善，或違反投資限制及禁止情事時處罰
(assert (= penalty
   (or (not (= investment_limit_fund_total 1.0))
       (not (= foreign_investment_limit_net 1.0))
       (not (= investment_limit_stock_per_company_shares 1))
       (not (= investment_limit_bonds_per_company 1.0))
       (not (= investment_limit_stock_per_company 1.0))
       (not (= investment_limit_financial_bonds 1.0))
       capital_level_4_penalty_condition
       (not (= investment_limit_bonds_per_company_equity 1.0))
       (not investment_prohibited_conditions)
       (and (not capital_level_4_penalty_condition)
            financial_or_business_deterioration
            improvement_plan_approved
            improvement_plan_accelerated_deterioration)
       (not (= investment_limit_securitized_and_others 1.0))
       (not (= investment_limit_fund_per_issued 1.0))
       (not (= investment_limit_stock_and_bonds_total 1.0)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 180.0))
(assert (= net_worth 5000000))
(assert (= net_worth_ratio 5.0))
(assert (= improvement_plan_submitted_and_executed false))
(assert (= accelerated_deterioration_flag false))
(assert (= improvement_plan_approved_flag false))
(assert (= financial_or_business_deterioration_flag false))
(assert (= insurance_or_representative_exercises_voting_rights true))
(assert (= investment_limit_financial_bonds 1.0))
(assert (= investment_limit_stock_per_company 1.0))
(assert (= investment_limit_stock_per_company_shares 1))
(assert (= investment_limit_bonds_per_company 1.0))
(assert (= investment_limit_bonds_per_company_equity 1.0))
(assert (= investment_limit_fund_total 1.0))
(assert (= investment_limit_fund_per_issued 1.0))
(assert (= investment_limit_securitized_and_others 1.0))
(assert (= investment_limit_stock_and_bonds_total 1.0))
(assert (= foreign_investment_total 40.0))
(assert (= foreign_investment_exclusion_approved_foreign_currency_insurance false))
(assert (= foreign_investment_exclusion_domestic_foreign_currency_securities false))
(assert (= foreign_investment_exclusion_approved_foreign_insurance_related_investment false))
(assert (= foreign_investment_exclusion_other_approved_items false))
(assert (= total_funds 100000000))
(assert (= stock_investment_per_company 2.0))
(assert (= stock_investment_shares_per_company 500000))
(assert (= company_total_shares 10000000))
(assert (= bonds_investment_per_company 2.0))
(assert (= bonds_investment_equity_per_company 2.0))
(assert (= company_equity 100000000))
(assert (= fund_investment_total 5.0))
(assert (= fund_investment_per_issued 5.0))
(assert (= fund_total_issued 1000000))
(assert (= securitized_and_others_investment_total 5.0))
(assert (= foreign_investment_limit 45000000))
(assert (= foreign_investment_limit_net 40.0))
(assert (= insurance_or_representative_is_director false))
(assert (= insurance_or_representative_assigns_manager false))
(assert (= insurance_or_representative_is_trust_supervisor false))
(assert (= insurance_or_representative_participates_in_management false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 58
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
