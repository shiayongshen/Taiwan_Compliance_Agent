; SMT2 file generated from compliance case automatic
; Case ID: case_202
; Generated at: 2025-10-19T10:23:54.313155
;
; This file can be executed with Z3:
;   z3 case_202.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_extension_times Int)
(declare-const adjustment_extension_years_per_time Real)
(declare-const adjustment_period_limit Int)
(declare-const adjustment_period_years Int)
(declare-const anti_money_laundering_and_terrorism_financing_defined Bool)
(declare-const approved_investment_business Bool)
(declare-const audit_committee_management_included Bool)
(declare-const authority_must_order_disposal_of_illegal_investment Bool)
(declare-const authority_opposition Bool)
(declare-const authority_orders_adjustment Bool)
(declare-const authority_orders_disposal Bool)
(declare-const banking_cash_deposit_foreign_exchange_credit_management_defined Bool)
(declare-const banking_includes_subtypes Bool)
(declare-const bill_bond_new_financial_products_management_defined Bool)
(declare-const board_recognizes_operational_risks Bool)
(declare-const board_responsible_for_internal_control Bool)
(declare-const board_supervises_operational_results Bool)
(declare-const business_plan_prepared Bool)
(declare-const business_regulations_and_handbooks_defined Bool)
(declare-const capital_reduction_approval_applied Bool)
(declare-const credit_union_cash_deposit_credit_management_defined Bool)
(declare-const customer_data_confidentiality_defined Bool)
(declare-const days_since_application Int)
(declare-const equity_management_defined Bool)
(declare-const exceed_business_or_investment_scope_must_adjust Bool)
(declare-const execution_guidelines_prepared Bool)
(declare-const external_information_disclosure_management_defined Bool)
(declare-const financial_consumer_protection_management_defined Bool)
(declare-const financial_inspection_report_management_defined Bool)
(declare-const financial_statement_preparation_management_defined Bool)
(declare-const futures_includes_subtypes Bool)
(declare-const general_affairs_it_hr_management_defined Bool)
(declare-const group_anti_money_laundering_and_terrorism_financing_plan_established Bool)
(declare-const group_management_checks_and_balances_ensured Bool)
(declare-const illegal_investment_exists Bool)
(declare-const insurance_includes_subtypes Bool)
(declare-const internal_control_effective Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_and_effective Bool)
(declare-const internal_control_policy_and_procedures_defined_and_reviewed Bool)
(declare-const investment_approval_timing Bool)
(declare-const investment_approved Bool)
(declare-const investment_business_type_in_10_or_11 Bool)
(declare-const investment_business_type_in_1_to_9 Bool)
(declare-const investment_guidelines_defined Bool)
(declare-const investment_in_banking Bool)
(declare-const investment_in_bill_finance Bool)
(declare-const investment_in_commercial_bank Bool)
(declare-const investment_in_credit_card Bool)
(declare-const investment_in_fhc Bool)
(declare-const investment_in_foreign_financial_institution_approved Bool)
(declare-const investment_in_futures Bool)
(declare-const investment_in_futures_advisor Bool)
(declare-const investment_in_futures_broker Bool)
(declare-const investment_in_futures_manager Bool)
(declare-const investment_in_futures_trust Bool)
(declare-const investment_in_insurance Bool)
(declare-const investment_in_insurance_agent Bool)
(declare-const investment_in_insurance_broker Bool)
(declare-const investment_in_leveraged_trader Bool)
(declare-const investment_in_life_insurance Bool)
(declare-const investment_in_other_financial_related_business_approved Bool)
(declare-const investment_in_property_insurance Bool)
(declare-const investment_in_reinsurance_company Bool)
(declare-const investment_in_securities Bool)
(declare-const investment_in_securities_firm Bool)
(declare-const investment_in_securities_investment_advisor Bool)
(declare-const investment_in_securities_investment_trust Bool)
(declare-const investment_in_specialized_bank Bool)
(declare-const investment_in_trust Bool)
(declare-const investment_in_trust_investment_company Bool)
(declare-const investment_in_venture_capital Bool)
(declare-const investment_performed Bool)
(declare-const investment_scope_compliance Bool)
(declare-const investment_without_approval_prohibited Bool)
(declare-const law_compliance_internal_audit_risk_management_participation Bool)
(declare-const major_incident_handling_mechanism_defined Bool)
(declare-const management_guidelines_planned Bool)
(declare-const organization_rules_defined Bool)
(declare-const other_business_regulations_and_procedures_defined Bool)
(declare-const overall_strategy_and_risk_management_planned Bool)
(declare-const overall_strategy_planned Bool)
(declare-const penalty Bool)
(declare-const related_party_transaction_rules_defined Bool)
(declare-const responsible_person_cannot_be_manager_of_venture_invested_company Bool)
(declare-const responsible_person_conflict_of_interest Bool)
(declare-const responsible_person_is_manager_of_venture_invested_company Bool)
(declare-const responsible_person_multiple_positions_effective_execution Bool)
(declare-const responsible_person_multiple_positions_limited Bool)
(declare-const risk_management_policy_planned Bool)
(declare-const risk_management_procedures_prepared Bool)
(declare-const salary_committee_management_included Bool)
(declare-const securities_includes_subtypes Bool)
(declare-const shareholder_rights_protected Bool)
(declare-const shares_acquired_without_approval Bool)
(declare-const shares_excluded_from_total Bool)
(declare-const shares_have_no_voting_right Bool)
(declare-const shares_without_approval_no_voting_right Bool)
(declare-const subsidiary_business_investment_only Bool)
(declare-const subsidiary_business_management_only Bool)
(declare-const subsidiary_capital_reduction Bool)
(declare-const subsidiary_capital_reduction_must_apply_approval Bool)
(declare-const subsidiary_control_operations_defined Bool)
(declare-const subsidiary_exceeds_scope Bool)
(declare-const subsidiary_management_and_joint_marketing_defined Bool)
(declare-const trust_business_handbook_defined_and_updated Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:investment_scope_compliance] 金融控股公司子公司業務限於投資及管理，確保健全經營
(assert (= investment_scope_compliance
   (and subsidiary_business_investment_only subsidiary_business_management_only)))

; [fhc:approved_investment_business] 金融控股公司投資事業符合主管機關核准範圍
(assert (= approved_investment_business
   (or investment_in_futures
       investment_in_securities
       investment_in_fhc
       investment_in_trust
       investment_in_credit_card
       investment_in_other_financial_related_business_approved
       investment_in_insurance
       investment_in_foreign_financial_institution_approved
       investment_in_bill_finance
       investment_in_banking
       investment_in_venture_capital)))

; [fhc:banking_includes_subtypes] 銀行業包括商業銀行、專業銀行及信託投資公司
(assert (= banking_includes_subtypes
   (and investment_in_commercial_bank
        investment_in_specialized_bank
        investment_in_trust_investment_company)))

; [fhc:insurance_includes_subtypes] 保險業包括財產保險業、人身保險業、再保險公司、保險代理人及經紀人
(assert (= insurance_includes_subtypes
   (and investment_in_property_insurance
        investment_in_life_insurance
        investment_in_reinsurance_company
        investment_in_insurance_agent
        investment_in_insurance_broker)))

; [fhc:securities_includes_subtypes] 證券業包括證券商、證券投資信託事業、證券投資顧問事業
(assert (= securities_includes_subtypes
   (and investment_in_securities_firm
        investment_in_securities_investment_trust
        investment_in_securities_investment_advisor)))

; [fhc:futures_includes_subtypes] 期貨業包括期貨商、槓桿交易商、期貨信託事業、期貨經理事業及期貨顧問事業
(assert (= futures_includes_subtypes
   (and investment_in_futures_broker
        investment_in_leveraged_trader
        investment_in_futures_trust
        investment_in_futures_manager
        investment_in_futures_advisor)))

; [fhc:investment_approval_timing] 主管機關未於期限內反對視為核准投資
(assert (= investment_approval_timing
   (or (and investment_business_type_in_1_to_9
            (>= 15 days_since_application)
            (not authority_opposition))
       (and investment_business_type_in_10_or_11
            (>= 30 days_since_application)
            (not authority_opposition)))))

; [fhc:investment_without_approval_prohibited] 未經核准不得進行申請投資行為
(assert (= investment_without_approval_prohibited
   (or (not investment_performed) investment_approved)))

; [fhc:shares_without_approval_no_voting_right] 未申請核准取得之股份無表決權且不計入已發行股份總數
(assert (= shares_without_approval_no_voting_right
   (or (not shares_acquired_without_approval)
       (and shares_have_no_voting_right shares_excluded_from_total))))

; [fhc:authority_must_order_disposal_of_illegal_investment] 主管機關應限令金融控股公司處分違規投資
(assert (= authority_must_order_disposal_of_illegal_investment
   (or authority_orders_disposal (not illegal_investment_exists))))

; [fhc:exceed_business_or_investment_scope_must_adjust] 子公司業務或投資逾越法令規定範圍者，主管機關應限期命其調整
(assert (= exceed_business_or_investment_scope_must_adjust
   (or (not subsidiary_exceeds_scope) authority_orders_adjustment)))

; [fhc:adjustment_period_limit] 調整期限最長三年，得申請延長二次，每次二年
(assert (= adjustment_period_limit
   (ite (and (>= 3 adjustment_period_years)
             (>= 2 adjustment_extension_times)
             (>= 2.0 adjustment_extension_years_per_time))
        1
        0)))

; [fhc:responsible_person_cannot_be_manager_of_venture_invested_company] 金融控股公司負責人或職員不得擔任創業投資事業所投資事業經理人
(assert (not (= responsible_person_is_manager_of_venture_invested_company
        responsible_person_cannot_be_manager_of_venture_invested_company)))

; [fhc:subsidiary_capital_reduction_must_apply_approval] 子公司減資應事先向主管機關申請核准
(assert (= subsidiary_capital_reduction_must_apply_approval
   (or (not subsidiary_capital_reduction) capital_reduction_approval_applied)))

; [fhc:internal_control_established_and_effective] 金融控股公司及銀行業應建立內部控制制度並持續有效執行
(assert (= internal_control_established_and_effective
   (and internal_control_established internal_control_effective)))

; [fhc:overall_strategy_and_risk_management_planned] 金融控股公司及銀行業應規劃整體經營策略及風險管理政策
(assert (= overall_strategy_and_risk_management_planned
   (and overall_strategy_planned
        risk_management_policy_planned
        management_guidelines_planned
        business_plan_prepared
        risk_management_procedures_prepared
        execution_guidelines_prepared)))

; [fhc:board_responsible_for_internal_control] 董（理）事會負最終責任確保內部控制制度適當有效
(assert (= board_responsible_for_internal_control
   (and board_recognizes_operational_risks
        board_supervises_operational_results
        board_responsible_for_internal_control)))

; [fhc:internal_control_policy_and_procedures_defined_and_reviewed] 內部控制制度涵蓋所有營運活動並訂定適當政策及程序，且適時檢討修訂
(assert (= internal_control_policy_and_procedures_defined_and_reviewed
   (and organization_rules_defined
        business_regulations_and_handbooks_defined
        investment_guidelines_defined
        customer_data_confidentiality_defined
        related_party_transaction_rules_defined
        equity_management_defined
        financial_statement_preparation_management_defined
        general_affairs_it_hr_management_defined
        external_information_disclosure_management_defined
        financial_inspection_report_management_defined
        financial_consumer_protection_management_defined
        major_incident_handling_mechanism_defined
        anti_money_laundering_and_terrorism_financing_defined
        other_business_regulations_and_procedures_defined
        subsidiary_management_and_joint_marketing_defined
        banking_cash_deposit_foreign_exchange_credit_management_defined
        credit_union_cash_deposit_credit_management_defined
        bill_bond_new_financial_products_management_defined
        trust_business_handbook_defined_and_updated
        salary_committee_management_included
        audit_committee_management_included
        subsidiary_control_operations_defined
        group_anti_money_laundering_and_terrorism_financing_plan_established
        law_compliance_internal_audit_risk_management_participation)))

; [fhc:responsible_person_multiple_positions_limited] 金融控股公司負責人兼任職務應確保有效執行且無利益衝突
(assert (= responsible_person_multiple_positions_limited
   (and responsible_person_multiple_positions_effective_execution
        (not responsible_person_conflict_of_interest)
        group_management_checks_and_balances_ensured
        shareholder_rights_protected)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法及相關規定時處罰
(assert (= penalty
   (or (not subsidiary_capital_reduction_must_apply_approval)
       (not shares_without_approval_no_voting_right)
       (not board_responsible_for_internal_control)
       (not approved_investment_business)
       (not investment_scope_compliance)
       (not responsible_person_multiple_positions_limited)
       (not authority_must_order_disposal_of_illegal_investment)
       (not exceed_business_or_investment_scope_must_adjust)
       (not investment_without_approval_prohibited)
       (not overall_strategy_and_risk_management_planned)
       (not internal_control_established_and_effective)
       (not internal_control_policy_and_procedures_defined_and_reviewed)
       (not responsible_person_cannot_be_manager_of_venture_invested_company))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= subsidiary_business_investment_only true))
(assert (= subsidiary_business_management_only true))
(assert (= investment_in_fhc true))
(assert (= investment_in_banking true))
(assert (= investment_in_bill_finance false))
(assert (= investment_in_credit_card false))
(assert (= investment_in_trust false))
(assert (= investment_in_insurance false))
(assert (= investment_in_securities true))
(assert (= investment_in_futures false))
(assert (= investment_in_venture_capital false))
(assert (= investment_in_foreign_financial_institution_approved false))
(assert (= investment_in_other_financial_related_business_approved false))
(assert (= investment_performed true))
(assert (= investment_approved true))
(assert (= shares_acquired_without_approval false))
(assert (= subsidiary_exceeds_scope false))
(assert (= subsidiary_capital_reduction false))
(assert (= capital_reduction_approval_applied false))
(assert (= illegal_investment_exists false))
(assert (= authority_opposition false))
(assert (= authority_orders_disposal false))
(assert (= authority_orders_adjustment false))
(assert (= adjustment_period_years 0))
(assert (= adjustment_extension_times 0))
(assert (= adjustment_extension_years_per_time 0.0))
(assert (= internal_control_established false))
(assert (= internal_control_effective false))
(assert (= organization_rules_defined false))
(assert (= business_regulations_and_handbooks_defined false))
(assert (= investment_guidelines_defined false))
(assert (= customer_data_confidentiality_defined false))
(assert (= related_party_transaction_rules_defined false))
(assert (= equity_management_defined false))
(assert (= financial_statement_preparation_management_defined false))
(assert (= general_affairs_it_hr_management_defined false))
(assert (= external_information_disclosure_management_defined false))
(assert (= financial_inspection_report_management_defined false))
(assert (= financial_consumer_protection_management_defined false))
(assert (= major_incident_handling_mechanism_defined false))
(assert (= anti_money_laundering_and_terrorism_financing_defined false))
(assert (= other_business_regulations_and_procedures_defined false))
(assert (= subsidiary_management_and_joint_marketing_defined false))
(assert (= banking_cash_deposit_foreign_exchange_credit_management_defined false))
(assert (= credit_union_cash_deposit_credit_management_defined false))
(assert (= bill_bond_new_financial_products_management_defined false))
(assert (= trust_business_handbook_defined_and_updated false))
(assert (= salary_committee_management_included false))
(assert (= audit_committee_management_included false))
(assert (= subsidiary_control_operations_defined false))
(assert (= group_anti_money_laundering_and_terrorism_financing_plan_established false))
(assert (= law_compliance_internal_audit_risk_management_participation false))
(assert (= overall_strategy_planned false))
(assert (= risk_management_policy_planned false))
(assert (= management_guidelines_planned false))
(assert (= business_plan_prepared false))
(assert (= risk_management_procedures_prepared false))
(assert (= execution_guidelines_prepared false))
(assert (= board_recognizes_operational_risks false))
(assert (= board_supervises_operational_results false))
(assert (= board_responsible_for_internal_control false))
(assert (= responsible_person_is_manager_of_venture_invested_company true))
(assert (= responsible_person_cannot_be_manager_of_venture_invested_company false))
(assert (= responsible_person_multiple_positions_effective_execution false))
(assert (= responsible_person_conflict_of_interest true))
(assert (= group_management_checks_and_balances_ensured false))
(assert (= shareholder_rights_protected false))
(assert (= responsible_person_multiple_positions_limited false))
(assert (= investment_business_type_in_1_to_9 true))
(assert (= investment_business_type_in_10_or_11 false))
(assert (= investment_approval_timing false))
(assert (= shares_have_no_voting_right false))
(assert (= shares_excluded_from_total false))
(assert (= shares_without_approval_no_voting_right false))
(assert (= investment_scope_compliance false))
(assert (= approved_investment_business false))
(assert (= investment_without_approval_prohibited false))
(assert (= internal_control_established_and_effective false))
(assert (= internal_control_policy_and_procedures_defined_and_reviewed false))
(assert (= penalty true))
(assert (= adjustment_period_limit 0))
(assert (= authority_must_order_disposal_of_illegal_investment false))
(assert (= banking_includes_subtypes false))
(assert (= days_since_application 0))
(assert (= exceed_business_or_investment_scope_must_adjust false))
(assert (= futures_includes_subtypes false))
(assert (= insurance_includes_subtypes false))
(assert (= investment_in_commercial_bank false))
(assert (= investment_in_futures_advisor false))
(assert (= investment_in_futures_broker false))
(assert (= investment_in_futures_manager false))
(assert (= investment_in_futures_trust false))
(assert (= investment_in_insurance_agent false))
(assert (= investment_in_insurance_broker false))
(assert (= investment_in_leveraged_trader false))
(assert (= investment_in_life_insurance false))
(assert (= investment_in_property_insurance false))
(assert (= investment_in_reinsurance_company false))
(assert (= investment_in_securities_firm false))
(assert (= investment_in_securities_investment_advisor false))
(assert (= investment_in_securities_investment_trust false))
(assert (= investment_in_specialized_bank false))
(assert (= investment_in_trust_investment_company false))
(assert (= overall_strategy_and_risk_management_planned false))
(assert (= securities_includes_subtypes false))
(assert (= subsidiary_capital_reduction_must_apply_approval false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 106
; Total facts: 106
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
