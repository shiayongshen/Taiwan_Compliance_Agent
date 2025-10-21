; SMT2 file generated from compliance case automatic
; Case ID: case_372
; Generated at: 2025-10-21T08:18:56.956929
;
; This file can be executed with Z3:
;   z3 case_372.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bond_issuance_amount Real)
(declare-const capital_base Real)
(declare-const capital_base_deductions Real)
(declare-const cash_dividend_this_year Real)
(declare-const cash_increase_this_year Real)
(declare-const company_total_shares Real)
(declare-const cost_other_bank_shares_over_1yr Real)
(declare-const cost_other_enterprise_investments Real)
(declare-const cost_otsm_stock Real)
(declare-const cost_stock_etc Real)
(declare-const cost_total_except_gov Real)
(declare-const cost_unrated_shortterm Real)
(declare-const deposit_total Real)
(declare-const investment_limit_otsm_stock Real)
(declare-const investment_limit_per_company_stock_bond Real)
(declare-const investment_limit_repo_shortterm_exclusion Real)
(declare-const investment_limit_reverse_repo_shortterm_inclusion Real)
(declare-const investment_limit_securities_hold_over_1yr Real)
(declare-const investment_limit_stock_etc Real)
(declare-const investment_limit_total_except_gov Real)
(declare-const investment_limit_unrated_shortterm Real)
(declare-const investment_per_company Real)
(declare-const net_worth_last_year Real)
(declare-const penalty Bool)
(declare-const repo_shortterm_excluded Bool)
(declare-const reverse_repo_shortterm_included Bool)
(declare-const securities_hold_over_1yr_included Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:investment_limit_stock_etc] 商業銀行投資於集中交易市場與店頭市場股票等原始取得成本總餘額不得超過核算基數30%
(assert (= investment_limit_stock_etc
   (ite (<= cost_stock_etc (* 30.0 capital_base)) 1.0 0.0)))

; [bank:investment_limit_otsm_stock] 商業銀行投資於店頭市場股票等原始取得成本總餘額不得超過核算基數5%
(assert (= investment_limit_otsm_stock
   (ite (<= cost_otsm_stock (* 5.0 capital_base)) 1.0 0.0)))

; [bank:investment_limit_unrated_shortterm] 商業銀行投資於無信用評等或信用評等未達標準短期票券等原始取得成本總餘額不得超過核算基數10%
(assert (= investment_limit_unrated_shortterm
   (ite (<= cost_unrated_shortterm (* 10.0 capital_base)) 1.0 0.0)))

; [bank:investment_limit_total_except_gov] 銀行投資於第二點第一項各種有價證券總餘額（除政府公債等）不得超過存款總餘額及金融債券發售額和25%
(assert (let ((a!1 (ite (<= cost_total_except_gov
                    (+ (* 25.0 deposit_total) (* 25.0 bond_issuance_amount)))
                1.0
                0.0)))
  (= investment_limit_total_except_gov a!1)))

; [bank:investment_limit_securities_hold_over_1yr] 銀行兼營證券商持有一年以上有價證券應計入前三款限額
(assert (= investment_limit_securities_hold_over_1yr
   (ite securities_hold_over_1yr_included 1.0 0.0)))

; [bank:investment_limit_repo_shortterm_exclusion] 銀行以附賣回條件買入短期票券及債券餘額不計入前三款限額
(assert (= investment_limit_repo_shortterm_exclusion
   (ite repo_shortterm_excluded 1.0 0.0)))

; [bank:investment_limit_reverse_repo_shortterm_inclusion] 銀行以附買回條件賣出短期票券及債券餘額應計入前三款限額
(assert (= investment_limit_reverse_repo_shortterm_inclusion
   (ite reverse_repo_shortterm_included 1.0 0.0)))

; [bank:investment_limit_per_company_stock_bond] 商業銀行投資於每一公司股票及債券換股權利證書股份總額不得超過該公司已發行股份總數5%
(assert (= investment_limit_per_company_stock_bond
   (ite (<= investment_per_company (* 5.0 company_total_shares)) 1.0 0.0)))

; [bank:capital_base_definition] 核算基數為上會計年度決算後淨值扣除特定項目後餘額，年度中現金增資計入，現金股利減除
(assert (= capital_base
   (+ net_worth_last_year
      cash_increase_this_year
      (* (- 1.0) cash_dividend_this_year))))

; [bank:capital_base_deductions] 核算基數扣除對其他銀行持股超過一年原始取得成本及轉投資銀行以外其他企業原始取得成本
(assert (= capital_base_deductions
   (+ capital_base
      (* (- 1.0) cost_other_bank_shares_over_1yr)
      (* (- 1.0) cost_other_enterprise_investments))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反投資有價證券種類及限額規定時處罰
(assert (= penalty
   (or (not (= investment_limit_repo_shortterm_exclusion 1.0))
       (not (= investment_limit_per_company_stock_bond 1.0))
       (not (= investment_limit_securities_hold_over_1yr 1.0))
       (not (= investment_limit_otsm_stock 1.0))
       (not (= investment_limit_unrated_shortterm 1.0))
       (not (= investment_limit_total_except_gov 1.0))
       (not (= investment_limit_reverse_repo_shortterm_inclusion 1.0))
       (not (= investment_limit_stock_etc 1.0)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= net_worth_last_year 1000000000))
(assert (= cash_increase_this_year 0))
(assert (= cash_dividend_this_year 0))
(assert (= capital_base 1000000000))
(assert (= cost_unrated_shortterm 130000000))
(assert (= cost_stock_etc 0))
(assert (= cost_otsm_stock 0))
(assert (= cost_total_except_gov 0))
(assert (= deposit_total 0))
(assert (= bond_issuance_amount 0))
(assert (= cost_other_bank_shares_over_1yr 0))
(assert (= cost_other_enterprise_investments 0))
(assert (= investment_per_company 0))
(assert (= company_total_shares 0))
(assert (= repo_shortterm_excluded true))
(assert (= reverse_repo_shortterm_included true))
(assert (= securities_hold_over_1yr_included true))
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
; Total variables: 27
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
