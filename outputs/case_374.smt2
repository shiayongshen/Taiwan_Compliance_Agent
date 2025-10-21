; SMT2 file generated from compliance case automatic
; Case ID: case_374
; Generated at: 2025-10-21T08:21:23.128922
;
; This file can be executed with Z3:
;   z3 case_374.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bank_type_industrial Bool)
(declare-const deposit_from_corporate_foundation Real)
(declare-const deposit_from_credited_company Real)
(declare-const deposit_from_government_agency Real)
(declare-const deposit_from_invested_company Real)
(declare-const deposit_from_legal_insurance Real)
(declare-const industrial_bank_definition Bool)
(declare-const industrial_bank_deposit_limit_ok Bool)
(declare-const industrial_bank_investment_scope_ok Bool)
(declare-const industrial_bank_investment_securities_types_ok Bool)
(declare-const industrial_bank_management_rules_defined Bool)
(declare-const investment_in_beneficiary_securities Real)
(declare-const investment_in_central_bank_cds_and_savings Real)
(declare-const investment_in_excluded_stocks Real)
(declare-const investment_in_financial_and_corporate_bonds Real)
(declare-const investment_in_fund_certificates Real)
(declare-const investment_in_government_bonds Real)
(declare-const investment_in_international_financial_org_bonds Real)
(declare-const investment_in_other_approved_securities Real)
(declare-const investment_in_short_term_notes Real)
(declare-const investment_in_stocks Real)
(declare-const investment_in_trust_funds Real)
(declare-const investment_scope_defined_by_authority Bool)
(declare-const main_business_long_term_credit Real)
(declare-const management_rules_defined_by_authority Bool)
(declare-const penalty Bool)
(declare-const stock_is_changed_trading_method Bool)
(declare-const stock_is_otc_controlled Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:industrial_bank_definition] 工業銀行定義及主要業務
(assert (= industrial_bank_definition
   (and bank_type_industrial (= main_business_long_term_credit 1.0))))

; [bank:industrial_bank_investment_scope] 工業銀行得投資生產事業範圍由主管機關定之
(assert (= industrial_bank_investment_scope_ok investment_scope_defined_by_authority))

; [bank:industrial_bank_deposit_limit] 工業銀行收受存款限於投資、授信之公司組織客戶、依法設立之保險業、財團法人及政府機關
(assert (= industrial_bank_deposit_limit_ok
   (or (= deposit_from_government_agency 1.0)
       (= deposit_from_legal_insurance 1.0)
       (= deposit_from_invested_company 1.0)
       (= deposit_from_credited_company 1.0)
       (= deposit_from_corporate_foundation 1.0))))

; [bank:industrial_bank_management_rules_defined] 工業銀行設立標準及管理辦法由主管機關定之
(assert (= industrial_bank_management_rules_defined
   management_rules_defined_by_authority))

; [bank:industrial_bank_investment_securities_types] 工業銀行得投資境內及境外有價證券種類
(assert (let ((a!1 (or (not (<= investment_in_other_approved_securities 0.0))
               (not (<= investment_in_financial_and_corporate_bonds 0.0))
               (not (<= investment_in_short_term_notes 0.0))
               (not (<= investment_in_trust_funds 0.0))
               (not (<= investment_in_international_financial_org_bonds 0.0))
               (not (<= investment_in_beneficiary_securities 0.0))
               (not (<= investment_in_government_bonds 0.0))
               (and (not (<= investment_in_stocks 0.0))
                    (<= investment_in_excluded_stocks 0.0))
               (not (<= investment_in_fund_certificates 0.0))
               (not (<= investment_in_central_bank_cds_and_savings 0.0)))))
  (= industrial_bank_investment_securities_types_ok a!1)))

; [bank:investment_excluded_stocks_definition] 第四款股票不包括變更交易方法有價證券及櫃檯買賣管理股票
(assert (= investment_in_excluded_stocks
   (ite (or stock_is_changed_trading_method stock_is_otc_controlled) 1.0 0.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反工業銀行授信、投資、收受存款及發行金融債券範圍限制及管理辦法
(assert (= penalty
   (or (not industrial_bank_management_rules_defined)
       (not industrial_bank_investment_scope_ok)
       (not industrial_bank_deposit_limit_ok)
       (not industrial_bank_investment_securities_types_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= bank_type_industrial true))
(assert (= main_business_long_term_credit 1000000))
(assert (= investment_scope_defined_by_authority true))
(assert (= management_rules_defined_by_authority true))
(assert (= deposit_from_invested_company 500000))
(assert (= deposit_from_credited_company 300000))
(assert (= deposit_from_legal_insurance 200000))
(assert (= deposit_from_corporate_foundation 100000))
(assert (= deposit_from_government_agency 400000))
(assert (= investment_in_government_bonds 100000))
(assert (= investment_in_short_term_notes 50000))
(assert (= investment_in_financial_and_corporate_bonds 200000))
(assert (= investment_in_stocks 100000))
(assert (= investment_in_excluded_stocks 1000))
(assert (= investment_in_fund_certificates 50000))
(assert (= investment_in_central_bank_cds_and_savings 30000))
(assert (= investment_in_beneficiary_securities 20000))
(assert (= investment_in_international_financial_org_bonds 10000))
(assert (= investment_in_trust_funds 15000))
(assert (= investment_in_other_approved_securities 5000))
(assert (= stock_is_changed_trading_method true))
(assert (= stock_is_otc_controlled false))
(assert (= industrial_bank_definition true))
(assert (= industrial_bank_deposit_limit_ok true))
(assert (= industrial_bank_investment_scope_ok true))
(assert (= industrial_bank_investment_securities_types_ok false))
(assert (= industrial_bank_management_rules_defined true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 28
; Total facts: 28
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
