; SMT2 file generated from compliance case automatic
; Case ID: case_115
; Generated at: 2025-10-19T08:24:14.051097
;
; This file can be executed with Z3:
;   z3 case_115.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_and_guarantee Bool)
(declare-const agent_management_rules_defined Bool)
(declare-const agent_management_rules_defined_by_authority Bool)
(declare-const agent_type Int)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permit_obtained Bool)
(declare-const bank_permitted_to_operate_agent_or_broker Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_client_understanding_and_report_ok Bool)
(declare-const broker_company_shareholding_ratio Real)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_document_retention_ok Bool)
(declare-const broker_duty_and_disclosure_ok Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_exercise_fidelity Bool)
(declare-const broker_internal_operation_ok Bool)
(declare-const broker_obtain_contact_info_ok Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_shareholding_info_disclosed Bool)
(declare-const broker_written_report_and_fee_disclosed Bool)
(declare-const client_basic_info_understood Bool)
(declare-const client_needs_and_risk_understood Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const correction_ordered Bool)
(declare-const documents_retained Bool)
(declare-const fine_imposed Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_minimum_amount Real)
(declare-const guarantee_minimum_amount_defined Bool)
(declare-const guarantee_minimum_amount_defined_by_authority Bool)
(declare-const insurance_company_shareholding_ratio Real)
(declare-const insurance_policy_is_electronic Bool)
(declare-const insurance_product_main_content_explained Bool)
(declare-const insurance_rights_and_obligations_disclosed Bool)
(declare-const insured_email_obtained Bool)
(declare-const insured_interest_maintained Bool)
(declare-const insured_mobile_phone_obtained Bool)
(declare-const insured_other_contact_obtained Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_spec_defined Bool)
(declare-const license_permitted Bool)
(declare-const license_revoked Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const related_insurance_is_guarantee Bool)
(declare-const related_insurance_is_liability Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_correct Bool)
(declare-const senior_consumer_protection_included Bool)
(declare-const shareholding_info_disclosed Bool)
(declare-const violate_article_163_5 Bool)
(declare-const violate_article_165_1 Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violation_financial_or_business_management_rules Bool)
(declare-const violation_penalty_imposed Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_license_and_guarantee
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        related_insurance_purchased
        practice_certificate_held)))

; [insurance:related_insurance_type] 相關保險類型依代理人、公證人、經紀人區分
(assert (= related_insurance_type_correct
   (or (and (= 1 agent_type) related_insurance_is_liability)
       (and (= 3 agent_type) related_insurance_is_liability)
       (and (= 2 agent_type)
            related_insurance_is_liability
            related_insurance_is_guarantee))))

; [insurance:guarantee_minimum_amount_defined] 保證金及相關保險最低金額及實施方式由主管機關定之
(assert (= guarantee_minimum_amount_defined
   guarantee_minimum_amount_defined_by_authority))

; [insurance:agent_management_rules_defined] 保險代理人、經紀人、公證人資格取得、申請許可條件、程序等管理規則由主管機關定之
(assert (= agent_management_rules_defined agent_management_rules_defined_by_authority))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_operate_agent_or_broker
   (and bank_permit_obtained (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_exercise_fidelity)))

; [insurance:broker_provide_written_analysis_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_written_report_and_fee_disclosed
   (and broker_provide_written_report
        (or broker_disclose_fee_standard (not broker_charge_fee)))))

; [insurance:violation_financial_or_business_management_rules] 違反保險法第163條第四項管理規則中財務或業務管理規定、同條第七項規定，或違反第165條第一項或第163條第五項準用規定
(assert (= violation_financial_or_business_management_rules
   (or violate_article_165_1
       violate_article_163_5
       violate_business_management_rules
       violate_financial_management_rules)))

; [insurance:violation_penalty_imposed] 違反規定者應限期改正或處罰鍰，情節重大者廢止許可並註銷執業證照
(assert (= violation_penalty_imposed
   (or fine_imposed
       (not violation_financial_or_business_management_rules)
       correction_ordered
       license_revoked)))

; [insurance:broker_duty_of_care_and_fidelity_maintain_insured_interest] 經紀人應盡善良管理人注意及忠實義務，維護被保險人利益，充分說明保險商品主要內容與權利義務
(assert (= broker_duty_and_disclosure_ok
   (and broker_exercise_duty_of_care
        broker_exercise_fidelity
        insured_interest_maintained
        insurance_product_main_content_explained
        insurance_rights_and_obligations_disclosed)))

; [insurance:broker_document_retention] 個人執業經紀人、經紀人公司及銀行應留存相關文件備查
(assert (= broker_document_retention_ok documents_retained))

; [insurance:broker_obtain_contact_info_for_e_policy] 招攬保險業務以電子保單出單者，應取得要保人及被保險人聯絡方式並提供保險人
(assert (= broker_obtain_contact_info_ok
   (or (not insurance_policy_is_electronic)
       (and insured_mobile_phone_obtained
            insured_email_obtained
            insured_other_contact_obtained
            contact_info_provided_to_insurer))))

; [insurance:broker_internal_operation_spec_and_execution] 經紀人公司及銀行應訂定內部作業規範並落實執行，包含保障65歲以上高齡消費者投保權益規定
(assert (= broker_internal_operation_ok
   (and internal_operation_spec_defined
        internal_operation_executed
        senior_consumer_protection_included)))

; [insurance:broker_understand_client_and_provide_report_before_contract] 經紀人洽訂保險契約前應充分瞭解要保人及被保險人基本資料、需求及風險屬性，並依主管機關規定主動提供書面分析報告，收費前明確告知報酬標準
(assert (= broker_client_understanding_and_report_ok
   (and client_basic_info_understood
        client_needs_and_risk_understood
        written_analysis_report_provided
        (or broker_disclose_fee_standard (not broker_charge_fee)))))

; [insurance:broker_disclose_shareholding_info_before_contract] 經紀人公司或銀行持有保險公司超過10%表決權股份，或反之，應於洽訂保險契約前揭露該資訊
(assert (let ((a!1 (not (or (not (<= broker_company_shareholding_ratio 10.0))
                    (not (<= insurance_company_shareholding_ratio 10.0))))))
  (= broker_shareholding_info_disclosed (or a!1 shareholding_info_disclosed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險投保、執業證照規定或違反管理規則財務業務管理規定時處罰
(assert (= penalty
   (or (not broker_shareholding_info_disclosed)
       (not related_insurance_type_correct)
       (not agent_management_rules_defined)
       (not broker_client_understanding_and_report_ok)
       violation_financial_or_business_management_rules
       (not guarantee_minimum_amount_defined)
       (not broker_obtain_contact_info_ok)
       (not agent_license_and_guarantee)
       (not broker_internal_operation_ok)
       (not broker_written_report_and_fee_disclosed)
       (not broker_duty_and_disclosure_ok)
       (not broker_document_retention_ok)
       (not broker_duty_of_care_and_fidelity))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted true))
(assert (= guarantee_deposit_amount 1000000.0))
(assert (= guarantee_minimum_amount 1000000.0))
(assert (= guarantee_minimum_amount_defined_by_authority true))
(assert (= agent_management_rules_defined_by_authority true))
(assert (= agent_management_rules_defined true))
(assert (= agent_type 2))
(assert (= related_insurance_is_liability true))
(assert (= related_insurance_is_guarantee true))
(assert (= related_insurance_purchased true))
(assert (= practice_certificate_held true))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_exercise_fidelity false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_provide_written_report true))
(assert (= broker_charge_fee false))
(assert (= broker_disclose_fee_standard true))
(assert (= broker_written_report_and_fee_disclosed true))
(assert (= violate_financial_management_rules false))
(assert (= violate_business_management_rules true))
(assert (= violate_article_165_1 false))
(assert (= violate_article_163_5 false))
(assert (= violation_financial_or_business_management_rules true))
(assert (= correction_ordered true))
(assert (= fine_imposed true))
(assert (= license_revoked false))
(assert (= violation_penalty_imposed true))
(assert (= broker_duty_and_disclosure_ok false))
(assert (= insured_interest_maintained false))
(assert (= insurance_product_main_content_explained false))
(assert (= insurance_rights_and_obligations_disclosed false))
(assert (= documents_retained true))
(assert (= broker_document_retention_ok true))
(assert (= insurance_policy_is_electronic false))
(assert (= insured_mobile_phone_obtained true))
(assert (= insured_email_obtained true))
(assert (= insured_other_contact_obtained true))
(assert (= contact_info_provided_to_insurer true))
(assert (= broker_obtain_contact_info_ok true))
(assert (= internal_operation_spec_defined true))
(assert (= internal_operation_executed false))
(assert (= senior_consumer_protection_included true))
(assert (= broker_internal_operation_ok false))
(assert (= client_basic_info_understood false))
(assert (= client_needs_and_risk_understood false))
(assert (= written_analysis_report_provided true))
(assert (= broker_client_understanding_and_report_ok false))
(assert (= broker_company_shareholding_ratio 0.0))
(assert (= insurance_company_shareholding_ratio 0.0))
(assert (= shareholding_info_disclosed true))
(assert (= broker_shareholding_info_disclosed true))
(assert (= penalty true))
(assert (= bank_permit_obtained false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= bank_permitted_to_operate_agent_or_broker false))
(assert (= agent_license_and_guarantee false))
(assert (= related_insurance_type_correct false))
(assert (= guarantee_minimum_amount_defined false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 59
; Total facts: 59
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
