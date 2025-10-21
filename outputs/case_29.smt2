; SMT2 file generated from compliance case automatic
; Case ID: case_29
; Generated at: 2025-10-20T23:26:26.640041
;
; This file can be executed with Z3:
;   z3 case_29.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_company_and_bank_document_verification Bool)
(declare-const agent_documents_compliant Bool)
(declare-const agent_license_and_guarantee_ok Bool)
(declare-const agent_required_documents_compliance Bool)
(declare-const agent_understanding_and_document_signing Bool)
(declare-const agent_understanding_done Bool)
(declare-const bank_agent_compliance Bool)
(declare-const bank_broker_compliance Bool)
(declare-const bank_permit_and_separate_compliance Bool)
(declare-const bank_permitted Bool)
(declare-const basic_info_understood Bool)
(declare-const broker_duty_management_rules_complied Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_duty_of_care_and_fidelity_management_rules Bool)
(declare-const broker_fidelity_duty Bool)
(declare-const broker_shareholding_disclosure Bool)
(declare-const broker_understanding_and_report_provided Bool)
(declare-const broker_written_report_and_fee_disclosure Bool)
(declare-const contact_email_provided Bool)
(declare-const contact_phone_provided Bool)
(declare-const document_retention_compliance Bool)
(declare-const documents_retained Bool)
(declare-const documents_verified Bool)
(declare-const elderly_protection_included Bool)
(declare-const electronic_policy_contact_info_provided Bool)
(declare-const exempted_by_authority Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosed Bool)
(declare-const guarantee_deposited Bool)
(declare-const insurance_policy_electronic Bool)
(declare-const internal_operation_rules_compliance Bool)
(declare-const internal_operation_rules_followed Bool)
(declare-const internal_operation_rules_include_elderly_protection Bool)
(declare-const internal_rules_compliance Bool)
(declare-const is_agent Bool)
(declare-const is_bond_insurance Bool)
(declare-const is_broker Bool)
(declare-const is_liability_insurance Bool)
(declare-const is_not_agent_broker_or_notary Bool)
(declare-const license_issued Bool)
(declare-const license_permitted Bool)
(declare-const management_rules_complied Bool)
(declare-const penalty Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_ok Bool)
(declare-const shareholding_disclosed Bool)
(declare-const shareholding_over_10_percent Bool)
(declare-const violate_agent_or_broker_rules Bool)
(declare-const violate_broker_duty Bool)
(declare-const violate_finance_or_business_management Bool)
(declare-const violation_agent_or_broker_rules Bool)
(declare-const violation_broker_duty Bool)
(declare-const violation_finance_or_business_management Bool)
(declare-const written_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_guarantee_ok] 保險代理人、經紀人、公證人已取得主管機關許可、繳存保證金並投保相關保險，且領有執業證照
(assert (= agent_license_and_guarantee_ok
   (and license_permitted
        guarantee_deposited
        related_insurance_purchased
        license_issued)))

; [insurance:related_insurance_type_ok] 相關保險類型符合代理人、公證人及經紀人規定
(assert (= related_insurance_type_ok
   (or (and is_agent (not is_bond_insurance) is_liability_insurance)
       (and is_broker is_bond_insurance is_liability_insurance)
       is_not_agent_broker_or_notary)))

; [insurance:internal_rules_compliance] 符合主管機關定之管理規則，包括資格、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務與業務管理、教育訓練、廢止許可及其他應遵行事項
(assert (= internal_rules_compliance management_rules_complied))

; [insurance:bank_permit_and_separate_compliance] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permit_and_separate_compliance
   (and bank_permitted (or bank_agent_compliance bank_broker_compliance))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_duty_of_care broker_fidelity_duty)))

; [insurance:broker_written_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內洽訂保險契約前，主動提供書面分析報告，收取報酬時明確告知報酬標準
(assert (= broker_written_report_and_fee_disclosure
   (and written_report_provided (or fee_disclosed (not fee_charged)))))

; [insurance:violation_finance_or_business_management] 違反財務或業務管理規定
(assert (= violation_finance_or_business_management
   violate_finance_or_business_management))

; [insurance:violation_broker_duty] 違反保險經紀人善良管理人注意義務或忠實義務
(assert (= violation_broker_duty violate_broker_duty))

; [insurance:violation_agent_or_broker_rules] 違反保險代理人或經紀人相關規定
(assert (= violation_agent_or_broker_rules violate_agent_or_broker_rules))

; [insurance:broker_duty_of_care_and_fidelity_management_rules] 經紀人管理規則第33條規定之善良管理人注意義務及忠實義務符合
(assert (= broker_duty_of_care_and_fidelity_management_rules
   broker_duty_management_rules_complied))

; [insurance:document_retention_compliance] 經紀人及銀行應留存文件備查
(assert (= document_retention_compliance documents_retained))

; [insurance:electronic_policy_contact_info_provided] 保險人以電子保單出單時，經紀人應取得要保人及被保險人聯絡方式並提供保險人
(assert (= electronic_policy_contact_info_provided
   (or (not insurance_policy_electronic)
       (and contact_phone_provided contact_email_provided))))

; [insurance:internal_operation_rules_compliance] 經紀人公司及銀行依法令及主管機關規定訂定內部作業規範並落實執行
(assert (= internal_operation_rules_compliance internal_operation_rules_followed))

; [insurance:internal_operation_rules_include_elderly_protection] 內部作業規範包含保障65歲以上高齡消費者投保權益相關規定
(assert (= internal_operation_rules_include_elderly_protection
   elderly_protection_included))

; [insurance:broker_understanding_and_report_provided] 經紀人充分瞭解要保人及被保險人基本資料、需求及風險屬性，並依主管機關規定主動提供書面分析報告及報酬收取標準
(assert (= broker_understanding_and_report_provided
   (and basic_info_understood
        written_report_provided
        (or fee_disclosed (not fee_charged)))))

; [insurance:broker_shareholding_disclosure] 經紀人於洽訂保險契約前揭露與保險公司持股超過10%之資訊
(assert (= broker_shareholding_disclosure
   (or (not shareholding_over_10_percent) shareholding_disclosed)))

; [insurance:agent_understanding_and_document_signing] 代理人確實瞭解要保人需求及商品適合度，並於文件簽章或其他電子方式完成
(assert (= agent_understanding_and_document_signing
   (or agent_understanding_done exempted_by_authority)))

; [insurance:agent_required_documents_compliance] 代理人相關文件符合主管機關指定範圍
(assert (= agent_required_documents_compliance agent_documents_compliant))

; [insurance:agent_company_and_bank_document_verification] 代理人公司及銀行代收保費或辦理核保、理賠等業務時，確認執行業務文件正確性
(assert (= agent_company_and_bank_document_verification documents_verified))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險投保、執業證照、管理規則、善良管理人義務、書面報告義務、文件留存、內部作業規範、揭露義務、文件簽章或文件確認等任一規定時處罰
(assert (= penalty
   (or (not electronic_policy_contact_info_provided)
       (not internal_rules_compliance)
       (not related_insurance_type_ok)
       (not internal_operation_rules_include_elderly_protection)
       (not broker_written_report_and_fee_disclosure)
       (not agent_required_documents_compliance)
       (not document_retention_compliance)
       (not broker_understanding_and_report_provided)
       (not agent_license_and_guarantee_ok)
       (not agent_company_and_bank_document_verification)
       (not broker_shareholding_disclosure)
       (not agent_understanding_and_document_signing)
       (not internal_operation_rules_compliance)
       (not broker_duty_of_care_and_fidelity)
       (not bank_permit_and_separate_compliance)
       (not broker_duty_of_care_and_fidelity_management_rules))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= guarantee_deposited false))
(assert (= related_insurance_purchased false))
(assert (= license_issued false))
(assert (= agent_license_and_guarantee_ok false))
(assert (= management_rules_complied false))
(assert (= internal_rules_compliance false))
(assert (= violate_agent_or_broker_rules true))
(assert (= violation_agent_or_broker_rules true))
(assert (= agent_documents_compliant false))
(assert (= agent_required_documents_compliance false))
(assert (= agent_understanding_done false))
(assert (= agent_understanding_and_document_signing false))
(assert (= documents_verified false))
(assert (= agent_company_and_bank_document_verification false))
(assert (= bank_permitted false))
(assert (= bank_agent_compliance false))
(assert (= bank_broker_compliance false))
(assert (= bank_permit_and_separate_compliance false))
(assert (= violate_finance_or_business_management true))
(assert (= violation_finance_or_business_management true))
(assert (= broker_duty_of_care false))
(assert (= broker_fidelity_duty false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_duty_management_rules_complied false))
(assert (= broker_duty_of_care_and_fidelity_management_rules false))
(assert (= violate_broker_duty true))
(assert (= violation_broker_duty true))
(assert (= written_report_provided false))
(assert (= broker_written_report_and_fee_disclosure false))
(assert (= basic_info_understood false))
(assert (= broker_understanding_and_report_provided false))
(assert (= fee_charged false))
(assert (= fee_disclosed false))
(assert (= documents_retained false))
(assert (= document_retention_compliance false))
(assert (= insurance_policy_electronic false))
(assert (= contact_phone_provided false))
(assert (= contact_email_provided false))
(assert (= electronic_policy_contact_info_provided true))
(assert (= internal_operation_rules_followed false))
(assert (= internal_operation_rules_compliance false))
(assert (= elderly_protection_included false))
(assert (= internal_operation_rules_include_elderly_protection false))
(assert (= shareholding_over_10_percent false))
(assert (= shareholding_disclosed false))
(assert (= broker_shareholding_disclosure true))
(assert (= exempted_by_authority false))
(assert (= penalty true))
(assert (= is_agent true))
(assert (= is_bond_insurance false))
(assert (= is_liability_insurance true))
(assert (= related_insurance_type_ok true))
(assert (= is_broker false))
(assert (= is_not_agent_broker_or_notary false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 55
; Total facts: 55
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
