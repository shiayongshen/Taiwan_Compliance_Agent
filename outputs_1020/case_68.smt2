; SMT2 file generated from compliance case automatic
; Case ID: case_68
; Generated at: 2025-10-19T07:07:41.715278
;
; This file can be executed with Z3:
;   z3 case_68.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_and_broker_regulations_applied Bool)
(declare-const agent_type Bool)
(declare-const application_conditions_met Bool)
(declare-const application_procedures_followed Bool)
(declare-const approved_by_authority Bool)
(declare-const article_165_1_compliance Bool)
(declare-const bank_authorization_compliance Bool)
(declare-const bank_authorized Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const board_supervisors_managers_qualifications_met Bool)
(declare-const branch_establishment_conditions_met Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity_duty Bool)
(declare-const broker_in_specified_scope Bool)
(declare-const broker_provide_written_analysis_report Bool)
(declare-const education_and_training_compliant Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const financial_and_business_management_compliant Bool)
(declare-const grounds_for_dismissal_complied Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance_covered Bool)
(declare-const liability_insurance_covered Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_issued Bool)
(declare-const license_revocation_procedures_complied Bool)
(declare-const management_rules_compliance Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const other_mandatory_requirements_complied Bool)
(declare-const penalty Bool)
(declare-const qualification_requirements_met Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const required_documents_submitted Bool)
(declare-const violation_article_165_or_163_5 Bool)
(declare-const violation_broker_duty Bool)
(declare-const violation_financial_or_business_management Bool)
(declare-const written_analysis_report_provided Bool)

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

; [insurance:management_rules_compliance] 遵守主管機關定之管理規則，包括資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務與業務管理、教育訓練、廢止許可及其他事項
(assert (= management_rules_compliance
   (and qualification_requirements_met
        application_conditions_met
        application_procedures_followed
        required_documents_submitted
        board_supervisors_managers_qualifications_met
        grounds_for_dismissal_complied
        branch_establishment_conditions_met
        financial_and_business_management_compliant
        education_and_training_compliant
        license_revocation_procedures_complied
        other_mandatory_requirements_complied)))

; [insurance:bank_authorization_compliance] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_authorization_compliance
   (and bank_authorized
        (or bank_operate_as_agent bank_operate_as_broker)
        agent_and_broker_regulations_applied)))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity_duty)))

; [insurance:broker_provide_written_analysis_report] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告
(assert (= broker_provide_written_analysis_report
   (or written_analysis_report_provided (not broker_in_specified_scope))))

; [insurance:broker_disclose_fee_standard] 保險經紀人向要保人或被保險人收取報酬者，應明確告知報酬收取標準
(assert (= broker_disclose_fee_standard
   (or fee_standard_disclosed (not broker_charge_fee))))

; [insurance:violation_financial_or_business_management] 違反第一百六十三條第四項管理規則中有關財務或業務管理之規定
(assert (not (= financial_and_business_management_compliant
        violation_financial_or_business_management)))

; [insurance:violation_broker_duty] 違反第一百六十三條第七項規定（保險經紀人義務）
(assert (not (= broker_duty_of_care_and_fidelity violation_broker_duty)))

; [insurance:violation_article_165_or_163_5] 違反第一百六十五條第一項或第一百六十三條第五項準用規定
(assert (not (= article_165_1_compliance violation_article_165_or_163_5)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反財務或業務管理規定、保險經紀人義務或相關規定時處罰
(assert (= penalty
   (or violation_financial_or_business_management
       violation_broker_duty
       violation_article_165_or_163_5)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approved_by_authority true))
(assert (= guarantee_deposit_amount 0.0))
(assert (= minimum_guarantee_deposit 0.0))
(assert (= relevant_insurance_covered false))
(assert (= license_issued true))
(assert (= agent_and_broker_regulations_applied true))
(assert (= agent_type true))
(assert (= application_conditions_met true))
(assert (= application_procedures_followed true))
(assert (= required_documents_submitted true))
(assert (= board_supervisors_managers_qualifications_met true))
(assert (= grounds_for_dismissal_complied true))
(assert (= branch_establishment_conditions_met true))
(assert (= financial_and_business_management_compliant false))
(assert (= education_and_training_compliant true))
(assert (= license_revocation_procedures_complied true))
(assert (= other_mandatory_requirements_complied true))
(assert (= bank_authorized true))
(assert (= bank_operate_as_agent true))
(assert (= bank_operate_as_broker false))
(assert (= violation_financial_or_business_management true))
(assert (= violation_broker_duty false))
(assert (= violation_article_165_or_163_5 true))
(assert (= penalty true))
(assert (= broker_charge_fee false))
(assert (= broker_disclose_fee_standard true))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= broker_exercise_duty_of_care true))
(assert (= broker_fulfill_fidelity_duty true))
(assert (= broker_in_specified_scope false))
(assert (= written_analysis_report_provided true))
(assert (= liability_insurance_covered false))
(assert (= guarantee_insurance_covered false))
(assert (= article_165_1_compliance false))
(assert (= bank_authorization_compliance false))
(assert (= broker_provide_written_analysis_report false))
(assert (= fee_standard_disclosed false))
(assert (= license_and_guarantee_compliance false))
(assert (= management_rules_compliance false))
(assert (= qualification_requirements_met false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 40
; Total facts: 40
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
