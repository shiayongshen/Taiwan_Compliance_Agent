; SMT2 file generated from compliance case automatic
; Case ID: case_6
; Generated at: 2025-10-19T04:52:48.148473
;
; This file can be executed with Z3:
;   z3 case_6.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const additional_departments_setup Bool)
(declare-const agency_record_book_established Bool)
(declare-const agent_does_not_violate_article_7 Bool)
(declare-const agent_has_equivalent_qualification Bool)
(declare-const agent_qualification_and_record Bool)
(declare-const allow_others_use_of_name Bool)
(declare-const approved_by_authority Bool)
(declare-const authority_and_responsibility_defined Bool)
(declare-const business_at_unregistered_place Bool)
(declare-const clients_are_professional_investors Bool)
(declare-const coercion_contract Bool)
(declare-const concurrent_director_or_manager_in_other_advisors Bool)
(declare-const cross_role_conditions_for_investment_analysis Bool)
(declare-const cross_role_conditions_for_other_business Bool)
(declare-const dedicated_department_established Bool)
(declare-const dedicated_department_setup Bool)
(declare-const dedicated_department_staff_do_not_handle_other_business Bool)
(declare-const dedicated_department_staff_no_cross_trade_execution Bool)
(declare-const dedicated_department_staff_outside_business_restriction Bool)
(declare-const dedicated_department_staff_qualified Bool)
(declare-const dedicated_department_staff_restriction Bool)
(declare-const dedicated_department_supervisor_qualified Bool)
(declare-const duty_of_care_and_fidelity Bool)
(declare-const duty_of_care_and_fidelity_performed Bool)
(declare-const false_misleading_behavior Bool)
(declare-const financial_accounting_department_established Bool)
(declare-const fraudulent_contract Bool)
(declare-const full_discretionary_investment_approval Bool)
(declare-const general_manager_is_dedicated_department_supervisor Bool)
(declare-const general_manager_is_futures_trading_decision_maker Bool)
(declare-const general_manager_is_investment_manager Bool)
(declare-const general_manager_role_restriction Bool)
(declare-const improper_contract Bool)
(declare-const inciting_breach_of_contract Bool)
(declare-const internal_audit_department_established Bool)
(declare-const internal_audit_staff_meet_qualification Bool)
(declare-const internal_audit_staff_qualification Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_prevents_conflicts Bool)
(declare-const internal_control_reviewed_regularly Bool)
(declare-const internal_control_system_design_and_execution Bool)
(declare-const internal_organization_structure_defined Bool)
(declare-const investment_advisory_as_gift Bool)
(declare-const investment_analysis_and_trading_decision_cross_role Bool)
(declare-const investment_analysis_cross_role_allowed Bool)
(declare-const investment_decision_staff_cross_role_conditions Bool)
(declare-const investment_decision_staff_multi_role Bool)
(declare-const investment_decision_staff_multi_role_allowed Bool)
(declare-const investment_research_department_established Bool)
(declare-const investment_strategy_active Bool)
(declare-const investment_strategy_passive Bool)
(declare-const invests_in_other_advisors Bool)
(declare-const loan_or_borrowing_with_client Bool)
(declare-const manager_appointed Bool)
(declare-const meets_regulatory_conditions Bool)
(declare-const meets_special_conditions_for_cross_role Bool)
(declare-const misappropriation_of_client_assets Bool)
(declare-const no_cross_role_between_decision_and_execution Bool)
(declare-const non_registered_staff_do_not_handle_dedicated_business Bool)
(declare-const not_other_business_internal_audit_head Bool)
(declare-const other_business_cross_role_allowed Bool)
(declare-const other_illegal_acts Bool)
(declare-const penalty Bool)
(declare-const profit_loss_sharing_with_client Bool)
(declare-const prohibited_behaviors Bool)
(declare-const prohibition_of_cross_role_for_certain_staff Bool)
(declare-const prohibition_of_investment_in_other_advisors Bool)
(declare-const reporting_system_defined Bool)
(declare-const superstition_based_investment_advice Bool)
(declare-const trading_same_securities_as_client Bool)
(declare-const unauthorized_agent_trading Bool)
(declare-const unauthorized_disclosure_of_client_info Bool)
(declare-const unlicensed_commission_payment Bool)
(declare-const unreasonable_public_predictions Bool)
(declare-const unreasonable_recommendations Bool)
(declare-const use_of_alias Bool)
(declare-const violated_law_or_order Bool)
(declare-const violation_of_law_or_order Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:full_discretionary_investment_approval] 證券投資信託或顧問事業經營全權委託投資業務須符合主管機關條件並核准
(assert (= full_discretionary_investment_approval
   (and meets_regulatory_conditions approved_by_authority)))

; [securities:dedicated_department_setup] 經營全權委託投資業務應設置專責部門並配置適任主管及業務人員
(assert (= dedicated_department_setup
   (and dedicated_department_established
        dedicated_department_supervisor_qualified
        dedicated_department_staff_qualified)))

; [securities:additional_departments_setup] 應至少設置投資研究、財務會計及內部稽核部門
(assert (= additional_departments_setup
   (and investment_research_department_established
        financial_accounting_department_established
        internal_audit_department_established)))

; [securities:dedicated_department_staff_restriction] 專責部門主管及業務人員不得辦理專責部門以外業務或由非登錄專責部門人員兼辦
(assert (= dedicated_department_staff_restriction
   (and dedicated_department_staff_do_not_handle_other_business
        non_registered_staff_do_not_handle_dedicated_business)))

; [securities:investment_decision_staff_multi_role] 辦理投資或交易決策之業務人員得兼任私募基金、期貨信託基金或全權委託期貨交易業務決策人員
(assert (= investment_decision_staff_multi_role
   investment_decision_staff_multi_role_allowed))

; [securities:investment_decision_staff_cross_role_conditions] 符合條件者，投資決策人員得與募集證券投資信託基金或證券投資顧問業務分析人員相互兼任
(assert (= investment_decision_staff_cross_role_conditions
   (and clients_are_professional_investors
        internal_control_prevents_conflicts
        (or investment_strategy_active investment_strategy_passive))))

; [securities:dedicated_department_staff_no_cross_trade_execution] 專責部門研究分析及投資決策人員不得與買賣執行人員相互兼任
(assert (= dedicated_department_staff_no_cross_trade_execution
   no_cross_role_between_decision_and_execution))

; [securities:internal_audit_staff_qualification] 專責部門與內部稽核部門主管及業務人員應符合資格條件
(assert (= internal_audit_staff_qualification
   (or not_other_business_internal_audit_head
       internal_audit_staff_meet_qualification)))

; [securities:general_manager_role_restriction] 證券投資顧問事業總經理不得兼任全權委託專責部門主管、投資經理人或期貨交易決定人員
(assert (not (= (or general_manager_is_dedicated_department_supervisor
            general_manager_is_futures_trading_decision_maker
            general_manager_is_investment_manager)
        general_manager_role_restriction)))

; [securities:dedicated_department_staff_outside_business_restriction] 專責部門主管及業務人員不得辦理專責部門以外業務或由非登錄專責部門人員兼辦
(assert (= dedicated_department_staff_outside_business_restriction
   (and dedicated_department_staff_do_not_handle_other_business
        non_registered_staff_do_not_handle_dedicated_business)))

; [securities:cross_role_conditions_for_other_business] 他業兼營全權委託投資業務者，投資決策人員得兼任私募基金、期貨信託基金或期貨交易決策人員
(assert (= cross_role_conditions_for_other_business other_business_cross_role_allowed))

; [securities:cross_role_conditions_for_investment_analysis] 符合條件者，投資決策人員得與證券投資顧問業務分析人員相互兼任
(assert (= cross_role_conditions_for_investment_analysis
   investment_analysis_cross_role_allowed))

; [securities:prohibition_of_cross_role_for_certain_staff] 證券投資顧問事業分析人員不得與兼營證券投資信託業務投資決策人員相互兼任，除符合特定條件外
(assert (= prohibition_of_cross_role_for_certain_staff
   (or meets_special_conditions_for_cross_role
       (not investment_analysis_and_trading_decision_cross_role))))

; [securities:prohibition_of_investment_in_other_advisors] 證券投資顧問事業董事、監察人或經理人不得投資或兼任其他證券投資顧問事業或相關職務
(assert (not (= (or concurrent_director_or_manager_in_other_advisors
            invests_in_other_advisors)
        prohibition_of_investment_in_other_advisors)))

; [securities:agent_qualification_and_record] 代理人應具相當資格且不得違反第七條規定，並設專簿記錄代理事由
(assert (= agent_qualification_and_record
   (and agent_has_equivalent_qualification
        agent_does_not_violate_article_7
        agency_record_book_established)))

; [securities:duty_of_care_and_fidelity] 負責人及業務人員應以善良管理人注意義務及忠實義務執行業務
(assert (= duty_of_care_and_fidelity duty_of_care_and_fidelity_performed))

; [securities:prohibited_behaviors] 不得有詐欺、脅迫、不正當簽約、代理他人交易、收益共享、買賣推介證券、虛偽欺罔、借貸款項、挪用客戶資產、洩密等不當行為
(assert (not (= (or unlicensed_commission_payment
            superstition_based_investment_advice
            loan_or_borrowing_with_client
            fraudulent_contract
            business_at_unregistered_place
            allow_others_use_of_name
            investment_advisory_as_gift
            unauthorized_agent_trading
            improper_contract
            false_misleading_behavior
            misappropriation_of_client_assets
            profit_loss_sharing_with_client
            trading_same_securities_as_client
            use_of_alias
            other_illegal_acts
            unauthorized_disclosure_of_client_info
            unreasonable_recommendations
            coercion_contract
            unreasonable_public_predictions
            inciting_breach_of_contract)
        prohibited_behaviors)))

; [securities:internal_control_system_design_and_execution] 應訂定明確內部組織結構、呈報體系及權責，並設置經理人，確實執行並隨時檢討內部控制制度
(assert (= internal_control_system_design_and_execution
   (and internal_organization_structure_defined
        reporting_system_defined
        authority_and_responsibility_defined
        manager_appointed
        internal_control_executed
        internal_control_reviewed_regularly)))

; [securities:violation_of_law_or_order] 違反本法或主管機關命令者
(assert (= violation_of_law_or_order violated_law_or_order))

; [securities:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities:penalty_conditions] 處罰條件：違反本法或主管機關命令時處罰
(assert (= penalty
   (or (not internal_control_system_design_and_execution)
       (not internal_audit_staff_qualification)
       (not dedicated_department_staff_no_cross_trade_execution)
       (not duty_of_care_and_fidelity)
       (not prohibition_of_cross_role_for_certain_staff)
       (not general_manager_role_restriction)
       (not dedicated_department_staff_outside_business_restriction)
       (not investment_decision_staff_multi_role)
       (not prohibited_behaviors)
       (not dedicated_department_setup)
       (not cross_role_conditions_for_other_business)
       (not prohibition_of_investment_in_other_advisors)
       (not agent_qualification_and_record)
       (not dedicated_department_staff_restriction)
       (not investment_decision_staff_cross_role_conditions)
       violation_of_law_or_order
       (not cross_role_conditions_for_investment_analysis)
       (not full_discretionary_investment_approval)
       (not additional_departments_setup))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= full_discretionary_investment_approval false))
(assert (= meets_regulatory_conditions false))
(assert (= approved_by_authority false))
(assert (= dedicated_department_established false))
(assert (= dedicated_department_setup false))
(assert (= dedicated_department_supervisor_qualified false))
(assert (= dedicated_department_staff_qualified false))
(assert (= dedicated_department_staff_do_not_handle_other_business false))
(assert (= non_registered_staff_do_not_handle_dedicated_business false))
(assert (= dedicated_department_staff_restriction false))
(assert (= investment_decision_staff_multi_role false))
(assert (= investment_decision_staff_multi_role_allowed false))
(assert (= investment_decision_staff_cross_role_conditions false))
(assert (= clients_are_professional_investors false))
(assert (= internal_control_prevents_conflicts false))
(assert (= investment_strategy_active false))
(assert (= investment_strategy_passive false))
(assert (= dedicated_department_staff_no_cross_trade_execution false))
(assert (= no_cross_role_between_decision_and_execution false))
(assert (= internal_audit_department_established false))
(assert (= internal_audit_staff_meet_qualification false))
(assert (= not_other_business_internal_audit_head false))
(assert (= internal_audit_staff_qualification false))
(assert (= general_manager_is_dedicated_department_supervisor true))
(assert (= general_manager_is_investment_manager true))
(assert (= general_manager_is_futures_trading_decision_maker false))
(assert (= general_manager_role_restriction false))
(assert (= dedicated_department_staff_outside_business_restriction false))
(assert (= cross_role_conditions_for_other_business false))
(assert (= other_business_cross_role_allowed false))
(assert (= cross_role_conditions_for_investment_analysis false))
(assert (= investment_analysis_cross_role_allowed false))
(assert (= prohibition_of_cross_role_for_certain_staff false))
(assert (= meets_special_conditions_for_cross_role false))
(assert (= investment_analysis_and_trading_decision_cross_role false))
(assert (= prohibition_of_investment_in_other_advisors false))
(assert (= invests_in_other_advisors false))
(assert (= concurrent_director_or_manager_in_other_advisors false))
(assert (= agent_has_equivalent_qualification false))
(assert (= agent_does_not_violate_article_7 false))
(assert (= agency_record_book_established false))
(assert (= agent_qualification_and_record false))
(assert (= duty_of_care_and_fidelity_performed false))
(assert (= duty_of_care_and_fidelity false))
(assert (= fraudulent_contract false))
(assert (= coercion_contract false))
(assert (= improper_contract false))
(assert (= unauthorized_agent_trading false))
(assert (= profit_loss_sharing_with_client false))
(assert (= trading_same_securities_as_client false))
(assert (= false_misleading_behavior false))
(assert (= loan_or_borrowing_with_client false))
(assert (= misappropriation_of_client_assets false))
(assert (= unauthorized_disclosure_of_client_info false))
(assert (= allow_others_use_of_name true))
(assert (= unreasonable_recommendations false))
(assert (= unreasonable_public_predictions false))
(assert (= superstition_based_investment_advice false))
(assert (= inciting_breach_of_contract false))
(assert (= unlicensed_commission_payment false))
(assert (= use_of_alias false))
(assert (= investment_advisory_as_gift false))
(assert (= business_at_unregistered_place false))
(assert (= other_illegal_acts false))
(assert (= internal_organization_structure_defined false))
(assert (= reporting_system_defined false))
(assert (= authority_and_responsibility_defined false))
(assert (= manager_appointed false))
(assert (= internal_control_executed false))
(assert (= internal_control_reviewed_regularly false))
(assert (= internal_control_system_design_and_execution false))
(assert (= violated_law_or_order true))
(assert (= violation_of_law_or_order true))
(assert (= additional_departments_setup false))
(assert (= investment_research_department_established false))
(assert (= financial_accounting_department_established false))
(assert (= penalty false))
(assert (= prohibited_behaviors false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 78
; Total facts: 78
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
