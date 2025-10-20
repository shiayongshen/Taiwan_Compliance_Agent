; SMT2 file generated from compliance case automatic
; Case ID: case_57
; Generated at: 2025-10-19T06:48:00.147420
;
; This file can be executed with Z3:
;   z3 case_57.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_by_authority Bool)
(declare-const association_membership_certificate Bool)
(declare-const business_guarantee_deposit_certificate Bool)
(declare-const business_license_applied Bool)
(declare-const business_office_documents Bool)
(declare-const business_rules Bool)
(declare-const business_type_discretionary_investment Bool)
(declare-const business_type_other_approved Bool)
(declare-const business_type_securities_advisory Bool)
(declare-const business_types_approved Bool)
(declare-const change_approval_required Bool)
(declare-const change_business_items Bool)
(declare-const change_capital Bool)
(declare-const change_company_name Bool)
(declare-const change_office_location Bool)
(declare-const client_assessment_done Bool)
(declare-const client_financial_status_assessed Bool)
(declare-const client_investment_experience_assessed Bool)
(declare-const client_investment_knowledge_assessed Bool)
(declare-const client_risk_tolerance_assessed Bool)
(declare-const company_articles Bool)
(declare-const company_registration_certificate Bool)
(declare-const company_registration_completed Bool)
(declare-const company_registration_documents_complete Bool)
(declare-const complies_company_law_article_16_1 Bool)
(declare-const contract_client_7_day_termination_right Bool)
(declare-const contract_confidentiality_obligation Bool)
(declare-const contract_dispute_resolution_and_jurisdiction Bool)
(declare-const contract_effective_date_and_duration Bool)
(declare-const contract_fees_and_payment_methods Bool)
(declare-const contract_mandatory_items_complete Bool)
(declare-const contract_modification_and_termination Bool)
(declare-const contract_no_client_fund_receipt_or_profit_sharing Bool)
(declare-const contract_no_disclosure_without_consent Bool)
(declare-const contract_other_mandated_items Bool)
(declare-const contract_party_names_and_addresses Bool)
(declare-const contract_refund_ratio_and_method Bool)
(declare-const contract_rights_obligations_liabilities Bool)
(declare-const contract_scope_of_advice Bool)
(declare-const contract_service_methods Bool)
(declare-const contract_signed Bool)
(declare-const directors_register_and_minutes Bool)
(declare-const dissolution_or_merger Bool)
(declare-const extension_count Int)
(declare-const extension_period_months Int)
(declare-const full_time_declaration Bool)
(declare-const fund_loaned_to_others Bool)
(declare-const fund_usage_restriction_ok Bool)
(declare-const fund_used_for_approved_mutual_funds Bool)
(declare-const fund_used_for_domestic_bank_deposits Bool)
(declare-const fund_used_for_government_bonds Bool)
(declare-const fund_used_for_non_operating_real_estate Bool)
(declare-const fund_used_for_other_approved_uses Bool)
(declare-const fund_used_for_treasury_bills_or_commercial_papers Bool)
(declare-const guarantee_and_collateral_restriction_ok Bool)
(declare-const has_article_68_condition Bool)
(declare-const has_justifiable_reason Bool)
(declare-const independent_office_declaration Bool)
(declare-const joined_trade_association Bool)
(declare-const meets_qualification_requirements Bool)
(declare-const membership_required Bool)
(declare-const months_since_permit Int)
(declare-const no_article_68_conditions_declaration Bool)
(declare-const no_false_or_concealment_declaration Bool)
(declare-const other_approval_matters Bool)
(declare-const penalty Bool)
(declare-const personnel_full_time Bool)
(declare-const personnel_registered_before_duty Bool)
(declare-const personnel_registration_ok Bool)
(declare-const personnel_registration_prohibited Bool)
(declare-const qualified_personnel_list_and_certificates Bool)
(declare-const registration_extension_allowed Bool)
(declare-const registration_within_6_months Bool)
(declare-const reinstatement_applied Bool)
(declare-const reinstatement_approved Bool)
(declare-const shareholders_register_and_minutes Bool)
(declare-const supervisors_register Bool)
(declare-const suspension_application_count Int)
(declare-const suspension_applied Bool)
(declare-const suspension_limit_ok Bool)
(declare-const suspension_period_expired Bool)
(declare-const suspension_period_months Int)
(declare-const suspension_permit_revoked Bool)
(declare-const suspension_reinstatement_closure Bool)
(declare-const transfer_major_business_or_assets Bool)
(declare-const unauthorized_suspension_months Int)
(declare-const unauthorized_suspension_revokes_permit Bool)
(declare-const violates_article_7 Bool)
(declare-const written_contract_signed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities_investment_advisory:business_types_approved] 證券投資顧問事業經營業務種類應報請主管機關核准
(assert (= business_types_approved
   (and business_type_securities_advisory
        business_type_discretionary_investment
        business_type_other_approved)))

; [securities_investment_advisory:change_approval_required] 證券投資顧問事業變更事項應先報請本會核准
(assert (= change_approval_required
   (or change_office_location
       other_approval_matters
       dissolution_or_merger
       transfer_major_business_or_assets
       change_capital
       change_company_name
       change_business_items
       suspension_reinstatement_closure)))

; [securities_investment_advisory:suspension_limit] 停業申請以一次為限且停業期間不得超過一年
(assert (= suspension_limit_ok
   (and (>= 1 suspension_application_count) (>= 12 suspension_period_months))))

; [securities_investment_advisory:suspension_permit_revoked_if_no_reinstatement] 停業屆期未申請復業或申請復業未獲核准者，廢止營業許可
(assert (= suspension_permit_revoked
   (or (and suspension_period_expired (not reinstatement_applied))
       (and reinstatement_applied (not reinstatement_approved)))))

; [securities_investment_advisory:unauthorized_suspension_revokes_permit] 未依規定申請停業而自行停業連續三個月以上者，廢止營業許可
(assert (= unauthorized_suspension_revokes_permit
   (and (not suspension_applied) (<= 3 unauthorized_suspension_months))))

; [securities_investment_advisory:fund_usage_restriction] 資金運用限制符合規定
(assert (= fund_usage_restriction_ok
   (and (not fund_loaned_to_others)
        (not fund_used_for_non_operating_real_estate)
        (or fund_used_for_approved_mutual_funds
            fund_used_for_other_approved_uses
            fund_used_for_treasury_bills_or_commercial_papers
            fund_used_for_government_bonds
            fund_used_for_domestic_bank_deposits))))

; [securities_investment_advisory:guarantee_and_collateral_restriction] 非符合公司法第十六條第一項規定且未經本會核准者，不得為保證、背書或提供擔保
(assert (= guarantee_and_collateral_restriction_ok
   (or complies_company_law_article_16_1 approved_by_authority)))

; [securities_investment_advisory:personnel_registration_required] 總經理、部門主管、分支機構經理人及業務人員應專任且執行前須登錄
(assert (= personnel_registration_ok
   (and personnel_full_time personnel_registered_before_duty)))

; [securities_investment_advisory:personnel_registration_prohibited_conditions] 有特定情事者不得登錄，已登錄者應撤銷
(assert (= personnel_registration_prohibited
   (or has_article_68_condition
       (not meets_qualification_requirements)
       violates_article_7)))

; [securities_investment_advisory:company_registration_documents_complete] 公司設立登記及申請核發營業執照文件齊備且符合規定
(assert (= company_registration_documents_complete
   (and company_registration_certificate
        company_articles
        business_rules
        shareholders_register_and_minutes
        directors_register_and_minutes
        supervisors_register
        qualified_personnel_list_and_certificates
        full_time_declaration
        no_article_68_conditions_declaration
        business_office_documents
        independent_office_declaration
        business_guarantee_deposit_certificate
        association_membership_certificate
        no_false_or_concealment_declaration)))

; [securities_investment_advisory:registration_within_6_months] 應於許可日起六個月內完成公司設立登記及申請營業執照
(assert (= registration_within_6_months
   (and (>= 6 months_since_permit)
        company_registration_completed
        business_license_applied)))

; [securities_investment_advisory:registration_extension_allowed] 有正當理由得申請展延一次，展延期限以六個月為限
(assert (= registration_extension_allowed
   (and has_justifiable_reason
        (>= 1 extension_count)
        (>= 6 extension_period_months))))

; [securities_investment_advisory:membership_required] 非加入同業公會不得開業
(assert (= membership_required joined_trade_association))

; [securities_investment_advisory:client_assessment_required] 接受客戶委任應充分知悉並評估客戶投資知識、經驗、財務狀況及風險承受度
(assert (= client_assessment_done
   (and client_investment_knowledge_assessed
        client_investment_experience_assessed
        client_financial_status_assessed
        client_risk_tolerance_assessed)))

; [securities_investment_advisory:written_contract_required] 提供分析意見或推介建議時應訂定書面證券投資顧問契約
(assert (= written_contract_signed contract_signed))

; [securities_investment_advisory:contract_mandatory_items] 證券投資顧問契約應載明法定事項
(assert (= contract_mandatory_items_complete
   (and contract_party_names_and_addresses
        contract_rights_obligations_liabilities
        contract_scope_of_advice
        contract_service_methods
        contract_fees_and_payment_methods
        contract_confidentiality_obligation
        contract_no_disclosure_without_consent
        contract_no_client_fund_receipt_or_profit_sharing
        contract_modification_and_termination
        contract_effective_date_and_duration
        contract_client_7_day_termination_right
        contract_refund_ratio_and_method
        contract_dispute_resolution_and_jurisdiction
        contract_other_mandated_items)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法定規定時處罰
(assert (= penalty
   (or (not client_assessment_done)
       (not guarantee_and_collateral_restriction_ok)
       (not business_types_approved)
       (not personnel_registration_ok)
       (not registration_extension_allowed)
       unauthorized_suspension_revokes_permit
       (not fund_usage_restriction_ok)
       (not membership_required)
       (not registration_within_6_months)
       (not company_registration_documents_complete)
       (not written_contract_signed)
       suspension_permit_revoked
       personnel_registration_prohibited
       (not contract_mandatory_items_complete)
       (not suspension_limit_ok)
       (not change_approval_required))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= business_type_securities_advisory true))
(assert (= business_type_discretionary_investment false))
(assert (= business_type_other_approved false))
(assert (= change_company_name false))
(assert (= change_capital false))
(assert (= change_business_items false))
(assert (= change_office_location true))
(assert (= transfer_major_business_or_assets false))
(assert (= dissolution_or_merger false))
(assert (= other_approval_matters false))
(assert (= fund_loaned_to_others true))
(assert (= fund_used_for_non_operating_real_estate false))
(assert (= fund_used_for_domestic_bank_deposits false))
(assert (= fund_used_for_government_bonds false))
(assert (= fund_used_for_treasury_bills_or_commercial_papers false))
(assert (= fund_used_for_approved_mutual_funds false))
(assert (= fund_used_for_other_approved_uses false))
(assert (= complies_company_law_article_16_1 false))
(assert (= approved_by_authority false))
(assert (= personnel_full_time false))
(assert (= personnel_registered_before_duty false))
(assert (= has_article_68_condition false))
(assert (= meets_qualification_requirements true))
(assert (= violates_article_7 false))
(assert (= personnel_registration_prohibited false))
(assert (= company_registration_certificate true))
(assert (= company_articles true))
(assert (= business_rules true))
(assert (= shareholders_register_and_minutes true))
(assert (= directors_register_and_minutes true))
(assert (= supervisors_register true))
(assert (= qualified_personnel_list_and_certificates true))
(assert (= full_time_declaration true))
(assert (= no_article_68_conditions_declaration true))
(assert (= business_office_documents true))
(assert (= independent_office_declaration false))
(assert (= business_guarantee_deposit_certificate true))
(assert (= association_membership_certificate true))
(assert (= no_false_or_concealment_declaration true))
(assert (= company_registration_completed true))
(assert (= business_license_applied true))
(assert (= months_since_permit 12))
(assert (= has_justifiable_reason false))
(assert (= extension_count 0))
(assert (= extension_period_months 0))
(assert (= joined_trade_association true))
(assert (= client_investment_knowledge_assessed false))
(assert (= client_investment_experience_assessed false))
(assert (= client_financial_status_assessed false))
(assert (= client_risk_tolerance_assessed false))
(assert (= contract_signed false))
(assert (= contract_party_names_and_addresses false))
(assert (= contract_rights_obligations_liabilities false))
(assert (= contract_scope_of_advice false))
(assert (= contract_service_methods false))
(assert (= contract_fees_and_payment_methods false))
(assert (= contract_confidentiality_obligation false))
(assert (= contract_no_disclosure_without_consent false))
(assert (= contract_no_client_fund_receipt_or_profit_sharing false))
(assert (= contract_modification_and_termination false))
(assert (= contract_effective_date_and_duration false))
(assert (= contract_client_7_day_termination_right false))
(assert (= contract_refund_ratio_and_method false))
(assert (= contract_dispute_resolution_and_jurisdiction false))
(assert (= contract_other_mandated_items false))
(assert (= business_types_approved false))
(assert (= change_approval_required false))
(assert (= client_assessment_done false))
(assert (= company_registration_documents_complete false))
(assert (= contract_mandatory_items_complete false))
(assert (= fund_usage_restriction_ok false))
(assert (= guarantee_and_collateral_restriction_ok false))
(assert (= membership_required false))
(assert (= penalty false))
(assert (= personnel_registration_ok false))
(assert (= registration_extension_allowed false))
(assert (= registration_within_6_months false))
(assert (= reinstatement_applied false))
(assert (= reinstatement_approved false))
(assert (= suspension_application_count 0))
(assert (= suspension_applied false))
(assert (= suspension_limit_ok false))
(assert (= suspension_period_expired false))
(assert (= suspension_period_months 0))
(assert (= suspension_permit_revoked false))
(assert (= suspension_reinstatement_closure false))
(assert (= unauthorized_suspension_months 0))
(assert (= unauthorized_suspension_revokes_permit false))
(assert (= written_contract_signed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 89
; Total facts: 89
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
