; SMT2 file generated from compliance case automatic
; Case ID: case_396
; Generated at: 2025-10-19T14:48:09.599088
;
; This file can be executed with Z3:
;   z3 case_396.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_type Bool)
(declare-const bank_agent_business Bool)
(declare-const bank_broker_business Bool)
(declare-const bank_permission_and_separate_application Bool)
(declare-const bank_permission_granted Bool)
(declare-const duty_of_care_and_fidelity Bool)
(declare-const duty_of_care_observed Bool)
(declare-const duty_of_fidelity_observed Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosure_made Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const insurance_type Bool)
(declare-const license_and_insurance_compliance Bool)
(declare-const license_permitted Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type Bool)
(declare-const within_designated_scope Bool)
(declare-const written_report_and_fee_disclosure Bool)
(declare-const written_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_agent:license_and_insurance_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_insurance_compliance
   (and license_permitted
        guarantee_deposit_paid
        related_insurance_purchased
        practice_certificate_held)))

; [insurance_agent:related_insurance_type] 相關保險種類依身份區分：保險代理人、公證人為責任保險；保險經紀人為責任保險及保證保險
(assert (= related_insurance_type (and agent_type insurance_type)))

; [insurance_agent:bank_permission_and_separate_application] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_separate_application
   (and bank_permission_granted (or bank_agent_business bank_broker_business))))

; [insurance_broker:duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約或提供服務，並負忠實義務
(assert (= duty_of_care_and_fidelity
   (and duty_of_care_observed duty_of_fidelity_observed)))

; [insurance_broker:written_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，向要保人或被保險人收取報酬者應明確告知報酬標準
(assert (= written_report_and_fee_disclosure
   (and within_designated_scope
        written_report_provided
        (or fee_disclosure_made (not fee_charged)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照或保險經紀人未履行善良管理人義務及書面報告義務時處罰
(assert (not (= (and license_permitted
             guarantee_deposit_paid
             related_insurance_purchased
             practice_certificate_held)
        penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_type true))
(assert (= license_permitted false))
(assert (= guarantee_deposit_paid false))
(assert (= related_insurance_purchased false))
(assert (= practice_certificate_held false))
(assert (= license_and_insurance_compliance false))
(assert (= penalty true))
(assert (= bank_permission_granted false))
(assert (= bank_agent_business false))
(assert (= bank_broker_business false))
(assert (= bank_permission_and_separate_application false))
(assert (= duty_of_care_observed true))
(assert (= duty_of_fidelity_observed true))
(assert (= duty_of_care_and_fidelity true))
(assert (= within_designated_scope true))
(assert (= written_report_provided true))
(assert (= fee_charged false))
(assert (= fee_disclosure_made true))
(assert (= written_report_and_fee_disclosure true))
(assert (= insurance_type false))
(assert (= related_insurance_type false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 21
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
