; SMT2 file generated from compliance case automatic
; Case ID: case_182
; Generated at: 2025-10-21T04:06:39.953419
;
; This file can be executed with Z3:
;   z3 case_182.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accept_non_client_account Bool)
(declare-const accept_non_client_or_unappointed_agent Bool)
(declare-const accept_officer_agent_trading Bool)
(declare-const accept_same_account_offsetting_trades Bool)
(declare-const accept_trading_by_investment_advisor_system Bool)
(declare-const accept_trading_with_market_manipulation_intent Bool)
(declare-const accept_trading_without_proper_contract Bool)
(declare-const agent_open_account_for_others Bool)
(declare-const announcement_and_declaration_defined Bool)
(declare-const annual_audit_plan_executed Bool)
(declare-const annual_audit_plan_reported Bool)
(declare-const asset_disposal_procedure_contents Bool)
(declare-const asset_disposal_procedure_defined Bool)
(declare-const asset_disposal_procedure_established Bool)
(declare-const asset_limit_defined Bool)
(declare-const asset_scope_defined Bool)
(declare-const business_operated_according_to_law_and_internal_control Bool)
(declare-const derivative_transaction_intended Bool)
(declare-const derivative_transaction_not_intended_and_board_approved Bool)
(declare-const derivative_transaction_procedure_exemption Bool)
(declare-const derivative_transaction_procedure_required Bool)
(declare-const evaluation_procedure_defined Bool)
(declare-const external_financial_report_false_or_violation Bool)
(declare-const financial_report_obtained_before_transaction Bool)
(declare-const financial_supervisor_exemption Bool)
(declare-const fraud_or_misleading_in_underwriting_or_trading Bool)
(declare-const full_power_delegation_to_client Bool)
(declare-const honesty_and_credit_observed Bool)
(declare-const honesty_and_credit_principle Bool)
(declare-const illegal_disclosure_of_client_info Bool)
(declare-const improvement_completed Bool)
(declare-const induce_trading_by_price_prediction Bool)
(declare-const internal_audit_staff_adequate Bool)
(declare-const internal_control_deficiency_improved Bool)
(declare-const internal_control_deficiency_reported Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_not_executed Bool)
(declare-const internal_control_operated_according_to_law Bool)
(declare-const internal_control_self_assessed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_updated_after_change Bool)
(declare-const internal_control_updated_within_deadline Bool)
(declare-const internal_control_violation_conditions Bool)
(declare-const joint_risk_sharing_with_client Bool)
(declare-const loan_or_mediation_with_client Bool)
(declare-const major_fraud_or_suspected_fraud Bool)
(declare-const minor_violation Bool)
(declare-const misappropriation_of_client_assets Bool)
(declare-const non_compliance_documents Bool)
(declare-const not_follow_client_order_conditions Bool)
(declare-const not_submit_required_documents Bool)
(declare-const obstruct_inspection Bool)
(declare-const operation_procedure_defined Bool)
(declare-const order_dismiss_officer Bool)
(declare-const order_stop_business_within_one_year Bool)
(declare-const other_important_matters_defined Bool)
(declare-const other_special_review_needed Bool)
(declare-const other_violations_of_securities_laws_or_regulations Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_internal_control_not_executed Bool)
(declare-const penalty_fine_minor_exemption Bool)
(declare-const penalty_fine_non_compliance_documents Bool)
(declare-const penalty_fine_non_submission_or_obstruction Bool)
(declare-const penalty_fine_violation Bool)
(declare-const penalty_fine_violation_finance_business_management Bool)
(declare-const penalty_for_violation_defined Bool)
(declare-const penalty_imposed_according_to_article_66 Bool)
(declare-const penalty_imposed_by_authority Bool)
(declare-const penalty_type Bool)
(declare-const penalty_type_dismiss_officer Bool)
(declare-const penalty_type_license_revocation Bool)
(declare-const penalty_type_other Bool)
(declare-const penalty_type_suspension Bool)
(declare-const penalty_type_warning Bool)
(declare-const profit_guarantee_or_sharing Bool)
(declare-const prohibited_behaviors Bool)
(declare-const prohibited_behaviors_employees Bool)
(declare-const promote_unapproved_securities Bool)
(declare-const public_market_price_available Bool)
(declare-const refuse_inspection Bool)
(declare-const securities_acquisition_evaluation Bool)
(declare-const self_dealing_with_client_orders Bool)
(declare-const solicit_unapproved_securities_or_derivatives Bool)
(declare-const speculation_using_insider_info Bool)
(declare-const stop_business_or_dismiss_order Bool)
(declare-const subsidiary_asset_control_defined Bool)
(declare-const subsidiary_asset_procedure_supervised Bool)
(declare-const subsidiary_asset_procedure_supervision Bool)
(declare-const transaction_amount_ntd Real)
(declare-const transaction_amount_percentage_of_paid_in_capital Real)
(declare-const underwriting_personnel_get_undue_benefits Bool)
(declare-const use_client_account_for_trading Bool)
(declare-const use_others_or_relatives_name_for_trading Bool)
(declare-const violation_affecting_business Bool)
(declare-const violation_article_141 Bool)
(declare-const violation_article_141_applied Bool)
(declare-const violation_article_144 Bool)
(declare-const violation_article_144_applied Bool)
(declare-const violation_article_145_2 Bool)
(declare-const violation_article_145_2_applied Bool)
(declare-const violation_article_147 Bool)
(declare-const violation_article_147_applied Bool)
(declare-const violation_article_14_1_1 Bool)
(declare-const violation_article_14_1_3 Bool)
(declare-const violation_article_14_3 Bool)
(declare-const violation_article_152 Bool)
(declare-const violation_article_159 Bool)
(declare-const violation_article_165_1 Bool)
(declare-const violation_article_165_2 Bool)
(declare-const violation_article_21_1_5 Bool)
(declare-const violation_article_58 Bool)
(declare-const violation_article_61 Bool)
(declare-const violation_article_61_applied Bool)
(declare-const violation_article_69_1 Bool)
(declare-const violation_article_79 Bool)
(declare-const violation_finance_business_management_102 Bool)
(declare-const violation_finance_business_management_18_2 Bool)
(declare-const violation_finance_business_management_22_4 Bool)
(declare-const violation_finance_business_management_44_4 Bool)
(declare-const violation_finance_business_management_60_2 Bool)
(declare-const violation_finance_business_management_62_2 Bool)
(declare-const violation_finance_business_management_62_2_etc Bool)
(declare-const violation_finance_business_management_70 Bool)
(declare-const violation_finance_business_management_90 Bool)
(declare-const violation_finance_business_management_93 Bool)
(declare-const violation_finance_business_management_95 Bool)
(declare-const violation_of_law_or_regulation Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_affecting_business] 董事、監察人及受僱人有違法行為足以影響證券業務正常執行
(assert (= violation_affecting_business violation_of_law_or_regulation))

; [securities:stop_business_or_dismiss_order] 主管機關得命停止一年以下業務或解除職務
(assert (= stop_business_or_dismiss_order
   (or order_stop_business_within_one_year order_dismiss_officer)))

; [securities:penalty_imposed_by_authority] 主管機關得依情節輕重對證券商處分
(assert (= penalty_imposed_by_authority penalty_imposed_according_to_article_66))

; [securities:penalty_type_warning] 處分類型：警告
(assert (= penalty_type_warning penalty_type))

; [securities:penalty_type_dismiss_officer] 處分類型：解除董事、監察人或經理人職務
(assert (not penalty_type_dismiss_officer))

; [securities:penalty_type_suspension] 處分類型：停業六個月以內
(assert (not penalty_type_suspension))

; [securities:penalty_type_license_revocation] 處分類型：營業許可撤銷或廢止
(assert (not penalty_type_license_revocation))

; [securities:penalty_type_other] 處分類型：其他必要處置
(assert (not penalty_type_other))

; [securities:penalty_fine_violation] 違反證券交易法相關條文或命令，處罰鍰
(assert (= penalty_fine_violation
   (or violation_article_14_3
       violation_article_165_1
       violation_article_147
       violation_article_145_2_applied
       violation_article_61
       violation_article_69_1
       violation_article_21_1_5
       violation_article_58
       violation_article_159
       violation_article_14_1_3
       violation_article_147_applied
       violation_article_165_2
       violation_article_141_applied
       violation_article_141
       violation_article_79
       violation_article_61_applied
       violation_article_152
       violation_article_14_1_1
       violation_article_144_applied
       violation_article_144
       violation_article_145_2)))

; [securities:penalty_fine_non_submission_or_obstruction] 未依主管機關命令提出資料或妨礙檢查
(assert (= penalty_fine_non_submission_or_obstruction
   (or not_submit_required_documents obstruct_inspection refuse_inspection)))

; [securities:penalty_fine_non_compliance_documents] 未依規定製作、申報、公告、備置或保存相關文件
(assert (= penalty_fine_non_compliance_documents non_compliance_documents))

; [securities:penalty_fine_internal_control_not_executed] 證券商或相關事業未確實執行內部控制制度
(assert (= penalty_fine_internal_control_not_executed internal_control_not_executed))

; [securities:penalty_fine_violation_finance_business_management] 違反財務、業務或管理規定
(assert (= penalty_fine_violation_finance_business_management
   (or violation_finance_business_management_93
       violation_finance_business_management_95
       violation_finance_business_management_18_2
       violation_finance_business_management_22_4
       violation_finance_business_management_90
       violation_finance_business_management_70
       violation_finance_business_management_60_2
       violation_finance_business_management_102
       violation_finance_business_management_62_2
       violation_finance_business_management_44_4
       violation_finance_business_management_62_2_etc)))

; [securities:penalty_fine_minor_exemption] 情節輕微者免罰或限期改善後免罰
(assert (= penalty_fine_minor_exemption (or minor_violation improvement_completed)))

; [securities:internal_control_established] 證券商依規定訂定內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_operated_according_to_law] 證券商業務依法令、章程及內部控制制度經營
(assert (= internal_control_operated_according_to_law
   business_operated_according_to_law_and_internal_control))

; [securities:internal_control_updated_after_change] 內部控制制度變更後於限期內完成變更
(assert (= internal_control_updated_after_change
   internal_control_updated_within_deadline))

; [securities:internal_control_violation_conditions] 主管機關得令限期改善及專案審查內部控制制度違規情形
(assert (= internal_control_violation_conditions
   (or (not annual_audit_plan_executed)
       (not internal_control_deficiency_improved)
       (not internal_control_established)
       (not annual_audit_plan_reported)
       (not internal_audit_staff_adequate)
       (not internal_control_deficiency_reported)
       (not internal_control_self_assessed)
       external_financial_report_false_or_violation
       major_fraud_or_suspected_fraud
       other_special_review_needed)))

; [securities:asset_disposal_procedure_established] 公開發行公司訂定取得或處分資產處理程序
(assert (= asset_disposal_procedure_established asset_disposal_procedure_defined))

; [securities:asset_disposal_procedure_contents] 資產處理程序應包含規定事項
(assert (= asset_disposal_procedure_contents
   (and asset_scope_defined
        evaluation_procedure_defined
        operation_procedure_defined
        announcement_and_declaration_defined
        asset_limit_defined
        subsidiary_asset_control_defined
        penalty_for_violation_defined
        other_important_matters_defined)))

; [securities:derivative_transaction_procedure_exemption] 不擬從事衍生性商品交易者得免訂定處理程序
(assert (= derivative_transaction_procedure_exemption
   derivative_transaction_not_intended_and_board_approved))

; [securities:derivative_transaction_procedure_required] 擬從事衍生性商品交易者應依規定訂定處理程序
(assert (= derivative_transaction_procedure_required derivative_transaction_intended))

; [securities:subsidiary_asset_procedure_supervision] 公開發行公司應督促子公司訂定並執行資產處理程序
(assert (= subsidiary_asset_procedure_supervision subsidiary_asset_procedure_supervised))

; [securities:securities_acquisition_evaluation] 取得或處分有價證券應於事實發生日前取得會計師財報及合理性意見
(assert (let ((a!1 (and financial_report_obtained_before_transaction
                (or financial_supervisor_exemption
                    (not (<= 20.0
                             transaction_amount_percentage_of_paid_in_capital))
                    (not (<= 300000000.0 transaction_amount_ntd))
                    public_market_price_available))))
  (= securities_acquisition_evaluation a!1)))

; [securities:honesty_and_credit_principle] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= honesty_and_credit_principle honesty_and_credit_observed))

; [securities:prohibited_behaviors] 證券商負責人及業務人員不得有違反證券管理法令之行為
(assert (not (= (or use_client_account_for_trading
            accept_same_account_offsetting_trades
            illegal_disclosure_of_client_info
            accept_trading_with_market_manipulation_intent
            underwriting_personnel_get_undue_benefits
            accept_non_client_or_unappointed_agent
            accept_trading_without_proper_contract
            accept_officer_agent_trading
            full_power_delegation_to_client
            agent_open_account_for_others
            accept_trading_by_investment_advisor_system
            loan_or_mediation_with_client
            joint_risk_sharing_with_client
            solicit_unapproved_securities_or_derivatives
            not_follow_client_order_conditions
            fraud_or_misleading_in_underwriting_or_trading
            accept_non_client_account
            use_others_or_relatives_name_for_trading
            promote_unapproved_securities
            misappropriation_of_client_assets
            profit_guarantee_or_sharing
            speculation_using_insider_info
            induce_trading_by_price_prediction
            self_dealing_with_client_orders
            other_violations_of_securities_laws_or_regulations)
        prohibited_behaviors)))

; [securities:prohibited_behaviors_employees] 證券商其他受僱人不得有違反證券管理法令之行為
(assert (= prohibited_behaviors_employees prohibited_behaviors))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法相關規定或主管機關命令，且未免罰或未改善完成時處罰
(assert (= penalty
   (and (or internal_control_violation_conditions
            penalty_fine_violation
            prohibited_behaviors
            penalty_fine_non_submission_or_obstruction
            penalty_fine_violation_finance_business_management
            penalty_fine_internal_control_not_executed
            penalty_fine_non_compliance_documents)
        (not penalty_fine_minor_exemption))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_of_law_or_regulation true))
(assert (= violation_affecting_business true))
(assert (= penalty_imposed_according_to_article_66 true))
(assert (= penalty_imposed_by_authority true))
(assert (= penalty_fine_violation true))
(assert (= penalty_fine_internal_control_not_executed true))
(assert (= internal_control_established false))
(assert (= internal_control_system_established false))
(assert (= internal_control_not_executed true))
(assert (= internal_control_violation_conditions true))
(assert (= internal_audit_staff_adequate false))
(assert (= annual_audit_plan_reported false))
(assert (= annual_audit_plan_executed false))
(assert (= internal_control_deficiency_reported false))
(assert (= internal_control_deficiency_improved false))
(assert (= prohibited_behaviors false))
(assert (= prohibited_behaviors_employees false))
(assert (= order_dismiss_officer true))
(assert (= order_stop_business_within_one_year true))
(assert (= stop_business_or_dismiss_order true))
(assert (= penalty_type_dismiss_officer true))
(assert (= penalty_type_suspension true))
(assert (= penalty_type_warning false))
(assert (= penalty_type_license_revocation false))
(assert (= penalty_type_other false))
(assert (= asset_disposal_procedure_defined false))
(assert (= subsidiary_asset_procedure_supervised false))
(assert (= subsidiary_asset_procedure_supervision false))
(assert (= asset_disposal_procedure_established false))
(assert (= asset_disposal_procedure_contents false))
(assert (= asset_scope_defined false))
(assert (= evaluation_procedure_defined false))
(assert (= operation_procedure_defined false))
(assert (= announcement_and_declaration_defined false))
(assert (= asset_limit_defined false))
(assert (= subsidiary_asset_control_defined false))
(assert (= penalty_for_violation_defined false))
(assert (= other_important_matters_defined false))
(assert (= other_special_review_needed false))
(assert (= external_financial_report_false_or_violation false))
(assert (= major_fraud_or_suspected_fraud false))
(assert (= not_submit_required_documents false))
(assert (= obstruct_inspection false))
(assert (= refuse_inspection false))
(assert (= non_compliance_documents false))
(assert (= violation_finance_business_management_18_2 true))
(assert (= violation_finance_business_management_22_4 false))
(assert (= violation_finance_business_management_44_4 false))
(assert (= violation_finance_business_management_60_2 false))
(assert (= violation_finance_business_management_62_2 false))
(assert (= violation_finance_business_management_62_2_etc false))
(assert (= violation_finance_business_management_70 false))
(assert (= violation_finance_business_management_90 false))
(assert (= violation_finance_business_management_93 false))
(assert (= violation_finance_business_management_95 false))
(assert (= violation_finance_business_management_102 false))
(assert (= financial_report_obtained_before_transaction false))
(assert (= transaction_amount_percentage_of_paid_in_capital 60.0))
(assert (= transaction_amount_ntd 350000000.0))
(assert (= public_market_price_available false))
(assert (= financial_supervisor_exemption false))
(assert (= derivative_transaction_intended false))
(assert (= derivative_transaction_not_intended_and_board_approved true))
(assert (= derivative_transaction_procedure_exemption true))
(assert (= derivative_transaction_procedure_required false))
(assert (= minor_violation false))
(assert (= improvement_completed false))
(assert (= honesty_and_credit_observed false))
(assert (= honesty_and_credit_principle false))
(assert (= accept_non_client_account false))
(assert (= accept_non_client_or_unappointed_agent false))
(assert (= accept_officer_agent_trading false))
(assert (= accept_same_account_offsetting_trades false))
(assert (= accept_trading_by_investment_advisor_system false))
(assert (= accept_trading_with_market_manipulation_intent false))
(assert (= accept_trading_without_proper_contract false))
(assert (= agent_open_account_for_others false))
(assert (= fraud_or_misleading_in_underwriting_or_trading false))
(assert (= full_power_delegation_to_client false))
(assert (= illegal_disclosure_of_client_info false))
(assert (= induce_trading_by_price_prediction false))
(assert (= joint_risk_sharing_with_client false))
(assert (= loan_or_mediation_with_client false))
(assert (= misappropriation_of_client_assets false))
(assert (= not_follow_client_order_conditions false))
(assert (= promote_unapproved_securities false))
(assert (= self_dealing_with_client_orders false))
(assert (= solicit_unapproved_securities_or_derivatives false))
(assert (= speculation_using_insider_info false))
(assert (= underwriting_personnel_get_undue_benefits false))
(assert (= other_violations_of_securities_laws_or_regulations false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 29
; Total variables: 127
; Total facts: 91
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
