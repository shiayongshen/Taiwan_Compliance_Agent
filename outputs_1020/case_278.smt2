; SMT2 file generated from compliance case automatic
; Case ID: case_278
; Generated at: 2025-10-19T11:57:13.756320
;
; This file can be executed with Z3:
;   z3 case_278.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const fhc_contract_data_usage_consent_obtained Bool)
(declare-const fhc_contract_data_usage_notice_and_stop_mechanism Bool)
(declare-const fhc_customer_database_established Bool)
(declare-const fhc_data_authorized_use_only Bool)
(declare-const fhc_data_confidentiality_agreement_signed Bool)
(declare-const fhc_data_confidentiality_measures_established Bool)
(declare-const fhc_data_disclosure_and_notification_done Bool)
(declare-const fhc_data_disclosure_content_complete Bool)
(declare-const fhc_data_disclosure_restricted Bool)
(declare-const fhc_data_disclosure_written_or_email_done Bool)
(declare-const fhc_data_no_third_party_disclosure Bool)
(declare-const fhc_data_transfer_allowed Bool)
(declare-const fhc_joint_marketing_approved Bool)
(declare-const fhc_joint_marketing_business_scope_compliant Bool)
(declare-const fhc_joint_marketing_customer_identifiable Bool)
(declare-const fhc_joint_marketing_excluded_business_compliant Bool)
(declare-const fhc_joint_marketing_no_customer_harm Bool)
(declare-const fhc_joint_marketing_personal_data_protection_compliant Bool)
(declare-const fhc_notify_marketing_personnel_data_stop Bool)
(declare-const fhc_organization_change_announced Bool)
(declare-const fhc_personal_data_usage_restricted Bool)
(declare-const fhc_stop_data_use_after_customer_request Bool)
(declare-const fhc_stop_data_use_scope_limited_by_customer Bool)
(declare-const fhc_subsidiary_contract_disclosed Bool)
(declare-const fhc_subsidiary_contract_protection_annotated Bool)
(declare-const fhc_subsidiary_contract_reported Bool)
(declare-const joint_marketing_business_scope_allowed Bool)
(declare-const joint_marketing_excluded_business Bool)
(declare-const penalty Bool)
(declare-const subsidiary_contract_data_usage_consent Bool)
(declare-const subsidiary_contract_data_usage_notice_and_stop_mechanism Bool)
(declare-const subsidiary_contract_disclosure Bool)
(declare-const subsidiary_contract_protection_mechanism_annotated Bool)
(declare-const subsidiary_contract_reported_and_website_announcement Bool)
(declare-const subsidiary_customer_database_established Bool)
(declare-const subsidiary_data_authorized_use_only Bool)
(declare-const subsidiary_data_confidentiality_agreement Bool)
(declare-const subsidiary_data_confidentiality_measures Bool)
(declare-const subsidiary_data_disclosure_and_notification Bool)
(declare-const subsidiary_data_disclosure_content_included Bool)
(declare-const subsidiary_data_disclosure_written_or_email Bool)
(declare-const subsidiary_data_no_third_party_disclosure Bool)
(declare-const subsidiary_data_transfer_allowed Bool)
(declare-const subsidiary_joint_marketing_approval Bool)
(declare-const subsidiary_joint_marketing_customer_identifiable Bool)
(declare-const subsidiary_joint_marketing_data_disclosure_restriction Bool)
(declare-const subsidiary_joint_marketing_no_customer_harm Bool)
(declare-const subsidiary_joint_marketing_personal_data_protection Bool)
(declare-const subsidiary_joint_marketing_personal_data_usage_restriction Bool)
(declare-const subsidiary_notify_marketing_personnel_data_stop Bool)
(declare-const subsidiary_organization_change_announcement Bool)
(declare-const subsidiary_stop_data_use_after_customer_request Bool)
(declare-const subsidiary_stop_data_use_scope_limited_by_customer Bool)

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

; [fhc:subsidiary_contract_disclosure] 子公司與客戶簽約應明確揭露契約重要內容及交易風險
(assert (= subsidiary_contract_disclosure fhc_subsidiary_contract_disclosed))

; [fhc:subsidiary_contract_protection_mechanism_annotated] 契約應註明是否受存款保險、保險安定基金或其他保障機制
(assert (= subsidiary_contract_protection_mechanism_annotated
   fhc_subsidiary_contract_protection_annotated))

; [fhc:subsidiary_contract_reported_and_website_announcement] 契約需向主管機關報備並於金融機構網站公告
(assert (= subsidiary_contract_reported_and_website_announcement
   fhc_subsidiary_contract_reported))

; [fhc:subsidiary_joint_marketing_personal_data_usage_restriction] 子公司間交互運用客戶資料不得為行銷目的外之利用，且依規定辦理
(assert (= subsidiary_joint_marketing_personal_data_usage_restriction
   fhc_personal_data_usage_restricted))

; [fhc:subsidiary_joint_marketing_data_disclosure_restriction] 揭露、轉介或交互運用客戶資料不得含姓名及地址以外之其他資料，除法令或客戶同意
(assert (= subsidiary_joint_marketing_data_disclosure_restriction
   fhc_data_disclosure_restricted))

; [fhc:subsidiary_contract_data_usage_consent] 契約應訂定客戶是否同意提供姓名及地址以外資料作行銷建檔等，並列明子公司名稱
(assert (= subsidiary_contract_data_usage_consent
   fhc_contract_data_usage_consent_obtained))

; [fhc:subsidiary_organization_change_announcement] 金融控股公司組織異動子公司增減時，應於公司及子公司網站公告
(assert (= subsidiary_organization_change_announcement
   fhc_organization_change_announced))

; [fhc:subsidiary_contract_data_usage_notice_and_stop_mechanism] 契約條款應以明顯字體提醒客戶注意交互運用資料，並明確告知可隨時停止使用之簡易方式
(assert (= subsidiary_contract_data_usage_notice_and_stop_mechanism
   fhc_contract_data_usage_notice_and_stop_mechanism))

; [fhc:subsidiary_stop_data_use_after_customer_request] 子公司接獲客戶停止使用資料通知後，應立即停止所有子公司相互使用其資料
(assert (= subsidiary_stop_data_use_after_customer_request
   fhc_stop_data_use_after_customer_request))

; [fhc:subsidiary_stop_data_use_scope_limited_by_customer] 若客戶明確指示停止交互運用資料之子公司範圍非所有子公司，得依客戶意旨辦理
(assert (= subsidiary_stop_data_use_scope_limited_by_customer
   fhc_stop_data_use_scope_limited_by_customer))

; [fhc:subsidiary_notify_marketing_personnel_data_stop] 子公司客戶不同意繼續使用資料，應通知行銷人員並配合修正控管系統
(assert (= subsidiary_notify_marketing_personnel_data_stop
   fhc_notify_marketing_personnel_data_stop))

; [fhc:subsidiary_data_confidentiality_measures] 應建立完善保密措施，設置專責單位或人員負責客戶資料保密
(assert (= subsidiary_data_confidentiality_measures
   fhc_data_confidentiality_measures_established))

; [fhc:subsidiary_customer_database_established] 應建立客戶資料庫，妥善儲存、保管及管理客戶資料，並建立安全措施
(assert (= subsidiary_customer_database_established fhc_customer_database_established))

; [fhc:subsidiary_data_authorized_use_only] 僅被授權員工可使用客戶資料
(assert (= subsidiary_data_authorized_use_only fhc_data_authorized_use_only))

; [fhc:subsidiary_data_transfer_allowed] 子公司得交付客戶資料予同一金融控股公司其他子公司進行行銷
(assert (= subsidiary_data_transfer_allowed fhc_data_transfer_allowed))

; [fhc:subsidiary_data_confidentiality_agreement] 子公司間相互揭露或交付客戶資料時，應訂定保密協定並維護資料機密性及限制用途
(assert (= subsidiary_data_confidentiality_agreement
   fhc_data_confidentiality_agreement_signed))

; [fhc:subsidiary_data_no_third_party_disclosure] 收受並運用資料之子公司不得向第三人揭露該資料
(assert (= subsidiary_data_no_third_party_disclosure fhc_data_no_third_party_disclosure))

; [fhc:subsidiary_data_disclosure_and_notification] 應向客戶揭露交互運用資料之子公司名稱及保密措施，並公告及通知客戶
(assert (= subsidiary_data_disclosure_and_notification
   fhc_data_disclosure_and_notification_done))

; [fhc:subsidiary_data_disclosure_content_included] 揭露措施應包含資料蒐集方式、儲存保管、資訊防火牆、資料分類利用範圍、利用目的、揭露對象、資料變更及選擇退出方式
(assert (= subsidiary_data_disclosure_content_included
   fhc_data_disclosure_content_complete))

; [fhc:subsidiary_data_disclosure_written_or_email] 資料變更及選擇退出方式除公告外，應另以書面或電子郵件方式為之
(assert (= subsidiary_data_disclosure_written_or_email
   fhc_data_disclosure_written_or_email_done))

; [fhc:joint_marketing_business_scope_allowed] 子公司間共同行銷得從事法定業務範圍
(assert (= joint_marketing_business_scope_allowed
   fhc_joint_marketing_business_scope_compliant))

; [fhc:joint_marketing_excluded_business] 共同行銷不包括特定保險及證券投信投顧等業務
(assert (= joint_marketing_excluded_business
   fhc_joint_marketing_excluded_business_compliant))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司子公司間共同行銷相關規定時處罰
(assert (= penalty
   (or (not subsidiary_joint_marketing_customer_identifiable)
       (not joint_marketing_business_scope_allowed)
       (not subsidiary_joint_marketing_approval)
       (not subsidiary_contract_reported_and_website_announcement)
       (not subsidiary_joint_marketing_no_customer_harm)
       (not subsidiary_contract_data_usage_consent)
       (not joint_marketing_excluded_business)
       (not subsidiary_joint_marketing_personal_data_usage_restriction)
       (not subsidiary_data_confidentiality_measures)
       (not subsidiary_stop_data_use_after_customer_request)
       (not subsidiary_notify_marketing_personnel_data_stop)
       (not subsidiary_joint_marketing_personal_data_protection)
       (not subsidiary_data_disclosure_content_included)
       (not subsidiary_contract_data_usage_notice_and_stop_mechanism)
       (not subsidiary_data_authorized_use_only)
       (not subsidiary_data_disclosure_and_notification)
       (not subsidiary_contract_disclosure)
       (not subsidiary_data_confidentiality_agreement)
       (not subsidiary_joint_marketing_data_disclosure_restriction)
       (not subsidiary_customer_database_established)
       (not subsidiary_data_no_third_party_disclosure)
       (not subsidiary_data_disclosure_written_or_email)
       (not subsidiary_stop_data_use_scope_limited_by_customer)
       (not subsidiary_organization_change_announcement)
       (not subsidiary_data_transfer_allowed)
       (not subsidiary_contract_protection_mechanism_annotated))))

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
(assert (= fhc_subsidiary_contract_disclosed false))
(assert (= subsidiary_contract_disclosure false))
(assert (= fhc_subsidiary_contract_protection_annotated true))
(assert (= subsidiary_contract_protection_mechanism_annotated true))
(assert (= fhc_subsidiary_contract_reported false))
(assert (= subsidiary_contract_reported_and_website_announcement false))
(assert (= fhc_personal_data_usage_restricted false))
(assert (= subsidiary_joint_marketing_personal_data_usage_restriction false))
(assert (= fhc_data_disclosure_restricted true))
(assert (= subsidiary_joint_marketing_data_disclosure_restriction true))
(assert (= fhc_contract_data_usage_consent_obtained false))
(assert (= subsidiary_contract_data_usage_consent false))
(assert (= fhc_organization_change_announced true))
(assert (= subsidiary_organization_change_announcement true))
(assert (= fhc_contract_data_usage_notice_and_stop_mechanism false))
(assert (= subsidiary_contract_data_usage_notice_and_stop_mechanism false))
(assert (= fhc_stop_data_use_after_customer_request true))
(assert (= subsidiary_stop_data_use_after_customer_request true))
(assert (= fhc_stop_data_use_scope_limited_by_customer false))
(assert (= subsidiary_stop_data_use_scope_limited_by_customer false))
(assert (= fhc_notify_marketing_personnel_data_stop false))
(assert (= subsidiary_notify_marketing_personnel_data_stop false))
(assert (= fhc_data_confidentiality_measures_established false))
(assert (= subsidiary_data_confidentiality_measures false))
(assert (= fhc_customer_database_established false))
(assert (= subsidiary_customer_database_established false))
(assert (= fhc_data_authorized_use_only false))
(assert (= subsidiary_data_authorized_use_only false))
(assert (= fhc_data_transfer_allowed false))
(assert (= subsidiary_data_transfer_allowed false))
(assert (= fhc_data_confidentiality_agreement_signed false))
(assert (= subsidiary_data_confidentiality_agreement false))
(assert (= fhc_data_no_third_party_disclosure true))
(assert (= subsidiary_data_no_third_party_disclosure true))
(assert (= fhc_data_disclosure_and_notification_done false))
(assert (= subsidiary_data_disclosure_and_notification false))
(assert (= fhc_data_disclosure_content_complete false))
(assert (= subsidiary_data_disclosure_content_included false))
(assert (= fhc_data_disclosure_written_or_email_done false))
(assert (= subsidiary_data_disclosure_written_or_email false))
(assert (= fhc_joint_marketing_business_scope_compliant true))
(assert (= joint_marketing_business_scope_allowed true))
(assert (= fhc_joint_marketing_excluded_business_compliant true))
(assert (= joint_marketing_excluded_business true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 53
; Total facts: 53
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
