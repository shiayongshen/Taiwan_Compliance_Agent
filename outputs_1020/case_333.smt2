; SMT2 file generated from compliance case automatic
; Case ID: case_333
; Generated at: 2025-10-19T13:27:46.049106
;
; This file can be executed with Z3:
;   z3 case_333.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_compliance Bool)
(declare-const asset_allocation_considered_risks Bool)
(declare-const asset_quality_and_loss_provisioning_established Bool)
(declare-const avg_allowance_coverage_ratio Real)
(declare-const avg_nonperforming_loan_ratio Real)
(declare-const capital_adequacy_monitored Bool)
(declare-const capital_to_risk_assets_ratio Real)
(declare-const credit_limit_ratio Real)
(declare-const credit_limit_ratio_adjusted Real)
(declare-const credit_to_non_mainland_entities Real)
(declare-const credit_to_third_country_entities Real)
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
(declare-const liquidity_management_mechanism_established Bool)
(declare-const net_assets_last_year Real)
(declare-const penalty Bool)
(declare-const report_submitted_on_time Bool)
(declare-const risk_control_mechanism_compliance Bool)
(declare-const risk_management_policy_approved_by_board Bool)
(declare-const risk_management_policy_compliance Bool)
(declare-const risk_management_policy_established Bool)
(declare-const short_term_trade_financing_and_syndicated_loans Real)

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

; [bank:credit_limit_ratio] 授信業務比率（百分比）
(assert (let ((a!1 (* 100.0
              (/ (+ credit_to_third_country_entities
                    credit_to_non_mainland_entities
                    (* (- 1.0) short_term_trade_financing_and_syndicated_loans))
                 net_assets_last_year))))
  (= credit_limit_ratio a!1)))

; [bank:credit_limit_ratio_adjusted] 授信業務比率調整後（最高50%）
(assert (let ((a!1 (ite (and (not (<= (/ 3.0 2.0) avg_nonperforming_loan_ratio))
                     (not (<= avg_allowance_coverage_ratio 80.0))
                     (not (<= capital_to_risk_assets_ratio 10.0))
                     (not (<= credit_limit_ratio 20.0)))
                50.0
                30.0)))
  (= credit_limit_ratio_adjusted a!1)))

; [bank:annual_report_compliance] 每年一月及七月底前函報授信比率及相關指標
(assert (= annual_report_compliance report_submitted_on_time))

; [bank:risk_management_policy_compliance] 訂定風險管理政策與程序且經董事會通過
(assert (= risk_management_policy_compliance
   (and risk_management_policy_established
        risk_management_policy_approved_by_board)))

; [bank:risk_control_mechanism_compliance] 銀行業風險控管機制符合規定原則
(assert (= risk_control_mechanism_compliance
   (and capital_adequacy_monitored
        liquidity_management_mechanism_established
        asset_allocation_considered_risks
        asset_quality_and_loss_provisioning_established
        information_security_and_emergency_plan_established)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度或未符其他法定要求時處罰
(assert (= penalty
   (or (not internal_handling_compliance)
       (not risk_control_mechanism_compliance)
       (not risk_management_policy_compliance)
       (not internal_operation_compliance)
       (not internal_control_compliance)
       (not annual_report_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established true))
(assert (= internal_operation_executed false))
(assert (= credit_to_non_mainland_entities 51.0))
(assert (= credit_to_third_country_entities 0.0))
(assert (= short_term_trade_financing_and_syndicated_loans 0.0))
(assert (= net_assets_last_year 100.0))
(assert (= avg_nonperforming_loan_ratio 0.0))
(assert (= avg_allowance_coverage_ratio 0.0))
(assert (= capital_to_risk_assets_ratio 0.0))
(assert (= report_submitted_on_time true))
(assert (= risk_management_policy_established true))
(assert (= risk_management_policy_approved_by_board true))
(assert (= risk_management_policy_compliance true))
(assert (= capital_adequacy_monitored true))
(assert (= liquidity_management_mechanism_established true))
(assert (= asset_allocation_considered_risks true))
(assert (= asset_quality_and_loss_provisioning_established true))
(assert (= information_security_and_emergency_plan_established true))
(assert (= risk_control_mechanism_compliance true))
(assert (= annual_report_compliance true))
(assert (= credit_limit_ratio 0.0))
(assert (= credit_limit_ratio_adjusted 0.0))
(assert (= internal_control_compliance false))
(assert (= internal_handling_compliance false))
(assert (= internal_operation_compliance false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 30
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
