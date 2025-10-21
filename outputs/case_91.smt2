; SMT2 file generated from compliance case automatic
; Case ID: case_91
; Generated at: 2025-10-21T01:26:27.801908
;
; This file can be executed with Z3:
;   z3 case_91.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_ordered_by_authority Bool)
(declare-const adjustment_period_years Int)
(declare-const bank_subsidiary_all_related_party_limit_ok Bool)
(declare-const bank_subsidiary_all_related_party_transaction_amount Real)
(declare-const bank_subsidiary_net_worth Real)
(declare-const bank_subsidiary_single_related_party_limit_ok Bool)
(declare-const bank_subsidiary_single_related_party_transaction_amount Real)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const business_scope_ok Bool)
(declare-const capital_reduction_approved_by_authority Bool)
(declare-const excluded_securities Bool)
(declare-const extension_period_years_per_extension Int)
(declare-const extension_times Int)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const investment_approved Bool)
(declare-const investment_approved_or_deemed Bool)
(declare-const investment_deemed_approved Bool)
(declare-const investment_not_approved_prohibited Bool)
(declare-const is_contract_for_payment_or_service Bool)
(declare-const is_fhc_affiliated_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_bank_insurance_securities_subsidiary_or_subsidiary_responsible Bool)
(declare-const is_fhc_responsible_or_major_shareholder_sole_proprietor_or_partner_or_enterprise_or_representative Bool)
(declare-const is_invest_or_purchase_issuer_securities Bool)
(declare-const is_party_as_agent_broker_or_commission_service Bool)
(declare-const is_purchase_real_estate_or_other_assets Bool)
(declare-const is_responsible_or_staff_manager_of_venture_invested Bool)
(declare-const is_sell_securities_real_estate_or_other_assets_to_party Bool)
(declare-const is_transaction_with_third_party_related_to_party Bool)
(declare-const is_transferable_time_deposit_certificate_issued_by_bank_subsidiary Bool)
(declare-const non_credit_transaction_condition_met Bool)
(declare-const non_credit_transaction_ok Bool)
(declare-const non_credit_transaction_party Bool)
(declare-const non_credit_transaction_terms_ok Bool)
(declare-const non_credit_transaction_type Bool)
(declare-const penalty Bool)
(declare-const responsible_or_staff_not_manager_of_venture_invested Bool)
(declare-const subsidiary_adjustment_ordered Bool)
(declare-const subsidiary_adjustment_within_period Bool)
(declare-const subsidiary_business_is_investment Bool)
(declare-const subsidiary_business_is_management_of_invested_enterprises Bool)
(declare-const subsidiary_business_or_investment_exceed_limit Bool)
(declare-const subsidiary_capital_reduction_approval Bool)
(declare-const transaction_terms_not_better_than_others Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:non_credit_transaction_party] 授信以外交易對象分類
(assert (let ((a!1 (ite is_fhc_and_responsible_or_major_shareholder
                1
                (ite is_fhc_responsible_or_major_shareholder_sole_proprietor_or_partner_or_enterprise_or_representative
                     2
                     (ite is_fhc_affiliated_and_responsible_or_major_shareholder
                          3
                          (ite is_fhc_bank_insurance_securities_subsidiary_or_subsidiary_responsible
                               4
                               0))))))
  (= (ite non_credit_transaction_party 1 0) a!1)))

; [fhc:non_credit_transaction_condition_met] 授信以外交易條件符合董事會出席及決議比例要求
(assert (= non_credit_transaction_condition_met
   (and (<= (/ 666667.0 10000.0) board_attendance_ratio)
        (<= 75.0 board_approval_ratio))))

; [fhc:non_credit_transaction_terms_ok] 授信以外交易條件不得優於其他同類對象
(assert (= non_credit_transaction_terms_ok transaction_terms_not_better_than_others))

; [fhc:non_credit_transaction_ok] 授信以外交易符合條件及決議程序
(assert (= non_credit_transaction_ok
   (and non_credit_transaction_party
        non_credit_transaction_terms_ok
        non_credit_transaction_condition_met)))

; [fhc:non_credit_transaction_type] 授信以外交易類型分類
(assert (let ((a!1 (ite is_sell_securities_real_estate_or_other_assets_to_party
                3
                (ite is_contract_for_payment_or_service
                     4
                     (ite is_party_as_agent_broker_or_commission_service
                          5
                          (ite is_transaction_with_third_party_related_to_party
                               6
                               0))))))
  (= (ite non_credit_transaction_type 1 0)
     (ite is_invest_or_purchase_issuer_securities
          1
          (ite is_purchase_real_estate_or_other_assets 2 a!1)))))

; [fhc:excluded_securities] 不包括銀行子公司發行之可轉讓定期存單
(assert (not (= is_transferable_time_deposit_certificate_issued_by_bank_subsidiary
        excluded_securities)))

; [fhc:bank_subsidiary_single_related_party_limit_ok] 銀行子公司與單一關係人交易金額不超過淨值10%
(assert (= bank_subsidiary_single_related_party_limit_ok
   (<= bank_subsidiary_single_related_party_transaction_amount
       (* (/ 1.0 10.0) bank_subsidiary_net_worth))))

; [fhc:bank_subsidiary_all_related_party_limit_ok] 銀行子公司與所有利害關係人交易總額不超過淨值20%
(assert (= bank_subsidiary_all_related_party_limit_ok
   (<= bank_subsidiary_all_related_party_transaction_amount
       (* (/ 1.0 5.0) bank_subsidiary_net_worth))))

; [fhc:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [fhc:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [fhc:internal_control_ok] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [fhc:business_scope_ok] 子公司業務限於投資及管理被投資事業
(assert (= business_scope_ok
   (and subsidiary_business_is_investment
        subsidiary_business_is_management_of_invested_enterprises)))

; [fhc:investment_approved_or_deemed] 投資事業經主管機關核准或視為核准
(assert (= investment_approved_or_deemed
   (or investment_approved investment_deemed_approved)))

; [fhc:investment_not_approved_prohibited] 未經核准不得進行投資行為
(assert (not (= investment_approved_or_deemed investment_not_approved_prohibited)))

; [fhc:subsidiary_business_or_investment_exceed_limit] 子公司業務或投資逾越法令規定範圍
(assert (= subsidiary_business_or_investment_exceed_limit
   (or investment_not_approved_prohibited (not business_scope_ok))))

; [fhc:subsidiary_adjustment_ordered] 主管機關限期命令調整子公司業務或投資
(assert (= subsidiary_adjustment_ordered adjustment_ordered_by_authority))

; [fhc:subsidiary_adjustment_within_period] 子公司調整期限最長三年，得申請延長兩次，每次二年
(assert (= subsidiary_adjustment_within_period
   (and (>= 3 adjustment_period_years)
        (or (= 0 extension_times) (>= 2 extension_times))
        (>= 2 extension_period_years_per_extension))))

; [fhc:responsible_or_staff_not_manager_of_venture_invested] 負責人或職員不得擔任創業投資事業所投資事業經理人
(assert (not (= is_responsible_or_staff_manager_of_venture_invested
        responsible_or_staff_not_manager_of_venture_invested)))

; [fhc:subsidiary_capital_reduction_approval] 子公司減資應事先申請核准
(assert (= subsidiary_capital_reduction_approval
   capital_reduction_approved_by_authority))

; [fhc:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第45條交易條件限制或董事會決議程序，或銀行子公司交易金額限制，或未建立或執行內部控制制度，或子公司業務投資逾越規定，或未申請核准子公司減資
(assert (= penalty
   (or (not non_credit_transaction_party)
       (not bank_subsidiary_all_related_party_limit_ok)
       (not non_credit_transaction_condition_met)
       (not bank_subsidiary_single_related_party_limit_ok)
       (not internal_control_ok)
       (not subsidiary_capital_reduction_approval)
       subsidiary_business_or_investment_exceed_limit
       (not non_credit_transaction_terms_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= is_fhc_and_responsible_or_major_shareholder false))
(assert (= is_fhc_responsible_or_major_shareholder_sole_proprietor_or_partner_or_enterprise_or_representative false))
(assert (= is_fhc_affiliated_and_responsible_or_major_shareholder false))
(assert (= is_fhc_bank_insurance_securities_subsidiary_or_subsidiary_responsible false))
(assert (= transaction_terms_not_better_than_others false))
(assert (= board_attendance_ratio 50.0))
(assert (= board_approval_ratio 60.0))
(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= bank_subsidiary_single_related_party_limit_ok true))
(assert (= bank_subsidiary_all_related_party_limit_ok true))
(assert (= subsidiary_business_is_investment true))
(assert (= subsidiary_business_is_management_of_invested_enterprises true))
(assert (= investment_approved true))
(assert (= investment_deemed_approved false))
(assert (= capital_reduction_approved_by_authority true))
(assert (= adjustment_ordered_by_authority false))
(assert (= adjustment_period_years 0))
(assert (= extension_times 0))
(assert (= extension_period_years_per_extension 0))
(assert (= is_invest_or_purchase_issuer_securities false))
(assert (= is_purchase_real_estate_or_other_assets false))
(assert (= is_sell_securities_real_estate_or_other_assets_to_party false))
(assert (= is_contract_for_payment_or_service true))
(assert (= is_party_as_agent_broker_or_commission_service false))
(assert (= is_transaction_with_third_party_related_to_party false))
(assert (= is_transferable_time_deposit_certificate_issued_by_bank_subsidiary false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 49
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
