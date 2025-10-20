; SMT2 file generated from compliance case automatic
; Case ID: case_424
; Generated at: 2025-10-19T15:32:24.939777
;
; This file can be executed with Z3:
;   z3 case_424.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_notary_license_and_guarantee Bool)
(declare-const apply_agent_broker_regulations Bool)
(declare-const bank_engage_agent Bool)
(declare-const bank_engage_broker Bool)
(declare-const bank_license_permitted Bool)
(declare-const bank_permitted_agent_or_broker Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity_duty Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_written_report_and_fee_disclosure Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance Bool)
(declare-const guarantee_minimum_amount Real)
(declare-const guarantee_minimum_amount_determined_by_authority Bool)
(declare-const insurance_type Int)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const liability_insurance Bool)
(declare-const license_permitted Bool)
(declare-const minimum_guarantee_amount_determined Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const qualification_and_management_rules_set Bool)
(declare-const qualification_and_management_rules_set_by_authority Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_ok Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_notary_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_broker_notary_license_and_guarantee
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        related_insurance_purchased
        practice_certificate_held)))

; [insurance:related_insurance_type] 相關保險種類依身份區分：保險代理人、公證人為責任保險；保險經紀人為責任保險及保證保險
(assert (let ((a!1 (and is_broker
                (or (= insurance_type (ite liability_insurance 1 0))
                    (= insurance_type (ite guarantee_insurance 1 0))))))
(let ((a!2 (or (and is_agent (= insurance_type (ite liability_insurance 1 0)))
               (and is_notary (= insurance_type (ite liability_insurance 1 0)))
               a!1)))
  (= related_insurance_type_ok a!2))))

; [insurance:minimum_guarantee_amount_determined_by_authority] 保證金最低金額及實施方式由主管機關依經營業務範圍及規模等因素定之
(assert (= minimum_guarantee_amount_determined
   guarantee_minimum_amount_determined_by_authority))

; [insurance:qualification_and_management_rules_set_by_authority] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他應遵行事項由主管機關定之
(assert (= qualification_and_management_rules_set
   qualification_and_management_rules_set_by_authority))

; [insurance:bank_permitted_to_engage_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_agent_or_broker
   (and bank_license_permitted
        (or bank_engage_agent bank_engage_broker)
        apply_agent_broker_regulations)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約或提供服務，並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity_duty)))

; [insurance:broker_provide_written_analysis_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，向要保人或被保險人收取報酬者應明確告知報酬標準
(assert (= broker_written_report_and_fee_disclosure
   (and broker_provide_written_report
        (or (not broker_charge_fee) broker_disclose_fee_standard))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險或未領執業證照者處罰
(assert (= penalty
   (or (not related_insurance_purchased)
       (not (>= guarantee_deposit_amount guarantee_minimum_amount))
       (not practice_certificate_held)
       (not license_permitted))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= guarantee_deposit_amount 0.0))
(assert (= guarantee_minimum_amount 1000000.0))
(assert (= related_insurance_purchased false))
(assert (= practice_certificate_held false))
(assert (= agent_broker_notary_license_and_guarantee false))
(assert (= is_broker true))
(assert (= is_agent false))
(assert (= is_notary false))
(assert (= insurance_type 0))
(assert (= related_insurance_type_ok false))
(assert (= guarantee_minimum_amount_determined_by_authority true))
(assert (= minimum_guarantee_amount_determined true))
(assert (= qualification_and_management_rules_set_by_authority true))
(assert (= qualification_and_management_rules_set true))
(assert (= penalty true))
(assert (= apply_agent_broker_regulations true))
(assert (= bank_license_permitted false))
(assert (= bank_engage_agent false))
(assert (= bank_engage_broker false))
(assert (= bank_permitted_agent_or_broker false))
(assert (= broker_charge_fee false))
(assert (= broker_disclose_fee_standard false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_fulfill_fidelity_duty false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_provide_written_report false))
(assert (= broker_written_report_and_fee_disclosure false))
(assert (= guarantee_insurance false))
(assert (= liability_insurance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 30
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
