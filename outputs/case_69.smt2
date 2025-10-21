; SMT2 file generated from compliance case automatic
; Case ID: case_69
; Generated at: 2025-10-21T00:43:27.250016
;
; This file can be executed with Z3:
;   z3 case_69.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_type Bool)
(declare-const application_conditions_met Bool)
(declare-const application_procedures_followed Bool)
(declare-const approved_by_authority Bool)
(declare-const authority_defined_minimum_amount Real)
(declare-const bank_approved Bool)
(declare-const bank_authority_approval Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const board_supervisor_manager_qualifications_met Bool)
(declare-const branch_establishment_conditions_met Bool)
(declare-const broker_duties_complied Bool)
(declare-const broker_report_and_fee_disclosure_compliant Bool)
(declare-const dismissal_reasons_not_met Bool)
(declare-const duty_of_care_met Bool)
(declare-const duty_of_loyalty_met Bool)
(declare-const education_and_training_compliant Bool)
(declare-const fee_charged Real)
(declare-const fee_standard_disclosed Bool)
(declare-const financial_and_business_management_compliant Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance_covered Bool)
(declare-const has_practice_license Bool)
(declare-const liability_insurance_covered Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_revocation_procedures_compliant Bool)
(declare-const management_rules_compliance Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const other_mandatory_requirements_compliant Bool)
(declare-const penalty Bool)
(declare-const qualification_requirements_met Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const required_documents_submitted Bool)
(declare-const violation_correction_and_penalty Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and approved_by_authority
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_covered
        has_practice_license)))

; [insurance:relevant_insurance_covered] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= relevant_insurance_covered
   (and agent_type
        liability_insurance_covered
        (not guarantee_insurance_covered))))

; [insurance:minimum_guarantee_deposit] 保證金及相關保險最低金額由主管機關依經營業務範圍及規模定之
(assert (= minimum_guarantee_deposit authority_defined_minimum_amount))

; [insurance:management_rules_compliance] 遵守主管機關定之管理規則，包括資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務與業務管理、教育訓練、廢止許可及其他事項
(assert (= management_rules_compliance
   (and qualification_requirements_met
        application_conditions_met
        application_procedures_followed
        required_documents_submitted
        board_supervisor_manager_qualifications_met
        dismissal_reasons_not_met
        branch_establishment_conditions_met
        financial_and_business_management_compliant
        education_and_training_compliant
        license_revocation_procedures_compliant
        other_mandatory_requirements_compliant)))

; [insurance:bank_authority_approval] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_authority_approval
   (and bank_approved (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance:broker_duties] 保險經紀人應以善良管理人注意義務洽訂保險契約或提供服務，並負忠實義務
(assert (= broker_duties_complied (and duty_of_care_met duty_of_loyalty_met)))

; [insurance:broker_report_and_fee_disclosure] 保險經紀人洽訂保險契約前，於主管機關指定範圍內主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (let ((a!1 (and written_analysis_report_provided
                (or fee_standard_disclosed (not (= fee_charged 1.0))))))
  (= broker_report_and_fee_disclosure_compliant a!1)))

; [insurance:violation_correction_and_penalty] 違反管理規則財務或業務管理規定、保險經紀人義務或相關準用規定者，應限期改正或處罰，情節重大者廢止許可並註銷執業證照
(assert (= violation_correction_and_penalty
   (or (not broker_duties_complied)
       (not management_rules_compliance)
       (not bank_authority_approval))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則、保險經紀人義務或銀行未依規定經營時處罰
(assert (= penalty
   (or (not broker_duties_complied)
       (not bank_authority_approval)
       (not management_rules_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approved_by_authority false))
(assert (= guarantee_deposit_amount 0))
(assert (= minimum_guarantee_deposit 1000000))
(assert (= relevant_insurance_covered false))
(assert (= has_practice_license false))
(assert (= agent_type false))
(assert (= application_conditions_met false))
(assert (= application_procedures_followed false))
(assert (= bank_approved true))
(assert (= bank_operate_as_agent true))
(assert (= bank_operate_as_broker false))
(assert (= bank_authority_approval false))
(assert (= board_supervisor_manager_qualifications_met true))
(assert (= branch_establishment_conditions_met true))
(assert (= broker_duties_complied true))
(assert (= broker_report_and_fee_disclosure_compliant true))
(assert (= dismissal_reasons_not_met true))
(assert (= duty_of_care_met true))
(assert (= duty_of_loyalty_met true))
(assert (= education_and_training_compliant true))
(assert (= fee_charged 1))
(assert (= fee_standard_disclosed true))
(assert (= financial_and_business_management_compliant true))
(assert (= guarantee_insurance_covered false))
(assert (= liability_insurance_covered false))
(assert (= license_and_guarantee_compliance false))
(assert (= license_revocation_procedures_compliant true))
(assert (= management_rules_compliance false))
(assert (= other_mandatory_requirements_compliant true))
(assert (= penalty true))
(assert (= qualification_requirements_met true))
(assert (= required_documents_submitted true))
(assert (= violation_correction_and_penalty true))
(assert (= written_analysis_report_provided true))

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
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
