; SMT2 file generated from compliance case automatic
; Case ID: case_87
; Generated at: 2025-10-19T07:38:04.542485
;
; This file can be executed with Z3:
;   z3 case_87.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_notary_license_and_insurance_ok Bool)
(declare-const broker_capital_requirement_ok Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_due_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_provide_written_report_and_disclose_fee Bool)
(declare-const business_type Bool)
(declare-const capital_adjustment_cash_only Bool)
(declare-const capital_adjustment_completed_date Int)
(declare-const capital_adjustment_completed_within_6_months Bool)
(declare-const capital_adjustment_date Int)
(declare-const capital_adjustment_required Bool)
(declare-const capital_adjustment_required_on_share_transfer Bool)
(declare-const capital_contributed_in_cash_only Bool)
(declare-const current_date Int)
(declare-const fee_charged Real)
(declare-const fee_standard_disclosed Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const has_practice_certificate Bool)
(declare-const insurance_type Bool)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const licensed_by_authority Bool)
(declare-const management_rule_compliance Bool)
(declare-const management_rules_followed Bool)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_ok Bool)
(declare-const share_or_capital_transfer_ratio Real)
(declare-const transfer_due_to_inheritance Bool)
(declare-const violate_broker_duty Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_management_or_duty_rules Bool)
(declare-const violate_related_provisions Bool)
(declare-const within_authority_designated_scope Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_notary_license_and_insurance_ok] 保險代理人、經紀人、公證人經主管機關許可，繳存保證金並投保相關保險，且領有執業證照
(assert (= agent_broker_notary_license_and_insurance_ok
   (and licensed_by_authority
        guarantee_deposit_paid
        related_insurance_purchased
        practice_certificate_held)))

; [insurance:related_insurance_type_ok] 相關保險類型符合代理人、公證人責任保險，經紀人責任保險及保證保險規定
(assert (= related_insurance_type_ok
   (or (and is_agent insurance_type)
       (and is_broker insurance_type)
       (and is_notary insurance_type))))

; [insurance:broker_capital_requirement_ok] 經紀人公司最低實收資本額符合規定
(assert (let ((a!1 (or (and (<= 20210303 capital_adjustment_date)
                    business_type
                    (<= 20000000.0 paid_in_capital))
               (and (not (<= 20210303 capital_adjustment_date))
                    business_type
                    (<= 20000000.0 paid_in_capital)))))
  (= broker_capital_requirement_ok a!1)))

; [insurance:capital_adjustment_required] 已領有執業證照之經紀人公司於規定期限內完成資本額調整
(assert (let ((a!1 (not (and has_practice_certificate (not (<= 20190624 current_date))))))
  (= capital_adjustment_required
     (or a!1 (>= 20190624 capital_adjustment_completed_date)))))

; [insurance:capital_adjustment_required_on_share_transfer] 股權或資本總額移轉達50%以上時，於六個月內完成資本額調整（繼承除外）
(assert (let ((a!1 (or capital_adjustment_completed_within_6_months
               (not (and (<= 50.0 share_or_capital_transfer_ratio)
                         (not transfer_due_to_inheritance))))))
  (= capital_adjustment_required_on_share_transfer a!1)))

; [insurance:capital_adjustment_cash_only] 經紀人公司發起人及股東出資以現金為限
(assert (= capital_adjustment_cash_only capital_contributed_in_cash_only))

; [insurance:management_rule_compliance] 遵守主管機關定之管理規則，包括資格取得、申請許可條件、程序、文件、董事監察人資格、解任事由、分支機構條件、財務與業務管理、教育訓練、廢止許可及其他事項
(assert (= management_rule_compliance management_rules_followed))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_due_care broker_fulfill_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂契約前，主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (let ((a!1 (and written_analysis_report_provided
                (or (not (= fee_charged 1.0)) fee_standard_disclosed))))
  (= broker_provide_written_report_and_disclose_fee
     (or (not within_authority_designated_scope) a!1))))

; [insurance:violate_management_or_duty_rules] 違反管理規則中財務或業務管理規定、經紀人善良管理人義務或相關準用規定
(assert (= violate_management_or_duty_rules
   (or violate_broker_duty
       violate_financial_management_rules
       violate_business_management_rules
       violate_related_provisions)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則或義務時處罰
(assert (= penalty
   (or violate_management_or_duty_rules
       (not agent_broker_notary_license_and_insurance_ok)
       (not related_insurance_type_ok)
       (not broker_duty_of_care_and_fidelity)
       (not capital_adjustment_required_on_share_transfer)
       (not broker_capital_requirement_ok)
       (not capital_adjustment_required)
       (not management_rule_compliance)
       (not broker_provide_written_report_and_disclose_fee)
       (not capital_adjustment_cash_only))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= licensed_by_authority true))
(assert (= guarantee_deposit_paid true))
(assert (= related_insurance_purchased true))
(assert (= practice_certificate_held true))
(assert (= has_practice_certificate true))
(assert (= paid_in_capital 3000000.0))
(assert (= capital_adjustment_date 20190624))
(assert (= capital_adjustment_completed_date 0))
(assert (= capital_adjustment_required false))
(assert (= capital_adjustment_required_on_share_transfer true))
(assert (= capital_adjustment_completed_within_6_months false))
(assert (= capital_contributed_in_cash_only true))
(assert (= business_type true))
(assert (= is_broker true))
(assert (= is_agent false))
(assert (= is_notary false))
(assert (= management_rules_followed true))
(assert (= broker_exercise_due_care true))
(assert (= broker_fulfill_fidelity true))
(assert (= within_authority_designated_scope false))
(assert (= written_analysis_report_provided false))
(assert (= fee_charged 0.0))
(assert (= fee_standard_disclosed false))
(assert (= share_or_capital_transfer_ratio 0.0))
(assert (= transfer_due_to_inheritance false))
(assert (= violate_financial_management_rules true))
(assert (= violate_business_management_rules false))
(assert (= violate_broker_duty false))
(assert (= violate_related_provisions false))
(assert (= agent_broker_notary_license_and_insurance_ok true))
(assert (= related_insurance_type_ok true))
(assert (= broker_capital_requirement_ok false))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= broker_provide_written_report_and_disclose_fee true))
(assert (= management_rule_compliance true))
(assert (= violate_management_or_duty_rules true))
(assert (= penalty true))
(assert (= capital_adjustment_cash_only false))
(assert (= current_date 0))
(assert (= insurance_type false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 40
; Total facts: 40
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
