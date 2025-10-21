; SMT2 file generated from compliance case automatic
; Case ID: case_424
; Generated at: 2025-10-21T09:19:00.553063
;
; This file can be executed with Z3:
;   z3 case_424.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_type Bool)
(declare-const bank_permission_and_separate_application Bool)
(declare-const bank_permission_granted Bool)
(declare-const duty_of_care_and_fidelity Bool)
(declare-const duty_of_care_exercised Bool)
(declare-const duty_of_fidelity_exercised Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosure_made Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const insurance_type Bool)
(declare-const license_and_guarantee_required Bool)
(declare-const license_permitted Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type Bool)
(declare-const separate_application_of_agent_and_broker_rules Bool)
(declare-const written_analysis_report_provided Bool)
(declare-const written_report_and_fee_disclosure Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_agent:license_and_guarantee_required] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_required
   (and license_permitted
        guarantee_deposit_paid
        related_insurance_purchased
        practice_certificate_held)))

; [insurance_agent:related_insurance_type] 相關保險種類依身份區分：保險代理人、公證人為責任保險；保險經紀人為責任保險及保證保險
(assert (and (or (and agent_type insurance_type) (not related_insurance_type))
     (or (not (and agent_type insurance_type)) related_insurance_type)))

; [insurance_agent:bank_permission_and_separate_application] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並應分別準用相關規定
(assert (= bank_permission_and_separate_application
   (and bank_permission_granted separate_application_of_agent_and_broker_rules)))

; [insurance_broker:duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約並負忠實義務
(assert (= duty_of_care_and_fidelity
   (and duty_of_care_exercised duty_of_fidelity_exercised)))

; [insurance_broker:written_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，向要保人或被保險人收取報酬者應明確告知報酬標準
(assert (= written_report_and_fee_disclosure
   (and written_analysis_report_provided
        (or fee_disclosure_made (not fee_charged)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照或保險經紀人未履行善良管理人注意義務及忠實義務，或未提供書面分析報告及報酬告知時處罰
(assert (= penalty
   (or (not written_report_and_fee_disclosure)
       (and fee_charged (not written_report_and_fee_disclosure))
       (not duty_of_care_and_fidelity)
       (not license_and_guarantee_required))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_type true))
(assert (= license_permitted true))
(assert (= guarantee_deposit_paid false))
(assert (= related_insurance_purchased false))
(assert (= practice_certificate_held true))
(assert (= license_and_guarantee_required false))
(assert (= duty_of_care_exercised true))
(assert (= duty_of_fidelity_exercised true))
(assert (= duty_of_care_and_fidelity true))
(assert (= written_analysis_report_provided true))
(assert (= fee_charged false))
(assert (= fee_disclosure_made false))
(assert (= written_report_and_fee_disclosure true))
(assert (= bank_permission_granted false))
(assert (= separate_application_of_agent_and_broker_rules false))
(assert (= bank_permission_and_separate_application false))
(assert (= related_insurance_type true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 19
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
