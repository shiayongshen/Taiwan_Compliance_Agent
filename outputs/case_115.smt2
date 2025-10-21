; SMT2 file generated from compliance case automatic
; Case ID: case_115
; Generated at: 2025-10-21T21:26:26.796176
;
; This file can be executed with Z3:
;   z3 case_115.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent Bool)
(declare-const applicant_email Bool)
(declare-const applicant_mobile_phone Bool)
(declare-const applicant_other_contact Bool)
(declare-const approved_by_authority Bool)
(declare-const authority_set_management_rules Bool)
(declare-const authority_set_minimum_amount Real)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_for_agent_or_broker Bool)
(declare-const broker Bool)
(declare-const broker_charge_fee Real)
(declare-const broker_company_shareholding_in_insurer Real)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_disclose_main_content_and_rights Bool)
(declare-const broker_disclose_shareholding_info Bool)
(declare-const broker_disclose_shareholding_info_before_contract Bool)
(declare-const broker_document_retention Bool)
(declare-const broker_documents_retained Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_duty_of_care_and_fidelity_compliance Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_exercise_fidelity Bool)
(declare-const broker_internal_operation_compliance Bool)
(declare-const broker_maintain_client_interest Bool)
(declare-const broker_obtain_contact_info_for_e_policy Bool)
(declare-const broker_provide_written_analysis_report_and_disclose_fee Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_understand_client_and_provide_report_before_contract Bool)
(declare-const broker_understand_client_info Bool)
(declare-const comply_with_laws_and_regulations Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const insurance_policy_is_electronic Bool)
(declare-const insurance_type_guarantee Bool)
(declare-const insurance_type_responsibility Bool)
(declare-const insured_email Bool)
(declare-const insured_mobile_phone Bool)
(declare-const insured_other_contact Bool)
(declare-const insurer_shareholding_in_broker_company Real)
(declare-const internal_operation_rules_established Bool)
(declare-const internal_operation_rules_executed Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_issued Bool)
(declare-const management_rules_set_by_authority Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const minimum_guarantee_deposit_and_insurance_amount_set_by_authority Bool)
(declare-const notary Bool)
(declare-const penalty Bool)
(declare-const protect_senior_consumer_rights Bool)
(declare-const provide_contact_to_insurer Bool)
(declare-const relevant_insurance_subscribed Bool)
(declare-const relevant_insurance_type_compliance Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_related_regulations Bool)
(declare-const violation_financial_or_business_management_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and approved_by_authority
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_subscribed
        license_issued)))

; [insurance:relevant_insurance_type_compliance] 相關保險類型依身份區分：代理人、公證人為責任保險；經紀人為責任保險及保證保險
(assert (= relevant_insurance_type_compliance
   (or (and agent insurance_type_responsibility)
       (and broker insurance_type_responsibility insurance_type_guarantee)
       (and notary insurance_type_responsibility))))

; [insurance:minimum_guarantee_deposit_and_insurance_amount_set_by_authority] 主管機關依經營及執行業務範圍及規模定最低保證金及保險金額
(assert (= minimum_guarantee_deposit_and_insurance_amount_set_by_authority
   (= authority_set_minimum_amount 1.0)))

; [insurance:management_rules_set_by_authority] 主管機關定管理規則涵蓋資格、申請、程序、文件、董事監察人經理人資格、解任、分支機構、財務業務管理、教育訓練、廢止許可及其他事項
(assert (= management_rules_set_by_authority authority_set_management_rules))

; [insurance:bank_permission_for_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或經紀人業務，並分別準用相關規定
(assert (= bank_permission_for_agent_or_broker
   (and bank_approved_by_authority
        (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_exercise_fidelity)))

; [insurance:broker_provide_written_analysis_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (let ((a!1 (and broker_provide_written_report
                (or (not (= broker_charge_fee 1.0))
                    broker_disclose_fee_standard))))
  (= broker_provide_written_analysis_report_and_disclose_fee a!1)))

; [insurance:violation_financial_or_business_management_rules] 違反財務或業務管理規定或相關規定者，應限期改正或處罰
(assert (= violation_financial_or_business_management_rules
   (or violate_related_regulations
       violate_business_management_rules
       violate_financial_management_rules)))

; [insurance:broker_duty_of_care_and_fidelity_compliance] 經紀人執行或經營業務時盡善良管理人注意及忠實義務，維護被保險人利益並充分揭露資訊
(assert (= broker_duty_of_care_and_fidelity_compliance
   (and broker_exercise_duty_of_care
        broker_exercise_fidelity
        broker_maintain_client_interest
        broker_disclose_main_content_and_rights)))

; [insurance:broker_document_retention] 經紀人及銀行應留存相關文件備查
(assert (= broker_document_retention broker_documents_retained))

; [insurance:broker_obtain_contact_info_for_e_policy] 招攬電子保單業務時，應取得要保人及被保險人聯絡方式並提供保險人
(assert (= broker_obtain_contact_info_for_e_policy
   (or (not insurance_policy_is_electronic)
       (and (or applicant_email applicant_mobile_phone applicant_other_contact)
            (or insured_other_contact insured_mobile_phone insured_email)
            provide_contact_to_insurer))))

; [insurance:broker_internal_operation_compliance] 經紀人公司及銀行應訂定並落實內部作業規範，確保遵循法令及保障高齡消費者權益
(assert (= broker_internal_operation_compliance
   (and internal_operation_rules_established
        internal_operation_rules_executed
        comply_with_laws_and_regulations
        protect_senior_consumer_rights)))

; [insurance:broker_understand_client_and_provide_report_before_contract] 經紀人洽訂保險契約前應充分瞭解要保人及被保險人基本資料、需求及風險屬性，並依主管機關規定提供書面分析報告及明確告知報酬標準
(assert (let ((a!1 (and broker_understand_client_info
                broker_provide_written_report
                (or (not (= broker_charge_fee 1.0))
                    broker_disclose_fee_standard))))
  (= broker_understand_client_and_provide_report_before_contract a!1)))

; [insurance:broker_disclose_shareholding_info_before_contract] 經紀人於洽訂保險契約前應揭露與保險公司持股超過10%之資訊
(assert (let ((a!1 (not (or (not (<= broker_company_shareholding_in_insurer 10.0))
                    (not (<= insurer_shareholding_in_broker_company 10.0))))))
  (= broker_disclose_shareholding_info_before_contract
     (or broker_disclose_shareholding_info a!1))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險、執業證照規定或違反財務、業務管理規定，或違反善良管理人及忠實義務，或未依規定提供書面報告及揭露資訊時處罰
(assert (= penalty
   (or (not management_rules_set_by_authority)
       (not broker_internal_operation_compliance)
       (not broker_provide_written_analysis_report_and_disclose_fee)
       (not broker_understand_client_and_provide_report_before_contract)
       (not broker_disclose_shareholding_info_before_contract)
       (not license_and_guarantee_compliance)
       (not broker_obtain_contact_info_for_e_policy)
       violation_financial_or_business_management_rules
       (not broker_document_retention)
       (not broker_duty_of_care_and_fidelity_compliance)
       (not relevant_insurance_type_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent false))
(assert (= broker true))
(assert (= approved_by_authority true))
(assert (= guarantee_deposit_amount 500000))
(assert (= minimum_guarantee_deposit 500000))
(assert (= relevant_insurance_subscribed true))
(assert (= insurance_type_responsibility true))
(assert (= insurance_type_guarantee true))
(assert (= license_issued true))
(assert (= management_rules_set_by_authority true))
(assert (= violate_financial_management_rules false))
(assert (= violate_business_management_rules true))
(assert (= violate_related_regulations false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_exercise_fidelity false))
(assert (= broker_maintain_client_interest false))
(assert (= broker_disclose_main_content_and_rights false))
(assert (= broker_provide_written_report true))
(assert (= broker_charge_fee 0))
(assert (= broker_disclose_fee_standard true))
(assert (= broker_documents_retained true))
(assert (= broker_document_retention true))
(assert (= insurance_policy_is_electronic false))
(assert (= applicant_mobile_phone false))
(assert (= applicant_email false))
(assert (= applicant_other_contact false))
(assert (= insured_mobile_phone false))
(assert (= insured_email false))
(assert (= insured_other_contact false))
(assert (= provide_contact_to_insurer false))
(assert (= internal_operation_rules_established true))
(assert (= internal_operation_rules_executed false))
(assert (= comply_with_laws_and_regulations false))
(assert (= protect_senior_consumer_rights true))
(assert (= broker_understand_client_info true))
(assert (= broker_understand_client_and_provide_report_before_contract true))
(assert (= broker_provide_written_analysis_report_and_disclose_fee true))
(assert (= broker_disclose_shareholding_info_before_contract true))
(assert (= broker_company_shareholding_in_insurer 0))
(assert (= insurer_shareholding_in_broker_company 0))
(assert (= broker_disclose_shareholding_info true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 57
; Total facts: 42
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
