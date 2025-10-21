; SMT2 file generated from compliance case automatic
; Case ID: case_409
; Generated at: 2025-10-21T08:58:16.874843
;
; This file can be executed with Z3:
;   z3 case_409.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent Bool)
(declare-const agent_or_notary Bool)
(declare-const approved_by_authority Bool)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_as_agent Bool)
(declare-const bank_as_broker Bool)
(declare-const bank_permitted Bool)
(declare-const broker Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_report_and_fee_disclosure Bool)
(declare-const business_allowed Bool)
(declare-const deposit_and_insurance_required Bool)
(declare-const deposit_paid Bool)
(declare-const duty_of_care_exercised Bool)
(declare-const duty_of_loyalty_exercised Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosed Bool)
(declare-const guarantee_insurance Bool)
(declare-const illegal_operation Bool)
(declare-const insurance_purchased Bool)
(declare-const insurance_type_required Bool)
(declare-const liability_insurance Bool)
(declare-const license_held Bool)
(declare-const license_required Bool)
(declare-const notary Bool)
(declare-const penalty Bool)
(declare-const unlicensed_operation Bool)
(declare-const written_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_required] 保險代理人、經紀人、公證人須經主管機關許可並領有執業證照
(assert (= license_required (and approved_by_authority license_held)))

; [insurance:deposit_and_insurance_required] 須繳存保證金並投保相關保險
(assert (= deposit_and_insurance_required (and deposit_paid insurance_purchased)))

; [insurance:insurance_type_required] 保險代理人、公證人須投保責任保險，保險經紀人須投保責任保險及保證保險
(assert (= insurance_type_required
   (or (and agent_or_notary liability_insurance)
       (and broker liability_insurance guarantee_insurance))))

; [insurance:business_allowed] 領有執業證照且繳存保證金並投保相關保險後，始得經營或執行業務
(assert (= business_allowed (and license_required deposit_and_insurance_required)))

; [insurance:bank_permitted] 銀行經主管機關許可得擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted
   (and bank_approved_by_authority (or bank_as_agent bank_as_broker))))

; [insurance:broker_duty_of_care] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care
   (and broker duty_of_care_exercised duty_of_loyalty_exercised)))

; [insurance:broker_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (let ((a!1 (or (not broker)
               (and written_report_provided
                    (or fee_disclosed (not fee_charged))))))
  (= broker_report_and_fee_disclosure a!1)))

; [insurance:illegal_operation_penalty] 未依規定代理、經紀或招攬保險業務者違法
(assert (not (= (or license_required business_allowed) illegal_operation)))

; [insurance:unlicensed_operation_penalty] 未領有執業證照而經營或執行保險代理人、經紀人、公證人業務
(assert (= unlicensed_operation (and (not license_held) (or agent broker notary))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反非法經營或未領執業證照經營業務時處罰
(assert (= penalty (or illegal_operation unlicensed_operation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent false))
(assert (= agent_or_notary false))
(assert (= approved_by_authority false))
(assert (= bank_approved_by_authority false))
(assert (= bank_as_agent false))
(assert (= bank_as_broker false))
(assert (= bank_permitted false))
(assert (= broker true))
(assert (= broker_duty_of_care false))
(assert (= broker_report_and_fee_disclosure false))
(assert (= business_allowed false))
(assert (= deposit_and_insurance_required false))
(assert (= deposit_paid false))
(assert (= duty_of_care_exercised false))
(assert (= duty_of_loyalty_exercised false))
(assert (= fee_charged false))
(assert (= fee_disclosed false))
(assert (= guarantee_insurance false))
(assert (= illegal_operation true))
(assert (= insurance_purchased false))
(assert (= insurance_type_required false))
(assert (= liability_insurance false))
(assert (= license_held false))
(assert (= license_required false))
(assert (= notary false))
(assert (= penalty true))
(assert (= unlicensed_operation true))
(assert (= written_report_provided false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 28
; Total facts: 28
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
