; SMT2 file generated from compliance case automatic
; Case ID: case_356
; Generated at: 2025-10-21T07:56:33.242382
;
; This file can be executed with Z3:
;   z3 case_356.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const algorithm_and_system_supervision_mechanism_established Bool)
(declare-const application_and_documents_submitted Bool)
(declare-const asset_allocation_and_risk_management_established Bool)
(declare-const asset_quality_and_loss_provisioning_established Bool)
(declare-const audit_report_covers_electronic_payment_scope Bool)
(declare-const audit_report_covers_financial_institution_scope Bool)
(declare-const audit_report_meets_international_standards Bool)
(declare-const audit_scope_covers_important_systems Bool)
(declare-const auto_investment_advisor_internal_audit_performed Bool)
(declare-const auto_investment_advisor_internal_control_established Bool)
(declare-const auto_investment_advisor_internal_control_minimum_requirements_met Bool)
(declare-const backup_data_protection_implemented Bool)
(declare-const board_resolution_submitted Bool)
(declare-const capital_adequacy_monitoring_established Bool)
(declare-const capital_to_risk_ratio Real)
(declare-const circumventing_law_by_transferring_to_third_country Bool)
(declare-const cloud_service_customer_data_protection Bool)
(declare-const cloud_service_data_ownership_and_access_control Bool)
(declare-const cloud_service_data_storage_location_compliance Bool)
(declare-const cloud_service_final_supervision_responsibility Bool)
(declare-const cloud_service_policy_and_risk_control Bool)
(declare-const cloud_service_policy_established Bool)
(declare-const cloud_service_provider_access_restricted Bool)
(declare-const cloud_service_provider_diversification_ensured Bool)
(declare-const cloud_service_provider_no_unauthorized_use Bool)
(declare-const cloud_service_risk_control_measures_implemented Bool)
(declare-const cloud_service_supervision Bool)
(declare-const cloud_service_supervision_technical_resources Bool)
(declare-const cloud_service_third_party_audit_compliance Bool)
(declare-const conflict_of_interest_prevention_mechanism_established Bool)
(declare-const consistent_operation_principles_established Bool)
(declare-const customer_data_encryption_or_tokenization Bool)
(declare-const customer_dispute_resolution_mechanism_established Bool)
(declare-const customer_info_protection_and_consent_included Bool)
(declare-const customer_personal_data_protection_and_security_measures_established Bool)
(declare-const data_ownership_retained Bool)
(declare-const data_processing_and_storage_location_rights_held Bool)
(declare-const data_storage_location_domestic Bool)
(declare-const data_storage_location_foreign Bool)
(declare-const dedicated_unit_established Bool)
(declare-const derivative_financial_products_internal_system_established Bool)
(declare-const derivative_financial_products_internal_system_established_flag Bool)
(declare-const derivative_financial_products_qualification_met Bool)
(declare-const derivative_financial_products_trading_plan_approved Bool)
(declare-const derivative_financial_products_trading_plan_content_compliant Bool)
(declare-const derivative_product_types_specified Bool)
(declare-const electronic_payment_cloud_service_compliance Bool)
(declare-const emergency_response_plan_and_control_measures_established Bool)
(declare-const emergency_response_plan_included Bool)
(declare-const encryption_key_management_mechanism_established Bool)
(declare-const encryption_measures_implemented Bool)
(declare-const equipment_and_storage_media_usage_specified Bool)
(declare-const foreign_data_protection_laws_not_lower_than_domestic Bool)
(declare-const head_office_authorized_consent_submitted Bool)
(declare-const important_customer_data_backup_in_domestic Bool)
(declare-const information_security_and_emergency_response_plan_established Bool)
(declare-const information_security_and_management_included Bool)
(declare-const internal_audit_reports_prepared Bool)
(declare-const internal_audit_staff_assigned Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_control_and_audit_system_established_flag Bool)
(declare-const internal_control_or_management_system_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_established_flag Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_established_flag Bool)
(declare-const international_transfer_restriction Bool)
(declare-const international_treaty_special_provision Bool)
(declare-const investment_benefit_goals_and_performance_measures_specified Bool)
(declare-const investment_product_legality_and_risk_reward_assessed Bool)
(declare-const involves_national_important_interests Bool)
(declare-const is_foreign_branch Bool)
(declare-const know_your_customer_and_suitability_assessment_established Bool)
(declare-const liquidity_management_mechanism_established Bool)
(declare-const no_major_internal_control_deficiencies_last_year Bool)
(declare-const no_major_penalties_last_year Bool)
(declare-const other_regulatory_qualifications_met Bool)
(declare-const outsourcing_annual_general_and_special_audit_completed Bool)
(declare-const outsourcing_approval_documents_submitted Bool)
(declare-const outsourcing_compliance Bool)
(declare-const outsourcing_consent_letter_submitted Bool)
(declare-const outsourcing_contract_includes_transfer_and_compensation_clauses Bool)
(declare-const outsourcing_cost_benefit_and_cost_sharing_approved Bool)
(declare-const outsourcing_customer_info_usage_compliant Bool)
(declare-const outsourcing_foreign_branch_handling_compliance Bool)
(declare-const outsourcing_info_system_security_meets_standards Bool)
(declare-const outsourcing_internal_operation_specification_submitted Bool)
(declare-const outsourcing_necessity_and_legality_analysis_submitted Bool)
(declare-const outsourcing_no_fraud_statement_submitted Bool)
(declare-const outsourcing_plan_content_compliant Bool)
(declare-const outsourcing_plan_submitted Bool)
(declare-const outsourcing_post_approval_compliance Bool)
(declare-const outsourcing_service_interruption_backup_plan_established Bool)
(declare-const penalty Bool)
(declare-const personal_data_security_measures_compliant Bool)
(declare-const product_information_accuracy_and_sufficiency_assessed Bool)
(declare-const recipient_country_data_protection_inadequate Bool)
(declare-const regulatory_approval_obtained Bool)
(declare-const risk_assessment_and_management_mechanism_included Bool)
(declare-const risk_limit_management_mechanism_specified Bool)
(declare-const risk_management_mechanism_compliance Bool)
(declare-const risk_value_evaluation_and_daily_control_implemented Bool)
(declare-const third_party_audit_engaged Bool)
(declare-const third_party_qualification_assessed Bool)
(declare-const trading_plan_approved_by_board Bool)
(declare-const usage_restrictions_specified Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [finance:outsourcing_approval_documents_submitted] 金融機構辦理重大性消費金融業務資訊系統委外，已檢具申請核准所需書件
(assert (= outsourcing_approval_documents_submitted
   (and outsourcing_internal_operation_specification_submitted
        (or board_resolution_submitted
            (and is_foreign_branch head_office_authorized_consent_submitted))
        outsourcing_necessity_and_legality_analysis_submitted
        outsourcing_plan_submitted
        outsourcing_consent_letter_submitted
        outsourcing_no_fraud_statement_submitted)))

; [finance:outsourcing_plan_content_compliant] 作業委外計畫書內容符合規定
(assert (= outsourcing_plan_content_compliant
   (and risk_assessment_and_management_mechanism_included
        customer_info_protection_and_consent_included
        information_security_and_management_included
        emergency_response_plan_included)))

; [finance:outsourcing_post_approval_compliance] 金融機構委外後符合後續規定
(assert (= outsourcing_post_approval_compliance
   (and outsourcing_customer_info_usage_compliant
        outsourcing_cost_benefit_and_cost_sharing_approved
        outsourcing_info_system_security_meets_standards
        outsourcing_annual_general_and_special_audit_completed
        outsourcing_service_interruption_backup_plan_established
        outsourcing_contract_includes_transfer_and_compensation_clauses)))

; [finance:outsourcing_foreign_branch_handling_compliance] 外國金融機構在臺分支機構依規定辦理內部分工作業委託
(assert (= outsourcing_foreign_branch_handling_compliance
   (or (not is_foreign_branch) outsourcing_post_approval_compliance)))

; [finance:cloud_service_policy_and_risk_control] 金融機構訂定使用雲端服務政策及採取適當風險管控措施
(assert (= cloud_service_policy_and_risk_control
   (and cloud_service_policy_established
        cloud_service_risk_control_measures_implemented
        cloud_service_provider_diversification_ensured)))

; [finance:cloud_service_supervision] 金融機構對雲端服務業者負有最終監督義務並具備專業技術及資源
(assert (= cloud_service_supervision
   (and cloud_service_final_supervision_responsibility
        cloud_service_supervision_technical_resources)))

; [finance:cloud_service_third_party_audit_compliance] 金融機構委託或聯合委託第三人查核雲端服務業者並符合規定
(assert (= cloud_service_third_party_audit_compliance
   (and third_party_audit_engaged
        audit_scope_covers_important_systems
        third_party_qualification_assessed
        audit_report_meets_international_standards
        audit_report_covers_financial_institution_scope)))

; [finance:cloud_service_customer_data_protection] 金融機構對雲端服務業者傳輸及儲存客戶資料採有效保護措施
(assert (= cloud_service_customer_data_protection
   (and customer_data_encryption_or_tokenization
        encryption_key_management_mechanism_established)))

; [finance:cloud_service_data_ownership_and_access_control] 金融機構保有資料所有權並限制雲端服務業者存取及利用權限
(assert (= cloud_service_data_ownership_and_access_control
   (and data_ownership_retained
        cloud_service_provider_access_restricted
        cloud_service_provider_no_unauthorized_use)))

; [finance:cloud_service_data_storage_location_compliance] 委託雲端服務業者處理之客戶資料及儲存地符合規定
(assert (= cloud_service_data_storage_location_compliance
   (and data_processing_and_storage_location_rights_held
        foreign_data_protection_laws_not_lower_than_domestic
        (or data_storage_location_domestic
            (and data_storage_location_foreign
                 regulatory_approval_obtained
                 important_customer_data_backup_in_domestic)))))

; [bank:internal_control_and_audit_system_established] 銀行建立內部控制及稽核制度
(assert (= internal_control_and_audit_system_established
   internal_control_and_audit_system_established_flag))

; [bank:internal_handling_system_established] 銀行建立內部處理制度及程序
(assert (= internal_handling_system_established
   internal_handling_system_established_flag))

; [bank:internal_operation_system_established] 銀行訂定內部作業制度及程序
(assert (= internal_operation_system_established
   internal_operation_system_established_flag))

; [bank:derivative_financial_products_internal_system_established] 銀行訂定衍生性金融商品業務內部作業制度及程序
(assert (= derivative_financial_products_internal_system_established
   derivative_financial_products_internal_system_established_flag))

; [bank:violation_of_internal_control_and_audit_system_penalty] 違反未建立或未確實執行內部控制與稽核制度等規定處罰
(assert (not (= (and internal_control_and_audit_system_established
             internal_handling_system_established
             internal_operation_system_established)
        penalty)))

; [bank:risk_management_mechanism_compliance] 銀行業風險控管機制符合規定
(assert (= risk_management_mechanism_compliance
   (and capital_adequacy_monitoring_established
        liquidity_management_mechanism_established
        asset_allocation_and_risk_management_established
        asset_quality_and_loss_provisioning_established
        information_security_and_emergency_response_plan_established)))

; [securities:auto_investment_advisor_internal_control_established] 提供自動化投資顧問服務者設置專責單位並訂定內部控制制度
(assert (= auto_investment_advisor_internal_control_established
   (and dedicated_unit_established
        internal_control_or_management_system_established)))

; [securities:auto_investment_advisor_internal_audit_performed] 提供自動化投資顧問服務者配置內部稽核人員並定期稽核
(assert (= auto_investment_advisor_internal_audit_performed
   (and internal_audit_staff_assigned internal_audit_reports_prepared)))

; [securities:auto_investment_advisor_internal_control_minimum_requirements_met] 自動化投資顧問服務內部控制制度至少包括法定九項事項
(assert (= auto_investment_advisor_internal_control_minimum_requirements_met
   (and know_your_customer_and_suitability_assessment_established
        algorithm_and_system_supervision_mechanism_established
        customer_personal_data_protection_and_security_measures_established
        product_information_accuracy_and_sufficiency_assessed
        emergency_response_plan_and_control_measures_established
        consistent_operation_principles_established
        customer_dispute_resolution_mechanism_established
        investment_product_legality_and_risk_reward_assessed
        conflict_of_interest_prevention_mechanism_established)))

; [insurance:derivative_financial_products_qualification_met] 保險業符合衍生性金融商品交易資格
(assert (= derivative_financial_products_qualification_met
   (and (>= capital_to_risk_ratio (/ 5.0 4.0))
        risk_value_evaluation_and_daily_control_implemented
        no_major_internal_control_deficiencies_last_year
        no_major_penalties_last_year
        other_regulatory_qualifications_met)))

; [insurance:derivative_financial_products_trading_plan_approved] 保險業衍生性金融商品交易計畫書經董（理）事會通過並申請核准
(assert (= derivative_financial_products_trading_plan_approved
   (and trading_plan_approved_by_board application_and_documents_submitted)))

; [insurance:derivative_financial_products_trading_plan_content_compliant] 衍生性金融商品交易計畫書內容符合規定
(assert (= derivative_financial_products_trading_plan_content_compliant
   (and derivative_product_types_specified
        usage_restrictions_specified
        investment_benefit_goals_and_performance_measures_specified
        risk_limit_management_mechanism_specified)))

; [personal_data_security_measures_compliant] 非公務機關採取個人資料安全管理措施
(assert (= personal_data_security_measures_compliant
   (and equipment_and_storage_media_usage_specified
        encryption_measures_implemented
        backup_data_protection_implemented)))

; [personal_data_protection_law_international_transfer_restriction] 非公務機關國際傳輸個人資料受限制情形
(assert (= international_transfer_restriction
   (or involves_national_important_interests
       international_treaty_special_provision
       circumventing_law_by_transferring_to_third_country
       recipient_country_data_protection_inadequate)))

; [electronic_payment_cloud_service_compliance] 電子支付機構委託雲端服務符合規定
(assert (= electronic_payment_cloud_service_compliance
   (and cloud_service_policy_established
        cloud_service_risk_control_measures_implemented
        cloud_service_provider_diversification_ensured
        cloud_service_final_supervision_responsibility
        cloud_service_supervision_technical_resources
        third_party_audit_engaged
        audit_scope_covers_important_systems
        third_party_qualification_assessed
        audit_report_meets_international_standards
        audit_report_covers_electronic_payment_scope
        customer_data_encryption_or_tokenization
        encryption_key_management_mechanism_established
        data_ownership_retained
        cloud_service_provider_access_restricted
        cloud_service_provider_no_unauthorized_use
        (or data_storage_location_domestic
            (and data_storage_location_foreign
                 regulatory_approval_obtained
                 important_customer_data_backup_in_domestic)))))

; [finance:outsourcing_compliance] 金融機構作業委託他人處理內部作業制度及程序符合規定
(assert (= outsourcing_compliance
   (and outsourcing_approval_documents_submitted
        outsourcing_plan_content_compliant
        outsourcing_post_approval_compliance)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融機構作業委託他人處理內部作業制度及程序規定時處罰
(assert (= penalty
   (or (not derivative_financial_products_trading_plan_content_compliant)
       (not electronic_payment_cloud_service_compliance)
       (not derivative_financial_products_internal_system_established)
       (not outsourcing_compliance)
       (not cloud_service_supervision)
       (not auto_investment_advisor_internal_control_established)
       (not derivative_financial_products_qualification_met)
       (not cloud_service_policy_and_risk_control)
       (not risk_management_mechanism_compliance)
       (not cloud_service_customer_data_protection)
       (not cloud_service_data_ownership_and_access_control)
       (not auto_investment_advisor_internal_control_minimum_requirements_met)
       (not internal_handling_system_established)
       (not internal_control_and_audit_system_established)
       (not derivative_financial_products_trading_plan_approved)
       (not cloud_service_third_party_audit_compliance)
       (not cloud_service_data_storage_location_compliance)
       (not internal_operation_system_established)
       (not personal_data_security_measures_compliant)
       (not auto_investment_advisor_internal_audit_performed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= is_foreign_branch false))
(assert (= outsourcing_internal_operation_specification_submitted false))
(assert (= board_resolution_submitted false))
(assert (= head_office_authorized_consent_submitted false))
(assert (= outsourcing_necessity_and_legality_analysis_submitted false))
(assert (= outsourcing_plan_submitted false))
(assert (= outsourcing_consent_letter_submitted false))
(assert (= outsourcing_no_fraud_statement_submitted false))
(assert (= outsourcing_approval_documents_submitted false))
(assert (= risk_assessment_and_management_mechanism_included false))
(assert (= customer_info_protection_and_consent_included false))
(assert (= information_security_and_management_included false))
(assert (= emergency_response_plan_included false))
(assert (= outsourcing_plan_content_compliant false))
(assert (= outsourcing_customer_info_usage_compliant false))
(assert (= outsourcing_cost_benefit_and_cost_sharing_approved false))
(assert (= outsourcing_info_system_security_meets_standards false))
(assert (= outsourcing_annual_general_and_special_audit_completed false))
(assert (= outsourcing_service_interruption_backup_plan_established false))
(assert (= outsourcing_contract_includes_transfer_and_compensation_clauses false))
(assert (= outsourcing_post_approval_compliance false))
(assert (= cloud_service_policy_established false))
(assert (= cloud_service_risk_control_measures_implemented false))
(assert (= cloud_service_provider_diversification_ensured false))
(assert (= cloud_service_policy_and_risk_control false))
(assert (= cloud_service_final_supervision_responsibility false))
(assert (= cloud_service_supervision_technical_resources false))
(assert (= cloud_service_supervision false))
(assert (= third_party_audit_engaged false))
(assert (= audit_scope_covers_important_systems false))
(assert (= third_party_qualification_assessed false))
(assert (= audit_report_meets_international_standards false))
(assert (= audit_report_covers_financial_institution_scope false))
(assert (= cloud_service_third_party_audit_compliance false))
(assert (= customer_data_encryption_or_tokenization false))
(assert (= encryption_key_management_mechanism_established false))
(assert (= cloud_service_customer_data_protection false))
(assert (= data_ownership_retained false))
(assert (= cloud_service_provider_access_restricted false))
(assert (= cloud_service_provider_no_unauthorized_use false))
(assert (= cloud_service_data_ownership_and_access_control false))
(assert (= data_processing_and_storage_location_rights_held false))
(assert (= foreign_data_protection_laws_not_lower_than_domestic false))
(assert (= data_storage_location_domestic false))
(assert (= data_storage_location_foreign true))
(assert (= regulatory_approval_obtained false))
(assert (= important_customer_data_backup_in_domestic false))
(assert (= cloud_service_data_storage_location_compliance false))
(assert (= internal_control_and_audit_system_established_flag false))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_handling_system_established_flag false))
(assert (= internal_handling_system_established false))
(assert (= internal_operation_system_established_flag false))
(assert (= internal_operation_system_established false))
(assert (= derivative_financial_products_internal_system_established_flag false))
(assert (= derivative_financial_products_internal_system_established false))
(assert (= capital_adequacy_monitoring_established false))
(assert (= liquidity_management_mechanism_established false))
(assert (= asset_allocation_and_risk_management_established false))
(assert (= asset_quality_and_loss_provisioning_established false))
(assert (= information_security_and_emergency_response_plan_established false))
(assert (= risk_management_mechanism_compliance false))
(assert (= auto_investment_advisor_internal_control_established false))
(assert (= dedicated_unit_established false))
(assert (= internal_control_or_management_system_established false))
(assert (= auto_investment_advisor_internal_audit_performed false))
(assert (= internal_audit_staff_assigned false))
(assert (= internal_audit_reports_prepared false))
(assert (= auto_investment_advisor_internal_control_minimum_requirements_met false))
(assert (= know_your_customer_and_suitability_assessment_established false))
(assert (= algorithm_and_system_supervision_mechanism_established false))
(assert (= customer_personal_data_protection_and_security_measures_established false))
(assert (= product_information_accuracy_and_sufficiency_assessed false))
(assert (= emergency_response_plan_and_control_measures_established false))
(assert (= consistent_operation_principles_established false))
(assert (= customer_dispute_resolution_mechanism_established false))
(assert (= investment_product_legality_and_risk_reward_assessed false))
(assert (= conflict_of_interest_prevention_mechanism_established false))
(assert (= derivative_financial_products_qualification_met false))
(assert (= capital_to_risk_ratio 0.0))
(assert (= risk_value_evaluation_and_daily_control_implemented false))
(assert (= no_major_internal_control_deficiencies_last_year false))
(assert (= no_major_penalties_last_year false))
(assert (= other_regulatory_qualifications_met false))
(assert (= derivative_financial_products_trading_plan_approved false))
(assert (= trading_plan_approved_by_board false))
(assert (= application_and_documents_submitted false))
(assert (= derivative_financial_products_trading_plan_content_compliant false))
(assert (= derivative_product_types_specified false))
(assert (= usage_restrictions_specified false))
(assert (= investment_benefit_goals_and_performance_measures_specified false))
(assert (= risk_limit_management_mechanism_specified false))
(assert (= personal_data_security_measures_compliant false))
(assert (= equipment_and_storage_media_usage_specified false))
(assert (= encryption_measures_implemented false))
(assert (= backup_data_protection_implemented false))
(assert (= international_transfer_restriction true))
(assert (= involves_national_important_interests false))
(assert (= international_treaty_special_provision false))
(assert (= recipient_country_data_protection_inadequate false))
(assert (= circumventing_law_by_transferring_to_third_country false))
(assert (= electronic_payment_cloud_service_compliance false))
(assert (= audit_report_covers_electronic_payment_scope false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 106
; Total facts: 103
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
