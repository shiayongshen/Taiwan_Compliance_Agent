; SMT2 file generated from compliance case automatic
; Case ID: case_67
; Generated at: 2025-10-21T21:15:49.448926
;
; This file can be executed with Z3:
;   z3 case_67.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_misconduct_detected Bool)
(declare-const application_procedures_followed Bool)
(declare-const approved_by_authority Bool)
(declare-const authority_defined_minimum_guarantee_deposit Real)
(declare-const authorize_third_party_to_operate Bool)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_authority_approval Bool)
(declare-const bank_operates_as_agent Bool)
(declare-const bank_operates_as_broker Bool)
(declare-const board_supervisor_manager_qualifications_met Bool)
(declare-const branch_establishment_conditions_met Bool)
(declare-const broker_duties_complied Bool)
(declare-const broker_report_and_fee_disclosure_complied Bool)
(declare-const coerce_or_induce_or_restrict_contract_freedom_or_ask_extra_benefits Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const duty_of_care_met Bool)
(declare-const duty_of_loyalty_met Bool)
(declare-const education_and_training_compliant Bool)
(declare-const embezzle_fraud_forgery_conviction Bool)
(declare-const employ_unqualified_insurance_solicitors Bool)
(declare-const exaggerate_or_mislead_promotion_or_recruitment Bool)
(declare-const execute_unapproved_insurance_business Bool)
(declare-const fail_to_appoint_agent_after_resignation Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_financial_consumer_suitability Bool)
(declare-const fail_to_fill_solicitation_report_truthfully Bool)
(declare-const fail_to_report_to_agent_trade_association Bool)
(declare-const false_information_on_license_application Bool)
(declare-const fee_charged Real)
(declare-const fee_disclosure_made Bool)
(declare-const financial_and_business_management_compliant Bool)
(declare-const grounds_for_dismissal_complied Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance_covered Bool)
(declare-const hold_position_in_insurance_or_association Bool)
(declare-const illegal_collection_of_money_or_benefits Bool)
(declare-const illegal_insurance_payment Bool)
(declare-const induce_customer_to_terminate_contract_or_pay_by_loan_or_deposit Bool)
(declare-const induce_policyholder_to_surrender_or_transfer_or_loan Bool)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_issued Bool)
(declare-const license_revocation_procedures_compliant Bool)
(declare-const management_rules_compliance Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const misappropriate_or_embezzle_premiums_or_claims Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const operate_without_approval Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_mandatory_requirements_compliant Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_solicitors Bool)
(declare-const penalty Bool)
(declare-const qualification_conditions_met Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const required_documents_submitted Bool)
(declare-const responsibility_insurance_covered Bool)
(declare-const sell_unapproved_foreign_policy_discount_benefit_certificates Bool)
(declare-const spread_false_statements_or_disrupt_financial_order Bool)
(declare-const submit_application_documents_of_unregistered_agents Bool)
(declare-const submit_false_or_incomplete_business_or_financial_reports Bool)
(declare-const unauthorized_suspension_or_termination_of_business Bool)
(declare-const use_license_for_others Bool)
(declare-const use_unapproved_advertisement_content Bool)
(declare-const violate_article_163_fifth_paragraph_applied Bool)
(declare-const violate_article_163_seventh_paragraph Bool)
(declare-const violate_article_165_first_paragraph Bool)
(declare-const violate_financial_or_business_management_rules Bool)
(declare-const violation_penalty_applicable Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_compliance
   (and approved_by_authority
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_covered
        license_issued)))

; [insurance:relevant_insurance_covered] 相關保險依身份不同而異：代理人、公證人為責任保險；經紀人為責任保險及保證保險
(assert (= relevant_insurance_covered
   (or (and (not is_agent)
            is_notary
            responsibility_insurance_covered
            (not guarantee_insurance_covered))
       (and is_broker
            responsibility_insurance_covered
            guarantee_insurance_covered)
       (and is_agent
            (not is_notary)
            responsibility_insurance_covered
            (not guarantee_insurance_covered)))))

; [insurance:minimum_guarantee_deposit] 主管機關定最低保證金及實施方式，考量經營及執行業務範圍及規模
(assert (= minimum_guarantee_deposit
   (ite (<= 0.0 authority_defined_minimum_guarantee_deposit)
        authority_defined_minimum_guarantee_deposit
        0.0)))

; [insurance:management_rules_compliance] 依主管機關定管理規則，符合資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他應遵行事項
(assert (= management_rules_compliance
   (and qualification_conditions_met
        application_procedures_followed
        required_documents_submitted
        board_supervisor_manager_qualifications_met
        grounds_for_dismissal_complied
        branch_establishment_conditions_met
        financial_and_business_management_compliant
        education_and_training_compliant
        license_revocation_procedures_compliant
        other_mandatory_requirements_compliant)))

; [insurance:bank_authority_approval] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_authority_approval
   (and bank_approved_by_authority
        (or bank_operates_as_agent bank_operates_as_broker))))

; [insurance:broker_duties] 保險經紀人應以善良管理人注意義務洽訂保險契約或提供服務，並負忠實義務
(assert (= broker_duties_complied (and duty_of_care_met duty_of_loyalty_met)))

; [insurance:broker_report_and_fee_disclosure] 保險經紀人洽訂契約前，於主管機關指定範圍內主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (let ((a!1 (and written_analysis_report_provided
                (or fee_disclosure_made (not (= fee_charged 1.0))))))
  (= broker_report_and_fee_disclosure_complied a!1)))

; [insurance:violation_penalty] 違反保險法第163條第四項管理規則中財務或業務管理規定、同條第七項規定，或違反第165條第一項或第163條第五項準用規定者，應限期改正或處罰
(assert (= violation_penalty_applicable
   (or violate_article_163_fifth_paragraph_applied
       violate_financial_or_business_management_rules
       violate_article_163_seventh_paragraph
       violate_article_165_first_paragraph)))

; [insurance:agent_misconduct] 代理人不得有申領證照不實、未經核准經營、隱匿重要事項、不當手段強迫或索取利益、誇大不實宣傳、慫恿退保、挪用保險費、證照供他人使用、侵占詐欺偽造文書、經營非許可業務、非法收取報酬、不法保險給付、散播不實言論、授權第三人代經營、招攬未登錄人員、聘用未具資格者、未依規定繳銷證照、擅自停業或終止業務、未依規定報備、使用未經同意廣告、支付佣酬不實、未確認金融消費者適合度、銷售未許可商品、提報不實資料、任職保險業或公會現職、勸誘解除契約、未據實填寫招攬報告書、其他違反規則或損保險形象行為
(assert (= agent_misconduct_detected
   (or spread_false_statements_or_disrupt_financial_order
       coerce_or_induce_or_restrict_contract_freedom_or_ask_extra_benefits
       pay_commission_to_non_actual_solicitors
       use_unapproved_advertisement_content
       sell_unapproved_foreign_policy_discount_benefit_certificates
       conceal_important_contract_info
       operate_outside_license_scope
       misappropriate_or_embezzle_premiums_or_claims
       operate_without_approval
       other_behaviors_damaging_insurance_image
       other_violations_of_rules_or_laws
       unauthorized_suspension_or_termination_of_business
       use_license_for_others
       submit_application_documents_of_unregistered_agents
       submit_false_or_incomplete_business_or_financial_reports
       illegal_insurance_payment
       induce_customer_to_terminate_contract_or_pay_by_loan_or_deposit
       induce_policyholder_to_surrender_or_transfer_or_loan
       hold_position_in_insurance_or_association
       illegal_collection_of_money_or_benefits
       fail_to_confirm_financial_consumer_suitability
       fail_to_fill_solicitation_report_truthfully
       fail_to_report_to_agent_trade_association
       false_information_on_license_application
       exaggerate_or_mislead_promotion_or_recruitment
       execute_unapproved_insurance_business
       fail_to_appoint_agent_after_resignation
       authorize_third_party_to_operate
       fail_to_cancel_license_within_deadline
       embezzle_fraud_forgery_conviction
       employ_unqualified_insurance_solicitors)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法第163條管理規則財務或業務管理規定、相關規定或代理人違規行為時處罰
(assert (= penalty (or violation_penalty_applicable agent_misconduct_detected)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_misconduct_detected true))
(assert (= operate_without_approval false))
(assert (= execute_unapproved_insurance_business true))
(assert (= illegal_collection_of_money_or_benefits true))
(assert (= violate_financial_or_business_management_rules false))
(assert (= violate_article_163_seventh_paragraph false))
(assert (= violate_article_165_first_paragraph false))
(assert (= violate_article_163_fifth_paragraph_applied true))
(assert (= violation_penalty_applicable true))
(assert (= approved_by_authority true))
(assert (= guarantee_deposit_amount 1000000))
(assert (= authority_defined_minimum_guarantee_deposit 1000000))
(assert (= license_issued true))
(assert (= relevant_insurance_covered true))
(assert (= is_agent true))
(assert (= is_broker false))
(assert (= is_notary false))
(assert (= responsibility_insurance_covered true))
(assert (= guarantee_insurance_covered false))
(assert (= bank_approved_by_authority true))
(assert (= bank_operates_as_agent true))
(assert (= bank_operates_as_broker false))
(assert (= bank_authority_approval true))
(assert (= application_procedures_followed true))
(assert (= qualification_conditions_met true))
(assert (= required_documents_submitted true))
(assert (= board_supervisor_manager_qualifications_met true))
(assert (= grounds_for_dismissal_complied true))
(assert (= branch_establishment_conditions_met true))
(assert (= financial_and_business_management_compliant false))
(assert (= education_and_training_compliant true))
(assert (= license_revocation_procedures_compliant true))
(assert (= other_mandatory_requirements_compliant true))
(assert (= broker_duties_complied true))
(assert (= broker_report_and_fee_disclosure_complied true))
(assert (= duty_of_care_met true))
(assert (= duty_of_loyalty_met true))
(assert (= fee_charged 3000000))
(assert (= fee_disclosure_made false))
(assert (= authorize_third_party_to_operate false))
(assert (= conceal_important_contract_info false))
(assert (= coerce_or_induce_or_restrict_contract_freedom_or_ask_extra_benefits false))
(assert (= exaggerate_or_mislead_promotion_or_recruitment false))
(assert (= induce_policyholder_to_surrender_or_transfer_or_loan false))
(assert (= misappropriate_or_embezzle_premiums_or_claims false))
(assert (= use_license_for_others false))
(assert (= embezzle_fraud_forgery_conviction false))
(assert (= operate_outside_license_scope false))
(assert (= illegal_insurance_payment false))
(assert (= spread_false_statements_or_disrupt_financial_order false))
(assert (= submit_application_documents_of_unregistered_agents false))
(assert (= employ_unqualified_insurance_solicitors false))
(assert (= fail_to_cancel_license_within_deadline false))
(assert (= unauthorized_suspension_or_termination_of_business false))
(assert (= fail_to_appoint_agent_after_resignation false))
(assert (= fail_to_report_to_agent_trade_association false))
(assert (= use_unapproved_advertisement_content false))
(assert (= pay_commission_to_non_actual_solicitors false))
(assert (= fail_to_confirm_financial_consumer_suitability false))
(assert (= sell_unapproved_foreign_policy_discount_benefit_certificates false))
(assert (= submit_false_or_incomplete_business_or_financial_reports false))
(assert (= hold_position_in_insurance_or_association false))
(assert (= induce_customer_to_terminate_contract_or_pay_by_loan_or_deposit false))
(assert (= fail_to_fill_solicitation_report_truthfully false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= other_behaviors_damaging_insurance_image false))
(assert (= false_information_on_license_application false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 72
; Total facts: 67
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
