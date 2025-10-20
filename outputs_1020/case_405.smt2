; SMT2 file generated from compliance case automatic
; Case ID: case_405
; Generated at: 2025-10-19T15:00:05.238370
;
; This file can be executed with Z3:
;   z3 case_405.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bank_subsidiary_all_related_party_limit_ok Bool)
(declare-const bank_subsidiary_all_related_party_transaction_amount Real)
(declare-const bank_subsidiary_net_worth Real)
(declare-const bank_subsidiary_single_related_party_limit_ok Bool)
(declare-const bank_subsidiary_single_related_party_transaction_amount Real)
(declare-const bank_subsidiary_transaction_limit_ok Bool)
(declare-const board_attendance_ratio Real)
(declare-const board_meeting_quorum_met Bool)
(declare-const board_resolution_ratio Real)
(declare-const board_resolution_ratio_met Bool)
(declare-const compliance_fhc_45 Bool)
(declare-const is_fhc_and_responsible_person_or_major_shareholder Bool)
(declare-const is_fhc_bank_insurance_securities_subsidiary_or_responsible_person Bool)
(declare-const is_fhc_related_enterprise_and_responsible_person_or_major_shareholder Bool)
(declare-const is_fhc_responsible_person_major_shareholder_sole_proprietor_or_partner_or_enterprise_representative Bool)
(declare-const non_credit_transaction_approval_ok Bool)
(declare-const non_credit_transaction_condition_met Bool)
(declare-const penalty Bool)
(declare-const related_party_transaction_subject Bool)
(declare-const transaction_agent_broker_commission_service Bool)
(declare-const transaction_condition_better_than_others Bool)
(declare-const transaction_condition_not_better_than_others Bool)
(declare-const transaction_contract_payment_or_service Bool)
(declare-const transaction_invest_securities Bool)
(declare-const transaction_purchase_real_estate_or_assets Bool)
(declare-const transaction_sell_securities_real_estate_or_assets Bool)
(declare-const transaction_third_party_related Bool)
(declare-const violation_60_14 Bool)
(declare-const violation_60_14_ratio_limit Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:non_credit_transaction_condition_met] 授信以外之交易條件符合
(assert (= non_credit_transaction_condition_met
   (or transaction_third_party_related
       transaction_purchase_real_estate_or_assets
       transaction_invest_securities
       transaction_agent_broker_commission_service
       transaction_sell_securities_real_estate_or_assets
       transaction_contract_payment_or_service)))

; [fhc:related_party_transaction_subject] 交易對象為金融控股公司或子公司之負責人、大股東、關係企業、銀行子公司、保險子公司、證券子公司及其負責人
(assert (= related_party_transaction_subject
   (or is_fhc_responsible_person_major_shareholder_sole_proprietor_or_partner_or_enterprise_representative
       is_fhc_and_responsible_person_or_major_shareholder
       is_fhc_bank_insurance_securities_subsidiary_or_responsible_person
       is_fhc_related_enterprise_and_responsible_person_or_major_shareholder)))

; [fhc:transaction_condition_not_better_than_others] 授信以外交易條件不得優於其他同類對象
(assert (not (= transaction_condition_better_than_others
        transaction_condition_not_better_than_others)))

; [fhc:board_meeting_quorum_met] 董事出席人數達三分之二以上
(assert (= board_meeting_quorum_met
   (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)))

; [fhc:board_resolution_ratio_met] 出席董事決議比例達四分之三以上
(assert (= board_resolution_ratio_met (<= (/ 3.0 4.0) board_resolution_ratio)))

; [fhc:non_credit_transaction_approval_ok] 授信以外交易經董事會法定出席及決議比例通過
(assert (= non_credit_transaction_approval_ok
   (and non_credit_transaction_condition_met
        related_party_transaction_subject
        transaction_condition_not_better_than_others
        board_meeting_quorum_met
        board_resolution_ratio_met)))

; [fhc:bank_subsidiary_single_related_party_limit_ok] 銀行子公司與單一關係人交易金額不超過淨值10%
(assert (= bank_subsidiary_single_related_party_limit_ok
   (<= bank_subsidiary_single_related_party_transaction_amount
       (* (/ 1.0 10.0) bank_subsidiary_net_worth))))

; [fhc:bank_subsidiary_all_related_party_limit_ok] 銀行子公司與所有利害關係人交易總額不超過淨值20%
(assert (= bank_subsidiary_all_related_party_limit_ok
   (<= bank_subsidiary_all_related_party_transaction_amount
       (* (/ 1.0 5.0) bank_subsidiary_net_worth))))

; [fhc:bank_subsidiary_transaction_limit_ok] 銀行子公司交易金額符合單一及全部利害關係人限制
(assert (= bank_subsidiary_transaction_limit_ok
   (and bank_subsidiary_single_related_party_limit_ok
        bank_subsidiary_all_related_party_limit_ok)))

; [fhc:compliance_fhc_45] 符合金融控股公司法第45條授信以外交易條件及董事會決議及銀行子公司交易限制
(assert (= compliance_fhc_45
   (or (not (and non_credit_transaction_condition_met
                 related_party_transaction_subject))
       (and transaction_condition_not_better_than_others
            board_meeting_quorum_met
            board_resolution_ratio_met
            bank_subsidiary_transaction_limit_ok))))

; [fhc:violation_60_14] 違反金融控股公司法第45條第一項交易條件限制或董事會決議方法
(assert (= violation_60_14
   (or (not board_meeting_quorum_met)
       (not board_resolution_ratio_met)
       (not transaction_condition_not_better_than_others))))

; [fhc:violation_60_14_ratio_limit] 違反金融控股公司法第45條第四項銀行子公司交易金額比率限制
(assert (= violation_60_14_ratio_limit
   (ite bank_subsidiary_transaction_limit_ok 0.0 1.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第45條交易條件限制、董事會決議方法或銀行子公司交易金額比率限制時處罰
(assert (= penalty (or violation_60_14 (= violation_60_14_ratio_limit 1.0))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= non_credit_transaction_condition_met true))
(assert (= related_party_transaction_subject true))
(assert (= transaction_condition_not_better_than_others false))
(assert (= board_attendance_ratio (/ 3.0 5.0)))
(assert (= board_meeting_quorum_met false))
(assert (= board_resolution_ratio (/ 7.0 10.0)))
(assert (= board_resolution_ratio_met false))
(assert (= bank_subsidiary_single_related_party_transaction_amount 0.0))
(assert (= bank_subsidiary_net_worth 1.0))
(assert (= bank_subsidiary_single_related_party_limit_ok true))
(assert (= bank_subsidiary_all_related_party_transaction_amount 0.0))
(assert (= bank_subsidiary_all_related_party_limit_ok true))
(assert (= bank_subsidiary_transaction_limit_ok true))
(assert (= violation_60_14 true))
(assert (= violation_60_14_ratio_limit 0.0))
(assert (= penalty true))
(assert (= transaction_invest_securities false))
(assert (= transaction_purchase_real_estate_or_assets false))
(assert (= transaction_sell_securities_real_estate_or_assets false))
(assert (= transaction_contract_payment_or_service false))
(assert (= transaction_agent_broker_commission_service false))
(assert (= transaction_third_party_related true))
(assert (= is_fhc_and_responsible_person_or_major_shareholder false))
(assert (= is_fhc_responsible_person_major_shareholder_sole_proprietor_or_partner_or_enterprise_representative false))
(assert (= is_fhc_related_enterprise_and_responsible_person_or_major_shareholder false))
(assert (= is_fhc_bank_insurance_securities_subsidiary_or_responsible_person false))
(assert (= non_credit_transaction_approval_ok false))
(assert (= compliance_fhc_45 false))
(assert (= transaction_condition_better_than_others false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 29
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
