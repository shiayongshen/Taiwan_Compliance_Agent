; SMT2 file generated from compliance case automatic
; Case ID: case_90
; Generated at: 2025-10-21T01:24:29.310515
;
; This file can be executed with Z3:
;   z3 case_90.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bank_subsidiary_all_related_parties_limit_ok Bool)
(declare-const bank_subsidiary_all_related_parties_transaction_amount Real)
(declare-const bank_subsidiary_net_worth Real)
(declare-const bank_subsidiary_single_related_party_limit_ok Bool)
(declare-const bank_subsidiary_single_related_party_transaction_amount Real)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const counterparty_is_affiliated_company_and_responsible_or_major_shareholder Bool)
(declare-const counterparty_is_bank_insurance_securities_subsidiary_or_responsible Bool)
(declare-const counterparty_is_fhc_and_responsible_or_major_shareholder Bool)
(declare-const counterparty_is_responsible_or_major_shareholder_business_or_enterprise Bool)
(declare-const excluded_securities_ok Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const non_credit_transaction_compliance Bool)
(declare-const non_credit_transaction_conditions_met Bool)
(declare-const non_credit_transaction_counterparty_type Int)
(declare-const non_credit_transaction_type Int)
(declare-const penalty Bool)
(declare-const transaction_involves_bank_subsidiary_negotiable_certificate Bool)
(declare-const transaction_involves_related_third_party Bool)
(declare-const transaction_is_agent_broker_or_commission_service Bool)
(declare-const transaction_is_contract_for_payment_or_service Bool)
(declare-const transaction_is_invest_or_purchase_securities Bool)
(declare-const transaction_is_purchase_real_estate_or_other_assets Bool)
(declare-const transaction_is_sale_securities_real_estate_or_other_assets Bool)
(declare-const violation_45 Bool)
(declare-const violation_60_14 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:non_credit_transaction_conditions_met] 授信以外交易條件符合董事會出席及決議比例
(assert (= non_credit_transaction_conditions_met
   (and (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio))))

; [fhc:non_credit_transaction_counterparty_type] 授信以外交易對象類型符合規定
(assert (= non_credit_transaction_counterparty_type
   (ite (or counterparty_is_bank_insurance_securities_subsidiary_or_responsible
            counterparty_is_responsible_or_major_shareholder_business_or_enterprise
            counterparty_is_affiliated_company_and_responsible_or_major_shareholder
            counterparty_is_fhc_and_responsible_or_major_shareholder)
        1
        0)))

; [fhc:non_credit_transaction_type] 授信以外交易行為符合規定
(assert (= non_credit_transaction_type
   (ite (or transaction_is_purchase_real_estate_or_other_assets
            transaction_is_agent_broker_or_commission_service
            transaction_is_contract_for_payment_or_service
            transaction_involves_related_third_party
            transaction_is_sale_securities_real_estate_or_other_assets
            transaction_is_invest_or_purchase_securities)
        1
        0)))

; [fhc:excluded_securities] 有價證券不包括銀行子公司發行之可轉讓定期存單
(assert (not (= transaction_involves_bank_subsidiary_negotiable_certificate
        excluded_securities_ok)))

; [fhc:bank_subsidiary_single_related_party_limit_ok] 銀行子公司與單一關係人交易金額不超過淨值10%
(assert (= bank_subsidiary_single_related_party_limit_ok
   (<= bank_subsidiary_single_related_party_transaction_amount
       (* (/ 1.0 10.0) bank_subsidiary_net_worth))))

; [fhc:bank_subsidiary_all_related_parties_limit_ok] 銀行子公司與所有利害關係人交易總額不超過淨值20%
(assert (= bank_subsidiary_all_related_parties_limit_ok
   (<= bank_subsidiary_all_related_parties_transaction_amount
       (* (/ 1.0 5.0) bank_subsidiary_net_worth))))

; [fhc:non_credit_transaction_compliance] 授信以外交易符合所有規定
(assert (= non_credit_transaction_compliance
   (and non_credit_transaction_conditions_met
        (= non_credit_transaction_counterparty_type 1)
        (= non_credit_transaction_type 1)
        excluded_securities_ok
        bank_subsidiary_single_related_party_limit_ok
        bank_subsidiary_all_related_parties_limit_ok)))

; [fhc:violation_45] 違反金融控股公司法第45條規定
(assert (not (= non_credit_transaction_compliance violation_45)))

; [fhc:violation_60_14] 違反第45條第一項交易條件限制或董事會決議方法
(assert (= violation_60_14 violation_45))

; [insurance:internal_control_and_audit_ok] 保險業建立內部控制及稽核制度且確實執行
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 保險業建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第45條或未建立或未執行保險業內部控制及處理制度時處罰
(assert (= penalty
   (or violation_60_14
       (not internal_control_and_audit_ok)
       (not internal_handling_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 3.0 5.0)))
(assert (= counterparty_is_affiliated_company_and_responsible_or_major_shareholder false))
(assert (= counterparty_is_bank_insurance_securities_subsidiary_or_responsible false))
(assert (= counterparty_is_fhc_and_responsible_or_major_shareholder false))
(assert (= counterparty_is_responsible_or_major_shareholder_business_or_enterprise false))
(assert (= excluded_securities_ok false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= non_credit_transaction_conditions_met false))
(assert (= non_credit_transaction_counterparty_type 0))
(assert (= non_credit_transaction_type 0))
(assert (= transaction_involves_bank_subsidiary_negotiable_certificate false))
(assert (= transaction_involves_related_third_party true))
(assert (= transaction_is_agent_broker_or_commission_service false))
(assert (= transaction_is_contract_for_payment_or_service true))
(assert (= transaction_is_invest_or_purchase_securities false))
(assert (= transaction_is_purchase_real_estate_or_other_assets false))
(assert (= transaction_is_sale_securities_real_estate_or_other_assets false))
(assert (= bank_subsidiary_single_related_party_transaction_amount 2000000))
(assert (= bank_subsidiary_net_worth 10000000))
(assert (= bank_subsidiary_single_related_party_limit_ok false))
(assert (= bank_subsidiary_all_related_parties_transaction_amount 2500000))
(assert (= bank_subsidiary_all_related_parties_limit_ok false))
(assert (= violation_45 true))
(assert (= violation_60_14 true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 32
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
