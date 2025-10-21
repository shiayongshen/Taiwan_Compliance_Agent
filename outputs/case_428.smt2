; SMT2 file generated from compliance case automatic
; Case ID: case_428
; Generated at: 2025-10-21T09:25:14.690701
;
; This file can be executed with Z3:
;   z3 case_428.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const financial_deterioration Bool)
(declare-const financial_deterioration_flag Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_not_effective Bool)
(declare-const improvement_plan_not_effective_flag Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_flag Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_executed_flag Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_established_flag Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_executed_flag Bool)
(declare-const internal_handling_ok Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const regulatory_action_required Bool)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_handling Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_established_flag))

; [insurance:internal_control_executed] 執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_executed_flag))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_established_flag))

; [insurance:internal_handling_executed] 執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_executed_flag))

; [insurance:internal_control_ok] 內部控制及稽核制度建立且執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 內部處理制度及程序建立且執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

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

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level) (not capital_level_4_measures_completed))))

; [insurance:financial_deterioration] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= financial_deterioration financial_deterioration_flag))

; [insurance:improvement_plan_submitted] 已提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted improvement_plan_approved))

; [insurance:improvement_plan_not_effective] 損益、淨值加速惡化或輔導未改善，仍有惡化之虞
(assert (= improvement_plan_not_effective improvement_plan_not_effective_flag))

; [insurance:regulatory_action_required] 需監管、接管、勒令停業清理或命令解散之處分
(assert (= regulatory_action_required
   (or capital_level_4_noncompliance
       (and (not capital_level_4_noncompliance)
            financial_deterioration
            improvement_plan_submitted
            improvement_plan_not_effective))))

; [insurance:violation_internal_control] 違反未建立或未執行內部控制及稽核制度
(assert (= violation_internal_control
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violation_internal_handling] 違反未建立或未執行內部處理制度及程序
(assert (= violation_internal_handling
   (or (not internal_handling_established) (not internal_handling_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制或內部處理制度規定時處罰
(assert (= penalty (or violation_internal_control violation_internal_handling)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_level_4_measures_completed false))
(assert (= financial_deterioration_flag false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_not_effective_flag false))
(assert (= improvement_plan_submitted false))
(assert (= internal_control_established_flag false))
(assert (= internal_control_executed_flag false))
(assert (= internal_handling_established_flag false))
(assert (= internal_handling_executed_flag false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 26
; Total facts: 12
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
