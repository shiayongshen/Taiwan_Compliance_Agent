; SMT2 file generated from compliance case automatic
; Case ID: case_372
; Generated at: 2025-10-19T14:19:29.657539
;
; This file can be executed with Z3:
;   z3 case_372.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const buy_back_short_term_bonds_balance_excluded Real)
(declare-const capital_base Real)
(declare-const checking_deposits Real)
(declare-const company_total_shares Int)
(declare-const cost_long_term_bank_shares Real)
(declare-const cost_otc_stock_and_equity Real)
(declare-const cost_other_enterprise_investments Real)
(declare-const cost_stock_and_equity Real)
(declare-const cost_unrated_short_term_and_bonds Real)
(declare-const demand_deposits Real)
(declare-const financial_bond_issuance Real)
(declare-const foreign_currency_deposits Real)
(declare-const investment_limit_otc_stock_and_equity Real)
(declare-const investment_limit_stock_and_equity Real)
(declare-const investment_limit_stock_per_company Real)
(declare-const investment_limit_total_excluding_government Real)
(declare-const investment_limit_unrated_short_term_and_bonds Real)
(declare-const investment_per_company_stock Real)
(declare-const net_worth_last_year Real)
(declare-const penalty Bool)
(declare-const postal_savings_transfers Real)
(declare-const sell_back_short_term_bonds_balance_included Real)
(declare-const sell_back_short_term_bonds_exclusion_ok Bool)
(declare-const time_deposits Real)
(declare-const total_deposits Real)
(declare-const total_investment_excluding_government Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:investment_limit_stock_and_equity] 商業銀行投資於集中交易市場與店頭市場股票等原始取得成本總餘額不得超過核算基數30%
(assert (= investment_limit_stock_and_equity
   (ite (<= cost_stock_and_equity (* (/ 3.0 10.0) capital_base)) 1.0 0.0)))

; [bank:investment_limit_otc_stock_and_equity] 商業銀行投資於店頭市場股票及相關權證等原始取得成本總餘額不得超過核算基數5%
(assert (= investment_limit_otc_stock_and_equity
   (ite (<= cost_otc_stock_and_equity (* (/ 1.0 20.0) capital_base)) 1.0 0.0)))

; [bank:investment_limit_unrated_short_term_and_bonds] 商業銀行投資於無信用評等或信用評等未達標準短期票券及債券等原始取得成本總餘額不得超過核算基數10%
(assert (= investment_limit_unrated_short_term_and_bonds
   (ite (<= cost_unrated_short_term_and_bonds (* (/ 1.0 10.0) capital_base))
        1.0
        0.0)))

; [bank:investment_limit_total_excluding_government] 銀行投資於第二點第一項各種有價證券總餘額（除政府公債等）不得超過存款總餘額及金融債券發售額和的25%
(assert (let ((a!1 (ite (<= total_investment_excluding_government
                    (+ (* (/ 1.0 4.0) total_deposits)
                       (* (/ 1.0 4.0) financial_bond_issuance)))
                1.0
                0.0)))
  (= investment_limit_total_excluding_government a!1)))

; [bank:investment_limit_stock_per_company] 商業銀行投資於每一公司股票及相關權證股份總額不得超過該公司已發行股份總數5%
(assert (let ((a!1 (ite (<= investment_per_company_stock
                    (* (/ 1.0 20.0) (to_real company_total_shares)))
                1.0
                0.0)))
  (= investment_limit_stock_per_company a!1)))

; [bank:capital_base_calculation] 核算基數為上會計年度決算後淨值扣除特定項目後餘額，年度中現金增資計入，現金股利扣除
(assert (= capital_base
   (+ net_worth_last_year
      (* (- 1.0) cost_long_term_bank_shares)
      (* (- 1.0) cost_other_enterprise_investments))))

; [bank:deposit_total_includes] 存款總餘額包括活期、定期、支票、中華郵政轉存款及外幣存款
(assert (= total_deposits
   (+ demand_deposits
      time_deposits
      checking_deposits
      postal_savings_transfers
      foreign_currency_deposits)))

; [bank:exclusion_of_sell_back_short_term_bonds] 附賣回條件買入短期票券及債券餘額不計入限額，附買回條件賣出則計入
(assert (= sell_back_short_term_bonds_exclusion_ok
   (and (= buy_back_short_term_bonds_balance_excluded 1.0)
        (= sell_back_short_term_bonds_balance_included 1.0))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反投資有價證券種類及限額規定時處罰
(assert (= penalty
   (or (not (= investment_limit_stock_and_equity 1.0))
       (not (= investment_limit_otc_stock_and_equity 1.0))
       (not (= investment_limit_stock_per_company 1.0))
       (not (= investment_limit_unrated_short_term_and_bonds 1.0))
       (not (= investment_limit_total_excluding_government 1.0))
       (not sell_back_short_term_bonds_exclusion_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= cost_unrated_short_term_and_bonds 15960000.0))
(assert (= capital_base 159600000.0))
(assert (= net_worth_last_year 160000000.0))
(assert (= cost_long_term_bank_shares 0.0))
(assert (= cost_other_enterprise_investments 0.0))
(assert (= cost_stock_and_equity 0.0))
(assert (= cost_otc_stock_and_equity 0.0))
(assert (= demand_deposits 100000000.0))
(assert (= time_deposits 50000000.0))
(assert (= checking_deposits 0.0))
(assert (= postal_savings_transfers 0.0))
(assert (= foreign_currency_deposits 0.0))
(assert (= financial_bond_issuance 0.0))
(assert (= total_investment_excluding_government 0.0))
(assert (= investment_per_company_stock 0.0))
(assert (= company_total_shares 100000000))
(assert (= buy_back_short_term_bonds_balance_excluded 0.0))
(assert (= sell_back_short_term_bonds_balance_included 0.0))
(assert (= sell_back_short_term_bonds_exclusion_ok true))
(assert (= investment_limit_stock_and_equity 1.0))
(assert (= investment_limit_otc_stock_and_equity 1.0))
(assert (= investment_limit_unrated_short_term_and_bonds 0.0))
(assert (= investment_limit_total_excluding_government 1.0))
(assert (= investment_limit_stock_per_company 1.0))
(assert (= penalty true))
(assert (= total_deposits 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 26
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
