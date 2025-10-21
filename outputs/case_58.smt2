; SMT2 file generated from compliance case automatic
; Case ID: case_58
; Generated at: 2025-10-21T00:24:39.529116
;
; This file can be executed with Z3:
;   z3 case_58.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const all_personnel_full_time_declaration_submitted Bool)
(declare-const application_form_submitted Bool)
(declare-const approved_by_authority Bool)
(declare-const association_membership_proof_submitted Bool)
(declare-const business_license_application_complete Bool)
(declare-const business_license_revoked Bool)
(declare-const business_premises_documented Bool)
(declare-const business_premises_independent Bool)
(declare-const business_rules_included Bool)
(declare-const business_type_discretionary_investment Bool)
(declare-const business_type_other_approved Bool)
(declare-const business_type_securities_advisory Bool)
(declare-const business_types_approved Bool)
(declare-const capital_deposit_in_domestic_banks Bool)
(declare-const capital_loan_to_others Bool)
(declare-const capital_other_approved_uses Bool)
(declare-const capital_purchase_approved_securities_investment_trust_funds Bool)
(declare-const capital_purchase_domestic_government_bonds Bool)
(declare-const capital_purchase_domestic_treasury_bills_or_commercial_papers Bool)
(declare-const capital_purchase_non_operating_real_estate Bool)
(declare-const capital_usage_limited Bool)
(declare-const capital_used_for_other_purposes Bool)
(declare-const client_financial_status_assessed Bool)
(declare-const client_investment_assessment_done Bool)
(declare-const client_investment_experience_assessed Bool)
(declare-const client_investment_knowledge_assessed Bool)
(declare-const client_risk_tolerance_assessed Bool)
(declare-const company_registration_completed Bool)
(declare-const compensation_requested Bool)
(declare-const complies_company_law_article_16_1 Bool)
(declare-const contract_allows_client_termination_within_7_days Bool)
(declare-const contract_includes_confidentiality Bool)
(declare-const contract_includes_dispute_resolution_and_jurisdiction Bool)
(declare-const contract_includes_effective_date_and_duration Bool)
(declare-const contract_includes_fees_and_payment Bool)
(declare-const contract_includes_modification_and_termination Bool)
(declare-const contract_includes_other_mandatory_items Bool)
(declare-const contract_includes_parties_info Bool)
(declare-const contract_includes_refund_ratio_and_method Bool)
(declare-const contract_includes_rights_obligations Bool)
(declare-const contract_includes_service_method Bool)
(declare-const contract_includes_service_scope Bool)
(declare-const contract_prohibits_client_disclosure Bool)
(declare-const contract_signed Bool)
(declare-const contract_termination_compensation_compliant Bool)
(declare-const damages_requested Bool)
(declare-const deposit_of_business_guarantee_submitted Bool)
(declare-const discretionary_investment_account_net_asset_value Real)
(declare-const documents_submitted Bool)
(declare-const does_not_meet_qualification Bool)
(declare-const extension_applied Bool)
(declare-const extension_months Int)
(declare-const guarantee_and_collateral_restricted Bool)
(declare-const has_article_68_disqualification Bool)
(declare-const investment_asset_diversification_compliant Bool)
(declare-const investment_in_single_company_bond Bool)
(declare-const investment_in_single_company_stock_bond_warrant Bool)
(declare-const investment_in_trust_beneficiary_certificates_and_asset_backed_securities Bool)
(declare-const joined_trade_association Bool)
(declare-const membership_required_to_operate Bool)
(declare-const months_since_permit Int)
(declare-const no_article_68_disqualification_declaration_submitted Bool)
(declare-const no_false_or_concealment_statement Bool)
(declare-const penalty Bool)
(declare-const penalty_requested Bool)
(declare-const personnel_full_time Bool)
(declare-const personnel_registered Bool)
(declare-const personnel_registration_compliant Bool)
(declare-const personnel_registration_revoked Bool)
(declare-const provides_bill_endorsement Bool)
(declare-const provides_collateral Bool)
(declare-const provides_guarantee Bool)
(declare-const qualified_personnel_list_submitted Bool)
(declare-const reopen_application_approved Bool)
(declare-const reopen_application_submitted Bool)
(declare-const stop_business_application_count Int)
(declare-const stop_business_application_submitted Bool)
(declare-const stop_business_application_valid Bool)
(declare-const stop_business_period_expired Bool)
(declare-const stop_business_period_months Int)
(declare-const stop_business_permit_revoked Bool)
(declare-const unauthorized_stop_business_months Int)
(declare-const unauthorized_stop_business_revoked Bool)
(declare-const violates_article_7 Bool)
(declare-const written_contract_signed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities_investment_advisory:business_types_approved] 證券投資顧問事業經營之業務種類應報請主管機關核准
(assert (= business_types_approved
   (and business_type_securities_advisory
        business_type_discretionary_investment
        business_type_other_approved)))

; [securities_investment_advisory:stop_business_application_limit] 停業申請以一次為限，停業期間不得超過一年
(assert (= stop_business_application_valid
   (and (>= 1 stop_business_application_count)
        (>= 12 stop_business_period_months))))

; [securities_investment_advisory:stop_business_permit_revoked_if_no_reopen] 停業屆期未申請復業或申請復業未獲核准，廢止營業許可
(assert (= stop_business_permit_revoked
   (or (and stop_business_period_expired (not reopen_application_submitted))
       (and reopen_application_submitted (not reopen_application_approved)))))

; [securities_investment_advisory:unauthorized_stop_business_revoked] 未依規定申請停業而自行停業連續三個月以上，廢止營業許可
(assert (= unauthorized_stop_business_revoked
   (and (not stop_business_application_submitted)
        (<= 3 unauthorized_stop_business_months))))

; [securities_investment_advisory:capital_usage_limit] 資金運用限於法定項目
(assert (= capital_usage_limited
   (and (not capital_loan_to_others)
        (not capital_purchase_non_operating_real_estate)
        (not capital_used_for_other_purposes)
        (or capital_purchase_domestic_government_bonds
            capital_deposit_in_domestic_banks
            capital_other_approved_uses
            capital_purchase_domestic_treasury_bills_or_commercial_papers
            capital_purchase_approved_securities_investment_trust_funds))))

; [securities_investment_advisory:guarantee_and_collateral_restriction] 不得為保證、票據背書或提供財產擔保，除非符合公司法並經核准
(assert (= guarantee_and_collateral_restricted
   (or (not (or provides_collateral
                provides_bill_endorsement
                provides_guarantee))
       (and complies_company_law_article_16_1 approved_by_authority))))

; [securities_investment_advisory:personnel_registration_required] 總經理、部門主管、分支機構經理人及業務人員應專任且登錄，未登錄不得執行業務
(assert (= personnel_registration_compliant
   (and personnel_full_time personnel_registered)))

; [securities_investment_advisory:personnel_registration_revoked_conditions] 有法定不適任情事、不符合資格條件或違反規定者，應撤銷登錄
(assert (= personnel_registration_revoked
   (or does_not_meet_qualification
       violates_article_7
       has_article_68_disqualification)))

; [securities_investment_advisory:business_license_application_complete] 申請核發營業執照應於六個月內完成公司設立登記並檢具法定文件
(assert (= business_license_application_complete
   (and (>= 6 months_since_permit)
        company_registration_completed
        application_form_submitted
        documents_submitted
        business_rules_included
        association_membership_proof_submitted
        no_false_or_concealment_statement
        business_premises_independent
        business_premises_documented
        deposit_of_business_guarantee_submitted
        qualified_personnel_list_submitted
        all_personnel_full_time_declaration_submitted
        no_article_68_disqualification_declaration_submitted)))

; [securities_investment_advisory:business_license_revoked_if_not_applied] 未於規定期間內申請核發營業執照者，廢止其許可；有正當理由得申請展延一次，限六個月
(assert (let ((a!1 (and (not business_license_application_complete)
                (or (not extension_applied) (not (<= extension_months 6))))))
  (= business_license_revoked a!1)))

; [securities_investment_advisory:membership_required_to_operate] 非加入同業公會，不得開業
(assert (= membership_required_to_operate joined_trade_association))

; [securities_investment_advisory:client_investment_assessment_required] 接受客戶委任應充分知悉並評估客戶投資知識、經驗、財務狀況及風險承受度
(assert (= client_investment_assessment_done
   (and client_investment_knowledge_assessed
        client_investment_experience_assessed
        client_financial_status_assessed
        client_risk_tolerance_assessed)))

; [securities_investment_advisory:written_contract_required] 提供分析意見或推介建議時應訂定書面證券投資顧問契約
(assert (= written_contract_signed
   (and contract_signed
        contract_includes_parties_info
        contract_includes_rights_obligations
        contract_includes_service_scope
        contract_includes_service_method
        contract_includes_fees_and_payment
        contract_includes_confidentiality
        contract_prohibits_client_disclosure
        contract_includes_modification_and_termination
        contract_includes_effective_date_and_duration
        contract_allows_client_termination_within_7_days
        contract_includes_refund_ratio_and_method
        contract_includes_dispute_resolution_and_jurisdiction
        contract_includes_other_mandatory_items)))

; [securities_investment_advisory:contract_termination_compensation_limit] 契約終止時得請求終止前所提供服務之相當報酬，不得請求損害賠償或違約金
(assert (= contract_termination_compensation_compliant
   (and compensation_requested (not damages_requested) (not penalty_requested))))

; [securities_investment_advisory:investment_asset_diversification_compliant] 委託投資資產分散投資符合比率限制
(assert (let ((a!1 (and (<= (/ (ite investment_in_single_company_stock_bond_warrant
                            1.0
                            0.0)
                       discretionary_investment_account_net_asset_value)
                    (/ 1.0 5.0))
                (<= (/ (ite investment_in_single_company_bond 1.0 0.0)
                       discretionary_investment_account_net_asset_value)
                    (/ 1.0 10.0))
                (<= (/ (ite investment_in_trust_beneficiary_certificates_and_asset_backed_securities
                            1.0
                            0.0)
                       discretionary_investment_account_net_asset_value)
                    (/ 1.0 5.0)))))
  (= investment_asset_diversification_compliant a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法定規定時處罰
(assert (= penalty
   (or business_license_revoked
       (not business_types_approved)
       (not business_license_application_complete)
       (not stop_business_application_valid)
       stop_business_permit_revoked
       (not personnel_registration_compliant)
       (not contract_termination_compensation_compliant)
       (not capital_usage_limited)
       unauthorized_stop_business_revoked
       personnel_registration_revoked
       (not guarantee_and_collateral_restricted)
       (not client_investment_assessment_done)
       (not written_contract_signed)
       (not membership_required_to_operate)
       (not investment_asset_diversification_compliant))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= business_type_securities_advisory true))
(assert (= business_type_discretionary_investment true))
(assert (= business_type_other_approved true))
(assert (= business_types_approved false))
(assert (= capital_loan_to_others true))
(assert (= capital_purchase_non_operating_real_estate false))
(assert (= capital_used_for_other_purposes false))
(assert (= capital_deposit_in_domestic_banks false))
(assert (= capital_purchase_domestic_government_bonds false))
(assert (= capital_purchase_domestic_treasury_bills_or_commercial_papers false))
(assert (= capital_purchase_approved_securities_investment_trust_funds false))
(assert (= capital_other_approved_uses false))
(assert (= capital_usage_limited false))
(assert (= personnel_full_time false))
(assert (= personnel_registered true))
(assert (= personnel_registration_compliant false))
(assert (= has_article_68_disqualification false))
(assert (= does_not_meet_qualification false))
(assert (= violates_article_7 false))
(assert (= personnel_registration_revoked false))
(assert (= business_premises_independent false))
(assert (= business_premises_documented true))
(assert (= application_form_submitted true))
(assert (= documents_submitted true))
(assert (= business_rules_included true))
(assert (= association_membership_proof_submitted true))
(assert (= all_personnel_full_time_declaration_submitted true))
(assert (= no_article_68_disqualification_declaration_submitted true))
(assert (= no_false_or_concealment_statement true))
(assert (= business_license_application_complete true))
(assert (= business_license_revoked false))
(assert (= joined_trade_association true))
(assert (= membership_required_to_operate true))
(assert (= client_investment_knowledge_assessed true))
(assert (= client_investment_experience_assessed true))
(assert (= client_financial_status_assessed true))
(assert (= client_risk_tolerance_assessed true))
(assert (= client_investment_assessment_done true))
(assert (= contract_signed true))
(assert (= contract_includes_parties_info true))
(assert (= contract_includes_rights_obligations true))
(assert (= contract_includes_service_scope true))
(assert (= contract_includes_service_method true))
(assert (= contract_includes_fees_and_payment true))
(assert (= contract_includes_confidentiality true))
(assert (= contract_prohibits_client_disclosure true))
(assert (= contract_includes_modification_and_termination true))
(assert (= contract_includes_effective_date_and_duration true))
(assert (= contract_allows_client_termination_within_7_days true))
(assert (= contract_includes_refund_ratio_and_method true))
(assert (= contract_includes_dispute_resolution_and_jurisdiction true))
(assert (= contract_includes_other_mandatory_items true))
(assert (= written_contract_signed true))
(assert (= compensation_requested true))
(assert (= damages_requested false))
(assert (= penalty_requested false))
(assert (= contract_termination_compensation_compliant true))
(assert (= investment_in_single_company_stock_bond_warrant true))
(assert (= investment_in_single_company_bond true))
(assert (= investment_in_trust_beneficiary_certificates_and_asset_backed_securities true))
(assert (= discretionary_investment_account_net_asset_value 1000000.0))
(assert (= investment_asset_diversification_compliant true))
(assert (= provides_guarantee false))
(assert (= provides_bill_endorsement false))
(assert (= provides_collateral false))
(assert (= complies_company_law_article_16_1 true))
(assert (= approved_by_authority true))
(assert (= guarantee_and_collateral_restricted true))
(assert (= stop_business_application_count 0))
(assert (= stop_business_application_submitted false))
(assert (= stop_business_application_valid true))
(assert (= stop_business_period_expired false))
(assert (= stop_business_period_months 0))
(assert (= stop_business_permit_revoked false))
(assert (= unauthorized_stop_business_months 0))
(assert (= unauthorized_stop_business_revoked false))
(assert (= reopen_application_submitted false))
(assert (= reopen_application_approved false))
(assert (= extension_applied false))
(assert (= extension_months 0))
(assert (= months_since_permit 0))
(assert (= company_registration_completed true))
(assert (= deposit_of_business_guarantee_submitted true))
(assert (= qualified_personnel_list_submitted true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 85
; Total facts: 84
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
