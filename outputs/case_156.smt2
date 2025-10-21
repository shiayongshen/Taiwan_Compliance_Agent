; SMT2 file generated from compliance case automatic
; Case ID: case_156
; Generated at: 2025-10-21T03:31:41.010071
;
; This file can be executed with Z3:
;   z3 case_156.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_adequate Bool)
(declare-const capital_insufficient Bool)
(declare-const capital_level Int)
(declare-const capital_severe_insufficient_and_no_improvement Bool)
(declare-const capital_severely_insufficient Bool)
(declare-const capital_significantly_insufficient Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_deterioration_flag Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_flag Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_done Bool)
(declare-const improvement_plan_not_effective Bool)
(declare-const improvement_plan_not_effective_flag Bool)
(declare-const improvement_plan_overdue Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_handling_established_and_executed Bool)
(declare-const loss_or_net_worth_accelerated_deterioration Bool)
(declare-const loss_or_net_worth_accelerated_deterioration_flag Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_prev Real)
(declare-const penalty Bool)
(declare-const regulatory_action_required Bool)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_control_and_handling Bool)
(declare-const violation_internal_handling Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio))
               (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))))
      (a!2 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))
                1
                0)))
(let ((a!3 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                (ite a!1 2 a!2))))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!3)))
  (= capital_level a!4)))))

; [insurance:capital_level_lowest_rule] 資本等級以較低等級為準
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio)))
                3
                a!1)))
  (= capital_level (ite (<= 50.0 capital_adequacy_ratio) a!2 4)))))

; [insurance:capital_severely_insufficient] 資本嚴重不足等級判定
(assert (= capital_severely_insufficient (= 4 capital_level)))

; [insurance:capital_significantly_insufficient] 資本顯著不足等級判定
(assert (= capital_significantly_insufficient (= 3 capital_level)))

; [insurance:capital_insufficient] 資本不足等級判定
(assert (= capital_insufficient (= 2 capital_level)))

; [insurance:capital_adequate] 資本適足等級判定
(assert (= capital_adequate (= 1 capital_level)))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限內完成
(assert (= improvement_plan_completed improvement_plan_done))

; [insurance:improvement_plan_overdue] 增資、財務或業務改善計畫或合併未於主管機關規定期限內完成
(assert (not (= improvement_plan_completed improvement_plan_overdue)))

; [insurance:capital_severe_insufficient_and_no_improvement] 資本嚴重不足且未依主管機關規定期限完成增資、財務或業務改善計畫或合併
(assert (= capital_severe_insufficient_and_no_improvement
   (and capital_severely_insufficient improvement_plan_overdue)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration financial_or_business_deterioration_flag))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_flag))

; [insurance:loss_or_net_worth_accelerated_deterioration] 損益、淨值呈現加速惡化
(assert (= loss_or_net_worth_accelerated_deterioration
   loss_or_net_worth_accelerated_deterioration_flag))

; [insurance:improvement_plan_not_effective] 經輔導仍未改善，致仍有財務或業務惡化之虞
(assert (= improvement_plan_not_effective improvement_plan_not_effective_flag))

; [insurance:regulatory_action_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= regulatory_action_required
   (or capital_severe_insufficient_and_no_improvement
       (and (not capital_severe_insufficient_and_no_improvement)
            financial_or_business_deterioration
            improvement_plan_approved
            (or improvement_plan_not_effective
                loss_or_net_worth_accelerated_deterioration)))))

; [insurance:violation_internal_control] 未建立或未執行內部控制或稽核制度
(assert (not (= internal_control_established_and_executed violation_internal_control)))

; [insurance:violation_internal_handling] 未建立或未執行內部處理制度或程序
(assert (not (= internal_handling_established_and_executed violation_internal_handling)))

; [insurance:violation_internal_control_and_handling] 違反內部控制或內部處理制度規定
(assert (= violation_internal_control_and_handling
   (or violation_internal_control violation_internal_handling)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反內部控制或內部處理制度規定時處罰
(assert (= penalty (or violation_internal_control violation_internal_handling)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= net_worth_ratio_prev (/ 3.0 2.0)))
(assert (= net_worth 1000000))
(assert (= violation_internal_control true))
(assert (= violation_internal_handling true))
(assert (= improvement_plan_done false))
(assert (= improvement_plan_approved_flag false))
(assert (= improvement_plan_not_effective_flag false))
(assert (= financial_or_business_deterioration_flag false))
(assert (= loss_or_net_worth_accelerated_deterioration_flag false))
(assert (= internal_control_established_and_executed false))
(assert (= internal_handling_established_and_executed false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 28
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
