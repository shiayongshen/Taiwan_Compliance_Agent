; SMT2 file generated from compliance case automatic
; Case ID: case_173
; Generated at: 2025-10-19T09:50:30.146778
;
; This file can be executed with Z3:
;   z3 case_173.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_and_no_improvement Bool)
(declare-const approved_financial_or_business_improvement_plan_submitted Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_lower_priority Int)
(declare-const financial_or_business_condition_significantly_deteriorated Bool)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const improvement_after_guidance Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const profit_loss_and_net_worth_accelerated_deterioration Bool)
(declare-const serious_insufficiency_and_no_compliance Bool)
(declare-const significant_deterioration_and_no_approved_plan Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

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

; [insurance:capital_level_lower_priority] 資本等級以較低等級為準（同時符合多等級時）
(assert (= capital_level_lower_priority capital_level))

; [insurance:serious_insufficiency_and_no_compliance] 資本嚴重不足且未於期限完成增資、改善計畫或合併
(assert (= serious_insufficiency_and_no_compliance
   (and (= 4 capital_level)
        (not capital_increase_completed)
        (not financial_or_business_improvement_plan_completed)
        (not merger_completed))))

; [insurance:significant_deterioration_and_no_approved_plan] 財務或業務狀況顯著惡化且未提出核定改善計畫
(assert (= significant_deterioration_and_no_approved_plan
   (and financial_or_business_condition_significantly_deteriorated
        (not approved_financial_or_business_improvement_plan_submitted))))

; [insurance:accelerated_deterioration_and_no_improvement] 損益、淨值加速惡化且經輔導仍未改善
(assert (= accelerated_deterioration_and_no_improvement
   (and profit_loss_and_net_worth_accelerated_deterioration
        (not improvement_after_guidance))))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或財務狀況惡化未提出核定計畫，或加速惡化未改善時處罰
(assert (= penalty
   (or serious_insufficiency_and_no_compliance
       accelerated_deterioration_and_no_improvement
       significant_deterioration_and_no_approved_plan)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio (/ 5.0 2.0)))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= financial_or_business_condition_significantly_deteriorated false))
(assert (= approved_financial_or_business_improvement_plan_submitted false))
(assert (= profit_loss_and_net_worth_accelerated_deterioration false))
(assert (= improvement_after_guidance false))
(assert (= accelerated_deterioration_and_no_improvement false))
(assert (= serious_insufficiency_and_no_compliance false))
(assert (= significant_deterioration_and_no_approved_plan false))
(assert (= penalty true))
(assert (= capital_level 0))
(assert (= capital_level_lower_priority 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 16
; Total facts: 16
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
