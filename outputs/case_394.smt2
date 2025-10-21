; SMT2 file generated from compliance case automatic
; Case ID: case_394
; Generated at: 2025-10-21T08:43:27.400410
;
; This file can be executed with Z3:
;   z3 case_394.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_type Int)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permit_obtained Bool)
(declare-const deposit_guarantee_fund Bool)
(declare-const duty_of_care_and_fidelity Bool)
(declare-const duty_of_care_observed Bool)
(declare-const duty_of_fidelity_observed Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosure_made Bool)
(declare-const guarantee_insurance_subscribed Bool)
(declare-const insurance_agent_or_broker_permit Bool)
(declare-const insurance_subscribed Bool)
(declare-const insurance_type_requirement Bool)
(declare-const liability_insurance_subscribed Bool)
(declare-const license_and_insurance_compliance Bool)
(declare-const license_issued Bool)
(declare-const license_permitted Bool)
(declare-const minimum_amount_and_implementation Bool)
(declare-const minimum_amount_and_implementation_defined Bool)
(declare-const penalty Bool)
(declare-const qualification_and_management_rules Bool)
(declare-const qualification_and_management_rules_defined Bool)
(declare-const written_report_and_fee_disclosure Bool)
(declare-const written_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_agent:license_and_insurance_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_insurance_compliance
   (and license_permitted
        deposit_guarantee_fund
        insurance_subscribed
        license_issued)))

; [insurance_agent:insurance_type_requirement] 保險代理人、公證人須投保責任保險；保險經紀人須投保責任保險及保證保險
(assert (= insurance_type_requirement
   (or (and (= 2 agent_type)
            liability_insurance_subscribed
            guarantee_insurance_subscribed)
       (and (= 3 agent_type) liability_insurance_subscribed)
       (and (= 1 agent_type) liability_insurance_subscribed))))

; [insurance_agent:minimum_amount_and_implementation] 繳存保證金及投保相關保險之最低金額及實施方式由主管機關定之
(assert (= minimum_amount_and_implementation minimum_amount_and_implementation_defined))

; [insurance_agent:qualification_and_management_rules] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= qualification_and_management_rules
   qualification_and_management_rules_defined))

; [bank:insurance_agent_or_broker_permit] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= insurance_agent_or_broker_permit
   (and bank_permit_obtained (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance_broker:duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約或提供服務，並負忠實義務
(assert (= duty_of_care_and_fidelity
   (and duty_of_care_observed duty_of_fidelity_observed)))

; [insurance_broker:written_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，向要保人或被保險人收取報酬者，應明確告知報酬標準
(assert (= written_report_and_fee_disclosure
   (and written_report_provided (or (not fee_charged) fee_disclosure_made))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照或保險經紀人未履行善良管理人義務及書面報告義務時處罰
(assert (= penalty
   (or (not license_and_insurance_compliance)
       (not duty_of_care_and_fidelity)
       (not written_report_and_fee_disclosure)
       (not insurance_type_requirement))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_type 2))
(assert (= license_permitted true))
(assert (= license_issued true))
(assert (= deposit_guarantee_fund false))
(assert (= insurance_subscribed false))
(assert (= liability_insurance_subscribed false))
(assert (= guarantee_insurance_subscribed false))
(assert (= duty_of_care_observed true))
(assert (= duty_of_fidelity_observed true))
(assert (= fee_charged false))
(assert (= fee_disclosure_made false))
(assert (= written_report_provided true))
(assert (= bank_permit_obtained false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= minimum_amount_and_implementation_defined true))
(assert (= minimum_amount_and_implementation true))
(assert (= qualification_and_management_rules_defined true))
(assert (= qualification_and_management_rules true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 25
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
