; SMT2 file generated from compliance case automatic
; Case ID: case_63
; Generated at: 2025-10-21T21:47:19.044215
;
; This file can be executed with Z3:
;   z3 case_63.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_or_notary Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permit_granted Bool)
(declare-const bank_permitted_to_operate Bool)
(declare-const broker Bool)
(declare-const broker_charge_fee Real)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity_duty Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_report_and_fee_disclosure_ok Bool)
(declare-const correction_or_penalty_required Bool)
(declare-const guarantee Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_minimum_amount Real)
(declare-const guarantee_minimum_amount_set_by_authority Bool)
(declare-const insurance_type Int)
(declare-const liability Bool)
(declare-const license_and_guarantee_required Bool)
(declare-const license_permitted Bool)
(declare-const management_rules_defined_by_authority Bool)
(declare-const management_rules_set Bool)
(declare-const minimum_guarantee_amount_set Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const relevant_insurance_subscribed Bool)
(declare-const relevant_insurance_type_ok Bool)
(declare-const violate_165_1_or_163_5_rule Bool)
(declare-const violate_broker_duty_rule Bool)
(declare-const violate_financial_or_business_management_rule Bool)
(declare-const violation_165_1_or_163_5 Bool)
(declare-const violation_broker_duty Bool)
(declare-const violation_financial_or_business_management Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_required] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_required
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        relevant_insurance_subscribed
        practice_certificate_held)))

; [insurance:relevant_insurance_type] 相關保險種類依身份區分：保險代理人、公證人為責任保險；保險經紀人為責任保險及保證保險
(assert (let ((a!1 (and broker
                (or (= insurance_type (ite guarantee 1 0))
                    (= insurance_type (ite liability 1 0))))))
(let ((a!2 (or (and agent_or_notary (= insurance_type (ite liability 1 0))) a!1)))
  (= relevant_insurance_type_ok a!2))))

; [insurance:minimum_guarantee_amount_set] 主管機關依經營業務範圍及規模定最低繳存保證金及投保相關保險金額及實施方式
(assert (= minimum_guarantee_amount_set guarantee_minimum_amount_set_by_authority))

; [insurance:management_rules_set] 主管機關定保險代理人、經紀人、公證人資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則
(assert (= management_rules_set management_rules_defined_by_authority))

; [insurance:bank_permitted_to_operate] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_operate
   (and bank_permit_granted (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity_duty)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人洽訂保險契約前，於主管機關指定範圍內主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (let ((a!1 (and broker_provide_written_report
                (or broker_disclose_fee_standard
                    (not (= broker_charge_fee 1.0))))))
  (= broker_report_and_fee_disclosure_ok a!1)))

; [insurance:violation_financial_or_business_management] 違反第163條第4項管理規則中財務或業務管理規定
(assert (= violation_financial_or_business_management
   violate_financial_or_business_management_rule))

; [insurance:violation_broker_duty] 違反第163條第7項規定
(assert (= violation_broker_duty violate_broker_duty_rule))

; [insurance:violation_165_1_or_163_5] 違反第165條第1項或第163條第5項準用規定
(assert (= violation_165_1_or_163_5 violate_165_1_or_163_5_rule))

; [insurance:correction_or_penalty] 違反相關規定應限期改正或處罰罰鍰，情節重大者廢止許可並註銷執業證照
(assert (= correction_or_penalty_required
   (or violation_165_1_or_163_5
       violation_broker_duty
       violation_financial_or_business_management)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第163條第4項財務或業務管理規定、第163條第7項規定，或違反第165條第1項或第163條第5項準用規定時處罰
(assert (= penalty
   (or violation_165_1_or_163_5
       violation_broker_duty
       violation_financial_or_business_management)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_or_notary true))
(assert (= broker false))
(assert (= license_permitted true))
(assert (= guarantee_deposit_amount 500000))
(assert (= guarantee_minimum_amount 500000))
(assert (= relevant_insurance_subscribed true))
(assert (= practice_certificate_held true))
(assert (= management_rules_defined_by_authority true))
(assert (= management_rules_set true))
(assert (= guarantee_minimum_amount_set_by_authority true))
(assert (= violate_financial_or_business_management_rule true))
(assert (= violation_financial_or_business_management true))
(assert (= violate_broker_duty_rule false))
(assert (= violation_broker_duty false))
(assert (= violate_165_1_or_163_5_rule false))
(assert (= violation_165_1_or_163_5 false))
(assert (= penalty true))
(assert (= broker_charge_fee 0.0))
(assert (= broker_disclose_fee_standard false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_fulfill_fidelity_duty false))
(assert (= broker_provide_written_report false))
(assert (= broker_report_and_fee_disclosure_ok false))
(assert (= bank_permit_granted false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= bank_permitted_to_operate false))
(assert (= insurance_type 0))
(assert (= liability true))
(assert (= relevant_insurance_type_ok true))
(assert (= license_and_guarantee_required true))
(assert (= correction_or_penalty_required true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 35
; Total facts: 32
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
