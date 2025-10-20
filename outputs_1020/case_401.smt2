; SMT2 file generated from compliance case automatic
; Case ID: case_401
; Generated at: 2025-10-19T14:55:39.141957
;
; This file can be executed with Z3:
;   z3 case_401.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_and_guarantee Bool)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permission_and_applicability Bool)
(declare-const bank_permission_granted Bool)
(declare-const broker_charge_fee Real)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duties Bool)
(declare-const broker_exercise_due_diligence Bool)
(declare-const broker_fulfill_fiduciary_duty Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_report_and_fee_disclosure Bool)
(declare-const guarantee_deposited Bool)
(declare-const insurance_type Int)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const liability Real)
(declare-const liability_or_guarantee Real)
(declare-const license_permitted Bool)
(declare-const management_rules_set_by_authority Bool)
(declare-const minimum_amount_and_implementation Real)
(declare-const minimum_amount_and_implementation_set_by_authority Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const qualification_and_management_rules Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type Int)
(declare-const relevant_regulations_applied Bool)

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
(assert (let ((a!1 (or (and (not is_agent)
                    (not is_broker)
                    is_notary
                    (= (to_real insurance_type) liability))
               (and is_agent
                    (not is_broker)
                    (not is_notary)
                    (= (to_real insurance_type) liability))
               (and (not is_agent)
                    is_broker
                    (= (to_real insurance_type) liability_or_guarantee)))))
  (= related_insurance_type (ite a!1 1 0))))

; [insurance:minimum_amount_and_implementation] 繳存保證金及投保相關保險之最低金額及實施方式由主管機關依經營及執行業務範圍及規模定之
(assert (= minimum_amount_and_implementation
   (ite minimum_amount_and_implementation_set_by_authority 1.0 0.0)))

; [insurance:qualification_and_management_rules] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= qualification_and_management_rules management_rules_set_by_authority))

; [insurance:bank_permission_and_applicability] 銀行得經主管機關許可擇一兼營保險代理人或經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_applicability
   (and bank_permission_granted
        (or bank_operate_agent bank_operate_broker)
        relevant_regulations_applied)))

; [insurance:broker_duties] 保險經紀人應以善良管理人注意義務洽訂保險契約或提供服務，並負忠實義務
(assert (= broker_duties
   (and broker_exercise_due_diligence broker_fulfill_fiduciary_duty)))

; [insurance:broker_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂契約前應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (let ((a!1 (and broker_provide_written_report
                (or broker_disclose_fee_standard
                    (not (= broker_charge_fee 1.0))))))
  (= broker_report_and_fee_disclosure a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照、未依規定提供書面報告或未明確告知報酬標準時處罰
(assert (= penalty
   (or (and (= broker_charge_fee 1.0) (not broker_disclose_fee_standard))
       (not broker_provide_written_report)
       (not guarantee_deposited)
       (not related_insurance_purchased)
       (not license_permitted)
       (not practice_certificate_held))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= guarantee_deposited false))
(assert (= practice_certificate_held false))
(assert (= related_insurance_purchased false))
(assert (= agent_license_and_guarantee false))
(assert (= is_agent false))
(assert (= is_broker true))
(assert (= is_notary false))
(assert (= broker_provide_written_report true))
(assert (= broker_charge_fee 0.0))
(assert (= broker_disclose_fee_standard true))
(assert (= broker_exercise_due_diligence true))
(assert (= broker_fulfill_fiduciary_duty true))
(assert (= broker_duties true))
(assert (= minimum_amount_and_implementation_set_by_authority true))
(assert (= management_rules_set_by_authority true))
(assert (= bank_permission_granted false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= bank_permission_and_applicability false))
(assert (= qualification_and_management_rules true))
(assert (= relevant_regulations_applied false))
(assert (= broker_report_and_fee_disclosure false))
(assert (= insurance_type 0))
(assert (= liability 0.0))
(assert (= liability_or_guarantee 0.0))
(assert (= minimum_amount_and_implementation 0.0))
(assert (= penalty false))
(assert (= related_insurance_type 0))

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
