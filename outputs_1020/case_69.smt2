; SMT2 file generated from compliance case automatic
; Case ID: case_69
; Generated at: 2025-10-19T07:08:54.422059
;
; This file can be executed with Z3:
;   z3 case_69.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_type Real)
(declare-const bank_operate_agent Real)
(declare-const bank_operate_broker Real)
(declare-const bank_permitted Bool)
(declare-const bank_permitted_to_operate_agent_or_broker Bool)
(declare-const broker_charge_fee Real)
(declare-const broker_disclose_fee_standard Real)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_provide_written_report_and_disclose_fee Bool)
(declare-const correction_or_penalty_required Bool)
(declare-const correction_ordered Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_minimum_amount Real)
(declare-const guarantee_minimum_amount_defined_by_authority Bool)
(declare-const guarantee_minimum_amount_set_by_authority Bool)
(declare-const insurance_type Real)
(declare-const license_and_guarantee_required Bool)
(declare-const license_permitted Bool)
(declare-const license_revoked Bool)
(declare-const management_rules_defined Bool)
(declare-const management_rules_defined_by_authority Bool)
(declare-const penalty Bool)
(declare-const penalty_imposed Bool)
(declare-const practice_certificate_held Bool)
(declare-const relevant_insurance_purchased Bool)
(declare-const relevant_insurance_type_correct Bool)
(declare-const violate_broker_duties Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_management_or_broker_rules Bool)
(declare-const violate_related_provisions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_required] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_required
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        relevant_insurance_purchased
        practice_certificate_held)))

; [insurance:relevant_insurance_type_correct] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (let ((a!1 (or (and (= 2.0 agent_type)
                    (or (= 1.0 insurance_type) (= 2.0 insurance_type)))
               (and (= 3.0 agent_type) (= 1.0 insurance_type))
               (and (= 1.0 agent_type) (= 1.0 insurance_type)))))
  (= relevant_insurance_type_correct a!1)))

; [insurance:guarantee_minimum_amount_set_by_authority] 保證金及相關保險最低金額由主管機關依經營及執行業務範圍及規模定之
(assert (= guarantee_minimum_amount_set_by_authority
   guarantee_minimum_amount_defined_by_authority))

; [insurance:management_rules_defined_by_authority] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= management_rules_defined_by_authority management_rules_defined))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_operate_agent_or_broker
   (and bank_permitted
        (or (= bank_operate_agent 1.0) (= bank_operate_broker 1.0)))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (let ((a!1 (and broker_provide_written_report
                (or (not (= broker_charge_fee 1.0))
                    (= broker_disclose_fee_standard 1.0)))))
  (= broker_provide_written_report_and_disclose_fee a!1)))

; [insurance:violate_management_or_broker_rules] 違反管理規則中財務或業務管理規定、保險經紀人義務或相關準用規定
(assert (= violate_management_or_broker_rules
   (or violate_broker_duties
       violate_related_provisions
       violate_business_management_rules
       violate_financial_management_rules)))

; [insurance:correction_or_penalty_required] 違反規定者應限期改正或處罰鍰，情節重大者廢止許可並註銷執業證照
(assert (= correction_or_penalty_required
   (or (not violate_management_or_broker_rules)
       license_revoked
       penalty_imposed
       correction_ordered)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則財務或業務管理規定、保險經紀人義務或相關準用規定時處罰
(assert (= penalty
   (or violate_broker_duties
       violate_related_provisions
       violate_business_management_rules
       violate_financial_management_rules)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_type 1.0))
(assert (= bank_operate_agent 1.0))
(assert (= bank_operate_broker 0.0))
(assert (= bank_permitted true))
(assert (= broker_charge_fee 1.0))
(assert (= broker_disclose_fee_standard 0.0))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_fulfill_fidelity false))
(assert (= broker_provide_written_report false))
(assert (= correction_or_penalty_required true))
(assert (= correction_ordered true))
(assert (= guarantee_deposit_amount 0.0))
(assert (= guarantee_minimum_amount 0.0))
(assert (= guarantee_minimum_amount_defined_by_authority true))
(assert (= guarantee_minimum_amount_set_by_authority true))
(assert (= insurance_type 1.0))
(assert (= license_and_guarantee_required false))
(assert (= license_permitted false))
(assert (= license_revoked false))
(assert (= management_rules_defined true))
(assert (= management_rules_defined_by_authority true))
(assert (= penalty true))
(assert (= penalty_imposed true))
(assert (= practice_certificate_held false))
(assert (= relevant_insurance_purchased false))
(assert (= relevant_insurance_type_correct true))
(assert (= violate_broker_duties true))
(assert (= violate_business_management_rules false))
(assert (= violate_financial_management_rules false))
(assert (= violate_management_or_broker_rules true))
(assert (= violate_related_provisions true))
(assert (= bank_permitted_to_operate_agent_or_broker false))
(assert (= broker_provide_written_report_and_disclose_fee false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 34
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
