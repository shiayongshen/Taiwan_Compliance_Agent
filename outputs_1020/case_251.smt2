; SMT2 file generated from compliance case automatic
; Case ID: case_251
; Generated at: 2025-10-19T11:23:51.835231
;
; This file can be executed with Z3:
;   z3 case_251.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advisory_service_as_gift Bool)
(declare-const agency_securities_investment Bool)
(declare-const allow_others_use_name Bool)
(declare-const analysis_report_and_records_saved Bool)
(declare-const analysis_report_created Bool)
(declare-const analysis_report_saved_5_years Bool)
(declare-const business_conduct_good_faith Bool)
(declare-const buy_sell_same_securities Bool)
(declare-const client_assessment_completed Bool)
(declare-const client_assessment_done Bool)
(declare-const client_data_confidentiality Bool)
(declare-const client_data_kept_confidential Bool)
(declare-const conflict_of_interest Bool)
(declare-const contract_client_7day_termination_right Bool)
(declare-const contract_confidentiality_obligation Bool)
(declare-const contract_dispute_resolution_jurisdiction Bool)
(declare-const contract_effective_date_duration Int)
(declare-const contract_fee_amount_payment_method Bool)
(declare-const contract_fee_refund_ratio_method Bool)
(declare-const contract_mandatory_items Bool)
(declare-const contract_modification_termination Bool)
(declare-const contract_no_client_fund_receipt_or_profit_loss_sharing Bool)
(declare-const contract_no_leak_without_consent Bool)
(declare-const contract_other_mandatory_items Bool)
(declare-const contract_party_name_address Bool)
(declare-const contract_records_saved_5_years Bool)
(declare-const contract_rights_obligations_liabilities Bool)
(declare-const contract_rights_obligations_records_saved Bool)
(declare-const contract_scope_of_advice Bool)
(declare-const contract_service_method Bool)
(declare-const contract_termination_fee_limit Real)
(declare-const contract_written_and_signed Bool)
(declare-const custody_or_misappropriation Bool)
(declare-const dedicated Bool)
(declare-const false_misleading_behavior Bool)
(declare-const fraud_coercion_contract Bool)
(declare-const good_faith_and_loyalty_observed Bool)
(declare-const has_article_68_violation Bool)
(declare-const illegal_disclosure_of_client_info Bool)
(declare-const incite_refusal_of_settlement Bool)
(declare-const internal_management_rules_established_and_executed Bool)
(declare-const internal_personnel_management Bool)
(declare-const investment_analysis_report_made Bool)
(declare-const loan_or_intermediation Bool)
(declare-const manager_executive_dedicated Bool)
(declare-const manager_executive_registered Bool)
(declare-const manager_executive_registration_allowed Bool)
(declare-const media_investment_analysis_record_saved Bool)
(declare-const media_record_saved_1_year Bool)
(declare-const no_damage_or_penalty_claimed Bool)
(declare-const non_employee_program_host Bool)
(declare-const other_violations Bool)
(declare-const penalty Bool)
(declare-const profit_and_expense_sharing_agreement Bool)
(declare-const profit_loss_sharing_agreement Bool)
(declare-const prohibited_acts Bool)
(declare-const qualification_not_met Bool)
(declare-const registered_with_association Bool)
(declare-const superstition_based_advice Bool)
(declare-const unapproved_public_prediction Bool)
(declare-const unlicensed_commission_payment Bool)
(declare-const unreasonable_advice Bool)
(declare-const unregistered_business_location Bool)
(declare-const unregistered_name_activity Bool)
(declare-const violates_article_7 Bool)
(declare-const written_contract_made Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities_advisory:manager_executive_dedicated] 證券投資顧問事業總經理、部門主管、分支機構經理人及業務人員應為專任
(assert (= manager_executive_dedicated dedicated))

; [securities_advisory:manager_executive_registered] 證券投資顧問事業總經理、部門主管、分支機構經理人及業務人員應向同業公會登錄
(assert (= manager_executive_registered registered_with_association))

; [securities_advisory:manager_executive_registration_allowed] 有下列情事之一者，不得登錄或已登錄者應撤銷
(assert (not (= (or has_article_68_violation qualification_not_met violates_article_7)
        manager_executive_registration_allowed)))

; [securities_advisory:client_assessment_done] 證券投資顧問事業應充分知悉並評估客戶投資知識、經驗、財務狀況及承受風險程度
(assert (= client_assessment_done client_assessment_completed))

; [securities_advisory:written_contract_made] 證券投資顧問事業提供分析意見或推介建議時，應訂定書面證券投資顧問契約
(assert (= written_contract_made contract_written_and_signed))

; [securities_advisory:contract_mandatory_items] 證券投資顧問契約應載明法定十四項事項
(assert (= contract_mandatory_items
   (and contract_party_name_address
        contract_rights_obligations_liabilities
        contract_scope_of_advice
        contract_service_method
        contract_fee_amount_payment_method
        contract_confidentiality_obligation
        contract_no_leak_without_consent
        contract_no_client_fund_receipt_or_profit_loss_sharing
        contract_modification_termination
        (= contract_effective_date_duration 1)
        contract_client_7day_termination_right
        contract_fee_refund_ratio_method
        contract_dispute_resolution_jurisdiction
        contract_other_mandatory_items)))

; [securities_advisory:contract_termination_fee_limit] 契約終止時得請求終止前所提供服務之相當報酬，但不得請求損害賠償或違約金
(assert (= contract_termination_fee_limit (ite no_damage_or_penalty_claimed 1.0 0.0)))

; [securities_advisory:investment_analysis_report_made] 證券投資顧問事業提供證券投資分析建議時，應作成投資分析報告，載明合理分析基礎及根據
(assert (= investment_analysis_report_made analysis_report_created))

; [securities_advisory:analysis_report_and_records_saved] 投資分析報告副本及紀錄應保存五年，得以電子媒體形式儲存
(assert (= analysis_report_and_records_saved analysis_report_saved_5_years))

; [securities_advisory:contract_rights_obligations_records_saved] 證券投資顧問契約權利義務關係消滅日起保存五年
(assert (= contract_rights_obligations_records_saved contract_records_saved_5_years))

; [securities_advisory:media_investment_analysis_record_saved] 證券投資顧問事業在各種傳播媒體提供投資分析者，應將節目錄影及錄音存查，至少保存一年
(assert (= media_investment_analysis_record_saved media_record_saved_1_year))

; [securities_advisory:business_conduct_good_faith] 證券投資顧問事業應以善良管理人注意義務及忠實義務、本誠實及信用原則執行業務
(assert (= business_conduct_good_faith good_faith_and_loyalty_observed))

; [securities_advisory:prohibited_acts] 證券投資顧問事業不得有法令禁止之二十一種行為
(assert (not (= (or custody_or_misappropriation
            superstition_based_advice
            agency_securities_investment
            buy_sell_same_securities
            non_employee_program_host
            advisory_service_as_gift
            allow_others_use_name
            profit_and_expense_sharing_agreement
            profit_loss_sharing_agreement
            unreasonable_advice
            illegal_disclosure_of_client_info
            unregistered_name_activity
            fraud_coercion_contract
            unapproved_public_prediction
            other_violations
            unlicensed_commission_payment
            conflict_of_interest
            loan_or_intermediation
            incite_refusal_of_settlement
            unregistered_business_location
            false_misleading_behavior)
        prohibited_acts)))

; [securities_advisory:client_data_confidentiality] 證券投資顧問事業應保守客戶個人資料、往來交易資料及其他相關資料秘密
(assert (= client_data_confidentiality client_data_kept_confidential))

; [securities_advisory:internal_personnel_management] 證券投資顧問事業應依同業公會規定訂定內部人員管理規範並執行
(assert (= internal_personnel_management
   internal_management_rules_established_and_executed))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反專任、登錄、評估、契約、報告、善良管理義務、禁止行為、保密及內部管理規定時處罰
(assert (= penalty
   (or (not media_investment_analysis_record_saved)
       (not investment_analysis_report_made)
       (not business_conduct_good_faith)
       (not written_contract_made)
       (not manager_executive_registered)
       (not manager_executive_dedicated)
       (not client_data_confidentiality)
       (not analysis_report_and_records_saved)
       (not internal_personnel_management)
       (not client_assessment_done)
       (not contract_rights_obligations_records_saved)
       (not (= contract_termination_fee_limit 1.0))
       (not prohibited_acts)
       (not manager_executive_registration_allowed)
       (not contract_mandatory_items))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= dedicated true))
(assert (= registered_with_association false))
(assert (= has_article_68_violation false))
(assert (= qualification_not_met false))
(assert (= violates_article_7 false))
(assert (= client_assessment_completed false))
(assert (= contract_written_and_signed false))
(assert (= contract_party_name_address false))
(assert (= contract_rights_obligations_liabilities false))
(assert (= contract_scope_of_advice false))
(assert (= contract_service_method false))
(assert (= contract_fee_amount_payment_method false))
(assert (= contract_confidentiality_obligation false))
(assert (= contract_no_leak_without_consent false))
(assert (= contract_no_client_fund_receipt_or_profit_loss_sharing false))
(assert (= contract_modification_termination false))
(assert (= contract_effective_date_duration 0))
(assert (= contract_client_7day_termination_right false))
(assert (= contract_fee_refund_ratio_method false))
(assert (= contract_dispute_resolution_jurisdiction false))
(assert (= contract_other_mandatory_items false))
(assert (= no_damage_or_penalty_claimed true))
(assert (= analysis_report_created false))
(assert (= analysis_report_saved_5_years false))
(assert (= contract_records_saved_5_years false))
(assert (= media_record_saved_1_year false))
(assert (= good_faith_and_loyalty_observed false))
(assert (= fraud_coercion_contract false))
(assert (= agency_securities_investment false))
(assert (= profit_loss_sharing_agreement false))
(assert (= buy_sell_same_securities false))
(assert (= false_misleading_behavior true))
(assert (= loan_or_intermediation false))
(assert (= custody_or_misappropriation false))
(assert (= conflict_of_interest false))
(assert (= illegal_disclosure_of_client_info false))
(assert (= allow_others_use_name false))
(assert (= unreasonable_advice true))
(assert (= unapproved_public_prediction false))
(assert (= non_employee_program_host false))
(assert (= superstition_based_advice false))
(assert (= incite_refusal_of_settlement false))
(assert (= unlicensed_commission_payment false))
(assert (= unregistered_name_activity false))
(assert (= advisory_service_as_gift true))
(assert (= unregistered_business_location false))
(assert (= profit_and_expense_sharing_agreement false))
(assert (= other_violations false))
(assert (= client_data_kept_confidential true))
(assert (= internal_management_rules_established_and_executed false))
(assert (= analysis_report_and_records_saved false))
(assert (= business_conduct_good_faith false))
(assert (= client_assessment_done false))
(assert (= client_data_confidentiality false))
(assert (= contract_mandatory_items false))
(assert (= contract_rights_obligations_records_saved false))
(assert (= contract_termination_fee_limit 0.0))
(assert (= internal_personnel_management false))
(assert (= investment_analysis_report_made false))
(assert (= manager_executive_dedicated false))
(assert (= manager_executive_registered false))
(assert (= manager_executive_registration_allowed false))
(assert (= media_investment_analysis_record_saved false))
(assert (= penalty false))
(assert (= prohibited_acts false))
(assert (= written_contract_made false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 66
; Total facts: 66
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
