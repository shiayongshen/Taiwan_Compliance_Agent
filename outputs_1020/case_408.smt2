; SMT2 file generated from compliance case automatic
; Case ID: case_408
; Generated at: 2025-10-19T15:08:21.395951
;
; This file can be executed with Z3:
;   z3 case_408.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_by_authority Bool)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_ok Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_ok Bool)
(declare-const broker_fee_disclosed Bool)
(declare-const broker_fidelity_duty Bool)
(declare-const broker_report_and_fee_ok Bool)
(declare-const broker_report_provided Bool)
(declare-const business_allowed Bool)
(declare-const compliance_all Bool)
(declare-const criminal_violation Bool)
(declare-const guarantee_and_insurance_ok Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const illegal_operation Bool)
(declare-const insurance_type Int)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const license_held Bool)
(declare-const license_required Bool)
(declare-const not_authorized_insurance_business Bool)
(declare-const operating_as_agent_broker_notary Bool)
(declare-const penalty Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_ok Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_required] 保險代理人、經紀人、公證人須經主管機關許可並領有執業證照
(assert (= license_required (and approved_by_authority license_held)))

; [insurance:guarantee_deposit_and_insurance_required] 須繳存保證金並投保相關保險
(assert (= guarantee_and_insurance_ok
   (and guarantee_deposit_paid related_insurance_purchased)))

; [insurance:related_insurance_type] 相關保險類型依身份區分
(assert (let ((a!1 (or (and is_notary (= 1 insurance_type))
               (and is_broker (or (= 1 insurance_type) (= 2 insurance_type)))
               (and is_agent (= 1 insurance_type)))))
  (= related_insurance_type_ok a!1)))

; [insurance:business_allowed] 領有執業證照且繳存保證金並投保相關保險後，始得經營或執行業務
(assert (= business_allowed (and license_required guarantee_and_insurance_ok)))

; [insurance:bank_permission_to_operate] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務
(assert (= bank_permission_ok
   (and bank_approved_by_authority
        (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及負忠實義務
(assert (= broker_duty_ok (and broker_duty_of_care broker_fidelity_duty)))

; [insurance:broker_report_and_fee_disclosure] 保險經紀人洽訂契約前應主動提供書面分析報告並明確告知報酬標準
(assert (= broker_report_and_fee_ok
   (and broker_report_provided
        (or (not broker_charge_fee) broker_fee_disclosed))))

; [insurance:compliance_all] 保險代理人、經紀人、公證人合規條件
(assert (= compliance_all
   (and business_allowed
        related_insurance_type_ok
        broker_duty_ok
        broker_report_and_fee_ok)))

; [insurance:illegal_operation] 未領有執業證照而經營或執行保險代理人、經紀人、公證人業務
(assert (= illegal_operation (and (not license_held) operating_as_agent_broker_notary)))

; [insurance:criminal_violation] 非本法保險業代理、經紀或招攬保險業務者
(assert (= criminal_violation not_authorized_insurance_business))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反未經許可經營、未領執業證照經營或非本法保險業代理經紀招攬業務
(assert (= penalty (or criminal_violation illegal_operation (not license_required))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approved_by_authority false))
(assert (= license_held false))
(assert (= license_required true))
(assert (= operating_as_agent_broker_notary true))
(assert (= not_authorized_insurance_business true))
(assert (= criminal_violation true))
(assert (= illegal_operation true))
(assert (= business_allowed false))
(assert (= guarantee_deposit_paid false))
(assert (= related_insurance_purchased false))
(assert (= guarantee_and_insurance_ok false))
(assert (= related_insurance_type_ok false))
(assert (= is_agent false))
(assert (= is_broker true))
(assert (= is_notary false))
(assert (= insurance_type 0))
(assert (= broker_duty_of_care false))
(assert (= broker_fidelity_duty false))
(assert (= broker_duty_ok false))
(assert (= broker_report_provided false))
(assert (= broker_charge_fee true))
(assert (= broker_fee_disclosed false))
(assert (= broker_report_and_fee_ok false))
(assert (= compliance_all false))
(assert (= bank_approved_by_authority false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= bank_permission_ok false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 29
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
