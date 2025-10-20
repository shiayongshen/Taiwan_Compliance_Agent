; SMT2 file generated from compliance case automatic
; Case ID: case_152
; Generated at: 2025-10-19T09:26:08.387146
;
; This file can be executed with Z3:
;   z3 case_152.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authorize_others_to_operate Bool)
(declare-const broker_misconduct Bool)
(declare-const business_management_compliant Bool)
(declare-const charge_unapproved_fees_or_commissions Bool)
(declare-const coerce_or_induce_contract Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const convicted_of_fraud_or_forgery Bool)
(declare-const correction_made Bool)
(declare-const correction_ordered Bool)
(declare-const damage_insurance_image Bool)
(declare-const deposit_guarantee Bool)
(declare-const employ_unqualified_recruiters Bool)
(declare-const fail_to_cancel_license_in_time Bool)
(declare-const fail_to_confirm_suitability_for_elderly_clients Bool)
(declare-const fail_to_fill_recruitment_report_truthfully Bool)
(declare-const fail_to_reappoint_broker_after_resignation Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_report_on_license_application Bool)
(declare-const financial_management_compliant Bool)
(declare-const hold_positions_in_insurance_or_association Bool)
(declare-const illegal_insurance_claims Bool)
(declare-const improper_inducement_to_cancel_or_transfer Bool)
(declare-const induce_clients_to_terminate_contracts Bool)
(declare-const insurance_policy_purchased Bool)
(declare-const license_permitted Bool)
(declare-const license_revoked Bool)
(declare-const license_used_by_others Bool)
(declare-const license_valid Bool)
(declare-const management_rules_compliant Bool)
(declare-const misappropriate_insurance_funds Bool)
(declare-const misleading_advertisement Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_recruiters Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_imposed Bool)
(declare-const permit_obtained Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const serious_circumstances Bool)
(declare-const spread_false_information Bool)
(declare-const submit_false_or_incomplete_reports Bool)
(declare-const transfer_application_documents_improperly Bool)
(declare-const unauthorized_suspension_or_termination_of_business Bool)
(declare-const unauthorized_use_of_insurance_advertisement Bool)
(declare-const violate_163_4_financial_or_business_management Bool)
(declare-const violate_163_5_applied Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1 Bool)
(declare-const violation_163_4_7_165_1_163_5 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_163_4_7_165_1_163_5] 違反保險法第163條第4項、第7項、第165條第1項及第163條第5項準用規定
(assert (= violation_163_4_7_165_1_163_5
   (or (and violate_163_4_financial_or_business_management
            (not violate_163_7)
            (not violate_165_1)
            (not violate_163_5_applied))
       (and (not violate_163_4_financial_or_business_management)
            violate_163_7
            (not violate_165_1)
            (not violate_163_5_applied))
       (and (not violate_163_4_financial_or_business_management)
            (not violate_163_7)
            violate_165_1
            (not violate_163_5_applied))
       (and (not violate_163_4_financial_or_business_management)
            (not violate_163_7)
            (not violate_165_1)
            violate_163_5_applied))))

; [insurance:correction_ordered] 已限期改正違規事項
(assert (= correction_ordered correction_made))

; [insurance:penalty_fine_imposed] 處以新臺幣十萬元以上三百萬元以下罰鍰
(assert (= penalty_fine_imposed
   (and violation_163_4_7_165_1_163_5 (not correction_ordered))))

; [insurance:license_revoked] 情節重大者，廢止許可並註銷執業證照
(assert (= license_revoked (and violation_163_4_7_165_1_163_5 serious_circumstances)))

; [insurance:license_valid] 執業證照有效
(assert (not (= license_revoked license_valid)))

; [insurance:license_permitted] 依法取得執業證照且符合保險法第163條規定
(assert (= license_permitted
   (and license_valid
        permit_obtained
        deposit_guarantee
        insurance_policy_purchased)))

; [insurance:management_rules_compliant] 符合主管機關定之管理規則中財務與業務管理規定
(assert (= management_rules_compliant
   (and financial_management_compliant business_management_compliant)))

; [insurance:broker_misconduct] 違反保險經紀人管理規則第49條各款行為
(assert (= broker_misconduct
   (or transfer_application_documents_improperly
       unauthorized_suspension_or_termination_of_business
       damage_insurance_image
       misappropriate_insurance_funds
       false_report_on_license_application
       unauthorized_use_of_insurance_advertisement
       spread_false_information
       employ_unqualified_recruiters
       fail_to_reappoint_broker_after_resignation
       improper_inducement_to_cancel_or_transfer
       authorize_others_to_operate
       pay_commission_to_non_recruiters
       induce_clients_to_terminate_contracts
       license_used_by_others
       convicted_of_fraud_or_forgery
       misleading_advertisement
       contract_with_unapproved_insurer
       charge_unapproved_fees_or_commissions
       operate_outside_license_scope
       coerce_or_induce_contract
       other_violations_of_rules_or_laws
       fail_to_report_to_broker_association
       illegal_insurance_claims
       fail_to_fill_recruitment_report_truthfully
       fail_to_confirm_suitability_for_elderly_clients
       fail_to_cancel_license_in_time
       hold_positions_in_insurance_or_association
       submit_false_or_incomplete_reports
       sell_unapproved_foreign_policy_discount_products
       conceal_important_contract_info)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則或保險法相關規定時處罰
(assert (= penalty (or violation_163_4_7_165_1_163_5 broker_misconduct)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_163_4_financial_or_business_management true))
(assert (= violate_163_7 false))
(assert (= violate_165_1 false))
(assert (= violate_163_5_applied false))
(assert (= correction_made true))
(assert (= false_report_on_license_application false))
(assert (= contract_with_unapproved_insurer false))
(assert (= conceal_important_contract_info false))
(assert (= coerce_or_induce_contract false))
(assert (= misleading_advertisement false))
(assert (= improper_inducement_to_cancel_or_transfer false))
(assert (= misappropriate_insurance_funds false))
(assert (= license_used_by_others false))
(assert (= convicted_of_fraud_or_forgery false))
(assert (= operate_outside_license_scope false))
(assert (= charge_unapproved_fees_or_commissions false))
(assert (= illegal_insurance_claims false))
(assert (= spread_false_information false))
(assert (= authorize_others_to_operate false))
(assert (= transfer_application_documents_improperly false))
(assert (= employ_unqualified_recruiters false))
(assert (= fail_to_cancel_license_in_time false))
(assert (= unauthorized_suspension_or_termination_of_business false))
(assert (= fail_to_reappoint_broker_after_resignation false))
(assert (= fail_to_report_to_broker_association false))
(assert (= unauthorized_use_of_insurance_advertisement false))
(assert (= pay_commission_to_non_recruiters false))
(assert (= fail_to_confirm_suitability_for_elderly_clients false))
(assert (= sell_unapproved_foreign_policy_discount_products false))
(assert (= submit_false_or_incomplete_reports false))
(assert (= hold_positions_in_insurance_or_association false))
(assert (= induce_clients_to_terminate_contracts false))
(assert (= fail_to_fill_recruitment_report_truthfully false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= damage_insurance_image false))
(assert (= correction_ordered true))
(assert (= violation_163_4_7_165_1_163_5 true))
(assert (= penalty_fine_imposed false))
(assert (= serious_circumstances false))
(assert (= license_revoked false))
(assert (= license_valid true))
(assert (= permit_obtained true))
(assert (= deposit_guarantee true))
(assert (= insurance_policy_purchased true))
(assert (= license_permitted true))
(assert (= financial_management_compliant false))
(assert (= business_management_compliant false))
(assert (= management_rules_compliant false))
(assert (= penalty true))
(assert (= broker_misconduct false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 50
; Total facts: 50
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
