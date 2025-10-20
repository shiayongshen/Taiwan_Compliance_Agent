; SMT2 file generated from compliance case automatic
; Case ID: case_273
; Generated at: 2025-10-19T11:51:13.091688
;
; This file can be executed with Z3:
;   z3 case_273.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const control_procedures_established Bool)
(declare-const customer_identity_confirmed Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const exemption_conditions_met Bool)
(declare-const exemption_conditions_not_violated Bool)
(declare-const has_justified_reason Bool)
(declare-const inspection_evaded Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const other_designated_matters_established Bool)
(declare-const penalty Bool)
(declare-const report_days_after_transaction Int)
(declare-const report_media_method_used Bool)
(declare-const report_timing_compliance Bool)
(declare-const report_written_approved Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held Bool)
(declare-const transaction_amount_ge_500000 Bool)
(declare-const transaction_between_financial_institutions Bool)
(declare-const transaction_record_retained Bool)
(declare-const transaction_with_collection_payment Bool)
(declare-const transaction_with_government_agency Bool)
(declare-const transaction_with_public_welfare_lottery_dealer Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 已建立洗錢防制內部控制與稽核制度，包含六項必要內容
(assert (= internal_control_established
   (and control_procedures_established
        training_held
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_established)))

; [aml:internal_control_executed] 已確實執行洗錢防制內部控制與稽核制度
(assert (= internal_control_executed internal_control_implemented))

; [aml:internal_control_compliance] 洗錢防制內部控制制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [aml:report_timing_compliance] 金融機構於交易完成後五個營業日內以媒體申報方式申報達一定金額以上通貨交易
(assert (= report_timing_compliance
   (or (and transaction_amount_ge_500000
            (>= 5 report_days_after_transaction)
            report_media_method_used)
       (and transaction_amount_ge_500000
            has_justified_reason
            report_written_approved))))

; [aml:exemption_conditions_met] 符合免申報條件且仍確認客戶身分及留存交易紀錄憑證
(assert (= exemption_conditions_met
   (and (or transaction_between_financial_institutions
            transaction_with_public_welfare_lottery_dealer
            transaction_with_collection_payment
            transaction_with_government_agency)
        customer_identity_confirmed
        transaction_record_retained)))

; [aml:exemption_conditions_not_violated] 免申報條件未違反
(assert (= exemption_conditions_not_violated
   (or exemption_conditions_met (not transaction_amount_ge_500000))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行洗錢防制內部控制制度，或規避查核，或未依規定申報達一定金額以上通貨交易
(assert (= penalty
   (or (and transaction_amount_ge_500000
            (not report_timing_compliance)
            (not exemption_conditions_not_violated))
       inspection_evaded
       (not internal_control_executed)
       (not internal_control_established))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established true))
(assert (= training_held true))
(assert (= dedicated_personnel_assigned true))
(assert (= risk_assessment_report_updated true))
(assert (= audit_procedures_established true))
(assert (= other_designated_matters_established true))
(assert (= internal_control_implemented true))
(assert (= transaction_amount_ge_500000 true))
(assert (= report_days_after_transaction 6))
(assert (= report_media_method_used false))
(assert (= has_justified_reason false))
(assert (= report_written_approved false))
(assert (= transaction_with_government_agency false))
(assert (= transaction_between_financial_institutions false))
(assert (= transaction_with_public_welfare_lottery_dealer false))
(assert (= transaction_with_collection_payment false))
(assert (= customer_identity_confirmed true))
(assert (= transaction_record_retained true))
(assert (= inspection_evaded false))
(assert (= exemption_conditions_met false))
(assert (= exemption_conditions_not_violated false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= penalty false))
(assert (= report_timing_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 26
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
