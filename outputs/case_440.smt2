; SMT2 file generated from compliance case automatic
; Case ID: case_440
; Generated at: 2025-10-21T09:54:27.226391
;
; This file can be executed with Z3:
;   z3 case_440.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_4_noncompliance Bool)
(declare-const capital_level_4_penalty_period Int)
(declare-const days_after_deadline Int)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const financial_or_business_status_significantly_deteriorated Bool)
(declare-const improvement_plan_approved_by_authority Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_failure Bool)
(declare-const improvement_plan_ordered_by_authority Bool)
(declare-const improvement_plan_required Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_violation Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_violation Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_deterioration Bool)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const professional_reinsurance_violation Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const reinsurance_violation Bool)
(declare-const risk_of_harming_insured_rights Bool)
(declare-const supervision_or_takeover_or_shutdown Bool)
(declare-const unable_to_fulfill_contractual_obligations Bool)
(declare-const unable_to_pay_debts Bool)
(declare-const violation_147_1_or_2 Bool)
(declare-const violation_148_2_1 Bool)
(declare-const violation_148_2_2 Bool)
(declare-const violation_of_article_148_1_or_2 Bool)
(declare-const violation_of_article_148_2_1 Bool)
(declare-const violation_of_article_148_2_2 Bool)
(declare-const violation_of_professional_reinsurance_rules Bool)
(declare-const violation_of_reinsurance_rules Bool)

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

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依規定完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level)
        (not capital_increase_completed)
        (not financial_or_business_improvement_plan_completed)
        (not merger_completed))))

; [insurance:capital_level_4_penalty_period] 資本嚴重不足且未於期限內完成增資、改善計畫或合併且期限屆滿超過90日
(assert (let ((a!1 (ite (and capital_level_4_noncompliance
                     (not (<= days_after_deadline 90)))
                1
                0)))
  (= capital_level_4_penalty_period a!1)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (and financial_or_business_status_significantly_deteriorated
        (or unable_to_pay_debts
            risk_of_harming_insured_rights
            unable_to_fulfill_contractual_obligations))))

; [insurance:improvement_plan_required] 主管機關已令保險業提出財務或業務改善計畫並核定
(assert (= improvement_plan_required
   (and improvement_plan_ordered_by_authority
        improvement_plan_approved_by_authority)))

; [insurance:improvement_plan_failure] 損益、淨值加速惡化或經輔導仍未改善，致仍有財務或業務惡化之虞
(assert (= improvement_plan_failure
   (and (or profit_loss_accelerated_deterioration
            net_worth_accelerated_deterioration)
        (not improvement_plan_effective)
        financial_or_business_deterioration)))

; [insurance:supervision_or_takeover_or_shutdown] 主管機關依情節輕重為監管、接管、勒令停業清理或命令解散之處分
(assert (let ((a!1 (or (= capital_level_4_penalty_period 1)
               (and (not (= 4 capital_level)) improvement_plan_failure))))
  (= supervision_or_takeover_or_shutdown a!1)))

; [insurance:reinsurance_violation] 違反再保險分出、分入、危險分散機制方式或限額規定
(assert (= reinsurance_violation violation_of_reinsurance_rules))

; [insurance:professional_reinsurance_violation] 專業再保險業違反業務範圍或財務管理規定
(assert (= professional_reinsurance_violation
   violation_of_professional_reinsurance_rules))

; [insurance:internal_control_violation] 未建立或未執行內部控制或稽核制度
(assert (not (= (and internal_control_established internal_control_executed)
        internal_control_violation)))

; [insurance:internal_handling_violation] 未建立或未執行內部處理制度或程序
(assert (not (= (and internal_handling_established internal_handling_executed)
        internal_handling_violation)))

; [insurance:violation_147_1_or_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violation_147_1_or_2 violation_of_article_148_1_or_2))

; [insurance:violation_148_2_1] 違反第一百四十八條之二第一項規定，未提供說明文件或文件不實
(assert (= violation_148_2_1 violation_of_article_148_2_1))

; [insurance:violation_148_2_2] 違反第一百四十八條之二第二項規定，未依限報告或公開說明或內容不實
(assert (= violation_148_2_2 violation_of_article_148_2_2))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法令規定時處罰
(assert (let ((a!1 (or violation_147_1_or_2
               (= capital_level_4_penalty_period 1)
               professional_reinsurance_violation
               violation_148_2_2
               (and (not (= 4 capital_level)) improvement_plan_failure)
               internal_handling_violation
               reinsurance_violation
               internal_control_violation
               violation_148_2_1)))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 45.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= days_after_deadline 0))
(assert (= financial_or_business_status_significantly_deteriorated false))
(assert (= unable_to_pay_debts false))
(assert (= unable_to_fulfill_contractual_obligations false))
(assert (= risk_of_harming_insured_rights false))
(assert (= improvement_plan_ordered_by_authority false))
(assert (= improvement_plan_approved_by_authority false))
(assert (= improvement_plan_effective false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= net_worth_accelerated_deterioration false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= violation_of_reinsurance_rules false))
(assert (= violation_of_professional_reinsurance_rules false))
(assert (= violation_of_article_148_1_or_2 false))
(assert (= violation_of_article_148_2_1 true))
(assert (= violation_of_article_148_2_2 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 40
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
