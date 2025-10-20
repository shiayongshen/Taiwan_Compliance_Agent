; SMT2 file generated from compliance case automatic
; Case ID: case_374
; Generated at: 2025-10-19T14:22:08.089837
;
; This file can be executed with Z3:
;   z3 case_374.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const can_invest_beneficiary_and_asset_backed_securities Bool)
(declare-const can_invest_central_bank_cds_and_savings_bonds Bool)
(declare-const can_invest_financial_and_corporate_bonds Bool)
(declare-const can_invest_fund_certificates_and_warrants Bool)
(declare-const can_invest_government_bonds Bool)
(declare-const can_invest_international_or_regional_financial_org_bonds Bool)
(declare-const can_invest_other_approved_securities Bool)
(declare-const can_invest_short_term_notes Bool)
(declare-const can_invest_stocks_in_centralized_or_otc_markets Bool)
(declare-const can_invest_trust_funds_under_trust_law Bool)
(declare-const compliance_with_regulations_set_by_authority Bool)
(declare-const deposit_from_foundations Bool)
(declare-const deposit_from_government_agencies Bool)
(declare-const deposit_from_invested_or_credited_companies Bool)
(declare-const deposit_from_legal_insurance_industries Bool)
(declare-const excluded_stocks_in_investment Bool)
(declare-const industrial_bank_definition Bool)
(declare-const industrial_bank_deposit_limit Real)
(declare-const industrial_bank_investment_scope Bool)
(declare-const industrial_bank_regulation_compliance Bool)
(declare-const investment_in_production_business_allowed Bool)
(declare-const investment_securities_types Bool)
(declare-const is_industrial_bank Bool)
(declare-const main_business_is_mid_long_term_credit Bool)
(declare-const penalty Bool)
(declare-const stocks_under_otc_management Bool)
(declare-const stocks_with_changed_trading_method Bool)
(declare-const violate_article_109_or_related_fund_usage Bool)
(declare-const violate_article_111_or_related Bool)
(declare-const violate_article_72_or_related Bool)
(declare-const violate_article_74_1_75_or_related_investment Bool)
(declare-const violate_article_74_or_related_investment Bool)
(declare-const violate_article_76_or_related Bool)
(declare-const violate_article_91_or_related Bool)
(declare-const violate_central_bank_loan_regulations Bool)
(declare-const violation_penalty_130 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:industrial_bank_definition] 工業銀行定義及主要業務
(assert (= industrial_bank_definition
   (and is_industrial_bank main_business_is_mid_long_term_credit)))

; [bank:industrial_bank_investment_scope] 工業銀行得投資生產事業，範圍由主管機關定之
(assert (= industrial_bank_investment_scope investment_in_production_business_allowed))

; [bank:industrial_bank_deposit_limit] 工業銀行收受存款限於投資、授信之公司組織客戶、依法設立之保險業、財團法人及政府機關
(assert (= industrial_bank_deposit_limit
   (ite (and deposit_from_invested_or_credited_companies
             deposit_from_legal_insurance_industries
             deposit_from_foundations
             deposit_from_government_agencies)
        1.0
        0.0)))

; [bank:industrial_bank_regulation_compliance] 工業銀行設立標準及授信、投資、收受存款、發行金融債券範圍限制由主管機關定之
(assert (= industrial_bank_regulation_compliance
   compliance_with_regulations_set_by_authority))

; [bank:violation_penalty_130] 違反銀行法第130條規定之處罰條件
(assert (= violation_penalty_130
   (or violate_central_bank_loan_regulations
       violate_article_72_or_related
       violate_article_109_or_related_fund_usage
       violate_article_76_or_related
       violate_article_74_1_75_or_related_investment
       violate_article_74_or_related_investment
       violate_article_111_or_related
       violate_article_91_or_related)))

; [bank:investment_securities_types] 工業銀行得投資境內及境外有價證券種類
(assert (= investment_securities_types
   (and can_invest_government_bonds
        can_invest_short_term_notes
        can_invest_financial_and_corporate_bonds
        can_invest_stocks_in_centralized_or_otc_markets
        can_invest_fund_certificates_and_warrants
        can_invest_central_bank_cds_and_savings_bonds
        can_invest_beneficiary_and_asset_backed_securities
        can_invest_international_or_regional_financial_org_bonds
        can_invest_trust_funds_under_trust_law
        can_invest_other_approved_securities)))

; [bank:excluded_stocks_in_investment] 第四款股票不包括變更交易方法有價證券及櫃檯買賣管理股票
(assert (= excluded_stocks_in_investment
   (and (not stocks_with_changed_trading_method)
        (not stocks_under_otc_management))))

; [meta:penalty_default_false] 預設不處罰
(assert (or (not penalty)
    (not (and (not violate_central_bank_loan_regulations)
              (not violate_article_72_or_related)
              (not violate_article_74_or_related_investment)
              (not violate_article_74_1_75_or_related_investment)
              (not violate_article_76_or_related)
              (not violate_article_91_or_related)
              (not violate_article_109_or_related_fund_usage)
              (not violate_article_111_or_related)))))

; [meta:penalty_conditions] 處罰條件：違反銀行法第130條任一規定時處罰
(assert (= penalty
   (or violate_central_bank_loan_regulations
       violate_article_72_or_related
       violate_article_109_or_related_fund_usage
       violate_article_76_or_related
       violate_article_74_1_75_or_related_investment
       violate_article_74_or_related_investment
       violate_article_111_or_related
       violate_article_91_or_related)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= is_industrial_bank true))
(assert (= main_business_is_mid_long_term_credit true))
(assert (= investment_in_production_business_allowed true))
(assert (= deposit_from_invested_or_credited_companies true))
(assert (= deposit_from_legal_insurance_industries true))
(assert (= deposit_from_foundations true))
(assert (= deposit_from_government_agencies true))
(assert (= compliance_with_regulations_set_by_authority false))
(assert (= can_invest_government_bonds true))
(assert (= can_invest_short_term_notes true))
(assert (= can_invest_financial_and_corporate_bonds true))
(assert (= can_invest_stocks_in_centralized_or_otc_markets true))
(assert (= can_invest_fund_certificates_and_warrants true))
(assert (= can_invest_central_bank_cds_and_savings_bonds true))
(assert (= can_invest_beneficiary_and_asset_backed_securities true))
(assert (= can_invest_international_or_regional_financial_org_bonds true))
(assert (= can_invest_trust_funds_under_trust_law true))
(assert (= can_invest_other_approved_securities true))
(assert (= stocks_with_changed_trading_method true))
(assert (= stocks_under_otc_management false))
(assert (= violate_article_91_or_related true))
(assert (= violate_central_bank_loan_regulations false))
(assert (= violate_article_72_or_related false))
(assert (= violate_article_74_or_related_investment false))
(assert (= violate_article_74_1_75_or_related_investment false))
(assert (= violate_article_76_or_related false))
(assert (= violate_article_109_or_related_fund_usage false))
(assert (= violate_article_111_or_related false))
(assert (= penalty true))
(assert (= violation_penalty_130 true))
(assert (= industrial_bank_definition true))
(assert (= industrial_bank_investment_scope true))
(assert (= industrial_bank_regulation_compliance false))
(assert (= industrial_bank_deposit_limit 1.0))
(assert (= excluded_stocks_in_investment false))
(assert (= investment_securities_types false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 36
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
