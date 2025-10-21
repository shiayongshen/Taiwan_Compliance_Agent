; SMT2 file generated from compliance case automatic
; Case ID: case_61
; Generated at: 2025-10-21T00:30:04.082692
;
; This file can be executed with Z3:
;   z3 case_61.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_adequate Bool)
(declare-const capital_improvement_completed Bool)
(declare-const capital_improvement_plan_completed Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient Bool)
(declare-const capital_significantly_deteriorated Bool)
(declare-const financial_deterioration_measures_taken Bool)
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
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const supervision_action_taken Bool)
(declare-const supervision_measures_taken Bool)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_handling Bool)

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
(assert (let ((a!1 (ite (and capital_severely_insufficient
                     (not capital_improvement_completed))
                4
                (ite (and capital_significantly_deteriorated
                          (not capital_improvement_completed))
                     3
                     (ite capital_adequate 1 0)))))
  (= capital_level a!1)))

; [insurance:capital_severely_insufficient] 資本嚴重不足
(assert (= capital_severely_insufficient
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_significantly_deteriorated] 財務或業務狀況顯著惡化
(assert (let ((a!1 (or (and (not (<= 50.0 capital_adequacy_ratio)) (<= 0.0 net_worth))
               (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio))
                    (<= 0.0 net_worth_ratio)
                    (not (<= 2.0 net_worth_ratio))))))
  (= capital_significantly_deteriorated a!1)))

; [insurance:capital_adequate] 資本適足
(assert (= capital_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_improvement_completed] 主管機關規定期限內完成增資、財務或業務改善計畫或合併
(assert (= capital_improvement_completed capital_improvement_plan_completed))

; [insurance:supervision_measures_taken] 主管機關已對資本嚴重不足且未完成改善者，採取接管、勒令停業清理或命令解散處分
(assert (= supervision_measures_taken
   (and capital_severely_insufficient
        (not capital_improvement_completed)
        supervision_action_taken)))

; [insurance:financial_deterioration_measures_taken] 財務或業務狀況顯著惡化且未改善者，主管機關採取監管、接管、勒令停業清理或命令解散處分
(assert (= financial_deterioration_measures_taken
   (and capital_significantly_deteriorated
        (not capital_improvement_completed)
        supervision_action_taken)))

; [insurance:violation_internal_control] 違反未建立或未執行內部控制及稽核制度
(assert (= violation_internal_control
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violation_internal_handling] 違反未建立或未執行內部處理制度及程序
(assert (= violation_internal_handling
   (or (not internal_handling_established) (not internal_handling_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制或內部處理制度規定，或資本嚴重不足且未完成改善，或財務狀況顯著惡化且未完成改善時處罰
(assert (= penalty
   (or violation_internal_control
       violation_internal_handling
       (and capital_severely_insufficient (not capital_improvement_completed))
       (and capital_significantly_deteriorated
            (not capital_improvement_completed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 3.0))
(assert (= capital_improvement_plan_completed false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= supervision_action_taken false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 25
; Total facts: 9
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
