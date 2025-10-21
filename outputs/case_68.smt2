; SMT2 file generated from compliance case automatic
; Case ID: case_68
; Generated at: 2025-10-21T00:42:03.403807
;
; This file can be executed with Z3:
;   z3 case_68.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_type Real)
(declare-const application_procedure_complied Bool)
(declare-const bank_engaged_in_insurance_agent_or_broker Bool)
(declare-const bank_permission_and_separate_compliance Bool)
(declare-const board_and_supervisor_qualifications_met Bool)
(declare-const branch_establishment_conditions_met Bool)
(declare-const broker_charged_fee Real)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercised_due_care Bool)
(declare-const broker_fulfilled_fidelity_duty Bool)
(declare-const broker_written_report_and_fee_disclosure Bool)
(declare-const education_and_training_compliant Bool)
(declare-const fee_disclosure_made Bool)
(declare-const financial_and_business_management_compliant Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_deposit_minimum Real)
(declare-const guarantee_deposit_minimum_set_by_authority Bool)
(declare-const has_practice_certificate Bool)
(declare-const insurance_agent_regulations_complied Bool)
(declare-const insurance_broker_regulations_complied Bool)
(declare-const insurance_policy_guarantee Bool)
(declare-const insurance_policy_responsibility Bool)
(declare-const insurance_policy_type_compliance Bool)
(declare-const insurance_policy_valid Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_revocation_procedures_complied Bool)
(declare-const licensed Bool)
(declare-const management_rules_compliance Bool)
(declare-const minimum_guarantee_and_insurance_amount_set Bool)
(declare-const other_management_rules_complied Bool)
(declare-const penalty Bool)
(declare-const qualification_requirements_met Bool)
(declare-const required_documents_submitted Bool)
(declare-const violation_penalty Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and licensed
        (>= guarantee_deposit_amount guarantee_deposit_minimum)
        insurance_policy_valid
        has_practice_certificate)))

; [insurance:insurance_policy_type_compliance] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= insurance_policy_type_compliance
   (or (and (= 1.0 agent_type) insurance_policy_responsibility)
       (and (= 3.0 agent_type) insurance_policy_responsibility)
       (and (= 2.0 agent_type)
            insurance_policy_responsibility
            insurance_policy_guarantee))))

; [insurance:minimum_guarantee_and_insurance_amount_set] 主管機關依經營業務範圍及規模定最低保證金及保險金額
(assert (= minimum_guarantee_and_insurance_amount_set
   guarantee_deposit_minimum_set_by_authority))

; [insurance:management_rules_compliance] 符合主管機關定管理規則，包括資格、申請、董事監察人資格、分支機構條件、財務與業務管理、教育訓練、廢止許可等
(assert (= management_rules_compliance
   (and qualification_requirements_met
        application_procedure_complied
        required_documents_submitted
        board_and_supervisor_qualifications_met
        branch_establishment_conditions_met
        financial_and_business_management_compliant
        education_and_training_compliant
        license_revocation_procedures_complied
        other_management_rules_complied)))

; [insurance:bank_permission_and_separate_compliance] 銀行經主管機關許可擇一兼營保險代理人或經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_separate_compliance
   (or (not bank_engaged_in_insurance_agent_or_broker)
       (and insurance_agent_regulations_complied
            insurance_broker_regulations_complied))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercised_due_care broker_fulfilled_fidelity_duty)))

; [insurance:broker_written_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂契約前，主動提供書面分析報告，收取報酬者明確告知收費標準
(assert (let ((a!1 (and written_analysis_report_provided
                (or fee_disclosure_made (not (= broker_charged_fee 1.0))))))
  (= broker_written_report_and_fee_disclosure a!1)))

; [insurance:violation_penalty] 違反管理規則財務或業務管理規定、未依規定提供書面分析報告或報酬告知，應限期改正或處罰，情節重大廢止許可並註銷執業證照
(assert (= violation_penalty
   (or (not management_rules_compliance)
       (not broker_written_report_and_fee_disclosure))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則或未依規定提供書面分析報告及報酬告知時處罰
(assert (= penalty
   (or (not broker_written_report_and_fee_disclosure)
       (not management_rules_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_type 1))
(assert (= licensed true))
(assert (= guarantee_deposit_amount 500000))
(assert (= guarantee_deposit_minimum 1000000))
(assert (= guarantee_deposit_minimum_set_by_authority true))
(assert (= insurance_policy_valid true))
(assert (= has_practice_certificate true))
(assert (= insurance_policy_responsibility true))
(assert (= insurance_policy_guarantee false))
(assert (= application_procedure_complied true))
(assert (= board_and_supervisor_qualifications_met true))
(assert (= branch_establishment_conditions_met true))
(assert (= financial_and_business_management_compliant false))
(assert (= education_and_training_compliant true))
(assert (= license_revocation_procedures_complied true))
(assert (= other_management_rules_complied true))
(assert (= qualification_requirements_met true))
(assert (= required_documents_submitted true))
(assert (= insurance_agent_regulations_complied true))
(assert (= insurance_broker_regulations_complied true))
(assert (= bank_engaged_in_insurance_agent_or_broker true))
(assert (= bank_permission_and_separate_compliance false))
(assert (= broker_charged_fee 0))
(assert (= broker_exercised_due_care true))
(assert (= broker_fulfilled_fidelity_duty true))
(assert (= broker_written_report_and_fee_disclosure true))
(assert (= written_analysis_report_provided true))
(assert (= fee_disclosure_made true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 35
; Total facts: 28
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
