; SMT2 file generated from compliance case automatic
; Case ID: case_251
; Generated at: 2025-10-21T22:05:26.444980
;
; This file can be executed with Z3:
;   z3 case_251.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_executed_with_duty_of_care_and_loyalty Bool)
(declare-const buy_sell_same_security Bool)
(declare-const client_data_kept_confidential Bool)
(declare-const compensation_requested Bool)
(declare-const confidentiality_obligation Bool)
(declare-const conflict_of_interest_behavior Bool)
(declare-const contract_exists Bool)
(declare-const contract_includes_confidentiality_obligation Bool)
(declare-const contract_includes_dispute_resolution Bool)
(declare-const contract_includes_effective_duration Bool)
(declare-const contract_includes_fee_amount_method Bool)
(declare-const contract_includes_modification_termination Bool)
(declare-const contract_includes_non_disclosure_clause Bool)
(declare-const contract_includes_other_required_items Bool)
(declare-const contract_includes_parties_info Bool)
(declare-const contract_includes_refund_ratio_method Bool)
(declare-const contract_includes_rights_obligations Bool)
(declare-const contract_includes_service_method Bool)
(declare-const contract_includes_service_scope Bool)
(declare-const contract_includes_termination_within_7_days Bool)
(declare-const contract_rights_obligations_retention Bool)
(declare-const contract_rights_obligations_retention_years Int)
(declare-const contract_termination_compensation_ok Bool)
(declare-const contract_written Bool)
(declare-const custody_or_misappropriation Bool)
(declare-const damages_or_penalty_requested Bool)
(declare-const duty_of_care_and_loyalty Bool)
(declare-const false_misleading_behavior Bool)
(declare-const fraudulent_contract Bool)
(declare-const gift_as_advisory_service Bool)
(declare-const has_disqualifying_circumstances Bool)
(declare-const incitement_to_breach_contract Bool)
(declare-const internal_management_rules Bool)
(declare-const internal_management_rules_established_and_executed Bool)
(declare-const investment_analysis_report_created Bool)
(declare-const investment_analysis_report_required Bool)
(declare-const investment_analysis_report_retention Bool)
(declare-const investment_analysis_report_retention_years Int)
(declare-const is_dedicated Bool)
(declare-const is_registered Bool)
(declare-const loan_or_intermediation Bool)
(declare-const manager_executive_dedicated Bool)
(declare-const manager_executive_registered Bool)
(declare-const media_record_retention Bool)
(declare-const media_record_retention_years Int)
(declare-const meets_qualification_requirements Bool)
(declare-const non_employee_program_host Bool)
(declare-const other_illegal_acts Bool)
(declare-const penalty Bool)
(declare-const profit_and_expense_sharing_agreement Bool)
(declare-const profit_loss_sharing_agreement Bool)
(declare-const prohibited_behaviors Bool)
(declare-const proxy_securities_investment Bool)
(declare-const registration_eligibility Bool)
(declare-const registration_revoked Bool)
(declare-const superstition_based_advice Bool)
(declare-const unauthorized_disclosure Bool)
(declare-const unauthorized_public_prediction Bool)
(declare-const unauthorized_use_of_name Bool)
(declare-const unreasonable_advice Bool)
(declare-const unreasonable_commission Bool)
(declare-const unregistered_business_location Bool)
(declare-const unregistered_name_activity Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities_advisory:manager_executive_dedicated] 證券投資顧問事業總經理、部門主管、分支機構經理人及業務人員應為專任
(assert (= manager_executive_dedicated is_dedicated))

; [securities_advisory:manager_executive_registered] 證券投資顧問事業總經理、部門主管、分支機構經理人及業務人員應登錄且未撤銷
(assert (= manager_executive_registered (and is_registered (not registration_revoked))))

; [securities_advisory:registration_eligibility] 登錄資格條件符合且無禁止登錄情事
(assert (= registration_eligibility
   (and meets_qualification_requirements (not has_disqualifying_circumstances))))

; [securities_advisory:contract_written] 證券投資顧問契約為書面且載明必要事項
(assert (= contract_written
   (and contract_exists
        contract_includes_parties_info
        contract_includes_rights_obligations
        contract_includes_service_scope
        contract_includes_service_method
        contract_includes_fee_amount_method
        contract_includes_confidentiality_obligation
        contract_includes_non_disclosure_clause
        contract_includes_modification_termination
        contract_includes_effective_duration
        contract_includes_termination_within_7_days
        contract_includes_refund_ratio_method
        contract_includes_dispute_resolution
        contract_includes_other_required_items)))

; [securities_advisory:contract_termination_compensation] 契約終止時不得請求損害賠償或違約金，但得請求終止前相當報酬
(assert (= contract_termination_compensation_ok
   (and compensation_requested (not damages_or_penalty_requested))))

; [securities_advisory:investment_analysis_report_required] 提供證券投資分析建議時應作成投資分析報告並載明合理分析基礎及根據
(assert (= investment_analysis_report_required investment_analysis_report_created))

; [securities_advisory:investment_analysis_report_retention] 投資分析報告副本及紀錄保存五年，可電子媒體形式
(assert (= investment_analysis_report_retention
   (<= 5.0 (to_real investment_analysis_report_retention_years))))

; [securities_advisory:contract_rights_obligations_retention] 證券投資顧問契約權利義務關係消滅後保存五年
(assert (= contract_rights_obligations_retention
   (<= 5.0 (to_real contract_rights_obligations_retention_years))))

; [securities_advisory:media_record_retention] 投資分析節目錄影及錄音存查至少保存一年
(assert (= media_record_retention (<= 1.0 (to_real media_record_retention_years))))

; [securities_advisory:duty_of_care_and_loyalty] 依本法及契約規定，以善良管理人注意義務及忠實義務執行業務
(assert (= duty_of_care_and_loyalty business_executed_with_duty_of_care_and_loyalty))

; [securities_advisory:prohibited_behaviors] 不得有法令禁止之不當行為
(assert (not (= (or profit_loss_sharing_agreement
            unauthorized_use_of_name
            superstition_based_advice
            profit_and_expense_sharing_agreement
            loan_or_intermediation
            non_employee_program_host
            conflict_of_interest_behavior
            unregistered_name_activity
            buy_sell_same_security
            unregistered_business_location
            gift_as_advisory_service
            fraudulent_contract
            unreasonable_commission
            custody_or_misappropriation
            incitement_to_breach_contract
            unauthorized_public_prediction
            false_misleading_behavior
            other_illegal_acts
            unreasonable_advice
            unauthorized_disclosure
            proxy_securities_investment)
        prohibited_behaviors)))

; [securities_advisory:confidentiality_obligation] 對客戶個人資料及交易資料應保守秘密
(assert (= confidentiality_obligation client_data_kept_confidential))

; [securities_advisory:internal_management_rules] 應依同業公會規定訂定內部人員管理規範並執行
(assert (= internal_management_rules internal_management_rules_established_and_executed))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反專任、登錄、契約、報告、義務、禁止行為、保密及內部管理規定時處罰
(assert (= penalty
   (or (not contract_written)
       (not prohibited_behaviors)
       (not registration_eligibility)
       (not media_record_retention)
       (not manager_executive_dedicated)
       (not manager_executive_registered)
       (not confidentiality_obligation)
       (not investment_analysis_report_required)
       (not contract_rights_obligations_retention)
       (not internal_management_rules)
       (not investment_analysis_report_retention)
       (not contract_termination_compensation_ok)
       (not duty_of_care_and_loyalty))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= is_dedicated false))
(assert (= manager_executive_dedicated false))
(assert (= is_registered false))
(assert (= registration_revoked true))
(assert (= manager_executive_registered false))
(assert (= meets_qualification_requirements true))
(assert (= has_disqualifying_circumstances false))
(assert (= registration_eligibility false))
(assert (= contract_exists false))
(assert (= contract_written false))
(assert (= contract_includes_parties_info false))
(assert (= contract_includes_rights_obligations false))
(assert (= contract_includes_service_scope false))
(assert (= contract_includes_service_method false))
(assert (= contract_includes_fee_amount_method false))
(assert (= contract_includes_confidentiality_obligation false))
(assert (= contract_includes_non_disclosure_clause false))
(assert (= contract_includes_modification_termination false))
(assert (= contract_includes_effective_duration false))
(assert (= contract_includes_termination_within_7_days false))
(assert (= contract_includes_refund_ratio_method false))
(assert (= contract_includes_dispute_resolution false))
(assert (= contract_includes_other_required_items false))
(assert (= compensation_requested false))
(assert (= damages_or_penalty_requested false))
(assert (= contract_termination_compensation_ok false))
(assert (= investment_analysis_report_created false))
(assert (= investment_analysis_report_required false))
(assert (= investment_analysis_report_retention_years 0))
(assert (= investment_analysis_report_retention false))
(assert (= contract_rights_obligations_retention_years 0))
(assert (= contract_rights_obligations_retention false))
(assert (= media_record_retention_years 0))
(assert (= media_record_retention false))
(assert (= business_executed_with_duty_of_care_and_loyalty false))
(assert (= duty_of_care_and_loyalty false))
(assert (= fraudulent_contract false))
(assert (= proxy_securities_investment false))
(assert (= profit_loss_sharing_agreement false))
(assert (= buy_sell_same_security false))
(assert (= false_misleading_behavior false))
(assert (= loan_or_intermediation false))
(assert (= custody_or_misappropriation false))
(assert (= conflict_of_interest_behavior false))
(assert (= unauthorized_disclosure false))
(assert (= unauthorized_use_of_name false))
(assert (= unreasonable_advice false))
(assert (= unauthorized_public_prediction false))
(assert (= non_employee_program_host false))
(assert (= superstition_based_advice false))
(assert (= incitement_to_breach_contract false))
(assert (= unreasonable_commission false))
(assert (= unregistered_name_activity false))
(assert (= gift_as_advisory_service true))
(assert (= unregistered_business_location false))
(assert (= profit_and_expense_sharing_agreement false))
(assert (= other_illegal_acts false))
(assert (= prohibited_behaviors false))
(assert (= client_data_kept_confidential true))
(assert (= confidentiality_obligation true))
(assert (= internal_management_rules_established_and_executed false))
(assert (= internal_management_rules false))
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
; Total variables: 63
; Total facts: 63
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
