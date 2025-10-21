; SMT2 file generated from compliance case automatic
; Case ID: case_413
; Generated at: 2025-10-21T09:04:02.171629
;
; This file can be executed with Z3:
;   z3 case_413.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bank_subsidiary_all_counterparty_limit_ok Bool)
(declare-const bank_subsidiary_all_counterparty_transaction_amount Real)
(declare-const bank_subsidiary_net_worth Real)
(declare-const bank_subsidiary_single_counterparty_limit_ok Bool)
(declare-const bank_subsidiary_single_counterparty_transaction_amount Real)
(declare-const board_approval_met Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const compliance_45_article Bool)
(declare-const is_bank_subsidiary_transferable_time_deposit_certificate Bool)
(declare-const is_contract_pay_money_or_provide_service_to_counterparty Bool)
(declare-const is_counterparty_agent_broker_or_commission_service Bool)
(declare-const is_fhc_affiliate_and_responsible_and_major_shareholder Bool)
(declare-const is_fhc_and_responsible_and_major_shareholder Bool)
(declare-const is_fhc_bank_insurance_securities_subsidiary_and_subsidiary_responsible Bool)
(declare-const is_fhc_responsible_major_shareholder_sole_partner_or_enterprise_or_representative_group Bool)
(declare-const is_invest_or_purchase_issuer_securities Bool)
(declare-const is_purchase_counterparty_real_estate_or_other_assets Bool)
(declare-const is_sell_securities_real_estate_or_other_assets_to_counterparty Bool)
(declare-const is_transaction_with_third_party_related_to_counterparty Bool)
(declare-const non_credit_transaction_condition_met Bool)
(declare-const non_credit_transaction_counterparty Bool)
(declare-const penalty Bool)
(declare-const securities_exclusion_ok Bool)
(declare-const transaction_condition_better_than_others Bool)
(declare-const transaction_condition_not_better_than_others Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:non_credit_transaction_counterparty] 授信以外交易對象分類
(assert (let ((a!1 (ite is_fhc_and_responsible_and_major_shareholder
                1
                (ite is_fhc_responsible_major_shareholder_sole_partner_or_enterprise_or_representative_group
                     2
                     (ite is_fhc_affiliate_and_responsible_and_major_shareholder
                          3
                          (ite is_fhc_bank_insurance_securities_subsidiary_and_subsidiary_responsible
                               4
                               0))))))
  (= (ite non_credit_transaction_counterparty 1 0) a!1)))

; [fhc:non_credit_transaction_condition_met] 授信以外交易條件符合定義
(assert (= non_credit_transaction_condition_met
   (or is_transaction_with_third_party_related_to_counterparty
       is_purchase_counterparty_real_estate_or_other_assets
       is_counterparty_agent_broker_or_commission_service
       is_contract_pay_money_or_provide_service_to_counterparty
       is_invest_or_purchase_issuer_securities
       is_sell_securities_real_estate_or_other_assets_to_counterparty)))

; [fhc:securities_exclusion] 有價證券排除銀行子公司發行之可轉讓定期存單
(assert (not (= is_bank_subsidiary_transferable_time_deposit_certificate
        securities_exclusion_ok)))

; [fhc:board_approval_met] 董事會出席及決議比例符合規定
(assert (= board_approval_met
   (and (<= (/ 666667.0 10000.0) board_attendance_ratio)
        (<= 75.0 board_approval_ratio))))

; [fhc:transaction_condition_not_better_than_others] 授信以外交易條件不得優於其他同類對象
(assert (not (= transaction_condition_better_than_others
        transaction_condition_not_better_than_others)))

; [fhc:bank_subsidiary_single_counterparty_limit_ok] 銀行子公司與單一關係人交易金額不超過淨值10%
(assert (= bank_subsidiary_single_counterparty_limit_ok
   (<= (/ bank_subsidiary_single_counterparty_transaction_amount
          bank_subsidiary_net_worth)
       (/ 1.0 10.0))))

; [fhc:bank_subsidiary_all_counterparty_limit_ok] 銀行子公司與所有利害關係人交易總額不超過淨值20%
(assert (= bank_subsidiary_all_counterparty_limit_ok
   (<= (/ bank_subsidiary_all_counterparty_transaction_amount
          bank_subsidiary_net_worth)
       (/ 1.0 5.0))))

; [fhc:compliance_45_article] 第45條授信以外交易條件及董事會決議符合規定
(assert (= compliance_45_article
   (and non_credit_transaction_condition_met
        (not transaction_condition_better_than_others)
        board_approval_met)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第45條授信以外交易條件限制或董事會決議方法，或違反銀行子公司交易金額限制
(assert (= penalty
   (or (not bank_subsidiary_single_counterparty_limit_ok)
       (not bank_subsidiary_all_counterparty_limit_ok)
       (not compliance_45_article))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= is_fhc_and_responsible_and_major_shareholder false))
(assert (= is_fhc_responsible_major_shareholder_sole_partner_or_enterprise_or_representative_group false))
(assert (= is_fhc_affiliate_and_responsible_and_major_shareholder false))
(assert (= is_fhc_bank_insurance_securities_subsidiary_and_subsidiary_responsible true))
(assert (= is_invest_or_purchase_issuer_securities true))
(assert (= is_purchase_counterparty_real_estate_or_other_assets false))
(assert (= is_sell_securities_real_estate_or_other_assets_to_counterparty false))
(assert (= is_contract_pay_money_or_provide_service_to_counterparty false))
(assert (= is_counterparty_agent_broker_or_commission_service false))
(assert (= is_transaction_with_third_party_related_to_counterparty false))
(assert (= securities_exclusion_ok true))
(assert (= board_attendance_ratio 50.0))
(assert (= board_approval_ratio 60.0))
(assert (= bank_subsidiary_single_counterparty_transaction_amount 6000000.0))
(assert (= bank_subsidiary_net_worth 50000000.0))
(assert (= bank_subsidiary_all_counterparty_transaction_amount 6000000.0))
(assert (= board_approval_met false))
(assert (= bank_subsidiary_single_counterparty_limit_ok false))
(assert (= bank_subsidiary_all_counterparty_limit_ok true))
(assert (= transaction_condition_better_than_others false))
(assert (= transaction_condition_not_better_than_others true))
(assert (= non_credit_transaction_condition_met true))
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
; Total variables: 26
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
