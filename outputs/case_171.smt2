; SMT2 file generated from compliance case automatic
; Case ID: case_171
; Generated at: 2025-10-21T03:50:28.063631
;
; This file can be executed with Z3:
;   z3 case_171.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const dissolution_ordered Bool)
(declare-const financial_deterioration Bool)
(declare-const financial_deterioration_not_improved Bool)
(declare-const financial_deterioration_reported Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_systems_compliance Bool)
(declare-const net_worth Real)
(declare-const net_worth_deteriorated Bool)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const profit_loss_deteriorated Bool)
(declare-const supervision_measures_taken Bool)
(declare-const supervision_ordered Bool)
(declare-const suspension_ordered Bool)
(declare-const takeover_ordered Bool)
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

; [insurance:internal_control_compliance] 內部控制及稽核制度建立且執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance] 內部處理制度及程序建立且執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [insurance:internal_systems_compliance] 內部控制及稽核制度與內部處理制度均合規
(assert (= internal_systems_compliance
   (and internal_control_compliance internal_handling_compliance)))

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

; [insurance:capital_level_4_measures_completed] 資本嚴重不足等級增資、改善計畫或合併完成
(assert (= capital_level_4_measures_completed capital_level_4_measures_executed))

; [insurance:financial_deterioration_reported] 財務或業務狀況顯著惡化且已提出並核定改善計畫
(assert (= financial_deterioration_reported
   (and financial_deterioration
        improvement_plan_submitted
        improvement_plan_approved)))

; [insurance:financial_deterioration_not_improved] 財務或業務狀況惡化且損益、淨值加速惡化或輔導未改善
(assert (= financial_deterioration_not_improved
   (and financial_deterioration_reported
        (or (not improvement_plan_executed)
            net_worth_deteriorated
            profit_loss_deteriorated))))

; [insurance:supervision_measures_taken] 主管機關已對保險業為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervision_measures_taken
   (or dissolution_ordered
       takeover_ordered
       suspension_ordered
       supervision_ordered)))

; [insurance:violation_internal_control] 違反內部控制及稽核制度規定
(assert (not (= internal_control_compliance violation_internal_control)))

; [insurance:violation_internal_handling] 違反內部處理制度及程序規定
(assert (not (= internal_handling_compliance violation_internal_handling)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制或內部處理制度規定，或資本嚴重不足且未完成增資改善計畫，或財務惡化未改善時處罰
(assert (let ((a!1 (or capital_level_4_noncompliance
               violation_internal_control
               violation_internal_handling
               (and (not (= 4 capital_level))
                    financial_deterioration_not_improved))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 50.0))
(assert (= net_worth_ratio 3.0))
(assert (= capital_level 1))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= violation_internal_control true))
(assert (= violation_internal_handling true))
(assert (= financial_deterioration false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_executed false))
(assert (= capital_level_4_measures_executed false))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level_4_noncompliance false))
(assert (= financial_deterioration_reported false))
(assert (= financial_deterioration_not_improved false))
(assert (= penalty true))
(assert (= supervision_ordered false))
(assert (= takeover_ordered false))
(assert (= suspension_ordered false))
(assert (= dissolution_ordered false))
(assert (= supervision_measures_taken false))
(assert (= profit_loss_deteriorated false))
(assert (= net_worth_deteriorated false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 34
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
