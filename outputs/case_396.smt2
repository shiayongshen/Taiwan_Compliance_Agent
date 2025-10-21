; SMT2 file generated from compliance case automatic
; Case ID: case_396
; Generated at: 2025-10-21T08:44:46.069776
;
; This file can be executed with Z3:
;   z3 case_396.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_type Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permitted_by_authority Bool)
(declare-const duty_of_care_and_fidelity Bool)
(declare-const duty_of_care_observed Bool)
(declare-const duty_of_fidelity_observed Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosed_clearly Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const insurance_agent_or_broker_permitted Bool)
(declare-const insurance_type Bool)
(declare-const license_and_guarantee_required Bool)
(declare-const license_permitted Bool)
(declare-const management_rules_set_by_authority Bool)
(declare-const minimum_amount_and_implementation Bool)
(declare-const minimum_amount_and_implementation_set_by_authority Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const qualification_and_management_rules Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type Bool)
(declare-const written_report_and_fee_disclosure Bool)
(declare-const written_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_agent:license_and_guarantee_required] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_required
   (and license_permitted
        guarantee_deposit_paid
        related_insurance_purchased
        practice_certificate_held)))

; [insurance_agent:related_insurance_type] 相關保險種類依身份區分：保險代理人、公證人為責任保險；保險經紀人為責任保險及保證保險
(assert (= related_insurance_type (and agent_type insurance_type)))

; [insurance_agent:minimum_amount_and_implementation] 繳存保證金及投保相關保險之最低金額及實施方式由主管機關依經營及執行業務範圍及規模定之
(assert (= minimum_amount_and_implementation
   minimum_amount_and_implementation_set_by_authority))

; [insurance_agent:qualification_and_management_rules] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= qualification_and_management_rules management_rules_set_by_authority))

; [bank:insurance_agent_or_broker_permitted] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= insurance_agent_or_broker_permitted
   (and bank_permitted_by_authority
        (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance_broker:duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約或提供服務，並負忠實義務
(assert (= duty_of_care_and_fidelity
   (and duty_of_care_observed duty_of_fidelity_observed)))

; [insurance_broker:written_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，向要保人或被保險人收取報酬者應明確告知報酬標準
(assert (= written_report_and_fee_disclosure
   (and written_report_provided (or (not fee_charged) fee_disclosed_clearly))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照或違反書面報告及報酬告知義務時處罰
(assert (= penalty
   (or (not related_insurance_purchased)
       (not practice_certificate_held)
       (not written_report_provided)
       (not license_permitted)
       (and fee_charged (not fee_disclosed_clearly))
       (not guarantee_deposit_paid))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted true))
(assert (= guarantee_deposit_paid false))
(assert (= related_insurance_purchased true))
(assert (= practice_certificate_held true))
(assert (= agent_type true))
(assert (= management_rules_set_by_authority true))
(assert (= minimum_amount_and_implementation_set_by_authority true))
(assert (= written_report_provided true))
(assert (= fee_charged false))
(assert (= fee_disclosed_clearly true))
(assert (= duty_of_care_observed true))
(assert (= duty_of_fidelity_observed true))
(assert (= bank_permitted_by_authority false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 24
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
