; SMT2 file generated from compliance case automatic
; Case ID: case_413
; Generated at: 2025-10-19T15:15:41.412648
;
; This file can be executed with Z3:
;   z3 case_413.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const all_related_party_transaction_amount Real)
(declare-const bank_subsidiary_all_related_party_limit_ok Bool)
(declare-const bank_subsidiary_net_worth Real)
(declare-const bank_subsidiary_single_related_party_limit_ok Bool)
(declare-const bank_subsidiary_transaction_compliance Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const board_resolution_valid Bool)
(declare-const fhc_non_credit_transaction_overall_compliance Bool)
(declare-const is_fhc_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_bank_insurance_securities_subsidiary_or_responsible Bool)
(declare-const is_fhc_related_enterprise_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_responsible_or_major_shareholder_sole_proprietor_or_partner_or_enterprise_representative Bool)
(declare-const non_credit_transaction_compliance Bool)
(declare-const non_credit_transaction_condition_met Bool)
(declare-const penalty Bool)
(declare-const related_party_transaction_subject Bool)
(declare-const single_related_party_transaction_amount Real)
(declare-const transaction_agent_broker_commission_service Bool)
(declare-const transaction_condition_better_than_others Bool)
(declare-const transaction_condition_not_better_than_others Bool)
(declare-const transaction_contract_payment_or_service Bool)
(declare-const transaction_invest_securities Bool)
(declare-const transaction_purchase_real_estate_or_assets Bool)
(declare-const transaction_sell_securities_real_estate_or_assets Bool)
(declare-const transaction_third_party_related Bool)
(declare-const violation_45_1_or_4 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:non_credit_transaction_condition_met] 授信以外之交易條件符合
(assert (= non_credit_transaction_condition_met
   (or transaction_purchase_real_estate_or_assets
       transaction_third_party_related
       transaction_invest_securities
       transaction_sell_securities_real_estate_or_assets
       transaction_agent_broker_commission_service
       transaction_contract_payment_or_service)))

; [fhc:related_party_transaction_subject] 交易對象為金融控股公司或子公司之負責人、大股東、關係企業、子公司及其負責人
(assert (= related_party_transaction_subject
   (or is_fhc_bank_insurance_securities_subsidiary_or_responsible
       is_fhc_and_responsible_or_major_shareholder
       is_fhc_responsible_or_major_shareholder_sole_proprietor_or_partner_or_enterprise_representative
       is_fhc_related_enterprise_and_responsible_or_major_shareholder)))

; [fhc:transaction_condition_not_better_than_others] 授信以外交易條件不得優於其他同類對象
(assert (not (= transaction_condition_better_than_others
        transaction_condition_not_better_than_others)))

; [fhc:board_resolution_valid] 公司三分之二以上董事出席及出席董事四分之三以上決議通過
(assert (= board_resolution_valid
   (and (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio))))

; [fhc:non_credit_transaction_compliance] 授信以外交易符合條件限制
(assert (= non_credit_transaction_compliance
   (or (not (and non_credit_transaction_condition_met
                 related_party_transaction_subject))
       (and transaction_condition_not_better_than_others board_resolution_valid))))

; [fhc:bank_subsidiary_single_related_party_limit_ok] 銀行子公司與單一關係人交易金額不超過淨值10%
(assert (= bank_subsidiary_single_related_party_limit_ok
   (<= (/ single_related_party_transaction_amount bank_subsidiary_net_worth)
       (/ 1.0 10.0))))

; [fhc:bank_subsidiary_all_related_party_limit_ok] 銀行子公司與所有利害關係人交易總額不超過淨值20%
(assert (= bank_subsidiary_all_related_party_limit_ok
   (<= (/ all_related_party_transaction_amount bank_subsidiary_net_worth)
       (/ 1.0 5.0))))

; [fhc:bank_subsidiary_transaction_compliance] 銀行子公司與利害關係人交易金額符合限制
(assert (= bank_subsidiary_transaction_compliance
   (and bank_subsidiary_single_related_party_limit_ok
        bank_subsidiary_all_related_party_limit_ok)))

; [fhc:fhc_non_credit_transaction_overall_compliance] 金融控股公司及子公司授信以外交易符合所有規定
(assert (= fhc_non_credit_transaction_overall_compliance
   (and non_credit_transaction_compliance
        bank_subsidiary_transaction_compliance)))

; [fhc:violation_45_1_or_4] 違反第45條第1項交易條件限制或董事會決議方法
(assert (= violation_45_1_or_4
   (or (not transaction_condition_not_better_than_others)
       (not board_resolution_valid))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第45條第1項交易條件限制或董事會決議方法，或違反銀行子公司交易金額限制
(assert (= penalty
   (or violation_45_1_or_4 (not bank_subsidiary_transaction_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= transaction_invest_securities true))
(assert (= transaction_purchase_real_estate_or_assets false))
(assert (= transaction_sell_securities_real_estate_or_assets false))
(assert (= transaction_contract_payment_or_service false))
(assert (= transaction_agent_broker_commission_service false))
(assert (= transaction_third_party_related false))
(assert (= is_fhc_and_responsible_or_major_shareholder false))
(assert (= is_fhc_responsible_or_major_shareholder_sole_proprietor_or_partner_or_enterprise_representative false))
(assert (= is_fhc_related_enterprise_and_responsible_or_major_shareholder false))
(assert (= is_fhc_bank_insurance_securities_subsidiary_or_responsible true))
(assert (= related_party_transaction_subject true))
(assert (= transaction_condition_better_than_others false))
(assert (= transaction_condition_not_better_than_others false))
(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 1.0 2.0)))
(assert (= board_resolution_valid false))
(assert (= non_credit_transaction_condition_met true))
(assert (= non_credit_transaction_compliance false))
(assert (= single_related_party_transaction_amount 600000000.0))
(assert (= bank_subsidiary_net_worth 10000000000.0))
(assert (= bank_subsidiary_single_related_party_limit_ok false))
(assert (= all_related_party_transaction_amount 600000000.0))
(assert (= bank_subsidiary_all_related_party_limit_ok true))
(assert (= bank_subsidiary_transaction_compliance false))
(assert (= fhc_non_credit_transaction_overall_compliance false))
(assert (= violation_45_1_or_4 true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 27
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
