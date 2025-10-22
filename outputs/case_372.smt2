; SMT2 file generated from compliance case automatic
; Case ID: case_372
; Generated at: 2025-10-22T19:55:18.651361
;
; This file can be executed with Z3:
;   z3 case_372.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_base Real)
(declare-const accounting_base_correctly_calculated Bool)
(declare-const accounting_base_deductions Real)
(declare-const accounting_base_deductions_applied Bool)
(declare-const accounting_base_definition Bool)
(declare-const buy_back_shortterm_inclusion_applied Bool)
(declare-const company_total_issued_shares Int)
(declare-const financial_bond_issuance Real)
(declare-const investment_limit_adjustable Bool)
(declare-const investment_limit_buy_back_shortterm_inclusion Bool)
(declare-const investment_limit_otc_stock_and_equity Real)
(declare-const investment_limit_per_company_stock_and_bond Real)
(declare-const investment_limit_securities_broker_holdings Real)
(declare-const investment_limit_sell_back_shortterm_exclusion Bool)
(declare-const investment_limit_shortterm_exceptions Bool)
(declare-const investment_limit_stock_and_equity Real)
(declare-const investment_limit_total_shortterm_and_others Real)
(declare-const investment_limit_unrated_or_lowrated_shortterm Bool)
(declare-const investment_otc_stock_and_equity_cost Real)
(declare-const investment_per_company_stock_and_bond Real)
(declare-const investment_stock_and_equity_cost Real)
(declare-const investment_total_shortterm_and_others_cost Real)
(declare-const investment_unrated_or_lowrated_shortterm_cost Real)
(declare-const penalty Bool)
(declare-const regulator_adjusted_limit Real)
(declare-const securities_broker_holdings_over_one_year_included Bool)
(declare-const sell_back_shortterm_exclusion_applied Bool)
(declare-const total_deposits Real)
(declare-const total_deposits_correctly_calculated Bool)
(declare-const total_deposits_definition Bool)
(declare-const unrated_shortterm_exceptions_applied Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:investment_limit_stock_and_equity] 商業銀行投資於集中交易市場與店頭市場股票等原始取得成本總餘額不得超過核算基數30%
(assert (= investment_limit_stock_and_equity
   (ite (<= investment_stock_and_equity_cost (* (/ 3.0 10.0) accounting_base))
        1.0
        0.0)))

; [bank:investment_limit_otc_stock_and_equity] 商業銀行投資於店頭市場股票及相關權證原始取得成本總餘額不得超過核算基數5%
(assert (= investment_limit_otc_stock_and_equity
   (ite (<= investment_otc_stock_and_equity_cost
            (* (/ 1.0 20.0) accounting_base))
        1.0
        0.0)))

; [bank:investment_limit_unrated_or_lowrated_shortterm] 商業銀行投資於無信用評等或信用評等未達一定等級短期票券等原始取得成本總餘額不得超過核算基數10%，但符合信用評等例外不計入
(assert (= investment_limit_unrated_or_lowrated_shortterm
   (<= investment_unrated_or_lowrated_shortterm_cost
       (* (/ 1.0 10.0) accounting_base))))

; [bank:investment_limit_shortterm_exceptions] 符合信用評等例外之短期票券不計入10%限額
(assert (= investment_limit_shortterm_exceptions unrated_shortterm_exceptions_applied))

; [bank:investment_limit_total_shortterm_and_others] 銀行投資於第二點第一項各種有價證券總餘額（除政府公債等）不得超過存款總餘額及金融債券發售額和的25%
(assert (let ((a!1 (ite (<= investment_total_shortterm_and_others_cost
                    (+ (* (/ 1.0 4.0) total_deposits)
                       (* (/ 1.0 4.0) financial_bond_issuance)))
                1.0
                0.0)))
  (= investment_limit_total_shortterm_and_others a!1)))

; [bank:investment_limit_securities_broker_holdings] 銀行兼營證券商持有一年以上未賣出有價證券應計入前三款限額
(assert (= investment_limit_securities_broker_holdings
   (ite securities_broker_holdings_over_one_year_included 1.0 0.0)))

; [bank:investment_limit_sell_back_shortterm_exclusion] 銀行以附賣回條件買入短期票券及債券餘額不計入限額
(assert (= investment_limit_sell_back_shortterm_exclusion
   sell_back_shortterm_exclusion_applied))

; [bank:investment_limit_buy_back_shortterm_inclusion] 銀行以附買回條件賣出短期票券及債券餘額應計入限額
(assert (= investment_limit_buy_back_shortterm_inclusion
   buy_back_shortterm_inclusion_applied))

; [bank:investment_limit_per_company_stock_and_bond] 商業銀行投資於每一公司股票及相關權證股份總額不得超過該公司已發行股份總數5%
(assert (let ((a!1 (ite (<= investment_per_company_stock_and_bond
                    (* (/ 1.0 20.0) (to_real company_total_issued_shares)))
                1.0
                0.0)))
  (= investment_limit_per_company_stock_and_bond a!1)))

; [bank:accounting_base_definition] 核算基數為上會計年度決算後淨值扣除特定項目後餘額，年度中現金增資計入，現金股利扣除
(assert (= accounting_base_definition accounting_base_correctly_calculated))

; [bank:accounting_base_deductions] 核算基數扣除銀行對其他銀行持股超過一年以上原始取得成本及轉投資銀行以外其他企業原始取得成本
(assert (= accounting_base_deductions (ite accounting_base_deductions_applied 1.0 0.0)))

; [bank:total_deposits_definition] 存款總餘額包括活期、定期、支票、中華郵政轉存款及外幣存款
(assert (= total_deposits_definition total_deposits_correctly_calculated))

; [bank:investment_limit_adjustable] 主管機關得視國內經濟金融情形調整第一款投資有價證券限額
(assert (= investment_limit_adjustable (= regulator_adjusted_limit 1.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一投資有價證券限額規定時處罰
(assert (= penalty
   (or (not (= investment_limit_securities_broker_holdings 1.0))
       (not total_deposits_definition)
       (not (= investment_limit_stock_and_equity 1.0))
       (not investment_limit_unrated_or_lowrated_shortterm)
       (not investment_limit_sell_back_shortterm_exclusion)
       (not (= investment_limit_per_company_stock_and_bond 1.0))
       (not investment_limit_buy_back_shortterm_inclusion)
       (not (= investment_limit_total_shortterm_and_others 1.0))
       (not (= accounting_base_deductions 1.0))
       (not investment_limit_shortterm_exceptions)
       (not accounting_base_definition)
       (not (= investment_limit_otc_stock_and_equity 1.0)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= accounting_base 10000000))
(assert (= accounting_base_correctly_calculated true))
(assert (= accounting_base_deductions 0))
(assert (= accounting_base_deductions_applied true))
(assert (= accounting_base_definition true))
(assert (= buy_back_shortterm_inclusion_applied true))
(assert (= company_total_issued_shares 100000000))
(assert (= financial_bond_issuance 2000000))
(assert (= investment_limit_adjustable false))
(assert (= investment_limit_buy_back_shortterm_inclusion false))
(assert (= investment_limit_otc_stock_and_equity 400000))
(assert (= investment_limit_per_company_stock_and_bond 4000000))
(assert (= investment_limit_securities_broker_holdings 0))
(assert (= investment_limit_sell_back_shortterm_exclusion false))
(assert (= investment_limit_shortterm_exceptions false))
(assert (= investment_limit_stock_and_equity 2500000))
(assert (= investment_limit_total_shortterm_and_others 2500000))
(assert (= investment_otc_stock_and_equity_cost 400000))
(assert (= investment_per_company_stock_and_bond 4000000))
(assert (= investment_stock_and_equity_cost 2500000))
(assert (= investment_total_shortterm_and_others_cost 2500000))
(assert (= investment_unrated_or_lowrated_shortterm_cost 1300000))
(assert (= penalty true))
(assert (= regulator_adjusted_limit 0))
(assert (= securities_broker_holdings_over_one_year_included false))
(assert (= sell_back_shortterm_exclusion_applied false))
(assert (= total_deposits 8000000))
(assert (= total_deposits_correctly_calculated true))
(assert (= total_deposits_definition true))
(assert (= unrated_shortterm_exceptions_applied false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 31
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
