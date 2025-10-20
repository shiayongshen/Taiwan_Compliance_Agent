; SMT2 file generated from compliance case automatic
; Case ID: case_248
; Generated at: 2025-10-19T11:20:04.516167
;
; This file can be executed with Z3:
;   z3 case_248.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const apply_enhanced_measures Bool)
(declare-const apply_pep_measures Bool)
(declare-const authority_defined_scope_and_procedures Bool)
(declare-const bank_violation_penalty Bool)
(declare-const beneficial_owner_reviewed Bool)
(declare-const beneficiary_or_senior_management_in_exempted_categories Bool)
(declare-const consider_influence_and_apply_enhanced_measures_if_needed Bool)
(declare-const consider_suspicious_transaction_reporting Bool)
(declare-const customer_from_high_risk_country Bool)
(declare-const customer_from_high_risk_country_no_effective_measures Bool)
(declare-const customer_identification_data_retention Bool)
(declare-const customer_identification_data_retention_years Int)
(declare-const customer_identification_procedure Bool)
(declare-const customer_identification_scope_defined Bool)
(declare-const customer_info_suspected_false_or_inadequate Bool)
(declare-const customer_info_updated_regularly Bool)
(declare-const customer_or_beneficial_owner_is_domestic_or_international_current_pep Bool)
(declare-const customer_or_beneficial_owner_is_domestic_or_international_current_pep_and_high_risk Bool)
(declare-const customer_or_beneficial_owner_is_foreign_current_pep Bool)
(declare-const customer_or_beneficial_owner_is_pep_or_family_or_close_associate Bool)
(declare-const customer_transaction_or_account_behavior_significant_change Bool)
(declare-const enhanced_due_diligence_executed Bool)
(declare-const enhanced_due_diligence_for_pep Bool)
(declare-const enhanced_identification_measures Bool)
(declare-const enhanced_identification_measures_applied Bool)
(declare-const enhanced_measures_applied Bool)
(declare-const enhanced_measures_for_high_risk Bool)
(declare-const enhanced_measures_for_high_risk_countries Bool)
(declare-const enhanced_ongoing_monitoring Bool)
(declare-const enhanced_review_of_overall_relationship Bool)
(declare-const family_or_close_associates_of_pep Bool)
(declare-const high_risk_customer Bool)
(declare-const high_risk_detected Bool)
(declare-const immediate_access_to_customer_info Bool)
(declare-const insurance_beneficiary_is_corporate_or_trustee_and_high_risk Bool)
(declare-const insurance_high_risk_considered Bool)
(declare-const insurance_pep_verification_and_notification Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const legal_longer_retention_years Int)
(declare-const low_risk_customer Bool)
(declare-const non_current_pep Bool)
(declare-const notify_senior_management_before_payment Bool)
(declare-const ongoing_customer_due_diligence Bool)
(declare-const penalty Bool)
(declare-const pep_exemption_applied Bool)
(declare-const pep_risk_management_applied Bool)
(declare-const pep_verification_before_payment Bool)
(declare-const periodic_customer_data_reviewed Bool)
(declare-const reasonable_measures_to_understand_wealth_and_funds_source Bool)
(declare-const repeat_identification_required Bool)
(declare-const risk_based_approach_applied Bool)
(declare-const risk_based_assessment_for_enhanced_measures Bool)
(declare-const risk_based_strength_applied Bool)
(declare-const risk_review_at_relationship_establishment_and_annually Bool)
(declare-const senior_management_approval_obtained Bool)
(declare-const senior_management_is_pep Bool)
(declare-const simplified_measures_allowed Bool)
(declare-const stored_value_card_named_registration Bool)
(declare-const stored_value_card_named_registration_exemption Bool)
(declare-const suspected_money_laundering_or_terrorist_financing Bool)
(declare-const suspected_money_laundering_or_terrorist_financing_detected Bool)
(declare-const third_party_aml_standards_consistent Bool)
(declare-const third_party_provides_info_without_delay Bool)
(declare-const third_party_regulated_and_monitored Bool)
(declare-const third_party_reliance_compliant Bool)
(declare-const transaction_monitoring_and_funds_source_understood Bool)
(declare-const treat_as_high_risk_and_apply_enhanced_measures Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:customer_identification_procedure] 金融機構及指定非金融事業應進行風險基礎確認客戶身分程序並審查實質受益人
(assert (= customer_identification_procedure
   (and risk_based_approach_applied beneficial_owner_reviewed)))

; [aml:customer_identification_data_retention] 確認客戶身分資料應保存至少五年，依業務關係終止或臨時性交易終止起算
(assert (= customer_identification_data_retention
   (or (<= 5.0 (to_real customer_identification_data_retention_years))
       (>= legal_longer_retention_years
           customer_identification_data_retention_years))))

; [aml:enhanced_customer_due_diligence_for_politically_exposed_persons] 對重要政治性職務人士及其家庭成員及密切關係人應執行加強客戶審查程序
(assert (= enhanced_due_diligence_for_pep
   (or enhanced_due_diligence_executed
       (not customer_or_beneficial_owner_is_pep_or_family_or_close_associate))))

; [aml:customer_identification_scope_and_procedures_defined_by_authority] 確認客戶身分範圍及加強審查範圍程序由主管機關定之
(assert (= customer_identification_scope_defined authority_defined_scope_and_procedures))

; [bank:internal_control_established_and_executed] 銀行建立內部控制及稽核制度且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_established_and_executed] 銀行建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_established_and_executed] 銀行建立內部作業制度及程序且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:violation_penalty_conditions] 銀行違反內部控制、處理或作業制度規定時處罰
(assert (= bank_violation_penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; [aml:customer_identification_risk_based_strength] 確認客戶身分程序應依風險基礎方法決定執行強度
(assert (= risk_based_strength_applied risk_based_approach_applied))

; [aml:enhanced_measures_for_high_risk] 高風險情形應加強確認客戶身分及持續審查措施並採取強化措施
(assert (= enhanced_measures_for_high_risk
   (or (not high_risk_customer)
       (and enhanced_identification_measures
            enhanced_ongoing_monitoring
            senior_management_approval_obtained
            reasonable_measures_to_understand_wealth_and_funds_source))))

; [aml:enhanced_measures_for_high_risk_countries] 來自洗錢或資恐高風險國家或地區之客戶應採取相當強化措施
(assert (= enhanced_measures_for_high_risk_countries
   (or enhanced_measures_applied (not customer_from_high_risk_country))))

; [aml:simplified_measures_for_low_risk] 較低風險情形得採取簡化措施，但特定情形不得簡化
(assert (= simplified_measures_allowed
   (and low_risk_customer
        (not (or customer_from_high_risk_country_no_effective_measures
                 suspected_money_laundering_or_terrorist_financing)))))

; [aml:exemption_for_stored_value_card_named_registration] 辦理儲值卡記名作業不適用高風險強化措施第一款第一目及第二目
(assert (= stored_value_card_named_registration_exemption
   (or (not stored_value_card_named_registration)
       (and (not senior_management_approval_obtained)
            (not reasonable_measures_to_understand_wealth_and_funds_source)))))

; [aml:insurance_high_risk_consideration] 保險業應將人壽保險契約受益人納入強化確認客戶身分措施考量
(assert (= insurance_high_risk_considered
   (or (not insurance_beneficiary_is_corporate_or_trustee_and_high_risk)
       enhanced_identification_measures_applied)))

; [aml:reliance_on_third_party_conditions] 依賴第三方執行確認客戶身分須符合四項規定
(assert (= third_party_reliance_compliant
   (and immediate_access_to_customer_info
        third_party_provides_info_without_delay
        third_party_regulated_and_monitored
        third_party_aml_standards_consistent)))

; [aml:ongoing_customer_due_diligence] 金融機構應依重要性及風險程度持續審查客戶身分資料及交易
(assert (= ongoing_customer_due_diligence
   (and periodic_customer_data_reviewed
        transaction_monitoring_and_funds_source_understood
        customer_info_updated_regularly)))

; [aml:repeat_identification_when_suspicious] 對客戶資訊真實性有疑慮或發現疑似洗錢資恐交易時應重新確認身分
(assert (= repeat_identification_required
   (or suspected_money_laundering_or_terrorist_financing_detected
       customer_info_suspected_false_or_inadequate
       customer_transaction_or_account_behavior_significant_change)))

; [aml:politically_exposed_persons_risk_management] 金融機構應運用風險管理機制確認客戶及其實質受益人、高階管理人員是否為重要政治性職務人士並採取相應措施
(assert (= pep_risk_management_applied
   (and (or (not customer_or_beneficial_owner_is_foreign_current_pep)
            treat_as_high_risk_and_apply_enhanced_measures)
        (or (not customer_or_beneficial_owner_is_domestic_or_international_current_pep)
            risk_review_at_relationship_establishment_and_annually)
        (or apply_enhanced_measures
            (not customer_or_beneficial_owner_is_domestic_or_international_current_pep_and_high_risk))
        (or (not senior_management_is_pep)
            consider_influence_and_apply_enhanced_measures_if_needed)
        (or risk_based_assessment_for_enhanced_measures (not non_current_pep))
        (or apply_pep_measures (not family_or_close_associates_of_pep)))))

; [aml:pep_exemption_for_certain_beneficiaries] 特定對象之實質受益人或高階管理人員為重要政治性職務人士時不適用加強措施
(assert (= pep_exemption_applied
   (or (not beneficiary_or_senior_management_in_exempted_categories)
       (not enhanced_due_diligence_executed))))

; [aml:insurance_pep_verification_and_notification] 保險公司及郵政機構應於給付前辨識保險受益人及實質受益人是否為重要政治性職務人士並通知高階管理人員
(assert (= insurance_pep_verification_and_notification
   (and pep_verification_before_payment
        (or (not high_risk_detected)
            (and notify_senior_management_before_payment
                 enhanced_review_of_overall_relationship
                 consider_suspicious_transaction_reporting)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反洗錢防制法第8條及銀行法第45-1條及第129條第七款規定時處罰
(assert (= penalty
   (or (not internal_operation_ok)
       (not internal_handling_ok)
       (not internal_control_ok)
       (not (and customer_identification_procedure
                 customer_identification_data_retention
                 enhanced_due_diligence_for_pep
                 customer_identification_scope_defined)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= customer_identification_procedure false))
(assert (= beneficial_owner_reviewed false))
(assert (= customer_identification_data_retention true))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established true))
(assert (= internal_operation_executed false))
(assert (= authority_defined_scope_and_procedures true))
(assert (= customer_identification_scope_defined true))
(assert (= bank_violation_penalty true))
(assert (= penalty true))
(assert (= enhanced_due_diligence_for_pep true))
(assert (= enhanced_due_diligence_executed true))
(assert (= risk_based_approach_applied true))
(assert (= risk_based_strength_applied true))
(assert (= customer_info_suspected_false_or_inadequate false))
(assert (= suspected_money_laundering_or_terrorist_financing_detected false))
(assert (= customer_transaction_or_account_behavior_significant_change false))
(assert (= repeat_identification_required false))
(assert (= ongoing_customer_due_diligence false))
(assert (= periodic_customer_data_reviewed false))
(assert (= transaction_monitoring_and_funds_source_understood false))
(assert (= customer_info_updated_regularly false))
(assert (= high_risk_customer false))
(assert (= apply_enhanced_measures false))
(assert (= apply_pep_measures false))
(assert (= beneficiary_or_senior_management_in_exempted_categories false))
(assert (= consider_influence_and_apply_enhanced_measures_if_needed false))
(assert (= consider_suspicious_transaction_reporting false))
(assert (= customer_from_high_risk_country false))
(assert (= customer_from_high_risk_country_no_effective_measures false))
(assert (= enhanced_measures_applied false))
(assert (= enhanced_identification_measures false))
(assert (= enhanced_identification_measures_applied false))
(assert (= enhanced_measures_for_high_risk false))
(assert (= enhanced_measures_for_high_risk_countries false))
(assert (= enhanced_ongoing_monitoring false))
(assert (= family_or_close_associates_of_pep false))
(assert (= high_risk_detected false))
(assert (= immediate_access_to_customer_info false))
(assert (= insurance_beneficiary_is_corporate_or_trustee_and_high_risk false))
(assert (= insurance_high_risk_considered false))
(assert (= insurance_pep_verification_and_notification false))
(assert (= internal_control_ok false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_ok false))
(assert (= legal_longer_retention_years 5))
(assert (= customer_identification_data_retention_years 5))
(assert (= low_risk_customer false))
(assert (= non_current_pep false))
(assert (= notify_senior_management_before_payment false))
(assert (= pep_exemption_applied false))
(assert (= pep_risk_management_applied false))
(assert (= pep_verification_before_payment false))
(assert (= reasonable_measures_to_understand_wealth_and_funds_source false))
(assert (= risk_based_assessment_for_enhanced_measures false))
(assert (= risk_review_at_relationship_establishment_and_annually false))
(assert (= senior_management_approval_obtained false))
(assert (= senior_management_is_pep false))
(assert (= simplified_measures_allowed false))
(assert (= stored_value_card_named_registration false))
(assert (= stored_value_card_named_registration_exemption false))
(assert (= suspected_money_laundering_or_terrorist_financing false))
(assert (= third_party_aml_standards_consistent false))
(assert (= third_party_provides_info_without_delay false))
(assert (= third_party_regulated_and_monitored false))
(assert (= third_party_reliance_compliant false))
(assert (= treat_as_high_risk_and_apply_enhanced_measures false))
(assert (= customer_or_beneficial_owner_is_domestic_or_international_current_pep false))
(assert (= customer_or_beneficial_owner_is_domestic_or_international_current_pep_and_high_risk false))
(assert (= customer_or_beneficial_owner_is_foreign_current_pep false))
(assert (= customer_or_beneficial_owner_is_pep_or_family_or_close_associate false))
(assert (= enhanced_review_of_overall_relationship false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 75
; Total facts: 75
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
