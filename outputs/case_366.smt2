; SMT2 file generated from compliance case automatic
; Case ID: case_366
; Generated at: 2025-10-21T08:09:47.579471
;
; This file can be executed with Z3:
;   z3 case_366.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const appropriate_measures_taken Bool)
(declare-const independent_risk_control_unit_established Bool)
(declare-const internal_control_compliance Bool)
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
(declare-const major_risk_found Bool)
(declare-const penalty Bool)
(declare-const reported_to_board Bool)
(declare-const risk_control_measures_taken Bool)
(declare-const risk_control_report_submitted Bool)
(declare-const risk_control_reported Bool)
(declare-const risk_control_unit_established Bool)

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

; [bank:internal_control_ok] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:risk_control_unit_established] 設置獨立專責風險控管單位
(assert (= risk_control_unit_established independent_risk_control_unit_established))

; [bank:risk_control_reported] 定期向董（理）事會提出風險控管報告
(assert (= risk_control_reported risk_control_report_submitted))

; [bank:risk_control_measures_taken] 發現重大風險時採取適當措施並向董（理）事會報告
(assert (= risk_control_measures_taken
   (or (not major_risk_found)
       (and appropriate_measures_taken reported_to_board))))

; [bank:internal_control_compliance] 內部控制及稽核制度、內部處理制度及程序、內部作業制度及程序均建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_ok internal_handling_ok internal_operation_ok)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理或內部作業制度時處罰
(assert (not (= internal_control_compliance penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= major_risk_found true))
(assert (= appropriate_measures_taken false))
(assert (= reported_to_board false))
(assert (= risk_control_report_submitted false))
(assert (= independent_risk_control_unit_established false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 25
; Total facts: 11
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
