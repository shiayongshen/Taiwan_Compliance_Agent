; SMT2 file generated from compliance case automatic
; Case ID: case_381
; Generated at: 2025-10-19T14:30:06.191984
;
; This file can be executed with Z3:
;   z3 case_381.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_4_noncompliance Bool)
(declare-const capital_level_4_penalty_period Int)
(declare-const days_after_deadline Int)
(declare-const director_officer_removal_notification Bool)
(declare-const director_officer_removed Bool)
(declare-const disposal_exceeds_limit Bool)
(declare-const financial_deterioration Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_counseling Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_ordered Bool)
(declare-const improvement_plan_requested Bool)
(declare-const major_commitment_made Bool)
(declare-const major_contract_concluded Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_deterioration Bool)
(declare-const net_worth_ratio Real)
(declare-const payment_exceeds_limit Bool)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const removal_notification_sent Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervision_or_takeover_ordered Bool)
(declare-const supervision_restriction_compliance Bool)

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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未於期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level)
        (not capital_increase_completed)
        (not improvement_plan_completed)
        (not merger_completed))))

; [insurance:capital_level_4_penalty_period] 資本嚴重不足且未於期限完成增資、改善計畫或合併且期限屆滿超過90日
(assert (let ((a!1 (ite (and capital_level_4_noncompliance
                     (not (<= days_after_deadline 90)))
                1
                0)))
  (= capital_level_4_penalty_period a!1)))

; [insurance:financial_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_deterioration
   (or risk_to_insured_rights cannot_pay_debt cannot_fulfill_contract)))

; [insurance:improvement_plan_ordered] 主管機關已令保險業提出財務或業務改善計畫並核定
(assert (= improvement_plan_ordered
   (and improvement_plan_requested improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值加速惡化或經輔導仍未改善致有惡化之虞
(assert (= improvement_plan_accelerated_deterioration
   (or net_worth_accelerated_deterioration
       (and improvement_plan_counseling (not improvement_plan_effective))
       profit_loss_accelerated_deterioration)))

; [insurance:supervision_or_takeover_ordered] 主管機關依情節輕重為監管、接管、勒令停業清理或命令解散之處分
(assert (let ((a!1 (or (= capital_level_4_penalty_period 1)
               (and (not (= capital_level_4_penalty_period 1))
                    financial_deterioration
                    improvement_plan_ordered
                    improvement_plan_accelerated_deterioration))))
  (= supervision_or_takeover_ordered a!1)))

; [insurance:director_officer_removal_notification] 依規定解除董（理）事、監察人（監事）職務時通知主管機關廢止登記
(assert (= director_officer_removal_notification
   (or removal_notification_sent (not director_officer_removed))))

; [insurance:supervision_restriction_compliance] 監管處分期間保險業未超過主管機關規定限額支付款項或處分財產，且未締結重大契約或承諾
(assert (= supervision_restriction_compliance
   (and (not payment_exceeds_limit)
        (not disposal_exceeds_limit)
        (not major_contract_concluded)
        (not major_commitment_made))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足期限、未完成增資或改善計畫、財務惡化未改善或監管限制規定時處罰
(assert (= penalty
   (or (and financial_deterioration (not improvement_plan_ordered))
       (and financial_deterioration
            improvement_plan_ordered
            (not improvement_plan_accelerated_deterioration))
       (not supervision_restriction_compliance)
       (= capital_level_4_penalty_period 1))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= capital_increase_completed false))
(assert (= improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= days_after_deadline 100))
(assert (= cannot_fulfill_contract false))
(assert (= cannot_pay_debt false))
(assert (= risk_to_insured_rights false))
(assert (= improvement_plan_requested false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_ordered false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= net_worth_accelerated_deterioration false))
(assert (= improvement_plan_counseling false))
(assert (= improvement_plan_effective false))
(assert (= payment_exceeds_limit false))
(assert (= disposal_exceeds_limit false))
(assert (= major_contract_concluded false))
(assert (= major_commitment_made false))
(assert (= capital_level 1))
(assert (= capital_level_4_noncompliance false))
(assert (= capital_level_4_penalty_period false))
(assert (= financial_deterioration false))
(assert (= supervision_restriction_compliance true))
(assert (= director_officer_removed false))
(assert (= removal_notification_sent false))
(assert (= director_officer_removal_notification false))
(assert (= supervision_or_takeover_ordered false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 32
; Total facts: 32
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
