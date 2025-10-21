; SMT2 file generated from compliance case automatic
; Case ID: case_89
; Generated at: 2025-10-21T01:23:11.141153
;
; This file can be executed with Z3:
;   z3 case_89.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_notary_license_and_guarantee Bool)
(declare-const application_date_after_or_equal_2021_03_03 Bool)
(declare-const application_date_before_2017_06_24 Bool)
(declare-const apply_insurance_broker Bool)
(declare-const apply_reinsurance Bool)
(declare-const bank_license_permitted Bool)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permitted_to_operate_agent_or_broker Bool)
(declare-const broker_capital_adjustment_compliance Bool)
(declare-const broker_capital_adjustment_deadline Int)
(declare-const broker_capital_amount_compliance Bool)
(declare-const broker_capital_and_adjustment_compliance Bool)
(declare-const broker_capital_and_management_compliance Bool)
(declare-const broker_capital_minimum_amount Real)
(declare-const broker_cash_contribution_only Bool)
(declare-const broker_charge_fee Real)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_paid_in_capital Real)
(declare-const broker_provide_written_report Bool)
(declare-const broker_provide_written_report_and_disclose_fee Bool)
(declare-const capital_minimum_amount Real)
(declare-const contribution_cash_only Bool)
(declare-const days_since_transfer Int)
(declare-const equity_or_capital_transfer_ratio Real)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_minimum_amount Real)
(declare-const guarantee_minimum_amount_set_by_authority Bool)
(declare-const insurance_type_guarantee Bool)
(declare-const insurance_type_responsibility Bool)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const license_held Bool)
(declare-const license_permitted Bool)
(declare-const management_rules_set_by_authority Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const qualification_and_management_rules Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const relevant_insurance_type Bool)
(declare-const transfer_due_to_inheritance Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_notary_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= agent_broker_notary_license_and_guarantee
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        relevant_insurance_covered
        practice_certificate_held)))

; [insurance:relevant_insurance_type] 相關保險類型依身份區分：保險代理人、公證人為責任保險；保險經紀人為責任保險及保證保險
(assert (= relevant_insurance_type
   (or (and is_agent insurance_type_responsibility)
       (and is_notary insurance_type_responsibility)
       (and is_broker insurance_type_responsibility insurance_type_guarantee))))

; [insurance:capital_minimum_amount] 保證金及相關保險最低金額由主管機關依經營業務範圍及規模定之
(assert (= capital_minimum_amount
   (ite guarantee_minimum_amount_set_by_authority 1.0 0.0)))

; [insurance:qualification_and_management_rules] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= qualification_and_management_rules management_rules_set_by_authority))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_operate_agent_or_broker
   (and bank_license_permitted (or bank_operate_agent bank_operate_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人洽訂契約前應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (let ((a!1 (and broker_provide_written_report
                (or broker_disclose_fee_standard
                    (not (= broker_charge_fee 1.0))))))
  (= broker_provide_written_report_and_disclose_fee a!1)))

; [insurance:broker_capital_minimum_amount] 經紀人公司最低實收資本額依申請業務類型及時點規定
(assert (let ((a!1 (ite (or (and application_date_after_or_equal_2021_03_03
                         apply_reinsurance
                         (not apply_insurance_broker))
                    (and application_date_after_or_equal_2021_03_03
                         (not apply_reinsurance)
                         apply_insurance_broker))
                20000000
                (ite (and application_date_after_or_equal_2021_03_03
                          apply_reinsurance
                          apply_insurance_broker)
                     30000000
                     0))))
(let ((a!2 (ite (or (and application_date_before_2017_06_24
                         apply_reinsurance
                         (not apply_insurance_broker))
                    (and application_date_before_2017_06_24
                         apply_reinsurance
                         apply_insurance_broker))
                10000000
                a!1)))
(let ((a!3 (to_real (ite (and application_date_before_2017_06_24
                              (not apply_reinsurance)
                              apply_insurance_broker)
                         5000000
                         a!2))))
  (= broker_capital_minimum_amount a!3)))))

; [insurance:broker_capital_adjustment_deadline] 已領執業證照經紀人公司於股權或資本總額移轉達50%以上時，應於交割日次日起6個月內完成資本額調整，繼承不在此限
(assert (let ((a!1 (or (not (and license_held
                         (<= 50.0 equity_or_capital_transfer_ratio)))
               (and (>= 180 days_since_transfer)
                    (not transfer_due_to_inheritance)))))
  (= broker_capital_adjustment_deadline (ite a!1 1 0))))

; [insurance:broker_capital_amount_compliance] 經紀人公司實收資本額應不低於最低規定金額
(assert (= broker_capital_amount_compliance
   (>= broker_paid_in_capital broker_capital_minimum_amount)))

; [insurance:broker_capital_adjustment_compliance] 經紀人公司於資本額調整期限內完成調整
(assert (let ((a!1 (or (not (and license_held
                         (<= 50.0 equity_or_capital_transfer_ratio)))
               (>= 180 days_since_transfer)
               transfer_due_to_inheritance)))
  (= broker_capital_adjustment_compliance a!1)))

; [insurance:broker_capital_and_adjustment_compliance] 經紀人公司資本額及調整期限均符合規定
(assert (= broker_capital_and_adjustment_compliance
   (and broker_capital_amount_compliance broker_capital_adjustment_compliance)))

; [insurance:broker_capital_and_management_compliance] 經紀人公司符合資本額及主管機關管理規則要求
(assert (= broker_capital_and_management_compliance
   (and broker_capital_and_adjustment_compliance
        qualification_and_management_rules)))

; [insurance:broker_cash_contribution_only] 經紀人公司發起人及股東出資以現金為限
(assert (= broker_cash_contribution_only contribution_cash_only))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險、執業證照、資本額、資本調整期限、管理規則或出資現金限制時處罰
(assert (= penalty
   (or (not agent_broker_notary_license_and_guarantee)
       (not broker_cash_contribution_only)
       (not qualification_and_management_rules)
       (not broker_capital_adjustment_compliance)
       (not broker_capital_amount_compliance)
       (not relevant_insurance_type))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= application_date_before_2017_06_24 true))
(assert (= application_date_after_or_equal_2021_03_03 false))
(assert (= apply_insurance_broker true))
(assert (= apply_reinsurance false))
(assert (= license_held true))
(assert (= license_permitted true))
(assert (= practice_certificate_held true))
(assert (= is_broker true))
(assert (= is_agent false))
(assert (= is_notary false))
(assert (= guarantee_minimum_amount_set_by_authority true))
(assert (= guarantee_minimum_amount 100000))
(assert (= guarantee_deposit_amount 100000))
(assert (= relevant_insurance_covered true))
(assert (= insurance_type_responsibility true))
(assert (= insurance_type_guarantee true))
(assert (= broker_paid_in_capital 3000000))
(assert (= broker_capital_minimum_amount 5000000))
(assert (= broker_capital_amount_compliance false))
(assert (= equity_or_capital_transfer_ratio 0))
(assert (= days_since_transfer 0))
(assert (= transfer_due_to_inheritance false))
(assert (= broker_capital_adjustment_compliance true))
(assert (= qualification_and_management_rules true))
(assert (= contribution_cash_only true))
(assert (= broker_cash_contribution_only true))
(assert (= agent_broker_notary_license_and_guarantee true))
(assert (= relevant_insurance_type true))
(assert (= broker_capital_and_adjustment_compliance false))
(assert (= broker_capital_and_management_compliance false))
(assert (= broker_charge_fee 0))
(assert (= broker_disclose_fee_standard true))
(assert (= broker_provide_written_report true))
(assert (= broker_provide_written_report_and_disclose_fee true))
(assert (= broker_exercise_duty_of_care true))
(assert (= broker_fulfill_fidelity true))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= bank_license_permitted false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= bank_permitted_to_operate_agent_or_broker false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 45
; Total facts: 42
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
