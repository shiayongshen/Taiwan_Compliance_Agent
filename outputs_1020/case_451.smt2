; SMT2 file generated from compliance case automatic
; Case ID: case_451
; Generated at: 2025-10-19T16:21:30.702033
;
; This file can be executed with Z3:
;   z3 case_451.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_and_guarantee Bool)
(declare-const bank_complies_with_agent_broker_rules Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_and_compliance Bool)
(declare-const bank_permission_granted Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercises_diligence Bool)
(declare-const broker_fulfills_fidelity Bool)
(declare-const broker_receives_fee Bool)
(declare-const broker_report_and_fee_disclosure Bool)
(declare-const compensation_obligation Bool)
(declare-const compensation_responsibility Bool)
(declare-const damage_due_to_negligence Bool)
(declare-const fee_disclosure_made Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance Bool)
(declare-const guarantee_minimum_amount Real)
(declare-const guarantee_minimum_amount_set_by_authority Bool)
(declare-const has_practice_certificate Bool)
(declare-const insurance_type Int)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const liability_insurance Bool)
(declare-const license_permitted Bool)
(declare-const management_rules_defined_by_authority Bool)
(declare-const management_rules_set Bool)
(declare-const minimum_guarantee_amount_set Bool)
(declare-const penalty Bool)
(declare-const related_insurance_subscribed Bool)
(declare-const related_insurance_type_ok Bool)
(declare-const violate_broker_duty_of_care Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_related_provisions Bool)
(declare-const violation_financial_or_business_management Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_license_and_guarantee
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        related_insurance_subscribed
        has_practice_certificate)))

; [insurance:related_insurance_type] 相關保險種類依身份區分：代理人、公證人為責任保險；經紀人為責任保險及保證保險
(assert (let ((a!1 (and is_broker
                (or (= insurance_type (ite guarantee_insurance 1 0))
                    (= insurance_type (ite liability_insurance 1 0))))))
(let ((a!2 (or (and is_agent (= insurance_type (ite liability_insurance 1 0)))
               (and is_notary (= insurance_type (ite liability_insurance 1 0)))
               a!1)))
  (= related_insurance_type_ok a!2))))

; [insurance:minimum_guarantee_amount_set] 主管機關依經營及執行業務範圍及規模定最低保證金及實施方式
(assert (= minimum_guarantee_amount_set guarantee_minimum_amount_set_by_authority))

; [insurance:management_rules_set] 主管機關定管理規則涵蓋資格、申請、程序、文件、董事監察人經理人資格、解任、分支機構、財務業務管理、教育訓練、廢止許可及其他事項
(assert (= management_rules_set management_rules_defined_by_authority))

; [insurance:bank_permission_for_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_compliance
   (and bank_permission_granted
        (or bank_operate_as_agent bank_operate_as_broker)
        bank_complies_with_agent_broker_rules)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercises_diligence broker_fulfills_fidelity)))

; [insurance:broker_must_provide_written_report_and_disclose_fee] 保險經紀人洽訂契約前應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_report_and_fee_disclosure
   (and written_analysis_report_provided
        (or (not broker_receives_fee) fee_disclosure_made))))

; [insurance:violation_financial_or_business_management] 違反管理規則中財務或業務管理規定、經紀人善良管理義務或相關準用規定者應限期改正或處罰
(assert (= violation_financial_or_business_management
   (or violate_related_provisions
       violate_business_management_rules
       violate_broker_duty_of_care
       violate_financial_management_rules)))

; [insurance:compensation_responsibility] 個人執業經紀人、經紀人公司及銀行因過失致損害應負賠償責任
(assert (= compensation_responsibility
   (or compensation_obligation (not damage_due_to_negligence))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反財務或業務管理規定、經紀人義務或相關準用規定時處罰
(assert (= penalty violation_financial_or_business_management))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted true))
(assert (= guarantee_deposit_amount 0.0))
(assert (= guarantee_minimum_amount 0.0))
(assert (= related_insurance_subscribed true))
(assert (= has_practice_certificate false))
(assert (= is_broker true))
(assert (= insurance_type 0))
(assert (= broker_exercises_diligence false))
(assert (= broker_fulfills_fidelity false))
(assert (= written_analysis_report_provided false))
(assert (= broker_receives_fee false))
(assert (= fee_disclosure_made false))
(assert (= violate_business_management_rules true))
(assert (= violate_broker_duty_of_care true))
(assert (= violate_related_provisions true))
(assert (= violation_financial_or_business_management true))
(assert (= penalty true))
(assert (= compensation_obligation false))
(assert (= damage_due_to_negligence false))
(assert (= bank_permission_granted false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= bank_complies_with_agent_broker_rules false))
(assert (= management_rules_defined_by_authority true))
(assert (= management_rules_set true))
(assert (= guarantee_minimum_amount_set_by_authority true))
(assert (= minimum_guarantee_amount_set true))
(assert (= agent_license_and_guarantee false))
(assert (= related_insurance_type_ok true))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_report_and_fee_disclosure false))
(assert (= compensation_responsibility false))
(assert (= bank_permission_and_compliance false))
(assert (= guarantee_insurance false))
(assert (= is_agent false))
(assert (= is_notary false))
(assert (= liability_insurance false))
(assert (= violate_financial_management_rules false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 38
; Total facts: 38
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
