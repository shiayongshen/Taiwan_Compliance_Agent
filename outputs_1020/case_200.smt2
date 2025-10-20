; SMT2 file generated from compliance case automatic
; Case ID: case_200
; Generated at: 2025-10-19T10:18:38.886205
;
; This file can be executed with Z3:
;   z3 case_200.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_insufficient_measures_executed_flag Bool)
(declare-const capital_level Int)
(declare-const capital_level_final Int)
(declare-const capital_level_lowest Int)
(declare-const capital_level_net_worth Int)
(declare-const capital_severely_insufficient_and_not_completed Bool)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_severely_insufficient_measures_executed_flag Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_executed_flag Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_deterioration_flag Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_accelerated_deterioration_flag Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_flag Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_completed_flag Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_prev Real)
(declare-const penalty Bool)
(declare-const supervisory_measures_needed Bool)
(declare-const violation_148_1_2 Bool)
(declare-const violation_148_1_2_flag Bool)
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

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (not (<= 2.0 net_worth_ratio)) (<= 0.0 net_worth_ratio))
               (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))))
      (a!2 (or (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio))
               (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))))
      (a!3 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))
                1
                0)))
(let ((a!4 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                (ite a!1 3 (ite a!2 2 a!3)))))
  (= capital_level a!4))))

; [insurance:capital_level_lowest] 資本等級以較低等級為準
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio)))
                3
                a!1)))
  (= capital_level_lowest (ite (<= 50.0 capital_adequacy_ratio) a!2 4)))))

; [insurance:capital_level_net_worth] 淨值比率等級分類
(assert (let ((a!1 (ite (and (<= 2.0 net_worth_ratio) (not (<= 3.0 net_worth_ratio)))
                2
                (ite (<= 3.0 net_worth_ratio) 1 0))))
(let ((a!2 (ite (and (<= 0.0 net_worth_ratio) (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
  (= capital_level_net_worth (ite (<= 0.0 net_worth) a!2 4)))))

; [insurance:capital_level_final] 資本等級以較低等級為準（綜合自資本適足率與淨值比率）
(assert (let ((a!1 (or (and (<= 0.0 net_worth_ratio) (not (<= 2.0 net_worth_ratio)))
               (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))))
      (a!2 (or (and (<= 2.0 net_worth_ratio) (not (<= 3.0 net_worth_ratio)))
               (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))))
      (a!3 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))
                1
                0)))
  (= capital_level_final
     (ite (and (<= 50.0 capital_adequacy_ratio) (<= 0.0 net_worth))
          (ite a!1 3 (ite a!2 2 a!3))
          4))))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_severely_insufficient_measures_executed
   capital_severely_insufficient_measures_executed_flag))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_significantly_insufficient_measures_executed
   capital_significantly_insufficient_measures_executed_flag))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施已執行
(assert (= capital_insufficient_measures_executed
   capital_insufficient_measures_executed_flag))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫已於主管機關規定期限完成
(assert (= improvement_plan_completed improvement_plan_completed_flag))

; [insurance:capital_severely_insufficient_and_not_completed] 資本嚴重不足且未於期限完成增資或改善計畫
(assert (= capital_severely_insufficient_and_not_completed
   (and (= 4 capital_level_final) (not improvement_plan_completed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration financial_or_business_deterioration_flag))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_flag))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值加速惡化且經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration
   improvement_plan_accelerated_deterioration_flag))

; [insurance:supervisory_measures_needed] 依情節輕重，需為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_needed
   (or capital_severely_insufficient_and_not_completed
       (and financial_or_business_deterioration
            improvement_plan_approved
            improvement_plan_accelerated_deterioration))))

; [insurance:violation_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violation_148_1_2 violation_148_1_2_flag))

; [insurance:violation_148_2_1] 違反第一百四十八條之二第一項規定
(assert (= violation_148_2_1 violation_148_2_1_flag))

; [insurance:violation_148_2_2] 違反第一百四十八條之二第二項規定
(assert (= violation_148_2_2 violation_148_2_2_flag))

; [insurance:violation_148_3_1] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violation_148_3_1 violation_148_3_1_flag))

; [insurance:violation_148_3_2] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violation_148_3_2 violation_148_3_2_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關法令規定時處罰
(assert (= penalty
   (or violation_148_1_2
       violation_148_2_1
       violation_148_2_2
       violation_148_3_1
       violation_148_3_2
       (and (= 4 capital_level_final) (not improvement_plan_completed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 150.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 3.0))
(assert (= net_worth_ratio_prev 3.0))
(assert (= violation_148_3_1_flag true))
(assert (= violation_148_3_2_flag true))
(assert (= violation_148_1_2_flag false))
(assert (= violation_148_2_1_flag false))
(assert (= violation_148_2_2_flag false))
(assert (= capital_insufficient_measures_executed_flag false))
(assert (= capital_significantly_insufficient_measures_executed_flag false))
(assert (= capital_severely_insufficient_measures_executed_flag false))
(assert (= improvement_plan_completed_flag false))
(assert (= financial_or_business_deterioration_flag false))
(assert (= improvement_plan_approved_flag false))
(assert (= improvement_plan_accelerated_deterioration_flag false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_level 0))
(assert (= capital_level_final 0))
(assert (= capital_level_lowest 0))
(assert (= capital_level_net_worth 0))
(assert (= capital_severely_insufficient_and_not_completed false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_completed false))
(assert (= penalty false))
(assert (= supervisory_measures_needed false))
(assert (= violation_148_1_2 false))
(assert (= violation_148_2_1 false))
(assert (= violation_148_2_2 false))
(assert (= violation_148_3_1 false))
(assert (= violation_148_3_2 false))

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
; Total facts: 35
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
