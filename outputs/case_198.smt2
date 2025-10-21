; SMT2 file generated from compliance case automatic
; Case ID: case_198
; Generated at: 2025-10-21T04:20:14.369275
;
; This file can be executed with Z3:
;   z3 case_198.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advisory_contract_mandatory_items_complete Bool)
(declare-const advisory_contract_retained Bool)
(declare-const advisory_contract_retained_flag Bool)
(declare-const advisory_contract_retention_years Int)
(declare-const advisory_contract_signed Bool)
(declare-const client_knowledge_and_risk_assessed Bool)
(declare-const client_knowledge_and_risk_assessed_flag Bool)
(declare-const client_right_to_terminate_within_7_days Bool)
(declare-const compensation_for_services_before_termination_allowed Bool)
(declare-const confidentiality_obligation Bool)
(declare-const contract_effective_date_and_duration Bool)
(declare-const contract_modification_or_termination Bool)
(declare-const contract_party_names_and_addresses Bool)
(declare-const contract_rights_obligations_and_liabilities Bool)
(declare-const contract_termination_compensation_limit Bool)
(declare-const disclosure_or_provision_to_others_allowed Bool)
(declare-const dispute_resolution_and_jurisdiction Bool)
(declare-const fees_and_payment_methods Bool)
(declare-const information_non_disclosure Bool)
(declare-const information_provided_to_related_authorities Bool)
(declare-const information_used_for_supervision_and_investor_protection Bool)
(declare-const inspection_by_designated_professional Bool)
(declare-const inspection_cost_borne_by_inspected Bool)
(declare-const inspection_cost_paid_by_inspected Bool)
(declare-const inspection_report_submission Bool)
(declare-const inspection_report_submitted_truthfully Bool)
(declare-const investment_analysis_report_compliant Bool)
(declare-const investment_analysis_report_copies_retained Bool)
(declare-const investment_analysis_report_created Bool)
(declare-const investment_analysis_report_retained Bool)
(declare-const investment_analysis_report_retention_years Int)
(declare-const media_investment_analysis_record_retained Bool)
(declare-const media_investment_analysis_record_retention_years Int)
(declare-const media_investment_analysis_record_saved Bool)
(declare-const no_claim_for_damages_or_penalty Bool)
(declare-const no_disclosure_without_consent Bool)
(declare-const no_receipt_of_client_funds_or_profit_sharing Bool)
(declare-const obstruction_or_refusal Bool)
(declare-const other_mandated_items Bool)
(declare-const penalty Bool)
(declare-const reasonable_analysis_basis_and_references_included Bool)
(declare-const refund_ratio_and_method_on_termination Real)
(declare-const related_authorities_provided_information Bool)
(declare-const report_submission_and_cooperation Bool)
(declare-const report_submitted_within_deadline Bool)
(declare-const scope_of_investment_research_and_advice Bool)
(declare-const service_methods Bool)
(declare-const suspected_violation Bool)
(declare-const violation_101_1_report_submission_or_obstruction Bool)
(declare-const violation_113_occurred Bool)
(declare-const violation_11_4_or_43_2_report Bool)
(declare-const violation_17_1_or_17_2 Bool)
(declare-const violation_20_provision Bool)
(declare-const violation_26_49_74_81_99_100_document Bool)
(declare-const violation_29_43_45_96_announcement Bool)
(declare-const violation_47_2_report Bool)
(declare-const violation_60_1_2_customer_data Bool)
(declare-const violation_62_1_4_5_accounting_records Bool)
(declare-const violation_69_72_personnel_or_department Bool)
(declare-const violation_94_conflict_of_interest Bool)
(declare-const violation_96_2_refusal_of_designated_assignee Bool)
(declare-const violation_dismissal_of_officer Bool)
(declare-const violation_other_measures Bool)
(declare-const violation_penalty_level Int)
(declare-const violation_revocation_of_license Bool)
(declare-const violation_suspension_of_business Bool)
(declare-const violation_suspension_of_fund_raising_or_trustee Bool)
(declare-const violation_warning Bool)
(declare-const written_advisory_contract_signed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:report_submission_and_cooperation] 證券投資信託事業等應於期限內提出報告且不得規避妨礙檢查
(assert (= report_submission_and_cooperation
   (and report_submitted_within_deadline (not obstruction_or_refusal))))

; [securities:inspection_report_submission] 指定律師、會計師等專業人員檢查並據實提出報告
(assert (= inspection_report_submission
   (or (not inspection_by_designated_professional)
       inspection_report_submitted_truthfully)))

; [securities:inspection_cost_borne_by_inspected] 檢查費用由被檢查人負擔
(assert (= inspection_cost_borne_by_inspected inspection_cost_paid_by_inspected))

; [securities:information_provision_to_related_authorities] 主管機關得要求相關目的事業主管機關或金融機構提供必要資訊
(assert (= information_provided_to_related_authorities
   (or related_authorities_provided_information (not suspected_violation))))

; [securities:information_non_disclosure] 前三項所得資訊除必要外不得公布或提供他人
(assert (= information_non_disclosure
   (or disclosure_or_provision_to_others_allowed
       information_used_for_supervision_and_investor_protection)))

; [securities:violation_penalty_criteria] 違反本法或命令之處分等級
(assert (let ((a!1 (ite violation_suspension_of_fund_raising_or_trustee
                3
                (ite violation_suspension_of_business
                     4
                     (ite violation_revocation_of_license
                          5
                          (ite violation_other_measures 6 0))))))
  (= violation_penalty_level
     (ite violation_warning 1 (ite violation_dismissal_of_officer 2 a!1)))))

; [securities:penalty_violation_113] 違反第113條規定之罰鍰及改善責令
(assert (= violation_113_occurred
   (or violation_17_1_or_17_2
       violation_96_2_refusal_of_designated_assignee
       violation_26_49_74_81_99_100_document
       violation_101_1_report_submission_or_obstruction
       violation_94_conflict_of_interest
       violation_29_43_45_96_announcement
       violation_62_1_4_5_accounting_records
       violation_11_4_or_43_2_report
       violation_20_provision
       violation_47_2_report
       violation_69_72_personnel_or_department
       violation_60_1_2_customer_data)))

; [securities:client_knowledge_and_risk_assessment] 證券投資顧問事業應充分知悉並評估客戶投資知識、經驗、財務及風險承受度
(assert (= client_knowledge_and_risk_assessed client_knowledge_and_risk_assessed_flag))

; [securities:written_advisory_contract] 證券投資顧問事業應訂定書面證券投資顧問契約
(assert (= written_advisory_contract_signed advisory_contract_signed))

; [securities:advisory_contract_mandatory_items] 證券投資顧問契約應載明法定事項
(assert (= advisory_contract_mandatory_items_complete
   (and contract_party_names_and_addresses
        contract_rights_obligations_and_liabilities
        scope_of_investment_research_and_advice
        service_methods
        fees_and_payment_methods
        confidentiality_obligation
        no_disclosure_without_consent
        no_receipt_of_client_funds_or_profit_sharing
        contract_modification_or_termination
        contract_effective_date_and_duration
        client_right_to_terminate_within_7_days
        (= refund_ratio_and_method_on_termination 1.0)
        dispute_resolution_and_jurisdiction
        other_mandated_items)))

; [securities:contract_termination_compensation_limit] 契約終止時不得請求損害賠償或違約金
(assert (= contract_termination_compensation_limit
   (and compensation_for_services_before_termination_allowed
        no_claim_for_damages_or_penalty)))

; [securities:investment_analysis_report_requirements] 證券投資顧問事業應作成投資分析報告並載明合理分析基礎及根據
(assert (= investment_analysis_report_compliant
   (and investment_analysis_report_created
        reasonable_analysis_basis_and_references_included)))

; [securities:investment_analysis_report_retention] 投資分析報告副本及紀錄保存五年，可電子媒體形式
(assert (= investment_analysis_report_retained
   (and investment_analysis_report_copies_retained
        (<= 5.0 (to_real investment_analysis_report_retention_years)))))

; [securities:advisory_contract_retention] 證券投資顧問契約權利義務關係消滅日起保存五年
(assert (= advisory_contract_retained
   (and advisory_contract_retained_flag
        (<= 5.0 (to_real advisory_contract_retention_years)))))

; [securities:media_investment_analysis_record_retention] 各種傳播媒體提供投資分析者應保存節目錄影及錄音至少一年
(assert (= media_investment_analysis_record_retained
   (and media_investment_analysis_record_saved
        (<= 1.0 (to_real media_investment_analysis_record_retention_years)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第113條規定或未依規定提交報告或妨礙檢查時處罰
(assert (= penalty (or violation_113_occurred (not report_submission_and_cooperation))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= report_submitted_within_deadline false))
(assert (= obstruction_or_refusal true))
(assert (= violation_101_1_report_submission_or_obstruction true))
(assert (= violation_60_1_2_customer_data true))
(assert (= investment_analysis_report_copies_retained false))
(assert (= investment_analysis_report_created true))
(assert (= reasonable_analysis_basis_and_references_included true))
(assert (= investment_analysis_report_retention_years 0))
(assert (= investment_analysis_report_retained false))
(assert (= client_knowledge_and_risk_assessed_flag false))
(assert (= client_knowledge_and_risk_assessed false))
(assert (= violation_113_occurred true))
(assert (= violation_warning true))
(assert (= penalty true))
(assert (= advisory_contract_signed false))
(assert (= written_advisory_contract_signed false))
(assert (= advisory_contract_mandatory_items_complete false))
(assert (= advisory_contract_retained_flag false))
(assert (= advisory_contract_retained false))
(assert (= advisory_contract_retention_years 0))
(assert (= disclosure_or_provision_to_others_allowed false))
(assert (= information_non_disclosure true))
(assert (= information_used_for_supervision_and_investor_protection true))
(assert (= inspection_by_designated_professional false))
(assert (= inspection_report_submitted_truthfully false))
(assert (= inspection_report_submission false))
(assert (= inspection_cost_paid_by_inspected false))
(assert (= inspection_cost_borne_by_inspected false))
(assert (= related_authorities_provided_information false))
(assert (= suspected_violation true))
(assert (= information_provided_to_related_authorities false))
(assert (= no_disclosure_without_consent false))
(assert (= confidentiality_obligation false))
(assert (= contract_party_names_and_addresses false))
(assert (= contract_rights_obligations_and_liabilities false))
(assert (= scope_of_investment_research_and_advice false))
(assert (= service_methods false))
(assert (= fees_and_payment_methods false))
(assert (= no_receipt_of_client_funds_or_profit_sharing false))
(assert (= contract_modification_or_termination false))
(assert (= contract_effective_date_and_duration false))
(assert (= client_right_to_terminate_within_7_days false))
(assert (= refund_ratio_and_method_on_termination 0))
(assert (= dispute_resolution_and_jurisdiction false))
(assert (= other_mandated_items false))
(assert (= compensation_for_services_before_termination_allowed false))
(assert (= no_claim_for_damages_or_penalty false))
(assert (= media_investment_analysis_record_saved false))
(assert (= media_investment_analysis_record_retention_years 0))
(assert (= media_investment_analysis_record_retained false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 69
; Total facts: 50
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
