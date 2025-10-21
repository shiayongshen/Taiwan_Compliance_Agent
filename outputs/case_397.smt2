; SMT2 file generated from compliance case automatic
; Case ID: case_397
; Generated at: 2025-10-21T08:45:35.143644
;
; This file can be executed with Z3:
;   z3 case_397.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_type Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_and_separate_application Bool)
(declare-const bank_permission_granted Bool)
(declare-const bank_separately_apply_agent_broker_rules Bool)
(declare-const duty_of_care_and_fidelity Bool)
(declare-const duty_of_care_observed Bool)
(declare-const duty_of_fidelity_observed Bool)
(declare-const fee_charged Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const guarantee_insurance_purchased Bool)
(declare-const liability_insurance_purchased Bool)
(declare-const license_and_insurance_compliance Bool)
(declare-const license_permitted Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const pre_contract_report_and_fee_disclosure Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_compliance Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_agent:license_and_insurance_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_insurance_compliance
   (and license_permitted
        guarantee_deposit_paid
        related_insurance_purchased
        practice_certificate_held)))

; [insurance_agent:related_insurance_type_compliance] 相關保險種類依代理人、經紀人、公證人身份區分
(assert (= related_insurance_type_compliance
   (and agent_type liability_insurance_purchased)))

; [insurance_agent:bank_permission_and_separate_application] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_separate_application
   (and bank_permission_granted
        (or bank_operate_as_agent bank_operate_as_broker)
        bank_separately_apply_agent_broker_rules)))

; [insurance_broker:duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約並負忠實義務
(assert (= duty_of_care_and_fidelity
   (and duty_of_care_observed duty_of_fidelity_observed)))

; [insurance_broker:pre_contract_report_and_fee_disclosure] 保險經紀人洽訂保險契約前應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= pre_contract_report_and_fee_disclosure
   (and written_analysis_report_provided
        (or fee_standard_disclosed (not fee_charged)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照或未遵守保險經紀人義務時處罰
(assert (= penalty
   (or (not related_insurance_type_compliance)
       (not license_and_insurance_compliance)
       (not pre_contract_report_and_fee_disclosure)
       (not bank_permission_and_separate_application)
       (not duty_of_care_and_fidelity))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_type false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= bank_permission_and_separate_application false))
(assert (= bank_permission_granted false))
(assert (= bank_separately_apply_agent_broker_rules false))
(assert (= duty_of_care_and_fidelity true))
(assert (= duty_of_care_observed true))
(assert (= duty_of_fidelity_observed true))
(assert (= fee_charged false))
(assert (= fee_standard_disclosed false))
(assert (= guarantee_deposit_paid false))
(assert (= guarantee_insurance_purchased false))
(assert (= liability_insurance_purchased false))
(assert (= license_and_insurance_compliance false))
(assert (= license_permitted true))
(assert (= penalty true))
(assert (= practice_certificate_held true))
(assert (= pre_contract_report_and_fee_disclosure true))
(assert (= related_insurance_purchased false))
(assert (= related_insurance_type_compliance false))
(assert (= written_analysis_report_provided true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 22
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
