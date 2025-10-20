; SMT2 file generated from compliance case automatic
; Case ID: case_414
; Generated at: 2025-10-19T15:17:06.905225
;
; This file can be executed with Z3:
;   z3 case_414.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_improvement_completed Bool)
(declare-const capital Real)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const financial_improvement_completed Bool)
(declare-const financial_or_business_condition_worsened Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_completed_within_deadline Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_and_handling_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const real_estate_investment_compliance Bool)
(declare-const real_estate_investment_immediate_use_and_income Bool)
(declare-const real_estate_valuation_by_legal_institution Bool)
(declare-const real_estate_valuation_compliance Bool)
(declare-const self_use_real_estate_investment Bool)
(declare-const severely_insufficient_and_no_improvement Bool)
(declare-const significantly_worsened_and_no_approved_plan Bool)
(declare-const social_housing_only_for_rent Bool)
(declare-const total_real_estate_investment Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:real_estate_investment_compliance] 不動產投資符合即時利用有收益及投資額度限制
(assert (let ((a!1 (<= (+ total_real_estate_investment
                  (* (- 1.0) (ite self_use_real_estate_investment 1.0 0.0)))
               (* (/ 3.0 10.0) capital))))
(let ((a!2 (or social_housing_only_for_rent
               (and real_estate_investment_immediate_use_and_income
                    a!1
                    (>= owner_equity
                        (ite self_use_real_estate_investment 1.0 0.0))))))
  (= real_estate_investment_compliance a!2))))

; [insurance:real_estate_valuation_compliance] 不動產取得及處分經合法鑑價機構評價
(assert (= real_estate_valuation_compliance real_estate_valuation_by_legal_institution))

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:improvement_plan_submitted_and_approved] 已提交且核定財務或業務改善計畫
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_completed_within_deadline] 於主管機關規定期限內完成增資、改善計畫或合併
(assert (= improvement_plan_completed_within_deadline
   (or financial_improvement_completed
       merger_completed
       capital_increase_completed
       business_improvement_completed)))

; [insurance:severely_insufficient_and_no_improvement] 資本嚴重不足且未於期限完成增資或改善計畫
(assert (= severely_insufficient_and_no_improvement
   (and (= 4 capital_level) (not improvement_plan_completed_within_deadline))))

; [insurance:significantly_worsened_and_no_approved_plan] 財務或業務狀況顯著惡化且未提出核定改善計畫
(assert (= significantly_worsened_and_no_approved_plan
   (and financial_or_business_condition_worsened
        (not improvement_plan_submitted_and_approved))))

; [insurance:internal_control_and_handling_compliance] 內部控制及稽核制度與內部處理制度及程序均已建立
(assert (= internal_control_and_handling_compliance
   (and internal_control_established internal_handling_established)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反不動產投資限制、未經合法鑑價、未建立內部控制或處理制度，或資本嚴重不足且未完成改善計畫時處罰
(assert (= penalty
   (or significantly_worsened_and_no_approved_plan
       (not internal_handling_established)
       severely_insufficient_and_no_improvement
       (not real_estate_investment_compliance)
       (not real_estate_valuation_compliance)
       (not internal_control_established))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= real_estate_investment_compliance false))
(assert (= real_estate_investment_immediate_use_and_income false))
(assert (= total_real_estate_investment 1061535.0))
(assert (= self_use_real_estate_investment false))
(assert (= capital 10000000.0))
(assert (= owner_equity 5000000.0))
(assert (= real_estate_valuation_by_legal_institution false))
(assert (= real_estate_valuation_compliance false))
(assert (= internal_control_system_established false))
(assert (= internal_control_established false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_established false))
(assert (= financial_or_business_condition_worsened true))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= improvement_plan_completed_within_deadline false))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 1000000.0))
(assert (= net_worth_ratio 5.0))
(assert (= capital_level 1))
(assert (= capital_increase_completed false))
(assert (= financial_improvement_completed false))
(assert (= business_improvement_completed false))
(assert (= merger_completed false))
(assert (= severely_insufficient_and_no_improvement false))
(assert (= significantly_worsened_and_no_approved_plan true))
(assert (= penalty true))
(assert (= social_housing_only_for_rent false))
(assert (= internal_control_and_handling_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 30
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
