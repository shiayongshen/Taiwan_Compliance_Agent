; SMT2 file generated from compliance case automatic
; Case ID: case_401
; Generated at: 2025-10-21T08:49:00.469095
;
; This file can be executed with Z3:
;   z3 case_401.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_notary_license_and_guarantee Bool)
(declare-const apply_agent_broker_regulations Bool)
(declare-const bank_agent_or_broker_permitted Bool)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permitted_by_authority Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity_duty Bool)
(declare-const broker_report_and_fee_disclosure_ok Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosure_made Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance Bool)
(declare-const guarantee_minimum_amount Real)
(declare-const guarantee_minimum_amount_defined Bool)
(declare-const guarantee_minimum_amount_set_by_authority Bool)
(declare-const insurance_type Bool)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const liability_insurance Bool)
(declare-const license_permitted Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const qualification_and_management_rules_set Bool)
(declare-const qualification_and_management_rules_set_by_authority Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const relevant_insurance_type_ok Bool)
(declare-const within_authority_designated_scope Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_notary_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_broker_notary_license_and_guarantee
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        relevant_insurance_covered
        practice_certificate_held)))

; [insurance:relevant_insurance_type] 相關保險種類依身份區分：保險代理人、公證人為責任保險；保險經紀人為責任保險及保證保險
(assert (let ((a!1 (or (and is_agent (= insurance_type liability_insurance))
               (and is_notary (= insurance_type liability_insurance))
               (and is_broker
                    (or (= insurance_type guarantee_insurance)
                        (= insurance_type liability_insurance))))))
  (= relevant_insurance_type_ok a!1)))

; [insurance:guarantee_minimum_amount_defined_by_authority] 保證金最低金額及實施方式由主管機關依業務範圍及規模定之
(assert (= guarantee_minimum_amount_defined guarantee_minimum_amount_set_by_authority))

; [insurance:qualification_and_management_rules_set_by_authority] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= qualification_and_management_rules_set
   qualification_and_management_rules_set_by_authority))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_agent_or_broker_permitted
   (and bank_permitted_by_authority
        (or bank_operate_agent bank_operate_broker)
        apply_agent_broker_regulations)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約或提供服務，並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity_duty)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，向要保人或被保險人收取報酬者，應明確告知報酬標準
(assert (= broker_report_and_fee_disclosure_ok
   (and within_authority_designated_scope
        written_analysis_report_provided
        (or (not fee_charged) fee_disclosure_made))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照或違反保險經紀人義務時處罰
(assert (= penalty
   (or (not license_permitted)
       (not (>= guarantee_deposit_amount guarantee_minimum_amount))
       (not relevant_insurance_covered)
       (not practice_certificate_held)
       (not broker_duty_of_care_and_fidelity)
       (not broker_report_and_fee_disclosure_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= guarantee_deposit_amount 0.0))
(assert (= guarantee_minimum_amount 1000000.0))
(assert (= relevant_insurance_covered false))
(assert (= practice_certificate_held true))
(assert (= is_broker true))
(assert (= insurance_type true))
(assert (= broker_exercise_duty_of_care true))
(assert (= broker_fulfill_fidelity_duty true))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= broker_report_and_fee_disclosure_ok true))
(assert (= fee_charged false))
(assert (= fee_disclosure_made false))
(assert (= within_authority_designated_scope true))
(assert (= written_analysis_report_provided true))
(assert (= guarantee_minimum_amount_set_by_authority true))
(assert (= guarantee_minimum_amount_defined true))
(assert (= qualification_and_management_rules_set_by_authority true))
(assert (= qualification_and_management_rules_set true))
(assert (= agent_broker_notary_license_and_guarantee false))
(assert (= apply_agent_broker_regulations true))
(assert (= bank_permitted_by_authority false))
(assert (= bank_agent_or_broker_permitted false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= relevant_insurance_type_ok true))

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
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
