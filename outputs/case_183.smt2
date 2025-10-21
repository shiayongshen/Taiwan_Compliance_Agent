; SMT2 file generated from compliance case automatic
; Case ID: case_183
; Generated at: 2025-10-21T04:08:04.339594
;
; This file can be executed with Z3:
;   z3 case_183.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_or_no_improvement Bool)
(declare-const accelerated_loss_or_net_worth_decline Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_4_and_plan_overdue Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severely_insufficient Bool)
(declare-const capital_level_significantly_insufficient Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_by_authority Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_overdue Bool)
(declare-const improvement_plan_submitted_and_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const no_improvement_after_guidance Bool)
(declare-const penalty Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const significant_financial_deterioration Bool)
(declare-const supervisory_measures_executed Bool)
(declare-const supervisory_measures_issued Bool)
(declare-const supervisory_measures_required Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const violation_148_1_or_2 Bool)
(declare-const violation_148_1_or_2_flag Bool)
(declare-const violation_148_2_1 Bool)
(declare-const violation_148_2_1_flag Bool)
(declare-const violation_148_2_2 Bool)
(declare-const violation_148_2_2_flag Bool)
(declare-const violation_148_3_1 Bool)
(declare-const violation_148_3_1_flag Bool)
(declare-const violation_148_3_2 Bool)
(declare-const violation_148_3_2_flag Bool)

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

; [insurance:capital_level_severely_insufficient] 資本等級為嚴重不足
(assert (= capital_level_severely_insufficient (= 4 capital_level)))

; [insurance:capital_level_significantly_insufficient] 資本等級為顯著不足
(assert (= capital_level_significantly_insufficient (= 3 capital_level)))

; [insurance:capital_level_insufficient] 資本等級為不足
(assert (= capital_level_insufficient (= 2 capital_level)))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限內完成
(assert (= improvement_plan_completed improvement_plan_submitted_and_completed))

; [insurance:improvement_plan_overdue] 增資、財務或業務改善計畫或合併未於主管機關規定期限內完成
(assert (not (= improvement_plan_completed improvement_plan_overdue)))

; [insurance:capital_level_4_and_plan_overdue] 資本嚴重不足且未於期限內完成增資或改善計畫
(assert (= capital_level_4_and_plan_overdue
   (and capital_level_severely_insufficient improvement_plan_overdue)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or risk_to_insured_rights
       unable_to_pay_debt
       unable_to_fulfill_contract
       significant_financial_deterioration)))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_by_authority))

; [insurance:accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= accelerated_deterioration_or_no_improvement
   (or accelerated_loss_or_net_worth_decline no_improvement_after_guidance)))

; [insurance:supervisory_measures_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_required
   (or capital_level_4_and_plan_overdue
       (and (not capital_level_4_and_plan_overdue)
            financial_or_business_deterioration
            improvement_plan_approved
            accelerated_deterioration_or_no_improvement))))

; [insurance:supervisory_measures_executed] 主管機關已對保險業為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_executed supervisory_measures_issued))

; [insurance:violation_148_1_or_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violation_148_1_or_2 violation_148_1_or_2_flag))

; [insurance:violation_148_2_1] 違反第一百四十八條之二第一項規定，未提供說明文件或文件不實
(assert (= violation_148_2_1 violation_148_2_1_flag))

; [insurance:violation_148_2_2] 違反第一百四十八條之二第二項規定，未依限報告或公開說明或內容不實
(assert (= violation_148_2_2 violation_148_2_2_flag))

; [insurance:violation_148_3_1] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violation_148_3_1 violation_148_3_1_flag))

; [insurance:violation_148_3_2] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violation_148_3_2 violation_148_3_2_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關法令規定時處罰
(assert (= penalty
   (or violation_148_1_or_2
       violation_148_2_1
       violation_148_2_2
       violation_148_3_1
       violation_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -1000000.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= improvement_plan_submitted_and_completed false))
(assert (= improvement_plan_approved_by_authority false))
(assert (= accelerated_loss_or_net_worth_decline false))
(assert (= no_improvement_after_guidance false))
(assert (= significant_financial_deterioration true))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= risk_to_insured_rights true))
(assert (= violation_148_3_1_flag true))
(assert (= violation_148_1_or_2_flag false))
(assert (= violation_148_2_1_flag false))
(assert (= violation_148_2_2_flag false))
(assert (= violation_148_3_2_flag false))
(assert (= supervisory_measures_issued true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 35
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
