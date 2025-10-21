; SMT2 file generated from compliance case automatic
; Case ID: case_451
; Generated at: 2025-10-21T10:10:08.844349
;
; This file can be executed with Z3:
;   z3 case_451.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_rules_applied Bool)
(declare-const agent_type Int)
(declare-const approved_by_authority Bool)
(declare-const bank_agent_business Bool)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_broker_business Bool)
(declare-const bank_compliance_ok Bool)
(declare-const bank_permission_ok Bool)
(declare-const broker_duty_ok Bool)
(declare-const broker_fault Bool)
(declare-const broker_report_and_fee_ok Bool)
(declare-const broker_rules_applied Bool)
(declare-const business_allowed Bool)
(declare-const correction_or_penalty_required Bool)
(declare-const damage_to_insured Bool)
(declare-const deposit_amount Real)
(declare-const deposit_and_insurance_ok Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_fidelity Bool)
(declare-const fee_charged Real)
(declare-const fee_disclosed Bool)
(declare-const guarantee_insurance Bool)
(declare-const insurance_coverage_ok Bool)
(declare-const liability_for_damage Bool)
(declare-const liability_insurance Bool)
(declare-const license_held Bool)
(declare-const license_required Bool)
(declare-const minimum_deposit_amount Real)
(declare-const penalty Bool)
(declare-const violate_broker_report_rule Bool)
(declare-const violate_business_management Bool)
(declare-const violate_finance_management Bool)
(declare-const violate_other_related_rules Bool)
(declare-const violation_any Bool)
(declare-const violation_broker_report_rule Bool)
(declare-const violation_finance_or_business_management Bool)
(declare-const violation_other_related_rules Bool)
(declare-const written_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_required] 保險代理人、經紀人、公證人須經主管機關許可並領有執業證照
(assert (= license_required (and approved_by_authority license_held)))

; [insurance:deposit_and_insurance_required] 須繳存保證金並投保相關保險
(assert (= deposit_and_insurance_ok
   (and (>= deposit_amount minimum_deposit_amount) insurance_coverage_ok)))

; [insurance:insurance_coverage_ok] 保險代理人、公證人須投保責任保險；保險經紀人須投保責任保險及保證保險
(assert (= insurance_coverage_ok
   (or (and (= 2 agent_type) liability_insurance guarantee_insurance)
       (and (= 1 agent_type) liability_insurance)
       (and (= 3 agent_type) liability_insurance))))

; [insurance:business_allowed] 領有執業證照且符合繳存保證金及投保相關保險後，始得經營或執行業務
(assert (= business_allowed (and license_required deposit_and_insurance_ok)))

; [insurance:bank_permission_for_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務
(assert (= bank_permission_ok
   (and bank_approved_by_authority
        (or bank_agent_business bank_broker_business))))

; [insurance:bank_compliance_with_agent_broker_rules] 銀行兼營保險代理人或經紀人業務應分別準用相關規定
(assert (= bank_compliance_ok
   (and bank_permission_ok (or agent_rules_applied broker_rules_applied))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及負忠實義務
(assert (= broker_duty_ok (and duty_of_care duty_of_fidelity)))

; [insurance:broker_report_and_fee_disclosure] 保險經紀人洽訂契約前應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (let ((a!1 (and written_report_provided
                (or (not (= fee_charged 1.0)) fee_disclosed))))
  (= broker_report_and_fee_ok a!1)))

; [insurance:violation_finance_or_business_management] 違反財務或業務管理規定
(assert (= violation_finance_or_business_management
   (or violate_finance_management violate_business_management)))

; [insurance:violation_broker_report_rule] 違反保險經紀人書面分析報告規定
(assert (= violation_broker_report_rule violate_broker_report_rule))

; [insurance:violation_other_related_rules] 違反第一百六十五條第一項或第一百六十三條第五項準用規定
(assert (= violation_other_related_rules violate_other_related_rules))

; [insurance:violation_any] 違反任一相關規定
(assert (= violation_any
   (or violation_finance_or_business_management
       violation_other_related_rules
       violation_broker_report_rule)))

; [insurance:correction_or_penalty] 違反規定應限期改正或處罰
(assert (= correction_or_penalty_required violation_any))

; [insurance:liability_for_damage] 保險經紀人因過失致損害應負賠償責任
(assert (= liability_for_damage (and broker_fault damage_to_insured)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一規定時處罰
(assert (= penalty violation_any))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_type 2))
(assert (= approved_by_authority true))
(assert (= license_held true))
(assert (= deposit_amount 0))
(assert (= minimum_deposit_amount 1000000))
(assert (= liability_insurance true))
(assert (= guarantee_insurance true))
(assert (= deposit_and_insurance_ok false))
(assert (= license_required true))
(assert (= business_allowed false))
(assert (= broker_rules_applied false))
(assert (= agent_rules_applied false))
(assert (= violate_finance_management false))
(assert (= violate_business_management true))
(assert (= violate_broker_report_rule false))
(assert (= violate_other_related_rules true))
(assert (= violation_finance_or_business_management true))
(assert (= violation_broker_report_rule false))
(assert (= violation_other_related_rules true))
(assert (= violation_any true))
(assert (= correction_or_penalty_required true))
(assert (= penalty true))
(assert (= broker_fault false))
(assert (= damage_to_insured false))
(assert (= broker_duty_ok false))
(assert (= duty_of_care false))
(assert (= duty_of_fidelity false))
(assert (= broker_report_and_fee_ok false))
(assert (= written_report_provided false))
(assert (= fee_charged 0))
(assert (= fee_disclosed false))
(assert (= bank_approved_by_authority false))
(assert (= bank_agent_business false))
(assert (= bank_broker_business false))
(assert (= bank_permission_ok false))
(assert (= bank_compliance_ok false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 38
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
