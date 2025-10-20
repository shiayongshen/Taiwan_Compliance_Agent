; SMT2 file generated from compliance case automatic
; Case ID: case_394
; Generated at: 2025-10-19T14:45:36.204716
;
; This file can be executed with Z3:
;   z3 case_394.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_and_guarantee Bool)
(declare-const applicability_of_agent_broker_rules Bool)
(declare-const bank_engage_agent Bool)
(declare-const bank_engage_broker Bool)
(declare-const bank_permission_and_applicability Bool)
(declare-const bank_permission_granted Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_must_disclose_fee_standard Bool)
(declare-const broker_must_provide_written_report Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const guarantee Bool)
(declare-const guarantee_deposited Bool)
(declare-const insurance_type Int)
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
(declare-const related_insurance_type Int)
(declare-const within_authority_specified_scope Bool)
(declare-const written_analysis_report_provided Bool)

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
(assert (let ((a!1 (and is_broker
                (or (= insurance_type (ite liability 1 0))
                    (= insurance_type (ite guarantee 1 0))))))
(let ((a!2 (or (and is_agent (= insurance_type (ite liability 1 0)))
               (and is_notary (= insurance_type (ite liability 1 0)))
               a!1)))
  (= related_insurance_type (ite a!2 1 0)))))

; [insurance:minimum_amount_and_implementation] 繳存保證金及投保相關保險之最低金額及實施方式由主管機關依經營及執行業務範圍及規模定之
(assert (= minimum_amount_and_implementation
   minimum_amount_and_implementation_set_by_authority))

; [insurance:qualification_and_management_rules] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= qualification_and_management_rules management_rules_set_by_authority))

; [insurance:bank_permission_and_applicability] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_applicability
   (and bank_permission_granted
        (or bank_engage_agent bank_engage_broker)
        applicability_of_agent_broker_rules)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity)))

; [insurance:broker_must_provide_written_report] 保險經紀人於主管機關指定範圍內洽訂契約前，應主動提供書面分析報告
(assert (= broker_must_provide_written_report
   (or (not within_authority_specified_scope) written_analysis_report_provided)))

; [insurance:broker_must_disclose_fee_standard] 保險經紀人向要保人或被保險人收取報酬者，應明確告知報酬收取標準
(assert (= broker_must_disclose_fee_standard
   (or (not broker_charge_fee) fee_standard_disclosed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照、未依規定提供書面報告或未明確告知報酬標準時處罰
(assert (= penalty
   (or (not guarantee_deposited)
       (not license_permitted)
       (and broker_charge_fee (not fee_standard_disclosed))
       (not related_insurance_purchased)
       (and within_authority_specified_scope
            (not written_analysis_report_provided))
       (not practice_certificate_held))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= guarantee_deposited false))
(assert (= related_insurance_purchased false))
(assert (= practice_certificate_held false))
(assert (= agent_license_and_guarantee false))
(assert (= applicability_of_agent_broker_rules false))
(assert (= bank_engage_agent false))
(assert (= bank_engage_broker false))
(assert (= bank_permission_and_applicability false))
(assert (= bank_permission_granted false))
(assert (= broker_charge_fee false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_fulfill_fidelity false))
(assert (= broker_must_disclose_fee_standard false))
(assert (= broker_must_provide_written_report false))
(assert (= fee_standard_disclosed false))
(assert (= guarantee false))
(assert (= is_agent false))
(assert (= is_broker true))
(assert (= is_notary false))
(assert (= liability false))
(assert (= management_rules_set_by_authority false))
(assert (= minimum_amount_and_implementation false))
(assert (= minimum_amount_and_implementation_set_by_authority false))
(assert (= penalty true))
(assert (= qualification_and_management_rules false))
(assert (= related_insurance_type 0))
(assert (= within_authority_specified_scope false))
(assert (= written_analysis_report_provided false))
(assert (= insurance_type 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 31
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
