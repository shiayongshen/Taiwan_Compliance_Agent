; SMT2 file generated from compliance case automatic
; Case ID: case_182
; Generated at: 2025-10-19T09:59:59.529339
;
; This file can be executed with Z3:
;   z3 case_182.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accept_auto_rebalance_trades Bool)
(declare-const accept_non_self_account Bool)
(declare-const accept_trades_for_board_or_supervisor_or_employee Bool)
(declare-const accept_trades_know_market_manipulation Bool)
(declare-const accept_trades_without_client_authorization Bool)
(declare-const accept_trades_without_contract Bool)
(declare-const accountant_opinion_obtained_before_transaction Bool)
(declare-const agent_open_account_or_trade_for_others Bool)
(declare-const announcement_procedure_defined Bool)
(declare-const annual_audit_plan_executed_reported Bool)
(declare-const annual_audit_plan_reported Bool)
(declare-const asset_disposal_procedure_compliance Bool)
(declare-const asset_limit_defined Bool)
(declare-const asset_scope_defined Bool)
(declare-const audit_findings_improvements_reported Bool)
(declare-const board_approved_exemption Bool)
(declare-const board_or_supervisor_or_employee_violation Bool)
(declare-const books_reports_submitted Bool)
(declare-const business_operated_according_to_internal_control Bool)
(declare-const business_operated_according_to_law_and_articles Bool)
(declare-const derivative_transaction_procedure_exemption Bool)
(declare-const documents_produced_reported Bool)
(declare-const evaluation_procedure_defined Bool)
(declare-const external_financial_reporting_true Bool)
(declare-const fraud_or_misleading_in_underwriting_or_trading Bool)
(declare-const full_power_delegation_to_client Bool)
(declare-const honesty_and_credit_observed Bool)
(declare-const honesty_and_credit_principle Bool)
(declare-const illegal_disclosure_of_client_info Bool)
(declare-const improvement_completed Bool)
(declare-const induce_trading_by_price_prediction Bool)
(declare-const inspection_cooperated Bool)
(declare-const internal_audit_staff_adequate Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_deficiencies_corrected Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_self_assessed Bool)
(declare-const internal_control_statement_made Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_updated_within_deadline Bool)
(declare-const internal_control_updated Bool)
(declare-const internal_control_violation Bool)
(declare-const internal_control_violation_conditions Bool)
(declare-const internal_control_written Bool)
(declare-const joint_risk_sharing_with_client Bool)
(declare-const latest_audited_financial_report_obtained_before_transaction Bool)
(declare-const loan_or_mediation_with_client Bool)
(declare-const major_fraud_occurred Bool)
(declare-const misappropriation_of_client_assets Bool)
(declare-const not_engage_derivative_transaction Bool)
(declare-const not_follow_client_order_conditions Bool)
(declare-const offset_same_security_buy_sell_orders Bool)
(declare-const operation_procedure_defined Bool)
(declare-const other_important_matters_defined Bool)
(declare-const other_special_review_needed Bool)
(declare-const other_violations_of_securities_laws Bool)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const penalty_disposition Bool)
(declare-const penalty_fine_applicable Bool)
(declare-const penalty_fine_exemption Bool)
(declare-const penalty_for_violation_defined Bool)
(declare-const penalty_imposeable Bool)
(declare-const profit_guarantee_or_sharing Bool)
(declare-const prohibited_behaviors Bool)
(declare-const prohibited_behaviors_apply_to_employees Bool)
(declare-const promote_unapproved_securities Bool)
(declare-const securities_acquisition_accountant_opinion Bool)
(declare-const securities_acquisition_evaluation Bool)
(declare-const self_dealing_with_client_orders Bool)
(declare-const solicit_unapproved_securities Bool)
(declare-const speculation_using_insider_info Bool)
(declare-const subsidiary_asset_control_defined Bool)
(declare-const subsidiary_asset_procedure_supervised Bool)
(declare-const subsidiary_asset_procedure_supervision Bool)
(declare-const transaction_amount Real)
(declare-const underwriting_personnel_get_illegal_benefits Bool)
(declare-const use_client_account_for_trading Bool)
(declare-const use_others_or_relatives_name_for_client Bool)
(declare-const violation_affecting_business Bool)
(declare-const violation_finance_business_management Bool)
(declare-const violation_law_or_order Bool)
(declare-const violation_minor Bool)
(declare-const violation_of_finance_business_management Bool)
(declare-const violation_of_law_or_order Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_affecting_business] 董事、監察人及受僱人有違法行為足以影響證券業務正常執行
(assert (= violation_affecting_business board_or_supervisor_or_employee_violation))

; [securities:penalty_imposeable] 主管機關得視情節輕重對證券商處以第六十六條所定處分
(assert (= penalty_imposeable violation_affecting_business))

; [securities:violation_of_law_or_order] 證券商違反本法或依本法所發布之命令
(assert (= violation_of_law_or_order violation_law_or_order))

; [securities:penalty_disposition] 主管機關得視情節輕重為處分並命限期改善
(assert (= penalty_disposition violation_of_law_or_order))

; [securities:internal_control_violation] 證券商或相關事業未確實執行內部控制制度
(assert (not (= internal_control_executed internal_control_violation)))

; [securities:violation_of_finance_business_management] 違反財務、業務或管理規定
(assert (= violation_of_finance_business_management
   violation_finance_business_management))

; [securities:penalty_fine_applicable] 違反第178-1條規定應處罰鍰
(assert (= penalty_fine_applicable
   (or violation_of_finance_business_management
       (not inspection_cooperated)
       (not books_reports_submitted)
       (not documents_produced_reported)
       (not internal_control_executed)
       violation_of_law_or_order)))

; [securities:penalty_fine_exemption] 情節輕微者免予處罰或限期改善後免罰
(assert (= penalty_fine_exemption (or improvement_completed violation_minor)))

; [securities:internal_control_established] 證券商依規定訂定內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_updated] 內部控制制度變更於限期內完成
(assert (= internal_control_updated internal_control_system_updated_within_deadline))

; [securities:internal_control_compliance] 證券商業務依內部控制制度及法令章程經營
(assert (= internal_control_compliance
   (and business_operated_according_to_law_and_articles
        business_operated_according_to_internal_control)))

; [securities:internal_control_violation_conditions] 主管機關得令限期改善及委託會計師專案審查內部控制制度
(assert (= internal_control_violation_conditions
   (or (not internal_audit_staff_adequate)
       (not internal_control_written)
       (not internal_control_statement_made)
       (not internal_control_deficiencies_corrected)
       (not external_financial_reporting_true)
       (not audit_findings_improvements_reported)
       (not internal_control_self_assessed)
       (not annual_audit_plan_reported)
       (not annual_audit_plan_executed_reported)
       other_special_review_needed
       major_fraud_occurred)))

; [securities:asset_disposal_procedure_compliance] 公開發行公司訂定並依規定執行取得或處分資產處理程序
(assert (= asset_disposal_procedure_compliance
   (and asset_scope_defined
        evaluation_procedure_defined
        operation_procedure_defined
        announcement_procedure_defined
        asset_limit_defined
        subsidiary_asset_control_defined
        penalty_for_violation_defined
        other_important_matters_defined)))

; [securities:derivative_transaction_procedure_exemption] 不擬從事衍生性商品交易者經董事會通過免訂定處理程序
(assert (= derivative_transaction_procedure_exemption
   (or board_approved_exemption (not not_engage_derivative_transaction))))

; [securities:subsidiary_asset_procedure_supervision] 公開發行公司督促子公司訂定並執行取得或處分資產處理程序
(assert (= subsidiary_asset_procedure_supervision subsidiary_asset_procedure_supervised))

; [securities:securities_acquisition_evaluation] 取得有價證券前取得最近期經會計師查核簽證或核閱之財務報表
(assert (= securities_acquisition_evaluation
   latest_audited_financial_report_obtained_before_transaction))

; [securities:securities_acquisition_accountant_opinion] 交易金額達實收資本額20%或新臺幣3億元以上者，事前洽請會計師表示意見
(assert (let ((a!1 (not (or (<= 300000000.0 transaction_amount)
                    (>= transaction_amount (* (/ 1.0 5.0) paid_in_capital))))))
  (= securities_acquisition_accountant_opinion
     (or a!1 accountant_opinion_obtained_before_transaction))))

; [securities:honesty_and_credit_principle] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= honesty_and_credit_principle honesty_and_credit_observed))

; [securities:prohibited_behaviors] 證券商負責人及業務人員不得有違反證券管理法令之行為
(assert (not (= (or illegal_disclosure_of_client_info
            solicit_unapproved_securities
            promote_unapproved_securities
            agent_open_account_or_trade_for_others
            profit_guarantee_or_sharing
            use_others_or_relatives_name_for_client
            not_follow_client_order_conditions
            accept_non_self_account
            use_client_account_for_trading
            misappropriation_of_client_assets
            full_power_delegation_to_client
            fraud_or_misleading_in_underwriting_or_trading
            accept_trades_without_client_authorization
            offset_same_security_buy_sell_orders
            accept_trades_know_market_manipulation
            speculation_using_insider_info
            other_violations_of_securities_laws
            joint_risk_sharing_with_client
            loan_or_mediation_with_client
            accept_trades_for_board_or_supervisor_or_employee
            accept_trades_without_contract
            induce_trading_by_price_prediction
            self_dealing_with_client_orders
            (not accept_auto_rebalance_trades)
            underwriting_personnel_get_illegal_benefits)
        prohibited_behaviors)))

; [securities:prohibited_behaviors_apply_to_employees] 證券商其他受僱人準用負責人及業務人員不得為之行為
(assert (= prohibited_behaviors_apply_to_employees prohibited_behaviors))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法第178-1條規定且未免罰或未改善完成時處罰，或違反其他法令或命令時處罰，或有違法行為影響業務正常執行時處罰，或負責人及業務人員有禁止行為時處罰
(assert (= penalty
   (or (and penalty_fine_applicable (not penalty_fine_exemption))
       violation_affecting_business
       (not prohibited_behaviors)
       violation_of_law_or_order)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= board_or_supervisor_or_employee_violation true))
(assert (= violation_affecting_business true))
(assert (= violation_law_or_order true))
(assert (= violation_of_law_or_order true))
(assert (= violation_finance_business_management true))
(assert (= violation_of_finance_business_management true))
(assert (= internal_control_executed false))
(assert (= internal_control_violation true))
(assert (= internal_control_violation_conditions true))
(assert (= internal_control_written false))
(assert (= internal_audit_staff_adequate false))
(assert (= annual_audit_plan_reported false))
(assert (= annual_audit_plan_executed_reported false))
(assert (= audit_findings_improvements_reported false))
(assert (= internal_control_self_assessed false))
(assert (= internal_control_statement_made false))
(assert (= internal_control_deficiencies_corrected false))
(assert (= external_financial_reporting_true false))
(assert (= major_fraud_occurred true))
(assert (= other_special_review_needed true))
(assert (= subsidiary_asset_procedure_supervised false))
(assert (= asset_disposal_procedure_compliance false))
(assert (= asset_scope_defined false))
(assert (= evaluation_procedure_defined false))
(assert (= operation_procedure_defined false))
(assert (= announcement_procedure_defined false))
(assert (= asset_limit_defined false))
(assert (= subsidiary_asset_control_defined false))
(assert (= penalty_for_violation_defined true))
(assert (= other_important_matters_defined false))
(assert (= securities_acquisition_evaluation false))
(assert (= accountant_opinion_obtained_before_transaction false))
(assert (= transaction_amount 0.0))
(assert (= paid_in_capital 0.0))
(assert (= books_reports_submitted false))
(assert (= inspection_cooperated false))
(assert (= documents_produced_reported false))
(assert (= penalty_fine_applicable true))
(assert (= penalty_fine_exemption false))
(assert (= penalty_imposeable true))
(assert (= penalty_disposition true))
(assert (= penalty true))
(assert (= prohibited_behaviors false))
(assert (= prohibited_behaviors_apply_to_employees false))
(assert (= honesty_and_credit_observed false))
(assert (= honesty_and_credit_principle false))
(assert (= accept_auto_rebalance_trades false))
(assert (= accept_non_self_account false))
(assert (= accept_trades_for_board_or_supervisor_or_employee false))
(assert (= accept_trades_know_market_manipulation false))
(assert (= accept_trades_without_client_authorization false))
(assert (= accept_trades_without_contract false))
(assert (= agent_open_account_or_trade_for_others false))
(assert (= board_approved_exemption false))
(assert (= derivative_transaction_procedure_exemption false))
(assert (= full_power_delegation_to_client false))
(assert (= illegal_disclosure_of_client_info false))
(assert (= induce_trading_by_price_prediction false))
(assert (= joint_risk_sharing_with_client false))
(assert (= loan_or_mediation_with_client false))
(assert (= misappropriation_of_client_assets false))
(assert (= offset_same_security_buy_sell_orders false))
(assert (= promote_unapproved_securities false))
(assert (= self_dealing_with_client_orders false))
(assert (= solicit_unapproved_securities false))
(assert (= speculation_using_insider_info false))
(assert (= underwriting_personnel_get_illegal_benefits false))
(assert (= use_client_account_for_trading false))
(assert (= use_others_or_relatives_name_for_client false))
(assert (= other_violations_of_securities_laws false))
(assert (= business_operated_according_to_internal_control false))
(assert (= business_operated_according_to_law_and_articles false))
(assert (= fraud_or_misleading_in_underwriting_or_trading false))
(assert (= improvement_completed false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_updated_within_deadline false))
(assert (= internal_control_updated false))
(assert (= latest_audited_financial_report_obtained_before_transaction false))
(assert (= not_engage_derivative_transaction false))
(assert (= not_follow_client_order_conditions false))
(assert (= profit_guarantee_or_sharing false))
(assert (= securities_acquisition_accountant_opinion false))
(assert (= subsidiary_asset_procedure_supervision false))
(assert (= violation_minor false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 86
; Total facts: 86
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
