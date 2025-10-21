; SMT2 file generated from compliance case automatic
; Case ID: case_203
; Generated at: 2025-10-21T21:37:18.559668
;
; This file can be executed with Z3:
;   z3 case_203.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_experience_years Real)
(declare-const audit_leader_audit_experience_years Real)
(declare-const audit_leader_financial_experience_years Real)
(declare-const audit_staff_bad_record Bool)
(declare-const college_graduate Bool)
(declare-const control_activities_executed Bool)
(declare-const control_environment_established Bool)
(declare-const financial_experience_years Real)
(declare-const foreign_audit_staff_selected_by_board Bool)
(declare-const information_communication_effective Bool)
(declare-const internal_audit_staff_compliance Bool)
(declare-const internal_audit_staff_foreign_compliance Bool)
(declare-const internal_audit_staff_leader_experience Real)
(declare-const internal_audit_staff_no_violation_or_improved Bool)
(declare-const internal_audit_staff_qualified Bool)
(declare-const internal_audit_staff_violation_found Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_supervision_effective Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const local_regulation_defined Bool)
(declare-const monitoring_activities_performed Bool)
(declare-const passed_high_exam Bool)
(declare-const passed_international_audit_exam Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_performed Bool)
(declare-const specialized_staff_ratio Real)
(declare-const violation_improvement_days Int)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_control_ok] 建立並確實執行內部控制及稽核制度
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 建立並確實執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 建立並確實執行內部作業制度及程序
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:internal_audit_staff_qualified] 內部稽核人員具備資格條件
(assert (let ((a!1 (and (or (<= 5.0 financial_experience_years)
                    (and college_graduate
                         (or passed_high_exam passed_international_audit_exam)
                         (<= 2.0 financial_experience_years))
                    (<= 2.0 audit_experience_years))
                (>= (/ 3333333.0 10000000.0) specialized_staff_ratio)
                (not audit_staff_bad_record))))
  (= internal_audit_staff_qualified a!1)))

; [bank:internal_audit_staff_leader_experience] 內部稽核人員領隊具備經驗條件
(assert (let ((a!1 (ite (or (<= 3.0 audit_leader_audit_experience_years)
                    (and (<= 1.0 audit_leader_audit_experience_years)
                         (<= 5.0 audit_leader_financial_experience_years)))
                1.0
                0.0)))
  (= internal_audit_staff_leader_experience a!1)))

; [bank:internal_audit_staff_foreign_compliance] 國外營業單位內部稽核人員符合當地法令及主管機關要求
(assert (= internal_audit_staff_foreign_compliance
   (or (not local_regulation_defined) foreign_audit_staff_selected_by_board)))

; [bank:internal_audit_staff_compliance] 內部稽核人員符合資格且無違反規定
(assert (= internal_audit_staff_compliance
   (and internal_audit_staff_qualified
        (= internal_audit_staff_leader_experience 1.0)
        internal_audit_staff_foreign_compliance)))

; [bank:internal_audit_staff_no_violation_or_improved] 內部稽核人員無違反規定或已於二個月內改善
(assert (= internal_audit_staff_no_violation_or_improved
   (or (not internal_audit_staff_violation_found)
       (>= 60 violation_improvement_days))))

; [bank:internal_control_compliance] 內部控制及稽核制度符合規定
(assert (= internal_control_compliance
   (and internal_control_ok
        internal_handling_ok
        internal_operation_ok
        internal_audit_staff_compliance
        internal_audit_staff_no_violation_or_improved)))

; [bank:internal_control_supervision_effective] 內部控制制度監督作業有效
(assert (= internal_control_supervision_effective
   (and control_environment_established
        risk_assessment_performed
        control_activities_executed
        information_communication_effective
        monitoring_activities_performed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行內部控制、內部處理、內部作業制度或內部稽核人員資格不符且未改善時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_audit_staff_no_violation_or_improved)
       (not internal_handling_ok)
       (not internal_audit_staff_compliance)
       (not internal_operation_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= audit_experience_years 1.0))
(assert (= college_graduate false))
(assert (= passed_high_exam false))
(assert (= passed_international_audit_exam false))
(assert (= financial_experience_years 1.0))
(assert (= specialized_staff_ratio (/ 1.0 2.0)))
(assert (= audit_staff_bad_record true))
(assert (= internal_audit_staff_violation_found true))
(assert (= violation_improvement_days 7))
(assert (= audit_leader_audit_experience_years (/ 1.0 2.0)))
(assert (= audit_leader_financial_experience_years 2.0))
(assert (= foreign_audit_staff_selected_by_board false))
(assert (= local_regulation_defined true))
(assert (= control_environment_established false))
(assert (= risk_assessment_performed false))
(assert (= control_activities_executed false))
(assert (= information_communication_effective false))
(assert (= monitoring_activities_performed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 41
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
