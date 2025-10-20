; SMT2 file generated from compliance case automatic
; Case ID: case_399
; Generated at: 2025-10-19T14:53:06.359431
;
; This file can be executed with Z3:
;   z3 case_399.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_bond_and_insurance_required Bool)
(declare-const agent_bond_deposited Bool)
(declare-const agent_liability_insurance_purchased Bool)
(declare-const agent_license_held Bool)
(declare-const agent_license_required Bool)
(declare-const agent_operate_allowed Bool)
(declare-const agent_permit_granted Bool)
(declare-const bank_apply_agent_broker_rules Bool)
(declare-const bank_apply_broker_rules Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permit_granted Bool)
(declare-const bank_permit_to_operate_agent_or_broker Bool)
(declare-const broker_bond_and_insurance_required Bool)
(declare-const broker_bond_deposited Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_exercise_fidelity Bool)
(declare-const broker_fee_charged Bool)
(declare-const broker_fee_standard_disclosed Bool)
(declare-const broker_guarantee_insurance_purchased Bool)
(declare-const broker_liability_insurance_purchased Bool)
(declare-const broker_license_held Bool)
(declare-const broker_license_required Bool)
(declare-const broker_operate_allowed Bool)
(declare-const broker_permit_granted Bool)
(declare-const broker_provide_written_report_before_contract Bool)
(declare-const broker_written_report_provided Bool)
(declare-const notary_bond_and_insurance_required Bool)
(declare-const notary_bond_deposited Bool)
(declare-const notary_liability_insurance_purchased Bool)
(declare-const notary_license_held Bool)
(declare-const notary_license_required Bool)
(declare-const notary_operate_allowed Bool)
(declare-const notary_permit_granted Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_required] 保險代理人須經主管機關許可並領有執業證照
(assert (= agent_license_required (and agent_permit_granted agent_license_held)))

; [insurance:agent_bond_and_insurance_required] 保險代理人須繳存保證金並投保責任保險
(assert (= agent_bond_and_insurance_required
   (and agent_bond_deposited agent_liability_insurance_purchased)))

; [insurance:agent_operate_allowed] 保險代理人得經營或執行業務
(assert (= agent_operate_allowed
   (and agent_license_required agent_bond_and_insurance_required)))

; [insurance:broker_license_required] 保險經紀人須經主管機關許可並領有執業證照
(assert (= broker_license_required (and broker_permit_granted broker_license_held)))

; [insurance:broker_bond_and_insurance_required] 保險經紀人須繳存保證金並投保責任保險及保證保險
(assert (= broker_bond_and_insurance_required
   (and broker_bond_deposited
        broker_liability_insurance_purchased
        broker_guarantee_insurance_purchased)))

; [insurance:broker_operate_allowed] 保險經紀人得經營或執行業務
(assert (= broker_operate_allowed
   (and broker_license_required broker_bond_and_insurance_required)))

; [insurance:notary_license_required] 保險公證人須經主管機關許可並領有執業證照
(assert (= notary_license_required (and notary_permit_granted notary_license_held)))

; [insurance:notary_bond_and_insurance_required] 保險公證人須繳存保證金並投保責任保險
(assert (= notary_bond_and_insurance_required
   (and notary_bond_deposited notary_liability_insurance_purchased)))

; [insurance:notary_operate_allowed] 保險公證人得經營或執行業務
(assert (= notary_operate_allowed
   (and notary_license_required notary_bond_and_insurance_required)))

; [insurance:bank_permit_to_operate_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務
(assert (= bank_permit_to_operate_agent_or_broker bank_permit_granted))

; [insurance:bank_apply_agent_broker_rules] 銀行兼營保險代理人或保險經紀人業務時，應分別準用相關規定
(assert (= bank_apply_agent_broker_rules
   (and bank_operate_as_agent agent_operate_allowed)))

; [insurance:bank_apply_broker_rules] 銀行兼營保險經紀人業務時，應分別準用相關規定
(assert (= bank_apply_broker_rules (and bank_operate_as_broker broker_operate_allowed)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_exercise_fidelity)))

; [insurance:broker_provide_written_report_before_contract] 保險經紀人於洽訂保險契約前應主動提供書面分析報告
(assert (= broker_provide_written_report_before_contract broker_written_report_provided))

; [insurance:broker_disclose_fee_standard] 保險經紀人向要保人或被保險人收取報酬時，應明確告知報酬收取標準
(assert (= broker_disclose_fee_standard
   (or broker_fee_standard_disclosed (not broker_fee_charged))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定許可、繳存保證金、投保相關保險或未領執業證照者處罰
(assert (let ((a!1 (or (not agent_operate_allowed)
               (not broker_operate_allowed)
               (not notary_operate_allowed)
               (and bank_permit_to_operate_agent_or_broker
                    (not (or bank_apply_agent_broker_rules
                             bank_apply_broker_rules))))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= broker_permit_granted true))
(assert (= broker_license_held true))
(assert (= broker_bond_deposited false))
(assert (= broker_liability_insurance_purchased false))
(assert (= broker_guarantee_insurance_purchased false))
(assert (= agent_bond_and_insurance_required false))
(assert (= agent_bond_deposited false))
(assert (= agent_liability_insurance_purchased false))
(assert (= agent_license_held false))
(assert (= agent_license_required false))
(assert (= agent_operate_allowed false))
(assert (= agent_permit_granted false))
(assert (= bank_apply_agent_broker_rules false))
(assert (= bank_apply_broker_rules false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= bank_permit_granted false))
(assert (= bank_permit_to_operate_agent_or_broker false))
(assert (= broker_bond_and_insurance_required false))
(assert (= broker_disclose_fee_standard false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_exercise_fidelity false))
(assert (= broker_fee_charged false))
(assert (= broker_fee_standard_disclosed false))
(assert (= broker_license_required false))
(assert (= broker_operate_allowed false))
(assert (= broker_provide_written_report_before_contract false))
(assert (= broker_written_report_provided false))
(assert (= notary_bond_and_insurance_required false))
(assert (= notary_bond_deposited false))
(assert (= notary_liability_insurance_purchased false))
(assert (= notary_license_held false))
(assert (= notary_license_required false))
(assert (= notary_operate_allowed false))
(assert (= notary_permit_granted false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 37
; Total facts: 37
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
