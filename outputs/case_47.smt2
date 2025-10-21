; SMT2 file generated from compliance case automatic
; Case ID: case_47
; Generated at: 2025-10-21T00:05:02.253171
;
; This file can be executed with Z3:
;   z3 case_47.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const acts_in_good_faith Bool)
(declare-const acts_with_diligence_and_loyalty Bool)
(declare-const annual_audit_plan_executed Bool)
(declare-const annual_audit_plan_reported Bool)
(declare-const compensation_responsibility Bool)
(declare-const complies_with_law Bool)
(declare-const complies_with_orders_and_contracts Bool)
(declare-const confidentiality_compliance Bool)
(declare-const control_operation_recorded Bool)
(declare-const damaging_client_interests_trading Bool)
(declare-const delegated_investment_contract_transfer Bool)
(declare-const delegated_investment_decision_compliance Bool)
(declare-const engaged_in_prohibited_acts Bool)
(declare-const engaged_in_restricted_stock_and_derivative_trading Bool)
(declare-const execution_recorded Bool)
(declare-const external_financial_reporting_false Bool)
(declare-const fiduciary_duty_compliance Bool)
(declare-const illegal_business_operation Bool)
(declare-const illegal_personnel_behavior Bool)
(declare-const insider_trading_for_others Bool)
(declare-const internal_audit_staff_adequate Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_deficiencies Bool)
(declare-const internal_control_deficiencies_corrected Bool)
(declare-const internal_control_deficiencies_reported Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_reviewed Bool)
(declare-const internal_control_self_assessed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_written Bool)
(declare-const investment_decision_based_on_analysis Bool)
(declare-const investment_decision_has_reasonable_basis Bool)
(declare-const investment_decision_recorded Bool)
(declare-const investment_diversification_compliance Bool)
(declare-const keeps_beneficiary_personal_data_secret Bool)
(declare-const keeps_other_related_data_secret Bool)
(declare-const keeps_transaction_data_secret Bool)
(declare-const major_fraud_or_suspected_fraud Bool)
(declare-const meets_diversification_ratio_requirements Bool)
(declare-const meets_personnel_qualification_and_behavior_rules Bool)
(declare-const monthly_review_submitted Bool)
(declare-const non_intentional_relative_trading Bool)
(declare-const operating_branch_without_approval Bool)
(declare-const operating_without_approval Bool)
(declare-const operating_without_business_license Bool)
(declare-const other_behaviors_affecting_business_or_client_rights Bool)
(declare-const other_necessary_special_audit Bool)
(declare-const penalty Bool)
(declare-const performance_fee_exception Bool)
(declare-const personnel_qualification_compliance Bool)
(declare-const personnel_violated_law_affecting_business Bool)
(declare-const profit_loss_sharing_agreement Bool)
(declare-const prohibited_behaviors_violated Bool)
(declare-const prohibited_personnel_behaviors_violated Bool)
(declare-const reasonable_explanation_provided Bool)
(declare-const record_retention_period_months Int)
(declare-const regulatory_exception_for_transfer Bool)
(declare-const related_persons_trading_declaration_compliance Bool)
(declare-const related_persons_trading_restriction Bool)
(declare-const reported_trading_to_fund_company Bool)
(declare-const self_or_other_fund_relative_trading Bool)
(declare-const serious_violation_of_laws Bool)
(declare-const unauthorized_order_account_transfer Bool)
(declare-const using_client_account_for_self_or_others Bool)
(declare-const violating_behavior_restrictions Bool)
(declare-const violating_diversification_ratio_rules Bool)
(declare-const violating_investment_decision_rules Bool)
(declare-const violating_investment_limit_rules Bool)
(declare-const violating_investment_scope_rules Bool)
(declare-const violating_prohibition_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:fiduciary_duty_compliance] 證券投資信託事業等依善良管理人注意義務及忠實義務執行業務
(assert (= fiduciary_duty_compliance
   (and complies_with_law
        complies_with_orders_and_contracts
        acts_with_diligence_and_loyalty
        acts_in_good_faith)))

; [securities:confidentiality_compliance] 保守受益人或客戶個人資料及交易資料秘密
(assert (= confidentiality_compliance
   (and keeps_beneficiary_personal_data_secret
        keeps_transaction_data_secret
        keeps_other_related_data_secret)))

; [securities:compensation_responsibility] 違反善良管理人義務或保密義務致損害應負賠償責任
(assert compensation_responsibility)

; [securities:investment_decision_recorded] 投資決定依分析作成並有合理基礎，執行時作成紀錄並按月檢討
(assert (= investment_decision_recorded
   (and investment_decision_based_on_analysis
        investment_decision_has_reasonable_basis
        execution_recorded
        monthly_review_submitted)))

; [securities:internal_control_compliance] 投資分析決定執行及檢討方式訂定於內部控制制度並確實執行且留存紀錄
(assert (= internal_control_compliance
   (and internal_control_system_established
        internal_control_system_executed
        control_operation_recorded
        (<= 0 record_retention_period_months))))

; [securities:delegated_investment_decision_compliance] 全權委託投資決定準用投資決定規定
(assert (= delegated_investment_decision_compliance investment_decision_recorded))

; [securities:investment_diversification_compliance] 委託投資資產應分散投資並符合主管機關定之分散比率
(assert (= investment_diversification_compliance
   meets_diversification_ratio_requirements))

; [securities:prohibited_behaviors_violated] 經營全權委託投資業務禁止行為違反判斷
(assert (= prohibited_behaviors_violated
   (or (and self_or_other_fund_relative_trading
            (not non_intentional_relative_trading))
       insider_trading_for_others
       other_behaviors_affecting_business_or_client_rights
       using_client_account_for_self_or_others
       (and profit_loss_sharing_agreement (not performance_fee_exception))
       unauthorized_order_account_transfer
       (and delegated_investment_contract_transfer
            (not regulatory_exception_for_transfer))
       (and (not investment_decision_based_on_analysis)
            (not reasonable_explanation_provided))
       damaging_client_interests_trading)))

; [securities:personnel_qualification_compliance] 應備置人員資格條件及行為規範等符合主管機關規定
(assert (= personnel_qualification_compliance
   meets_personnel_qualification_and_behavior_rules))

; [securities:prohibited_personnel_behaviors_violated] 負責人及業務人員等不得為法令或契約禁止行為違反判斷
(assert (= prohibited_personnel_behaviors_violated engaged_in_prohibited_acts))

; [securities:related_persons_trading_restriction] 負責人及關係人不得從事特定公司股票及股權性質衍生商品交易
(assert (not (= engaged_in_restricted_stock_and_derivative_trading
        related_persons_trading_restriction)))

; [securities:related_persons_trading_declaration_compliance] 負責人及關係人應依主管機關規定申報交易情形
(assert (= related_persons_trading_declaration_compliance
   reported_trading_to_fund_company))

; [securities:internal_control_system_established] 建立內部控制制度且確實執行並隨時檢討
(assert (= internal_control_system_established
   (and internal_control_written
        internal_control_executed
        internal_control_reviewed)))

; [securities:internal_control_deficiencies] 內部控制制度缺失或違反法令情節重大
(assert (= internal_control_deficiencies
   (or (not internal_control_deficiencies_corrected)
       (not internal_audit_staff_adequate)
       serious_violation_of_laws
       (not internal_control_written)
       (not annual_audit_plan_executed)
       other_necessary_special_audit
       (not internal_control_self_assessed)
       major_fraud_or_suspected_fraud
       external_financial_reporting_false
       (not annual_audit_plan_reported)
       (not internal_control_deficiencies_reported))))

; [securities:illegal_business_operation] 違反經營未經核准業務等規定
(assert (= illegal_business_operation
   (or violating_investment_decision_rules
       operating_without_business_license
       violating_prohibition_rules
       operating_without_approval
       violating_investment_scope_rules
       violating_investment_limit_rules
       violating_behavior_restrictions
       operating_branch_without_approval
       violating_diversification_ratio_rules)))

; [securities:illegal_personnel_behavior] 董事、監察人、經理人或受僱人違反法令影響業務正常執行
(assert (= illegal_personnel_behavior personnel_violated_law_affecting_business))

; [securities:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities:penalty_conditions] 處罰條件：違反法令義務或禁止行為時處罰
(assert (= penalty
   (or (not fiduciary_duty_compliance)
       internal_control_deficiencies
       illegal_personnel_behavior
       prohibited_personnel_behaviors_violated
       (not confidentiality_compliance)
       (not personnel_qualification_compliance)
       prohibited_behaviors_violated
       illegal_business_operation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= acts_in_good_faith false))
(assert (= acts_with_diligence_and_loyalty false))
(assert (= annual_audit_plan_executed false))
(assert (= annual_audit_plan_reported false))
(assert (= compensation_responsibility true))
(assert (= complies_with_law false))
(assert (= complies_with_orders_and_contracts false))
(assert (= confidentiality_compliance false))
(assert (= control_operation_recorded false))
(assert (= damaging_client_interests_trading true))
(assert (= delegated_investment_contract_transfer false))
(assert (= delegated_investment_decision_compliance false))
(assert (= engaged_in_prohibited_acts true))
(assert (= engaged_in_restricted_stock_and_derivative_trading false))
(assert (= execution_recorded false))
(assert (= external_financial_reporting_false false))
(assert (= fiduciary_duty_compliance false))
(assert (= illegal_business_operation false))
(assert (= illegal_personnel_behavior true))
(assert (= insider_trading_for_others true))
(assert (= internal_audit_staff_adequate false))
(assert (= internal_control_compliance false))
(assert (= internal_control_deficiencies true))
(assert (= internal_control_deficiencies_corrected false))
(assert (= internal_control_deficiencies_reported false))
(assert (= internal_control_executed false))
(assert (= internal_control_reviewed false))
(assert (= internal_control_self_assessed false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_written false))
(assert (= investment_decision_based_on_analysis false))
(assert (= investment_decision_has_reasonable_basis false))
(assert (= investment_decision_recorded false))
(assert (= investment_diversification_compliance true))
(assert (= keeps_beneficiary_personal_data_secret true))
(assert (= keeps_other_related_data_secret true))
(assert (= keeps_transaction_data_secret true))
(assert (= major_fraud_or_suspected_fraud false))
(assert (= meets_diversification_ratio_requirements true))
(assert (= meets_personnel_qualification_and_behavior_rules false))
(assert (= monthly_review_submitted false))
(assert (= non_intentional_relative_trading false))
(assert (= operating_branch_without_approval false))
(assert (= operating_without_approval false))
(assert (= operating_without_business_license false))
(assert (= other_behaviors_affecting_business_or_client_rights true))
(assert (= other_necessary_special_audit true))
(assert (= penalty true))
(assert (= performance_fee_exception false))
(assert (= personnel_qualification_compliance false))
(assert (= personnel_violated_law_affecting_business true))
(assert (= profit_loss_sharing_agreement false))
(assert (= prohibited_behaviors_violated true))
(assert (= prohibited_personnel_behaviors_violated true))
(assert (= reasonable_explanation_provided false))
(assert (= record_retention_period_months 0))
(assert (= regulatory_exception_for_transfer false))
(assert (= related_persons_trading_declaration_compliance false))
(assert (= related_persons_trading_restriction false))
(assert (= reported_trading_to_fund_company false))
(assert (= self_or_other_fund_relative_trading true))
(assert (= serious_violation_of_laws true))
(assert (= unauthorized_order_account_transfer false))
(assert (= using_client_account_for_self_or_others true))
(assert (= violating_behavior_restrictions true))
(assert (= violating_diversification_ratio_rules false))
(assert (= violating_investment_decision_rules true))
(assert (= violating_investment_limit_rules false))
(assert (= violating_investment_scope_rules false))
(assert (= violating_prohibition_rules true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 71
; Total facts: 71
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
