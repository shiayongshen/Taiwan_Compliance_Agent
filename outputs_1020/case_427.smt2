; SMT2 file generated from compliance case automatic
; Case ID: case_427
; Generated at: 2025-10-19T15:37:44.008923
;
; This file can be executed with Z3:
;   z3 case_427.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_and_broker_regulations_applied Bool)
(declare-const approved_by_authority Bool)
(declare-const bank_permission_and_compliance Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_report_and_fee_disclosure Bool)
(declare-const engage_as_agent Bool)
(declare-const engage_as_broker Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosed_clearly Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const illegal_insurance_business Bool)
(declare-const insurance_type_guarantee Bool)
(declare-const insurance_type_responsibility Bool)
(declare-const is_agent Bool)
(declare-const is_bank Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const legal_insurance_business Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_held Bool)
(declare-const operate_as_agent Bool)
(declare-const operate_as_broker Bool)
(declare-const operate_as_notary Bool)
(declare-const operate_without_license Bool)
(declare-const penalty Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_compliance Bool)
(declare-const within_authority_scope Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and approved_by_authority
        guarantee_deposit_paid
        related_insurance_purchased
        license_held)))

; [insurance:related_insurance_type_compliance] 相關保險類型依身份區分：代理人、公證人為責任保險；經紀人為責任保險及保證保險
(assert (= related_insurance_type_compliance
   (or (and is_agent insurance_type_responsibility)
       (and is_notary insurance_type_responsibility)
       (and is_broker insurance_type_responsibility insurance_type_guarantee))))

; [insurance:bank_permission_and_compliance] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_compliance
   (or (not is_bank)
       (and approved_by_authority
            (or engage_as_agent engage_as_broker)
            agent_and_broker_regulations_applied))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_report_and_fee_disclosure
   (and within_authority_scope
        written_analysis_report_provided
        (or (not fee_charged) fee_disclosed_clearly))))

; [insurance:operate_without_license_penalty] 未領有執業證照而經營或執行保險代理人、經紀人、公證人業務者處罰
(assert (= operate_without_license
   (and (not license_held)
        (or operate_as_agent operate_as_broker operate_as_notary))))

; [insurance:illegal_insurance_business_penalty] 非本法保險業或外國保險業代理、經紀或招攬保險業務者處罰
(assert (not (= legal_insurance_business illegal_insurance_business)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：未依規定許可、繳存保證金、投保相關保險、領有執業證照或非法經營保險業務時處罰
(assert (= penalty
   (or (not license_and_guarantee_compliance)
       (not related_insurance_type_compliance)
       illegal_insurance_business
       operate_without_license)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approved_by_authority false))
(assert (= guarantee_deposit_paid false))
(assert (= related_insurance_purchased false))
(assert (= license_held false))
(assert (= operate_as_agent false))
(assert (= operate_as_broker false))
(assert (= operate_as_notary false))
(assert (= operate_without_license true))
(assert (= illegal_insurance_business true))
(assert (= legal_insurance_business false))
(assert (= penalty true))
(assert (= is_agent false))
(assert (= is_broker false))
(assert (= is_notary false))
(assert (= is_bank false))
(assert (= engage_as_agent false))
(assert (= engage_as_broker false))
(assert (= agent_and_broker_regulations_applied false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_fulfill_fidelity false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= within_authority_scope false))
(assert (= written_analysis_report_provided false))
(assert (= fee_charged false))
(assert (= fee_disclosed_clearly false))
(assert (= broker_report_and_fee_disclosure false))
(assert (= insurance_type_responsibility false))
(assert (= insurance_type_guarantee false))
(assert (= related_insurance_type_compliance false))
(assert (= bank_permission_and_compliance false))
(assert (= license_and_guarantee_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 31
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
