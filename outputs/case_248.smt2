; SMT2 file generated from compliance case automatic
; Case ID: case_248
; Generated at: 2025-10-21T05:29:04.740483
;
; This file can be executed with Z3:
;   z3 case_248.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const beneficial_owner_reviewed Bool)
(declare-const beneficiary_is_high_risk Bool)
(declare-const customer_high_risk Bool)
(declare-const customer_identification_data_retention Bool)
(declare-const customer_identification_procedure Bool)
(declare-const customer_is_pep_or_related Bool)
(declare-const customer_or_beneficial_owner_in_exclusion_list Bool)
(declare-const customer_reverification_performed Bool)
(declare-const data_retention_years Int)
(declare-const enhanced_due_diligence_executed Bool)
(declare-const enhanced_due_diligence_pep Bool)
(declare-const enhanced_measures_high_risk Bool)
(declare-const enhanced_ongoing_monitoring Bool)
(declare-const enhanced_overall_business_relationship_review Bool)
(declare-const high_risk_beneficiary_detected Bool)
(declare-const immediate_access_to_info Bool)
(declare-const information_updated_regularly Bool)
(declare-const insurance_beneficiary_risk_considered Bool)
(declare-const insurance_high_risk_beneficiary_measures Bool)
(declare-const insurance_high_risk_beneficiary_notification Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const legal_minimum_retention_years Int)
(declare-const ongoing_customer_due_diligence Bool)
(declare-const penalty Bool)
(declare-const pep_exclusion_applied Bool)
(declare-const periodic_review_based_on_risk Bool)
(declare-const reasonable_measures_to_identify_beneficial_owner Bool)
(declare-const reasonable_measures_to_understand_wealth_and_funds_source Bool)
(declare-const risk_based_approach_applied Bool)
(declare-const senior_management_approval_obtained Bool)
(declare-const senior_management_notified Bool)
(declare-const suspicious_or_significant_change_detected Bool)
(declare-const third_party_aml_standards_consistent Bool)
(declare-const third_party_provides_info_without_delay Bool)
(declare-const third_party_regulated_and_monitored Bool)
(declare-const third_party_reliance_compliant Bool)
(declare-const transaction_monitoring_and_funds_source_understood Bool)
(declare-const verification_of_beneficial_owner_identity Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:customer_identification_procedure] 金融機構及指定非金融事業應以風險為基礎執行確認客戶身分程序並審查實質受益人
(assert (= customer_identification_procedure
   (and risk_based_approach_applied beneficial_owner_reviewed)))

; [aml:customer_identification_data_retention] 確認客戶身分資料應保存至少五年，除法律另有較長保存期間
(assert (= customer_identification_data_retention
   (or (<= 5.0 (to_real data_retention_years))
       (<= 5.0 (to_real legal_minimum_retention_years)))))

; [aml:enhanced_customer_due_diligence_for_politically_exposed_persons] 對重要政治性職務人士及其家庭成員及密切關係人應以風險為基礎執行加強客戶審查程序
(assert (= enhanced_due_diligence_pep
   (or (not customer_is_pep_or_related) enhanced_due_diligence_executed)))

; [aml:reliance_on_third_party_requirements] 依賴第三方執行確認客戶身分時應符合規定並負最終責任
(assert (= third_party_reliance_compliant
   (and immediate_access_to_info
        third_party_provides_info_without_delay
        third_party_regulated_and_monitored
        third_party_aml_standards_consistent)))

; [aml:ongoing_customer_due_diligence] 金融機構應依重要性及風險程度持續審查客戶身分資料及交易
(assert (= ongoing_customer_due_diligence
   (and periodic_review_based_on_risk
        transaction_monitoring_and_funds_source_understood
        information_updated_regularly
        (or (not suspicious_or_significant_change_detected)
            customer_reverification_performed))))

; [aml:enhanced_measures_for_high_risk] 高風險客戶應採取第六條第一項第一款各目之強化確認客戶身分措施
(assert (= enhanced_measures_high_risk
   (or (not customer_high_risk)
       (and senior_management_approval_obtained
            reasonable_measures_to_understand_wealth_and_funds_source
            enhanced_ongoing_monitoring))))

; [aml:exclusion_for_specific_pep_categories] 特定實質受益人或高階管理人員為重要政治性職務人士時不適用加強審查規定
(assert (= pep_exclusion_applied
   (or (not customer_or_beneficial_owner_in_exclusion_list)
       (not enhanced_due_diligence_executed))))

; [aml:insurance_consideration_for_beneficiaries] 保險業應將人壽保險契約受益人納入強化確認客戶身分措施考量
(assert (= insurance_beneficiary_risk_considered
   (or (not beneficiary_is_high_risk) enhanced_due_diligence_executed)))

; [aml:insurance_high_risk_beneficiary_measures] 對高風險人壽保險受益人採取合理措施辨識及驗證實質受益人身分
(assert (= insurance_high_risk_beneficiary_measures
   (and reasonable_measures_to_identify_beneficial_owner
        verification_of_beneficial_owner_identity)))

; [aml:insurance_high_risk_beneficiary_notification] 發現高風險情形應通知高階管理人員並強化審查
(assert (= insurance_high_risk_beneficiary_notification
   (or (not high_risk_beneficiary_detected)
       (and senior_management_notified
            enhanced_overall_business_relationship_review))))

; [bank:internal_control_established_and_executed] 銀行建立內部控制及稽核制度且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_established_and_executed] 銀行建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_established_and_executed] 銀行建立內部作業制度及程序且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反洗錢防制法及銀行法相關規定時處罰
(assert (= penalty
   (or (not internal_operation_ok)
       (not internal_handling_ok)
       (not customer_identification_data_retention)
       (not customer_identification_procedure)
       (not enhanced_due_diligence_pep)
       (not third_party_reliance_compliant)
       (not ongoing_customer_due_diligence)
       (not enhanced_measures_high_risk)
       (not internal_control_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= risk_based_approach_applied false))
(assert (= beneficial_owner_reviewed false))
(assert (= customer_identification_procedure false))
(assert (= customer_identification_data_retention true))
(assert (= data_retention_years 5))
(assert (= legal_minimum_retention_years 5))
(assert (= customer_is_pep_or_related false))
(assert (= enhanced_due_diligence_executed false))
(assert (= enhanced_due_diligence_pep false))
(assert (= customer_high_risk false))
(assert (= enhanced_measures_high_risk false))
(assert (= senior_management_approval_obtained false))
(assert (= reasonable_measures_to_understand_wealth_and_funds_source false))
(assert (= enhanced_ongoing_monitoring false))
(assert (= customer_or_beneficial_owner_in_exclusion_list false))
(assert (= pep_exclusion_applied false))
(assert (= third_party_reliance_compliant true))
(assert (= immediate_access_to_info true))
(assert (= third_party_provides_info_without_delay true))
(assert (= third_party_regulated_and_monitored true))
(assert (= third_party_aml_standards_consistent true))
(assert (= ongoing_customer_due_diligence false))
(assert (= periodic_review_based_on_risk false))
(assert (= transaction_monitoring_and_funds_source_understood false))
(assert (= information_updated_regularly false))
(assert (= suspicious_or_significant_change_detected false))
(assert (= customer_reverification_performed false))
(assert (= insurance_beneficiary_risk_considered false))
(assert (= beneficiary_is_high_risk false))
(assert (= insurance_high_risk_beneficiary_measures false))
(assert (= reasonable_measures_to_identify_beneficial_owner false))
(assert (= verification_of_beneficial_owner_identity false))
(assert (= high_risk_beneficiary_detected false))
(assert (= insurance_high_risk_beneficiary_notification false))
(assert (= senior_management_notified false))
(assert (= enhanced_overall_business_relationship_review false))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established true))
(assert (= internal_operation_executed false))
(assert (= internal_control_ok false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_ok false))
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
; Total variables: 46
; Total facts: 46
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
