; SMT2 file generated from compliance case automatic
; Case ID: case_28
; Generated at: 2025-10-19T05:47:30.177918
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
(declare-const beneficiary_meets_short_swing_standard Bool)
(declare-const board_approval_obtained Bool)
(declare-const business_operated_according_articles Bool)
(declare-const business_operated_according_internal_control Bool)
(declare-const business_operated_according_law Bool)
(declare-const buyback_fee_deducted Bool)
(declare-const buyback_fee_included_in_fund_assets Bool)
(declare-const complete_transaction_records_kept Bool)
(declare-const customer_knowledge_assessed Bool)
(declare-const fail_to_centralize_clearing Bool)
(declare-const fail_to_make_or_keep_documents Bool)
(declare-const fail_to_submit_documents_or_reports Bool)
(declare-const financial_status_assessed Bool)
(declare-const first_time_customer_identity_verified Bool)
(declare-const futures_broker_violate_79th_article Bool)
(declare-const futures_clearing_violate_55th_article Bool)
(declare-const futures_service_violate_88th_article Bool)
(declare-const identity_document_provided Bool)
(declare-const internal_control_aml Bool)
(declare-const internal_control_board_approval Bool)
(declare-const internal_control_change_within_deadline Bool)
(declare-const internal_control_changed_within_deadline Bool)
(declare-const internal_control_complies_with_regulations Bool)
(declare-const internal_control_defined_by_authority Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_includes_required_items Bool)
(declare-const internal_control_legal_compliance Bool)
(declare-const internal_control_operated_according_law Bool)
(declare-const internal_control_sales_behavior Bool)
(declare-const internal_control_set_or_changed Bool)
(declare-const internal_control_short_swing_prevention Bool)
(declare-const internal_control_understand_customers Bool)
(declare-const investment_experience_assessed Bool)
(declare-const investment_knowledge_assessed Bool)
(declare-const large_amount_threshold Real)
(declare-const large_or_suspicious_transactions_recorded_and_aml_complied Bool)
(declare-const leverage_trader_violate_81st_article Bool)
(declare-const obstruct_investigation Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_conditions Bool)
(declare-const record_kept_for_reference Bool)
(declare-const redemption_handled_according_contract Bool)
(declare-const redemption_handled_according_procedures Bool)
(declare-const redemption_handled_according_prospectus Bool)
(declare-const risk_tolerance_assessed Bool)
(declare-const short_swing_trading_fee_deducted_and_included_in_assets Bool)
(declare-const subscription_handled_according_contract Bool)
(declare-const subscription_handled_according_procedures Bool)
(declare-const subscription_handled_according_prospectus Bool)
(declare-const subscription_redemption_procedures_followed Bool)
(declare-const transaction_amount Real)
(declare-const transaction_suspected_money_laundering Bool)
(declare-const violate_law Bool)
(declare-const violate_orders Bool)
(declare-const violate_specified_articles Bool)
(declare-const violate_specified_orders Bool)
(declare-const violation_penalty_applicable Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [futures_trust:internal_control_established] 期貨信託事業已依主管機關及相關機構規定訂定內部控制制度
(assert (= internal_control_established
   (and internal_control_defined_by_authority
        internal_control_complies_with_regulations)))

; [futures_trust:internal_control_operated_according_law] 期貨信託事業業務經營依照法令、章程及內部控制制度
(assert (= internal_control_operated_according_law
   (and business_operated_according_law
        business_operated_according_articles
        business_operated_according_internal_control)))

; [futures_trust:internal_control_board_approval] 內部控制制度訂定或變更經董事會同意並留存備查
(assert (= internal_control_board_approval
   (and internal_control_set_or_changed
        board_approval_obtained
        record_kept_for_reference)))

; [futures_trust:internal_control_change_within_deadline] 主管機關或指定機構通知變更內部控制制度，於限期內完成變更
(assert (= internal_control_change_within_deadline
   (or internal_control_changed_within_deadline
       (not authority_or_designated_institution_notified_change))))

; [futures_trust:customer_knowledge_assessed] 充分知悉並評估客戶投資知識、經驗、財務狀況及承受風險程度
(assert (= customer_knowledge_assessed
   (and investment_knowledge_assessed
        investment_experience_assessed
        financial_status_assessed
        risk_tolerance_assessed)))

; [futures_trust:first_time_customer_identity_verified] 首次申購客戶提出身分證明或法人登記證明並填具基本資料
(assert (= first_time_customer_identity_verified
   (and identity_document_provided basic_information_filled)))

; [futures_trust:subscription_redemption_procedures_followed] 受理期貨信託基金申購、買回依契約、公開說明書及作業程序辦理
(assert (= subscription_redemption_procedures_followed
   (and subscription_handled_according_contract
        redemption_handled_according_contract
        subscription_handled_according_prospectus
        redemption_handled_according_prospectus
        subscription_handled_according_procedures
        redemption_handled_according_procedures)))

; [futures_trust:large_or_suspicious_transactions_recorded_and_aml_complied] 一定金額以上或疑似洗錢基金交易留存完整紀錄並依洗錢防制法辦理
(assert (let ((a!1 (or (not (or transaction_suspected_money_laundering
                        (>= transaction_amount large_amount_threshold)))
               (and complete_transaction_records_kept aml_regulations_complied))))
  (= large_or_suspicious_transactions_recorded_and_aml_complied a!1)))

; [futures_trust:short_swing_trading_fee_deducted_and_included_in_assets] 對符合短線交易標準受益人扣除買回費用，費用歸入基金資產
(assert (= short_swing_trading_fee_deducted_and_included_in_assets
   (or (not beneficiary_meets_short_swing_standard)
       (and buyback_fee_deducted buyback_fee_included_in_fund_assets))))

; [futures_trust:internal_control_includes_required_items] 內部控制制度包括充分瞭解客戶、銷售行為、短線交易防制、洗錢防制及法令遵循作業原則
(assert (= internal_control_includes_required_items
   (and internal_control_understand_customers
        internal_control_sales_behavior
        internal_control_short_swing_prevention
        internal_control_aml
        internal_control_legal_compliance)))

; [futures_trading:violation_penalty_applicable] 期貨交易所、期貨結算機構、期貨業違反本法或命令時應受處分
(assert (= violation_penalty_applicable (or violate_law violate_orders)))

; [futures_trading:penalty_fine_conditions] 違反期貨交易法第119條規定之罰鍰條件
(assert (= penalty_fine_conditions
   (or fail_to_submit_documents_or_reports
       futures_service_violate_88th_article
       futures_broker_violate_79th_article
       fail_to_centralize_clearing
       violate_specified_articles
       futures_clearing_violate_55th_article
       violate_specified_orders
       leverage_trader_violate_81st_article
       fail_to_make_or_keep_documents
       obstruct_investigation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反期貨交易法或相關命令規定時處罰
(assert (= penalty
   (or (not internal_control_established)
       (not internal_control_board_approval)
       violation_penalty_applicable
       (not first_time_customer_identity_verified)
       (not subscription_redemption_procedures_followed)
       (not internal_control_includes_required_items)
       penalty_fine_conditions
       (not customer_knowledge_assessed)
       (not internal_control_change_within_deadline)
       (not short_swing_trading_fee_deducted_and_included_in_assets)
       (not large_or_suspicious_transactions_recorded_and_aml_complied)
       (not internal_control_operated_according_law))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_defined_by_authority true))
(assert (= internal_control_complies_with_regulations false))
(assert (= internal_control_set_or_changed true))
(assert (= board_approval_obtained true))
(assert (= record_kept_for_reference true))
(assert (= authority_or_designated_institution_notified_change false))
(assert (= internal_control_changed_within_deadline true))
(assert (= investment_knowledge_assessed false))
(assert (= investment_experience_assessed false))
(assert (= financial_status_assessed false))
(assert (= risk_tolerance_assessed false))
(assert (= customer_knowledge_assessed false))
(assert (= identity_document_provided true))
(assert (= basic_information_filled true))
(assert (= first_time_customer_identity_verified true))
(assert (= subscription_handled_according_contract false))
(assert (= redemption_handled_according_contract true))
(assert (= subscription_handled_according_prospectus true))
(assert (= redemption_handled_according_prospectus true))
(assert (= subscription_handled_according_procedures false))
(assert (= redemption_handled_according_procedures true))
(assert (= subscription_redemption_procedures_followed false))
(assert (= transaction_amount 0.0))
(assert (= transaction_suspected_money_laundering false))
(assert (= complete_transaction_records_kept true))
(assert (= aml_regulations_complied true))
(assert (= large_or_suspicious_transactions_recorded_and_aml_complied true))
(assert (= beneficiary_meets_short_swing_standard false))
(assert (= buyback_fee_deducted true))
(assert (= buyback_fee_included_in_fund_assets true))
(assert (= short_swing_trading_fee_deducted_and_included_in_assets true))
(assert (= internal_control_understand_customers false))
(assert (= internal_control_sales_behavior false))
(assert (= internal_control_short_swing_prevention true))
(assert (= internal_control_aml true))
(assert (= internal_control_legal_compliance true))
(assert (= internal_control_includes_required_items false))
(assert (= business_operated_according_law false))
(assert (= business_operated_according_articles true))
(assert (= business_operated_according_internal_control false))
(assert (= internal_control_operated_according_law false))
(assert (= violate_law true))
(assert (= violate_orders true))
(assert (= violation_penalty_applicable true))
(assert (= violate_specified_articles true))
(assert (= violate_specified_orders false))
(assert (= fail_to_centralize_clearing false))
(assert (= futures_clearing_violate_55th_article false))
(assert (= futures_broker_violate_79th_article false))
(assert (= leverage_trader_violate_81st_article false))
(assert (= futures_service_violate_88th_article false))
(assert (= fail_to_submit_documents_or_reports false))
(assert (= fail_to_make_or_keep_documents false))
(assert (= obstruct_investigation false))
(assert (= penalty_fine_conditions true))
(assert (= internal_control_board_approval false))
(assert (= internal_control_change_within_deadline false))
(assert (= internal_control_established false))
(assert (= large_amount_threshold 0.0))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 60
; Total facts: 60
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
