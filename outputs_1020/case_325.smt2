; SMT2 file generated from compliance case automatic
; Case ID: case_325
; Generated at: 2025-10-19T13:12:52.206523
;
; This file can be executed with Z3:
;   z3 case_325.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const buyback_condition_purchase_excluded Bool)
(declare-const buyback_condition_sale_included Bool)
(declare-const calculation_base Real)
(declare-const cash_dividends_distributed Real)
(declare-const check_deposit Real)
(declare-const company_total_issued_shares Int)
(declare-const current_year_cash_capital_increase Real)
(declare-const demand_deposit Real)
(declare-const deposit_total Real)
(declare-const financial_bond_issued_amount Real)
(declare-const foreign_currency_deposit Real)
(declare-const investment_limit_adjustable Bool)
(declare-const investment_limit_buyback_short_term_exclusion Bool)
(declare-const investment_limit_low_rating_securities Bool)
(declare-const investment_limit_low_rating_securities_total Real)
(declare-const investment_limit_otc_stock Bool)
(declare-const investment_limit_per_company_stock Bool)
(declare-const investment_limit_securities_held_over_one_year Bool)
(declare-const investment_limit_stock_total Bool)
(declare-const investment_low_rating_securities_total Real)
(declare-const investment_otc_stock_total Real)
(declare-const investment_per_company_stock Real)
(declare-const investment_stock_total Real)
(declare-const issuer_or_guarantor_has_rating Bool)
(declare-const net_worth_last_year Real)
(declare-const original_cost_non_bank_investments Real)
(declare-const original_cost_other_banks_shares_over_one_year Real)
(declare-const penalty Bool)
(declare-const postal_transfer_deposit Real)
(declare-const regulator_adjusted_limit Real)
(declare-const securities_held_over_one_year_included_in_limits Bool)
(declare-const time_deposit Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:investment_limit_stock_total] 投資集中交易市場與店頭市場股票等原始取得成本總餘額不得超過核算基數30%
(assert (= investment_limit_stock_total
   (<= investment_stock_total (* (/ 3.0 10.0) calculation_base))))

; [bank:investment_limit_otc_stock] 投資店頭市場股票等不得超過核算基數5%
(assert (= investment_limit_otc_stock
   (<= investment_otc_stock_total (* (/ 1.0 20.0) calculation_base))))

; [bank:investment_limit_low_rating_securities] 投資無信用評等或未達一定等級短期票券等總餘額不得超過核算基數10%，發行人或保證人具一定信用評等者不在此限
(assert (= investment_limit_low_rating_securities
   (or issuer_or_guarantor_has_rating
       (<= investment_low_rating_securities_total
           (* (/ 1.0 10.0) calculation_base)))))

; [bank:investment_limit_low_rating_securities_total] 銀行投資第二點第一項各類有價證券總餘額不得超過存款總餘額與金融債發售額合計之25%
(assert (let ((a!1 (ite (<= investment_low_rating_securities_total
                    (+ (* (/ 1.0 4.0) deposit_total)
                       (* (/ 1.0 4.0) financial_bond_issued_amount)))
                1.0
                0.0)))
  (= investment_limit_low_rating_securities_total a!1)))

; [bank:investment_limit_securities_held_over_one_year] 銀行兼營證券商所購入有價證券逾一年未賣出者，應納入前三款限額內計算
(assert (= investment_limit_securities_held_over_one_year
   securities_held_over_one_year_included_in_limits))

; [bank:investment_limit_buyback_short_term_exclusion] 以附賣回條件買入短期票券與債券者不計入限額，但附買回條件賣出者須計入
(assert (= investment_limit_buyback_short_term_exclusion
   (and buyback_condition_purchase_excluded buyback_condition_sale_included)))

; [bank:investment_limit_per_company_stock] 投資每一公司之股票、新股權利證書與債券換股權利證書不得超過該公司已發行股份總數5%
(assert (= investment_limit_per_company_stock
   (<= investment_per_company_stock
       (* (/ 1.0 20.0) (to_real company_total_issued_shares)))))

; [bank:calculation_base_definition] 核算基數定義：上年度決算後淨值扣除對其他銀行持股逾一年之原始成本及依法轉投資非銀行企業之原始成本後餘額，當年度現金增資列入，現金股利於分派日扣除
(assert (= calculation_base
   (+ net_worth_last_year
      current_year_cash_capital_increase
      (* (- 1.0) original_cost_other_banks_shares_over_one_year)
      (* (- 1.0) original_cost_non_bank_investments)
      (* (- 1.0) cash_dividends_distributed))))

; [bank:deposit_total_definition] 存款總餘額包含活期、定期、支票存款、中華郵政轉存款及外幣存款
(assert (= deposit_total
   (+ demand_deposit
      time_deposit
      check_deposit
      postal_transfer_deposit
      foreign_currency_deposit)))

; [bank:investment_limit_adjustable] 主管機關得依國內經濟金融情勢調整第一款之投資比率上限
(assert (= investment_limit_adjustable (= regulator_adjusted_limit 1.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反投資有價證券種類及限額規定時處罰
(assert (= penalty
   (or (not investment_limit_low_rating_securities)
       (not investment_limit_securities_held_over_one_year)
       (not investment_limit_per_company_stock)
       (not investment_limit_buyback_short_term_exclusion)
       (not (= investment_limit_low_rating_securities_total 1.0))
       (not investment_limit_otc_stock)
       (not investment_limit_stock_total))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= investment_low_rating_securities_total (/ 17.0 125.0)))
(assert (= calculation_base 1.0))
(assert (= issuer_or_guarantor_has_rating false))
(assert (= investment_limit_low_rating_securities false))
(assert (= investment_limit_low_rating_securities_total 0.0))
(assert (= buyback_condition_purchase_excluded true))
(assert (= buyback_condition_sale_included true))
(assert (= securities_held_over_one_year_included_in_limits true))
(assert (= investment_limit_securities_held_over_one_year true))
(assert (= investment_limit_buyback_short_term_exclusion true))
(assert (= investment_stock_total 0.0))
(assert (= investment_limit_stock_total true))
(assert (= investment_otc_stock_total 0.0))
(assert (= investment_limit_otc_stock true))
(assert (= investment_per_company_stock 0.0))
(assert (= investment_limit_per_company_stock true))
(assert (= net_worth_last_year 0.0))
(assert (= current_year_cash_capital_increase 0.0))
(assert (= original_cost_other_banks_shares_over_one_year 0.0))
(assert (= original_cost_non_bank_investments 0.0))
(assert (= cash_dividends_distributed 0.0))
(assert (= deposit_total 1.0))
(assert (= financial_bond_issued_amount 0.0))
(assert (= demand_deposit 0.0))
(assert (= time_deposit 0.0))
(assert (= check_deposit 0.0))
(assert (= postal_transfer_deposit 0.0))
(assert (= foreign_currency_deposit 0.0))
(assert (= regulator_adjusted_limit 0.0))
(assert (= investment_limit_adjustable false))
(assert (= penalty true))
(assert (= company_total_issued_shares 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 32
; Total facts: 32
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
