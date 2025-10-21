; SMT2 file generated from compliance case automatic
; Case ID: case_273
; Generated at: 2025-10-21T06:04:56.295143
;
; This file can be executed with Z3:
;   z3 case_273.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedure_established Bool)
(declare-const cash_payment Bool)
(declare-const cash_receipt Bool)
(declare-const collection_transaction Bool)
(declare-const control_procedure_established Bool)
(declare-const counterparty_government_agency Bool)
(declare-const currency_exchange Bool)
(declare-const currency_transaction Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const exemption_condition Bool)
(declare-const has_justified_reason Bool)
(declare-const inspection_evaded Bool)
(declare-const interbank_transaction Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implementation Bool)
(declare-const media_reported Bool)
(declare-const other_designated_matters_complied Bool)
(declare-const payment_notice_contains_required_info Bool)
(declare-const penalty Bool)
(declare-const public_welfare_lottery_dealer_purchase Bool)
(declare-const report_media_method Bool)
(declare-const report_submitted Bool)
(declare-const reporting_required Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held_regularly Bool)
(declare-const transaction_amount Real)
(declare-const transaction_amount_threshold_met Bool)
(declare-const transaction_due_to_law_or_contract Bool)
(declare-const written_report_approved Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度且包含法定六項內容
(assert (= internal_control_established
   (and control_procedure_established
        training_held_regularly
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedure_established
        other_designated_matters_complied)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_implementation))

; [aml:internal_control_compliance] 洗錢防制內部控制制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [aml:report_media_method] 通貨交易申報以媒體方式申報
(assert (= report_media_method
   (or media_reported
       (and (not media_reported) has_justified_reason written_report_approved))))

; [aml:transaction_amount_threshold_met] 通貨交易達一定金額以上
(assert (= transaction_amount_threshold_met (<= 500000.0 transaction_amount)))

; [aml:currency_transaction_definition] 通貨交易定義符合現金收付或換鈔交易
(assert (= currency_transaction (or cash_receipt currency_exchange cash_payment)))

; [aml:exemption_condition] 符合免申報通貨交易條件
(assert (= exemption_condition
   (or (and collection_transaction payment_notice_contains_required_info)
       (and counterparty_government_agency transaction_due_to_law_or_contract)
       interbank_transaction
       public_welfare_lottery_dealer_purchase)))

; [aml:reporting_required] 通貨交易達一定金額且不符合免申報條件，應申報
(assert (= reporting_required
   (and transaction_amount_threshold_met
        currency_transaction
        (not exemption_condition))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行洗錢防制內部控制制度，或規避查核，或未依規定申報通貨交易時處罰
(assert (= penalty
   (or (and reporting_required (not report_submitted))
       (not internal_control_executed)
       (not internal_control_established)
       inspection_evaded)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedure_established true))
(assert (= training_held_regularly true))
(assert (= dedicated_personnel_assigned true))
(assert (= risk_assessment_report_updated true))
(assert (= audit_procedure_established true))
(assert (= other_designated_matters_complied true))
(assert (= internal_control_implementation true))
(assert (= media_reported false))
(assert (= has_justified_reason false))
(assert (= written_report_approved false))
(assert (= transaction_amount 600000))
(assert (= cash_receipt true))
(assert (= cash_payment false))
(assert (= currency_exchange false))
(assert (= counterparty_government_agency false))
(assert (= transaction_due_to_law_or_contract false))
(assert (= interbank_transaction false))
(assert (= public_welfare_lottery_dealer_purchase false))
(assert (= collection_transaction false))
(assert (= payment_notice_contains_required_info false))
(assert (= inspection_evaded false))
(assert (= report_submitted false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 31
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
