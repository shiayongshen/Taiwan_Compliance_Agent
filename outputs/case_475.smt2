; SMT2 file generated from compliance case automatic
; Case ID: case_475
; Generated at: 2025-10-21T10:30:56.217352
;
; This file can be executed with Z3:
;   z3 case_475.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_or_notary Bool)
(declare-const agent_pre_service_training Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_for_agent_or_broker Bool)
(declare-const bank_permission_granted Bool)
(declare-const bond_deposited Bool)
(declare-const broker Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_provide_written_report_and_disclose_fee Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosed Bool)
(declare-const guarantee_insurance_purchased Bool)
(declare-const insurance_purchased Bool)
(declare-const insurance_type_correct Bool)
(declare-const legal_compliance_training Bool)
(declare-const legal_compliance_training_hours Real)
(declare-const liability_insurance_purchased Bool)
(declare-const license_and_bond_and_insurance Bool)
(declare-const license_issued Bool)
(declare-const license_permitted Bool)
(declare-const penalty Bool)
(declare-const pre_service_training_hours Real)
(declare-const pre_service_training_passed Bool)
(declare-const written_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_bond_and_insurance] 保險代理人、經紀人、公證人須經許可、繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_bond_and_insurance
   (and license_permitted bond_deposited insurance_purchased license_issued)))

; [insurance:insurance_type_correct] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= insurance_type_correct
   (and (or liability_insurance_purchased (not agent_or_notary))
        (or (not broker)
            (and liability_insurance_purchased guarantee_insurance_purchased)))))

; [insurance:bank_permission_for_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_for_agent_or_broker
   (or (not bank_permission_granted)
       bank_operate_as_agent
       bank_operate_as_broker)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_provide_written_report_and_disclose_fee
   (and written_report_provided (or (not fee_charged) fee_disclosed))))

; [insurance:agent_pre_service_training] 個人執業代理人及受代理人公司或銀行任用代理人應於申請執行業務前一年內參加職前教育訓練達32小時以上並測驗及格
(assert (= agent_pre_service_training
   (and (<= 32.0 pre_service_training_hours) pre_service_training_passed)))

; [insurance:legal_compliance_training] 法令遵循人員應參加職前教育訓練30小時以上
(assert (= legal_compliance_training (<= 30.0 legal_compliance_training_hours)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經許可、未繳存保證金、未投保相關保險、未領執業證照、保險經紀人未履行義務、未提供書面報告或未告知報酬標準、未完成職前教育訓練或測驗不合格時處罰
(assert (= penalty
   (or (not agent_pre_service_training)
       (not legal_compliance_training)
       (and broker (not broker_duty_of_care_and_fidelity))
       (not license_and_bond_and_insurance)
       (and broker (not broker_provide_written_report_and_disclose_fee))
       (not insurance_type_correct))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_or_notary true))
(assert (= license_permitted false))
(assert (= bond_deposited false))
(assert (= insurance_purchased false))
(assert (= license_issued false))
(assert (= liability_insurance_purchased false))
(assert (= pre_service_training_hours 0))
(assert (= pre_service_training_passed false))
(assert (= legal_compliance_training_hours 0))
(assert (= penalty true))
(assert (= broker false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_fulfill_fidelity false))
(assert (= broker_provide_written_report_and_disclose_fee false))
(assert (= fee_charged false))
(assert (= fee_disclosed false))
(assert (= guarantee_insurance_purchased false))
(assert (= written_report_provided false))
(assert (= bank_permission_granted false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= agent_pre_service_training false))
(assert (= legal_compliance_training false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 27
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
