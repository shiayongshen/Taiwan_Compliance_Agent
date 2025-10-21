; SMT2 file generated from compliance case automatic
; Case ID: case_452
; Generated at: 2025-10-21T10:11:38.779405
;
; This file can be executed with Z3:
;   z3 case_452.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_and_no_improvement Bool)
(declare-const accelerated_loss_and_net_worth_deterioration Bool)
(declare-const aml_avoid_or_obstruct_inspection Bool)
(declare-const aml_internal_control_compliance Bool)
(declare-const aml_internal_control_established Bool)
(declare-const aml_internal_control_executed Bool)
(declare-const aml_penalty_condition Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_or_improvement_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_4_noncompliance Bool)
(declare-const capital_level_4_penalty_period Int)
(declare-const days_after_deadline Int)
(declare-const financial_deterioration Bool)
(declare-const financial_or_business_deteriorated Bool)
(declare-const improvement_after_guidance Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const prohibited_actions_without_supervisor_consent Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const severe_financial_condition_penalty Bool)
(declare-const supervisor_consent_contract_or_commitment Bool)
(declare-const supervisor_consent_other_major_financial_matters Bool)
(declare-const supervisor_consent_payment_or_disposal Bool)
(declare-const supervisory_measures_authorized Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const under_supervisory_measures Bool)

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
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level) (not capital_increase_or_improvement_completed))))

; [insurance:capital_level_4_penalty_period] 資本嚴重不足且未完成改善計畫且期限屆滿超過90日
(assert (= capital_level_4_penalty_period
   (ite (and capital_level_4_noncompliance (<= 90 days_after_deadline)) 1 0)))

; [insurance:financial_deterioration] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= financial_deterioration
   (or unable_to_fulfill_contract
       risk_to_insured_rights
       unable_to_pay_debt
       financial_or_business_deteriorated)))

; [insurance:improvement_plan_submitted_and_approved] 提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:accelerated_deterioration_and_no_improvement] 損益、淨值加速惡化且經輔導仍未改善
(assert (= accelerated_deterioration_and_no_improvement
   (and accelerated_loss_and_net_worth_deterioration
        (not improvement_after_guidance))))

; [insurance:severe_financial_condition_penalty] 財務狀況嚴重惡化且有接管、勒令停業清理或解散之虞
(assert (= severe_financial_condition_penalty
   (and financial_deterioration
        improvement_plan_submitted_and_approved
        accelerated_deterioration_and_no_improvement)))

; [insurance:supervisory_measures_authorized] 主管機關得為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_authorized
   (or severe_financial_condition_penalty (= capital_level_4_penalty_period 1))))

; [insurance:prohibited_actions_without_supervisor_consent] 監管處分期間未經監管人同意不得為特定行為
(assert (= prohibited_actions_without_supervisor_consent
   (and under_supervisory_measures
        (not (or supervisor_consent_other_major_financial_matters
                 supervisor_consent_payment_or_disposal
                 supervisor_consent_contract_or_commitment)))))

; [aml:internal_control_compliance] 建立洗錢防制內部控制與稽核制度且執行
(assert (= aml_internal_control_compliance
   (and aml_internal_control_established aml_internal_control_executed)))

; [aml:penalty_for_noncompliance] 違反洗錢防制法規定未建立或未依規定執行制度
(assert (= aml_penalty_condition
   (or (not aml_internal_control_compliance) aml_avoid_or_obstruct_inspection)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未完成改善計畫期限屆滿90日以上，或財務狀況嚴重惡化且未改善，或違反洗錢防制法規定時處罰
(assert (= penalty
   (or aml_penalty_condition
       severe_financial_condition_penalty
       (= capital_level_4_penalty_period 1))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_increase_or_improvement_completed false))
(assert (= days_after_deadline 7))
(assert (= financial_or_business_deteriorated false))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= risk_to_insured_rights false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= accelerated_loss_and_net_worth_deterioration false))
(assert (= improvement_after_guidance false))
(assert (= aml_internal_control_established false))
(assert (= aml_internal_control_executed false))
(assert (= aml_avoid_or_obstruct_inspection false))
(assert (= under_supervisory_measures false))
(assert (= supervisor_consent_payment_or_disposal false))
(assert (= supervisor_consent_contract_or_commitment false))
(assert (= supervisor_consent_other_major_financial_matters false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 32
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
