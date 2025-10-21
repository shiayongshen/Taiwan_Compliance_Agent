; SMT2 file generated from compliance case automatic
; Case ID: case_65
; Generated at: 2025-10-21T00:37:41.109621
;
; This file can be executed with Z3:
;   z3 case_65.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_fee_payment_and_declaration Bool)
(declare-const agent_issue_note_declaration_required Bool)
(declare-const agent_license_and_guarantee_ok Bool)
(declare-const applicant_declaration_provided Bool)
(declare-const apply_agent_broker_rules Bool)
(declare-const authority_set_management_rules Bool)
(declare-const authority_set_minimum_and_implementation Bool)
(declare-const bank_authorized Bool)
(declare-const bank_engage_agent Bool)
(declare-const bank_engage_broker Bool)
(declare-const bank_permission_and_apply_agent_broker_rules Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_due_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_report_and_fee_disclosed Bool)
(declare-const corrected_or_ordered_to_improve Bool)
(declare-const direct_total_payment_to_insurer Bool)
(declare-const director_or_supervisor_removed_by_authority Bool)
(declare-const director_supervisor_deregistration Bool)
(declare-const guarantee_deposited Bool)
(declare-const has_practice_certificate Bool)
(declare-const is_agent_or_notary Bool)
(declare-const is_broker Bool)
(declare-const issue_note_in_own_name Bool)
(declare-const licensed_by_authority Bool)
(declare-const management_rules_set Bool)
(declare-const minimum_amount_and_implementation_set Bool)
(declare-const note_issued_in_insured_or_beneficiary_name Bool)
(declare-const notify_registration_authority_to_cancel Bool)
(declare-const ordered_director_or_supervisor_removed_or_suspended Bool)
(declare-const ordered_manager_or_staff_removed Bool)
(declare-const other_necessary_measures Bool)
(declare-const pay_by_note Bool)
(declare-const penalty Bool)
(declare-const penalty_or_license_revoked Bool)
(declare-const purchased_guarantee_insurance Bool)
(declare-const purchased_liability_insurance Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_ok Bool)
(declare-const restricted_business_scope Bool)
(declare-const violate_financial_or_business_management_rules Bool)
(declare-const violate_law_or_harmful_to_operation Bool)
(declare-const violate_related_provisions Bool)
(declare-const violation_and_administrative_measures Bool)
(declare-const violation_financial_or_business_management_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_guarantee_ok] 保險代理人、經紀人、公證人經主管機關許可，繳存保證金並投保相關保險，且領有執業證照
(assert (= agent_license_and_guarantee_ok
   (and licensed_by_authority
        guarantee_deposited
        related_insurance_purchased
        has_practice_certificate)))

; [insurance:related_insurance_type_ok] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= related_insurance_type_ok
   (or (and is_agent_or_notary purchased_liability_insurance)
       (and is_broker
            purchased_liability_insurance
            purchased_guarantee_insurance))))

; [insurance:minimum_amount_and_implementation_set] 主管機關定最低保證金及保險金額與實施方式
(assert (= minimum_amount_and_implementation_set
   authority_set_minimum_and_implementation))

; [insurance:management_rules_set] 主管機關定管理規則涵蓋資格、程序、文件、董事監察人資格、解任、分支機構、財務業務管理、教育訓練、廢止許可等事項
(assert (= management_rules_set authority_set_management_rules))

; [insurance:bank_permission_and_apply_agent_broker_rules] 銀行經主管機關許可擇一兼營保險代理人或經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_apply_agent_broker_rules
   (and bank_authorized
        (or bank_engage_agent bank_engage_broker)
        apply_agent_broker_rules)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_due_care broker_fulfill_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂契約前，主動提供書面分析報告，收取報酬者明確告知收費標準
(assert (= broker_report_and_fee_disclosed
   (and broker_provide_written_report
        (or (not broker_charge_fee) broker_disclose_fee_standard))))

; [insurance:violation_and_administrative_measures] 違反法令或有礙健全經營時主管機關得糾正、限期改善及處分
(assert (= violation_and_administrative_measures
   (or corrected_or_ordered_to_improve
       (not violate_law_or_harmful_to_operation)
       restricted_business_scope
       other_necessary_measures
       ordered_manager_or_staff_removed
       ordered_director_or_supervisor_removed_or_suspended)))

; [insurance:director_supervisor_deregistration] 依主管機關命令解除董事監察人職務時，通知登記主管機關註銷登記
(assert (= director_supervisor_deregistration
   (or (not director_or_supervisor_removed_by_authority)
       notify_registration_authority_to_cancel)))

; [insurance:violation_financial_or_business_management_penalty] 違反財務或業務管理規定或相關準用規定，應限期改正或處罰，情節重大廢止許可並註銷執業證照
(assert (= violation_financial_or_business_management_penalty
   (or penalty_or_license_revoked
       (not (or violate_financial_or_business_management_rules
                violate_related_provisions)))))

; [insurance:agent_fee_payment_and_declaration] 個人執業代理人、代理人公司及銀行代收保險費應直接總額解繳保險業，不得以自己名義開立票據
(assert (= agent_fee_payment_and_declaration
   (and direct_total_payment_to_insurer (not issue_note_in_own_name))))

; [insurance:agent_issue_note_declaration_required] 以票據解繳保險費非要保人、被保險人及受益人名義開立者，應出具要保人聲明書
(assert (let ((a!1 (or (not (and pay_by_note
                         (not note_issued_in_insured_or_beneficiary_name)))
               applicant_declaration_provided)))
  (= agent_issue_note_declaration_required a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照，或相關保險種類不符，或違反財務業務管理規定，或未依規定繳納保險費，或未出具聲明書時處罰
(assert (= penalty
   (or (not violation_financial_or_business_management_penalty)
       (not agent_fee_payment_and_declaration)
       (not agent_license_and_guarantee_ok)
       (and pay_by_note (not agent_issue_note_declaration_required))
       (not related_insurance_type_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= licensed_by_authority true))
(assert (= guarantee_deposited true))
(assert (= related_insurance_purchased true))
(assert (= has_practice_certificate true))
(assert (= is_agent_or_notary true))
(assert (= purchased_liability_insurance true))
(assert (= purchased_guarantee_insurance false))
(assert (= related_insurance_type_ok false))
(assert (= direct_total_payment_to_insurer false))
(assert (= issue_note_in_own_name false))
(assert (= pay_by_note false))
(assert (= applicant_declaration_provided false))
(assert (= violate_financial_or_business_management_rules true))
(assert (= violate_related_provisions true))
(assert (= violation_financial_or_business_management_penalty true))
(assert (= penalty_or_license_revoked true))
(assert (= agent_fee_payment_and_declaration false))
(assert (= agent_issue_note_declaration_required true))
(assert (= violate_law_or_harmful_to_operation true))
(assert (= restricted_business_scope true))
(assert (= corrected_or_ordered_to_improve false))
(assert (= ordered_manager_or_staff_removed false))
(assert (= ordered_director_or_supervisor_removed_or_suspended false))
(assert (= other_necessary_measures false))
(assert (= penalty true))
(assert (= apply_agent_broker_rules true))
(assert (= authority_set_management_rules true))
(assert (= authority_set_minimum_and_implementation true))
(assert (= bank_authorized false))
(assert (= bank_engage_agent false))
(assert (= bank_engage_broker false))
(assert (= bank_permission_and_apply_agent_broker_rules false))
(assert (= broker_charge_fee false))
(assert (= broker_disclose_fee_standard false))
(assert (= broker_exercise_due_care false))
(assert (= broker_fulfill_fidelity false))
(assert (= broker_provide_written_report false))
(assert (= broker_report_and_fee_disclosed false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= director_or_supervisor_removed_by_authority false))
(assert (= notify_registration_authority_to_cancel false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 48
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
