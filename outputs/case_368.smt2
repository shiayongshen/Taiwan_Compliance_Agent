; SMT2 file generated from compliance case automatic
; Case ID: case_368
; Generated at: 2025-10-21T08:12:22.582438
;
; This file can be executed with Z3:
;   z3 case_368.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bad_debt_provision_level Real)
(declare-const bad_debt_provision_rate Real)
(declare-const bad_debt_provision_rate_correct Bool)
(declare-const bad_debt_write_off_approved Bool)
(declare-const bad_debt_write_off_timing_correct Bool)
(declare-const central_authority_permit Bool)
(declare-const credit_card_annual_interest_rate Real)
(declare-const credit_card_business_permitted Bool)
(declare-const credit_card_interest_rate_ok Bool)
(declare-const credit_card_reporting_compliance Bool)
(declare-const foreign_card_company_authorized Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_system_established Bool)
(declare-const overdue_months Int)
(declare-const penalty Bool)
(declare-const reporting_data_correct Bool)
(declare-const reporting_disclosed Bool)
(declare-const reporting_submitted Bool)
(declare-const write_off_approved_by_authorized_personnel Bool)
(declare-const write_off_months_after_overdue Int)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:credit_card_interest_rate_limit] 信用卡業務循環信用利率不得超過年利率15%
(assert (= credit_card_interest_rate_ok (>= 15.0 credit_card_annual_interest_rate)))

; [bank:credit_card_reporting_compliance] 信用卡業務機構依主管機關及中央銀行規定定期申報及揭露資料且資料正確
(assert (= credit_card_reporting_compliance
   (and reporting_submitted reporting_disclosed reporting_data_correct)))

; [bank:credit_card_bad_debt_provision_level] 逾期帳款備抵呆帳提列等級（1=正常,2=1-3月逾期,3=3-6月逾期,4=超過6月逾期）
(assert (let ((a!1 (ite (and (<= 3 overdue_months) (not (<= 6 overdue_months)))
                3
                (ite (<= 6 overdue_months) 4 1))))
(let ((a!2 (ite (and (<= 1 overdue_months) (not (<= 3 overdue_months))) 2 a!1)))
  (= bad_debt_provision_level (to_real a!2)))))

; [bank:bad_debt_provision_rate_correct] 備抵呆帳提列比率符合逾期月份規定
(assert (= bad_debt_provision_rate_correct
   (or (and (= 4.0 bad_debt_provision_level) (= 100.0 bad_debt_provision_rate))
       (and (= 2.0 bad_debt_provision_level) (= 2.0 bad_debt_provision_rate))
       (and (= 3.0 bad_debt_provision_level) (= 50.0 bad_debt_provision_rate))
       (= 1.0 bad_debt_provision_level))))

; [bank:bad_debt_write_off_timing_correct] 逾期帳款轉銷時間符合規定
(assert (= bad_debt_write_off_timing_correct
   (or (and (= 4.0 bad_debt_provision_level)
            (>= 3 write_off_months_after_overdue))
       (not (= 4.0 bad_debt_provision_level)))))

; [bank:bad_debt_write_off_approval] 逾期帳款轉銷經董（理）事會授權及核准
(assert (= bad_debt_write_off_approved
   (or foreign_card_company_authorized
       write_off_approved_by_authorized_personnel)))

; [bank:internal_control_established] 信用卡業務機構建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:credit_card_business_permitted] 經營信用卡業務須經中央主管機關許可
(assert (= credit_card_business_permitted central_authority_permit))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反信用卡利率限制、申報揭露規定、備抵呆帳提列及轉銷規定、內部控制制度建立或未經許可經營信用卡業務時處罰
(assert (= penalty
   (or (not bad_debt_write_off_approved)
       (not credit_card_interest_rate_ok)
       (not internal_control_established)
       (not bad_debt_provision_rate_correct)
       (not bad_debt_write_off_timing_correct)
       (not credit_card_business_permitted)
       (not credit_card_reporting_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= credit_card_annual_interest_rate 10.0))
(assert (= reporting_submitted true))
(assert (= reporting_disclosed true))
(assert (= reporting_data_correct false))
(assert (= overdue_months 0))
(assert (= bad_debt_provision_rate 0.0))
(assert (= bad_debt_write_off_approved false))
(assert (= write_off_approved_by_authorized_personnel false))
(assert (= write_off_months_after_overdue 0))
(assert (= central_authority_permit true))
(assert (= internal_control_system_established false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 20
; Total facts: 11
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
