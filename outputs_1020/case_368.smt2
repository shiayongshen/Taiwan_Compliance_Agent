; SMT2 file generated from compliance case automatic
; Case ID: case_368
; Generated at: 2025-10-19T14:11:49.293626
;
; This file can be executed with Z3:
;   z3 case_368.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_and_supervisory_measures_taken Bool)
(declare-const bad_debt_provision_1_to_3_months Real)
(declare-const bad_debt_provision_3_to_6_months Real)
(declare-const bad_debt_provision_amount_1_to_3_months Real)
(declare-const bad_debt_provision_amount_3_to_6_months Real)
(declare-const bad_debt_provision_amount_over_6_months Real)
(declare-const bad_debt_provision_over_6_months Real)
(declare-const bad_debt_provisioning Real)
(declare-const bad_debt_write_off Real)
(declare-const bad_debt_write_off_completed Bool)
(declare-const cash_card_interest_rate_annual_percent Real)
(declare-const cash_card_or_credit_card_interest_rate_limit Real)
(declare-const central_authority_permit_granted Bool)
(declare-const credit_card_revolving_interest_rate_annual_percent Real)
(declare-const data_truthfulness Bool)
(declare-const disclosure_on_website Bool)
(declare-const foreign_credit_card_company_authorized_procedure Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const law_or_order_mandatory_compliance Bool)
(declare-const law_or_order_prohibition_compliance Bool)
(declare-const law_or_order_required_action_compliance Bool)
(declare-const money_market_or_credit_card_business_permit Bool)
(declare-const operates_money_market_or_credit_card_business Bool)
(declare-const overdue_account_ratio Real)
(declare-const overdue_minimum_payment_months Int)
(declare-const overdue_ratio_adjustment Real)
(declare-const penalty Bool)
(declare-const regulatory_overdue_ratio_limit Real)
(declare-const reporting_and_disclosure_compliance Bool)
(declare-const reporting_to_authorities Bool)
(declare-const total_advance_amount Real)
(declare-const violation_penalty_applicable Bool)
(declare-const write_off_approval_and_reporting Bool)
(declare-const write_off_approved_by_authorized_personnel Bool)
(declare-const write_off_reported_to_board Bool)
(declare-const write_off_within_months_after_6_months Int)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:money_market_or_credit_card_business_permit] 經營貨幣市場業務或信用卡業務須經中央主管機關許可
(assert (= money_market_or_credit_card_business_permit
   (or central_authority_permit_granted
       (not operates_money_market_or_credit_card_business))))

; [bank:cash_card_or_credit_card_interest_rate_limit] 現金卡利率或信用卡循環信用利率不得超過年利率15%
(assert (= cash_card_or_credit_card_interest_rate_limit
   (ite (and (>= 15.0 cash_card_interest_rate_annual_percent)
             (>= 15.0 credit_card_revolving_interest_rate_annual_percent))
        1.0
        0.0)))

; [bank:violation_penalty_applicable] 違反銀行法或授權命令中強制或禁止規定者，處罰適用
(assert (= violation_penalty_applicable
   (or (not law_or_order_mandatory_compliance)
       (not law_or_order_prohibition_compliance)
       (not law_or_order_required_action_compliance))))

; [credit_card:reporting_and_disclosure_compliance] 信用卡業務機構依主管機關及中央銀行規定申報及揭露資料且資料正確
(assert (= reporting_and_disclosure_compliance
   (and reporting_to_authorities disclosure_on_website data_truthfulness)))

; [credit_card:bad_debt_provisioning] 逾期帳款備抵呆帳提列符合規定
(assert (let ((a!1 (ite (and (>= bad_debt_provision_1_to_3_months
                         (* (/ 1.0 50.0) total_advance_amount))
                     (>= bad_debt_provision_3_to_6_months
                         (* (/ 1.0 2.0) total_advance_amount))
                     (>= bad_debt_provision_over_6_months
                         bad_debt_provision_amount_over_6_months))
                1.0
                0.0)))
  (= bad_debt_provisioning a!1)))

; [credit_card:bad_debt_write_off] 逾期六個月未繳足帳款應於三個月內轉銷為呆帳
(assert (let ((a!1 (ite (or (<= overdue_minimum_payment_months 6)
                    (and (>= 3 write_off_within_months_after_6_months)
                         bad_debt_write_off_completed))
                1.0
                0.0)))
  (= bad_debt_write_off a!1)))

; [credit_card:write_off_approval_and_reporting] 逾期帳款轉銷須依董(理)事會授權核准並彙報
(assert (= write_off_approval_and_reporting
   (or foreign_credit_card_company_authorized_procedure
       (and write_off_approved_by_authorized_personnel
            write_off_reported_to_board))))

; [credit_card:overdue_ratio_adjustment] 逾期帳款比率超過主管機關規定應調整並接受監理措施
(assert (= overdue_ratio_adjustment
   (ite (or adjustment_and_supervisory_measures_taken
            (<= overdue_account_ratio regulatory_overdue_ratio_limit))
        1.0
        0.0)))

; [credit_card:internal_control_and_audit_established] 信用卡業務機構建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   internal_control_and_audit_system_established))

; [bank:penalty_default_false] 預設不處罰
(assert (let ((a!1 (not (and law_or_order_mandatory_compliance
                     law_or_order_prohibition_compliance
                     law_or_order_required_action_compliance
                     (= cash_card_or_credit_card_interest_rate_limit 1.0)
                     reporting_and_disclosure_compliance
                     (= bad_debt_provisioning 1.0)
                     (= bad_debt_write_off 1.0)
                     write_off_approval_and_reporting
                     internal_control_and_audit_established
                     (or (not operates_money_market_or_credit_card_business)
                         central_authority_permit_granted)
                     (or adjustment_and_supervisory_measures_taken
                         (<= overdue_account_ratio
                             regulatory_overdue_ratio_limit))))))
  (or a!1 (not penalty))))

; [bank:penalty_conditions] 處罰條件：違反銀行法或信用卡業務管理辦法相關規定時處罰
(assert (let ((a!1 (or (<= overdue_account_ratio regulatory_overdue_ratio_limit)
               (not adjustment_and_supervisory_measures_taken)
               (not law_or_order_required_action_compliance)
               (not law_or_order_prohibition_compliance)
               (and operates_money_market_or_credit_card_business
                    (not central_authority_permit_granted))
               (not (= bad_debt_provisioning 1.0))
               (not (and (>= 15.0 cash_card_interest_rate_annual_percent)
                         (>= 15.0
                             credit_card_revolving_interest_rate_annual_percent)))
               (not law_or_order_mandatory_compliance)
               (not write_off_approval_and_reporting)
               (not (= bad_debt_write_off 1.0))
               (not reporting_and_disclosure_compliance)
               (not internal_control_and_audit_established))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= operates_money_market_or_credit_card_business true))
(assert (= central_authority_permit_granted true))
(assert (= cash_card_interest_rate_annual_percent 15.0))
(assert (= credit_card_revolving_interest_rate_annual_percent 15.0))
(assert (= law_or_order_mandatory_compliance false))
(assert (= law_or_order_prohibition_compliance false))
(assert (= law_or_order_required_action_compliance false))
(assert (= reporting_to_authorities false))
(assert (= disclosure_on_website false))
(assert (= data_truthfulness false))
(assert (= bad_debt_provision_1_to_3_months 0.0))
(assert (= bad_debt_provision_amount_1_to_3_months 0.0))
(assert (= bad_debt_provision_3_to_6_months 0.0))
(assert (= bad_debt_provision_amount_3_to_6_months 0.0))
(assert (= bad_debt_provision_over_6_months 0.0))
(assert (= bad_debt_provision_amount_over_6_months 0.0))
(assert (= bad_debt_write_off_completed false))
(assert (= write_off_approved_by_authorized_personnel false))
(assert (= write_off_reported_to_board false))
(assert (= foreign_credit_card_company_authorized_procedure false))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_control_and_audit_established false))
(assert (= overdue_account_ratio 0.0))
(assert (= regulatory_overdue_ratio_limit 0.0))
(assert (= adjustment_and_supervisory_measures_taken false))
(assert (= overdue_minimum_payment_months 0))
(assert (= write_off_within_months_after_6_months 0))
(assert (= bad_debt_provisioning 0.0))
(assert (= bad_debt_write_off 0.0))
(assert (= cash_card_or_credit_card_interest_rate_limit 0.0))
(assert (= money_market_or_credit_card_business_permit false))
(assert (= overdue_ratio_adjustment 0.0))
(assert (= penalty false))
(assert (= reporting_and_disclosure_compliance false))
(assert (= total_advance_amount 0.0))
(assert (= violation_penalty_applicable false))
(assert (= write_off_approval_and_reporting false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 37
; Total facts: 37
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
