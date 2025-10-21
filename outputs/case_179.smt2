; SMT2 file generated from compliance case automatic
; Case ID: case_179
; Generated at: 2025-10-21T04:00:55.619819
;
; This file can be executed with Z3:
;   z3 case_179.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const account_monitoring_policy_established Bool)
(declare-const account_monitoring_policy_reviewed Bool)
(declare-const audit_procedures_established Bool)
(declare-const compliance_overall Bool)
(declare-const control_procedures_established Bool)
(declare-const customer_data_integrated Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_execution_confirmed Bool)
(declare-const internal_control_procedures_for_data_access Bool)
(declare-const monitoring_execution_recorded Bool)
(declare-const monitoring_policy_includes_required_elements Bool)
(declare-const monitoring_policy_review_and_update_done Bool)
(declare-const monitoring_policy_written Bool)
(declare-const monitoring_records_kept Bool)
(declare-const monitoring_records_retained_within_period Bool)
(declare-const other_designated_matters_established Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const risk_based_monitoring_policy_established Bool)
(declare-const training_held_regularly Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 已建立洗錢防制內部控制與稽核制度，包含防制作業程序、在職訓練、專責人員、風險評估報告、稽核程序及其他指定事項
(assert (= internal_control_established
   (and control_procedures_established
        training_held_regularly
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_established)))

; [aml:internal_control_executed] 已執行洗錢防制內部控制與稽核制度
(assert (= internal_control_executed internal_control_execution_confirmed))

; [aml:account_monitoring_policy_established] 已建立帳戶或交易監控政策與程序，包含資訊系統整合、內部控制程序、風險基礎方法、完整監控型態及書面化
(assert (= account_monitoring_policy_established
   (and customer_data_integrated
        internal_control_procedures_for_data_access
        risk_based_monitoring_policy_established
        monitoring_policy_includes_required_elements
        monitoring_policy_written)))

; [aml:account_monitoring_policy_reviewed] 已依據法令及風險評估定期檢討並更新帳戶或交易監控政策及程序
(assert (= account_monitoring_policy_reviewed monitoring_policy_review_and_update_done))

; [aml:monitoring_records_kept] 帳戶或交易持續監控情形有記錄，並依規定期限保存
(assert (= monitoring_records_kept
   (and monitoring_execution_recorded monitoring_records_retained_within_period)))

; [aml:compliance_overall] 洗錢防制內部控制制度建立且執行，帳戶監控政策建立、檢討及監控記錄保存均符合規定
(assert (= compliance_overall
   (and internal_control_established
        internal_control_executed
        account_monitoring_policy_established
        account_monitoring_policy_reviewed
        monitoring_records_kept)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行洗錢防制內部控制制度，或帳戶監控政策未建立、未檢討更新、未保存監控記錄時處罰
(assert (= penalty
   (or (not internal_control_executed)
       (not account_monitoring_policy_established)
       (not monitoring_records_kept)
       (not account_monitoring_policy_reviewed)
       (not internal_control_established))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held_regularly false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_established false))
(assert (= internal_control_execution_confirmed false))
(assert (= customer_data_integrated false))
(assert (= internal_control_procedures_for_data_access false))
(assert (= risk_based_monitoring_policy_established false))
(assert (= monitoring_policy_includes_required_elements false))
(assert (= monitoring_policy_written false))
(assert (= monitoring_policy_review_and_update_done false))
(assert (= monitoring_execution_recorded false))
(assert (= monitoring_records_retained_within_period false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 22
; Total facts: 16
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
