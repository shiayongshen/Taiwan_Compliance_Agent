; SMT2 file generated from compliance case automatic
; Case ID: case_433
; Generated at: 2025-10-19T15:52:57.804108
;
; This file can be executed with Z3:
;   z3 case_433.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const appoint_person_as_manager Bool)
(declare-const bonds_and_commercial_paper_investment_per_company Real)
(declare-const bonds_and_commercial_paper_investment_total Real)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level_severe_insufficient Bool)
(declare-const capital_level_severe_insufficient_and_no_compliance Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const company_equity Real)
(declare-const company_issued_shares_total Int)
(declare-const exercise_voting_rights_for_director_or_supervisor Bool)
(declare-const financial_bonds_investment_amount Real)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const foreign_investment_exclusion_approved_foreign_insurance_related_investment Bool)
(declare-const foreign_investment_exclusion_approved_non_investment_life_insurance Bool)
(declare-const foreign_investment_exclusion_foreign_currency_securities Bool)
(declare-const foreign_investment_exclusion_other_approved_items Bool)
(declare-const foreign_investment_exclusions Bool)
(declare-const foreign_investment_limit Real)
(declare-const foreign_investment_total Real)
(declare-const fund_investment_per_fund Real)
(declare-const fund_investment_total Real)
(declare-const fund_issued_beneficiary_certificates Int)
(declare-const improvement_plan_executed_and_effective Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const insurance_or_representative_is_director_or_supervisor Bool)
(declare-const investment_limit_bonds_per_company Real)
(declare-const investment_limit_bonds_per_company_equity Real)
(declare-const investment_limit_financial_bonds Real)
(declare-const investment_limit_fund_per_issued Real)
(declare-const investment_limit_fund_total Real)
(declare-const investment_limit_securitized_and_others Real)
(declare-const investment_limit_stock_and_bonds_combined Real)
(declare-const investment_limit_stock_per_company Real)
(declare-const investment_limit_stock_per_company_shares Int)
(declare-const investment_prohibited_conditions Bool)
(declare-const investment_prohibited_conditions_invalidity Bool)
(declare-const merger_completed Bool)
(declare-const participate_in_management_agreement_or_authorization Bool)
(declare-const penalty Bool)
(declare-const penalty_trigger_severe Bool)
(declare-const penalty_trigger_significant_deterioration Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const securitized_and_other_investment_total Real)
(declare-const serve_as_trust_supervisor Bool)
(declare-const stock_investment_per_company Real)
(declare-const stock_investment_total Real)
(declare-const total_funds Real)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級為嚴重不足
(assert (not (= (<= 50.0 capital_adequacy_ratio) capital_level_severe_insufficient)))

; [insurance:capital_level_significant_deterioration] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= capital_level_significant_deterioration
   (or unable_to_pay_debt
       risk_to_insured_rights
       unable_to_fulfill_contract
       financial_or_business_deterioration)))

; [insurance:capital_level_severe_insufficient_and_no_compliance] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_severe_insufficient_and_no_compliance
   (and capital_level_severe_insufficient
        (not (or capital_increase_completed
                 financial_or_business_improvement_plan_completed
                 merger_completed)))))

; [insurance:penalty_trigger_severe] 資本嚴重不足且未完成增資、改善計畫或合併，應於期限屆滿次日起九十日內為接管、勒令停業清理或命令解散處分
(assert (= penalty_trigger_severe capital_level_severe_insufficient_and_no_compliance))

; [insurance:penalty_trigger_significant_deterioration] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞，且未提出核定改善計畫或改善未果
(assert (= penalty_trigger_significant_deterioration
   (and capital_level_significant_deterioration
        (not (or improvement_plan_submitted_and_approved
                 improvement_plan_executed_and_effective)))))

; [insurance:penalty_conditions] 處罰條件：違反資本嚴重不足未完成增資或改善計畫，或財務顯著惡化未提出或未改善計畫時處罰
(assert (= penalty
   (or penalty_trigger_severe penalty_trigger_significant_deterioration)))

; [insurance:investment_limit_financial_bonds] 金融債券等投資總額不得超過資金35%
(assert (= investment_limit_financial_bonds
   (ite (<= financial_bonds_investment_amount (* (/ 7.0 20.0) total_funds))
        1.0
        0.0)))

; [insurance:investment_limit_stock_per_company] 每一公司股票投資總額不得超過資金5%
(assert (= investment_limit_stock_per_company
   (ite (<= stock_investment_per_company (* (/ 1.0 20.0) total_funds)) 1.0 0.0)))

; [insurance:investment_limit_stock_per_company_shares] 每一公司股票投資總額不得超過該公司已發行股份總數10%
(assert (let ((a!1 (ite (<= stock_investment_per_company
                    (* (/ 1.0 10.0) (to_real company_issued_shares_total)))
                1
                0)))
  (= investment_limit_stock_per_company_shares a!1)))

; [insurance:investment_limit_bonds_per_company] 每一公司公司債及免保證商業本票投資總額不得超過資金5%
(assert (= investment_limit_bonds_per_company
   (ite (<= bonds_and_commercial_paper_investment_per_company
            (* (/ 1.0 20.0) total_funds))
        1.0
        0.0)))

; [insurance:investment_limit_bonds_per_company_equity] 每一公司公司債及免保證商業本票投資總額不得超過公司業主權益10%
(assert (= investment_limit_bonds_per_company_equity
   (ite (<= bonds_and_commercial_paper_investment_per_company
            (* (/ 1.0 10.0) company_equity))
        1.0
        0.0)))

; [insurance:investment_limit_fund_total] 證券投資信託基金及共同信託基金投資總額不得超過資金10%
(assert (= investment_limit_fund_total
   (ite (<= fund_investment_total (* (/ 1.0 10.0) total_funds)) 1.0 0.0)))

; [insurance:investment_limit_fund_per_issued] 每一基金受益憑證投資總額不得超過該基金已發行受益憑證總額10%
(assert (let ((a!1 (ite (<= fund_investment_per_fund
                    (* (/ 1.0 10.0)
                       (to_real fund_issued_beneficiary_certificates)))
                1.0
                0.0)))
  (= investment_limit_fund_per_issued a!1)))

; [insurance:investment_limit_securitized_and_others] 證券化商品及其他經主管機關核准有價證券投資總額不得超過資金10%
(assert (= investment_limit_securitized_and_others
   (ite (<= securitized_and_other_investment_total (* (/ 1.0 10.0) total_funds))
        1.0
        0.0)))

; [insurance:investment_limit_stock_and_bonds_combined] 第三款及第四款投資總額合計不得超過資金35%
(assert (= investment_limit_stock_and_bonds_combined
   (ite (<= (+ stock_investment_total
               bonds_and_commercial_paper_investment_total)
            (* (/ 7.0 20.0) total_funds))
        1.0
        0.0)))

; [insurance:investment_prohibited_conditions] 不得以保險業或代表人擔任被投資公司董事、監察人、行使表決權、指派經理人、擔任信託監察人或參與經營
(assert (not (= (or exercise_voting_rights_for_director_or_supervisor
            insurance_or_representative_is_director_or_supervisor
            participate_in_management_agreement_or_authorization
            appoint_person_as_manager
            serve_as_trust_supervisor)
        investment_prohibited_conditions)))

; [insurance:investment_prohibited_conditions_invalidity] 有禁止情事者，該行為無效
(assert (= investment_prohibited_conditions_invalidity
   (or exercise_voting_rights_for_director_or_supervisor
       insurance_or_representative_is_director_or_supervisor
       participate_in_management_agreement_or_authorization
       appoint_person_as_manager
       serve_as_trust_supervisor)))

; [insurance:foreign_investment_limit] 國外投資總額不得超過資金45%
(assert (= foreign_investment_limit
   (ite (<= foreign_investment_total (* (/ 9.0 20.0) total_funds)) 1.0 0.0)))

; [insurance:foreign_investment_exclusions] 國外投資限額不計入特定核准項目金額
(assert (= foreign_investment_exclusions
   (and foreign_investment_exclusion_approved_non_investment_life_insurance
        foreign_investment_exclusion_foreign_currency_securities
        foreign_investment_exclusion_approved_foreign_insurance_related_investment
        foreign_investment_exclusion_other_approved_items)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= appoint_person_as_manager false))
(assert (= bonds_and_commercial_paper_investment_per_company 0.0))
(assert (= bonds_and_commercial_paper_investment_total 0.0))
(assert (= capital_adequacy_ratio 100.0))
(assert (= capital_increase_completed false))
(assert (= capital_level_severe_insufficient false))
(assert (= capital_level_severe_insufficient_and_no_compliance false))
(assert (= capital_level_significant_deterioration false))
(assert (= company_equity 0.0))
(assert (= company_issued_shares_total 0))
(assert (= exercise_voting_rights_for_director_or_supervisor true))
(assert (= financial_bonds_investment_amount 0.0))
(assert (= financial_or_business_deterioration false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= foreign_investment_exclusion_approved_foreign_insurance_related_investment true))
(assert (= foreign_investment_exclusion_approved_non_investment_life_insurance true))
(assert (= foreign_investment_exclusion_foreign_currency_securities true))
(assert (= foreign_investment_exclusion_other_approved_items true))
(assert (= foreign_investment_exclusions true))
(assert (= foreign_investment_limit 0.0))
(assert (= foreign_investment_total 0.0))
(assert (= fund_investment_per_fund 0.0))
(assert (= fund_investment_total 0.0))
(assert (= fund_issued_beneficiary_certificates 0))
(assert (= improvement_plan_executed_and_effective false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= insurance_or_representative_is_director_or_supervisor false))
(assert (= investment_limit_bonds_per_company 0.0))
(assert (= investment_limit_bonds_per_company_equity 0.0))
(assert (= investment_limit_financial_bonds 0.0))
(assert (= investment_limit_fund_per_issued 0.0))
(assert (= investment_limit_fund_total 0.0))
(assert (= investment_limit_securitized_and_others 0.0))
(assert (= investment_limit_stock_and_bonds_combined 0.0))
(assert (= investment_limit_stock_per_company 0.0))
(assert (= investment_limit_stock_per_company_shares 0))
(assert (= investment_prohibited_conditions false))
(assert (= investment_prohibited_conditions_invalidity true))
(assert (= merger_completed false))
(assert (= participate_in_management_agreement_or_authorization false))
(assert (= penalty true))
(assert (= penalty_trigger_severe false))
(assert (= penalty_trigger_significant_deterioration false))
(assert (= risk_to_insured_rights false))
(assert (= securitized_and_other_investment_total 0.0))
(assert (= serve_as_trust_supervisor false))
(assert (= stock_investment_per_company 0.0))
(assert (= stock_investment_total 0.0))
(assert (= total_funds 100000000.0))
(assert (= unable_to_fulfill_contract false))
(assert (= unable_to_pay_debt false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 51
; Total facts: 51
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
