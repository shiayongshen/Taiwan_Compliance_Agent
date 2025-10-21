; SMT2 file generated from compliance case automatic
; Case ID: case_176
; Generated at: 2025-10-21T03:57:59.110615
;
; This file can be executed with Z3:
;   z3 case_176.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const compliance_ok Bool)
(declare-const control_procedures_established Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const other_designated_matters_complied Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures_established
        training_held
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_complied)))

; [aml:control_procedures_established] 防制洗錢及打擊資恐之作業及控制程序已建立
(assert true)

; [aml:training_held] 定期舉辦或參加防制洗錢之在職訓練
(assert true)

; [aml:dedicated_personnel_assigned] 指派專責人員負責協調監督防制洗錢作業及控制程序執行
(assert true)

; [aml:risk_assessment_report_updated] 備置並定期更新防制洗錢及打擊資恐風險評估報告
(assert true)

; [aml:audit_procedures_established] 建立稽核程序
(assert true)

; [aml:other_designated_matters_complied] 遵守其他經中央目的事業主管機關指定之事項
(assert true)

; [aml:internal_control_executed] 洗錢防制內部控制與稽核制度確實執行
(assert true)

; [aml:compliance_ok] 已建立且確實執行洗錢防制內部控制與稽核制度
(assert (= compliance_ok (and internal_control_established internal_control_executed)))

; [aml:penalty_default_false] 預設不處罰
(assert (not penalty))

; [aml:penalty_conditions] 處罰條件：未建立或未確實執行洗錢防制內部控制與稽核制度時處罰
(assert (not (= compliance_ok penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_complied false))
(assert (= internal_control_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 10
; Total facts: 7
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
