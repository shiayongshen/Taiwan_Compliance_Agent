; SMT2 file generated from compliance case automatic
; Case ID: case_63
; Generated at: 2025-10-19T06:59:43.411501
;
; This file can be executed with Z3:
;   z3 case_63.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_type Bool)
(declare-const application_conditions_met Bool)
(declare-const application_procedures_followed Bool)
(declare-const approved_by_authority Bool)
(declare-const article_163_5_compliance Bool)
(declare-const article_165_1_compliance Bool)
(declare-const authority_defined_minimum_guarantee_deposit Real)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_authority_approval Bool)
(declare-const bank_engages_as_agent Bool)
(declare-const bank_engages_as_broker Bool)
(declare-const board_supervisors_managers_qualifications_met Bool)
(declare-const branch_establishment_conditions_met Bool)
(declare-const broker_charges_fee Bool)
(declare-const broker_duties_complied Bool)
(declare-const broker_provides_report Bool)
(declare-const broker_report_and_fee_disclosure_compliant Bool)
(declare-const dismissal_reasons_absent Bool)
(declare-const duty_of_care_met Bool)
(declare-const duty_of_loyalty_met Bool)
(declare-const education_and_training_compliant Bool)
(declare-const fee_disclosure_made Bool)
(declare-const financial_and_business_management_compliant Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance_covered Bool)
(declare-const liability_insurance_covered Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_issued Bool)
(declare-const license_revocation_procedures_compliant Bool)
(declare-const management_rules_compliance Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const other_compliance_matters_met Bool)
(declare-const penalty Bool)
(declare-const qualification_requirements_met Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const report_within_authority_scope Bool)
(declare-const required_documents_submitted Bool)
(declare-const violation_article_163_5 Bool)
(declare-const violation_article_165_1 Bool)
(declare-const violation_broker_duties Bool)
(declare-const violation_financial_or_business_management Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and approved_by_authority
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_covered
        license_issued)))

; [insurance:relevant_insurance_covered] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= relevant_insurance_covered (and agent_type liability_insurance_covered)))

; [insurance:minimum_guarantee_deposit] 保證金最低金額由主管機關依經營業務範圍及規模定之
(assert (= minimum_guarantee_deposit authority_defined_minimum_guarantee_deposit))

; [insurance:management_rules_compliance] 遵守主管機關定之管理規則，包括資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務與業務管理、教育訓練、廢止許可及其他事項
(assert (= management_rules_compliance
   (and qualification_requirements_met
        application_conditions_met
        application_procedures_followed
        required_documents_submitted
        board_supervisors_managers_qualifications_met
        dismissal_reasons_absent
        branch_establishment_conditions_met
        financial_and_business_management_compliant
        education_and_training_compliant
        license_revocation_procedures_compliant
        other_compliance_matters_met)))

; [insurance:bank_authority_approval] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_authority_approval
   (and bank_approved_by_authority
        (or bank_engages_as_agent bank_engages_as_broker))))

; [insurance:broker_duties] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duties_complied (and duty_of_care_met duty_of_loyalty_met)))

; [insurance:broker_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂契約前，主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (let ((a!1 (or (not broker_provides_report)
               (and report_within_authority_scope
                    (or (not broker_charges_fee) fee_disclosure_made)))))
  (= broker_report_and_fee_disclosure_compliant a!1)))

; [insurance:violation_financial_or_business_management] 違反第163條第四項管理規則中財務或業務管理規定
(assert (not (= financial_and_business_management_compliant
        violation_financial_or_business_management)))

; [insurance:violation_broker_duties] 違反第163條第七項規定
(assert (not (= broker_report_and_fee_disclosure_compliant violation_broker_duties)))

; [insurance:violation_article_165_1] 違反第165條第一項規定
(assert (not (= article_165_1_compliance violation_article_165_1)))

; [insurance:violation_article_163_5] 違反第163條第五項準用規定
(assert (not (= article_163_5_compliance violation_article_163_5)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反財務或業務管理規定、違反經紀人義務、違反第165條第1項或第163條第5項準用規定時處罰
(assert (= penalty
   (or violation_article_163_5
       violation_financial_or_business_management
       violation_article_165_1
       violation_broker_duties)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approved_by_authority true))
(assert (= guarantee_deposit_amount 1000000.0))
(assert (= authority_defined_minimum_guarantee_deposit 1000000.0))
(assert (= liability_insurance_covered true))
(assert (= guarantee_insurance_covered false))
(assert (= license_issued true))
(assert (= agent_type true))
(assert (= qualification_requirements_met true))
(assert (= application_conditions_met true))
(assert (= application_procedures_followed true))
(assert (= required_documents_submitted true))
(assert (= board_supervisors_managers_qualifications_met true))
(assert (= dismissal_reasons_absent true))
(assert (= branch_establishment_conditions_met true))
(assert (= financial_and_business_management_compliant false))
(assert (= education_and_training_compliant true))
(assert (= license_revocation_procedures_compliant true))
(assert (= other_compliance_matters_met true))
(assert (= broker_provides_report false))
(assert (= broker_charges_fee false))
(assert (= fee_disclosure_made false))
(assert (= report_within_authority_scope false))
(assert (= bank_approved_by_authority false))
(assert (= bank_engages_as_agent false))
(assert (= bank_engages_as_broker false))
(assert (= bank_authority_approval false))
(assert (= broker_report_and_fee_disclosure_compliant true))
(assert (= violation_financial_or_business_management true))
(assert (= violation_broker_duties false))
(assert (= article_165_1_compliance true))
(assert (= violation_article_165_1 false))
(assert (= article_163_5_compliance true))
(assert (= violation_article_163_5 false))
(assert (= penalty true))
(assert (= license_and_guarantee_compliance true))
(assert (= management_rules_compliance false))
(assert (= broker_duties_complied false))
(assert (= duty_of_care_met false))
(assert (= duty_of_loyalty_met false))
(assert (= minimum_guarantee_deposit 0.0))
(assert (= relevant_insurance_covered false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 41
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
