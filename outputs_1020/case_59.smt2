; SMT2 file generated from compliance case automatic
; Case ID: case_59
; Generated at: 2025-10-19T06:53:01.893432
;
; This file can be executed with Z3:
;   z3 case_59.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_not_permitted Bool)
(declare-const agent_business_compliance Bool)
(declare-const bank_permit_and_separate_compliance Bool)
(declare-const bank_permit_granted Bool)
(declare-const broker_business_compliance Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_fidelity_duty Bool)
(declare-const broker_must_provide_written_report_and_disclose_fee Bool)
(declare-const deposit_paid Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosed Bool)
(declare-const insurance_policy_purchased Bool)
(declare-const insurance_policy_type_correct Bool)
(declare-const license_held Bool)
(declare-const penalty Bool)
(declare-const permit_granted Bool)
(declare-const policy_type_guarantee Bool)
(declare-const policy_type_responsibility Bool)
(declare-const role_agent_or_notary Bool)
(declare-const role_broker Bool)
(declare-const violate_article_165_1_or_163_5_applied Bool)
(declare-const violate_broker_duties Bool)
(declare-const violate_financial_or_business_management Bool)
(declare-const violation_article_165_1_or_163_5_applied Bool)
(declare-const violation_broker_duties Bool)
(declare-const violation_financial_or_business_management Bool)
(declare-const written_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_not_permitted] 保險代理人、經紀人、公證人未經主管機關許可、未繳存保證金或未投保相關保險
(assert (not (= (and permit_granted
             deposit_paid
             insurance_policy_purchased
             license_held)
        agent_broker_not_permitted)))

; [insurance:insurance_policy_type_correct] 保險代理人、公證人投保責任保險，保險經紀人投保責任保險及保證保險
(assert (= insurance_policy_type_correct
   (and (or policy_type_responsibility (not role_agent_or_notary))
        (or (not role_broker)
            (and policy_type_responsibility policy_type_guarantee)))))

; [insurance:bank_permit_and_separate_compliance] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permit_and_separate_compliance
   (or (not bank_permit_granted)
       (and agent_business_compliance broker_business_compliance))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_duty_of_care broker_fidelity_duty)))

; [insurance:broker_must_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_must_provide_written_report_and_disclose_fee
   (and written_report_provided (or fee_disclosed (not fee_charged)))))

; [insurance:violation_financial_or_business_management] 違反保險法第163條第四項管理規則中財務或業務管理規定
(assert (= violation_financial_or_business_management
   violate_financial_or_business_management))

; [insurance:violation_broker_duties] 違反保險法第163條第七項規定
(assert (= violation_broker_duties violate_broker_duties))

; [insurance:violation_article_165_1_or_163_5_applied] 違反保險法第165條第一項或第163條第五項準用規定
(assert (= violation_article_165_1_or_163_5_applied
   violate_article_165_1_or_163_5_applied))

; [meta:penalty_default_false] 預設不處罰
(assert (or (not penalty)
    (not (and (not violation_financial_or_business_management)
              (not violation_broker_duties)
              (not violation_article_165_1_or_163_5_applied)))))

; [meta:penalty_conditions] 處罰條件：違反財務或業務管理規定、違反經紀人義務或違反相關規定時處罰
(assert (= penalty
   (or violation_article_165_1_or_163_5_applied
       violation_financial_or_business_management
       violation_broker_duties)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_broker_not_permitted false))
(assert (= agent_business_compliance false))
(assert (= bank_permit_and_separate_compliance true))
(assert (= bank_permit_granted false))
(assert (= broker_business_compliance true))
(assert (= broker_duty_of_care true))
(assert (= broker_fidelity_duty true))
(assert (= broker_must_provide_written_report_and_disclose_fee false))
(assert (= deposit_paid true))
(assert (= fee_charged false))
(assert (= fee_disclosed false))
(assert (= insurance_policy_purchased true))
(assert (= insurance_policy_type_correct true))
(assert (= license_held true))
(assert (= permit_granted true))
(assert (= policy_type_guarantee true))
(assert (= policy_type_responsibility true))
(assert (= role_agent_or_notary true))
(assert (= role_broker false))
(assert (= violate_article_165_1_or_163_5_applied false))
(assert (= violate_broker_duties false))
(assert (= violate_financial_or_business_management true))
(assert (= violation_article_165_1_or_163_5_applied false))
(assert (= violation_broker_duties false))
(assert (= violation_financial_or_business_management true))
(assert (= written_report_provided false))
(assert (= penalty true))
(assert (= broker_duty_of_care_and_fidelity false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 28
; Total facts: 28
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
