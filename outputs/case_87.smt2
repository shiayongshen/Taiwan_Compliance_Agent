; SMT2 file generated from compliance case automatic
; Case ID: case_87
; Generated at: 2025-10-21T21:56:15.480262
;
; This file can be executed with Z3:
;   z3 case_87.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_notary_license_and_insurance_ok Bool)
(declare-const application_date_after_110_03_03 Bool)
(declare-const bank_engage_agent Bool)
(declare-const bank_engage_broker Bool)
(declare-const bank_follow_agent_broker_regulations Bool)
(declare-const bank_license_permitted Bool)
(declare-const bank_permitted_to_engage_agent_or_broker Bool)
(declare-const broker_capital_adjustment_compliance Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_contribution_cash_only Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity_duty Bool)
(declare-const broker_minimum_capital_requirement Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_provide_written_report_and_disclose_fee Bool)
(declare-const business_type_insurance_broker Bool)
(declare-const business_type_reinsurance_broker Bool)
(declare-const capital_adjusted_within_6_months Bool)
(declare-const capital_minimum_amount_and_implementation_ok Bool)
(declare-const capital_minimum_amount_compliance Bool)
(declare-const contribution_is_cash_only Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const insurance_type_guarantee Bool)
(declare-const insurance_type_responsibility Bool)
(declare-const is_agent Bool)
(declare-const is_notary Bool)
(declare-const license_held Bool)
(declare-const license_permitted Bool)
(declare-const management_rules_compliance Bool)
(declare-const management_rules_followed Bool)
(declare-const minor_offense_no_penalty Bool)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const penalty_imposed Bool)
(declare-const penalty_imposed_for_violation Bool)
(declare-const penalty_repeat_offense Bool)
(declare-const practice_certificate_held Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_ok Bool)
(declare-const repeat_penalty_imposed Bool)
(declare-const share_or_capital_transfer_ratio Real)
(declare-const transfer_due_to_inheritance Bool)
(declare-const violate_financial_or_business_management_rules Bool)
(declare-const violation_financial_or_business_management_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_notary_license_and_insurance_ok] 保險代理人、經紀人、公證人經主管機關許可，繳存保證金並投保相關保險，且領有執業證照
(assert (= agent_broker_notary_license_and_insurance_ok
   (and license_permitted
        guarantee_deposit_paid
        related_insurance_purchased
        practice_certificate_held)))

; [insurance:related_insurance_type_ok] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= related_insurance_type_ok
   (or (and is_agent
            (not is_notary)
            insurance_type_responsibility
            (not insurance_type_guarantee))
       (and (not is_agent)
            is_notary
            insurance_type_responsibility
            (not insurance_type_guarantee))
       (and (not is_agent)
            (not is_notary)
            insurance_type_responsibility
            insurance_type_guarantee))))

; [insurance:capital_minimum_amount_compliance] 繳存保證金及投保相關保險之最低金額及實施方式符合主管機關規定
(assert (= capital_minimum_amount_compliance
   capital_minimum_amount_and_implementation_ok))

; [insurance:management_rules_compliance] 符合主管機關定之資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務與業務管理、教育訓練、廢止許可及其他管理規則
(assert (= management_rules_compliance management_rules_followed))

; [insurance:bank_permitted_to_engage_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_engage_agent_or_broker
   (and bank_license_permitted
        (or bank_engage_agent bank_engage_broker)
        bank_follow_agent_broker_regulations)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity_duty)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (= broker_provide_written_report_and_disclose_fee
   (and broker_provide_written_report
        (or (not broker_charge_fee) broker_disclose_fee_standard))))

; [insurance:broker_minimum_capital_requirement] 經紀人公司最低實收資本額符合規定
(assert (let ((a!1 (and (not (and (not application_date_after_110_03_03)
                          (not business_type_insurance_broker)
                          business_type_reinsurance_broker))
                (not application_date_after_110_03_03)
                business_type_insurance_broker
                business_type_reinsurance_broker
                (<= 10000000.0 paid_in_capital))))
(let ((a!2 (and (not (and (not application_date_after_110_03_03)
                          business_type_insurance_broker
                          (not business_type_reinsurance_broker)))
                (or (and (not application_date_after_110_03_03)
                         (not business_type_insurance_broker)
                         business_type_reinsurance_broker
                         (<= 10000000.0 paid_in_capital))
                    a!1))))
(let ((a!3 (and (not (and application_date_after_110_03_03
                          business_type_insurance_broker
                          business_type_reinsurance_broker))
                (or a!2
                    (and (not application_date_after_110_03_03)
                         business_type_insurance_broker
                         (not business_type_reinsurance_broker)
                         (<= 5000000.0 paid_in_capital))))))
(let ((a!4 (and (not (and application_date_after_110_03_03
                          (not business_type_insurance_broker)
                          business_type_reinsurance_broker))
                (or a!3
                    (and application_date_after_110_03_03
                         business_type_insurance_broker
                         business_type_reinsurance_broker
                         (<= 30000000.0 paid_in_capital))))))
(let ((a!5 (and (not (and application_date_after_110_03_03
                          business_type_insurance_broker
                          (not business_type_reinsurance_broker)))
                (or (and application_date_after_110_03_03
                         (not business_type_insurance_broker)
                         business_type_reinsurance_broker
                         (<= 20000000.0 paid_in_capital))
                    a!4))))
(let ((a!6 (not (or a!5
                    (and application_date_after_110_03_03
                         business_type_insurance_broker
                         (not business_type_reinsurance_broker)
                         (<= 20000000.0 paid_in_capital))))))
  (and (or (not broker_minimum_capital_requirement)
           a!5
           (and application_date_after_110_03_03
                business_type_insurance_broker
                (not business_type_reinsurance_broker)
                (<= 20000000.0 paid_in_capital)))
       (or a!6 broker_minimum_capital_requirement)))))))))

; [insurance:broker_capital_adjustment_compliance] 已領有執業證照之經紀人公司於股權或資本總額移轉累計達50%以上時，於六個月內完成資本額調整（股東繼承除外）
(assert (let ((a!1 (or capital_adjusted_within_6_months
               (not (and license_held
                         (<= 50.0 share_or_capital_transfer_ratio)
                         (not transfer_due_to_inheritance))))))
  (= broker_capital_adjustment_compliance a!1)))

; [insurance:broker_contribution_cash_only] 經紀人公司發起人及股東出資以現金為限
(assert (= broker_contribution_cash_only contribution_is_cash_only))

; [insurance:violation_financial_or_business_management_rules] 違反第163條第四項管理規則中財務或業務管理規定、163條第七項規定，或165條第一項及163條第五項準用規定
(assert (= violation_financial_or_business_management_rules
   violate_financial_or_business_management_rules))

; [insurance:penalty_imposed_for_violation] 違反相關規定應限期改正或處罰，情節重大者廢止許可並註銷執業證照
(assert (= penalty_imposed_for_violation penalty_imposed))

; [insurance:penalty_repeat_offense] 經處罰後於限期內仍不改正者，主管機關得按次處罰；情節輕微者得免處罰
(assert (= penalty_repeat_offense (or minor_offense_no_penalty repeat_penalty_imposed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領有執業證照，或違反管理規則中財務或業務管理規定，且未限期改正時處罰
(assert (= penalty
   (or (not agent_broker_notary_license_and_insurance_ok)
       (not management_rules_compliance)
       (and violation_financial_or_business_management_rules
            (not penalty_imposed_for_violation)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted true))
(assert (= guarantee_deposit_paid true))
(assert (= related_insurance_purchased true))
(assert (= practice_certificate_held true))
(assert (= application_date_after_110_03_03 false))
(assert (= business_type_insurance_broker true))
(assert (= business_type_reinsurance_broker false))
(assert (= paid_in_capital 3000000))
(assert (= agent_broker_notary_license_and_insurance_ok true))
(assert (= capital_minimum_amount_and_implementation_ok false))
(assert (= capital_minimum_amount_compliance false))
(assert (= management_rules_followed false))
(assert (= management_rules_compliance false))
(assert (= violate_financial_or_business_management_rules true))
(assert (= violation_financial_or_business_management_rules true))
(assert (= penalty_imposed true))
(assert (= penalty_imposed_for_violation true))
(assert (= penalty_repeat_offense false))
(assert (= repeat_penalty_imposed false))
(assert (= minor_offense_no_penalty false))
(assert (= broker_minimum_capital_requirement false))
(assert (= license_held true))
(assert (= broker_capital_adjustment_compliance false))
(assert (= share_or_capital_transfer_ratio 0.0))
(assert (= transfer_due_to_inheritance false))
(assert (= broker_contribution_cash_only true))
(assert (= broker_charge_fee false))
(assert (= broker_disclose_fee_standard false))
(assert (= broker_provide_written_report false))
(assert (= broker_provide_written_report_and_disclose_fee false))
(assert (= broker_exercise_duty_of_care true))
(assert (= broker_fulfill_fidelity_duty true))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= is_agent false))
(assert (= is_notary false))
(assert (= insurance_type_responsibility true))
(assert (= insurance_type_guarantee true))
(assert (= related_insurance_type_ok true))
(assert (= bank_license_permitted false))
(assert (= bank_engage_agent false))
(assert (= bank_engage_broker false))
(assert (= bank_follow_agent_broker_regulations false))
(assert (= bank_permitted_to_engage_agent_or_broker false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 46
; Total facts: 43
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
