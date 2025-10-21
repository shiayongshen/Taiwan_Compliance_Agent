; SMT2 file generated from compliance case automatic
; Case ID: case_78
; Generated at: 2025-10-21T00:56:48.293485
;
; This file can be executed with Z3:
;   z3 case_78.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_improvement_plan_completed Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficient Bool)
(declare-const capital_level_significantly_insufficient Bool)
(declare-const capital_severe_insufficient_and_no_measures Bool)
(declare-const contract_or_major_commitment Bool)
(declare-const financial_improvement_plan_completed Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_deterioration_flag Bool)
(declare-const improvement_plan_accelerated_deterioration_or_no_improvement Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_impact Bool)
(declare-const payment_exceeds_limit Bool)
(declare-const penalty Bool)
(declare-const penalty_144_145 Bool)
(declare-const penalty_144_5 Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervisory_measures_required Bool)
(declare-const supervisory_restrictions_agreed Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const violation_144_145_flag Bool)
(declare-const violation_144_5_flag Bool)
(declare-const violation_of_144_145 Bool)
(declare-const violation_of_144_5 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級為嚴重不足
(assert (not (= (<= 50.0 capital_adequacy_ratio) capital_level_severe_insufficient)))

; [insurance:capital_level_significantly_insufficient] 資本等級為顯著不足
(assert (= capital_level_significantly_insufficient
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級為不足
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級為適足
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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

; [insurance:capital_level_severe_insufficient_and_no_measures] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_severe_insufficient_and_no_measures
   (and (= 4 capital_level)
        (not (or business_improvement_plan_completed
                 financial_improvement_plan_completed
                 merger_completed
                 capital_increase_completed)))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or financial_or_business_deterioration_flag
       unable_to_fulfill_contract
       risk_to_insured_rights
       unable_to_pay_debt)))

; [insurance:improvement_plan_submitted_and_approved] 已提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration_or_no_improvement
   (or profit_loss_accelerated_deterioration (not improvement_plan_effective))))

; [insurance:supervisory_measures_required] 依情節輕重，應為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_required
   (or capital_severe_insufficient_and_no_measures
       (and (not capital_severe_insufficient_and_no_measures)
            financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_accelerated_deterioration_or_no_improvement))))

; [insurance:supervisory_restrictions_agreed] 監管處分時，非經監管人同意不得超過限額支付款項或處分財產等行為
(assert (= supervisory_restrictions_agreed
   (and (not payment_exceeds_limit)
        (not contract_or_major_commitment)
        (not other_major_financial_impact))))

; [insurance:violation_of_144_145] 違反第一百四十四條第一項至第四項、第一百四十五條規定
(assert (= violation_of_144_145 violation_144_145_flag))

; [insurance:penalty_144_145] 違反第一百四十四條第一項至第四項、第一百四十五條規定者，處罰
(assert (= penalty_144_145 violation_of_144_145))

; [insurance:violation_of_144_5] 簽證精算人員或外部複核精算人員違反第一百四十四條第五項規定
(assert (= violation_of_144_5 violation_144_5_flag))

; [insurance:penalty_144_5] 簽證精算人員或外部複核精算人員違反第一百四十四條第五項規定者，主管機關得警告或停止簽證或複核
(assert (= penalty_144_5 violation_of_144_5))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法第144條第1至4項、第145條規定或簽證精算人員違反第144條第5項規定時處罰
(assert (= penalty (or penalty_144_145 penalty_144_5)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 120.0))
(assert (= net_worth 1000000.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= violation_144_145_flag true))
(assert (= violation_144_5_flag false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= financial_improvement_plan_completed false))
(assert (= business_improvement_plan_completed false))
(assert (= capital_increase_completed false))
(assert (= merger_completed false))
(assert (= financial_or_business_deterioration_flag false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= improvement_plan_effective true))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= risk_to_insured_rights false))
(assert (= payment_exceeds_limit false))
(assert (= contract_or_major_commitment false))
(assert (= other_major_financial_impact false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 36
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
