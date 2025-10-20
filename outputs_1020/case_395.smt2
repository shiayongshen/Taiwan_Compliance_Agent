; SMT2 file generated from compliance case automatic
; Case ID: case_395
; Generated at: 2025-10-19T14:46:58.646928
;
; This file can be executed with Z3:
;   z3 case_395.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_and_guarantee Bool)
(declare-const applicability_of_agent_and_broker_rules Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_and_applicability Bool)
(declare-const bank_permission_granted Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_duties Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_fee_disclosed Bool)
(declare-const broker_fiduciary_duty Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_report_and_fee_disclosure Bool)
(declare-const guarantee Bool)
(declare-const guarantee_deposited Bool)
(declare-const insurance_type Bool)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const liability Bool)
(declare-const license_permitted Bool)
(declare-const management_rules_set_by_authority Bool)
(declare-const minimum_amount_and_implementation Bool)
(declare-const minimum_amount_and_implementation_set_by_authority Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const qualification_and_management_rules Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_license_and_guarantee
   (and license_permitted
        guarantee_deposited
        related_insurance_purchased
        practice_certificate_held)))

; [insurance:related_insurance_type] 相關保險種類依身份區分：代理人、公證人為責任保險；經紀人為責任保險及保證保險
(assert (let ((a!1 (or (and is_agent (= insurance_type liability))
               (and is_notary (= insurance_type liability))
               (and is_broker
                    (or (= insurance_type guarantee)
                        (= insurance_type liability))))))
  (= related_insurance_type a!1)))

; [insurance:minimum_amount_and_implementation] 繳存保證金及投保相關保險之最低金額及實施方式由主管機關依經營及執行業務範圍及規模定之
(assert (= minimum_amount_and_implementation
   minimum_amount_and_implementation_set_by_authority))

; [insurance:qualification_and_management_rules] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= qualification_and_management_rules management_rules_set_by_authority))

; [insurance:bank_permission_and_applicability] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_applicability
   (and bank_permission_granted
        (or bank_operate_as_agent bank_operate_as_broker)
        applicability_of_agent_and_broker_rules)))

; [insurance:broker_duties] 保險經紀人應以善良管理人注意義務洽訂保險契約或提供服務，並負忠實義務
(assert (= broker_duties (and broker_duty_of_care broker_fiduciary_duty)))

; [insurance:broker_report_and_fee_disclosure] 保險經紀人洽訂契約前，於主管機關指定範圍內應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_report_and_fee_disclosure
   (and broker_provide_written_report
        (or (not broker_charge_fee) broker_fee_disclosed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照或保險經紀人未履行善良管理人注意義務及忠實義務，或未提供書面分析報告及報酬告知時處罰
(assert (= penalty
   (or (not broker_duties)
       (and broker_charge_fee (not broker_fee_disclosed))
       (not broker_report_and_fee_disclosure)
       (not agent_license_and_guarantee))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= guarantee_deposited false))
(assert (= related_insurance_purchased false))
(assert (= practice_certificate_held true))
(assert (= is_broker true))
(assert (= insurance_type true))
(assert (= broker_duty_of_care true))
(assert (= broker_fiduciary_duty true))
(assert (= broker_provide_written_report true))
(assert (= broker_charge_fee false))
(assert (= broker_fee_disclosed true))
(assert (= agent_license_and_guarantee false))
(assert (= broker_duties true))
(assert (= broker_report_and_fee_disclosure true))
(assert (= minimum_amount_and_implementation_set_by_authority true))
(assert (= minimum_amount_and_implementation true))
(assert (= management_rules_set_by_authority true))
(assert (= qualification_and_management_rules true))
(assert (= bank_permission_granted false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= bank_permission_and_applicability false))
(assert (= applicability_of_agent_and_broker_rules false))
(assert (= penalty true))
(assert (= is_agent false))
(assert (= is_notary false))
(assert (= related_insurance_type false))
(assert (= guarantee false))
(assert (= liability false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 29
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
