; SMT2 file generated from compliance case automatic
; Case ID: case_325
; Generated at: 2025-10-21T07:20:09.381563
;
; This file can be executed with Z3:
;   z3 case_325.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authority_adjusted_investment_limit Real)
(declare-const buy_back_condition_purchase_excluded Bool)
(declare-const buy_back_condition_sale_included Bool)
(declare-const calculation_base Real)
(declare-const cash_dividends_distributed Real)
(declare-const checking_deposits Real)
(declare-const company_total_issued_shares Int)
(declare-const current_year_cash_capital_increase Real)
(declare-const demand_deposits Real)
(declare-const financial_bonds_issued_amount Real)
(declare-const foreign_currency_deposits Real)
(declare-const investment_cost_otc_stock_and_others Real)
(declare-const investment_cost_per_company_stock_and_bonds Real)
(declare-const investment_cost_stock_total Real)
(declare-const investment_cost_unrated_short_term_and_bonds Real)
(declare-const investment_cost_unrated_short_term_and_bonds_total Real)
(declare-const investment_limit_adjustable_by_authority Real)
(declare-const investment_limit_buy_sell_back_short_term_exclusion Bool)
(declare-const investment_limit_otc_stock_and_others Real)
(declare-const investment_limit_per_company_stock_and_bonds Real)
(declare-const investment_limit_securities_held_over_one_year Real)
(declare-const investment_limit_stock_total Real)
(declare-const investment_limit_unrated_short_term_and_bonds Real)
(declare-const investment_limit_unrated_short_term_and_bonds_total Real)
(declare-const issuer_or_guarantor_has_credit_rating Bool)
(declare-const net_worth_last_year_after_settlement Real)
(declare-const original_cost_long_term_bank_shares Real)
(declare-const original_cost_non_bank_enterprise_investments Real)
(declare-const penalty Bool)
(declare-const post_office_transferred_deposits Real)
(declare-const securities_held_over_one_year_included_in_limits Bool)
(declare-const time_deposits Real)
(declare-const total_deposits Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:investment_limit_stock_total] 投資集中交易市場與店頭市場股票等原始取得成本總餘額不得超過核算基數30%
(assert (= investment_limit_stock_total
   (ite (<= investment_cost_stock_total (* (/ 3.0 10.0) calculation_base))
        1.0
        0.0)))

; [bank:investment_limit_otc_stock_and_others] 店頭市場股票等不得超過核算基數5%
(assert (= investment_limit_otc_stock_and_others
   (ite (<= investment_cost_otc_stock_and_others
            (* (/ 1.0 20.0) calculation_base))
        1.0
        0.0)))

; [bank:investment_limit_unrated_short_term_and_bonds] 投資無信用評等或未達一定等級短期票券等總餘額不得超過核算基數10%，發行人或保證人具一定信用評等者不在此限
(assert (let ((a!1 (ite (or (<= investment_cost_unrated_short_term_and_bonds
                        (* (/ 1.0 10.0) calculation_base))
                    issuer_or_guarantor_has_credit_rating)
                1.0
                0.0)))
  (= investment_limit_unrated_short_term_and_bonds a!1)))

; [bank:investment_limit_unrated_short_term_and_bonds_total] 銀行投資第二點第一項各類有價證券總餘額不得超過存款總餘額與金融債發售額合計之25%
(assert (let ((a!1 (ite (<= investment_cost_unrated_short_term_and_bonds_total
                    (+ (* (/ 1.0 4.0) total_deposits)
                       (* (/ 1.0 4.0) financial_bonds_issued_amount)))
                1.0
                0.0)))
  (= investment_limit_unrated_short_term_and_bonds_total a!1)))

; [bank:investment_limit_securities_held_over_one_year] 銀行兼營證券商所購入有價證券逾一年未賣出者，應納入前三款限額內計算
(assert (= investment_limit_securities_held_over_one_year
   (ite securities_held_over_one_year_included_in_limits 1.0 0.0)))

; [bank:investment_limit_buy_sell_back_short_term_exclusion] 以附賣回條件買入短期票券與債券者不計入限額，但附買回條件賣出者須計入
(assert (= investment_limit_buy_sell_back_short_term_exclusion
   (and buy_back_condition_purchase_excluded buy_back_condition_sale_included)))

; [bank:investment_limit_per_company_stock_and_bonds] 投資每一公司股票、新股權利證書與債券換股權利證書不得超過該公司已發行股份總數5%
(assert (let ((a!1 (ite (<= investment_cost_per_company_stock_and_bonds
                    (* (/ 1.0 20.0) (to_real company_total_issued_shares)))
                1.0
                0.0)))
  (= investment_limit_per_company_stock_and_bonds a!1)))

; [bank:calculation_base_definition] 核算基數定義：上年度決算後淨值扣除對其他銀行持股逾一年之原始成本及依法轉投資非銀行企業之原始成本後餘額，當年度現金增資列入，現金股利扣除
(assert (= calculation_base
   (+ net_worth_last_year_after_settlement
      current_year_cash_capital_increase
      (* (- 1.0) original_cost_long_term_bank_shares)
      (* (- 1.0) original_cost_non_bank_enterprise_investments)
      (* (- 1.0) cash_dividends_distributed))))

; [bank:total_deposits_definition] 存款總餘額包含活期、定期、支票存款、中華郵政轉存款及外幣存款
(assert (= total_deposits
   (+ demand_deposits
      time_deposits
      checking_deposits
      post_office_transferred_deposits
      foreign_currency_deposits)))

; [bank:investment_limit_adjustable_by_authority] 主管機關得依國內經濟金融情勢調整第一款之投資比率上限
(assert (= investment_limit_adjustable_by_authority
   (ite (= authority_adjusted_investment_limit 1.0) 1.0 0.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行投資有價證券種類及限額規定時處罰
(assert (= penalty
   (or (not (= investment_limit_unrated_short_term_and_bonds_total 1.0))
       (not (= investment_limit_stock_total 1.0))
       (not (= investment_limit_unrated_short_term_and_bonds 1.0))
       (not (= investment_limit_per_company_stock_and_bonds 1.0))
       (not (= investment_limit_otc_stock_and_others 1.0))
       (not (= investment_limit_securities_held_over_one_year 1.0))
       (not investment_limit_buy_sell_back_short_term_exclusion))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= calculation_base 1000000000))
(assert (= investment_cost_unrated_short_term_and_bonds 136000000))
(assert (= issuer_or_guarantor_has_credit_rating false))
(assert (= investment_cost_unrated_short_term_and_bonds_total 192800000))
(assert (= total_deposits 700000000))
(assert (= financial_bonds_issued_amount 100000000))
(assert (= demand_deposits 200000000))
(assert (= time_deposits 300000000))
(assert (= checking_deposits 100000000))
(assert (= post_office_transferred_deposits 50000000))
(assert (= foreign_currency_deposits 50000000))
(assert (= current_year_cash_capital_increase 0))
(assert (= net_worth_last_year_after_settlement 0))
(assert (= original_cost_long_term_bank_shares 0))
(assert (= original_cost_non_bank_enterprise_investments 0))
(assert (= cash_dividends_distributed 0))
(assert (= buy_back_condition_purchase_excluded true))
(assert (= buy_back_condition_sale_included true))
(assert (= securities_held_over_one_year_included_in_limits true))
(assert (= investment_cost_stock_total 0))
(assert (= investment_cost_otc_stock_and_others 0))
(assert (= investment_cost_per_company_stock_and_bonds 0))
(assert (= company_total_issued_shares 100000000))
(assert (= authority_adjusted_investment_limit 0))
(assert (= investment_limit_adjustable_by_authority 0))
(assert (= investment_limit_stock_total 0))
(assert (= investment_limit_otc_stock_and_others 0))
(assert (= investment_limit_unrated_short_term_and_bonds 0))
(assert (= investment_limit_unrated_short_term_and_bonds_total 0))
(assert (= investment_limit_securities_held_over_one_year 0))
(assert (= investment_limit_buy_sell_back_short_term_exclusion true))
(assert (= investment_limit_per_company_stock_and_bonds 0))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 33
; Total facts: 33
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
