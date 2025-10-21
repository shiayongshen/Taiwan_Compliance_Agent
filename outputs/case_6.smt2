; SMT2 file generated from compliance case automatic
; Case ID: case_6
; Generated at: 2025-10-20T22:50:57.800073
;
; This file can be executed with Z3:
;   z3 case_6.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const allow_others_use_name Bool)
(declare-const business_at_unregistered_place Bool)
(declare-const buy_sell_same_securities_as_client Bool)
(declare-const clients_are_professional_investors Bool)
(declare-const concurrent_director_or_manager_broker Bool)
(declare-const concurrent_director_or_manager_other_advisory Bool)
(declare-const concurrent_director_or_manager_trust Bool)
(declare-const conflict_of_interest_behavior Bool)
(declare-const dedicated_department_established Bool)
(declare-const dedicated_department_research_or_decision_staff_trade_execution_dual_role Bool)
(declare-const dedicated_department_setup Bool)
(declare-const dedicated_department_staff_no_trade_execution_dual_role Bool)
(declare-const dedicated_department_staff_outside_business Bool)
(declare-const dedicated_department_staff_qualified Bool)
(declare-const dedicated_department_staff_restriction Bool)
(declare-const dedicated_department_supervisor_qualified Bool)
(declare-const false_or_misleading_behavior Bool)
(declare-const financial_accounting_department_established Bool)
(declare-const fraudulent_contract Bool)
(declare-const full_delegation_approval Bool)
(declare-const full_delegation_approved Bool)
(declare-const full_delegation_conditions_met Bool)
(declare-const improper_commission_or_client_recruitment Bool)
(declare-const inciting_contract_breach Bool)
(declare-const internal_audit_department_established Bool)
(declare-const internal_audit_department_staff_qualified Bool)
(declare-const internal_audit_department_supervisor_qualified Bool)
(declare-const internal_audit_staff_qualification Bool)
(declare-const internal_control_prevents_conflicts Bool)
(declare-const invest_in_other_advisory Bool)
(declare-const investment_advisory_as_gift Bool)
(declare-const investment_and_advisory_staff_dual_role_conditions Bool)
(declare-const investment_decision_staff_and_advisory_staff_dual_role_allowed Bool)
(declare-const investment_decision_staff_and_advisory_staff_dual_role_not_allowed Bool)
(declare-const investment_decision_staff_compatibility Bool)
(declare-const investment_decision_staff_compatible_with_other_roles Bool)
(declare-const investment_research_department_established Bool)
(declare-const loan_or_intermediation_with_client Bool)
(declare-const manager_and_staff_leave_proxy Bool)
(declare-const manager_and_staff_leave_proxy_record Bool)
(declare-const manager_investment_restriction Bool)
(declare-const misappropriation_of_client_assets Bool)
(declare-const non_registered_staff_doing_dedicated_business Bool)
(declare-const other_departments_setup Bool)
(declare-const other_illegal_acts Bool)
(declare-const penalty Bool)
(declare-const profit_loss_sharing_with_client Bool)
(declare-const prohibited_behaviors Bool)
(declare-const proxy_assigned Bool)
(declare-const proxy_qualification_equivalent Bool)
(declare-const proxy_recorded Bool)
(declare-const proxy_violates_article_7 Bool)
(declare-const superstition_based_investment_advice Bool)
(declare-const unauthorized_disclosure_of_client_info Bool)
(declare-const unauthorized_proxy_trading Bool)
(declare-const unreasonable_recommendations Bool)
(declare-const unsubstantiated_public_predictions Bool)
(declare-const use_of_alias Bool)
(declare-const violate_authority_orders Bool)
(declare-const violate_law Bool)
(declare-const violation_penalty_conditions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:full_delegation_approval] 證券投資信託或顧問事業經營全權委託投資業務須符合主管機關條件並核准
(assert (= full_delegation_approval
   (and full_delegation_conditions_met full_delegation_approved)))

; [securities:dedicated_department_setup] 經營全權委託投資業務應設置專責部門並配置適任主管及業務人員
(assert (= dedicated_department_setup
   (and dedicated_department_established
        dedicated_department_supervisor_qualified
        dedicated_department_staff_qualified)))

; [securities:other_departments_setup] 應至少設置投資研究、財務會計及內部稽核部門
(assert (= other_departments_setup
   (and investment_research_department_established
        financial_accounting_department_established
        internal_audit_department_established)))

; [securities:dedicated_department_staff_restriction] 專責部門主管及業務人員不得辦理專責部門以外業務或由非登錄專責部門人員兼辦
(assert (= dedicated_department_staff_restriction
   (and (not dedicated_department_staff_outside_business)
        (not non_registered_staff_doing_dedicated_business))))

; [securities:investment_decision_staff_compatibility] 辦理投資或交易決策之業務人員得兼任私募基金及期貨信託基金投資決策人員
(assert (= investment_decision_staff_compatibility
   investment_decision_staff_compatible_with_other_roles))

; [securities:investment_and_advisory_staff_dual_role_conditions] 符合條件者，投資決策人員得與證券投資分析人員相互兼任
(assert (= investment_and_advisory_staff_dual_role_conditions
   (and clients_are_professional_investors
        internal_control_prevents_conflicts
        (or investment_decision_staff_and_advisory_staff_dual_role_allowed
            (not investment_decision_staff_and_advisory_staff_dual_role_not_allowed)))))

; [securities:dedicated_department_staff_no_trade_execution_dual_role] 專責部門研究分析及投資決策人員不得與買賣執行人員相互兼任
(assert (not (= dedicated_department_research_or_decision_staff_trade_execution_dual_role
        dedicated_department_staff_no_trade_execution_dual_role)))

; [securities:internal_audit_staff_qualification] 專責部門與內部稽核部門主管及業務人員應符合資格條件
(assert (= internal_audit_staff_qualification
   (and dedicated_department_supervisor_qualified
        dedicated_department_staff_qualified
        internal_audit_department_supervisor_qualified
        internal_audit_department_staff_qualified)))

; [securities:manager_and_staff_leave_proxy] 經理人或業務人員出缺應指派具相當資格人員代理且不得違反第七條規定
(assert (= manager_and_staff_leave_proxy
   (and proxy_assigned
        proxy_qualification_equivalent
        (not proxy_violates_article_7))))

; [securities:manager_and_staff_leave_proxy_record] 應設專簿載明代理事由、期間、代理人及職務
(assert (= manager_and_staff_leave_proxy_record proxy_recorded))

; [securities:prohibited_behaviors] 負責人、主管及業務人員不得有違反誠信義務及其他禁止行為
(assert (not (= (or business_at_unregistered_place
            loan_or_intermediation_with_client
            conflict_of_interest_behavior
            allow_others_use_name
            investment_advisory_as_gift
            fraudulent_contract
            misappropriation_of_client_assets
            buy_sell_same_securities_as_client
            improper_commission_or_client_recruitment
            superstition_based_investment_advice
            unauthorized_disclosure_of_client_info
            inciting_contract_breach
            false_or_misleading_behavior
            unreasonable_recommendations
            unauthorized_proxy_trading
            profit_loss_sharing_with_client
            unsubstantiated_public_predictions
            use_of_alias
            other_illegal_acts)
        prohibited_behaviors)))

; [securities:manager_investment_restriction] 董事、監察人、經理人不得投資或兼任其他證券投資顧問或信託事業職務
(assert (not (= (or concurrent_director_or_manager_broker
            invest_in_other_advisory
            concurrent_director_or_manager_trust
            concurrent_director_or_manager_other_advisory)
        manager_investment_restriction)))

; [securities:violation_penalty_conditions] 違反本法或主管機關命令者處罰條件
(assert (= violation_penalty_conditions (or violate_law violate_authority_orders)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反經營全權委託投資業務條件、專責部門設置、資格限制、誠信義務或主管機關命令時處罰
(assert (= penalty
   (or (not internal_audit_staff_qualification)
       (not manager_investment_restriction)
       (not investment_decision_staff_compatibility)
       (not manager_and_staff_leave_proxy)
       (not prohibited_behaviors)
       (not investment_and_advisory_staff_dual_role_conditions)
       (not manager_and_staff_leave_proxy_record)
       (not dedicated_department_staff_restriction)
       (not full_delegation_approval)
       (not dedicated_department_staff_no_trade_execution_dual_role)
       violation_penalty_conditions
       (not other_departments_setup)
       (not dedicated_department_setup))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= full_delegation_conditions_met false))
(assert (= full_delegation_approved false))
(assert (= full_delegation_approval false))
(assert (= dedicated_department_established false))
(assert (= dedicated_department_supervisor_qualified false))
(assert (= dedicated_department_staff_qualified false))
(assert (= dedicated_department_setup false))
(assert (= investment_research_department_established true))
(assert (= financial_accounting_department_established true))
(assert (= internal_audit_department_established false))
(assert (= other_departments_setup false))
(assert (= dedicated_department_staff_outside_business true))
(assert (= non_registered_staff_doing_dedicated_business true))
(assert (= dedicated_department_staff_restriction false))
(assert (= investment_decision_staff_compatible_with_other_roles true))
(assert (= investment_decision_staff_compatibility true))
(assert (= clients_are_professional_investors true))
(assert (= internal_control_prevents_conflicts false))
(assert (= investment_decision_staff_and_advisory_staff_dual_role_allowed false))
(assert (= investment_decision_staff_and_advisory_staff_dual_role_not_allowed true))
(assert (= investment_and_advisory_staff_dual_role_conditions false))
(assert (= dedicated_department_research_or_decision_staff_trade_execution_dual_role true))
(assert (= dedicated_department_staff_no_trade_execution_dual_role false))
(assert (= internal_audit_department_supervisor_qualified false))
(assert (= internal_audit_department_staff_qualified false))
(assert (= internal_audit_staff_qualification false))
(assert (= proxy_assigned false))
(assert (= proxy_qualification_equivalent false))
(assert (= proxy_violates_article_7 true))
(assert (= proxy_recorded false))
(assert (= manager_and_staff_leave_proxy false))
(assert (= manager_and_staff_leave_proxy_record false))
(assert (= allow_others_use_name true))
(assert (= business_at_unregistered_place false))
(assert (= buy_sell_same_securities_as_client false))
(assert (= conflict_of_interest_behavior false))
(assert (= false_or_misleading_behavior false))
(assert (= fraudulent_contract false))
(assert (= improper_commission_or_client_recruitment false))
(assert (= inciting_contract_breach false))
(assert (= loan_or_intermediation_with_client false))
(assert (= misappropriation_of_client_assets false))
(assert (= prohibited_behaviors false))
(assert (= invest_in_other_advisory false))
(assert (= concurrent_director_or_manager_other_advisory false))
(assert (= concurrent_director_or_manager_trust false))
(assert (= concurrent_director_or_manager_broker false))
(assert (= manager_investment_restriction true))
(assert (= unauthorized_disclosure_of_client_info false))
(assert (= unauthorized_proxy_trading false))
(assert (= unreasonable_recommendations false))
(assert (= unsubstantiated_public_predictions false))
(assert (= superstition_based_investment_advice false))
(assert (= use_of_alias false))
(assert (= investment_advisory_as_gift false))
(assert (= other_illegal_acts false))
(assert (= violate_law true))
(assert (= violate_authority_orders false))
(assert (= violation_penalty_conditions true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 61
; Total facts: 60
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
