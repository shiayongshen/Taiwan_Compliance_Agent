; SMT2 file generated from compliance case automatic
; Case ID: case_393
; Generated at: 2025-10-21T08:42:40.783378
;
; This file can be executed with Z3:
;   z3 case_393.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_notary_license_and_guarantee Bool)
(declare-const bank_license_permitted Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permitted_to_operate_agent_or_broker Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_duty_of_fidelity Bool)
(declare-const broker_must_provide_written_report_and_disclose_fee Bool)
(declare-const fee_collected Bool)
(declare-const fee_disclosure_made Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const guarantee_insurance_subscribed Bool)
(declare-const liability_insurance Bool)
(declare-const liability_insurance_subscribed Bool)
(declare-const license_permitted Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const related_insurance_subscribed Bool)
(declare-const related_insurance_type_agent_notary Bool)
(declare-const related_insurance_type_broker Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_notary_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_broker_notary_license_and_guarantee
   (and license_permitted
        guarantee_deposit_paid
        related_insurance_subscribed
        practice_certificate_held)))

; [insurance:related_insurance_type_agent_notary] 保險代理人、公證人應投保責任保險
(assert (= related_insurance_type_agent_notary
   (= related_insurance_type_agent_notary liability_insurance)))

; [insurance:related_insurance_type_broker] 保險經紀人應投保責任保險及保證保險
(assert (= related_insurance_type_broker
   (and liability_insurance_subscribed guarantee_insurance_subscribed)))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_operate_agent_or_broker
   (and bank_license_permitted
        (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_duty_of_care broker_duty_of_fidelity)))

; [insurance:broker_must_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_must_provide_written_report_and_disclose_fee
   (and written_analysis_report_provided
        (or fee_disclosure_made (not fee_collected)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險或未領執業證照者處罰
(assert (= penalty
   (or (not practice_certificate_held)
       (not license_permitted)
       (not related_insurance_subscribed)
       (not guarantee_deposit_paid))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted true))
(assert (= guarantee_deposit_paid false))
(assert (= related_insurance_subscribed true))
(assert (= practice_certificate_held true))
(assert (= agent_broker_notary_license_and_guarantee false))
(assert (= related_insurance_type_broker true))
(assert (= liability_insurance_subscribed true))
(assert (= guarantee_insurance_subscribed true))
(assert (= broker_duty_of_care true))
(assert (= broker_duty_of_fidelity true))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= broker_must_provide_written_report_and_disclose_fee true))
(assert (= written_analysis_report_provided true))
(assert (= fee_collected false))
(assert (= fee_disclosure_made false))
(assert (= bank_license_permitted false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= bank_permitted_to_operate_agent_or_broker false))
(assert (= liability_insurance true))
(assert (= related_insurance_type_agent_notary true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 22
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
