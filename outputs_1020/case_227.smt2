; SMT2 file generated from compliance case automatic
; Case ID: case_227
; Generated at: 2025-10-19T10:55:31.572455
;
; This file can be executed with Z3:
;   z3 case_227.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const internal_audit_staff_adjusted Bool)
(declare-const internal_audit_staff_adjusted_if_violation Bool)
(declare-const internal_audit_staff_compliance Bool)
(declare-const internal_audit_staff_compliant Bool)
(declare-const internal_audit_staff_leader_experience Bool)
(declare-const internal_audit_staff_leader_meet_experience Bool)
(declare-const internal_audit_staff_meet_qualification Bool)
(declare-const internal_audit_staff_no_bad_record Bool)
(declare-const internal_audit_staff_qualified Bool)
(declare-const internal_audit_unit_annual_plan Bool)
(declare-const internal_audit_unit_annual_plan_done Bool)
(declare-const internal_audit_unit_duties_planned Bool)
(declare-const internal_audit_unit_effective Bool)
(declare-const internal_audit_unit_plan_and_manual_completed Bool)
(declare-const internal_audit_unit_review_done Bool)
(declare-const internal_audit_unit_review_self_check_reports Bool)
(declare-const internal_audit_unit_supervise_self_check Bool)
(declare-const internal_audit_unit_supervise_self_check_done Bool)
(declare-const internal_control_comprehensive Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_derivative_operation_established Bool)
(declare-const internal_derivative_operation_executed Bool)
(declare-const internal_derivative_operation_ok Bool)
(declare-const internal_derivative_operation_system_established Bool)
(declare-const internal_derivative_operation_system_executed Bool)
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
(declare-const penalty Bool)

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

; [bank:internal_derivative_operation_established] 建立衍生性金融商品業務內部作業制度及程序
(assert (= internal_derivative_operation_established
   internal_derivative_operation_system_established))

; [bank:internal_derivative_operation_executed] 衍生性金融商品業務內部作業制度及程序確實執行
(assert (= internal_derivative_operation_executed
   internal_derivative_operation_system_executed))

; [bank:internal_control_ok] 建立並確實執行內部控制及稽核制度
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 建立並確實執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 建立並確實執行內部作業制度及程序
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:internal_derivative_operation_ok] 建立並確實執行衍生性金融商品業務內部作業制度及程序
(assert (= internal_derivative_operation_ok
   (and internal_derivative_operation_established
        internal_derivative_operation_executed)))

; [bank:internal_audit_staff_qualified] 內部稽核人員具備資格條件
(assert (= internal_audit_staff_qualified internal_audit_staff_meet_qualification))

; [bank:internal_audit_staff_compliant] 內部稽核人員無不良紀錄且符合規定
(assert (= internal_audit_staff_compliant internal_audit_staff_no_bad_record))

; [bank:internal_audit_staff_leader_experience] 內部稽核人員充任領隊具備經驗
(assert (= internal_audit_staff_leader_experience
   internal_audit_staff_leader_meet_experience))

; [bank:internal_audit_staff_compliance] 內部稽核人員符合所有資格及規定
(assert (= internal_audit_staff_compliance
   (and internal_audit_staff_qualified
        internal_audit_staff_compliant
        internal_audit_staff_leader_experience)))

; [bank:internal_audit_staff_adjusted_if_violation] 違反資格規定者於二個月內改善，逾期未改善應調整職務
(assert (= internal_audit_staff_adjusted_if_violation
   (or internal_audit_staff_adjusted internal_audit_staff_compliance)))

; [bank:internal_audit_unit_duties_planned] 內部稽核單位規劃組織、編制與職掌並編撰工作手冊
(assert (= internal_audit_unit_duties_planned
   internal_audit_unit_plan_and_manual_completed))

; [bank:internal_audit_unit_supervise_self_check] 督導業務管理單位自行查核及執行情形
(assert (= internal_audit_unit_supervise_self_check
   internal_audit_unit_supervise_self_check_done))

; [bank:internal_audit_unit_annual_plan] 擬訂年度稽核計畫並訂定查核計畫
(assert (= internal_audit_unit_annual_plan internal_audit_unit_annual_plan_done))

; [bank:internal_audit_unit_review_self_check_reports] 覆核各單位自行查核報告及內部控制缺失改善情形
(assert (= internal_audit_unit_review_self_check_reports
   internal_audit_unit_review_done))

; [bank:internal_audit_unit_effective] 內部稽核單位有效執行其職責
(assert (= internal_audit_unit_effective
   (and internal_audit_unit_duties_planned
        internal_audit_unit_supervise_self_check
        internal_audit_unit_annual_plan
        internal_audit_unit_review_self_check_reports)))

; [bank:internal_control_comprehensive] 建立完備內部控制制度並有效執行
(assert (= internal_control_comprehensive
   (and internal_control_ok
        internal_handling_ok
        internal_operation_ok
        internal_derivative_operation_ok
        internal_audit_unit_effective)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行內部控制、內部處理、內部作業制度或未符合內部稽核人員資格規定時處罰
(assert (= penalty
   (or (not internal_operation_ok)
       (not internal_audit_unit_effective)
       (not internal_audit_staff_compliance)
       (not internal_control_ok)
       (not internal_derivative_operation_ok)
       (not internal_handling_ok))))

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
(assert (= internal_audit_staff_meet_qualification true))
(assert (= internal_audit_staff_no_bad_record true))
(assert (= internal_audit_staff_leader_meet_experience true))
(assert (= internal_audit_staff_adjusted false))
(assert (= internal_audit_staff_adjusted_if_violation false))
(assert (= internal_audit_staff_compliance false))
(assert (= internal_audit_staff_compliant false))
(assert (= internal_audit_staff_leader_experience false))
(assert (= internal_audit_staff_qualified false))
(assert (= internal_audit_unit_annual_plan false))
(assert (= internal_audit_unit_annual_plan_done false))
(assert (= internal_audit_unit_duties_planned false))
(assert (= internal_audit_unit_effective false))
(assert (= internal_audit_unit_plan_and_manual_completed false))
(assert (= internal_audit_unit_review_done false))
(assert (= internal_audit_unit_review_self_check_reports false))
(assert (= internal_audit_unit_supervise_self_check false))
(assert (= internal_audit_unit_supervise_self_check_done false))
(assert (= internal_control_comprehensive false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_ok false))
(assert (= internal_derivative_operation_established false))
(assert (= internal_derivative_operation_executed false))
(assert (= internal_derivative_operation_ok false))
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
; Total constraints: 25
; Total variables: 40
; Total facts: 40
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
