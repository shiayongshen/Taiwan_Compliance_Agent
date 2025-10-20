; SMT2 file generated from compliance case automatic
; Case ID: case_288
; Generated at: 2025-10-19T12:13:09.245338
;
; This file can be executed with Z3:
;   z3 case_288.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const actual_operation_considered Bool)
(declare-const agent_book_entry_handling Bool)
(declare-const agent_duty_of_care Bool)
(declare-const agent_had_major_penalty_last_year Bool)
(declare-const agent_issuance_of_certificate Bool)
(declare-const agent_meets_qualification Bool)
(declare-const agent_qualification_ok Bool)
(declare-const agent_special_account_ok Bool)
(declare-const agent_violation_improved_and_approved Bool)
(declare-const anti_money_laundering_and_counter_terrorism_financing_defined Bool)
(declare-const audit_committee_established Bool)
(declare-const audit_committee_management_included Bool)
(declare-const audit_committee_management_included_in_internal_control Bool)
(declare-const audit_unit_established Bool)
(declare-const authorization_and_hierarchical_responsibility_defined Bool)
(declare-const bank_business_manuals_additional_items Bool)
(declare-const bill_broker_business_manuals_additional_items Bool)
(declare-const bill_business_included Bool)
(declare-const bond_business_included Bool)
(declare-const book_entry_handling_according_to_regulation Bool)
(declare-const business_manuals_and_guidelines Bool)
(declare-const business_scope_defined Bool)
(declare-const cashier_management_included Bool)
(declare-const certificate_issued_to_seller Bool)
(declare-const control_operations_for_subsidiaries_defined Bool)
(declare-const credit_cooperative_business_manuals_additional_items Bool)
(declare-const credit_management_included Bool)
(declare-const customer_data_confidentiality_defined Bool)
(declare-const deposit_management_included Bool)
(declare-const duty_of_care_fulfilled Bool)
(declare-const equity_management_defined Bool)
(declare-const exempted_by_other_penalty_provisions Bool)
(declare-const external_information_disclosure_management_defined Bool)
(declare-const financial_consumer_protection_management_defined Bool)
(declare-const financial_inspection_report_management_defined Bool)
(declare-const financial_statement_preparation_management_defined Bool)
(declare-const foreign_exchange_management_included Bool)
(declare-const foreign_subsidiary_control_considered Bool)
(declare-const foreign_subsidiary_internal_control_established Bool)
(declare-const funds_used_exclusively Bool)
(declare-const general_affairs_information_personnel_management_defined Bool)
(declare-const group_aml_ctf_plan_established Bool)
(declare-const group_information_sharing_policy_and_procedure_established Bool)
(declare-const internal_audit_unit_participated Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_coverage Bool)
(declare-const internal_control_covers_all_operations Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_implementation_according_to_regulation Bool)
(declare-const internal_control_policies_detail Bool)
(declare-const internal_control_system_established Bool)
(declare-const investment_guidelines_defined Bool)
(declare-const legal_compliance_unit_participated Bool)
(declare-const local_law_considered Bool)
(declare-const major_incident_handling_mechanism_defined Bool)
(declare-const new_financial_products_included Bool)
(declare-const new_financial_products_management_included Bool)
(declare-const operation_manual_based_on_template Bool)
(declare-const operation_manual_updated_periodically Bool)
(declare-const organization_system_defined Bool)
(declare-const other_business_rules_and_procedures_defined Bool)
(declare-const outsourcing_management_included Bool)
(declare-const penalty Bool)
(declare-const penalty_applicable Bool)
(declare-const policies_and_procedures_established Bool)
(declare-const policies_and_procedures_reviewed_and_updated Bool)
(declare-const policy_abolished Bool)
(declare-const policy_and_manual_change_participation Bool)
(declare-const policy_established Bool)
(declare-const policy_revised Bool)
(declare-const related_party_transaction_rules_defined Bool)
(declare-const remittance_management_included Bool)
(declare-const risk_management_unit_participated Bool)
(declare-const salary_committee_management_included Bool)
(declare-const salary_committee_management_included_in_internal_control Bool)
(declare-const special_account_established Bool)
(declare-const subsidiary_and_joint_marketing_management Bool)
(declare-const subsidiary_control_operations_defined Bool)
(declare-const subsidiary_is_foreign Bool)
(declare-const subsidiary_management_and_joint_marketing_included Bool)
(declare-const trust_operation_manual_reference Bool)
(declare-const unit_responsibilities_defined Bool)
(declare-const violate_law Bool)
(declare-const violate_order Bool)
(declare-const violation_of_law_or_order Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [trust:internal_control_established] 信託業已建立內部控制及稽核制度並設置稽核單位
(assert (= internal_control_established
   (and internal_control_system_established audit_unit_established)))

; [trust:internal_control_compliance] 信託業內部控制及稽核制度符合主管機關規定
(assert (= internal_control_compliance
   internal_control_implementation_according_to_regulation))

; [trust:violation_of_law_or_order] 信託業違反本法或依本法發布之命令
(assert (= violation_of_law_or_order (or violate_law violate_order)))

; [trust:penalty_applicable] 信託業違反本法或命令且應處罰
(assert (= penalty_applicable
   (and violation_of_law_or_order (not exempted_by_other_penalty_provisions))))

; [public_acquisition:agent_qualification_ok] 受委任機構符合資格條件且最近一年內無重大違規或已改善
(assert (= agent_qualification_ok
   (and agent_meets_qualification
        (or agent_violation_improved_and_approved
            (not agent_had_major_penalty_last_year)))))

; [public_acquisition:agent_special_account_ok] 受委任機構設立專戶辦理款券收付且專款專用
(assert (= agent_special_account_ok
   (and special_account_established funds_used_exclusively)))

; [public_acquisition:agent_duty_of_care] 受委任機構以善良管理人注意義務忠實履行職責
(assert (= agent_duty_of_care duty_of_care_fulfilled))

; [public_acquisition:agent_issuance_of_certificate] 受委任機構接受應賣人有價證券交存時開具憑證
(assert (= agent_issuance_of_certificate certificate_issued_to_seller))

; [public_acquisition:agent_book_entry_handling] 受委任機構接受帳簿劃撥方式交存有價證券依規定辦理
(assert (= agent_book_entry_handling book_entry_handling_according_to_regulation))

; [financial_control:internal_control_coverage] 內部控制制度涵蓋所有營運活動並訂定適當政策及程序
(assert (= internal_control_coverage
   (and internal_control_covers_all_operations
        policies_and_procedures_established
        policies_and_procedures_reviewed_and_updated)))

; [financial_control:internal_control_policies_detail] 內部控制制度訂定明確組織系統、單位職掌、業務範圍及授權分層負責
(assert (= internal_control_policies_detail
   (and organization_system_defined
        unit_responsibilities_defined
        business_scope_defined
        authorization_and_hierarchical_responsibility_defined)))

; [financial_control:business_manuals_and_guidelines] 訂定相關業務規範及處理手冊涵蓋指定項目
(assert (= business_manuals_and_guidelines
   (and investment_guidelines_defined
        customer_data_confidentiality_defined
        related_party_transaction_rules_defined
        equity_management_defined
        financial_statement_preparation_management_defined
        general_affairs_information_personnel_management_defined
        external_information_disclosure_management_defined
        financial_inspection_report_management_defined
        financial_consumer_protection_management_defined
        major_incident_handling_mechanism_defined
        anti_money_laundering_and_counter_terrorism_financing_defined
        other_business_rules_and_procedures_defined)))

; [financial_control:subsidiary_and_joint_marketing_management] 金融控股公司業務規範及處理手冊包括子公司管理及共同行銷管理
(assert (= subsidiary_and_joint_marketing_management
   subsidiary_management_and_joint_marketing_included))

; [financial_control:bank_business_manuals_additional_items] 銀行業務規範及處理手冊包括出納、存款、匯兌、授信、外匯、新種金融商品及委外作業管理
(assert (= bank_business_manuals_additional_items
   (and cashier_management_included
        deposit_management_included
        remittance_management_included
        credit_management_included
        foreign_exchange_management_included
        new_financial_products_management_included
        outsourcing_management_included)))

; [financial_control:credit_cooperative_business_manuals_additional_items] 信用合作社業務規範及處理手冊包括出納、存款、授信、匯兌及委外作業管理
(assert (= credit_cooperative_business_manuals_additional_items
   (and cashier_management_included
        deposit_management_included
        credit_management_included
        remittance_management_included
        outsourcing_management_included)))

; [financial_control:bill_broker_business_manuals_additional_items] 票券商業務規範及處理手冊包括票券、債券及新種金融商品等業務
(assert (= bill_broker_business_manuals_additional_items
   (and bill_business_included
        bond_business_included
        new_financial_products_included)))

; [financial_control:trust_operation_manual_reference] 信託業參考範本訂定作業手冊並定期修訂
(assert (= trust_operation_manual_reference
   (and operation_manual_based_on_template
        operation_manual_updated_periodically)))

; [financial_control:salary_committee_management_included] 股票上市或於證券商營業處所買賣之金融控股公司及銀行業將薪資報酬委員會運作管理納入內部控制制度
(assert (= salary_committee_management_included
   salary_committee_management_included_in_internal_control))

; [financial_control:audit_committee_management_included] 金融控股公司及銀行業設置審計委員會者，內部控制制度包括審計委員會議事運作管理
(assert (= audit_committee_management_included
   (or audit_committee_management_included_in_internal_control
       (not audit_committee_established))))

; [financial_control:subsidiary_control_operations_defined] 金融控股公司及銀行業內部控制制度訂定對子公司必要控制作業
(assert (= subsidiary_control_operations_defined
   control_operations_for_subsidiaries_defined))

; [financial_control:foreign_subsidiary_control_considered] 國外子公司考量當地法令及實際營運性質督促建立內部控制制度
(assert (= foreign_subsidiary_control_considered
   (or (not subsidiary_is_foreign)
       (and local_law_considered
            actual_operation_considered
            foreign_subsidiary_internal_control_established))))

; [financial_control:group_aml_ctf_plan_established] 金融控股公司及銀行業建立集團整體性防制洗錢及打擊資恐計畫
(assert (= group_aml_ctf_plan_established
   (and group_aml_ctf_plan_established
        group_information_sharing_policy_and_procedure_established)))

; [financial_control:policy_and_manual_change_participation] 作業及管理規章訂定、修訂或廢止時法令遵循、內部稽核及風險管理單位參與
(assert (= policy_and_manual_change_participation
   (or (not (or policy_revised policy_abolished policy_established))
       (and legal_compliance_unit_participated
            internal_audit_unit_participated
            risk_management_unit_participated))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：信託業違反本法或命令時處罰
(assert (= penalty penalty_applicable))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= audit_unit_established false))
(assert (= internal_control_established false))
(assert (= internal_control_implementation_according_to_regulation false))
(assert (= violate_law true))
(assert (= violate_order false))
(assert (= violation_of_law_or_order true))
(assert (= exempted_by_other_penalty_provisions false))
(assert (= penalty_applicable true))
(assert (= agent_meets_qualification false))
(assert (= agent_had_major_penalty_last_year false))
(assert (= agent_violation_improved_and_approved false))
(assert (= agent_qualification_ok false))
(assert (= special_account_established false))
(assert (= funds_used_exclusively false))
(assert (= agent_special_account_ok false))
(assert (= duty_of_care_fulfilled false))
(assert (= agent_duty_of_care false))
(assert (= certificate_issued_to_seller false))
(assert (= agent_issuance_of_certificate false))
(assert (= book_entry_handling_according_to_regulation false))
(assert (= agent_book_entry_handling false))
(assert (= internal_control_covers_all_operations false))
(assert (= policies_and_procedures_established false))
(assert (= policies_and_procedures_reviewed_and_updated false))
(assert (= internal_control_coverage false))
(assert (= organization_system_defined false))
(assert (= unit_responsibilities_defined false))
(assert (= business_scope_defined false))
(assert (= authorization_and_hierarchical_responsibility_defined false))
(assert (= internal_control_policies_detail false))
(assert (= investment_guidelines_defined false))
(assert (= customer_data_confidentiality_defined false))
(assert (= related_party_transaction_rules_defined false))
(assert (= equity_management_defined false))
(assert (= financial_statement_preparation_management_defined false))
(assert (= general_affairs_information_personnel_management_defined false))
(assert (= external_information_disclosure_management_defined false))
(assert (= financial_inspection_report_management_defined false))
(assert (= financial_consumer_protection_management_defined false))
(assert (= major_incident_handling_mechanism_defined false))
(assert (= anti_money_laundering_and_counter_terrorism_financing_defined false))
(assert (= other_business_rules_and_procedures_defined false))
(assert (= business_manuals_and_guidelines false))
(assert (= subsidiary_management_and_joint_marketing_included false))
(assert (= subsidiary_and_joint_marketing_management false))
(assert (= cashier_management_included false))
(assert (= deposit_management_included false))
(assert (= remittance_management_included false))
(assert (= credit_management_included false))
(assert (= foreign_exchange_management_included false))
(assert (= new_financial_products_management_included false))
(assert (= outsourcing_management_included false))
(assert (= bank_business_manuals_additional_items false))
(assert (= credit_cooperative_business_manuals_additional_items false))
(assert (= bill_business_included false))
(assert (= bond_business_included false))
(assert (= new_financial_products_included false))
(assert (= bill_broker_business_manuals_additional_items false))
(assert (= operation_manual_based_on_template false))
(assert (= operation_manual_updated_periodically false))
(assert (= trust_operation_manual_reference false))
(assert (= salary_committee_management_included_in_internal_control false))
(assert (= salary_committee_management_included false))
(assert (= audit_committee_established false))
(assert (= audit_committee_management_included_in_internal_control false))
(assert (= audit_committee_management_included false))
(assert (= control_operations_for_subsidiaries_defined false))
(assert (= subsidiary_control_operations_defined false))
(assert (= subsidiary_is_foreign false))
(assert (= local_law_considered false))
(assert (= actual_operation_considered false))
(assert (= foreign_subsidiary_internal_control_established false))
(assert (= foreign_subsidiary_control_considered true))
(assert (= group_aml_ctf_plan_established false))
(assert (= group_information_sharing_policy_and_procedure_established false))
(assert (= policy_established false))
(assert (= policy_revised false))
(assert (= policy_abolished false))
(assert (= legal_compliance_unit_participated false))
(assert (= internal_audit_unit_participated false))
(assert (= risk_management_unit_participated false))
(assert (= policy_and_manual_change_participation true))
(assert (= penalty true))
(assert (= internal_control_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 25
; Total variables: 85
; Total facts: 85
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
