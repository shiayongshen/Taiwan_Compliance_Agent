; SMT2 file generated from compliance case automatic
; Case ID: case_78
; Generated at: 2025-10-19T07:21:39.148151
;
; This file can be executed with Z3:
;   z3 case_78.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_or_no_improvement Bool)
(declare-const actuarial_staff_violation_144_5 Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_severe_insufficient Bool)
(declare-const director_officer_removal Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_by_authority Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_overdue Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_deterioration Bool)
(declare-const net_worth_ratio Real)
(declare-const notification_to_authority Bool)
(declare-const penalty Bool)
(declare-const penalty_for_actuarial_violation Bool)
(declare-const penalty_for_violation_144_145 Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const prohibited_actions_during_supervision Bool)
(declare-const removal_ordered Bool)
(declare-const restriction_measures Bool)
(declare-const restriction_measures_authorized Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const supervisor_consent_contract_commitment Bool)
(declare-const supervisor_consent_major_financial_matters Bool)
(declare-const supervisor_consent_payment_exceed_limit Bool)
(declare-const supervisory_measures_required Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const violation_144_145 Bool)
(declare-const violation_144_5 Bool)
(declare-const violation_of_regulations_144_145 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級為嚴重不足
(assert (not (= (<= 2 capital_level) capital_level_severe_insufficient)))

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

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限內完成
(assert (= improvement_plan_completed improvement_plan_submitted))

; [insurance:improvement_plan_overdue] 資本嚴重不足且未於期限完成增資、財務或業務改善計畫或合併
(assert (= improvement_plan_overdue
   (and (= 4 capital_level) (not improvement_plan_completed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or unable_to_fulfill_contract unable_to_pay_debt risk_to_insured_interest)))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_by_authority))

; [insurance:accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= accelerated_deterioration_or_no_improvement
   (or (not improvement_plan_effective)
       net_worth_accelerated_deterioration
       profit_loss_accelerated_deterioration)))

; [insurance:supervisory_measures_required] 需為監管、接管、勒令停業清理或命令解散之處分
(assert (let ((a!1 (or (and (= 4 capital_level) (not improvement_plan_completed))
               (and (not (= 4 capital_level))
                    financial_or_business_deterioration
                    improvement_plan_approved
                    accelerated_deterioration_or_no_improvement))))
  (= supervisory_measures_required a!1)))

; [insurance:restriction_measures] 主管機關得為限制營業、停售商品、增資、解除職務等處分
(assert (= restriction_measures restriction_measures_authorized))

; [insurance:director_officer_removal] 依規定解除董（理）事、監察人（監事）職務並通知主管機關廢止登記
(assert (= director_officer_removal (and removal_ordered notification_to_authority)))

; [insurance:prohibited_actions_during_supervision] 監管處分期間非經監管人同意不得超限支付款項、締結契約或重大財務事項
(assert (= prohibited_actions_during_supervision
   (and (not supervisor_consent_payment_exceed_limit)
        (not supervisor_consent_contract_commitment)
        (not supervisor_consent_major_financial_matters))))

; [insurance:violation_of_regulations_144_145] 違反第一百四十四條第一項至第四項、第一百四十五條規定
(assert (= violation_of_regulations_144_145 violation_144_145))

; [insurance:penalty_for_violation_144_145] 違反第一百四十四條第一項至第四項、第一百四十五條規定者處罰
(assert (= penalty_for_violation_144_145 violation_of_regulations_144_145))

; [insurance:actuarial_staff_violation_144_5] 簽證精算人員或外部複核精算人員違反第一百四十四條第五項規定
(assert (= actuarial_staff_violation_144_5 violation_144_5))

; [insurance:penalty_for_actuarial_violation] 簽證精算人員違反規定者處罰
(assert (= penalty_for_actuarial_violation actuarial_staff_violation_144_5))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法第144條至145條規定或簽證精算人員違反第144條第5項規定時處罰
(assert (= penalty (or penalty_for_actuarial_violation penalty_for_violation_144_145)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio (/ 5.0 2.0)))
(assert (= capital_level 1))
(assert (= violation_144_145 true))
(assert (= violation_of_regulations_144_145 true))
(assert (= penalty_for_violation_144_145 true))
(assert (= penalty true))
(assert (= actuarial_staff_violation_144_5 true))
(assert (= penalty_for_actuarial_violation true))
(assert (= restriction_measures_authorized true))
(assert (= restriction_measures true))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_completed false))
(assert (= improvement_plan_approved_by_authority false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_effective false))
(assert (= improvement_plan_overdue false))
(assert (= capital_level_severe_insufficient false))
(assert (= accelerated_deterioration_or_no_improvement false))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= risk_to_insured_interest false))
(assert (= director_officer_removal false))
(assert (= removal_ordered false))
(assert (= notification_to_authority false))
(assert (= prohibited_actions_during_supervision false))
(assert (= supervisor_consent_payment_exceed_limit false))
(assert (= supervisor_consent_contract_commitment false))
(assert (= supervisor_consent_major_financial_matters false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= net_worth_accelerated_deterioration false))
(assert (= supervisory_measures_required false))
(assert (= violation_144_5 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 35
; Total facts: 35
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
