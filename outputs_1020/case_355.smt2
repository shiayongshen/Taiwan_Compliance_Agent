; SMT2 file generated from compliance case automatic
; Case ID: case_355
; Generated at: 2025-10-19T13:53:27.957662
;
; This file can be executed with Z3:
;   z3 case_355.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const company_equity Real)
(declare-const company_total_shares Int)
(declare-const corporate_bonds_and_commercial_paper_per_company_amount Real)
(declare-const corporate_bonds_investment_total_amount Real)
(declare-const financial_bonds_total Real)
(declare-const fund_investment_per_fund_beneficiary_shares Int)
(declare-const fund_investment_total_amount Real)
(declare-const fund_total_beneficiary_shares Int)
(declare-const insurance_funds Real)
(declare-const insurance_or_representative_appoints_manager Bool)
(declare-const insurance_or_representative_exercises_voting_rights Bool)
(declare-const insurance_or_representative_is_director_or_supervisor Bool)
(declare-const insurance_or_representative_is_trust_supervisor Bool)
(declare-const insurance_or_representative_participates_in_management Bool)
(declare-const investment_limit_corporate_bonds_per_company_amount Real)
(declare-const investment_limit_corporate_bonds_per_company_equity Real)
(declare-const investment_limit_financial_bonds Real)
(declare-const investment_limit_fund_per_fund_beneficiary_shares Int)
(declare-const investment_limit_fund_total_amount Real)
(declare-const investment_limit_securitized_products_total Real)
(declare-const investment_limit_stock_and_corporate_bonds_combined Real)
(declare-const investment_limit_stock_and_equity_securities_per_company_amount Real)
(declare-const investment_limit_stock_per_company_amount Real)
(declare-const investment_limit_stock_per_company_shares Int)
(declare-const penalty Bool)
(declare-const prohibited_investment_behavior Bool)
(declare-const securitized_products_total_amount Real)
(declare-const stock_and_equity_securities_per_company_amount Real)
(declare-const stock_investment_per_company_amount Real)
(declare-const stock_investment_per_company_shares Int)
(declare-const stock_investment_total_amount Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:investment_limit_financial_bonds] 金融債券等投資總額不得超過保險業資金35%
(assert (= investment_limit_financial_bonds
   (ite (<= financial_bonds_total (* 35.0 insurance_funds)) 1.0 0.0)))

; [insurance:investment_limit_stock_per_company_amount] 每一公司股票投資金額不得超過保險業資金5%
(assert (= investment_limit_stock_per_company_amount
   (ite (<= stock_investment_per_company_amount (* 5.0 insurance_funds))
        1.0
        0.0)))

; [insurance:investment_limit_stock_per_company_shares] 每一公司股票投資股份數不得超過該公司已發行股份總數10%
(assert (let ((a!1 (ite (<= (to_real stock_investment_per_company_shares)
                    (* 10.0 (to_real company_total_shares)))
                1
                0)))
  (= investment_limit_stock_per_company_shares a!1)))

; [insurance:investment_limit_stock_and_equity_securities_per_company_amount] 每一公司股票及其他股權性質有價證券投資總額不得超過保險業資金5%
(assert (= investment_limit_stock_and_equity_securities_per_company_amount
   (ite (<= stock_and_equity_securities_per_company_amount
            (* 5.0 insurance_funds))
        1.0
        0.0)))

; [insurance:investment_limit_corporate_bonds_per_company_amount] 每一公司公司債及免保證商業本票投資總額不得超過保險業資金5%
(assert (= investment_limit_corporate_bonds_per_company_amount
   (ite (<= corporate_bonds_and_commercial_paper_per_company_amount
            (* 5.0 insurance_funds))
        1.0
        0.0)))

; [insurance:investment_limit_corporate_bonds_per_company_equity] 每一公司公司債及免保證商業本票投資總額不得超過該公司業主權益10%
(assert (= investment_limit_corporate_bonds_per_company_equity
   (ite (<= corporate_bonds_and_commercial_paper_per_company_amount
            (* 10.0 company_equity))
        1.0
        0.0)))

; [insurance:investment_limit_fund_total_amount] 證券投資信託基金及共同信託基金投資總額不得超過保險業資金10%
(assert (= investment_limit_fund_total_amount
   (ite (<= fund_investment_total_amount (* 10.0 insurance_funds)) 1.0 0.0)))

; [insurance:investment_limit_fund_per_fund_beneficiary_shares] 每一基金受益憑證投資不得超過該基金已發行受益憑證總額10%
(assert (let ((a!1 (ite (<= (to_real fund_investment_per_fund_beneficiary_shares)
                    (* 10.0 (to_real fund_total_beneficiary_shares)))
                1
                0)))
  (= investment_limit_fund_per_fund_beneficiary_shares a!1)))

; [insurance:investment_limit_securitized_products_total] 證券化商品及其他核准有價證券投資總額不得超過保險業資金10%
(assert (= investment_limit_securitized_products_total
   (ite (<= securitized_products_total_amount (* 10.0 insurance_funds)) 1.0 0.0)))

; [insurance:investment_limit_stock_and_corporate_bonds_combined] 股票及公司債投資總額合計不得超過保險業資金35%
(assert (= investment_limit_stock_and_corporate_bonds_combined
   (ite (<= (+ stock_investment_total_amount
               corporate_bonds_investment_total_amount)
            (* 35.0 insurance_funds))
        1.0
        0.0)))

; [insurance:prohibited_investment_behavior] 禁止保險業及其代表人擔任被投資公司董事、監察人、行使表決權、指派經理人、擔任信託監察人及參與經營
(assert (not (= (or insurance_or_representative_exercises_voting_rights
            insurance_or_representative_appoints_manager
            insurance_or_representative_is_director_or_supervisor
            insurance_or_representative_is_trust_supervisor
            insurance_or_representative_participates_in_management)
        prohibited_investment_behavior)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反投資限額或禁止行為時處罰
(assert (= penalty
   (or (not (= investment_limit_financial_bonds 1.0))
       (not (= investment_limit_stock_per_company_shares 1))
       (not (= investment_limit_fund_per_fund_beneficiary_shares 1))
       (not (= investment_limit_fund_total_amount 1.0))
       (not (= investment_limit_securitized_products_total 1.0))
       (not (= investment_limit_corporate_bonds_per_company_amount 1.0))
       (not (= investment_limit_stock_per_company_amount 1.0))
       (not (= investment_limit_stock_and_corporate_bonds_combined 1.0))
       (not (= investment_limit_corporate_bonds_per_company_equity 1.0))
       (not (= investment_limit_stock_and_equity_securities_per_company_amount
               1.0))
       (not prohibited_investment_behavior))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= insurance_funds 100.0))
(assert (= financial_bonds_total 30.0))
(assert (= stock_investment_per_company_amount 6.0))
(assert (= stock_investment_per_company_shares 1200000))
(assert (= company_total_shares 10000000))
(assert (= stock_and_equity_securities_per_company_amount 6.0))
(assert (= corporate_bonds_and_commercial_paper_per_company_amount 6.0))
(assert (= company_equity 50.0))
(assert (= corporate_bonds_investment_total_amount 30.0))
(assert (= fund_investment_total_amount 8.0))
(assert (= fund_investment_per_fund_beneficiary_shares 9000))
(assert (= fund_total_beneficiary_shares 100000))
(assert (= securitized_products_total_amount 8.0))
(assert (= stock_investment_total_amount 25.0))
(assert (= investment_limit_financial_bonds 0.0))
(assert (= investment_limit_stock_per_company_amount 0.0))
(assert (= investment_limit_stock_per_company_shares 0))
(assert (= investment_limit_stock_and_equity_securities_per_company_amount 0.0))
(assert (= investment_limit_corporate_bonds_per_company_amount 0.0))
(assert (= investment_limit_corporate_bonds_per_company_equity 0.0))
(assert (= investment_limit_fund_total_amount 0.0))
(assert (= investment_limit_fund_per_fund_beneficiary_shares 0))
(assert (= investment_limit_securitized_products_total 0.0))
(assert (= investment_limit_stock_and_corporate_bonds_combined 0.0))
(assert (= insurance_or_representative_is_director_or_supervisor true))
(assert (= insurance_or_representative_exercises_voting_rights true))
(assert (= insurance_or_representative_appoints_manager false))
(assert (= insurance_or_representative_is_trust_supervisor false))
(assert (= insurance_or_representative_participates_in_management false))
(assert (= penalty false))
(assert (= prohibited_investment_behavior false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 31
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
