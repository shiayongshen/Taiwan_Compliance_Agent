; SMT2 file generated from compliance case automatic
; Case ID: case_203
; Generated at: 2025-10-19T10:25:11.078836
;
; This file can be executed with Z3:
;   z3 case_203.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_experience_years Int)
(declare-const audit_or_inspection_experience_years Int)
(declare-const college_graduate Bool)
(declare-const control_activities_executed Bool)
(declare-const control_environment_established Bool)
(declare-const days_since_violation_found Int)
(declare-const financial_experience_years Int)
(declare-const has_major_disciplinary_record Bool)
(declare-const information_and_communication_effective Bool)
(declare-const internal_audit_staff_compliance Bool)
(declare-const internal_audit_staff_ok Bool)
(declare-const internal_audit_staff_qualified Bool)
(declare-const internal_control_comprehensive Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
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
(declare-const is_team_leader Bool)
(declare-const monitoring_activities_performed Bool)
(declare-const passed_equivalent_exam Bool)
(declare-const passed_high_exam Bool)
(declare-const passed_international_audit_exam Bool)
(declare-const penalty Bool)
(declare-const professional_experience_years Int)
(declare-const received_financial_training Bool)
(declare-const risk_assessment_performed Bool)
(declare-const violation_found Bool)

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
(assert (let ((a!1 (and (or (<= 2 audit_experience_years)
                    (and college_graduate
                         (or passed_international_audit_exam
                             passed_equivalent_exam
                             passed_high_exam)
                         (<= 2 financial_experience_years))
                    (and (<= 5 financial_experience_years)
                         (<= 2 professional_experience_years)
                         received_financial_training))
                (not has_major_disciplinary_record)
                (or (not is_team_leader)
                    (<= 3 audit_or_inspection_experience_years)
                    (and (<= 1 audit_experience_years)
                         (<= 5 financial_experience_years))))))
  (= internal_audit_staff_qualified a!1)))

; [bank:internal_audit_staff_compliance] 內部稽核人員無違反規定且逾期未改善
(assert (not (= (and violation_found (>= 60 days_since_violation_found))
        internal_audit_staff_compliance)))

; [bank:internal_audit_staff_ok] 內部稽核人員符合資格且無違反規定逾期未改善
(assert (= internal_audit_staff_ok
   (and internal_audit_staff_qualified internal_audit_staff_compliance)))

; [bank:internal_control_comprehensive] 內部控制制度包含控制環境、風險評估、控制作業、資訊與溝通、監督作業
(assert (= internal_control_comprehensive
   (and control_environment_established
        risk_assessment_performed
        control_activities_executed
        information_and_communication_effective
        monitoring_activities_performed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行內部控制、內部處理、內部作業制度或內部稽核人員資格不符或違反規定逾期未改善時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_audit_staff_ok)
       (not internal_handling_ok)
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
(assert (= audit_experience_years 0))
(assert (= audit_or_inspection_experience_years 0))
(assert (= college_graduate false))
(assert (= financial_experience_years 0))
(assert (= has_major_disciplinary_record false))
(assert (= days_since_violation_found 7))
(assert (= passed_equivalent_exam false))
(assert (= passed_high_exam false))
(assert (= passed_international_audit_exam false))
(assert (= professional_experience_years 0))
(assert (= received_financial_training false))
(assert (= violation_found true))
(assert (= is_team_leader false))
(assert (= control_environment_established false))
(assert (= risk_assessment_performed false))
(assert (= control_activities_executed false))
(assert (= information_and_communication_effective false))
(assert (= monitoring_activities_performed false))
(assert (= internal_audit_staff_compliance false))
(assert (= internal_audit_staff_ok false))
(assert (= internal_audit_staff_qualified false))
(assert (= internal_control_comprehensive false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_operation_ok false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 38
; Total facts: 38
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
