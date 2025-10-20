; SMT2 file generated from compliance case automatic
; Case ID: case_88
; Generated at: 2025-10-19T07:41:06.647884
;
; This file can be executed with Z3:
;   z3 case_88.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_not_permitted_without_license_and_guarantee Bool)
(declare-const applicant_email Bool)
(declare-const applicant_mobile_phone Bool)
(declare-const applicant_other_contact Bool)
(declare-const application_date Int)
(declare-const authority_exemption Bool)
(declare-const authorize_others_to_operate_or_execute Bool)
(declare-const bank_license_permitted Bool)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permitted_to_operate_agent_or_broker Bool)
(declare-const broker_and_agent_duty_of_care_and_fidelity Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_company_and_bank_must_establish_internal_procedures Bool)
(declare-const broker_company_capital_adjustment_required Bool)
(declare-const broker_company_capital_paid_in_cash Bool)
(declare-const broker_company_capital_requirements Real)
(declare-const broker_company_shareholding_ratio Real)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_exercise_fidelity Bool)
(declare-const broker_must_disclose_shareholding_info_before_contract Bool)
(declare-const broker_must_obtain_contact_info_for_e_policy Bool)
(declare-const broker_must_provide_written_analysis_and_disclose_fee Bool)
(declare-const broker_must_understand_client_and_provide_written_report_before_contract Bool)
(declare-const broker_must_understand_client_needs_and_suitability Bool)
(declare-const broker_provide_written_analysis_report Bool)
(declare-const business_type Int)
(declare-const capital_adjustment_days_after_transfer Int)
(declare-const capital_paid_in_cash Bool)
(declare-const charge_fee Bool)
(declare-const charge_illegal_fees_or_commissions Bool)
(declare-const coerce_or_induce_or_restrict_contracting_freedom Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const contract_with_unregistered_insurer Bool)
(declare-const criminal_conviction_for_fraud_or_forgery Bool)
(declare-const disclose_fee_standard Bool)
(declare-const disclose_shareholding_info Bool)
(declare-const employ_unqualified_insurance_recruiters Bool)
(declare-const equity_or_capital_transfer_ratio Real)
(declare-const exercise_duty_of_care Bool)
(declare-const exercise_fidelity Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_suitability_for_seniors Bool)
(declare-const fail_to_fill_recruitment_report_truthfully Bool)
(declare-const fail_to_reappoint_broker_after_resignation Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_or_incomplete_business_or_financial_reports Bool)
(declare-const false_report_on_license_application Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_minimum_amount Real)
(declare-const guarantee_minimum_amount_defined_by_authority Real)
(declare-const guarantee_minimum_amount_set_by_authority Real)
(declare-const has_guarantee_insurance Bool)
(declare-const has_liability_insurance Bool)
(declare-const has_practice_certificate Bool)
(declare-const hold_positions_in_insurance_or_association Bool)
(declare-const illegal_insurance_claims Bool)
(declare-const induce_clients_to_terminate_contracts_or_loan Bool)
(declare-const induce_policyholder_to_cancel_or_transfer_or_loan Bool)
(declare-const insurance_company_shareholding_ratio Real)
(declare-const insurance_policy_is_electronic Bool)
(declare-const insured_email Bool)
(declare-const insured_mobile_phone Bool)
(declare-const insured_other_contact Bool)
(declare-const internal_procedures_established_and_executed Bool)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const license_permitted Bool)
(declare-const life_insurance_documents_retained Bool)
(declare-const maintain_documentation Bool)
(declare-const management_rules_defined_by_authority Bool)
(declare-const misappropriate_insurance_funds Bool)
(declare-const misleading_promotion_or_recruitment Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_recruiters Bool)
(declare-const penalty Bool)
(declare-const permit_others_to_use_license Bool)
(declare-const prohibited_behaviors_for_broker_and_agent Bool)
(declare-const property_insurance_documents_retained Bool)
(declare-const provide_contact_info_to_insurer Bool)
(declare-const provide_sufficient_explanation_and_disclosure Bool)
(declare-const provide_written_analysis_report Bool)
(declare-const qualification_and_management_rules_defined Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const required_documents_for_property_and_life_insurance Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const transfer_application_documents_without_consent Bool)
(declare-const transfer_due_to_inheritance Bool)
(declare-const unauthorized_suspend_or_resume_or_terminate_business Bool)
(declare-const unauthorized_use_of_insurance_advertisement Bool)
(declare-const understand_client_basic_info_and_risk Bool)
(declare-const understand_client_needs_and_suitability_signed Bool)
(declare-const violate_article_163_5 Bool)
(declare-const violate_article_165_1 Bool)
(declare-const violate_broker_duty_rules Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violation_financial_or_business_management_or_broker_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_not_permitted_without_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_broker_not_permitted_without_license_and_guarantee
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        relevant_insurance_covered
        has_practice_certificate)))

; [insurance:relevant_insurance_covered] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= relevant_insurance_covered
   (or (and is_agent is_notary has_liability_insurance)
       (and is_broker has_liability_insurance has_guarantee_insurance))))

; [insurance:guarantee_minimum_amount_set_by_authority] 保證金最低金額及實施方式由主管機關依經營業務範圍及規模定之
(assert (= guarantee_minimum_amount_set_by_authority
   (ite (= guarantee_minimum_amount_defined_by_authority 1.0) 1.0 0.0)))

; [insurance:qualification_and_management_rules_defined] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= qualification_and_management_rules_defined
   management_rules_defined_by_authority))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_operate_agent_or_broker
   (and bank_license_permitted (or bank_operate_agent bank_operate_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_exercise_fidelity)))

; [insurance:broker_must_provide_written_analysis_and_disclose_fee] 保險經紀人洽訂保險契約前，於主管機關指定範圍內，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_must_provide_written_analysis_and_disclose_fee
   (and broker_provide_written_analysis_report
        (or (not broker_charge_fee) broker_disclose_fee_standard))))

; [insurance:violation_financial_or_business_management_or_broker_rules] 違反保險法第163條第4項管理規則中財務或業務管理規定、第163條第7項規定，或第165條第1項及第163條第5項準用規定者，應限期改正或處罰
(assert (= violation_financial_or_business_management_or_broker_rules
   (or violate_article_165_1
       violate_broker_duty_rules
       violate_business_management_rules
       violate_article_163_5
       violate_financial_management_rules)))

; [insurance:broker_company_capital_requirements] 經紀人公司最低實收資本額依申請業務類型及修正時間規定
(assert (let ((a!1 (or (and (not (<= 20170303 application_date)) (= 2 business_type))
               (and (not (<= 20170303 application_date)) (= 3 business_type))))
      (a!2 (ite (or (and (<= 20170303 application_date) (= 1 business_type))
                    (and (<= 20170303 application_date) (= 2 business_type)))
                20000000
                (ite (and (<= 20170303 application_date) (= 3 business_type))
                     30000000
                     0))))
(let ((a!3 (ite (and (not (<= 20170303 application_date)) (= 1 business_type))
                5000000
                (ite a!1 10000000 a!2))))
  (= broker_company_capital_requirements (to_real a!3)))))

; [insurance:broker_company_capital_adjustment_required] 已領有執業證照之經紀人公司於股權或資本總額移轉累計達50%以上時，應於交割日次日起6個月內完成資本額調整（繼承除外）
(assert (let ((a!1 (or (not (and (<= 50.0 equity_or_capital_transfer_ratio)
                         (not transfer_due_to_inheritance)))
               (>= 180 capital_adjustment_days_after_transfer))))
  (= broker_company_capital_adjustment_required a!1)))

; [insurance:broker_company_capital_paid_in_cash] 經紀人公司發起人及股東出資以現金為限
(assert (= broker_company_capital_paid_in_cash capital_paid_in_cash))

; [insurance:prohibited_behaviors_for_broker_and_agent] 個人執業經紀人、經紀人公司、銀行及受任用經紀人不得有違反規定之行為
(assert (not (= (or hold_positions_in_insurance_or_association
            pay_commission_to_non_actual_recruiters
            illegal_insurance_claims
            induce_clients_to_terminate_contracts_or_loan
            fail_to_cancel_license_within_deadline
            false_report_on_license_application
            coerce_or_induce_or_restrict_contracting_freedom
            unauthorized_suspend_or_resume_or_terminate_business
            fail_to_fill_recruitment_report_truthfully
            sell_unapproved_foreign_policy_discount_products
            contract_with_unregistered_insurer
            fail_to_reappoint_broker_after_resignation
            fail_to_report_to_broker_association
            authorize_others_to_operate_or_execute
            operate_outside_license_scope
            false_or_incomplete_business_or_financial_reports
            employ_unqualified_insurance_recruiters
            spread_false_information_disturb_financial_order
            permit_others_to_use_license
            criminal_conviction_for_fraud_or_forgery
            other_violations_of_rules_or_laws
            transfer_application_documents_without_consent
            induce_policyholder_to_cancel_or_transfer_or_loan
            misappropriate_insurance_funds
            misleading_promotion_or_recruitment
            conceal_important_contract_info
            charge_illegal_fees_or_commissions
            fail_to_confirm_suitability_for_seniors
            other_behaviors_damaging_insurance_image
            unauthorized_use_of_insurance_advertisement)
        prohibited_behaviors_for_broker_and_agent)))

; [insurance:broker_and_agent_duty_of_care_and_fidelity] 個人執業經紀人、經紀人公司及銀行執行業務時應盡善良管理人注意及忠實義務，維護被保險人利益，充分說明及揭露資訊
(assert (= broker_and_agent_duty_of_care_and_fidelity
   (and exercise_duty_of_care
        exercise_fidelity
        maintain_documentation
        provide_sufficient_explanation_and_disclosure)))

; [insurance:broker_must_obtain_contact_info_for_e_policy] 保險人以電子保單出單時，經紀人應取得要保人及被保險人聯絡方式並提供保險人
(assert (= broker_must_obtain_contact_info_for_e_policy
   (or (not insurance_policy_is_electronic)
       (and (or applicant_mobile_phone applicant_email applicant_other_contact)
            (or insured_mobile_phone insured_other_contact insured_email)
            provide_contact_info_to_insurer))))

; [insurance:broker_company_and_bank_must_establish_internal_procedures] 經紀人公司及銀行應依法令及主管機關規定訂定內部作業規範並落實執行，包含保障65歲以上高齡消費者權益
(assert (= broker_company_and_bank_must_establish_internal_procedures
   internal_procedures_established_and_executed))

; [insurance:broker_must_understand_client_and_provide_written_report_before_contract] 經紀人洽訂保險契約前應充分了解要保人及被保險人基本資料、需求及風險屬性，並依主管機關規定主動提供書面分析報告，收費前應明確告知收費標準
(assert (= broker_must_understand_client_and_provide_written_report_before_contract
   (and understand_client_basic_info_and_risk
        provide_written_analysis_report
        (or (not charge_fee) disclose_fee_standard))))

; [insurance:broker_must_disclose_shareholding_info_before_contract] 經紀人公司或銀行持有單一保險公司表決權股份超過10%或反之，洽訂保險契約前應向要保人揭露
(assert (= broker_must_disclose_shareholding_info_before_contract
   (or (and (<= 10.0 broker_company_shareholding_ratio)
            disclose_shareholding_info)
       (and (<= 10.0 insurance_company_shareholding_ratio)
            disclose_shareholding_info))))

; [insurance:broker_must_understand_client_needs_and_suitability] 個人執業經紀人、經紀人公司及銀行應確實瞭解要保人需求及商品適合度，並於文件簽章或電子方式完成
(assert (= broker_must_understand_client_needs_and_suitability
   (or authority_exemption understand_client_needs_and_suitability_signed)))

; [insurance:required_documents_for_property_and_life_insurance] 財產保險及人身保險應留存指定文件
(assert (= required_documents_for_property_and_life_insurance
   (and property_insurance_documents_retained life_insurance_documents_retained)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險投保、執業證照規定，或違反管理規則財務業務管理規定，或有禁止行為時處罰
(assert (= penalty
   (or violation_financial_or_business_management_or_broker_rules
       (not agent_broker_not_permitted_without_license_and_guarantee)
       (not prohibited_behaviors_for_broker_and_agent))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= has_practice_certificate false))
(assert (= broker_company_capital_requirements 5000000.0))
(assert (= application_date 20170624))
(assert (= business_type 1))
(assert (= broker_company_capital_adjustment_required false))
(assert (= equity_or_capital_transfer_ratio 0.0))
(assert (= transfer_due_to_inheritance false))
(assert (= capital_adjustment_days_after_transfer 0))
(assert (= capital_paid_in_cash true))
(assert (= violate_financial_management_rules true))
(assert (= violate_business_management_rules false))
(assert (= violate_broker_duty_rules false))
(assert (= violate_article_165_1 false))
(assert (= violate_article_163_5 false))
(assert (= violation_financial_or_business_management_or_broker_rules true))
(assert (= fail_to_cancel_license_within_deadline true))
(assert (= prohibited_behaviors_for_broker_and_agent false))
(assert (= agent_broker_not_permitted_without_license_and_guarantee false))
(assert (= relevant_insurance_covered false))
(assert (= is_broker true))
(assert (= has_liability_insurance false))
(assert (= has_guarantee_insurance false))
(assert (= applicant_email false))
(assert (= applicant_mobile_phone false))
(assert (= applicant_other_contact false))
(assert (= authority_exemption false))
(assert (= authorize_others_to_operate_or_execute false))
(assert (= bank_license_permitted false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= bank_permitted_to_operate_agent_or_broker false))
(assert (= broker_and_agent_duty_of_care_and_fidelity false))
(assert (= broker_charge_fee false))
(assert (= broker_company_and_bank_must_establish_internal_procedures false))
(assert (= broker_company_capital_paid_in_cash false))
(assert (= broker_company_shareholding_ratio 0.0))
(assert (= broker_disclose_fee_standard false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_exercise_fidelity false))
(assert (= broker_must_disclose_shareholding_info_before_contract false))
(assert (= broker_must_obtain_contact_info_for_e_policy false))
(assert (= broker_must_provide_written_analysis_and_disclose_fee false))
(assert (= broker_must_understand_client_and_provide_written_report_before_contract false))
(assert (= broker_must_understand_client_needs_and_suitability false))
(assert (= broker_provide_written_analysis_report false))
(assert (= charge_fee false))
(assert (= charge_illegal_fees_or_commissions false))
(assert (= coerce_or_induce_or_restrict_contracting_freedom false))
(assert (= conceal_important_contract_info false))
(assert (= contract_with_unregistered_insurer false))
(assert (= criminal_conviction_for_fraud_or_forgery false))
(assert (= disclose_fee_standard false))
(assert (= disclose_shareholding_info false))
(assert (= employ_unqualified_insurance_recruiters false))
(assert (= exercise_duty_of_care false))
(assert (= exercise_fidelity false))
(assert (= fail_to_confirm_suitability_for_seniors false))
(assert (= fail_to_fill_recruitment_report_truthfully false))
(assert (= fail_to_reappoint_broker_after_resignation false))
(assert (= fail_to_report_to_broker_association false))
(assert (= false_or_incomplete_business_or_financial_reports false))
(assert (= false_report_on_license_application false))
(assert (= guarantee_deposit_amount 0.0))
(assert (= guarantee_minimum_amount 0.0))
(assert (= guarantee_minimum_amount_defined_by_authority 0.0))
(assert (= guarantee_minimum_amount_set_by_authority 0.0))
(assert (= hold_positions_in_insurance_or_association false))
(assert (= illegal_insurance_claims false))
(assert (= induce_clients_to_terminate_contracts_or_loan false))
(assert (= induce_policyholder_to_cancel_or_transfer_or_loan false))
(assert (= insurance_company_shareholding_ratio 0.0))
(assert (= insurance_policy_is_electronic false))
(assert (= insured_email false))
(assert (= insured_mobile_phone false))
(assert (= insured_other_contact false))
(assert (= internal_procedures_established_and_executed false))
(assert (= is_agent false))
(assert (= is_notary false))
(assert (= life_insurance_documents_retained false))
(assert (= maintain_documentation false))
(assert (= management_rules_defined_by_authority false))
(assert (= misappropriate_insurance_funds false))
(assert (= misleading_promotion_or_recruitment false))
(assert (= operate_outside_license_scope false))
(assert (= other_behaviors_damaging_insurance_image false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= pay_commission_to_non_actual_recruiters false))
(assert (= penalty false))
(assert (= permit_others_to_use_license false))
(assert (= property_insurance_documents_retained false))
(assert (= provide_contact_info_to_insurer false))
(assert (= provide_sufficient_explanation_and_disclosure false))
(assert (= provide_written_analysis_report false))
(assert (= qualification_and_management_rules_defined false))
(assert (= required_documents_for_property_and_life_insurance false))
(assert (= sell_unapproved_foreign_policy_discount_products false))
(assert (= spread_false_information_disturb_financial_order false))
(assert (= transfer_application_documents_without_consent false))
(assert (= unauthorized_suspend_or_resume_or_terminate_business false))
(assert (= unauthorized_use_of_insurance_advertisement false))
(assert (= understand_client_basic_info_and_risk false))
(assert (= understand_client_needs_and_suitability_signed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 104
; Total facts: 104
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
