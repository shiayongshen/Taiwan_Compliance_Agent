; SMT2 file generated from compliance case automatic
; Case ID: case_351
; Generated at: 2025-10-21T07:48:28.193138
;
; This file can be executed with Z3:
;   z3 case_351.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const announcement_and_declaration_procedure_defined Bool)
(declare-const asset_scope_defined Bool)
(declare-const asset_transaction_procedure_compliance Bool)
(declare-const case_improved_within_deadline Bool)
(declare-const case_is_minor Bool)
(declare-const derivative_trading_and_settlement_personnel_separated Bool)
(declare-const derivative_transaction_risk_management_compliance Bool)
(declare-const derivative_transaction_risk_management_measures_compliance Bool)
(declare-const disclosure_of_financial_forecast_information_compliance Bool)
(declare-const evaluation_procedure_defined Bool)
(declare-const fail_to_prepare_report_or_announce_or_store_documents Bool)
(declare-const fail_to_submit_or_obstruct_inspection_documents Bool)
(declare-const foreign_company_violation_178_3_or_4 Bool)
(declare-const internal_audit_system_established Bool)
(declare-const is_foreign_company Bool)
(declare-const is_legal_entity_or_foreign_company Bool)
(declare-const major_financial_business_compliance Bool)
(declare-const non_operating_real_estate_and_securities_limits_defined Bool)
(declare-const operation_procedure_defined Bool)
(declare-const other_important_matters_defined Bool)
(declare-const other_important_risk_management_measures_implemented Bool)
(declare-const penalty Bool)
(declare-const penalty_exemption_for_minor_cases Bool)
(declare-const penalty_for_violation_defined Bool)
(declare-const positions_evaluated_weekly_or_hedging_bi_monthly_and_reported Bool)
(declare-const regular_evaluation_and_exception_handling_defined Bool)
(declare-const responsible_person_penalty Bool)
(declare-const risk_management_measures_defined Bool)
(declare-const risk_management_scope_includes_credit_market_liquidity_cashflow_operational_legal Bool)
(declare-const risk_measurement_supervision_control_separated_and_reported Bool)
(declare-const subsidiary_asset_control_procedure_defined Bool)
(declare-const subsidiary_asset_procedure_supervised Bool)
(declare-const transaction_principles_and_policies_defined Bool)
(declare-const violate_14_3_or_14_1_1_or_14_1_3_or_14_2_1_or_14_2_3_or_14_2_6_or_14_3_or_14_5_1_to_3_or_21_1_5_or_25_1_or_25_2_or_25_4_or_31_1_or_36_5_or_36_7_or_41_or_43_1_1_or_43_4_1_or_43_6_5_to_7_or_165_1_or_165_2_applied_14_3_31_1_36_5_43_4_1 Bool)
(declare-const violate_14_4_1_or_2_or_165_1_applied_14_4_1_or_2_or_14_4_5_or_165_1_applied_14_4_5 Bool)
(declare-const violate_14_6_1_or_165_1_applied_14_6_1_or_fail_to_establish_compensation_committee_or_qualifications_etc Bool)
(declare-const violate_22_2_1_or_2_or_26_1_or_165_1_applied_22_2_1_or_2 Bool)
(declare-const violate_25_1_or_165_1_applied_25_1_rules_on_qualification_and_documents Bool)
(declare-const violate_26_2_rules_on_directors_and_supervisors_shareholding_and_audit Bool)
(declare-const violate_26_3_1_or_7_or_8_or_165_1_applied_26_3_1_or_7_or_8_or_26_3_8_later_or_165_1_applied_26_3_8_later Bool)
(declare-const violate_28_2_2_or_4_to_7_or_165_1_applied_28_2_2_or_4_to_7_or_28_2_3_or_165_1_applied_28_2_3 Bool)
(declare-const violate_36_1_or_165_1_applied_36_1_rules_on_major_financial_business Bool)
(declare-const violate_43_2_1_or_43_3_1_or_43_5_1_or_165_1_or_165_2_applied_43_2_1_or_43_3_1_or_43_5_1_or_43_1_4_or_5_or_165_1_or_165_2_applied_43_1_4 Bool)
(declare-const violation_178_conditions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:asset_transaction_procedure_compliance] 公開發行公司取得或處分資產處理程序符合規定
(assert (= asset_transaction_procedure_compliance
   (and asset_scope_defined
        evaluation_procedure_defined
        operation_procedure_defined
        announcement_and_declaration_procedure_defined
        non_operating_real_estate_and_securities_limits_defined
        subsidiary_asset_control_procedure_defined
        penalty_for_violation_defined
        other_important_matters_defined
        subsidiary_asset_procedure_supervised)))

; [securities:derivative_transaction_risk_management_compliance] 公開發行公司從事衍生性商品交易風險管理及稽核事項符合規定
(assert (= derivative_transaction_risk_management_compliance
   (and transaction_principles_and_policies_defined
        risk_management_measures_defined
        internal_audit_system_established
        regular_evaluation_and_exception_handling_defined)))

; [securities:derivative_transaction_risk_management_measures_compliance] 公開發行公司從事衍生性商品交易風險管理措施符合規定
(assert (= derivative_transaction_risk_management_measures_compliance
   (and risk_management_scope_includes_credit_market_liquidity_cashflow_operational_legal
        derivative_trading_and_settlement_personnel_separated
        risk_measurement_supervision_control_separated_and_reported
        positions_evaluated_weekly_or_hedging_bi_monthly_and_reported
        other_important_risk_management_measures_implemented)))

; [securities:major_financial_business_compliance] 公開發行公司重大財務業務行為符合主管機關定之處理準則
(assert (= major_financial_business_compliance
   (and asset_transaction_procedure_compliance
        derivative_transaction_risk_management_compliance
        derivative_transaction_risk_management_measures_compliance
        disclosure_of_financial_forecast_information_compliance)))

; [securities:violation_178_conditions] 違反證券交易法第178條規定之情事
(assert (= violation_178_conditions
   (or violate_43_2_1_or_43_3_1_or_43_5_1_or_165_1_or_165_2_applied_43_2_1_or_43_3_1_or_43_5_1_or_43_1_4_or_5_or_165_1_or_165_2_applied_43_1_4
       violate_28_2_2_or_4_to_7_or_165_1_applied_28_2_2_or_4_to_7_or_28_2_3_or_165_1_applied_28_2_3
       violate_14_4_1_or_2_or_165_1_applied_14_4_1_or_2_or_14_4_5_or_165_1_applied_14_4_5
       violate_14_3_or_14_1_1_or_14_1_3_or_14_2_1_or_14_2_3_or_14_2_6_or_14_3_or_14_5_1_to_3_or_21_1_5_or_25_1_or_25_2_or_25_4_or_31_1_or_36_5_or_36_7_or_41_or_43_1_1_or_43_4_1_or_43_6_5_to_7_or_165_1_or_165_2_applied_14_3_31_1_36_5_43_4_1
       violate_26_3_1_or_7_or_8_or_165_1_applied_26_3_1_or_7_or_8_or_26_3_8_later_or_165_1_applied_26_3_8_later
       violate_26_2_rules_on_directors_and_supervisors_shareholding_and_audit
       violate_36_1_or_165_1_applied_36_1_rules_on_major_financial_business
       violate_25_1_or_165_1_applied_25_1_rules_on_qualification_and_documents
       fail_to_submit_or_obstruct_inspection_documents
       violate_22_2_1_or_2_or_26_1_or_165_1_applied_22_2_1_or_2
       violate_14_6_1_or_165_1_applied_14_6_1_or_fail_to_establish_compensation_committee_or_qualifications_etc
       fail_to_prepare_report_or_announce_or_store_documents)))

; [securities:foreign_company_violation_178_3_or_4] 外國公司違反第178條第三款或第四款規定
(assert (= foreign_company_violation_178_3_or_4
   (and is_foreign_company
        (or fail_to_submit_or_obstruct_inspection_documents
            fail_to_prepare_report_or_announce_or_store_documents))))

; [securities:penalty_exemption_for_minor_cases] 情節輕微者得免予處罰或先限期改善，已改善完成者免罰
(assert (= penalty_exemption_for_minor_cases
   (or case_improved_within_deadline case_is_minor)))

; [securities:penalty_conditions] 處罰條件：違反第178條規定且非輕微或未改善者處罰
(assert (= penalty
   (and violation_178_conditions (not penalty_exemption_for_minor_cases))))

; [securities:responsible_person_penalty] 法人及外國公司違反本法規定，負責人應受處罰
(assert (= responsible_person_penalty
   (and is_legal_entity_or_foreign_company violation_178_conditions)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= asset_scope_defined false))
(assert (= evaluation_procedure_defined false))
(assert (= operation_procedure_defined false))
(assert (= announcement_and_declaration_procedure_defined false))
(assert (= non_operating_real_estate_and_securities_limits_defined true))
(assert (= subsidiary_asset_control_procedure_defined true))
(assert (= penalty_for_violation_defined true))
(assert (= other_important_matters_defined true))
(assert (= subsidiary_asset_procedure_supervised true))
(assert (= transaction_principles_and_policies_defined false))
(assert (= risk_management_measures_defined false))
(assert (= internal_audit_system_established false))
(assert (= regular_evaluation_and_exception_handling_defined false))
(assert (= derivative_trading_and_settlement_personnel_separated false))
(assert (= risk_management_scope_includes_credit_market_liquidity_cashflow_operational_legal false))
(assert (= risk_measurement_supervision_control_separated_and_reported false))
(assert (= positions_evaluated_weekly_or_hedging_bi_monthly_and_reported false))
(assert (= other_important_risk_management_measures_implemented false))
(assert (= disclosure_of_financial_forecast_information_compliance true))
(assert (= fail_to_submit_or_obstruct_inspection_documents false))
(assert (= fail_to_prepare_report_or_announce_or_store_documents false))
(assert (= foreign_company_violation_178_3_or_4 false))
(assert (= is_foreign_company false))
(assert (= is_legal_entity_or_foreign_company true))
(assert (= violate_22_2_1_or_2_or_26_1_or_165_1_applied_22_2_1_or_2 true))
(assert (= violate_14_3_or_14_1_1_or_14_1_3_or_14_2_1_or_14_2_3_or_14_2_6_or_14_3_or_14_5_1_to_3_or_21_1_5_or_25_1_or_25_2_or_25_4_or_31_1_or_36_5_or_36_7_or_41_or_43_1_1_or_43_4_1_or_43_6_5_to_7_or_165_1_or_165_2_applied_14_3_31_1_36_5_43_4_1 false))
(assert (= violate_14_4_1_or_2_or_165_1_applied_14_4_1_or_2_or_14_4_5_or_165_1_applied_14_4_5 false))
(assert (= violate_14_6_1_or_165_1_applied_14_6_1_or_fail_to_establish_compensation_committee_or_qualifications_etc false))
(assert (= violate_25_1_or_165_1_applied_25_1_rules_on_qualification_and_documents false))
(assert (= violate_26_2_rules_on_directors_and_supervisors_shareholding_and_audit false))
(assert (= violate_26_3_1_or_7_or_8_or_165_1_applied_26_3_1_or_7_or_8_or_26_3_8_later_or_165_1_applied_26_3_8_later false))
(assert (= violate_28_2_2_or_4_to_7_or_165_1_applied_28_2_2_or_4_to_7_or_28_2_3_or_165_1_applied_28_2_3 false))
(assert (= violate_36_1_or_165_1_applied_36_1_rules_on_major_financial_business false))
(assert (= violate_43_2_1_or_43_3_1_or_43_5_1_or_165_1_or_165_2_applied_43_2_1_or_43_3_1_or_43_5_1_or_43_1_4_or_5_or_165_1_or_165_2_applied_43_1_4 false))
(assert (= violation_178_conditions true))
(assert (= case_is_minor false))
(assert (= case_improved_within_deadline false))
(assert (= penalty_exemption_for_minor_cases false))
(assert (= penalty true))
(assert (= responsible_person_penalty true))
(assert (= asset_transaction_procedure_compliance false))
(assert (= derivative_transaction_risk_management_compliance false))
(assert (= derivative_transaction_risk_management_measures_compliance false))
(assert (= major_financial_business_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 44
; Total facts: 44
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
