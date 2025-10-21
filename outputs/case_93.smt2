; SMT2 file generated from compliance case automatic
; Case ID: case_93
; Generated at: 2025-10-21T01:28:27.673596
;
; This file can be executed with Z3:
;   z3 case_93.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_fund Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const owner_equity_total Real)
(declare-const penalty Bool)
(declare-const real_estate_has_income Bool)
(declare-const real_estate_in_use Bool)
(declare-const real_estate_investment_compliance Bool)
(declare-const real_estate_investment_limit Real)
(declare-const real_estate_total_investment Real)
(declare-const real_estate_valuation_done Bool)
(declare-const real_estate_valuation_required Bool)
(declare-const self_use_real_estate_investment Real)
(declare-const self_use_real_estate_limit Real)
(declare-const social_housing_exemption Bool)
(declare-const social_housing_only_rental Bool)
(declare-const violate_146_1 Bool)
(declare-const violate_146_2 Bool)
(declare-const violate_146_3 Bool)
(declare-const violate_146_4 Bool)
(declare-const violate_146_5 Bool)
(declare-const violate_146_6 Bool)
(declare-const violate_146_7 Bool)
(declare-const violate_146_8 Bool)
(declare-const violate_146_9 Bool)
(declare-const violation_of_investment_regulations Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:real_estate_investment_limit] 不動產投資總額除自用不動產外不得超過資金30%
(assert (let ((a!1 (ite (<= (+ real_estate_total_investment
                       (* (- 1.0) self_use_real_estate_investment))
                    (* 30.0 capital_fund))
                1.0
                0.0)))
  (= real_estate_investment_limit a!1)))

; [insurance:self_use_real_estate_limit] 自用不動產總額不得超過業主權益總額
(assert (= self_use_real_estate_limit
   (ite (<= self_use_real_estate_investment owner_equity_total) 1.0 0.0)))

; [insurance:real_estate_valuation_required] 不動產取得及處分應經合法鑑價機構評價
(assert (= real_estate_valuation_required real_estate_valuation_done))

; [insurance:social_housing_exemption] 依住宅法興辦社會住宅且僅供租賃者，不受即時利用並有收益限制
(assert (= social_housing_exemption social_housing_only_rental))

; [insurance:real_estate_investment_compliance] 不動產投資符合即時利用並有收益限制或社會住宅例外
(assert (= real_estate_investment_compliance
   (or social_housing_only_rental
       (and real_estate_in_use real_estate_has_income))))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級4措施已執行
(assert (= capital_level_4_measures_executed level_4_measures_executed))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級3措施已執行
(assert (= capital_level_3_measures_executed level_3_measures_executed))

; [insurance:capital_level_2_measures_executed] 資本不足等級2措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:violation_of_investment_regulations] 違反資金運用相關規定
(assert (= violation_of_investment_regulations
   (or violate_146_1
       violate_146_2
       violate_146_3
       violate_146_4
       violate_146_5
       violate_146_6
       violate_146_7
       violate_146_8
       violate_146_9)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反資金運用規定或資本不足且未執行對應措施時處罰
(assert (= penalty
   (or violation_of_investment_regulations
       (and (= 2 capital_level) (not capital_level_2_measures_executed))
       (and (= 3 capital_level) (not capital_level_3_measures_executed))
       (and (= 4 capital_level) (not capital_level_4_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 120.0))
(assert (= capital_fund 1000000000))
(assert (= net_worth 500000000))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= real_estate_total_investment 400000000))
(assert (= self_use_real_estate_investment 100000000))
(assert (= owner_equity_total 300000000))
(assert (= real_estate_valuation_done true))
(assert (= social_housing_only_rental false))
(assert (= real_estate_in_use false))
(assert (= real_estate_has_income false))
(assert (= violate_146_1 true))
(assert (= violate_146_2 false))
(assert (= violate_146_3 false))
(assert (= violate_146_4 false))
(assert (= violate_146_5 false))
(assert (= violate_146_6 false))
(assert (= violate_146_7 false))
(assert (= violate_146_8 false))
(assert (= violate_146_9 false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= level_3_measures_executed false))
(assert (= level_4_measures_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 35
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
