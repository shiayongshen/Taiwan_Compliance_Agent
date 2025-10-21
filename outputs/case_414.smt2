; SMT2 file generated from compliance case automatic
; Case ID: case_414
; Generated at: 2025-10-21T09:05:16.622030
;
; This file can be executed with Z3:
;   z3 case_414.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_fund Real)
(declare-const capital_improvement_measures_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_severe_insufficient_and_no_measures Bool)
(declare-const capital_level_value Real)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_deterioration_and_no_improvement_plan Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_handling_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const real_estate_has_income Bool)
(declare-const real_estate_immediate_use Bool)
(declare-const real_estate_immediate_use_and_income Bool)
(declare-const real_estate_investment_limit Real)
(declare-const real_estate_valuation_done Bool)
(declare-const real_estate_valuation_required Bool)
(declare-const self_use_real_estate_investment Real)
(declare-const social_housing_only_rental Bool)
(declare-const total_real_estate_investment Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:real_estate_investment_limit] 不動產投資總額除自用不動產外不得超過資金30%，自用不動產總額不得超過業主權益總額
(assert (let ((a!1 (and (<= (+ total_real_estate_investment
                       (* (- 1.0) self_use_real_estate_investment))
                    (* 30.0 capital_fund))
                (<= self_use_real_estate_investment owner_equity))))
  (= real_estate_investment_limit (ite a!1 1.0 0.0))))

; [insurance:real_estate_immediate_use_and_income] 不動產投資以即時利用並有收益者為限，住宅法興辦社會住宅且僅供租賃者不受此限
(assert (= real_estate_immediate_use_and_income
   (or social_housing_only_rental
       real_estate_immediate_use
       real_estate_has_income)))

; [insurance:real_estate_valuation_required] 不動產取得及處分應經合法不動產鑑價機構評價
(assert (= real_estate_valuation_required real_estate_valuation_done))

; [insurance:internal_control_and_audit_established] 建立內部控制及稽核制度
(assert (= internal_control_and_audit_established internal_control_established))

; [insurance:internal_handling_system_established] 建立內部處理制度及程序
(assert (= internal_handling_system_established internal_handling_established))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著惡化, 4=嚴重不足）
(assert (= capital_level (ite (<= 0.0 capital_level_value) 0 4)))

; [insurance:capital_level_severe_insufficient_and_no_measures] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_severe_insufficient_and_no_measures
   (and (= 4 capital_level) (not capital_improvement_measures_completed))))

; [insurance:financial_or_business_deterioration_and_no_improvement_plan] 財務或業務狀況顯著惡化且未提出或未核定改善計畫
(assert (= financial_or_business_deterioration_and_no_improvement_plan
   (and financial_or_business_deterioration
        (not improvement_plan_submitted_and_approved))))

; [insurance:internal_control_and_handling_compliance] 內部控制及稽核制度與內部處理制度及程序均已建立且執行
(assert (= internal_control_and_handling_compliance
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反不動產投資限制、未經鑑價、未建立內部控制或內部處理制度，或資本嚴重不足且未完成改善措施
(assert (let ((a!1 (or capital_level_severe_insufficient_and_no_measures
               (not internal_control_and_handling_compliance)
               financial_or_business_deterioration_and_no_improvement_plan
               (not (and real_estate_immediate_use_and_income
                         (= real_estate_investment_limit 1.0)
                         real_estate_valuation_required)))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_fund 1000000))
(assert (= total_real_estate_investment 1460000000))
(assert (= self_use_real_estate_investment 0))
(assert (= owner_equity 4000000000))
(assert (= real_estate_valuation_done false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= social_housing_only_rental false))
(assert (= real_estate_immediate_use false))
(assert (= real_estate_has_income false))
(assert (= capital_level_value -1))
(assert (= capital_improvement_measures_completed false))
(assert (= capital_level 4))
(assert (= financial_or_business_deterioration true))
(assert (= improvement_plan_submitted_and_approved false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 26
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
