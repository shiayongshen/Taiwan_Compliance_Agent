; SMT2 file generated from compliance case automatic
; Case ID: case_199
; Generated at: 2025-10-21T04:21:49.905331
;
; This file can be executed with Z3:
;   z3 case_199.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_flag Bool)
(declare-const business_restriction_compliance Bool)
(declare-const business_restriction_violated Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_adequate Bool)
(declare-const capital_insufficient Bool)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_level_lowest Int)
(declare-const capital_level_measures_ok Bool)
(declare-const capital_severe_measures_executed Bool)
(declare-const capital_severe_penalty_condition Bool)
(declare-const capital_severely_insufficient Bool)
(declare-const capital_significant_measures_executed Bool)
(declare-const capital_significantly_insufficient Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_deterioration_flag Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_flag Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_submitted_and_executed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_penalty Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_penalty Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const supervisory_measures_executed Bool)
(declare-const supervisory_measures_needed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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

; [insurance:capital_level_lowest] 資本等級以較低等級為準（最近二期淨值比率與資本適足率綜合判定）
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
  (= capital_level_lowest a!3)))))

; [insurance:capital_severely_insufficient] 資本嚴重不足（等級4）
(assert (= capital_severely_insufficient
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_significantly_insufficient] 資本顯著不足（等級3）
(assert (= capital_significantly_insufficient
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_insufficient] 資本不足（等級2）
(assert (= capital_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_adequate] 資本適足（等級1）
(assert (= capital_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併於主管機關規定期限內完成
(assert (= improvement_plan_completed improvement_plan_submitted_and_executed))

; [insurance:capital_severe_penalty_condition] 資本嚴重不足且未於期限完成增資或改善計畫或合併
(assert (= capital_severe_penalty_condition
   (and capital_severely_insufficient (not improvement_plan_completed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration financial_or_business_deterioration_flag))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_flag))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值加速惡化或經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration accelerated_deterioration_flag))

; [insurance:supervisory_measures_needed] 因財務或業務惡化，主管機關得為監管、接管、勒令停業清理或命令解散
(assert (= supervisory_measures_needed
   (or capital_severe_penalty_condition
       (and financial_or_business_deterioration
            improvement_plan_approved
            (or improvement_plan_accelerated_deterioration
                supervisory_measures_executed)))))

; [insurance:internal_control_ok] 建立內部控制及稽核制度且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:capital_level_measures_ok] 資本等級對應措施執行完成
(assert (let ((a!1 (ite (= 3 capital_level)
                capital_significant_measures_executed
                (ite (= 2 capital_level)
                     capital_insufficient_measures_executed
                     (or (= 0 capital_level) (= 1 capital_level))))))
  (= capital_level_measures_ok
     (ite (= 4 capital_level) capital_severe_measures_executed a!1))))

; [insurance:business_restriction_compliance] 保險業未違反主管機關限制營業或資金運用範圍等處分
(assert (not (= business_restriction_violated business_restriction_compliance)))

; [insurance:internal_control_penalty] 違反內部控制及稽核制度規定
(assert (not (= internal_control_ok internal_control_penalty)))

; [insurance:internal_handling_penalty] 違反內部處理制度及程序規定
(assert (not (= internal_handling_ok internal_handling_penalty)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未改善、違反內部控制或內部處理制度規定時處罰
(assert (= penalty
   (or capital_severe_penalty_condition
       (not internal_control_ok)
       (not internal_handling_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio -10.0))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= improvement_plan_submitted_and_executed false))
(assert (= accelerated_deterioration_flag false))
(assert (= financial_or_business_deterioration_flag false))
(assert (= improvement_plan_approved_flag false))
(assert (= supervisory_measures_executed false))
(assert (= business_restriction_violated true))

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
; Total facts: 13
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
