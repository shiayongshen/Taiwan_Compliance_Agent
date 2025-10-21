; SMT2 file generated from compliance case automatic
; Case ID: case_135
; Generated at: 2025-10-21T02:44:11.794922
;
; This file can be executed with Z3:
;   z3 case_135.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_adequate Bool)
(declare-const capital_improvement_plan_not_submitted Bool)
(declare-const capital_improvement_plan_submitted Bool)
(declare-const capital_insufficient Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient Bool)
(declare-const capital_significantly_insufficient Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_completed_within_deadline Bool)
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
(declare-const net_worth Real)
(declare-const net_worth_deteriorating Bool)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_prev Real)
(declare-const penalty Bool)
(declare-const profit_loss_deteriorating Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervisory_measures_required Bool)

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

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))
                1
                0)))
(let ((a!2 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                a!1)))
(let ((a!3 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!2)))
(let ((a!4 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!3)))
  (= capital_level a!4))))))

; [insurance:capital_level_conflict_resolved] 資本等級依較低等級原則決定
(assert (let ((a!1 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))
                1
                0)))
(let ((a!2 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                a!1)))
(let ((a!3 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!2)))
(let ((a!4 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!3)))
  (= capital_level a!4))))))

; [insurance:capital_adequate] 資本適足
(assert (= capital_adequate (= 1 capital_level)))

; [insurance:capital_insufficient] 資本不足
(assert (= capital_insufficient (= 2 capital_level)))

; [insurance:capital_significantly_insufficient] 資本顯著不足
(assert (= capital_significantly_insufficient (= 3 capital_level)))

; [insurance:capital_severely_insufficient] 資本嚴重不足
(assert (= capital_severely_insufficient (= 4 capital_level)))

; [insurance:capital_improvement_plan_submitted] 已依主管機關規定期限完成增資、財務或業務改善計畫或合併
(assert (= capital_improvement_plan_submitted
   improvement_plan_completed_within_deadline))

; [insurance:capital_improvement_plan_not_submitted] 未依主管機關規定期限完成增資、財務或業務改善計畫或合併
(assert (not (= capital_improvement_plan_submitted
        capital_improvement_plan_not_submitted)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or cannot_fulfill_contract cannot_pay_debt risk_to_insured_rights)))

; [insurance:improvement_plan_submitted_and_approved] 已提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_not_effective] 損益、淨值加速惡化或經輔導仍未改善，致仍有財務或業務惡化之虞
(assert (= improvement_plan_not_effective
   (or net_worth_deteriorating
       improvement_plan_failed
       profit_loss_deteriorating)))

; [insurance:supervisory_measures_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_required
   (or (and capital_severely_insufficient
            (not capital_improvement_plan_submitted))
       (and (not capital_severely_insufficient)
            financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_not_effective))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制或內部處理制度規定時處罰
(assert (= penalty (or (not internal_control_ok) (not internal_handling_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio (/ 4333.0 100.0)))
(assert (= net_worth (/ 11.0 5.0)))
(assert (= net_worth_ratio (/ 11.0 5.0)))
(assert (= net_worth_ratio_prev (/ 11.0 5.0)))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_completed_within_deadline false))
(assert (= improvement_plan_failed false))
(assert (= profit_loss_deteriorating false))
(assert (= net_worth_deteriorating false))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_rights false))
(assert (= financial_or_business_deterioration false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 35
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
