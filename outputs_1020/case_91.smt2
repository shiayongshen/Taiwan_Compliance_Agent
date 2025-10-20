; SMT2 file generated from compliance case automatic
; Case ID: case_91
; Generated at: 2025-10-19T07:51:24.786078
;
; This file can be executed with Z3:
;   z3 case_91.smt2
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
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const is_fhc_and_its_responsible_and_major_shareholders Bool)
(declare-const is_fhc_bank_insurance_securities_subsidiary_or_subsidiary_responsible Bool)
(declare-const is_fhc_related_enterprise_and_its_responsible_and_major_shareholders Bool)
(declare-const is_fhc_responsible_and_major_shareholders_sole_proprietorship_or_partnership_or_enterprise_or_representative_group Bool)
(declare-const non_credit_transaction_compliance Bool)
(declare-const non_credit_transaction_condition_not_better_than_others Bool)
(declare-const non_credit_transaction_conditions_met Bool)
(declare-const non_credit_transaction_counterparty_in_scope Bool)
(declare-const non_credit_transaction_securities_exclusion Bool)
(declare-const non_credit_transaction_type_in_scope Bool)
(declare-const penalty Bool)
(declare-const transaction_condition_better_than_others Bool)
(declare-const transaction_securities_include_bank_subsidiary_negotiable_cd Bool)
(declare-const transaction_type_agent_broker_commission_service Bool)
(declare-const transaction_type_contract_payment_or_service Bool)
(declare-const transaction_type_invest_or_purchase_securities Bool)
(declare-const transaction_type_purchase_real_estate_or_other_assets Bool)
(declare-const transaction_type_sell_securities_real_estate_or_other_assets Bool)
(declare-const transaction_type_third_party_related_transactions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:non_credit_transaction_conditions_met] 授信以外交易條件符合董事會出席及決議比例要求
(assert (= non_credit_transaction_conditions_met
   (and (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio))))

; [fhc:non_credit_transaction_counterparty_in_scope] 授信以外交易對象屬於法定範圍
(assert (= non_credit_transaction_counterparty_in_scope
   (or is_fhc_and_its_responsible_and_major_shareholders
       is_fhc_bank_insurance_securities_subsidiary_or_subsidiary_responsible
       is_fhc_related_enterprise_and_its_responsible_and_major_shareholders
       is_fhc_responsible_and_major_shareholders_sole_proprietorship_or_partnership_or_enterprise_or_representative_group)))

; [fhc:non_credit_transaction_condition_not_better_than_others] 授信以外交易條件不得優於其他同類對象
(assert (not (= transaction_condition_better_than_others
        non_credit_transaction_condition_not_better_than_others)))

; [fhc:non_credit_transaction_compliance] 授信以外交易符合條件、對象範圍及董事會決議要求
(assert (= non_credit_transaction_compliance
   (and non_credit_transaction_counterparty_in_scope
        non_credit_transaction_condition_not_better_than_others
        non_credit_transaction_conditions_met)))

; [fhc:non_credit_transaction_type_in_scope] 授信以外交易類型屬於法定範圍
(assert (= non_credit_transaction_type_in_scope
   (or transaction_type_third_party_related_transactions
       transaction_type_purchase_real_estate_or_other_assets
       transaction_type_invest_or_purchase_securities
       transaction_type_sell_securities_real_estate_or_other_assets
       transaction_type_contract_payment_or_service
       transaction_type_agent_broker_commission_service)))

; [fhc:non_credit_transaction_securities_exclusion] 有價證券不包括銀行子公司發行之可轉讓定期存單
(assert (not (= transaction_securities_include_bank_subsidiary_negotiable_cd
        non_credit_transaction_securities_exclusion)))

; [fhc:bank_subsidiary_single_counterparty_limit_ok] 銀行子公司與單一關係人交易金額不超過淨值10%
(assert (= bank_subsidiary_single_counterparty_limit_ok
   (<= bank_subsidiary_single_counterparty_transaction_amount
       (* (/ 1.0 10.0) bank_subsidiary_net_worth))))

; [fhc:bank_subsidiary_all_counterparty_limit_ok] 銀行子公司與所有利害關係人交易總額不超過淨值20%
(assert (= bank_subsidiary_all_counterparty_limit_ok
   (<= bank_subsidiary_all_counterparty_transaction_amount
       (* (/ 1.0 5.0) bank_subsidiary_net_worth))))

; [fhc:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [fhc:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [fhc:internal_control_compliance] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反授信以外交易條件、對象範圍、董事會決議或銀行子公司交易限額，或未建立或執行內部控制制度時處罰
(assert (= penalty
   (or (not internal_control_compliance)
       (not non_credit_transaction_compliance)
       (not bank_subsidiary_all_counterparty_limit_ok)
       (not bank_subsidiary_single_counterparty_limit_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 3.0 5.0)))
(assert (= non_credit_transaction_counterparty_in_scope true))
(assert (= transaction_type_contract_payment_or_service true))
(assert (= transaction_condition_better_than_others false))
(assert (= non_credit_transaction_condition_not_better_than_others false))
(assert (= non_credit_transaction_conditions_met false))
(assert (= non_credit_transaction_compliance false))
(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= transaction_securities_include_bank_subsidiary_negotiable_cd false))
(assert (= non_credit_transaction_securities_exclusion true))
(assert (= is_fhc_and_its_responsible_and_major_shareholders false))
(assert (= is_fhc_responsible_and_major_shareholders_sole_proprietorship_or_partnership_or_enterprise_or_representative_group false))
(assert (= is_fhc_related_enterprise_and_its_responsible_and_major_shareholders false))
(assert (= is_fhc_bank_insurance_securities_subsidiary_or_subsidiary_responsible false))
(assert (= bank_subsidiary_single_counterparty_transaction_amount 0.0))
(assert (= bank_subsidiary_net_worth 0.0))
(assert (= bank_subsidiary_single_counterparty_limit_ok true))
(assert (= bank_subsidiary_all_counterparty_transaction_amount 0.0))
(assert (= bank_subsidiary_all_counterparty_limit_ok true))
(assert (= transaction_type_agent_broker_commission_service false))
(assert (= transaction_type_invest_or_purchase_securities false))
(assert (= transaction_type_purchase_real_estate_or_other_assets false))
(assert (= transaction_type_sell_securities_real_estate_or_other_assets false))
(assert (= transaction_type_third_party_related_transactions false))
(assert (= penalty true))
(assert (= non_credit_transaction_type_in_scope false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 31
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
