; SMT2 file generated from compliance case automatic
; Case ID: case_247
; Generated at: 2025-10-21T05:27:21.455330
;
; This file can be executed with Z3:
;   z3 case_247.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const beneficial_owner_reviewed Bool)
(declare-const control_procedures_established Bool)
(declare-const currency_transaction_reported Bool)
(declare-const customer_identification_compliance Bool)
(declare-const customer_identification_data_retained Bool)
(declare-const customer_identification_data_retention_years Int)
(declare-const customer_identification_procedure_established Bool)
(declare-const customer_identification_procedure_implemented Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const enhanced_customer_due_diligence_applied Bool)
(declare-const enhanced_due_diligence_executed Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const media_report_not_possible Bool)
(declare-const media_report_submitted Bool)
(declare-const other_designated_matters_complied Bool)
(declare-const penalty Bool)
(declare-const reasonable_purpose_explained Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const risk_based_approach_applied Bool)
(declare-const same_account_daily_cash_deposit Bool)
(declare-const same_account_daily_cash_withdrawal Bool)
(declare-const same_customer_cash_multiple_remittances Bool)
(declare-const same_customer_multiple_cash_transactions Bool)
(declare-const suspicious_transaction_report_required Bool)
(declare-const suspicious_transaction_report_submitted Bool)
(declare-const suspicious_transaction_reported Bool)
(declare-const suspicious_transaction_reporting_compliance Bool)
(declare-const temporary_transaction_data_retention_years Int)
(declare-const training_held_regularly Bool)
(declare-const transaction_beneficial_owner_is_terrorist Bool)
(declare-const transaction_from_high_risk_country Bool)
(declare-const transaction_funds_suspected_terrorism_related Bool)
(declare-const transaction_identified_as_suspicious_by_internal_procedure Bool)
(declare-const transaction_involves_terrorist_organization Bool)
(declare-const transaction_matches_customer_income Bool)
(declare-const transaction_related_to_business_nature Bool)
(declare-const written_report_approved Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度且包含法定六項內容
(assert (= internal_control_established
   (and control_procedures_established
        training_held_regularly
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_complied)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_implemented))

; [aml:internal_control_compliance] 洗錢防制內部控制制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [aml:customer_identification_procedure_established] 建立確認客戶身分程序且包含風險基礎及實質受益人審查
(assert (= customer_identification_procedure_established
   (and customer_identification_procedure_implemented
        risk_based_approach_applied
        beneficial_owner_reviewed)))

; [aml:customer_identification_data_retained] 確認客戶身分程序所得資料保存期限符合規定
(assert (= customer_identification_data_retained
   (or (<= 5.0 (to_real customer_identification_data_retention_years))
       (<= 5.0 (to_real temporary_transaction_data_retention_years)))))

; [aml:enhanced_customer_due_diligence_applied] 對重要政治性職務客戶及其關係人執行加強客戶審查程序
(assert (= enhanced_customer_due_diligence_applied enhanced_due_diligence_executed))

; [aml:customer_identification_compliance] 確認客戶身分程序建立、資料保存及加強審查均符合規定
(assert (= customer_identification_compliance
   (and customer_identification_procedure_established
        customer_identification_data_retained
        enhanced_customer_due_diligence_applied)))

; [aml:currency_transaction_reported] 金融機構於交易完成後五個營業日內以媒體或書面方式申報達一定金額以上通貨交易
(assert (= currency_transaction_reported
   (or media_report_submitted
       (and media_report_not_possible written_report_approved))))

; [aml:suspicious_transaction_report_required] 符合疑似洗錢交易條件應申報疑似洗錢交易
(assert (let ((a!1 (or transaction_involves_terrorist_organization
               transaction_identified_as_suspicious_by_internal_procedure
               transaction_beneficial_owner_is_terrorist
               (and transaction_from_high_risk_country
                    (or (not transaction_matches_customer_income)
                        (not transaction_related_to_business_nature)))
               (and (<= 500000.0 (ite same_account_daily_cash_deposit 1.0 0.0))
                    (<= 500000.0
                        (ite same_account_daily_cash_withdrawal 1.0 0.0))
                    (or (not transaction_matches_customer_income)
                        (not transaction_related_to_business_nature)))
               transaction_funds_suspected_terrorism_related
               (and (<= 500000.0
                        (ite same_customer_cash_multiple_remittances 1.0 0.0))
                    (not reasonable_purpose_explained))
               (and (<= 500000.0
                        (ite same_customer_multiple_cash_transactions 1.0 0.0))
                    (or (not transaction_matches_customer_income)
                        (not transaction_related_to_business_nature))))))
  (= suspicious_transaction_report_required a!1)))

; [aml:suspicious_transaction_reported] 疑似洗錢交易已向法務部調查局申報
(assert (= suspicious_transaction_reported suspicious_transaction_report_submitted))

; [aml:suspicious_transaction_reporting_compliance] 疑似洗錢交易申報符合規定
(assert (= suspicious_transaction_reporting_compliance
   (or (not suspicious_transaction_report_required)
       suspicious_transaction_reported)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反洗錢防制內部控制制度建立與執行、確認客戶身分程序及疑似洗錢交易申報規定時處罰
(assert (= penalty
   (or (not customer_identification_compliance)
       (not internal_control_compliance)
       (not suspicious_transaction_reporting_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held_regularly false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_complied false))
(assert (= internal_control_implemented false))
(assert (= customer_identification_procedure_implemented false))
(assert (= risk_based_approach_applied false))
(assert (= beneficial_owner_reviewed false))
(assert (= customer_identification_data_retention_years 0))
(assert (= temporary_transaction_data_retention_years 0))
(assert (= media_report_submitted false))
(assert (= media_report_not_possible false))
(assert (= written_report_approved false))
(assert (= suspicious_transaction_report_submitted false))
(assert (= same_account_daily_cash_deposit false))
(assert (= same_account_daily_cash_withdrawal false))
(assert (= same_customer_multiple_cash_transactions false))
(assert (= same_customer_cash_multiple_remittances false))
(assert (= transaction_matches_customer_income true))
(assert (= transaction_related_to_business_nature true))
(assert (= reasonable_purpose_explained true))
(assert (= transaction_from_high_risk_country false))
(assert (= transaction_beneficial_owner_is_terrorist false))
(assert (= transaction_involves_terrorist_organization false))
(assert (= transaction_funds_suspected_terrorism_related false))
(assert (= transaction_identified_as_suspicious_by_internal_procedure false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 41
; Total facts: 28
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
