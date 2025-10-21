; SMT2 file generated from compliance case automatic
; Case ID: case_136
; Generated at: 2025-10-21T02:46:03.810409
;
; This file can be executed with Z3:
;   z3 case_136.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_and_no_improvement Bool)
(declare-const accelerated_loss_and_net_worth_deterioration Bool)
(declare-const business_improvement_plan_completed Bool)
(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const deadline_passed Bool)
(declare-const financial_improvement_plan_completed Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_after_guidance Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const level_4_measures_completed Bool)
(declare-const level_4_penalty_due Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervisory_measures_applicable Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足）
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

; [insurance:level_4_measures_completed] 資本嚴重不足等級增資或改善計畫完成
(assert (= level_4_measures_completed
   (and (= 4 capital_level)
        (or capital_increase_completed
            merger_completed
            financial_improvement_plan_completed
            business_improvement_plan_completed))))

; [insurance:level_4_penalty_due] 資本嚴重不足且未於期限完成增資或改善計畫
(assert (= level_4_penalty_due
   (and (= 4 capital_level) (not level_4_measures_completed) deadline_passed)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約
(assert (= financial_or_business_deterioration
   (or cannot_pay_debt cannot_fulfill_contract risk_to_insured_rights)))

; [insurance:improvement_plan_submitted_and_approved] 已提出並經主管機關核定財務或業務改善計畫
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:accelerated_deterioration_and_no_improvement] 損益淨值加速惡化且經輔導仍未改善
(assert (= accelerated_deterioration_and_no_improvement
   (and accelerated_loss_and_net_worth_deterioration
        (not improvement_after_guidance))))

; [insurance:supervisory_measures_applicable] 主管機關得依情節輕重採取監管、接管、勒令停業清理或命令解散處分
(assert (= supervisory_measures_applicable
   (or level_4_penalty_due
       (and (not level_4_penalty_due)
            financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            accelerated_deterioration_and_no_improvement))))

; [insurance:internal_control_and_audit_ok] 建立並執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立並執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未於期限完成增資或改善計畫，或違反內部控制及處理制度規定時處罰
(assert (= penalty
   (or level_4_penalty_due
       (not internal_control_and_audit_ok)
       (not internal_handling_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 3.0))
(assert (= capital_level 1))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_ok false))
(assert (= penalty true))
(assert (= level_4_penalty_due false))
(assert (= deadline_passed false))
(assert (= capital_increase_completed false))
(assert (= financial_improvement_plan_completed false))
(assert (= business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= financial_or_business_deterioration false))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_rights false))
(assert (= accelerated_loss_and_net_worth_deterioration false))
(assert (= improvement_after_guidance false))
(assert (= accelerated_deterioration_and_no_improvement false))
(assert (= supervisory_measures_applicable true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 29
; Total facts: 28
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
