; SMT2 file generated from compliance case automatic
; Case ID: case_353
; Generated at: 2025-10-21T07:49:47.102947
;
; This file can be executed with Z3:
;   z3 case_353.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const compliance_144_1_to_4 Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_established_and_executed Bool)
(declare-const internal_handling_executed Bool)
(declare-const penalty Bool)
(declare-const reserve_calculated_by_insurance_type Bool)
(declare-const reserve_calculation_compliance Bool)
(declare-const reserve_recorded_in_special_books Bool)
(declare-const violation_144_145 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:reserve_calculation_compliance] 保險業於營業年度屆滿時，應分別保險種類計算應提存各種準備金並記載於特設帳簿
(assert (= reserve_calculation_compliance
   (and reserve_calculated_by_insurance_type reserve_recorded_in_special_books)))

; [insurance:violation_144_145] 違反保險法第144條第一項至第四項或第145條規定
(assert (= violation_144_145
   (or (not compliance_144_1_to_4) (not reserve_calculation_compliance))))

; [insurance:internal_control_established_and_executed] 建立並執行內部控制及稽核制度
(assert (= internal_control_established_and_executed
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_established_and_executed] 建立並執行內部處理制度及程序
(assert (= internal_handling_established_and_executed
   (and internal_handling_established internal_handling_executed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反第144條第1至4項或第145條規定時處罰
(assert (= penalty
   (or violation_144_145
       (not internal_control_established_and_executed)
       (not internal_handling_established_and_executed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= reserve_calculated_by_insurance_type false))
(assert (= reserve_recorded_in_special_books false))
(assert (= reserve_calculation_compliance false))
(assert (= compliance_144_1_to_4 false))
(assert (= violation_144_145 true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_established_and_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_established_and_executed false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 12
; Total facts: 12
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
