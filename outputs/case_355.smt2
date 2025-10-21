; SMT2 file generated from compliance case automatic
; Case ID: case_355
; Generated at: 2025-10-21T07:52:34.009284
;
; This file can be executed with Z3:
;   z3 case_355.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const company_equity Real)
(declare-const company_issued_shares Real)
(declare-const company_stock_and_equity_securities_per_firm Real)
(declare-const company_stock_and_equity_securities_shares_per_firm Real)
(declare-const company_stock_and_equity_securities_total Real)
(declare-const corporate_bonds_and_commercial_paper_equity_per_firm Real)
(declare-const corporate_bonds_and_commercial_paper_per_firm Real)
(declare-const corporate_bonds_and_commercial_paper_total Real)
(declare-const financial_bonds_total Real)
(declare-const fund_investment_per_fund_shares Real)
(declare-const fund_investment_total Real)
(declare-const fund_issued_shares Real)
(declare-const insurance_funds Real)
(declare-const insurance_or_representative_director Bool)
(declare-const insurance_or_representative_manager Bool)
(declare-const insurance_or_representative_vote Bool)
(declare-const insurance_or_third_party_agreement Bool)
(declare-const insurance_trustee_supervisor Bool)
(declare-const investment_limit_company_stock_per_firm Real)
(declare-const investment_limit_company_stock_per_firm_shares Real)
(declare-const investment_limit_corporate_bonds_per_firm Real)
(declare-const investment_limit_corporate_bonds_per_firm_equity Real)
(declare-const investment_limit_financial_bonds Real)
(declare-const investment_limit_fund_per_fund_shares Real)
(declare-const investment_limit_fund_total Real)
(declare-const investment_limit_securitized_products Real)
(declare-const investment_limit_stock_and_bond_combined Real)
(declare-const penalty Bool)
(declare-const prohibited_investment_conditions Bool)
(declare-const securitized_products_total Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:investment_limit_financial_bonds] 金融債券等投資總額不得超過保險業資金35%
(assert (= investment_limit_financial_bonds
   (ite (<= financial_bonds_total (* 35.0 insurance_funds)) 1.0 0.0)))

; [insurance:investment_limit_company_stock_per_firm] 每一公司股票及相關股權性質有價證券投資不得超過保險業資金5%
(assert (= investment_limit_company_stock_per_firm
   (ite (<= company_stock_and_equity_securities_per_firm
            (* 5.0 insurance_funds))
        1.0
        0.0)))

; [insurance:investment_limit_company_stock_per_firm_shares] 每一公司股票及相關股權性質有價證券投資不得超過該公司已發行股份總數10%
(assert (= investment_limit_company_stock_per_firm_shares
   (ite (<= company_stock_and_equity_securities_shares_per_firm
            (* 10.0 company_issued_shares))
        1.0
        0.0)))

; [insurance:investment_limit_corporate_bonds_per_firm] 每一公司公司債及免保證商業本票投資不得超過保險業資金5%
(assert (= investment_limit_corporate_bonds_per_firm
   (ite (<= corporate_bonds_and_commercial_paper_per_firm
            (* 5.0 insurance_funds))
        1.0
        0.0)))

; [insurance:investment_limit_corporate_bonds_per_firm_equity] 每一公司公司債及免保證商業本票投資不得超過該公司業主權益10%
(assert (= investment_limit_corporate_bonds_per_firm_equity
   (ite (<= corporate_bonds_and_commercial_paper_equity_per_firm
            (* 10.0 company_equity))
        1.0
        0.0)))

; [insurance:investment_limit_fund_total] 證券投資信託基金及共同信託基金投資總額不得超過保險業資金10%
(assert (= investment_limit_fund_total
   (ite (<= fund_investment_total (* 10.0 insurance_funds)) 1.0 0.0)))

; [insurance:investment_limit_fund_per_fund_shares] 每一基金受益憑證投資不得超過該基金已發行受益憑證總額10%
(assert (= investment_limit_fund_per_fund_shares
   (ite (<= fund_investment_per_fund_shares (* 10.0 fund_issued_shares))
        1.0
        0.0)))

; [insurance:investment_limit_securitized_products] 證券化商品及其他核准有價證券投資總額不得超過保險業資金10%
(assert (= investment_limit_securitized_products
   (ite (<= securitized_products_total (* 10.0 insurance_funds)) 1.0 0.0)))

; [insurance:investment_limit_stock_and_bond_combined] 第三款及第四款投資總額合計不得超過保險業資金35%
(assert (= investment_limit_stock_and_bond_combined
   (ite (<= (+ company_stock_and_equity_securities_total
               corporate_bonds_and_commercial_paper_total)
            (* 35.0 insurance_funds))
        1.0
        0.0)))

; [insurance:prohibited_investment_conditions] 不得以保險業或代表人擔任被投資公司董事、監察人等情事
(assert (= prohibited_investment_conditions
   (and (not insurance_or_representative_director)
        (not insurance_or_representative_vote)
        (not insurance_or_representative_manager)
        (not insurance_trustee_supervisor)
        (not insurance_or_third_party_agreement))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反投資限額或禁止情事時處罰
(assert (= penalty
   (or (not (= investment_limit_securitized_products 1.0))
       (not (= investment_limit_corporate_bonds_per_firm_equity 1.0))
       (not (= investment_limit_fund_total 1.0))
       (not (= investment_limit_stock_and_bond_combined 1.0))
       (not (= investment_limit_company_stock_per_firm 1.0))
       (not (= investment_limit_fund_per_fund_shares 1.0))
       (not (= investment_limit_company_stock_per_firm_shares 1.0))
       (not prohibited_investment_conditions)
       (not (= investment_limit_financial_bonds 1.0))
       (not (= investment_limit_corporate_bonds_per_firm 1.0)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= insurance_funds 1000000000))
(assert (= financial_bonds_total 400000000))
(assert (= company_stock_and_equity_securities_per_firm 60000000))
(assert (= company_stock_and_equity_securities_shares_per_firm 1500000))
(assert (= company_issued_shares 10000000))
(assert (= company_stock_and_equity_securities_total 300000000))
(assert (= corporate_bonds_and_commercial_paper_per_firm 60000000))
(assert (= corporate_bonds_and_commercial_paper_equity_per_firm 15000000))
(assert (= company_equity 100000000))
(assert (= corporate_bonds_and_commercial_paper_total 400000000))
(assert (= fund_investment_total 150000000))
(assert (= fund_investment_per_fund_shares 1500000))
(assert (= fund_issued_shares 10000000))
(assert (= securitized_products_total 150000000))
(assert (= insurance_or_representative_director true))
(assert (= insurance_or_representative_vote true))
(assert (= insurance_or_representative_manager false))
(assert (= insurance_trustee_supervisor false))
(assert (= insurance_or_third_party_agreement false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 30
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
