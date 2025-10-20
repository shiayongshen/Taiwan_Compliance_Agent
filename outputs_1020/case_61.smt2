; SMT2 file generated from compliance case automatic
; Case ID: case_61
; Generated at: 2025-10-19T06:56:47.590522
;
; This file can be executed with Z3:
;   z3 case_61.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_improvement_plan_completed Bool)
(declare-const capital_improvement_plan_overdue Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_penalty Bool)
(declare-const financial_deterioration Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_completed_on_time Bool)
(declare-const improvement_plan_failed Bool)
(declare-const improvement_plan_not_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const penalty Bool)
(declare-const regulatory_action_required Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_control_executed] 執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:internal_handling_executed] 執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:internal_control_ok] 內部控制及稽核制度建立且執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 內部處理制度及程序建立且執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著惡化, 4=嚴重不足）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio)))
                3
                a!1)))
  (= capital_level (ite (<= 50.0 capital_adequacy_ratio) a!2 4)))))

; [insurance:capital_improvement_plan_completed] 增資、財務或業務改善計畫或合併於主管機關規定期限內完成
(assert (= capital_improvement_plan_completed improvement_plan_completed_on_time))

; [insurance:capital_improvement_plan_overdue] 增資、財務或業務改善計畫或合併未於主管機關規定期限內完成
(assert (not (= capital_improvement_plan_completed capital_improvement_plan_overdue)))

; [insurance:capital_severely_insufficient_penalty] 資本嚴重不足且未於期限完成改善計畫
(assert (= capital_severely_insufficient_penalty
   (and (= 4 capital_level) capital_improvement_plan_overdue)))

; [insurance:financial_deterioration] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= financial_deterioration financial_or_business_deterioration))

; [insurance:improvement_plan_submitted_and_approved] 提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_not_effective] 損益、淨值加速惡化或輔導未改善致仍有惡化之虞
(assert (= improvement_plan_not_effective improvement_plan_failed))

; [insurance:regulatory_action_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= regulatory_action_required
   (or capital_severely_insufficient_penalty
       (and financial_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_not_effective))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行內部控制或內部處理制度，或資本嚴重不足且未完成改善計畫，或財務惡化未改善時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       regulatory_action_required)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= capital_improvement_plan_completed false))
(assert (= capital_improvement_plan_overdue true))
(assert (= financial_or_business_deterioration true))
(assert (= financial_deterioration true))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_completed_on_time false))
(assert (= improvement_plan_failed false))
(assert (= improvement_plan_not_effective false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= penalty true))
(assert (= regulatory_action_required true))
(assert (= capital_level 0))
(assert (= capital_severely_insufficient_penalty false))
(assert (= internal_control_ok false))
(assert (= internal_handling_ok false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 25
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
