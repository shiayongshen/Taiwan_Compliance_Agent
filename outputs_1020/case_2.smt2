; SMT2 file generated from compliance case automatic
; Case ID: case_2
; Generated at: 2025-10-19T04:45:52.093289
;
; This file can be executed with Z3:
;   z3 case_2.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_compliance Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient Bool)
(declare-const capital_level Int)
(declare-const final_capital_level Int)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const insufficient_measures_executed Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_prev Real)
(declare-const own_capital Real)
(declare-const owner_equity Real)
(declare-const owner_equity_prev Real)
(declare-const penalty Bool)
(declare-const risk_capital Real)
(declare-const severely_insufficient_measures_executed Bool)
(declare-const significantly_insufficient_measures_executed Bool)
(declare-const total_assets_excluding_investment_accounts Real)
(declare-const total_assets_excluding_investment_accounts_prev Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足, 0=未分類）
(assert (let ((a!1 (or (not (>= (/ capital_adequacy_ratio risk_capital) (/ 1.0 2.0)))
               (not (<= 0.0 net_worth))))
      (a!2 (and (>= (/ capital_adequacy_ratio risk_capital) (/ 1.0 2.0))
                (not (>= (/ capital_adequacy_ratio risk_capital) (/ 3.0 2.0)))))
      (a!4 (and (>= (/ capital_adequacy_ratio risk_capital) (/ 3.0 2.0))
                (not (>= (/ capital_adequacy_ratio risk_capital) 2.0))))
      (a!6 (ite (and (>= (/ capital_adequacy_ratio risk_capital) 2.0)
                     (or (>= net_worth_ratio_prev (/ 3.0 100.0))
                         (>= net_worth_ratio (/ 3.0 100.0))))
                1
                0)))
(let ((a!3 (or a!2
               (and (not (>= net_worth_ratio_prev (/ 3.0 100.0)))
                    (not (>= net_worth_ratio (/ 3.0 100.0)))
                    (>= net_worth_ratio_prev 0.0))))
      (a!5 (or a!4
               (and (not (>= net_worth_ratio_prev (/ 1.0 50.0)))
                    (not (>= net_worth_ratio (/ 1.0 50.0)))
                    (>= net_worth_ratio_prev 0.0)))))
  (= capital_level (ite a!1 4 (ite a!3 3 (ite a!5 2 a!6)))))))

; [fhc:capital_level_lowest] 保險業資本等級以較低等級為最終資本等級
(assert (= final_capital_level capital_level))

; [fhc:capital_adequacy_ratio] 保險業資本適足率計算
(assert (= capital_adequacy_ratio (* 100.0 (/ own_capital risk_capital))))

; [fhc:net_worth_ratio] 保險業淨值比率計算
(assert (= net_worth_ratio
   (* 100.0 (/ owner_equity total_assets_excluding_investment_accounts))))

; [fhc:net_worth_ratio_prev] 保險業最近一期淨值比率
(assert (= net_worth_ratio_prev
   (* 100.0
      (/ owner_equity_prev total_assets_excluding_investment_accounts_prev))))

; [fhc:capital_adequacy_compliance] 資本適足率及淨值比率符合最低標準
(assert (= capital_adequacy_compliance
   (and (<= 200.0 capital_adequacy_ratio)
        (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))))

; [fhc:capital_insufficient] 資本不足等級（2、3、4）
(assert (= capital_insufficient (<= 2 final_capital_level)))

; [fhc:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施已執行
(assert (= severely_insufficient_measures_executed level_4_measures_executed))

; [fhc:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施已執行
(assert (= significantly_insufficient_measures_executed level_3_measures_executed))

; [fhc:capital_insufficient_measures_executed] 資本不足等級措施已執行
(assert (= insufficient_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本不足且未執行對應等級措施時處罰
(assert (= penalty
   (or (and (= 4 final_capital_level)
            (not severely_insufficient_measures_executed))
       (and (= 3 final_capital_level)
            (not significantly_insufficient_measures_executed))
       (and (= 2 final_capital_level) (not insufficient_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 169.0))
(assert (= risk_capital 100.0))
(assert (= net_worth 5.0))
(assert (= net_worth_ratio 5.0))
(assert (= net_worth_ratio_prev 5.0))
(assert (= owner_equity 5.0))
(assert (= owner_equity_prev 5.0))
(assert (= total_assets_excluding_investment_accounts 100.0))
(assert (= total_assets_excluding_investment_accounts_prev 100.0))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_executed false))
(assert (= level_4_measures_executed false))
(assert (= level_3_measures_executed false))
(assert (= capital_adequacy_compliance false))
(assert (= capital_adequacy_ratio 0.0))
(assert (= capital_insufficient false))
(assert (= capital_level 0))
(assert (= final_capital_level 0))
(assert (= insufficient_measures_executed false))
(assert (= penalty false))
(assert (= severely_insufficient_measures_executed false))
(assert (= significantly_insufficient_measures_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 22
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
