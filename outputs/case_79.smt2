; SMT2 file generated from compliance case automatic
; Case ID: case_79
; Generated at: 2025-10-21T00:58:31.169623
;
; This file can be executed with Z3:
;   z3 case_79.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_add_or_change_reported_within_7_days Bool)
(declare-const agent_license_revoked_within_15_days Bool)
(declare-const agent_report_compliance Bool)
(declare-const agent_resignation_reported_within_15_days Bool)
(declare-const assist_formal_appearance_violation Bool)
(declare-const audit_committee_approval Bool)
(declare-const audit_committee_approval_votes Int)
(declare-const audit_committee_established Bool)
(declare-const audit_committee_total_members Int)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const board_of_directors_approved Bool)
(declare-const board_of_directors_total Int)
(declare-const board_of_directors_votes Int)
(declare-const coerce_or_induce_clients Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const conflict_of_interest Bool)
(declare-const criminal_conviction Bool)
(declare-const damage_insurance_image Bool)
(declare-const disrupt_financial_order Bool)
(declare-const embezzle_insurance_funds Bool)
(declare-const fail_to_cancel_license_on_resignation Bool)
(declare-const fail_to_confirm_consumer_suitability Bool)
(declare-const fail_to_fill_solicitation_report Bool)
(declare-const fail_to_report_agent_changes Bool)
(declare-const false_financial_reports Bool)
(declare-const false_license_application Bool)
(declare-const financial_consumer_protection_violation Bool)
(declare-const financial_consumer_suitability_violation Bool)
(declare-const hire_unqualified_solicitors Bool)
(declare-const illegal_commission_collection Bool)
(declare-const improper_insurance_payment Bool)
(declare-const induce_contract_termination Bool)
(declare-const induce_policy_surrender Bool)
(declare-const insurance_agent_misconduct Bool)
(declare-const internal_control_approval Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_compliance_full Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const license_lending Bool)
(declare-const misleading_advertisement Bool)
(declare-const not_ensure_suitability Bool)
(declare-const not_fully_understand_consumer_data Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_violations Bool)
(declare-const pay_commission_to_non_solicitors Bool)
(declare-const penalty Bool)
(declare-const reporting_guidelines_followed Bool)
(declare-const sell_unapproved_foreign_policies Bool)
(declare-const solicitation_handling_established Bool)
(declare-const solicitation_handling_executed Bool)
(declare-const unauthorized_business_suspension Bool)
(declare-const unauthorized_document_transfer Bool)
(declare-const unauthorized_insurance_business Bool)
(declare-const unauthorized_third_party_operation Bool)
(declare-const unauthorized_use_of_advertisement Bool)
(declare-const violate_advertising_rules Bool)
(declare-const violate_compensation_system_rules Bool)
(declare-const violate_consumer_data_rules Bool)
(declare-const violate_disclosure_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_compliance] 建立且確實執行內部控制、稽核制度及招攬處理制度與程序
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_executed
        audit_system_established
        audit_system_executed
        solicitation_handling_established
        solicitation_handling_executed)))

; [insurance:internal_control_approval] 內部控制、稽核制度與招攬處理制度及程序經董（理）事會通過
(assert (= internal_control_approval board_of_directors_approved))

; [insurance:audit_committee_approval] 設置審計委員會者，內部控制、稽核制度與招攬處理制度及程序經審計委員會同意
(assert (let ((a!1 (or (>= (to_real audit_committee_approval_votes)
                   (* (/ 1.0 2.0) (to_real audit_committee_total_members)))
               (not audit_committee_established)
               (>= (to_real board_of_directors_votes)
                   (* (/ 2.0 3.0) (to_real board_of_directors_total))))))
  (= audit_committee_approval a!1)))

; [insurance:internal_control_compliance_full] 內部控制制度完整且經適當程序通過
(assert (= internal_control_compliance_full
   (and internal_control_compliance
        internal_control_approval
        (or audit_committee_approval (not audit_committee_established)))))

; [insurance:financial_consumer_protection_violation] 違反金融消費者保護法相關規定
(assert (= financial_consumer_protection_violation
   (or assist_formal_appearance_violation
       violate_compensation_system_rules
       violate_consumer_data_rules
       violate_disclosure_rules
       violate_advertising_rules)))

; [insurance:financial_consumer_suitability_violation] 未充分瞭解金融消費者資料或未確保適合度
(assert (= financial_consumer_suitability_violation
   (or not_fully_understand_consumer_data not_ensure_suitability)))

; [insurance:insurance_agent_misconduct] 保險代理人公司及代理人違反管理規則行為
(assert (= insurance_agent_misconduct
   (or operate_outside_license_scope
       sell_unapproved_foreign_policies
       other_violations
       pay_commission_to_non_solicitors
       conflict_of_interest
       fail_to_cancel_license_on_resignation
       disrupt_financial_order
       unauthorized_document_transfer
       improper_insurance_payment
       embezzle_insurance_funds
       damage_insurance_image
       unauthorized_third_party_operation
       unauthorized_insurance_business
       conceal_important_contract_info
       license_lending
       hire_unqualified_solicitors
       unauthorized_business_suspension
       induce_policy_surrender
       coerce_or_induce_clients
       fail_to_confirm_consumer_suitability
       illegal_commission_collection
       false_financial_reports
       false_license_application
       fail_to_fill_solicitation_report
       fail_to_report_agent_changes
       criminal_conviction
       induce_contract_termination
       misleading_advertisement
       unauthorized_use_of_advertisement)))

; [insurance:agent_report_compliance] 代理人公司及銀行依規定申報及報備
(assert (= agent_report_compliance
   (and agent_resignation_reported_within_15_days
        agent_license_revoked_within_15_days
        agent_add_or_change_reported_within_7_days
        reporting_guidelines_followed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反內部控制、稽核、招攬處理制度或程序，或違反金融消費者保護法相關規定，或保險代理人公司及代理人違反管理規則，或未依規定申報者
(assert (= penalty
   (or (not agent_report_compliance)
       financial_consumer_suitability_violation
       insurance_agent_misconduct
       financial_consumer_protection_violation
       (not internal_control_compliance_full))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_established false))
(assert (= solicitation_handling_executed false))
(assert (= board_of_directors_approved false))
(assert (= audit_committee_established false))
(assert (= audit_committee_approval_votes 0))
(assert (= audit_committee_total_members 0))
(assert (= board_of_directors_total 0))
(assert (= board_of_directors_votes 0))
(assert (= violate_advertising_rules true))
(assert (= violate_consumer_data_rules true))
(assert (= not_fully_understand_consumer_data true))
(assert (= not_ensure_suitability true))
(assert (= fail_to_confirm_consumer_suitability true))
(assert (= unauthorized_use_of_advertisement true))
(assert (= financial_consumer_protection_violation true))
(assert (= financial_consumer_suitability_violation true))
(assert (= insurance_agent_misconduct false))
(assert (= agent_resignation_reported_within_15_days true))
(assert (= agent_license_revoked_within_15_days true))
(assert (= agent_add_or_change_reported_within_7_days true))
(assert (= reporting_guidelines_followed true))
(assert (= agent_report_compliance true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 61
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
