; SMT2 file generated from compliance case automatic
; Case ID: case_278
; Generated at: 2025-10-21T06:13:49.777155
;
; This file can be executed with Z3:
;   z3 case_278.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_scope_in_allowed_bank_business Bool)
(declare-const business_scope_in_allowed_futures_business Bool)
(declare-const business_scope_in_allowed_insurance_business Bool)
(declare-const business_scope_in_allowed_securities_business Bool)
(declare-const confidentiality_agreement_established Bool)
(declare-const confidentiality_measures_disclosed Bool)
(declare-const confidentiality_measures_established Bool)
(declare-const contract_data_usage_terms_disclose_subsidiary Bool)
(declare-const contract_data_usage_terms_set Bool)
(declare-const contract_disclosure_and_reporting Bool)
(declare-const contract_important_content_disclosed Bool)
(declare-const contract_protection_mechanism_annotated Bool)
(declare-const contract_reported_to_authority Bool)
(declare-const contract_transaction_risk_disclosed Bool)
(declare-const contract_website_announcement_done Bool)
(declare-const customer_consent_for_data_usage Bool)
(declare-const customer_contract_data_usage_terms Bool)
(declare-const customer_data_access_limited_to_authorized Bool)
(declare-const customer_data_change_method_disclosed Bool)
(declare-const customer_data_change_method_sent_by_email Bool)
(declare-const customer_data_change_method_sent_by_letter Bool)
(declare-const customer_data_confidentiality_and_security Bool)
(declare-const customer_data_disclosed_or_referred Bool)
(declare-const customer_data_securely_stored Bool)
(declare-const customer_database_established Bool)
(declare-const customer_notice_and_stop_data_use Bool)
(declare-const customer_opt_out_method_disclosed Bool)
(declare-const customer_opt_out_method_sent_by_email Bool)
(declare-const customer_opt_out_method_sent_by_letter Bool)
(declare-const customer_stop_data_use_notice_received Bool)
(declare-const data_classification_and_usage_scope_disclosed Bool)
(declare-const data_collection_method_disclosed Bool)
(declare-const data_disclosed_to_third_party Bool)
(declare-const data_disclosure_targets_disclosed Bool)
(declare-const data_security_and_protection_disclosed Bool)
(declare-const data_storage_and_custody_disclosed Bool)
(declare-const data_usage_purpose_disclosed Bool)
(declare-const data_use_restricted Bool)
(declare-const data_use_subsidiary_names_disclosed Bool)
(declare-const dedicated_unit_or_personnel_assigned Bool)
(declare-const disclosure_announced_on_website Bool)
(declare-const disclosure_measures_content Bool)
(declare-const disclosure_measures_written_or_email Bool)
(declare-const disclosure_of_data_use_and_measures Bool)
(declare-const disclosure_posted_in_office Bool)
(declare-const disclosure_sent_by_email Bool)
(declare-const disclosure_sent_by_letter Bool)
(declare-const fhc_joint_marketing_approved Bool)
(declare-const fhc_joint_marketing_customer_identifiable Bool)
(declare-const fhc_joint_marketing_no_customer_harm Bool)
(declare-const fhc_joint_marketing_personal_data_protection_compliant Bool)
(declare-const fhc_subsidiary_change_announced Bool)
(declare-const joint_marketing_business_scope_ok Bool)
(declare-const marketing_purpose_data_collected Bool)
(declare-const marketing_purpose_data_used_outside Bool)
(declare-const neq_customer_address Bool)
(declare-const neq_customer_name Bool)
(declare-const organization_change_announcement Bool)
(declare-const penalty Bool)
(declare-const subsidiaries_stop_data_use_immediately Bool)
(declare-const subsidiary_customer_data_marketing_use_restriction Bool)
(declare-const subsidiary_data_transfer_and_confidentiality_agreement Bool)
(declare-const subsidiary_joint_marketing_approval Bool)
(declare-const subsidiary_joint_marketing_customer_identifiable Bool)
(declare-const subsidiary_joint_marketing_no_customer_harm Bool)
(declare-const subsidiary_joint_marketing_personal_data_protection Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:subsidiary_joint_marketing_approval] 金融控股公司子公司間共同行銷須事先申請核准
(assert (= subsidiary_joint_marketing_approval fhc_joint_marketing_approved))

; [fhc:subsidiary_joint_marketing_no_customer_harm] 金融控股公司子公司間共同行銷不得損害客戶權益
(assert (= subsidiary_joint_marketing_no_customer_harm
   fhc_joint_marketing_no_customer_harm))

; [fhc:subsidiary_joint_marketing_customer_identifiable] 子公司間共同行銷應使客戶易於識別
(assert (= subsidiary_joint_marketing_customer_identifiable
   fhc_joint_marketing_customer_identifiable))

; [fhc:subsidiary_joint_marketing_personal_data_protection] 子公司間共同行銷蒐集、處理及利用客戶個人資料應依個資法規定
(assert (= subsidiary_joint_marketing_personal_data_protection
   fhc_joint_marketing_personal_data_protection_compliant))

; [fhc:contract_disclosure_and_reporting] 子公司與客戶簽約應揭露重要內容及交易風險並報備主管機關
(assert (= contract_disclosure_and_reporting
   (and contract_important_content_disclosed
        contract_transaction_risk_disclosed
        contract_protection_mechanism_annotated
        contract_reported_to_authority
        contract_website_announcement_done)))

; [fhc:subsidiary_customer_data_marketing_use_restriction] 子公司間交互運用客戶資料蒐集不得為行銷目的外之利用，且揭露轉介資料限制
(assert (let ((a!1 (and (or (not marketing_purpose_data_collected)
                    (not marketing_purpose_data_used_outside))
                (or (not customer_data_disclosed_or_referred)
                    (not (or neq_customer_address neq_customer_name))))))
  (= subsidiary_customer_data_marketing_use_restriction a!1)))

; [fhc:customer_contract_data_usage_terms] 客戶契約應訂定資料使用條款並取得客戶同意
(assert (= customer_contract_data_usage_terms
   (and contract_data_usage_terms_set
        customer_consent_for_data_usage
        contract_data_usage_terms_disclose_subsidiary)))

; [fhc:organization_change_announcement] 金融控股公司組織異動子公司增減應公告於公司及子公司網站
(assert (= organization_change_announcement fhc_subsidiary_change_announced))

; [fhc:customer_notice_and_stop_data_use] 客戶得隨時要求停止交互運用資料，子公司應立即停止使用
(assert (= customer_notice_and_stop_data_use
   (or subsidiaries_stop_data_use_immediately
       (not customer_stop_data_use_notice_received))))

; [fhc:customer_data_confidentiality_and_security] 子公司應建立保密措施及安全管理，設置專責單位負責客戶資料管理
(assert (= customer_data_confidentiality_and_security
   (and confidentiality_measures_established
        dedicated_unit_or_personnel_assigned
        customer_database_established
        customer_data_securely_stored
        customer_data_access_limited_to_authorized)))

; [fhc:subsidiary_data_transfer_and_confidentiality_agreement] 子公司間交付客戶資料應訂定保密協定並限制用途，不得再向第三人揭露
(assert (= subsidiary_data_transfer_and_confidentiality_agreement
   (and confidentiality_agreement_established
        data_use_restricted
        (not data_disclosed_to_third_party))))

; [fhc:disclosure_of_data_use_and_measures] 金融控股公司及子公司應揭露交互運用客戶資料子公司名稱及保密措施並公告
(assert (= disclosure_of_data_use_and_measures
   (and data_use_subsidiary_names_disclosed
        confidentiality_measures_disclosed
        disclosure_announced_on_website
        (or disclosure_sent_by_letter
            disclosure_sent_by_email
            disclosure_posted_in_office))))

; [fhc:disclosure_measures_content] 揭露保密措施內容應包含資料蒐集、儲存、保護、分類、利用目的、揭露對象、變更及退出方式
(assert (= disclosure_measures_content
   (and data_collection_method_disclosed
        data_storage_and_custody_disclosed
        data_security_and_protection_disclosed
        data_classification_and_usage_scope_disclosed
        data_usage_purpose_disclosed
        data_disclosure_targets_disclosed
        customer_data_change_method_disclosed
        customer_opt_out_method_disclosed)))

; [fhc:disclosure_measures_written_or_email] 揭露保密措施第七及第八款事項應以書面或電子郵件方式為之
(assert (= disclosure_measures_written_or_email
   (and (or customer_data_change_method_sent_by_email
            customer_data_change_method_sent_by_letter)
        (or customer_opt_out_method_sent_by_email
            customer_opt_out_method_sent_by_letter))))

; [fhc:joint_marketing_business_scope] 子公司間共同行銷可從事之業務範圍
(assert (= joint_marketing_business_scope_ok
   (or business_scope_in_allowed_bank_business
       business_scope_in_allowed_insurance_business
       business_scope_in_allowed_securities_business
       business_scope_in_allowed_futures_business)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法第43條及相關規定時處罰
(assert (= penalty
   (or (not disclosure_of_data_use_and_measures)
       (not customer_contract_data_usage_terms)
       (not joint_marketing_business_scope_ok)
       (not subsidiary_customer_data_marketing_use_restriction)
       (not customer_notice_and_stop_data_use)
       (not organization_change_announcement)
       (not disclosure_measures_written_or_email)
       (not subsidiary_data_transfer_and_confidentiality_agreement)
       (not subsidiary_joint_marketing_customer_identifiable)
       (not customer_data_confidentiality_and_security)
       (not disclosure_measures_content)
       (not subsidiary_joint_marketing_personal_data_protection)
       (not contract_disclosure_and_reporting)
       (not subsidiary_joint_marketing_approval)
       (not subsidiary_joint_marketing_no_customer_harm))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fhc_joint_marketing_approved false))
(assert (= subsidiary_joint_marketing_approval false))
(assert (= fhc_joint_marketing_no_customer_harm false))
(assert (= subsidiary_joint_marketing_no_customer_harm false))
(assert (= fhc_joint_marketing_customer_identifiable true))
(assert (= subsidiary_joint_marketing_customer_identifiable true))
(assert (= fhc_joint_marketing_personal_data_protection_compliant false))
(assert (= subsidiary_joint_marketing_personal_data_protection false))
(assert (= contract_important_content_disclosed false))
(assert (= contract_transaction_risk_disclosed false))
(assert (= contract_protection_mechanism_annotated false))
(assert (= contract_reported_to_authority false))
(assert (= contract_website_announcement_done false))
(assert (= contract_disclosure_and_reporting false))
(assert (= marketing_purpose_data_collected true))
(assert (= marketing_purpose_data_used_outside true))
(assert (= customer_data_disclosed_or_referred true))
(assert (= neq_customer_name true))
(assert (= neq_customer_address false))
(assert (= subsidiary_customer_data_marketing_use_restriction false))
(assert (= contract_data_usage_terms_set false))
(assert (= customer_consent_for_data_usage false))
(assert (= contract_data_usage_terms_disclose_subsidiary false))
(assert (= customer_contract_data_usage_terms false))
(assert (= fhc_subsidiary_change_announced false))
(assert (= organization_change_announcement false))
(assert (= customer_stop_data_use_notice_received false))
(assert (= subsidiaries_stop_data_use_immediately false))
(assert (= customer_notice_and_stop_data_use false))
(assert (= confidentiality_measures_established false))
(assert (= dedicated_unit_or_personnel_assigned false))
(assert (= customer_database_established false))
(assert (= customer_data_securely_stored false))
(assert (= customer_data_access_limited_to_authorized false))
(assert (= customer_data_confidentiality_and_security false))
(assert (= confidentiality_agreement_established false))
(assert (= data_use_restricted false))
(assert (= data_disclosed_to_third_party true))
(assert (= subsidiary_data_transfer_and_confidentiality_agreement false))
(assert (= data_use_subsidiary_names_disclosed false))
(assert (= confidentiality_measures_disclosed false))
(assert (= disclosure_announced_on_website false))
(assert (= disclosure_sent_by_letter false))
(assert (= disclosure_sent_by_email false))
(assert (= disclosure_posted_in_office false))
(assert (= disclosure_of_data_use_and_measures false))
(assert (= data_collection_method_disclosed false))
(assert (= data_storage_and_custody_disclosed false))
(assert (= data_security_and_protection_disclosed false))
(assert (= data_classification_and_usage_scope_disclosed false))
(assert (= data_usage_purpose_disclosed false))
(assert (= data_disclosure_targets_disclosed false))
(assert (= customer_data_change_method_disclosed false))
(assert (= customer_opt_out_method_disclosed false))
(assert (= customer_data_change_method_sent_by_letter false))
(assert (= customer_data_change_method_sent_by_email false))
(assert (= customer_opt_out_method_sent_by_letter false))
(assert (= customer_opt_out_method_sent_by_email false))
(assert (= disclosure_measures_content false))
(assert (= disclosure_measures_written_or_email false))
(assert (= business_scope_in_allowed_bank_business true))
(assert (= business_scope_in_allowed_futures_business false))
(assert (= business_scope_in_allowed_insurance_business true))
(assert (= business_scope_in_allowed_securities_business false))
(assert (= joint_marketing_business_scope_ok true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 66
; Total facts: 66
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
