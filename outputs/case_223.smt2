; SMT2 file generated from compliance case automatic
; Case ID: case_223
; Generated at: 2025-10-21T22:00:24.659344
;
; This file can be executed with Z3:
;   z3 case_223.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const article_149_3_1_measures_executed Bool)
(declare-const branch_restriction_applied Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_insufficient_measures_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const credit_restriction_applied Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_prev Real)
(declare-const penalty Bool)
(declare-const responsible_person_compensation_reduced Bool)
(declare-const responsible_person_duty_suspended Bool)
(declare-const responsible_person_removed Bool)
(declare-const special_asset_approval_obtained Bool)
(declare-const special_asset_disposed Bool)

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

; [insurance:capital_insufficient_measures_submitted] 資本不足者已提出增資、財務或業務改善計畫
(assert (= capital_insufficient_measures_submitted improvement_plan_submitted))

; [insurance:capital_insufficient_measures_executed] 資本不足者已確實執行增資、財務或業務改善計畫
(assert (= capital_insufficient_measures_executed improvement_plan_executed))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足者已執行主管機關規定之措施
(assert (= capital_significantly_insufficient_measures_executed
   (and capital_insufficient_measures_executed
        responsible_person_removed
        responsible_person_duty_suspended
        special_asset_approval_obtained
        special_asset_disposed
        credit_restriction_applied
        responsible_person_compensation_reduced
        branch_restriction_applied)))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足者已採取第一百四十九條第三項第一款規定之處分
(assert (= capital_severely_insufficient_measures_executed
   article_149_3_1_measures_executed))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本不足等級未執行對應措施時處罰
(assert (let ((a!1 (or (and (= 2 capital_level)
                    (or (not capital_insufficient_measures_executed)
                        (not capital_insufficient_measures_submitted)))
               (and (= 4 capital_level)
                    (not capital_severely_insufficient_measures_executed))
               (and (= 3 capital_level)
                    (not capital_significantly_insufficient_measures_executed)))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -1000000))
(assert (= net_worth_ratio -10.0))
(assert (= net_worth_ratio_prev -10.0))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_executed false))
(assert (= article_149_3_1_measures_executed false))
(assert (= branch_restriction_applied true))
(assert (= responsible_person_removed false))
(assert (= responsible_person_duty_suspended false))
(assert (= special_asset_approval_obtained false))
(assert (= special_asset_disposed false))
(assert (= credit_restriction_applied false))
(assert (= responsible_person_compensation_reduced false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 20
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
