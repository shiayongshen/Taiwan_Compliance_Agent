; SMT2 file generated from compliance case automatic
; Case ID: case_28
; Generated at: 2025-10-20T23:24:24.900397
;
; This file can be executed with Z3:
;   z3 case_28.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const aml_regulations_complied Bool)
(declare-const authority_or_designated_institution_notified_change Bool)
(declare-const basic_information_filled Bool)
(declare-const business_operates_according_to_articles Bool)
(declare-const business_operates_according_to_internal_control Bool)
(declare-const business_operates_according_to_laws Bool)
(declare-const business_suspension_ordered Bool)
(declare-const corrective_action_taken Bool)
(declare-const customer_financial_status_assessed Bool)
(declare-const customer_investment_experience_assessed Bool)
(declare-const customer_investment_knowledge_assessed Bool)
(declare-const customer_knowledge_assessed Bool)
(declare-const customer_risk_tolerance_assessed Bool)
(declare-const fail_to_attend_inquiry_without_reason Bool)
(declare-const fail_to_provide_required_documents Bool)
(declare-const fail_to_submit_documents_or_reports Bool)
(declare-const first_time_customer_identity_verified Bool)
(declare-const identity_document_submitted Bool)
(declare-const internal_control_aml_compliance Bool)
(declare-const internal_control_change_approved Bool)
(declare-const internal_control_change_board_approved Bool)
(declare-const internal_control_change_completed_within_deadline Bool)
(declare-const internal_control_change_recorded Bool)
(declare-const internal_control_change_reported_to_board Bool)
(declare-const internal_control_change_updated_on_notice Bool)
(declare-const internal_control_complies_with_regulations Bool)
(declare-const internal_control_custody_compliance Bool)
(declare-const internal_control_defined_by_authority Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_legal_compliance Bool)
(declare-const internal_control_operation_compliance Bool)
(declare-const internal_control_sales_compliance Bool)
(declare-const internal_control_short_swing_prevention Bool)
(declare-const internal_control_system_comprehensive Bool)
(declare-const large_or_suspicious_transaction_recorded Bool)
(declare-const large_or_suspicious_transactions_recorded_and_aml_complied Bool)
(declare-const license_revoked Bool)
(declare-const obstruct_or_refuse_inspection Bool)
(declare-const other_measures_taken Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_conditions Bool)
(declare-const penalty_measures Bool)
(declare-const personnel_replaced Bool)
(declare-const short_swing_trading_fee_deducted Bool)
(declare-const short_swing_trading_fee_deducted_and_included_in_assets Bool)
(declare-const short_swing_trading_fee_included_in_assets Bool)
(declare-const short_swing_trading_identified Bool)
(declare-const subscription_redemption_follow_contract Bool)
(declare-const subscription_redemption_follow_industry_procedures Bool)
(declare-const subscription_redemption_follow_prospectus Bool)
(declare-const subscription_redemption_procedures_complied Bool)
(declare-const violate_law Bool)
(declare-const violate_order Bool)
(declare-const violate_specified_articles_or_orders Bool)
(declare-const violation_penalty_applicable Bool)
(declare-const warning_issued Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [futures_trust:internal_control_established] 期貨信託事業依主管機關及相關機構規定訂定內部控制制度
(assert (= internal_control_established
   (and internal_control_defined_by_authority
        internal_control_complies_with_regulations)))

; [futures_trust:internal_control_operation_compliance] 期貨信託事業業務經營依照法令、章程及內部控制制度
(assert (= internal_control_operation_compliance
   (and business_operates_according_to_laws
        business_operates_according_to_articles
        business_operates_according_to_internal_control)))

; [futures_trust:internal_control_change_approved] 內部控制制度訂定或變更經董事會同意並留存備查
(assert (= internal_control_change_approved
   (and internal_control_change_reported_to_board
        internal_control_change_board_approved
        internal_control_change_recorded)))

; [futures_trust:internal_control_change_updated_on_notice] 主管機關或指定機構通知變更時，於限期內完成變更
(assert (= internal_control_change_updated_on_notice
   (or (not authority_or_designated_institution_notified_change)
       internal_control_change_completed_within_deadline)))

; [futures_trust:customer_knowledge_assessed] 充分知悉並評估客戶投資知識、經驗、財務狀況及承受風險程度
(assert (= customer_knowledge_assessed
   (and customer_investment_knowledge_assessed
        customer_investment_experience_assessed
        customer_financial_status_assessed
        customer_risk_tolerance_assessed)))

; [futures_trust:first_time_customer_identity_verified] 首次申購客戶提出身分證明或法人登記證明並填具基本資料
(assert (= first_time_customer_identity_verified
   (and identity_document_submitted basic_information_filled)))

; [futures_trust:subscription_redemption_procedures_complied] 受理申購、買回依契約、公開說明書及作業程序辦理
(assert (= subscription_redemption_procedures_complied
   (and subscription_redemption_follow_contract
        subscription_redemption_follow_prospectus
        subscription_redemption_follow_industry_procedures)))

; [futures_trust:large_or_suspicious_transactions_recorded_and_aml_complied] 一定金額以上或疑似洗錢交易留存完整紀錄並依洗錢防制法辦理
(assert (= large_or_suspicious_transactions_recorded_and_aml_complied
   (and large_or_suspicious_transaction_recorded aml_regulations_complied)))

; [futures_trust:short_swing_trading_fee_deducted_and_included_in_assets] 短線交易買回費用扣除並歸入基金資產
(assert (= short_swing_trading_fee_deducted_and_included_in_assets
   (and short_swing_trading_identified
        short_swing_trading_fee_deducted
        short_swing_trading_fee_included_in_assets)))

; [futures_trust:internal_control_system_comprehensive] 內部控制制度包括充分瞭解客戶、銷售行為、短線交易防制、洗錢防制及法令遵循作業原則
(assert (= internal_control_system_comprehensive
   (and internal_control_custody_compliance
        internal_control_sales_compliance
        internal_control_short_swing_prevention
        internal_control_aml_compliance
        internal_control_legal_compliance)))

; [futures_trade:violation_penalty_applicable] 期貨交易所、期貨結算機構、期貨業違反本法或命令時應受處分
(assert (= violation_penalty_applicable (or violate_law violate_order)))

; [futures_trade:penalty_measures] 主管機關得予以糾正、警告、撤換人員、停止營業、撤銷許可或其他處置
(assert (= penalty_measures
   (or corrective_action_taken
       business_suspension_ordered
       other_measures_taken
       license_revoked
       personnel_replaced
       warning_issued)))

; [futures_trade:penalty_fine_conditions] 違反指定條文或命令者處新臺幣十二萬元以上二百四十萬元以下罰鍰，屆期未改善得按次處罰
(assert (= penalty_fine_conditions
   (or obstruct_or_refuse_inspection
       fail_to_submit_documents_or_reports
       violate_specified_articles_or_orders
       fail_to_provide_required_documents
       fail_to_attend_inquiry_without_reason)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反期貨交易法相關規定或命令時處罰
(assert (= penalty (or penalty_fine_conditions violation_penalty_applicable)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_defined_by_authority true))
(assert (= internal_control_complies_with_regulations true))
(assert (= internal_control_established false))
(assert (= business_operates_according_to_laws false))
(assert (= business_operates_according_to_articles true))
(assert (= business_operates_according_to_internal_control false))
(assert (= customer_investment_knowledge_assessed false))
(assert (= customer_investment_experience_assessed false))
(assert (= customer_financial_status_assessed false))
(assert (= customer_risk_tolerance_assessed false))
(assert (= customer_knowledge_assessed false))
(assert (= first_time_customer_identity_verified true))
(assert (= identity_document_submitted true))
(assert (= basic_information_filled true))
(assert (= subscription_redemption_follow_contract false))
(assert (= subscription_redemption_follow_prospectus false))
(assert (= subscription_redemption_follow_industry_procedures false))
(assert (= subscription_redemption_procedures_complied false))
(assert (= violate_law true))
(assert (= violate_order true))
(assert (= violate_specified_articles_or_orders true))
(assert (= violation_penalty_applicable true))
(assert (= penalty_fine_conditions true))
(assert (= penalty true))
(assert (= warning_issued true))
(assert (= corrective_action_taken false))
(assert (= personnel_replaced false))
(assert (= business_suspension_ordered false))
(assert (= license_revoked false))
(assert (= other_measures_taken false))
(assert (= fail_to_submit_documents_or_reports false))
(assert (= obstruct_or_refuse_inspection false))
(assert (= fail_to_provide_required_documents false))
(assert (= fail_to_attend_inquiry_without_reason false))
(assert (= internal_control_change_reported_to_board false))
(assert (= internal_control_change_board_approved false))
(assert (= internal_control_change_recorded false))
(assert (= internal_control_change_approved false))
(assert (= authority_or_designated_institution_notified_change false))
(assert (= internal_control_change_completed_within_deadline false))
(assert (= internal_control_change_updated_on_notice true))
(assert (= internal_control_aml_compliance false))
(assert (= aml_regulations_complied false))
(assert (= large_or_suspicious_transaction_recorded false))
(assert (= large_or_suspicious_transactions_recorded_and_aml_complied false))
(assert (= internal_control_custody_compliance false))
(assert (= internal_control_sales_compliance false))
(assert (= internal_control_short_swing_prevention false))
(assert (= internal_control_legal_compliance false))
(assert (= internal_control_system_comprehensive false))
(assert (= short_swing_trading_identified false))
(assert (= short_swing_trading_fee_deducted false))
(assert (= short_swing_trading_fee_included_in_assets false))
(assert (= short_swing_trading_fee_deducted_and_included_in_assets false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 56
; Total facts: 54
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
