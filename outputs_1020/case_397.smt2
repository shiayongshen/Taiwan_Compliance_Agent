; SMT2 file generated from compliance case automatic
; Case ID: case_397
; Generated at: 2025-10-19T14:49:20.262024
;
; This file can be executed with Z3:
;   z3 case_397.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_and_guarantee Bool)
(declare-const bank_compliance_with_agent_rules Bool)
(declare-const bank_compliance_with_broker_rules Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_and_compliance Bool)
(declare-const bank_permission_granted Bool)
(declare-const broker_charge_fee Real)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_report_and_fee_disclosure Bool)
(declare-const guarantee Real)
(declare-const guarantee_deposit Real)
(declare-const guarantee_minimum Real)
(declare-const guarantee_minimum_set_by_authority Bool)
(declare-const insurance_policy_type_ok Bool)
(declare-const insurance_policy_valid Bool)
(declare-const insurance_type Int)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const liability Real)
(declare-const license_permitted Bool)
(declare-const minimum_guarantee_and_insurance_set Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const qualification_and_management_rules_set Bool)
(declare-const rules_set_by_authority Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_license_and_guarantee
   (and license_permitted
        (= guarantee_deposit 1.0)
        (= guarantee_minimum 1.0)
        insurance_policy_valid
        practice_certificate_held)))

; [insurance:insurance_policy_type] 相關保險種類依身份區分：代理人、公證人為責任保險；經紀人為責任保險及保證保險
(assert (let ((a!1 (and is_broker
                (or (= (to_real insurance_type) liability)
                    (= (to_real insurance_type) guarantee)))))
(let ((a!2 (or (and is_agent (= (to_real insurance_type) liability))
               (and is_notary (= (to_real insurance_type) liability))
               a!1)))
  (= insurance_policy_type_ok a!2))))

; [insurance:minimum_guarantee_and_insurance] 繳存保證金及投保相關保險之最低金額及實施方式由主管機關定之
(assert (= minimum_guarantee_and_insurance_set guarantee_minimum_set_by_authority))

; [insurance:qualification_and_management_rules] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= qualification_and_management_rules_set rules_set_by_authority))

; [insurance:bank_permission_for_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_compliance
   (and bank_permission_granted
        (or bank_operate_as_agent bank_operate_as_broker)
        bank_compliance_with_agent_rules
        bank_compliance_with_broker_rules)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity)))

; [insurance:broker_must_provide_written_report_and_disclose_fee] 保險經紀人洽訂保險契約前，於主管機關指定範圍內，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (let ((a!1 (and broker_provide_written_report
                (or broker_disclose_fee_standard
                    (not (= broker_charge_fee 1.0))))))
  (= broker_report_and_fee_disclosure a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照、保險種類不符、銀行未依規定經營、經紀人未盡義務或未提供書面報告及報酬標準時處罰
(assert (= penalty
   (or (not practice_certificate_held)
       (not bank_permission_and_compliance)
       (not license_permitted)
       (not broker_report_and_fee_disclosure)
       (not insurance_policy_valid)
       (not (= guarantee_deposit 1.0))
       (not insurance_policy_type_ok)
       (not broker_duty_of_care_and_fidelity))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= guarantee_deposit 0.0))
(assert (= guarantee_minimum 0.0))
(assert (= insurance_policy_valid false))
(assert (= practice_certificate_held false))
(assert (= is_broker true))
(assert (= is_agent false))
(assert (= is_notary false))
(assert (= insurance_policy_type_ok false))
(assert (= guarantee_minimum_set_by_authority true))
(assert (= qualification_and_management_rules_set true))
(assert (= rules_set_by_authority true))
(assert (= bank_permission_granted false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= bank_compliance_with_agent_rules false))
(assert (= bank_compliance_with_broker_rules false))
(assert (= bank_permission_and_compliance false))
(assert (= broker_exercise_duty_of_care true))
(assert (= broker_fulfill_fidelity true))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= broker_provide_written_report true))
(assert (= broker_charge_fee 0.0))
(assert (= broker_disclose_fee_standard true))
(assert (= broker_report_and_fee_disclosure true))
(assert (= agent_license_and_guarantee false))
(assert (= minimum_guarantee_and_insurance_set true))
(assert (= penalty true))
(assert (= guarantee 0.0))
(assert (= insurance_type 0))
(assert (= liability 0.0))

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
