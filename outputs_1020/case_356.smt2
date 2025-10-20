; SMT2 file generated from compliance case automatic
; Case ID: case_356
; Generated at: 2025-10-19T13:55:18.965926
;
; This file can be executed with Z3:
;   z3 case_356.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_delegated_to_independent_third_party Bool)
(declare-const audit_report_covers_commissioned_scope Bool)
(declare-const audit_report_meets_international_standards Bool)
(declare-const audit_report_submitted_to_board_within_4_months Bool)
(declare-const audit_scope_covers_important_systems Bool)
(declare-const board_resolution_submitted Bool)
(declare-const cloud_service_customer_data_encryption_and_key_management Bool)
(declare-const cloud_service_data_ownership_and_access_restriction Bool)
(declare-const cloud_service_data_storage_location_compliance Bool)
(declare-const cloud_service_final_supervision Bool)
(declare-const cloud_service_final_supervision_obligation Bool)
(declare-const cloud_service_policy_and_risk_control_defined Bool)
(declare-const cloud_service_policy_defined Bool)
(declare-const cloud_service_provider_diversification_ensured Bool)
(declare-const cloud_service_provider_no_access_outside_scope Bool)
(declare-const cloud_service_risk_control_measures_implemented Bool)
(declare-const cloud_service_supervision_assisted_by_third_party Bool)
(declare-const cloud_service_supervision_done_by_self Bool)
(declare-const cloud_service_supervision_technical_resources Bool)
(declare-const cloud_service_third_party_audit_compliance Bool)
(declare-const consent_letter_or_contract_submitted Bool)
(declare-const contract_specifies_transfer_and_compensation Bool)
(declare-const cost_benefit_evaluated Bool)
(declare-const cost_sharing_approved_by_board Bool)
(declare-const customer_data_encrypted_or_tokenized Bool)
(declare-const data_ownership_retained Bool)
(declare-const data_storage_approved_by_authority Bool)
(declare-const data_storage_in_domestic Bool)
(declare-const encryption_key_management_defined Bool)
(declare-const foreign_branch_outsourcing_handled_by_head_office_or_foreign_branch Bool)
(declare-const general_audit_completed Bool)
(declare-const head_office_authorized_consent_submitted Bool)
(declare-const important_data_backup_in_domestic Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_control_and_audit_system_established_and_executed Bool)
(declare-const internal_control_and_audit_system_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_operation_system_established Bool)
(declare-const is_foreign_branch Bool)
(declare-const no_incident_statement_submitted Bool)
(declare-const outsourcing_annual_audit_completed_and_reported Bool)
(declare-const outsourcing_approval_documents_submitted Bool)
(declare-const outsourcing_audit_may_be_delegated_to_independent_third_party Bool)
(declare-const outsourcing_audit_records_retained Bool)
(declare-const outsourcing_contract_specifies_transfer_and_compensation_obligations Bool)
(declare-const outsourcing_cost_benefit_evaluated_and_board_approved Bool)
(declare-const outsourcing_customer_data_compliance Bool)
(declare-const outsourcing_customer_data_usage_compliant Bool)
(declare-const outsourcing_handled_by_head_office_or_foreign_branch Bool)
(declare-const outsourcing_internal_operation_spec_defined Bool)
(declare-const outsourcing_necessity_and_legality_analysis_submitted Bool)
(declare-const outsourcing_plan_submitted Bool)
(declare-const outsourcing_security_testing_compliant Bool)
(declare-const outsourcing_service_interruption_backup_plan_established Bool)
(declare-const penalty Bool)
(declare-const security_testing_meets_regulations Bool)
(declare-const service_interruption_backup_plan_established Bool)
(declare-const special_audit_completed Bool)
(declare-const third_party_audit_engaged Bool)
(declare-const third_party_qualification_evaluated Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [finance:outsourcing_approval_documents_submitted] 金融機構委外涉及重大性消費金融業務資訊系統境外處理，已檢具申請核准書件
(assert (= outsourcing_approval_documents_submitted
   (and outsourcing_internal_operation_spec_defined
        (or board_resolution_submitted
            (and is_foreign_branch head_office_authorized_consent_submitted))
        outsourcing_necessity_and_legality_analysis_submitted
        outsourcing_plan_submitted
        consent_letter_or_contract_submitted
        no_incident_statement_submitted)))

; [finance:outsourcing_customer_data_compliance] 受委託機構對客戶資訊使用處理符合個人資料保護法規定並留存稽核紀錄
(assert (= outsourcing_customer_data_compliance
   (and outsourcing_customer_data_usage_compliant
        outsourcing_audit_records_retained)))

; [finance:outsourcing_cost_benefit_evaluated_and_board_approved] 定期評估成本效益與集團內費用分攤合理性並報董事會通過
(assert (= outsourcing_cost_benefit_evaluated_and_board_approved
   (and cost_benefit_evaluated cost_sharing_approved_by_board)))

; [finance:outsourcing_security_testing_compliant] 資訊系統安全檢測符合主管機關或銀行公會規範
(assert (= outsourcing_security_testing_compliant security_testing_meets_regulations))

; [finance:outsourcing_annual_audit_completed_and_reported] 每年至少辦理一次一般性查核及一次專案查核，並於年度終了後四個月內提報董事會
(assert (= outsourcing_annual_audit_completed_and_reported
   (and general_audit_completed
        special_audit_completed
        audit_report_submitted_to_board_within_4_months)))

; [finance:outsourcing_audit_may_be_delegated_to_independent_third_party] 查核執行得委託具資訊專業之獨立第三人辦理
(assert (= outsourcing_audit_may_be_delegated_to_independent_third_party
   audit_delegated_to_independent_third_party))

; [finance:outsourcing_service_interruption_backup_plan_established] 建立受委託機構發生無法提供服務或服務中斷之營運備援計畫
(assert (= outsourcing_service_interruption_backup_plan_established
   service_interruption_backup_plan_established))

; [finance:outsourcing_contract_specifies_transfer_and_compensation_obligations] 契約載明委外作業移轉義務及服務中斷賠償責任
(assert (= outsourcing_contract_specifies_transfer_and_compensation_obligations
   contract_specifies_transfer_and_compensation))

; [finance:foreign_branch_outsourcing_handled_by_head_office_or_foreign_branch] 外國金融機構在臺分支機構內部分工將作業交由總機構或國外分支機構處理，依規定辦理
(assert (= foreign_branch_outsourcing_handled_by_head_office_or_foreign_branch
   (or outsourcing_handled_by_head_office_or_foreign_branch
       (not is_foreign_branch))))

; [finance:cloud_service_policy_and_risk_control_defined] 訂定使用雲端服務政策及原則，採取適當風險管控措施並注意適度分散
(assert (= cloud_service_policy_and_risk_control_defined
   (and cloud_service_policy_defined
        cloud_service_risk_control_measures_implemented
        cloud_service_provider_diversification_ensured)))

; [finance:cloud_service_final_supervision_obligation] 金融機構對雲端服務業者負有最終監督義務，具專業技術及資源，得委託專業第三人輔助監督
(assert (= cloud_service_final_supervision_obligation
   (and cloud_service_final_supervision
        cloud_service_supervision_technical_resources
        (or cloud_service_supervision_done_by_self
            cloud_service_supervision_assisted_by_third_party))))

; [finance:cloud_service_third_party_audit_compliance] 委託或聯合委託獨立第三人查核，查核範圍涵蓋重要系統及控制環節，評估適格性及報告妥適性
(assert (= cloud_service_third_party_audit_compliance
   (and third_party_audit_engaged
        audit_scope_covers_important_systems
        third_party_qualification_evaluated
        audit_report_meets_international_standards
        audit_report_covers_commissioned_scope)))

; [finance:cloud_service_customer_data_encryption_and_key_management] 客戶資料傳輸及儲存採加密或代碼化保護，訂定妥適加密金鑰管理機制
(assert (= cloud_service_customer_data_encryption_and_key_management
   (and customer_data_encrypted_or_tokenized encryption_key_management_defined)))

; [finance:cloud_service_data_ownership_and_access_restriction] 保有資料所有權，確保雲端服務業者不得存取客戶資料或委託範圍外利用
(assert (= cloud_service_data_ownership_and_access_restriction
   (and data_ownership_retained cloud_service_provider_no_access_outside_scope)))

; [finance:cloud_service_data_storage_location_compliance] 客戶資料及儲存地以我國境內為原則，境外須主管機關核准且重要資料留存備份
(assert (= cloud_service_data_storage_location_compliance
   (or data_storage_in_domestic
       (and data_storage_approved_by_authority
            important_data_backup_in_domestic))))

; [bank:internal_control_and_audit_system_established_and_executed] 銀行建立內部控制及稽核制度，內部處理制度及程序，內部作業制度及程序，並確實執行
(assert (= internal_control_and_audit_system_established_and_executed
   (and internal_control_and_audit_system_established
        internal_handling_system_established
        internal_operation_system_established
        internal_control_and_audit_system_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行銀行內部控制及稽核制度、內部處理制度及程序、內部作業制度及程序時處罰
(assert (not (= internal_control_and_audit_system_established_and_executed penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= outsourcing_internal_operation_spec_defined false))
(assert (= board_resolution_submitted false))
(assert (= is_foreign_branch false))
(assert (= head_office_authorized_consent_submitted false))
(assert (= outsourcing_necessity_and_legality_analysis_submitted false))
(assert (= outsourcing_plan_submitted false))
(assert (= consent_letter_or_contract_submitted false))
(assert (= no_incident_statement_submitted false))
(assert (= outsourcing_customer_data_usage_compliant false))
(assert (= outsourcing_audit_records_retained false))
(assert (= cost_benefit_evaluated false))
(assert (= cost_sharing_approved_by_board false))
(assert (= security_testing_meets_regulations false))
(assert (= general_audit_completed false))
(assert (= special_audit_completed false))
(assert (= audit_report_submitted_to_board_within_4_months false))
(assert (= audit_delegated_to_independent_third_party false))
(assert (= service_interruption_backup_plan_established false))
(assert (= contract_specifies_transfer_and_compensation false))
(assert (= outsourcing_handled_by_head_office_or_foreign_branch false))
(assert (= cloud_service_policy_defined false))
(assert (= cloud_service_risk_control_measures_implemented false))
(assert (= cloud_service_provider_diversification_ensured false))
(assert (= cloud_service_final_supervision false))
(assert (= cloud_service_supervision_technical_resources false))
(assert (= cloud_service_supervision_done_by_self false))
(assert (= cloud_service_supervision_assisted_by_third_party false))
(assert (= third_party_audit_engaged false))
(assert (= audit_scope_covers_important_systems false))
(assert (= third_party_qualification_evaluated false))
(assert (= audit_report_meets_international_standards false))
(assert (= audit_report_covers_commissioned_scope false))
(assert (= customer_data_encrypted_or_tokenized false))
(assert (= encryption_key_management_defined false))
(assert (= data_ownership_retained false))
(assert (= cloud_service_provider_no_access_outside_scope false))
(assert (= data_storage_in_domestic false))
(assert (= data_storage_approved_by_authority false))
(assert (= important_data_backup_in_domestic false))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_handling_system_established false))
(assert (= internal_operation_system_established false))
(assert (= internal_control_and_audit_system_executed false))
(assert (= cloud_service_customer_data_encryption_and_key_management false))
(assert (= cloud_service_data_ownership_and_access_restriction false))
(assert (= cloud_service_data_storage_location_compliance false))
(assert (= cloud_service_final_supervision_obligation false))
(assert (= cloud_service_policy_and_risk_control_defined false))
(assert (= cloud_service_third_party_audit_compliance false))
(assert (= foreign_branch_outsourcing_handled_by_head_office_or_foreign_branch false))
(assert (= internal_control_and_audit_system_established_and_executed false))
(assert (= outsourcing_annual_audit_completed_and_reported false))
(assert (= outsourcing_approval_documents_submitted false))
(assert (= outsourcing_audit_may_be_delegated_to_independent_third_party false))
(assert (= outsourcing_contract_specifies_transfer_and_compensation_obligations false))
(assert (= outsourcing_cost_benefit_evaluated_and_board_approved false))
(assert (= outsourcing_customer_data_compliance false))
(assert (= outsourcing_security_testing_compliant false))
(assert (= outsourcing_service_interruption_backup_plan_established false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 60
; Total facts: 60
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
