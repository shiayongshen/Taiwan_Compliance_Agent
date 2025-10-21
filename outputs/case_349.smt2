; SMT2 file generated from compliance case automatic
; Case ID: case_349
; Generated at: 2025-10-21T07:45:08.521005
;
; This file can be executed with Z3:
;   z3 case_349.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const branch_office_restriction_enforced Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_ok Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_ok Bool)
(declare-const capital_significantly_insufficient_measures_ok Bool)
(declare-const credit_restriction_enforced Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_prev Real)
(declare-const penalty Bool)
(declare-const responsible_person_compensation_reduction_rate Real)
(declare-const responsible_person_duty_suspended Bool)
(declare-const responsible_person_registration_cancelled Bool)
(declare-const responsible_person_removed Bool)
(declare-const special_asset_approval_obtained Bool)
(declare-const special_asset_disposed Bool)
(declare-const supervisory_disposition_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足）
(assert (let ((a!1 (or (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))
               (and (not (<= 2.0 net_worth_ratio)) (<= 0.0 net_worth_ratio))))
      (a!2 (or (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio))
               (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))))
      (a!3 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))
                1
                0)))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                (ite a!1 3 (ite a!2 2 a!3)))))
  (= capital_level a!4))))

; [insurance:capital_insufficient_measures_ok] 資本不足等級措施執行完成
(assert (= capital_insufficient_measures_ok
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:capital_significantly_insufficient_measures_ok] 資本顯著不足等級措施執行完成
(assert (= capital_significantly_insufficient_measures_ok
   (and capital_insufficient_measures_ok
        responsible_person_removed
        responsible_person_registration_cancelled
        responsible_person_duty_suspended
        special_asset_approval_obtained
        special_asset_disposed
        credit_restriction_enforced
        (<= 0.0 responsible_person_compensation_reduction_rate)
        (>= 30.0 responsible_person_compensation_reduction_rate)
        branch_office_restriction_enforced)))

; [insurance:capital_severely_insufficient_measures_ok] 資本嚴重不足等級措施執行完成
(assert (= capital_severely_insufficient_measures_ok
   (and capital_significantly_insufficient_measures_ok
        supervisory_disposition_executed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：資本不足等級達一定程度且未執行對應措施時處罰
(assert (= penalty
   (or (and (= 2 capital_level) (not capital_insufficient_measures_ok))
       (and (= 4 capital_level) (not capital_severely_insufficient_measures_ok))
       (and (= 3 capital_level)
            (not capital_significantly_insufficient_measures_ok)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -1000000))
(assert (= net_worth_ratio -10.0))
(assert (= net_worth_ratio_prev (/ 5.0 2.0)))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= responsible_person_removed false))
(assert (= responsible_person_registration_cancelled false))
(assert (= responsible_person_duty_suspended false))
(assert (= special_asset_approval_obtained false))
(assert (= special_asset_disposed false))
(assert (= credit_restriction_enforced false))
(assert (= responsible_person_compensation_reduction_rate 0.0))
(assert (= branch_office_restriction_enforced false))
(assert (= supervisory_disposition_executed false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 20
; Total facts: 16
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
