; SMT2 file generated from compliance case automatic
; Case ID: case_398
; Generated at: 2025-10-19T14:51:53.352369
;
; This file can be executed with Z3:
;   z3 case_398.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_not_permitted_without_license Bool)
(declare-const agent_or_notary Bool)
(declare-const bank_follow_agent_broker_rules Bool)
(declare-const bank_must_follow_agent_broker_rules Bool)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permitted Bool)
(declare-const bank_permitted_to_operate_agent_or_broker Bool)
(declare-const broker Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_duty_of_fidelity Bool)
(declare-const broker_must_provide_written_report_and_disclose_fee Bool)
(declare-const broker_provide_written_report Bool)
(declare-const deposit_guarantee Bool)
(declare-const guarantee_insurance_subscribed Bool)
(declare-const insurance_subscribed Bool)
(declare-const insurance_type_for_agent_broker_not_permitted Bool)
(declare-const liability_insurance_subscribed Bool)
(declare-const license_issued Bool)
(declare-const license_permitted Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_not_permitted_without_license] 保險代理人、經紀人、公證人未經主管機關許可、未繳存保證金、未投保相關保險或未領執業證照不得經營或執行業務
(assert (= agent_broker_not_permitted_without_license
   (and (or agent_or_notary broker)
        (not (and license_permitted
                  deposit_guarantee
                  insurance_subscribed
                  license_issued)))))

; [insurance:insurance_type_for_agent_broker_not_permitted] 保險代理人、公證人未投保責任保險，保險經紀人未投保責任保險及保證保險不得經營或執行業務
(assert (let ((a!1 (and (or agent_or_notary broker)
                (not (or (and agent_or_notary liability_insurance_subscribed)
                         (and broker
                              liability_insurance_subscribed
                              guarantee_insurance_subscribed))))))
  (= insurance_type_for_agent_broker_not_permitted a!1)))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務
(assert (= bank_permitted_to_operate_agent_or_broker
   (or bank_operate_broker bank_operate_agent (not bank_permitted))))

; [insurance:bank_must_follow_agent_broker_rules] 銀行兼營保險代理人或經紀人業務時，應分別準用本法有關保險代理人、保險經紀人之規定
(assert (= bank_must_follow_agent_broker_rules
   (or (not (or bank_operate_agent bank_operate_broker))
       bank_follow_agent_broker_rules)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_duty_of_care broker_duty_of_fidelity)))

; [insurance:broker_must_provide_written_report_and_disclose_fee] 保險經紀人洽訂保險契約前，應於主管機關指定範圍內主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_must_provide_written_report_and_disclose_fee
   (and broker_provide_written_report
        (or (not broker_charge_fee) broker_disclose_fee_standard))))

; [meta:penalty_default_false] 預設不處罰
(assert (let ((a!1 (not (and license_permitted
                     deposit_guarantee
                     insurance_subscribed
                     license_issued
                     (or (and agent_or_notary liability_insurance_subscribed)
                         (and broker
                              liability_insurance_subscribed
                              guarantee_insurance_subscribed))
                     broker_duty_of_care
                     broker_duty_of_fidelity
                     broker_provide_written_report
                     (or broker_disclose_fee_standard (not broker_charge_fee))))))
  (or a!1 (not penalty))))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照，或保險經紀人未履行善良管理人注意義務及忠實義務，或未提供書面分析報告及報酬標準告知時處罰
(assert (let ((a!1 (or (not (and license_permitted
                         deposit_guarantee
                         insurance_subscribed
                         license_issued))
               broker_disclose_fee_standard
               (not (or (and agent_or_notary liability_insurance_subscribed)
                        (and broker
                             liability_insurance_subscribed
                             guarantee_insurance_subscribed)))
               (not broker_provide_written_report)
               (not (and broker_duty_of_care broker_duty_of_fidelity))
               (not broker_charge_fee))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_or_notary false))
(assert (= broker true))
(assert (= license_permitted false))
(assert (= deposit_guarantee false))
(assert (= insurance_subscribed false))
(assert (= license_issued false))
(assert (= liability_insurance_subscribed false))
(assert (= guarantee_insurance_subscribed false))
(assert (= broker_duty_of_care true))
(assert (= broker_duty_of_fidelity true))
(assert (= broker_provide_written_report true))
(assert (= broker_charge_fee false))
(assert (= broker_disclose_fee_standard true))
(assert (= agent_broker_not_permitted_without_license true))
(assert (= insurance_type_for_agent_broker_not_permitted true))
(assert (= penalty true))
(assert (= bank_permitted false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= bank_follow_agent_broker_rules false))
(assert (= bank_must_follow_agent_broker_rules false))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= broker_must_provide_written_report_and_disclose_fee true))
(assert (= bank_permitted_to_operate_agent_or_broker false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 24
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
