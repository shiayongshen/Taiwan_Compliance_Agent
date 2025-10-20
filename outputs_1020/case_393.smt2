; SMT2 file generated from compliance case automatic
; Case ID: case_393
; Generated at: 2025-10-19T14:44:04.856463
;
; This file can be executed with Z3:
;   z3 case_393.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_granted Bool)
(declare-const agent_rules_applied Bool)
(declare-const bank_apply_agent_broker_rules Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_granted Bool)
(declare-const bank_permission_ok Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_ok Bool)
(declare-const broker_fidelity_duty Bool)
(declare-const broker_license_granted Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_report_and_fee_ok Bool)
(declare-const broker_rules_applied Bool)
(declare-const deposit_and_insurance_ok Bool)
(declare-const deposit_paid Bool)
(declare-const insurance_purchased Bool)
(declare-const insurance_type Int)
(declare-const insurance_type_ok Bool)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const license_and_deposit_and_insurance_ok Bool)
(declare-const license_required Bool)
(declare-const notary_license_granted Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_required] 保險代理人、經紀人、公證人須經主管機關許可
(assert (= license_required
   (and agent_license_granted broker_license_granted notary_license_granted)))

; [insurance:deposit_guarantee_and_insurance_required] 須繳存保證金並投保相關保險
(assert (= deposit_and_insurance_ok (and deposit_paid insurance_purchased)))

; [insurance:insurance_type_required] 相關保險種類依身份不同而定
(assert (= insurance_type_ok
   (and (or (not is_agent) (= 1 insurance_type))
        (or (not is_notary) (= 1 insurance_type))
        (or (not is_broker) (= 1 insurance_type) (= 2 insurance_type)))))

; [insurance:license_and_deposit_and_insurance_ok] 領有執業證照且繳存保證金並投保相關保險後，始得經營或執行業務
(assert (= license_and_deposit_and_insurance_ok
   (and license_required deposit_and_insurance_ok insurance_type_ok)))

; [insurance:bank_permission_for_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務
(assert (= bank_permission_ok
   (and bank_permission_granted
        (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance:bank_apply_agent_broker_rules] 銀行兼營保險代理人或經紀人業務時，應分別準用相關規定
(assert (= bank_apply_agent_broker_rules
   (and bank_permission_ok agent_rules_applied broker_rules_applied)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及負忠實義務
(assert (= broker_duty_ok (and broker_duty_of_care broker_fidelity_duty)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人洽訂契約前應主動提供書面分析報告並明確告知報酬標準
(assert (= broker_report_and_fee_ok
   (and broker_provide_written_report broker_disclose_fee_standard)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照或保險經紀人未履行義務時處罰
(assert (= penalty
   (or (not license_required)
       (not license_and_deposit_and_insurance_ok)
       (not broker_duty_ok)
       (not broker_report_and_fee_ok)
       (not deposit_and_insurance_ok)
       (not insurance_type_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_license_granted false))
(assert (= broker_license_granted true))
(assert (= notary_license_granted false))
(assert (= deposit_paid false))
(assert (= insurance_purchased false))
(assert (= insurance_type 2))
(assert (= is_agent false))
(assert (= is_broker true))
(assert (= is_notary false))
(assert (= agent_rules_applied false))
(assert (= broker_rules_applied false))
(assert (= bank_permission_granted false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= bank_apply_agent_broker_rules false))
(assert (= broker_duty_of_care true))
(assert (= broker_fidelity_duty true))
(assert (= broker_duty_ok true))
(assert (= broker_provide_written_report true))
(assert (= broker_disclose_fee_standard true))
(assert (= broker_report_and_fee_ok true))
(assert (= bank_permission_ok false))
(assert (= deposit_and_insurance_ok false))
(assert (= insurance_type_ok false))
(assert (= license_and_deposit_and_insurance_ok false))
(assert (= license_required false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 27
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
