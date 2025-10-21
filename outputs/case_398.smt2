; SMT2 file generated from compliance case automatic
; Case ID: case_398
; Generated at: 2025-10-21T08:46:31.939364
;
; This file can be executed with Z3:
;   z3 case_398.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_notary_license_and_guarantee Bool)
(declare-const authority_define_report_scope_and_fee_standard Bool)
(declare-const authority_defined_minimum_and_implementation Bool)
(declare-const authority_defined_qualification_and_management_rules Bool)
(declare-const authority_defined_report_scope_and_fee_standard Bool)
(declare-const bank_authority_permitted Bool)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permitted_to_operate_agent_or_broker Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_exercise_fidelity Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_provide_written_report_and_disclose_fee Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const liability_and_guarantee_insurance Bool)
(declare-const liability_insurance Bool)
(declare-const license_permitted Bool)
(declare-const minimum_amount_and_implementation Bool)
(declare-const none Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const qualification_and_management_rules Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type Bool)
(declare-const role_agent Bool)
(declare-const role_broker Bool)
(declare-const role_notary Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_notary_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_broker_notary_license_and_guarantee
   (and license_permitted
        guarantee_deposit_paid
        related_insurance_purchased
        practice_certificate_held)))

; [insurance:related_insurance_type] 相關保險種類依身份區分
(assert (= related_insurance_type
   (ite (or role_agent role_notary)
        liability_insurance
        (ite role_broker liability_and_guarantee_insurance none))))

; [insurance:minimum_amount_and_implementation] 繳存保證金及投保相關保險之最低金額及實施方式由主管機關定之
(assert (= minimum_amount_and_implementation
   authority_defined_minimum_and_implementation))

; [insurance:qualification_and_management_rules] 資格取得、申請許可條件、程序、文件及管理規則由主管機關定之
(assert (= qualification_and_management_rules
   authority_defined_qualification_and_management_rules))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_operate_agent_or_broker
   (and bank_authority_permitted (or bank_operate_agent bank_operate_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_exercise_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人洽訂保險契約前，於主管機關指定範圍內，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_provide_written_report_and_disclose_fee
   (and broker_provide_written_report
        (or (not broker_charge_fee) broker_disclose_fee_standard))))

; [insurance:authority_define_report_scope_and_fee_standard] 主管機關定書面分析報告適用範圍、內容及報酬收取標準範圍
(assert (= authority_define_report_scope_and_fee_standard
   authority_defined_report_scope_and_fee_standard))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險或未領執業證照時處罰
(assert (= penalty
   (or (not guarantee_deposit_paid)
       (not related_insurance_purchased)
       (not license_permitted)
       (not practice_certificate_held))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted true))
(assert (= guarantee_deposit_paid false))
(assert (= related_insurance_purchased true))
(assert (= practice_certificate_held true))
(assert (= agent_broker_notary_license_and_guarantee false))
(assert (= role_broker true))
(assert (= related_insurance_type false))
(assert (= authority_defined_minimum_and_implementation true))
(assert (= qualification_and_management_rules true))
(assert (= authority_defined_report_scope_and_fee_standard true))
(assert (= authority_define_report_scope_and_fee_standard true))
(assert (= bank_authority_permitted false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= bank_permitted_to_operate_agent_or_broker false))
(assert (= broker_exercise_duty_of_care true))
(assert (= broker_exercise_fidelity true))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= broker_provide_written_report true))
(assert (= broker_charge_fee false))
(assert (= broker_disclose_fee_standard false))
(assert (= broker_provide_written_report_and_disclose_fee true))
(assert (= minimum_amount_and_implementation true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 30
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
