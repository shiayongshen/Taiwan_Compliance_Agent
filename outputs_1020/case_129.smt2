; SMT2 file generated from compliance case automatic
; Case ID: case_129
; Generated at: 2025-10-19T08:45:31.651015
;
; This file can be executed with Z3:
;   z3 case_129.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_revenue Real)
(declare-const audit_system_compliance Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_established_flag Bool)
(declare-const audit_system_executed Bool)
(declare-const audit_system_executed_flag Bool)
(declare-const handling_system_compliance Bool)
(declare-const handling_system_established Bool)
(declare-const handling_system_established_flag Bool)
(declare-const handling_system_executed Bool)
(declare-const handling_system_executed_flag Bool)
(declare-const internal_control_audit_handling_compliance Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_flag Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_executed_flag Bool)
(declare-const is_publicly_listed_company Bool)
(declare-const penalty Bool)
(declare-const required_to_establish_system Bool)
(declare-const system_establishment_compliance Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established] 已建立內部控制制度
(assert (= internal_control_established internal_control_established_flag))

; [insurance:internal_control_executed] 已確實執行內部控制制度
(assert (= internal_control_executed internal_control_executed_flag))

; [insurance:audit_system_established] 已建立稽核制度
(assert (= audit_system_established audit_system_established_flag))

; [insurance:audit_system_executed] 已確實執行稽核制度
(assert (= audit_system_executed audit_system_executed_flag))

; [insurance:handling_system_established] 已建立招攬處理制度及程序
(assert (= handling_system_established handling_system_established_flag))

; [insurance:handling_system_executed] 已確實執行招攬處理制度及程序
(assert (= handling_system_executed handling_system_executed_flag))

; [insurance:internal_control_compliance] 內部控制制度建立且執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:audit_system_compliance] 稽核制度建立且執行
(assert (= audit_system_compliance (and audit_system_established audit_system_executed)))

; [insurance:handling_system_compliance] 招攬處理制度及程序建立且執行
(assert (= handling_system_compliance
   (and handling_system_established handling_system_executed)))

; [insurance:internal_control_audit_handling_compliance] 內部控制、稽核及招攬處理制度均建立且執行
(assert (= internal_control_audit_handling_compliance
   (and internal_control_compliance
        audit_system_compliance
        handling_system_compliance)))

; [insurance:required_to_establish_system] 應於次一年內建立內部控制、稽核及招攬處理制度及程序（公開發行公司或營收達2億）
(assert (= required_to_establish_system
   (or is_publicly_listed_company (<= 200000000.0 annual_revenue))))

; [insurance:system_establishment_compliance] 符合建立內部控制、稽核及招攬處理制度及程序之規定
(assert (= system_establishment_compliance
   (or internal_control_audit_handling_compliance
       (not required_to_establish_system))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行內部控制、稽核制度或招攬處理制度及程序時處罰
(assert (= penalty
   (and required_to_establish_system
        (not internal_control_audit_handling_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established_flag false))
(assert (= internal_control_executed_flag false))
(assert (= audit_system_established_flag true))
(assert (= audit_system_executed_flag true))
(assert (= handling_system_established_flag true))
(assert (= handling_system_executed_flag true))
(assert (= is_publicly_listed_company false))
(assert (= annual_revenue 0.0))
(assert (= required_to_establish_system false))
(assert (= penalty true))
(assert (= audit_system_compliance false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= handling_system_compliance false))
(assert (= handling_system_established false))
(assert (= handling_system_executed false))
(assert (= internal_control_audit_handling_compliance false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= system_establishment_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 21
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
