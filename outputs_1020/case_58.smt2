; SMT2 file generated from compliance case automatic
; Case ID: case_58
; Generated at: 2025-10-19T06:50:56.079613
;
; This file can be executed with Z3:
;   z3 case_58.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const application_and_attachments_truthful_declaration_submitted Bool)
(declare-const association_membership_certificate_submitted Bool)
(declare-const business_deposit_certificate_submitted Bool)
(declare-const business_license_application_documents_complete Bool)
(declare-const business_license_expiry_due_to_no_recovery Bool)
(declare-const business_premises_documents_submitted Bool)
(declare-const business_premises_independent_declaration_submitted Bool)
(declare-const business_rules_content_ok Bool)
(declare-const business_rules_include_dispute_handling Bool)
(declare-const business_rules_include_principles Bool)
(declare-const business_rules_include_procedures Bool)
(declare-const business_rules_include_responsibilities Bool)
(declare-const business_rules_include_training_and_management Bool)
(declare-const business_rules_submitted Bool)
(declare-const business_types_approved Bool)
(declare-const business_types_reported_to_authority Bool)
(declare-const client_investment_knowledge_assessed Bool)
(declare-const client_investment_knowledge_evaluated Bool)
(declare-const company_articles_submitted Bool)
(declare-const company_establishment_registration_within_6_months Bool)
(declare-const company_registration_certificate_submitted Bool)
(declare-const compensation_for_services_before_termination_allowed Bool)
(declare-const compensation_for_termination_damage_or_penalty_allowed Bool)
(declare-const contract_client_7_day_termination_right_included Bool)
(declare-const contract_confidentiality_clause_included Bool)
(declare-const contract_dispute_resolution_and_jurisdiction_included Bool)
(declare-const contract_effective_date_and_duration_included Bool)
(declare-const contract_fees_and_payment_methods_included Bool)
(declare-const contract_mandatory_contents_ok Bool)
(declare-const contract_modification_and_termination_included Bool)
(declare-const contract_other_mandatory_items_included Bool)
(declare-const contract_party_names_and_addresses_included Bool)
(declare-const contract_prohibition_of_disclosure_included Bool)
(declare-const contract_prohibition_of_fund_receipt_and_profit_sharing_included Bool)
(declare-const contract_refund_ratio_and_method_included Bool)
(declare-const contract_rights_obligations_and_liabilities_included Bool)
(declare-const contract_scope_of_advice_included Bool)
(declare-const contract_service_methods_included Bool)
(declare-const contract_termination_compensation_limit_ok Bool)
(declare-const directors_list_and_minutes_submitted Bool)
(declare-const exclusive_employment_declaration_submitted Bool)
(declare-const fund_loan_to_others Bool)
(declare-const fund_purchase_non_operating_real_estate Bool)
(declare-const fund_usage_approved_securities_investment_trust_funds Bool)
(declare-const fund_usage_domestic_bank_deposit Bool)
(declare-const fund_usage_government_bonds Bool)
(declare-const fund_usage_limit_ok Bool)
(declare-const fund_usage_other_approved_uses Bool)
(declare-const fund_usage_treasury_bills_or_commercial_papers Bool)
(declare-const fund_used_for_other_purposes Bool)
(declare-const guarantee_or_endorsement_or_collateral_approved Bool)
(declare-const guarantee_or_endorsement_or_collateral_provided Bool)
(declare-const investment_asset_diversification_compliant Bool)
(declare-const investment_asset_exceptions_agreed_in_contract Bool)
(declare-const investment_asset_exceptions_ok Bool)
(declare-const investment_asset_exceptions_specified_by_authority Bool)
(declare-const investment_in_any_company_bonds_or_financial_bonds Bool)
(declare-const investment_in_any_company_stock_bonds_warrants Bool)
(declare-const investment_in_trust_beneficiary_certificates_and_asset_backed_securities Bool)
(declare-const joined_trade_association Bool)
(declare-const membership_requirement_ok Bool)
(declare-const months_since_license_issued Int)
(declare-const net_asset_value_of_fiduciary_account Real)
(declare-const no_prohibited_personnel_declaration_submitted Bool)
(declare-const penalty Bool)
(declare-const personnel_exclusive Bool)
(declare-const personnel_has_prohibited_condition_68 Bool)
(declare-const personnel_meets_qualification Bool)
(declare-const personnel_registered_before_execution Bool)
(declare-const personnel_registration_and_exclusivity_ok Bool)
(declare-const personnel_registration_prohibition_ok Bool)
(declare-const personnel_violated_rule_7 Bool)
(declare-const prohibited_fund_usage_ok Bool)
(declare-const qualified_personnel_list_and_certificates_submitted Bool)
(declare-const recovery_application_approved Bool)
(declare-const recovery_application_submitted Bool)
(declare-const shareholders_list_and_minutes_submitted Bool)
(declare-const stop_business_application_count Int)
(declare-const stop_business_application_limit_ok Bool)
(declare-const stop_business_application_submitted Bool)
(declare-const stop_business_period_expired Bool)
(declare-const stop_business_period_months Int)
(declare-const supervisors_list_submitted Bool)
(declare-const unauthorized_stop_business_months Int)
(declare-const unauthorized_stop_business_over_3_months Bool)
(declare-const written_contract_required Bool)
(declare-const written_contract_signed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities_investment_advisory:business_types_approved] 證券投資顧問事業經營之業務種類應報請主管機關核准
(assert (= business_types_approved business_types_reported_to_authority))

; [securities_investment_advisory:stop_business_application_limit] 停業申請以一次為限，停業期間自核准日起不得超過一年
(assert (= stop_business_application_limit_ok
   (and (>= 1 stop_business_application_count)
        (>= 12 stop_business_period_months))))

; [securities_investment_advisory:business_license_expiry_due_to_no_recovery] 停業屆期未申請復業或申請復業未獲核准，廢止營業許可
(assert (= business_license_expiry_due_to_no_recovery
   (or (and recovery_application_submitted (not recovery_application_approved))
       (and stop_business_period_expired (not recovery_application_submitted)))))

; [securities_investment_advisory:unauthorized_stop_business_over_3_months] 未依規定申請停業而自行停業連續三個月以上，廢止營業許可
(assert (= unauthorized_stop_business_over_3_months
   (and (not stop_business_application_submitted)
        (<= 3 unauthorized_stop_business_months))))

; [securities_investment_advisory:fund_usage_limit] 資金運用限於法定用途
(assert (= fund_usage_limit_ok
   (or fund_usage_domestic_bank_deposit
       fund_usage_treasury_bills_or_commercial_papers
       fund_usage_approved_securities_investment_trust_funds
       fund_usage_other_approved_uses
       fund_usage_government_bonds)))

; [securities_investment_advisory:prohibited_fund_usage] 資金不得貸與他人、購置非營業用不動產或移作他項用途，且不得為保證、背書或提供擔保，除非經核准
(assert (= prohibited_fund_usage_ok
   (and (not fund_loan_to_others)
        (not fund_purchase_non_operating_real_estate)
        (not fund_used_for_other_purposes)
        (or guarantee_or_endorsement_or_collateral_approved
            (not guarantee_or_endorsement_or_collateral_provided)))))

; [securities_investment_advisory:personnel_registration_and_exclusivity] 總經理、部門主管、分支機構經理人及業務人員應專任且執行前須登錄，非登錄不得執行業務
(assert (= personnel_registration_and_exclusivity_ok
   (and personnel_exclusive personnel_registered_before_execution)))

; [securities_investment_advisory:personnel_registration_prohibition] 有法定禁止情事者不得登錄，已登錄者應撤銷
(assert (not (= (or personnel_has_prohibited_condition_68
            (not personnel_meets_qualification)
            personnel_violated_rule_7)
        personnel_registration_prohibition_ok)))

; [securities_investment_advisory:company_establishment_registration_within_6_months] 證券投資顧問事業應於許可日起六個月內完成公司設立登記
(assert (= company_establishment_registration_within_6_months
   (>= 6 months_since_license_issued)))

; [securities_investment_advisory:business_license_application_documents_complete] 申請核發營業執照應檢具法定文件
(assert (= business_license_application_documents_complete
   (and company_registration_certificate_submitted
        company_articles_submitted
        business_rules_submitted
        shareholders_list_and_minutes_submitted
        directors_list_and_minutes_submitted
        supervisors_list_submitted
        qualified_personnel_list_and_certificates_submitted
        exclusive_employment_declaration_submitted
        no_prohibited_personnel_declaration_submitted
        business_premises_documents_submitted
        business_premises_independent_declaration_submitted
        business_deposit_certificate_submitted
        association_membership_certificate_submitted
        application_and_attachments_truthful_declaration_submitted)))

; [securities_investment_advisory:business_rules_content] 業務章則應載明經營原則、作業手續、權責劃分、紛爭處理、人員教育訓練及管理事項
(assert (= business_rules_content_ok
   (and business_rules_include_principles
        business_rules_include_procedures
        business_rules_include_responsibilities
        business_rules_include_dispute_handling
        business_rules_include_training_and_management)))

; [securities_investment_advisory:membership_requirement] 非加入同業公會不得開業
(assert (= membership_requirement_ok joined_trade_association))

; [securities_investment_advisory:client_investment_knowledge_assessment] 接受客戶委任應充分知悉並評估客戶投資知識、經驗、財務狀況及風險承受度
(assert (= client_investment_knowledge_assessed client_investment_knowledge_evaluated))

; [securities_investment_advisory:written_contract_required] 提供分析意見或推介建議時應訂定書面證券投資顧問契約
(assert (= written_contract_required written_contract_signed))

; [securities_investment_advisory:contract_mandatory_contents] 證券投資顧問契約應載明法定事項
(assert (= contract_mandatory_contents_ok
   (and contract_party_names_and_addresses_included
        contract_rights_obligations_and_liabilities_included
        contract_scope_of_advice_included
        contract_service_methods_included
        contract_fees_and_payment_methods_included
        contract_confidentiality_clause_included
        contract_prohibition_of_disclosure_included
        contract_prohibition_of_fund_receipt_and_profit_sharing_included
        contract_modification_and_termination_included
        contract_effective_date_and_duration_included
        contract_client_7_day_termination_right_included
        contract_refund_ratio_and_method_included
        contract_dispute_resolution_and_jurisdiction_included
        contract_other_mandatory_items_included)))

; [securities_investment_advisory:contract_termination_compensation_limit] 契約終止時得請求終止前所提供服務之相當報酬，但不得請求損害賠償或違約金
(assert (= contract_termination_compensation_limit_ok
   (and compensation_for_services_before_termination_allowed
        (not compensation_for_termination_damage_or_penalty_allowed))))

; [securities_investment_advisory:investment_asset_diversification_compliance] 委託投資資產分散投資及投資標的分散比率符合規定
(assert (let ((a!1 (and (<= (/ (ite investment_in_any_company_stock_bonds_warrants
                            1.0
                            0.0)
                       net_asset_value_of_fiduciary_account)
                    (/ 1.0 5.0))
                (<= (/ (ite investment_in_any_company_bonds_or_financial_bonds
                            1.0
                            0.0)
                       net_asset_value_of_fiduciary_account)
                    (/ 1.0 10.0))
                (<= (/ (ite investment_in_trust_beneficiary_certificates_and_asset_backed_securities
                            1.0
                            0.0)
                       net_asset_value_of_fiduciary_account)
                    (/ 1.0 5.0)))))
  (= investment_asset_diversification_compliant a!1)))

; [securities_investment_advisory:investment_asset_exceptions] 特定投資標的除外於分散比率限制
(assert (= investment_asset_exceptions_ok
   (or investment_asset_exceptions_agreed_in_contract
       investment_asset_exceptions_specified_by_authority)))

; [securities_investment_advisory:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities_investment_advisory:penalty_conditions] 處罰條件：違反業務種類核准、停業申請限制、停業復業規定、資金運用限制、人員登錄及專任、公司設立登記期限、營業執照申請文件、業務章則內容、同業公會加入、書面契約及契約內容、委託投資資產分散投資等規定時處罰
(assert (let ((a!1 (not (<= (/ (ite investment_in_any_company_bonds_or_financial_bonds
                            1.0
                            0.0)
                       net_asset_value_of_fiduciary_account)
                    (/ 1.0 10.0))))
      (a!2 (not (<= (/ (ite investment_in_trust_beneficiary_certificates_and_asset_backed_securities
                            1.0
                            0.0)
                       net_asset_value_of_fiduciary_account)
                    (/ 1.0 5.0))))
      (a!3 (not (<= (/ (ite investment_in_any_company_stock_bonds_warrants
                            1.0
                            0.0)
                       net_asset_value_of_fiduciary_account)
                    (/ 1.0 5.0)))))
  (= penalty
     (or (not contract_mandatory_contents_ok)
         (not personnel_registration_and_exclusivity_ok)
         (not business_license_application_documents_complete)
         (not client_investment_knowledge_assessed)
         (not stop_business_application_limit_ok)
         (not prohibited_fund_usage_ok)
         (not company_establishment_registration_within_6_months)
         business_license_expiry_due_to_no_recovery
         (not written_contract_required)
         unauthorized_stop_business_over_3_months
         (not personnel_registration_prohibition_ok)
         (not membership_requirement_ok)
         (and (not investment_asset_exceptions_ok) (or a!1 a!2 a!3))
         (not investment_asset_diversification_compliant)
         (not contract_termination_compensation_limit_ok)
         (not business_types_approved)
         (not fund_usage_limit_ok)
         (not business_rules_content_ok)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= business_types_reported_to_authority true))
(assert (= business_types_approved false))
(assert (= stop_business_application_count 0))
(assert (= stop_business_period_months 0))
(assert (= stop_business_period_expired false))
(assert (= recovery_application_submitted false))
(assert (= recovery_application_approved false))
(assert (= unauthorized_stop_business_months 0))
(assert (= unauthorized_stop_business_over_3_months false))
(assert (= fund_loan_to_others true))
(assert (= fund_purchase_non_operating_real_estate false))
(assert (= fund_used_for_other_purposes false))
(assert (= guarantee_or_endorsement_or_collateral_provided false))
(assert (= guarantee_or_endorsement_or_collateral_approved false))
(assert (= prohibited_fund_usage_ok false))
(assert (= fund_usage_domestic_bank_deposit false))
(assert (= fund_usage_government_bonds false))
(assert (= fund_usage_treasury_bills_or_commercial_papers false))
(assert (= fund_usage_approved_securities_investment_trust_funds false))
(assert (= fund_usage_other_approved_uses false))
(assert (= fund_usage_limit_ok false))
(assert (= personnel_exclusive false))
(assert (= personnel_registered_before_execution false))
(assert (= personnel_registration_and_exclusivity_ok false))
(assert (= personnel_has_prohibited_condition_68 false))
(assert (= personnel_meets_qualification true))
(assert (= personnel_violated_rule_7 true))
(assert (= personnel_registration_prohibition_ok false))
(assert (= months_since_license_issued 26))
(assert (= company_establishment_registration_within_6_months false))
(assert (= company_registration_certificate_submitted true))
(assert (= company_articles_submitted true))
(assert (= business_rules_submitted true))
(assert (= business_rules_include_principles true))
(assert (= business_rules_include_procedures true))
(assert (= business_rules_include_responsibilities true))
(assert (= business_rules_include_dispute_handling true))
(assert (= business_rules_include_training_and_management true))
(assert (= business_rules_content_ok true))
(assert (= shareholders_list_and_minutes_submitted true))
(assert (= directors_list_and_minutes_submitted true))
(assert (= supervisors_list_submitted true))
(assert (= qualified_personnel_list_and_certificates_submitted true))
(assert (= exclusive_employment_declaration_submitted true))
(assert (= no_prohibited_personnel_declaration_submitted true))
(assert (= business_premises_documents_submitted true))
(assert (= business_premises_independent_declaration_submitted false))
(assert (= business_deposit_certificate_submitted true))
(assert (= association_membership_certificate_submitted true))
(assert (= application_and_attachments_truthful_declaration_submitted true))
(assert (= joined_trade_association true))
(assert (= membership_requirement_ok true))
(assert (= client_investment_knowledge_evaluated true))
(assert (= client_investment_knowledge_assessed true))
(assert (= written_contract_signed true))
(assert (= written_contract_required true))
(assert (= contract_party_names_and_addresses_included true))
(assert (= contract_rights_obligations_and_liabilities_included true))
(assert (= contract_scope_of_advice_included true))
(assert (= contract_service_methods_included true))
(assert (= contract_fees_and_payment_methods_included true))
(assert (= contract_confidentiality_clause_included true))
(assert (= contract_prohibition_of_disclosure_included true))
(assert (= contract_prohibition_of_fund_receipt_and_profit_sharing_included true))
(assert (= contract_modification_and_termination_included true))
(assert (= contract_effective_date_and_duration_included true))
(assert (= contract_client_7_day_termination_right_included true))
(assert (= contract_refund_ratio_and_method_included true))
(assert (= contract_dispute_resolution_and_jurisdiction_included true))
(assert (= contract_other_mandatory_items_included true))
(assert (= contract_mandatory_contents_ok true))
(assert (= compensation_for_services_before_termination_allowed true))
(assert (= compensation_for_termination_damage_or_penalty_allowed false))
(assert (= contract_termination_compensation_limit_ok true))
(assert (= investment_in_any_company_stock_bonds_warrants false))
(assert (= investment_in_any_company_bonds_or_financial_bonds false))
(assert (= investment_in_trust_beneficiary_certificates_and_asset_backed_securities false))
(assert (= net_asset_value_of_fiduciary_account 0.0))
(assert (= investment_asset_diversification_compliant true))
(assert (= investment_asset_exceptions_agreed_in_contract false))
(assert (= investment_asset_exceptions_specified_by_authority false))
(assert (= investment_asset_exceptions_ok true))
(assert (= penalty true))
(assert (= business_license_application_documents_complete false))
(assert (= business_license_expiry_due_to_no_recovery false))
(assert (= stop_business_application_limit_ok false))
(assert (= stop_business_application_submitted false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 87
; Total facts: 87
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
