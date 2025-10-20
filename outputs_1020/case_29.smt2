; SMT2 file generated from compliance case automatic
; Case ID: case_29
; Generated at: 2025-10-19T05:54:03.824984
;
; This file can be executed with Z3:
;   z3 case_29.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_not_permitted_without_license Bool)
(declare-const agent_confirm_documents_correctness Bool)
(declare-const agent_required_documents_life_insurance Bool)
(declare-const agent_required_documents_property_insurance Bool)
(declare-const agent_understand_client_needs_and_suitability Bool)
(declare-const bank_license_permitted Bool)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permitted_to_operate_agent_or_broker Bool)
(declare-const broker_before_contract Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_disclose_shareholding_info Bool)
(declare-const broker_document_retention Bool)
(declare-const broker_documents_retained Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_duty_of_care_and_fidelity_executed Bool)
(declare-const broker_duty_of_care_and_fidelity_management_rule_33 Bool)
(declare-const broker_duty_of_fidelity Bool)
(declare-const broker_internal_operation_compliance Bool)
(declare-const broker_obtain_contact_info_for_e_policy Bool)
(declare-const broker_provide_written_analysis_report Bool)
(declare-const broker_provide_written_analysis_report_management_rule_33 Bool)
(declare-const broker_required_documents_life_insurance Bool)
(declare-const broker_required_documents_property_insurance Bool)
(declare-const broker_understand_client_info Bool)
(declare-const broker_understand_client_needs_and_suitability Bool)
(declare-const client_needs_and_suitability_confirmed Bool)
(declare-const contact_info_obtained_and_provided Bool)
(declare-const deposit_guarantee Bool)
(declare-const documents_correctness_confirmed Bool)
(declare-const exempted_by_authority Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const insurance_policy_electronic Bool)
(declare-const insurance_policy_subscribed Bool)
(declare-const insurance_policy_type_correct Bool)
(declare-const internal_operation_compliant Bool)
(declare-const internal_rules_compliance Bool)
(declare-const internal_rules_followed Bool)
(declare-const is_agent_or_notary Bool)
(declare-const is_broker Bool)
(declare-const liability_insurance Bool)
(declare-const license_permitted Bool)
(declare-const life_insurance_documents_complete Bool)
(declare-const penalty Bool)
(declare-const property_insurance_documents_complete Bool)
(declare-const shareholding_exceeds_10_percent Bool)
(declare-const shareholding_info_disclosed Bool)
(declare-const subscribed_policy_type Bool)
(declare-const subscribed_policy_type_guarantee Bool)
(declare-const subscribed_policy_type_liability Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_related_regulations Bool)
(declare-const violation_financial_or_business_management_rules Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_not_permitted_without_license] 保險代理人、經紀人、公證人未經主管機關許可、未繳存保證金或未投保相關保險，不得經營或執行業務
(assert (= agent_broker_not_permitted_without_license
   (or (not deposit_guarantee)
       (not insurance_policy_subscribed)
       (not license_permitted))))

; [insurance:insurance_policy_type_correct] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= insurance_policy_type_correct
   (and (or (not is_agent_or_notary)
            (= subscribed_policy_type liability_insurance))
        (or (not is_broker)
            (and subscribed_policy_type_liability
                 subscribed_policy_type_guarantee)))))

; [insurance:internal_rules_compliance] 遵守主管機關定之資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他應遵行事項
(assert (= internal_rules_compliance internal_rules_followed))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_operate_agent_or_broker
   (and bank_license_permitted (or bank_operate_agent bank_operate_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_duty_of_care broker_duty_of_fidelity)))

; [insurance:broker_provide_written_analysis_report] 保險經紀人於主管機關指定範圍內洽訂保險契約前，主動提供書面分析報告
(assert (= broker_provide_written_analysis_report
   (or (not broker_before_contract) written_analysis_report_provided)))

; [insurance:broker_disclose_fee_standard] 保險經紀人向要保人或被保險人收取報酬者，應明確告知報酬收取標準
(assert (= broker_disclose_fee_standard
   (or fee_standard_disclosed (not broker_charge_fee))))

; [insurance:violation_financial_or_business_management_rules] 違反財務或業務管理規定或相關規定者，應限期改正或處罰
(assert (= violation_financial_or_business_management_rules
   (or violate_business_management_rules
       violate_related_regulations
       violate_financial_management_rules)))

; [insurance:broker_duty_of_care_and_fidelity_management_rule_33] 經紀人應盡善良管理人注意及忠實義務，維護被保險人利益，充分說明及揭露資訊
(assert (= broker_duty_of_care_and_fidelity_management_rule_33
   broker_duty_of_care_and_fidelity_executed))

; [insurance:broker_document_retention] 經紀人應將有關文件留存建檔備查
(assert (= broker_document_retention broker_documents_retained))

; [insurance:broker_obtain_contact_info_for_e_policy] 招攬保險業務以電子保單出單者，應取得要保人及被保險人聯絡方式並提供保險人
(assert (= broker_obtain_contact_info_for_e_policy
   (or (not insurance_policy_electronic) contact_info_obtained_and_provided)))

; [insurance:broker_internal_operation_compliance] 經紀人公司及銀行應訂定內部作業規範並落實執行，包含保障高齡消費者投保權益規定
(assert (= broker_internal_operation_compliance internal_operation_compliant))

; [insurance:broker_provide_written_analysis_report_management_rule_33] 經紀人洽訂保險契約前應充分瞭解要保人及被保險人資料並依規定提供書面分析報告及告知報酬標準
(assert (= broker_provide_written_analysis_report_management_rule_33
   (and broker_understand_client_info
        written_analysis_report_provided
        (or (not broker_charge_fee) fee_standard_disclosed))))

; [insurance:broker_disclose_shareholding_info] 經紀人於洽訂保險契約前應向要保人揭露持股超過10%之資訊
(assert (= broker_disclose_shareholding_info
   (or (not shareholding_exceeds_10_percent) shareholding_info_disclosed)))

; [insurance:broker_understand_client_needs_and_suitability] 經紀人應確實瞭解要保人需求及商品或服務適合度，並於文件簽章或電子方式確認
(assert (= broker_understand_client_needs_and_suitability
   (or exempted_by_authority client_needs_and_suitability_confirmed)))

; [insurance:broker_required_documents_property_insurance] 財產保險相關文件應包含主管機關指定之六類文件
(assert broker_required_documents_property_insurance)

; [insurance:broker_required_documents_life_insurance] 人身保險相關文件應包含主管機關指定之六類文件
(assert broker_required_documents_life_insurance)

; [insurance:agent_understand_client_needs_and_suitability] 代理人應確實瞭解要保人需求及商品或服務適合度，並於文件簽章或電子方式確認
(assert (= agent_understand_client_needs_and_suitability
   (or exempted_by_authority client_needs_and_suitability_confirmed)))

; [insurance:agent_required_documents_property_insurance] 代理人財產保險相關文件應包含主管機關指定之五類文件
(assert (= agent_required_documents_property_insurance
   property_insurance_documents_complete))

; [insurance:agent_required_documents_life_insurance] 代理人人身保險相關文件應包含主管機關指定之五類文件
(assert (= agent_required_documents_life_insurance life_insurance_documents_complete))

; [insurance:agent_confirm_documents_correctness] 代理人公司及銀行代收保費或辦理核保、理賠等業務時，應確認執行業務相關文件正確性
(assert (= agent_confirm_documents_correctness documents_correctness_confirmed))

; [meta:penalty_default_false] 預設不處罰
(assert (or (not broker_internal_operation_compliance)
    (not broker_document_retention)
    (not agent_understand_client_needs_and_suitability)
    (not internal_rules_compliance)
    (not broker_obtain_contact_info_for_e_policy)
    (not broker_provide_written_analysis_report)
    (not broker_disclose_shareholding_info)
    violation_financial_or_business_management_rules
    (not broker_understand_client_needs_and_suitability)
    (not agent_required_documents_property_insurance)
    agent_broker_not_permitted_without_license
    (not broker_disclose_fee_standard)
    (not penalty)
    (not agent_confirm_documents_correctness)
    (not broker_duty_of_care_and_fidelity)
    (not agent_required_documents_life_insurance)
    (not broker_required_documents_life_insurance)
    (not broker_required_documents_property_insurance)))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險，或違反財務業務管理規定，或未遵守管理規則，或未盡善良管理人及忠實義務，或未提供書面分析報告，或未明確告知報酬標準，或未留存文件，或未取得聯絡方式，或未訂定內部作業規範，或未揭露持股資訊，或未確實瞭解需求及適合度，或文件不完整或不正確時處罰
(assert (= penalty
   (or (not broker_disclose_fee_standard)
       (not broker_document_retention)
       (not broker_obtain_contact_info_for_e_policy)
       (not broker_internal_operation_compliance)
       (not broker_disclose_shareholding_info)
       (not broker_understand_client_needs_and_suitability)
       violation_financial_or_business_management_rules
       (not broker_required_documents_property_insurance)
       (not broker_required_documents_life_insurance)
       agent_broker_not_permitted_without_license
       (not agent_understand_client_needs_and_suitability)
       (not agent_required_documents_property_insurance)
       (not agent_required_documents_life_insurance)
       (not broker_provide_written_analysis_report)
       (not agent_confirm_documents_correctness)
       (not internal_rules_compliance)
       (not broker_duty_of_care_and_fidelity))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= deposit_guarantee false))
(assert (= insurance_policy_subscribed false))
(assert (= internal_rules_followed false))
(assert (= violate_financial_management_rules true))
(assert (= violate_business_management_rules false))
(assert (= violate_related_regulations false))
(assert (= agent_broker_not_permitted_without_license true))
(assert (= internal_rules_compliance false))
(assert (= violation_financial_or_business_management_rules true))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_provide_written_analysis_report false))
(assert (= broker_disclose_fee_standard false))
(assert (= broker_document_retention false))
(assert (= broker_obtain_contact_info_for_e_policy false))
(assert (= broker_internal_operation_compliance false))
(assert (= broker_disclose_shareholding_info false))
(assert (= broker_understand_client_needs_and_suitability false))
(assert (= broker_required_documents_property_insurance false))
(assert (= broker_required_documents_life_insurance false))
(assert (= agent_understand_client_needs_and_suitability false))
(assert (= agent_required_documents_property_insurance false))
(assert (= agent_required_documents_life_insurance false))
(assert (= agent_confirm_documents_correctness false))
(assert (= penalty true))
(assert (= is_agent_or_notary true))
(assert (= is_broker false))
(assert (= broker_duty_of_care false))
(assert (= broker_duty_of_fidelity false))
(assert (= broker_duty_of_care_and_fidelity_executed false))
(assert (= broker_duty_of_care_and_fidelity_management_rule_33 false))
(assert (= broker_documents_retained false))
(assert (= broker_before_contract false))
(assert (= broker_charge_fee false))
(assert (= fee_standard_disclosed false))
(assert (= broker_understand_client_info false))
(assert (= written_analysis_report_provided false))
(assert (= contact_info_obtained_and_provided false))
(assert (= internal_operation_compliant false))
(assert (= shareholding_exceeds_10_percent false))
(assert (= shareholding_info_disclosed false))
(assert (= subscribed_policy_type false))
(assert (= subscribed_policy_type_guarantee false))
(assert (= subscribed_policy_type_liability false))
(assert (= bank_license_permitted false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= bank_permitted_to_operate_agent_or_broker false))
(assert (= exempted_by_authority false))
(assert (= client_needs_and_suitability_confirmed false))
(assert (= life_insurance_documents_complete false))
(assert (= property_insurance_documents_complete false))
(assert (= documents_correctness_confirmed false))
(assert (= broker_provide_written_analysis_report_management_rule_33 false))
(assert (= insurance_policy_electronic false))
(assert (= insurance_policy_type_correct false))
(assert (= liability_insurance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 23
; Total variables: 57
; Total facts: 57
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
