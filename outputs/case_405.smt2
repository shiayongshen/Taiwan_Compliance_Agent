; SMT2 file generated from compliance case automatic
; Case ID: case_405
; Generated at: 2025-10-21T08:53:14.444599
;
; This file can be executed with Z3:
;   z3 case_405.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bank_subsidiary_all_related_party_limit Real)
(declare-const bank_subsidiary_all_related_party_transaction_amount Real)
(declare-const bank_subsidiary_net_worth Real)
(declare-const bank_subsidiary_single_related_party_limit Real)
(declare-const bank_subsidiary_single_related_party_transaction_amount Real)
(declare-const bank_subsidiary_transaction_limit_compliance Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const is_fhc_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_bank_insurance_securities_subsidiary_or_responsible Bool)
(declare-const is_fhc_related_enterprise_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_responsible_or_major_shareholder_business_or_enterprise Bool)
(declare-const non_credit_transaction_compliance Bool)
(declare-const non_credit_transaction_condition_met Bool)
(declare-const penalty Bool)
(declare-const related_party_transaction_subject Bool)
(declare-const transaction_agent_commission_service Bool)
(declare-const transaction_condition_compliance Bool)
(declare-const transaction_condition_not_better_than_others Bool)
(declare-const transaction_contract_payment_service Bool)
(declare-const transaction_invest_security Bool)
(declare-const transaction_purchase_asset Bool)
(declare-const transaction_related_third_party Bool)
(declare-const transaction_sell_asset Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:non_credit_transaction_condition_met] 授信以外之交易條件成立
(assert (= non_credit_transaction_condition_met
   (or transaction_purchase_asset
       transaction_invest_security
       transaction_agent_commission_service
       transaction_sell_asset
       transaction_contract_payment_service
       transaction_related_third_party)))

; [fhc:related_party_transaction_subject] 交易對象為金融控股公司或子公司之負責人、大股東、關係企業、銀行子公司、保險子公司、證券子公司及其負責人
(assert (= related_party_transaction_subject
   (or is_fhc_and_responsible_or_major_shareholder
       is_fhc_bank_insurance_securities_subsidiary_or_responsible
       is_fhc_related_enterprise_and_responsible_or_major_shareholder
       is_fhc_responsible_or_major_shareholder_business_or_enterprise)))

; [fhc:transaction_condition_compliance] 授信以外交易條件不得優於其他同類對象，且須經董事會三分之二以上出席及出席董事四分之三以上決議
(assert (= transaction_condition_compliance
   (and transaction_condition_not_better_than_others
        (<= (/ 666667.0 10000.0) board_attendance_ratio)
        (<= 75.0 board_approval_ratio))))

; [fhc:bank_subsidiary_single_related_party_limit] 銀行子公司與單一關係人交易金額不得超過淨值10%
(assert (= bank_subsidiary_single_related_party_limit
   (ite (<= (/ bank_subsidiary_single_related_party_transaction_amount
               bank_subsidiary_net_worth)
            (/ 1.0 10.0))
        1.0
        0.0)))

; [fhc:bank_subsidiary_all_related_party_limit] 銀行子公司與所有利害關係人交易總額不得超過淨值20%
(assert (= bank_subsidiary_all_related_party_limit
   (ite (<= (/ bank_subsidiary_all_related_party_transaction_amount
               bank_subsidiary_net_worth)
            (/ 1.0 5.0))
        1.0
        0.0)))

; [fhc:non_credit_transaction_compliance] 授信以外交易符合條件且交易對象為相關人士
(assert (= non_credit_transaction_compliance
   (or (not (and non_credit_transaction_condition_met
                 related_party_transaction_subject))
       transaction_condition_compliance)))

; [fhc:bank_subsidiary_transaction_limit_compliance] 銀行子公司交易金額符合單一及全部利害關係人限制
(assert (and (= bank_subsidiary_single_related_party_limit 1.0)
     (= bank_subsidiary_all_related_party_limit 1.0)))

; [fhc:bank_subsidiary_transaction_limit_compliance_eq] 銀行子公司交易金額限制符合
(assert (= bank_subsidiary_transaction_limit_compliance
   (and (= bank_subsidiary_single_related_party_limit 1.0)
        (= bank_subsidiary_all_related_party_limit 1.0))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第四十五條第一項交易條件限制、董事會決議方法或銀行子公司交易金額限制時處罰
(assert (= penalty
   (or (not bank_subsidiary_transaction_limit_compliance)
       (not transaction_condition_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= transaction_related_third_party true))
(assert (= non_credit_transaction_condition_met true))
(assert (= is_fhc_and_responsible_or_major_shareholder false))
(assert (= is_fhc_responsible_or_major_shareholder_business_or_enterprise false))
(assert (= is_fhc_related_enterprise_and_responsible_or_major_shareholder false))
(assert (= is_fhc_bank_insurance_securities_subsidiary_or_responsible false))
(assert (= transaction_condition_not_better_than_others false))
(assert (= board_attendance_ratio 50.0))
(assert (= board_approval_ratio 60.0))
(assert (= bank_subsidiary_single_related_party_transaction_amount 150000000))
(assert (= bank_subsidiary_net_worth 1000000000))
(assert (= bank_subsidiary_single_related_party_limit 15.0))
(assert (= bank_subsidiary_all_related_party_transaction_amount 250000000))
(assert (= bank_subsidiary_all_related_party_limit 25.0))
(assert (= bank_subsidiary_transaction_limit_compliance false))
(assert (= transaction_condition_compliance false))
(assert (= non_credit_transaction_compliance false))
(assert (= related_party_transaction_subject true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 24
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
