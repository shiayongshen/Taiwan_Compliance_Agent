; SMT2 file generated from compliance case automatic
; Case ID: case_17
; Generated at: 2025-10-20T23:04:50.894664
;
; This file can be executed with Z3:
;   z3 case_17.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const penalty_measures_issued Bool)
(declare-const violation Bool)
(declare-const violation_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation violation_flag))

; [bank:penalty_measures] 銀行主管機關可採取之處分措施
(assert (= penalty_measures (and violation penalty_measures_issued)))

; [financial_institution:violation] 票券金融公司違反法令、章程或有礙健全經營之虞
(assert (= violation violation_flag))

; [financial_institution:penalty_measures] 票券金融公司主管機關可採取之處分措施，準用銀行法第61-1條
(assert (= penalty_measures (and violation penalty_measures_issued)))

; [financial_holding:violation] 金融控股公司違反法令、章程或有礙健全經營之虞
(assert (= violation violation_flag))

; [financial_holding:penalty_measures] 金融控股公司主管機關可採取之處分措施
(assert (= penalty_measures (and violation penalty_measures_issued)))

; [electronic_payment:violation] 專營電子支付機構違反法令、章程或有礙健全經營之虞
(assert (= violation violation_flag))

; [electronic_payment:penalty_measures] 專營電子支付機構主管機關可採取之處分措施
(assert (= penalty_measures (and violation penalty_measures_issued)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行、票券金融公司、金融控股公司或專營電子支付機構違反法令、章程或有礙健全經營且主管機關採取處分時處罰
(assert (= penalty (and violation penalty_measures_issued)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation true))
(assert (= penalty_measures_issued true))
(assert (= penalty_measures true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 5
; Total facts: 5
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
