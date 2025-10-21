; SMT2 file generated from compliance case automatic
; Case ID: case_160
; Generated at: 2025-10-21T03:37:21.375768
;
; This file can be executed with Z3:
;   z3 case_160.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accept_board_supervisor_employee_open_account_or_trade_for_others Bool)
(declare-const accept_client_with_insider_info_or_market_manipulation_intent Bool)
(declare-const accept_non_self_open_account Bool)
(declare-const accept_non_self_or_unappointed_agent_trade Bool)
(declare-const accept_trading_without_contract Bool)
(declare-const agent_open_account_or_trade_for_others Bool)
(declare-const annual_audit_plan_executed Bool)
(declare-const annual_audit_plan_reported Bool)
(declare-const business_operated_according_to_articles Bool)
(declare-const business_operated_according_to_internal_control Bool)
(declare-const business_operated_according_to_law Bool)
(declare-const deficiency_severe Bool)
(declare-const dismiss_board_supervisor_manager Bool)
(declare-const dismissal_ordered Bool)
(declare-const external_financial_report_false Bool)
(declare-const fail_execute_internal_control Bool)
(declare-const fail_produce_report_or_documents Bool)
(declare-const fail_submit_documents Bool)
(declare-const fraud_or_misleading_in_underwriting_or_trading Bool)
(declare-const full_power_delegation_to_client Bool)
(declare-const honest_and_credit_followed Bool)
(declare-const honest_and_credit_principle Bool)
(declare-const illegal_disclosure_of_client_info Bool)
(declare-const improvement_completed Bool)
(declare-const induce_buy_sell_based_on_price_prediction Bool)
(declare-const internal_audit_staff_adequate Bool)
(declare-const internal_control_change_notified Bool)
(declare-const internal_control_changed_within_deadline Bool)
(declare-const internal_control_compliant Bool)
(declare-const internal_control_deficiency_improved Bool)
(declare-const internal_control_deficiency_reported Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_self_assessed Bool)
(declare-const internal_control_system_set Bool)
(declare-const internal_control_updated Bool)
(declare-const internal_control_violation_conditions Bool)
(declare-const internal_control_written Bool)
(declare-const joint_loss_profit_agreement Bool)
(declare-const loan_or_mediation_with_client Bool)
(declare-const major_fraud_occurred Bool)
(declare-const misuse_or_custody_of_client_assets Bool)
(declare-const not_follow_client_instructions Bool)
(declare-const obstruct_inspection Bool)
(declare-const offset_same_stock_buy_sell_in_same_day Bool)
(declare-const other_necessary_measures Bool)
(declare-const other_special_review_needed Bool)
(declare-const penalty Bool)
(declare-const penalty_66_disposition Bool)
(declare-const profit_guarantee_or_sharing Bool)
(declare-const prohibited_behaviors Bool)
(declare-const prohibited_behaviors_apply_to_employees Bool)
(declare-const promote_unapproved_stocks Bool)
(declare-const revoke_business_license Bool)
(declare-const self_dealing_as_counterparty Bool)
(declare-const solicit_unapproved_securities_or_derivatives Bool)
(declare-const speculation_using_insider_info Bool)
(declare-const stop_business_ordered Bool)
(declare-const stop_business_within_one_year Bool)
(declare-const suspend_business_within_6_months Bool)
(declare-const underwriting_personnel_get_improper_benefits Bool)
(declare-const use_client_account_for_trading Bool)
(declare-const use_others_or_relatives_account Bool)
(declare-const violate_finance_business_management_rules Bool)
(declare-const violate_other_finance_business_management_rules Bool)
(declare-const violate_securities_management_laws_or_regulations Bool)
(declare-const violate_specified_articles Bool)
(declare-const violation_178_1 Bool)
(declare-const violation_178_1_minor_exempt Bool)
(declare-const violation_found Bool)
(declare-const violation_minor Bool)
(declare-const violation_of_law_or_regulation Bool)
(declare-const warning_issued Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_found] 證券商董事、監察人及受僱人有違法行為影響業務正常執行
(assert (= violation_found violation_of_law_or_regulation))

; [securities:stop_business_ordered] 主管機關命令停止一年以下業務執行或解除職務
(assert (= stop_business_ordered (or dismissal_ordered stop_business_within_one_year)))

; [securities:penalty_66_disposition] 主管機關依第66條視情節輕重對證券商處分
(assert (= penalty_66_disposition
   (or revoke_business_license
       suspend_business_within_6_months
       warning_issued
       dismiss_board_supervisor_manager
       other_necessary_measures)))

; [securities:violation_178_1] 證券商或相關機構違反證券交易法第178-1條規定
(assert (= violation_178_1
   (or fail_submit_documents
       violate_other_finance_business_management_rules
       fail_execute_internal_control
       violate_finance_business_management_rules
       fail_produce_report_or_documents
       obstruct_inspection
       violate_specified_articles)))

; [securities:violation_178_1_minor_exempt] 違反第178-1條情節輕微且已改善免處罰
(assert (= violation_178_1_minor_exempt
   (and violation_178_1 violation_minor improvement_completed)))

; [securities:internal_control_established] 證券商依規定訂定內部控制制度
(assert (= internal_control_established internal_control_system_set))

; [securities:internal_control_compliant] 證券商業務依內部控制制度及法令章程經營
(assert (= internal_control_compliant
   (and business_operated_according_to_law
        business_operated_according_to_articles
        business_operated_according_to_internal_control)))

; [securities:internal_control_updated] 內部控制制度變更於限期內完成
(assert (= internal_control_updated
   (or internal_control_changed_within_deadline
       (not internal_control_change_notified))))

; [securities:honest_and_credit_principle] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= honest_and_credit_principle honest_and_credit_followed))

; [securities:prohibited_behaviors] 證券商負責人及業務人員不得有禁止行為
(assert (not (= (or use_client_account_for_trading
            accept_non_self_open_account
            promote_unapproved_stocks
            loan_or_mediation_with_client
            underwriting_personnel_get_improper_benefits
            fraud_or_misleading_in_underwriting_or_trading
            agent_open_account_or_trade_for_others
            not_follow_client_instructions
            self_dealing_as_counterparty
            profit_guarantee_or_sharing
            joint_loss_profit_agreement
            accept_board_supervisor_employee_open_account_or_trade_for_others
            offset_same_stock_buy_sell_in_same_day
            accept_trading_without_contract
            violate_securities_management_laws_or_regulations
            use_others_or_relatives_account
            induce_buy_sell_based_on_price_prediction
            accept_non_self_or_unappointed_agent_trade
            misuse_or_custody_of_client_assets
            accept_client_with_insider_info_or_market_manipulation_intent
            illegal_disclosure_of_client_info
            speculation_using_insider_info
            solicit_unapproved_securities_or_derivatives
            full_power_delegation_to_client)
        prohibited_behaviors)))

; [securities:prohibited_behaviors_apply_to_employees] 禁止行為規定適用於證券商其他受僱人
(assert (= prohibited_behaviors_apply_to_employees prohibited_behaviors))

; [securities:internal_control_violation_conditions] 主管機關得令限期改善及專案審查內部控制制度情形
(assert (= internal_control_violation_conditions
   (or major_fraud_occurred
       (not internal_control_written)
       (not annual_audit_plan_reported)
       (not annual_audit_plan_executed)
       (not internal_control_self_assessed)
       (and (not internal_control_deficiency_improved) deficiency_severe)
       (not internal_audit_staff_adequate)
       other_special_review_needed
       external_financial_report_false
       (not internal_control_deficiency_reported))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法及相關規定時處罰
(assert (= penalty
   (or (and violation_found (not stop_business_ordered))
       penalty_66_disposition
       (and violation_178_1 (not violation_178_1_minor_exempt))
       (not internal_control_established)
       (not internal_control_updated)
       internal_control_violation_conditions
       (not honest_and_credit_principle)
       (not prohibited_behaviors)
       (not internal_control_compliant))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_of_law_or_regulation true))
(assert (= violation_found true))
(assert (= warning_issued true))
(assert (= penalty_66_disposition true))
(assert (= violation_178_1 true))
(assert (= violation_178_1_minor_exempt false))
(assert (= fail_execute_internal_control true))
(assert (= violate_finance_business_management_rules true))
(assert (= internal_control_system_set false))
(assert (= internal_control_established false))
(assert (= internal_control_compliant false))
(assert (= internal_control_written false))
(assert (= internal_audit_staff_adequate false))
(assert (= annual_audit_plan_reported false))
(assert (= annual_audit_plan_executed false))
(assert (= internal_control_deficiency_reported false))
(assert (= internal_control_self_assessed false))
(assert (= internal_control_deficiency_improved false))
(assert (= deficiency_severe true))
(assert (= external_financial_report_false false))
(assert (= major_fraud_occurred false))
(assert (= other_special_review_needed true))
(assert (= other_necessary_measures true))
(assert (= stop_business_within_one_year true))
(assert (= stop_business_ordered true))
(assert (= dismissal_ordered false))
(assert (= dismiss_board_supervisor_manager false))
(assert (= suspend_business_within_6_months false))
(assert (= revoke_business_license false))
(assert (= honest_and_credit_followed false))
(assert (= honest_and_credit_principle false))
(assert (= prohibited_behaviors false))
(assert (= prohibited_behaviors_apply_to_employees false))
(assert (= speculation_using_insider_info false))
(assert (= illegal_disclosure_of_client_info false))
(assert (= full_power_delegation_to_client false))
(assert (= profit_guarantee_or_sharing false))
(assert (= joint_loss_profit_agreement false))
(assert (= self_dealing_as_counterparty false))
(assert (= use_client_account_for_trading false))
(assert (= use_others_or_relatives_account false))
(assert (= loan_or_mediation_with_client false))
(assert (= fraud_or_misleading_in_underwriting_or_trading false))
(assert (= misuse_or_custody_of_client_assets false))
(assert (= accept_trading_without_contract false))
(assert (= not_follow_client_instructions false))
(assert (= induce_buy_sell_based_on_price_prediction false))
(assert (= promote_unapproved_stocks false))
(assert (= offset_same_stock_buy_sell_in_same_day false))
(assert (= agent_open_account_or_trade_for_others false))
(assert (= accept_board_supervisor_employee_open_account_or_trade_for_others false))
(assert (= accept_non_self_open_account false))
(assert (= accept_non_self_or_unappointed_agent_trade false))
(assert (= accept_client_with_insider_info_or_market_manipulation_intent false))
(assert (= underwriting_personnel_get_improper_benefits false))
(assert (= solicit_unapproved_securities_or_derivatives false))
(assert (= violate_securities_management_laws_or_regulations true))
(assert (= fail_submit_documents false))
(assert (= obstruct_inspection false))
(assert (= fail_produce_report_or_documents false))
(assert (= internal_control_change_notified false))
(assert (= internal_control_changed_within_deadline false))
(assert (= improvement_completed false))
(assert (= violation_minor false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 72
; Total facts: 65
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
