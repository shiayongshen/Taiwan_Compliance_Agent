; SMT2 file generated from compliance case automatic
; Case ID: case_354
; Generated at: 2025-10-19T13:51:57.133543
;
; This file can be executed with Z3:
;   z3 case_354.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_adequate Bool)
(declare-const capital_insufficient Bool)
(declare-const capital_level Int)
(declare-const capital_level_lower_priority Bool)
(declare-const capital_severely_insufficient Bool)
(declare-const capital_severely_insufficient_action_completed Bool)
(declare-const capital_significantly_insufficient Bool)
(declare-const compliance_with_laws Bool)
(declare-const financial_deterioration_and_no_improvement Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_approved_and_executed Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const level_2_measures_ok Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_3_measures_ok Bool)
(declare-const level_4_measures_executed Bool)
(declare-const level_4_measures_ok Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const severely_insufficient_and_no_action Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))
               (and (not (<= 2.0 net_worth_ratio)) (<= 0.0 net_worth_ratio))))
      (a!2 (or (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio))
               (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio))))))
(let ((a!3 (ite a!1 3 (ite a!2 2 (ite (<= 200.0 capital_adequacy_ratio) 1 0)))))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!3)))
  (= capital_level a!4)))))

; [insurance:capital_level_lower_priority] 資本等級以較低等級為準（同時符合多等級時）
(assert (let ((a!1 (or (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))
               (and (not (<= 2.0 net_worth_ratio)) (<= 0.0 net_worth_ratio))))
      (a!2 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio)))))
(let ((a!3 (ite a!1 3 (ite a!2 2 (ite (<= 200.0 capital_adequacy_ratio) 1 0)))))
(let ((a!4 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!3)))
  (= (ite capital_level_lower_priority 1 0) a!4)))))

; [insurance:capital_adequate] 資本適足
(assert (= capital_adequate (= 1 capital_level)))

; [insurance:capital_insufficient] 資本不足
(assert (= capital_insufficient (= 2 capital_level)))

; [insurance:capital_significantly_insufficient] 資本顯著不足
(assert (= capital_significantly_insufficient (= 3 capital_level)))

; [insurance:capital_severely_insufficient] 資本嚴重不足
(assert (= capital_severely_insufficient (= 4 capital_level)))

; [insurance:level_2_measures_ok] 資本不足等級措施執行完成
(assert (= level_2_measures_ok
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:level_3_measures_ok] 資本顯著不足等級措施執行完成
(assert (= level_3_measures_ok level_3_measures_executed))

; [insurance:level_4_measures_ok] 資本嚴重不足等級措施執行完成
(assert (= level_4_measures_ok level_4_measures_executed))

; [insurance:severely_insufficient_and_no_action] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= severely_insufficient_and_no_action
   (and capital_severely_insufficient
        (not capital_severely_insufficient_action_completed))))

; [insurance:financial_deterioration_and_no_improvement] 財務或業務狀況顯著惡化且未改善
(assert (= financial_deterioration_and_no_improvement
   (and financial_or_business_deterioration
        (not improvement_plan_approved_and_executed))))

; [insurance:penalty_conditions] 處罰條件：資本不足等級達一定程度且未執行對應措施，或違反相關法令規定時處罰
(assert (= penalty
   (or (and (= 3 capital_level) (not level_3_measures_ok))
       (not compliance_with_laws)
       (and (= 2 capital_level) (not level_2_measures_ok))
       (and (= 4 capital_level) (not level_4_measures_ok)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 50.0))
(assert (= net_worth_ratio 50.0))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= capital_severely_insufficient_action_completed false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_approved_and_executed false))
(assert (= level_4_measures_executed false))
(assert (= compliance_with_laws false))
(assert (= capital_adequate false))
(assert (= capital_insufficient false))
(assert (= capital_level 0))
(assert (= capital_level_lower_priority false))
(assert (= capital_severely_insufficient false))
(assert (= capital_significantly_insufficient false))
(assert (= financial_deterioration_and_no_improvement false))
(assert (= level_2_measures_ok false))
(assert (= level_3_measures_executed false))
(assert (= level_3_measures_ok false))
(assert (= level_4_measures_ok false))
(assert (= penalty false))
(assert (= severely_insufficient_and_no_action false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 23
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
