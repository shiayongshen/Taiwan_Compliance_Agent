; SMT2 file generated from compliance case automatic
; Case ID: case_59
; Generated at: 2025-10-21T00:26:07.472516
;
; This file can be executed with Z3:
;   z3 case_59.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_and_guarantee Bool)
(declare-const bank_as_agent Bool)
(declare-const bank_as_broker Bool)
(declare-const bank_permission_granted Bool)
(declare-const bank_permission_ok Bool)
(declare-const broker_duty_of_care_and_fidelity_ok Bool)
(declare-const broker_exercised_duty_of_care Bool)
(declare-const broker_fulfilled_fidelity Bool)
(declare-const broker_report_and_fee_disclosure_ok Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosure_made Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance Bool)
(declare-const guarantee_minimum_amount Real)
(declare-const insurance_type Int)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const liability_insurance Bool)
(declare-const license_permitted Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const relevant_insurance_type_ok Bool)
(declare-const violate_business_management_rule Bool)
(declare-const violate_financial_management_rule Bool)
(declare-const violate_related_provisions Bool)
(declare-const violate_written_report_rule Bool)
(declare-const violation_financial_or_business_management Bool)
(declare-const within_designated_scope Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_license_and_guarantee
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        relevant_insurance_covered
        practice_certificate_held)))

; [insurance:relevant_insurance_type] 相關保險類型依身份區分：代理人、公證人為責任保險；經紀人為責任保險及保證保險
(assert (let ((a!1 (and is_broker
                (or (= insurance_type (ite liability_insurance 1 0))
                    (= insurance_type (ite guarantee_insurance 1 0))))))
(let ((a!2 (or (and is_agent (= insurance_type (ite liability_insurance 1 0)))
               (and is_notary (= insurance_type (ite liability_insurance 1 0)))
               a!1)))
  (= relevant_insurance_type_ok a!2))))

; [insurance:bank_permission_for_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並應分別準用相關規定
(assert (= bank_permission_ok
   (or bank_as_agent bank_as_broker (not bank_permission_granted))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約或提供服務，並負忠實義務
(assert (= broker_duty_of_care_and_fidelity_ok
   (and broker_exercised_duty_of_care broker_fulfilled_fidelity)))

; [insurance:broker_written_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_report_and_fee_disclosure_ok
   (and (or (not within_designated_scope) written_analysis_report_provided)
        (or fee_disclosure_made (not fee_charged)))))

; [insurance:violation_financial_or_business_management] 違反管理規則中財務或業務管理規定、書面分析報告規定或相關準用規定
(assert (= violation_financial_or_business_management
   (or violate_business_management_rule
       violate_related_provisions
       violate_financial_management_rule
       violate_written_report_rule)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則財務或業務管理規定、書面分析報告規定或相關準用規定時處罰
(assert (= penalty violation_financial_or_business_management))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted true))
(assert (= guarantee_deposit_amount 500000))
(assert (= guarantee_minimum_amount 500000))
(assert (= relevant_insurance_covered true))
(assert (= practice_certificate_held true))
(assert (= is_agent true))
(assert (= is_broker false))
(assert (= is_notary false))
(assert (= liability_insurance true))
(assert (= insurance_type 1))
(assert (= bank_permission_granted false))
(assert (= bank_as_agent false))
(assert (= bank_as_broker false))
(assert (= broker_exercised_duty_of_care false))
(assert (= broker_fulfilled_fidelity false))
(assert (= broker_duty_of_care_and_fidelity_ok false))
(assert (= within_designated_scope false))
(assert (= written_analysis_report_provided false))
(assert (= fee_charged false))
(assert (= fee_disclosure_made false))
(assert (= broker_report_and_fee_disclosure_ok false))
(assert (= violate_financial_management_rule true))
(assert (= violate_business_management_rule true))
(assert (= violate_written_report_rule false))
(assert (= violate_related_provisions true))
(assert (= violation_financial_or_business_management true))
(assert (= agent_license_and_guarantee false))
(assert (= relevant_insurance_type_ok true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 31
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
