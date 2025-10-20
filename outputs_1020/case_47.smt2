; SMT2 file generated from compliance case automatic
; Case ID: case_47
; Generated at: 2025-10-19T06:32:29.337657
;
; This file can be executed with Z3:
;   z3 case_47.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_audit_plan_executed Bool)
(declare-const annual_audit_plan_reported_on_time Bool)
(declare-const behavioral_standards_met Bool)
(declare-const business_operation_compliance Bool)
(declare-const confidentiality_compliance Bool)
(declare-const confidentiality_maintained Bool)
(declare-const confidentiality_personnel_compliance Bool)
(declare-const control_operation_recorded Bool)
(declare-const damaging_client_interest_trading Bool)
(declare-const decision_based_on_analysis Bool)
(declare-const decision_has_reasonable_basis Bool)
(declare-const delegated_investment_decision_compliance Bool)
(declare-const diversification_ratio Real)
(declare-const duty_of_care Bool)
(declare-const duty_of_loyalty Bool)
(declare-const execution_recorded Bool)
(declare-const failure_to_return_commission_to_fund Bool)
(declare-const false_financial_reporting Bool)
(declare-const fiduciary_duty_compliance Bool)
(declare-const fraud_or_false_reporting_absent Bool)
(declare-const fraudulent_behavior Bool)
(declare-const good_faith_principle Bool)
(declare-const improvement_status_reported_on_time Bool)
(declare-const insider_info_leakage Bool)
(declare-const internal_audit_compliance Bool)
(declare-const internal_audit_staff_qualified Bool)
(declare-const internal_control_deficiencies_improved Bool)
(declare-const internal_control_deficiencies_not_serious Bool)
(declare-const internal_control_deficiencies_reported Bool)
(declare-const internal_control_deficiencies_reported_on_time Bool)
(declare-const internal_control_documented Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_evaluation_compliance Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_improvement_compliance Bool)
(declare-const internal_control_reviewed Bool)
(declare-const internal_control_self_evaluation_done Bool)
(declare-const internal_control_statement_created Bool)
(declare-const internal_control_structure_defined Bool)
(declare-const internal_control_system_established Bool)
(declare-const investment_decision_based_on_report Bool)
(declare-const investment_decision_recorded Bool)
(declare-const investment_diversification_compliance Bool)
(declare-const investment_diversification_limit_compliance Bool)
(declare-const investment_in_single_company_bond Bool)
(declare-const investment_in_single_company_stock_or_bond Bool)
(declare-const investment_in_trust_beneficiary_certificates Bool)
(declare-const major_fraud_occurred Bool)
(declare-const market_price_manipulation Bool)
(declare-const monthly_review_done Bool)
(declare-const net_asset_value Real)
(declare-const operation_according_to_articles Bool)
(declare-const operation_according_to_internal_control Bool)
(declare-const operation_according_to_law Bool)
(declare-const other_acts_affecting_business_or_clients Bool)
(declare-const other_acts_affecting_clients_or_business Bool)
(declare-const other_law_or_authority_exemption Bool)
(declare-const penalty Bool)
(declare-const personnel_qualification_compliance Bool)
(declare-const personnel_qualification_met Bool)
(declare-const profit_loss_sharing_agreement Bool)
(declare-const prohibited_behavior_violated Bool)
(declare-const prohibited_personnel_behavior_violated Bool)
(declare-const prohibited_related_party_trading_violated Bool)
(declare-const providing_or_receiving_specific_benefits Bool)
(declare-const public_promotion_of_specific_securities Bool)
(declare-const reasonable_explanation_provided Bool)
(declare-const record_retention_period_months Int)
(declare-const registration_procedure_followed Bool)
(declare-const regulator_exception_for_related_party_trading Bool)
(declare-const regulator_max_diversification_ratio Real)
(declare-const regulator_min_diversification_ratio Real)
(declare-const regulator_performance_fee_exception Bool)
(declare-const regulator_relative_trade_exception Bool)
(declare-const regulator_subdelegation_exception Bool)
(declare-const related_party_trading_declaration_compliance Bool)
(declare-const related_party_trading_declared Bool)
(declare-const related_party_trading_during_fund_holding Bool)
(declare-const self_or_other_interest_trading Bool)
(declare-const subdelegation_or_transfer Bool)
(declare-const training_completed Bool)
(declare-const transfer_of_proxy_or_voting_rights_for_money Bool)
(declare-const unauthorized_account_transfer Bool)
(declare-const unauthorized_agent_trading Bool)
(declare-const unreasonable_commission_payment Bool)
(declare-const use_client_account_for_self_or_others Bool)
(declare-const use_of_insider_info_for_others Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:fiduciary_duty_compliance] 證券投資信託事業等依善良管理人注意義務及忠實義務執行業務
(assert (= fiduciary_duty_compliance
   (and duty_of_care duty_of_loyalty good_faith_principle)))

; [securities:confidentiality_compliance] 保守受益人或客戶個人資料及交易資料秘密
(assert (= confidentiality_compliance
   (or confidentiality_maintained other_law_or_authority_exemption)))

; [securities:investment_decision_recorded] 投資決定依分析作成並有合理基礎，執行時作成紀錄並按月檢討
(assert (= investment_decision_recorded
   (and decision_based_on_analysis
        decision_has_reasonable_basis
        execution_recorded
        monthly_review_done)))

; [securities:internal_control_established_and_executed] 內部控制制度訂定於制度且確實執行並留存紀錄
(assert (= internal_control_established_and_executed
   (and internal_control_documented
        internal_control_executed
        control_operation_recorded
        (<= 0 record_retention_period_months))))

; [securities:delegated_investment_decision_compliance] 全權委託投資決定準用投資決定規定
(assert (= delegated_investment_decision_compliance investment_decision_recorded))

; [securities:investment_diversification_compliance] 委託投資資產分散投資且符合主管機關定分散比率
(assert (= investment_diversification_compliance
   (and (>= diversification_ratio regulator_min_diversification_ratio)
        (<= diversification_ratio regulator_max_diversification_ratio))))

; [securities:prohibited_behavior_violated] 全權委託投資業務禁止行為違反
(assert (= prohibited_behavior_violated
   (or (and subdelegation_or_transfer (not regulator_subdelegation_exception))
       use_client_account_for_self_or_others
       use_of_insider_info_for_others
       (and profit_loss_sharing_agreement
            (not regulator_performance_fee_exception))
       (and self_or_other_interest_trading
            (not regulator_relative_trade_exception))
       unauthorized_account_transfer
       (and (not investment_decision_based_on_report)
            (not reasonable_explanation_provided))
       other_acts_affecting_business_or_clients
       damaging_client_interest_trading)))

; [securities:personnel_qualification_compliance] 人員資格條件、行為規範、訓練及登記程序符合主管機關規定
(assert (= personnel_qualification_compliance
   (and personnel_qualification_met
        behavioral_standards_met
        training_completed
        registration_procedure_followed)))

; [securities:prohibited_personnel_behavior_violated] 負責人及業務人員違反禁止行為
(assert (= prohibited_personnel_behavior_violated
   (or self_or_other_interest_trading
       unreasonable_commission_payment
       unauthorized_account_transfer
       market_price_manipulation
       providing_or_receiving_specific_benefits
       public_promotion_of_specific_securities
       unauthorized_agent_trading
       transfer_of_proxy_or_voting_rights_for_money
       fraudulent_behavior
       insider_info_leakage
       failure_to_return_commission_to_fund
       other_acts_affecting_clients_or_business)))

; [securities:confidentiality_personnel_compliance] 人員保守受益人或客戶個人資料及交易資料秘密
(assert (= confidentiality_personnel_compliance
   (or confidentiality_maintained other_law_or_authority_exemption)))

; [securities:prohibited_related_party_trading_violated] 負責人及關係人禁止交易公司股票及具股權性質衍生商品違反
(assert (= prohibited_related_party_trading_violated
   (and related_party_trading_during_fund_holding
        (not regulator_exception_for_related_party_trading))))

; [securities:related_party_trading_declaration_compliance] 負責人及關係人交易申報符合主管機關規定
(assert (= related_party_trading_declaration_compliance related_party_trading_declared))

; [securities:internal_control_system_established] 建立內部控制制度並確實執行及檢討
(assert (= internal_control_system_established
   (and internal_control_structure_defined
        internal_control_executed
        internal_control_reviewed)))

; [securities:internal_control_deficiencies_reported] 依規定申報內部控制缺失及改善情形
(assert (= internal_control_deficiencies_reported
   (and internal_control_deficiencies_reported_on_time
        improvement_status_reported_on_time)))

; [securities:internal_audit_compliance] 配置適任內部稽核人員並確實執行年度稽核計畫
(assert (= internal_audit_compliance
   (and internal_audit_staff_qualified
        annual_audit_plan_reported_on_time
        annual_audit_plan_executed)))

; [securities:internal_control_evaluation_compliance] 依規定自行評估內部控制制度並作成聲明書
(assert (= internal_control_evaluation_compliance
   (and internal_control_self_evaluation_done
        internal_control_statement_created)))

; [securities:internal_control_improvement_compliance] 依會計師建議改善內部控制缺失
(assert (= internal_control_improvement_compliance
   (or internal_control_deficiencies_improved
       internal_control_deficiencies_not_serious)))

; [securities:fraud_or_false_reporting_absent] 無重大舞弊或外部財務報導不實情事
(assert (= fraud_or_false_reporting_absent
   (and (not major_fraud_occurred) (not false_financial_reporting))))

; [securities:business_operation_compliance] 業務經營依法令、章程及內部控制制度
(assert (= business_operation_compliance
   (and operation_according_to_law
        operation_according_to_articles
        operation_according_to_internal_control)))

; [securities:investment_diversification_limit_compliance] 全權委託投資帳戶投資標的分散比率符合規定
(assert (= investment_diversification_limit_compliance
   (and (>= (* (/ 1.0 5.0) net_asset_value)
            (ite investment_in_single_company_stock_or_bond 1.0 0.0))
        (>= (* (/ 1.0 10.0) net_asset_value)
            (ite investment_in_single_company_bond 1.0 0.0))
        (>= (* (/ 1.0 5.0) net_asset_value)
            (ite investment_in_trust_beneficiary_certificates 1.0 0.0)))))

; [securities:prohibited_behavior_violated_penalty] 處罰條件：違反全權委託投資業務禁止行為
(assert (= penalty prohibited_behavior_violated))

; [securities:fiduciary_and_confidentiality_compliance_penalty] 處罰條件：違反善良管理人義務或保密義務
(assert (= penalty
   (or (not confidentiality_personnel_compliance)
       (not confidentiality_compliance)
       (not fiduciary_duty_compliance))))

; [securities:investment_decision_and_internal_control_penalty] 處罰條件：未依規定作成投資決定紀錄或未建立內部控制制度
(assert (= penalty
   (or (not internal_control_system_established)
       (not internal_audit_compliance)
       (not internal_control_improvement_compliance)
       (not internal_control_established_and_executed)
       (not internal_control_deficiencies_reported)
       (not investment_decision_recorded)
       (not internal_control_evaluation_compliance))))

; [securities:personnel_and_behavior_penalty] 處罰條件：人員資格不符或違反禁止行為
(assert (= penalty
   (or (not personnel_qualification_compliance)
       (not prohibited_personnel_behavior_violated)
       (not prohibited_related_party_trading_violated)
       (not related_party_trading_declaration_compliance))))

; [securities:investment_diversification_penalty] 處罰條件：未符合委託投資資產分散投資規定
(assert (= penalty
   (or (not investment_diversification_compliance)
       (not investment_diversification_limit_compliance))))

; [securities:business_operation_and_fraud_penalty] 處罰條件：業務經營不符規定或有重大舞弊及不實報告
(assert (= penalty
   (or (not business_operation_compliance)
       (not fraud_or_false_reporting_absent))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= duty_of_care false))
(assert (= duty_of_loyalty false))
(assert (= good_faith_principle false))
(assert (= confidentiality_maintained true))
(assert (= other_law_or_authority_exemption false))
(assert (= confidentiality_compliance false))
(assert (= confidentiality_personnel_compliance true))
(assert (= decision_based_on_analysis false))
(assert (= decision_has_reasonable_basis false))
(assert (= execution_recorded false))
(assert (= monthly_review_done false))
(assert (= internal_control_documented false))
(assert (= internal_control_executed false))
(assert (= control_operation_recorded false))
(assert (= record_retention_period_months 0))
(assert (= investment_decision_recorded false))
(assert (= delegated_investment_decision_compliance false))
(assert (= diversification_ratio 0.0))
(assert (= regulator_min_diversification_ratio 0.0))
(assert (= regulator_max_diversification_ratio 1.0))
(assert (= prohibited_behavior_violated true))
(assert (= use_of_insider_info_for_others false))
(assert (= damaging_client_interest_trading false))
(assert (= profit_loss_sharing_agreement false))
(assert (= regulator_performance_fee_exception false))
(assert (= self_or_other_interest_trading true))
(assert (= regulator_relative_trade_exception false))
(assert (= use_client_account_for_self_or_others true))
(assert (= subdelegation_or_transfer false))
(assert (= regulator_subdelegation_exception false))
(assert (= unauthorized_account_transfer false))
(assert (= investment_decision_based_on_report false))
(assert (= reasonable_explanation_provided false))
(assert (= other_acts_affecting_business_or_clients true))
(assert (= personnel_qualification_met true))
(assert (= behavioral_standards_met true))
(assert (= training_completed true))
(assert (= registration_procedure_followed true))
(assert (= personnel_qualification_compliance true))
(assert (= insider_info_leakage false))
(assert (= fraudulent_behavior false))
(assert (= failure_to_return_commission_to_fund false))
(assert (= providing_or_receiving_specific_benefits false))
(assert (= transfer_of_proxy_or_voting_rights_for_money false))
(assert (= market_price_manipulation false))
(assert (= public_promotion_of_specific_securities false))
(assert (= unreasonable_commission_payment false))
(assert (= unauthorized_agent_trading false))
(assert (= other_acts_affecting_clients_or_business false))
(assert (= prohibited_personnel_behavior_violated true))
(assert (= related_party_trading_during_fund_holding true))
(assert (= regulator_exception_for_related_party_trading false))
(assert (= prohibited_related_party_trading_violated true))
(assert (= related_party_trading_declared false))
(assert (= related_party_trading_declaration_compliance false))
(assert (= internal_control_structure_defined false))
(assert (= internal_control_reviewed false))
(assert (= internal_control_system_established false))
(assert (= internal_control_deficiencies_reported_on_time false))
(assert (= improvement_status_reported_on_time false))
(assert (= internal_control_deficiencies_reported false))
(assert (= internal_audit_staff_qualified true))
(assert (= annual_audit_plan_reported_on_time true))
(assert (= annual_audit_plan_executed true))
(assert (= internal_audit_compliance true))
(assert (= internal_control_self_evaluation_done false))
(assert (= internal_control_statement_created false))
(assert (= internal_control_evaluation_compliance false))
(assert (= internal_control_deficiencies_not_serious false))
(assert (= internal_control_deficiencies_improved false))
(assert (= internal_control_improvement_compliance false))
(assert (= major_fraud_occurred false))
(assert (= false_financial_reporting false))
(assert (= fraud_or_false_reporting_absent true))
(assert (= operation_according_to_law false))
(assert (= operation_according_to_articles false))
(assert (= operation_according_to_internal_control false))
(assert (= business_operation_compliance false))
(assert (= penalty true))
(assert (= fiduciary_duty_compliance false))
(assert (= internal_control_established_and_executed false))
(assert (= investment_diversification_compliance false))
(assert (= investment_diversification_limit_compliance false))
(assert (= investment_in_single_company_bond false))
(assert (= investment_in_single_company_stock_or_bond false))
(assert (= investment_in_trust_beneficiary_certificates false))
(assert (= net_asset_value 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 27
; Total variables: 87
; Total facts: 87
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
