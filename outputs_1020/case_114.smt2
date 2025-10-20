; SMT2 file generated from compliance case automatic
; Case ID: case_114
; Generated at: 2025-10-19T08:22:08.192513
;
; This file can be executed with Z3:
;   z3 case_114.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const allowed_to_concurrent_business Bool)
(declare-const annual_report_prepared Bool)
(declare-const annual_report_submission Bool)
(declare-const board_approval_passed Bool)
(declare-const company_type_corporation Bool)
(declare-const company_type_restriction Bool)
(declare-const contract_terms_compliance Bool)
(declare-const contract_terms_meet_regulations Bool)
(declare-const days_since_board_approval Int)
(declare-const definition_agent_payment Bool)
(declare-const definition_alert_epayment_account Bool)
(declare-const definition_attached_stored_value_card Bool)
(declare-const definition_bonus_points Bool)
(declare-const definition_delivery_platform Bool)
(declare-const definition_delivery_platform_operator Bool)
(declare-const definition_derived_control_epayment_account Bool)
(declare-const definition_direct_linked_mechanism Bool)
(declare-const definition_epayment_account Bool)
(declare-const definition_epayment_business Bool)
(declare-const definition_epayment_institution Bool)
(declare-const definition_gift_voucher_services Bool)
(declare-const definition_indirect_linked_mechanism Bool)
(declare-const definition_linked_account_payment Bool)
(declare-const definition_merchant Bool)
(declare-const definition_merchant_payment_message_integration Bool)
(declare-const definition_multi_purpose_payment Bool)
(declare-const definition_parking_service_platform Bool)
(declare-const definition_parking_service_platform_operator Bool)
(declare-const definition_payment_funds Bool)
(declare-const definition_receipt_of_stored_value Bool)
(declare-const definition_small_amount_remittance Bool)
(declare-const definition_stored_value_card Bool)
(declare-const definition_taxi_service_platform Bool)
(declare-const definition_taxi_service_platform_operator Bool)
(declare-const definition_user Bool)
(declare-const definition_user_message_transmission Bool)
(declare-const definitions Bool)
(declare-const financial_report_audited Bool)
(declare-const months_since_fiscal_year_end Int)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [epayment:company_type_restriction] 電子支付機構必須為股份有限公司，除經主管機關許可兼營者外，應專營第四條第一項及第二項各款業務
(assert (= company_type_restriction
   (or company_type_corporation allowed_to_concurrent_business)))

; [epayment:contract_terms_compliance] 專營電子支付機構訂定業務定型化契約條款內容須符合主管機關公告範本及不得低於範本內容
(assert (= contract_terms_compliance contract_terms_meet_regulations))

; [epayment:annual_report_submission] 專營電子支付機構應於會計年度終了四個月內編製營業報告書及財務報告，並於董事會通過翌日起15日內申報公告
(assert (= annual_report_submission
   (and annual_report_prepared
        financial_report_audited
        board_approval_passed
        (>= 15 days_since_board_approval)
        (>= 4 months_since_fiscal_year_end))))

; [epayment:definitions] 電子支付機構管理條例及業務管理規則相關定義
(assert (= definitions
   (and definition_epayment_institution
        definition_merchant
        definition_user
        definition_epayment_account
        definition_stored_value_card
        definition_agent_payment
        definition_receipt_of_stored_value
        definition_small_amount_remittance
        definition_payment_funds
        definition_multi_purpose_payment
        definition_epayment_business
        definition_linked_account_payment
        definition_direct_linked_mechanism
        definition_indirect_linked_mechanism
        definition_merchant_payment_message_integration
        definition_user_message_transmission
        definition_gift_voucher_services
        definition_bonus_points
        definition_attached_stored_value_card
        definition_alert_epayment_account
        definition_derived_control_epayment_account
        definition_delivery_platform
        definition_delivery_platform_operator
        definition_taxi_service_platform
        definition_taxi_service_platform_operator
        definition_parking_service_platform
        definition_parking_service_platform_operator)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反公司型態限制、契約條款規定或未依時申報公告營業及財務報告時處罰
(assert (= penalty
   (or (not company_type_restriction)
       (not contract_terms_compliance)
       (not annual_report_submission))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= allowed_to_concurrent_business false))
(assert (= annual_report_prepared true))
(assert (= board_approval_passed false))
(assert (= company_type_corporation true))
(assert (= contract_terms_meet_regulations true))
(assert (= contract_terms_compliance true))
(assert (= days_since_board_approval 7))
(assert (= definition_agent_payment true))
(assert (= definition_alert_epayment_account true))
(assert (= definition_attached_stored_value_card true))
(assert (= definition_bonus_points true))
(assert (= definition_delivery_platform true))
(assert (= definition_delivery_platform_operator true))
(assert (= definition_derived_control_epayment_account true))
(assert (= definition_direct_linked_mechanism true))
(assert (= definition_epayment_account true))
(assert (= definition_epayment_business true))
(assert (= definition_epayment_institution true))
(assert (= definition_gift_voucher_services true))
(assert (= definition_indirect_linked_mechanism true))
(assert (= definition_linked_account_payment true))
(assert (= definition_merchant true))
(assert (= definition_merchant_payment_message_integration true))
(assert (= definition_multi_purpose_payment true))
(assert (= definition_parking_service_platform true))
(assert (= definition_parking_service_platform_operator true))
(assert (= definition_payment_funds true))
(assert (= definition_receipt_of_stored_value true))
(assert (= definition_small_amount_remittance true))
(assert (= definition_stored_value_card true))
(assert (= definition_taxi_service_platform true))
(assert (= definition_taxi_service_platform_operator true))
(assert (= definition_user true))
(assert (= definition_user_message_transmission true))
(assert (= definitions true))
(assert (= financial_report_audited true))
(assert (= months_since_fiscal_year_end 4))
(assert (= annual_report_submission false))
(assert (= company_type_restriction true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 40
; Total facts: 40
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
