; SMT2 file generated from compliance case automatic
; Case ID: case_227
; Generated at: 2025-10-21T05:03:43.792578
;
; This file can be executed with Z3:
;   z3 case_227.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_audit_plan_prepared Bool)
(declare-const annual_financial_report_audit_performed Bool)
(declare-const audit_leader_experience_years Real)
(declare-const audit_manual_and_workpapers_prepared Bool)
(declare-const audit_organization_planned Bool)
(declare-const audit_staff_ratio Real)
(declare-const audit_supervision_performed Bool)
(declare-const college_graduate Bool)
(declare-const control_activities_executed Bool)
(declare-const control_environment_established Bool)
(declare-const derivative_operation_ok Bool)
(declare-const financial_experience_years Real)
(declare-const financial_report_audited_by_cpa Bool)
(declare-const has_major_disciplinary_record Bool)
(declare-const improvement_followed_up Bool)
(declare-const improvement_within_two_months Bool)
(declare-const information_and_communication_effective Bool)
(declare-const internal_audit_experience_years Real)
(declare-const internal_audit_reports_reviewed Int)
(declare-const internal_audit_staff_compliance Bool)
(declare-const internal_audit_staff_qualified Bool)
(declare-const internal_audit_unit_duties_performed Bool)
(declare-const internal_control_and_handling_and_operation_ok Bool)
(declare-const internal_control_audit_by_cpa Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_deficiencies_communicated Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_derivative_operation_established Bool)
(declare-const internal_derivative_operation_executed Bool)
(declare-const internal_derivative_operation_system_established Bool)
(declare-const internal_derivative_operation_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const monitoring_activities_performed Bool)
(declare-const passed_cia_exam Bool)
(declare-const passed_equivalent_exam Bool)
(declare-const passed_high_exam Bool)
(declare-const penalty Bool)
(declare-const personal_data_and_aml_audit_performed Bool)
(declare-const professional_experience_years Real)
(declare-const received_financial_training Bool)
(declare-const risk_assessment_performed Bool)
(declare-const self_audit_reports_reviewed Int)
(declare-const special_audit_by_cpa_performed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_derivative_operation_established] 建立衍生性金融商品內部作業制度及程序
(assert (= internal_derivative_operation_established
   internal_derivative_operation_system_established))

; [bank:internal_derivative_operation_executed] 衍生性金融商品內部作業制度及程序確實執行
(assert (= internal_derivative_operation_executed
   internal_derivative_operation_system_executed))

; [bank:internal_control_and_handling_and_operation_ok] 內部控制、處理及作業制度均建立且確實執行
(assert (= internal_control_and_handling_and_operation_ok
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed
        internal_operation_established
        internal_operation_executed)))

; [bank:derivative_operation_ok] 衍生性金融商品內部作業制度建立且確實執行
(assert (= derivative_operation_ok
   (and internal_derivative_operation_established
        internal_derivative_operation_executed)))

; [bank:internal_control_compliance] 銀行內部控制及稽核制度符合金融控股公司及銀行業內部控制及稽核制度實施辦法第7條要求
(assert (= internal_control_compliance
   (and control_environment_established
        risk_assessment_performed
        control_activities_executed
        information_and_communication_effective
        monitoring_activities_performed)))

; [bank:internal_audit_staff_qualified] 內部稽核人員具備資格條件
(assert (let ((a!1 (and (or (<= 2.0 internal_audit_experience_years)
                    (and college_graduate
                         (or passed_equivalent_exam
                             passed_cia_exam
                             passed_high_exam)
                         (<= 2.0 financial_experience_years))
                    (<= 5.0 financial_experience_years)
                    (and (<= 2.0 professional_experience_years)
                         received_financial_training))
                (not has_major_disciplinary_record)
                (or (not (<= 3.0 audit_leader_experience_years))
                    (and (<= 1.0 audit_leader_experience_years)
                         (<= 5.0 financial_experience_years)))
                (>= (/ 3333333.0 10000000.0) audit_staff_ratio))))
  (= internal_audit_staff_qualified a!1)))

; [bank:internal_audit_staff_compliance] 內部稽核人員符合資格且無違規紀錄，違規者限期改善
(assert (= internal_audit_staff_compliance
   (or improvement_within_two_months internal_audit_staff_qualified)))

; [bank:internal_audit_unit_duties_performed] 內部稽核單位執行規劃、督導及年度稽核計畫
(assert (= internal_audit_unit_duties_performed
   (and audit_organization_planned
        audit_manual_and_workpapers_prepared
        audit_supervision_performed
        annual_audit_plan_prepared)))

; [bank:internal_audit_reports_reviewed] 內部稽核單位覆核自行查核報告及缺失改善情形
(assert (= internal_audit_reports_reviewed
   (ite (and (= self_audit_reports_reviewed 1)
             internal_control_deficiencies_communicated
             improvement_followed_up)
        1
        0)))

; [bank:annual_financial_report_audit_performed] 年度財務報表由會計師查核簽證並委託會計師查核內部控制制度
(assert (= annual_financial_report_audit_performed
   (and financial_report_audited_by_cpa internal_control_audit_by_cpa)))

; [bank:personal_data_and_aml_audit_performed] 依主管機關規定委託會計師辦理個人資料保護與防制洗錢及打擊資恐機制專案查核
(assert (= personal_data_and_aml_audit_performed special_audit_by_cpa_performed))

; [bank:internal_control_penalty_conditions] 處罰條件：未依規定建立或執行內部控制、處理、作業制度或衍生性金融商品內部作業制度
(assert (= penalty
   (or (not internal_control_executed)
       (not internal_handling_executed)
       (not internal_control_established)
       (not internal_derivative_operation_established)
       (not internal_derivative_operation_executed)
       (not internal_operation_established)
       (not internal_handling_established)
       (not internal_operation_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= internal_derivative_operation_system_established false))
(assert (= internal_derivative_operation_system_executed false))
(assert (= internal_audit_staff_qualified false))
(assert (= improvement_within_two_months false))
(assert (= internal_audit_staff_compliance false))
(assert (= audit_organization_planned false))
(assert (= audit_manual_and_workpapers_prepared false))
(assert (= audit_supervision_performed false))
(assert (= annual_audit_plan_prepared false))
(assert (= financial_report_audited_by_cpa false))
(assert (= internal_control_audit_by_cpa false))
(assert (= special_audit_by_cpa_performed false))
(assert (= personal_data_and_aml_audit_performed false))
(assert (= control_environment_established false))
(assert (= risk_assessment_performed false))
(assert (= control_activities_executed false))
(assert (= information_and_communication_effective false))
(assert (= monitoring_activities_performed false))
(assert (= internal_control_deficiencies_communicated false))
(assert (= improvement_followed_up false))
(assert (= internal_audit_reports_reviewed 0))
(assert (= audit_leader_experience_years 0))
(assert (= audit_staff_ratio (/ 1.0 2.0)))
(assert (= college_graduate false))
(assert (= passed_high_exam false))
(assert (= passed_equivalent_exam false))
(assert (= passed_cia_exam false))
(assert (= financial_experience_years 0))
(assert (= professional_experience_years 0))
(assert (= received_financial_training false))
(assert (= has_major_disciplinary_record true))
(assert (= penalty true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_derivative_operation_established false))
(assert (= internal_derivative_operation_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 53
; Total facts: 46
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
