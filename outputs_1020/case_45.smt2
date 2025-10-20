; SMT2 file generated from compliance case automatic
; Case ID: case_45
; Generated at: 2025-10-19T06:28:54.535322
;
; This file can be executed with Z3:
;   z3 case_45.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authority_impose_penalty_66 Bool)
(declare-const authority_order_correction_or_improvement Bool)
(declare-const authority_order_stop_or_dismiss Bool)
(declare-const behavior_10_fraud_or_mislead Bool)
(declare-const behavior_11_misuse_client_assets Bool)
(declare-const behavior_12_unauthorized_client Bool)
(declare-const behavior_13_not_follow_client_order Bool)
(declare-const behavior_14_induce_buy_sell Bool)
(declare-const behavior_15_recommend_stock Bool)
(declare-const behavior_16_offset_trades Bool)
(declare-const behavior_17_agent_open_account Bool)
(declare-const behavior_18_employee_agent_open_account Bool)
(declare-const behavior_19_non_self_account Bool)
(declare-const behavior_1_speculation Bool)
(declare-const behavior_20_non_authorized_agent Bool)
(declare-const behavior_21_insider_trading Bool)
(declare-const behavior_22_undue_benefit Bool)
(declare-const behavior_23_illegal_promotion Bool)
(declare-const behavior_24_other_illegal Bool)
(declare-const behavior_2_leak_secret Bool)
(declare-const behavior_3_full_delegation Bool)
(declare-const behavior_4_profit_guarantee Bool)
(declare-const behavior_5_share_loss Bool)
(declare-const behavior_6_self_trade Bool)
(declare-const behavior_7_use_client_account Bool)
(declare-const behavior_8_use_others_name Bool)
(declare-const behavior_9_loan_or_mediation Bool)
(declare-const honesty_and_credit_followed Bool)
(declare-const honesty_and_credit_principle Bool)
(declare-const improvement_completed Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_updated Bool)
(declare-const internal_control_updated_within_deadline Bool)
(declare-const non_compliance_detected Bool)
(declare-const non_compliance_found Bool)
(declare-const not_execute_internal_control Bool)
(declare-const not_prepare_or_report_documents Bool)
(declare-const not_submit_documents Bool)
(declare-const obstruct_inspection Bool)
(declare-const order_correction Bool)
(declare-const order_dismiss_officer Bool)
(declare-const order_improvement_deadline Int)
(declare-const order_stop_business_within_1_year Bool)
(declare-const penalty Bool)
(declare-const penalty_178_1_mild_exemption Bool)
(declare-const penalty_178_1_violation Bool)
(declare-const penalty_66_imposed Bool)
(declare-const prohibited_behaviors Bool)
(declare-const violate_article_141 Bool)
(declare-const violate_article_141_apply Bool)
(declare-const violate_article_144 Bool)
(declare-const violate_article_144_apply Bool)
(declare-const violate_article_145_2 Bool)
(declare-const violate_article_145_2_apply Bool)
(declare-const violate_article_147 Bool)
(declare-const violate_article_147_apply Bool)
(declare-const violate_article_14_1_1_3 Bool)
(declare-const violate_article_14_3 Bool)
(declare-const violate_article_152 Bool)
(declare-const violate_article_159 Bool)
(declare-const violate_article_165_1 Bool)
(declare-const violate_article_165_2 Bool)
(declare-const violate_article_21_1_5 Bool)
(declare-const violate_article_58 Bool)
(declare-const violate_article_61 Bool)
(declare-const violate_article_69_1 Bool)
(declare-const violate_article_79 Bool)
(declare-const violate_finance_business_management_rules Bool)
(declare-const violate_other_finance_business_management_rules Bool)
(declare-const violate_sec_center_rules Bool)
(declare-const violate_sec_exchange_rules Bool)
(declare-const violate_sec_trade_association_rules Bool)
(declare-const violation_and_penalty_applied Bool)
(declare-const violation_and_penalty_measures Bool)
(declare-const violation_mild Bool)
(declare-const violation_occurred Bool)
(declare-const violation_of_law Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_of_law] 證券商董事、監察人及受僱人違反證券交易法或相關法令，影響業務正常執行
(assert (= violation_of_law violation_occurred))

; [securities:authority_order_stop_or_dismiss] 主管機關命令停止一年以下業務或解除職務
(assert (= authority_order_stop_or_dismiss
   (or order_stop_business_within_1_year order_dismiss_officer)))

; [securities:authority_impose_penalty_66] 主管機關依第66條視情節輕重對證券商處分
(assert (= authority_impose_penalty_66 penalty_66_imposed))

; [securities:non_compliance_found] 主管機關調查發現證券商有不符合規定事項
(assert (= non_compliance_found non_compliance_detected))

; [securities:authority_order_correction_or_improvement] 主管機關命令糾正或限期改善
(assert (= authority_order_correction_or_improvement
   (or order_correction (= order_improvement_deadline 1))))

; [securities:violation_and_penalty_measures] 證券商違反法令或命令，主管機關得處分並命限期改善
(assert (= violation_and_penalty_measures violation_and_penalty_applied))

; [securities:penalty_178_1_violation] 違反證券交易法第178-1條規定之行為
(assert (= penalty_178_1_violation
   (or violate_sec_trade_association_rules
       violate_article_61
       violate_article_145_2_apply
       violate_article_21_1_5
       violate_article_141_apply
       violate_article_145_2
       violate_article_159
       violate_finance_business_management_rules
       violate_article_165_2
       violate_article_147_apply
       violate_article_144
       violate_article_14_3
       violate_article_147
       violate_article_79
       not_submit_documents
       violate_article_58
       violate_article_165_1
       violate_article_152
       not_execute_internal_control
       not_prepare_or_report_documents
       violate_article_14_1_1_3
       violate_article_144_apply
       violate_sec_center_rules
       violate_article_141
       violate_other_finance_business_management_rules
       obstruct_inspection
       violate_article_69_1
       violate_sec_exchange_rules)))

; [securities:penalty_178_1_mild_exemption] 違反178-1條情節輕微且已改善免罰
(assert (= penalty_178_1_mild_exemption
   (and penalty_178_1_violation (or improvement_completed violation_mild))))

; [securities:internal_control_established] 證券商依規定建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_executed] 證券商確實執行內部控制制度
(assert (= internal_control_executed internal_control_system_executed))

; [securities:internal_control_compliance] 證券商內部控制制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [securities:internal_control_updated] 內部控制制度變更已於限期內完成
(assert (= internal_control_updated internal_control_updated_within_deadline))

; [securities:honesty_and_credit_principle] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= honesty_and_credit_principle honesty_and_credit_followed))

; [securities:prohibited_behaviors] 證券商負責人及業務人員不得有違反證券交易法及相關規定之行為
(assert (not (= (or behavior_18_employee_agent_open_account
            behavior_11_misuse_client_assets
            behavior_6_self_trade
            behavior_1_speculation
            behavior_4_profit_guarantee
            behavior_7_use_client_account
            behavior_23_illegal_promotion
            behavior_15_recommend_stock
            behavior_2_leak_secret
            behavior_9_loan_or_mediation
            behavior_17_agent_open_account
            behavior_14_induce_buy_sell
            behavior_19_non_self_account
            behavior_3_full_delegation
            behavior_8_use_others_name
            behavior_12_unauthorized_client
            behavior_5_share_loss
            behavior_10_fraud_or_mislead
            behavior_22_undue_benefit
            behavior_24_other_illegal
            behavior_16_offset_trades
            behavior_20_non_authorized_agent
            behavior_13_not_follow_client_order
            behavior_21_insider_trading)
        prohibited_behaviors)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法相關規定或內部控制制度未建立或未執行，或負責人及業務人員有禁止行為時處罰
(assert (= penalty
   (or (not internal_control_compliance)
       (not prohibited_behaviors)
       (not violation_of_law)
       (and penalty_178_1_violation (not penalty_178_1_mild_exemption)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_occurred true))
(assert (= violation_of_law true))
(assert (= non_compliance_detected true))
(assert (= non_compliance_found true))
(assert (= order_correction true))
(assert (= order_improvement_deadline true))
(assert (= authority_order_correction_or_improvement true))
(assert (= penalty_66_imposed true))
(assert (= authority_impose_penalty_66 true))
(assert (= violation_and_penalty_applied true))
(assert (= violation_and_penalty_measures true))
(assert (= penalty_178_1_violation true))
(assert (= penalty_178_1_mild_exemption false))
(assert (= penalty true))
(assert (= authority_order_stop_or_dismiss true))
(assert (= order_stop_business_within_1_year true))
(assert (= order_dismiss_officer false))
(assert (= honesty_and_credit_followed false))
(assert (= honesty_and_credit_principle false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= internal_control_updated_within_deadline false))
(assert (= internal_control_updated false))
(assert (= not_submit_documents false))
(assert (= not_prepare_or_report_documents false))
(assert (= obstruct_inspection false))
(assert (= behavior_1_speculation false))
(assert (= behavior_2_leak_secret false))
(assert (= behavior_3_full_delegation false))
(assert (= behavior_4_profit_guarantee false))
(assert (= behavior_5_share_loss false))
(assert (= behavior_6_self_trade false))
(assert (= behavior_7_use_client_account false))
(assert (= behavior_8_use_others_name false))
(assert (= behavior_9_loan_or_mediation false))
(assert (= behavior_10_fraud_or_mislead false))
(assert (= behavior_11_misuse_client_assets false))
(assert (= behavior_12_unauthorized_client false))
(assert (= behavior_13_not_follow_client_order false))
(assert (= behavior_14_induce_buy_sell false))
(assert (= behavior_15_recommend_stock false))
(assert (= behavior_16_offset_trades false))
(assert (= behavior_17_agent_open_account false))
(assert (= behavior_18_employee_agent_open_account false))
(assert (= behavior_19_non_self_account false))
(assert (= behavior_20_non_authorized_agent false))
(assert (= behavior_21_insider_trading false))
(assert (= behavior_22_undue_benefit false))
(assert (= behavior_23_illegal_promotion false))
(assert (= behavior_24_other_illegal false))
(assert (= prohibited_behaviors true))
(assert (= violate_article_14_3 false))
(assert (= violate_article_14_1_1_3 false))
(assert (= violate_article_21_1_5 false))
(assert (= violate_article_58 false))
(assert (= violate_article_61 false))
(assert (= violate_article_69_1 false))
(assert (= violate_article_79 false))
(assert (= violate_article_141 false))
(assert (= violate_article_141_apply false))
(assert (= violate_article_144 false))
(assert (= violate_article_144_apply false))
(assert (= violate_article_145_2 false))
(assert (= violate_article_145_2_apply false))
(assert (= violate_article_147 false))
(assert (= violate_article_147_apply false))
(assert (= violate_article_152 false))
(assert (= violate_article_159 false))
(assert (= violate_article_165_1 false))
(assert (= violate_article_165_2 false))
(assert (= violate_finance_business_management_rules true))
(assert (= violate_other_finance_business_management_rules false))
(assert (= violate_sec_center_rules false))
(assert (= violate_sec_trade_association_rules false))
(assert (= violate_sec_exchange_rules false))
(assert (= violation_mild false))
(assert (= improvement_completed false))
(assert (= not_execute_internal_control false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 81
; Total facts: 81
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
