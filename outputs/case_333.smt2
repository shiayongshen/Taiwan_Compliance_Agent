; SMT2 file generated from compliance case automatic
; Case ID: case_333
; Generated at: 2025-10-21T07:30:00.807772
;
; This file can be executed with Z3:
;   z3 case_333.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_compliance Bool)
(declare-const asset_allocation_considered Bool)
(declare-const asset_quality_evaluated Bool)
(declare-const avg_bad_debt_coverage_ratio_6m Real)
(declare-const avg_overdue_loan_ratio_6m Real)
(declare-const capital_adequacy_monitored Bool)
(declare-const capital_to_risk_assets_ratio_6m Real)
(declare-const credit_balance_non_mainland_foreign Real)
(declare-const credit_balance_third_area Real)
(declare-const credit_limit_increase_eligibility Bool)
(declare-const credit_limit_ratio Real)
(declare-const credit_limit_ratio_adjusted Real)
(declare-const credit_limit_ratio_increased Bool)
(declare-const information_security_and_emergency_plan_established Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_operation_compliance Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const liquidity_management_established Bool)
(declare-const net_asset_last_year Real)
(declare-const penalty Bool)
(declare-const ratios_within_limits Bool)
(declare-const report_submitted_jan Bool)
(declare-const report_submitted_jul Bool)
(declare-const risk_control_mechanism_compliance Bool)
(declare-const risk_management_policy_approved Bool)
(declare-const risk_management_policy_compliance Bool)
(declare-const risk_management_policy_established Bool)
(declare-const short_term_trade_finance Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_compliance] 建立內部控制及稽核制度且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_compliance] 建立內部處理制度及程序且確實執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_compliance] 建立內部作業制度及程序且確實執行
(assert (= internal_operation_compliance
   (and internal_operation_established internal_operation_executed)))

; [bank:credit_limit_ratio] 第三地區分支機構及國際金融業務分行授信業務比率（%）
(assert (let ((a!1 (* 100.0
              (/ (+ credit_balance_third_area
                    credit_balance_non_mainland_foreign
                    (* (- 1.0) short_term_trade_finance))
                 net_asset_last_year))))
  (= credit_limit_ratio a!1)))

; [bank:credit_limit_ratio_adjusted] 提高授信業務比率後之授信業務比率（%）
(assert (= credit_limit_ratio_adjusted
   (ite credit_limit_ratio_increased 1.0 credit_limit_ratio)))

; [bank:credit_limit_increase_eligibility] 符合提高授信業務比率條件
(assert (= credit_limit_increase_eligibility
   (and (not (<= (/ 3.0 2.0) avg_overdue_loan_ratio_6m))
        (not (<= avg_bad_debt_coverage_ratio_6m 80.0))
        (not (<= capital_to_risk_assets_ratio_6m 10.0))
        (not (<= credit_limit_ratio 20.0)))))

; [bank:annual_report_compliance] 每年一月及七月底前函報授信業務比率及相關比率
(assert (= annual_report_compliance
   (and report_submitted_jan report_submitted_jul ratios_within_limits)))

; [bank:risk_management_policy_compliance] 訂定並通過風險管理政策與程序
(assert (= risk_management_policy_compliance
   (and risk_management_policy_established risk_management_policy_approved)))

; [bank:risk_control_mechanism_compliance] 銀行業風險控管機制符合規定原則
(assert (= risk_control_mechanism_compliance
   (and capital_adequacy_monitored
        liquidity_management_established
        asset_allocation_considered
        asset_quality_evaluated
        information_security_and_emergency_plan_established)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度或未符授信比率及風險管理規定時處罰
(assert (let ((a!1 (or (and (not (<= credit_limit_ratio 30.0))
                    (not credit_limit_increase_eligibility))
               (not internal_operation_compliance)
               (not annual_report_compliance)
               (not internal_handling_compliance)
               (not risk_control_mechanism_compliance)
               (not internal_control_compliance)
               (not risk_management_policy_compliance))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= internal_operation_established true))
(assert (= internal_operation_executed true))
(assert (= credit_balance_third_area 3500000000))
(assert (= credit_balance_non_mainland_foreign 1500000000))
(assert (= short_term_trade_finance 1000000000))
(assert (= net_asset_last_year 10000000000))
(assert (= credit_limit_ratio_increased false))
(assert (= avg_overdue_loan_ratio_6m 2.0))
(assert (= avg_bad_debt_coverage_ratio_6m 70.0))
(assert (= capital_to_risk_assets_ratio_6m 9.0))
(assert (= report_submitted_jan true))
(assert (= report_submitted_jul true))
(assert (= ratios_within_limits false))
(assert (= risk_management_policy_established true))
(assert (= risk_management_policy_approved true))
(assert (= capital_adequacy_monitored true))
(assert (= liquidity_management_established true))
(assert (= asset_allocation_considered true))
(assert (= asset_quality_evaluated true))
(assert (= information_security_and_emergency_plan_established true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 34
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
