; SMT2 file generated from compliance case automatic
; Case ID: case_81
; Generated at: 2025-10-21T01:02:44.265781
;
; This file can be executed with Z3:
;   z3 case_81.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const act_144_compliance Bool)
(declare-const act_148_3_compliance Bool)
(declare-const act_171_1_compliance Bool)
(declare-const act_171_compliance Bool)
(declare-const actuary_and_external_review_compliance Bool)
(declare-const actuary_employed Bool)
(declare-const actuary_fair_and_true Bool)
(declare-const actuary_reports_fair_and_true Bool)
(declare-const board_approval_for_actuary Bool)
(declare-const board_approval_for_external_review Bool)
(declare-const capital_level Int)
(declare-const capital_level_consistent Bool)
(declare-const external_review_actuary_hired Bool)
(declare-const external_review_fair_and_true Bool)
(declare-const external_review_reports_fair_and_true Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const own_capital Real)
(declare-const penalty Bool)
(declare-const risk_capital Real)
(declare-const signing_actuary_assigned Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (not (<= 0.0 net_worth))
               (not (<= (/ 1.0 2.0) (/ own_capital risk_capital)))))
      (a!2 (and (<= (/ 1.0 2.0) (/ own_capital risk_capital))
                (not (<= (/ 3.0 2.0) (/ own_capital risk_capital)))
                (<= 0.0 net_worth_ratio_prev1)
                (not (<= 2.0 net_worth_ratio_prev1))
                (<= 0.0 net_worth_ratio_prev2)
                (not (<= 2.0 net_worth_ratio_prev2))))
      (a!3 (and (<= (/ 3.0 2.0) (/ own_capital risk_capital))
                (not (<= 2.0 (/ own_capital risk_capital))))))
(let ((a!4 (ite a!3 2 (ite (<= 2.0 (/ own_capital risk_capital)) 1 0))))
  (= capital_level (ite a!1 4 (ite a!2 3 a!4))))))

; [insurance:capital_level_consistency] 資本等級以較低等級為準（就低不就高原則）
(assert (= capital_level_consistent
   (or (= 4 capital_level)
       (= 3 capital_level)
       (= 1 capital_level)
       (= 2 capital_level)
       (= 0 capital_level))))

; [insurance:act_144_compliance] 符合保險法第144條精算人員聘用及簽證規定
(assert (= act_144_compliance
   (and actuary_employed
        signing_actuary_assigned
        external_review_actuary_hired
        board_approval_for_actuary
        board_approval_for_external_review
        actuary_reports_fair_and_true
        external_review_reports_fair_and_true)))

; [insurance:act_148_3_compliance] 符合保險法第148-3條內部控制及內部處理制度規定
(assert (= act_148_3_compliance
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed)))

; [insurance:act_171_compliance] 符合保險法第171條關於第144條及精算人員規定
(assert (= act_171_compliance
   (and act_144_compliance actuary_and_external_review_compliance)))

; [insurance:actuary_and_external_review_compliance] 簽證精算人員及外部複核精算人員遵守第144條第五項規定
(assert (= actuary_and_external_review_compliance
   (and actuary_fair_and_true external_review_fair_and_true)))

; [insurance:act_171_1_compliance] 符合保險法第171-1條內部控制及內部處理制度罰鍰規定
(assert (= act_171_1_compliance
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反第144條精算人員聘用及簽證規定或未建立或執行內部控制及內部處理制度時處罰
(assert (= penalty (or (not act_144_compliance) (not act_148_3_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 400000))
(assert (= risk_capital 1000000))
(assert (= net_worth -100))
(assert (= net_worth_ratio_prev1 1.0))
(assert (= net_worth_ratio_prev2 1.0))
(assert (= act_144_compliance false))
(assert (= actuary_employed false))
(assert (= signing_actuary_assigned false))
(assert (= external_review_actuary_hired false))
(assert (= board_approval_for_actuary false))
(assert (= board_approval_for_external_review false))
(assert (= actuary_reports_fair_and_true false))
(assert (= external_review_reports_fair_and_true false))
(assert (= actuary_and_external_review_compliance false))
(assert (= actuary_fair_and_true false))
(assert (= external_review_fair_and_true false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= act_148_3_compliance false))
(assert (= act_171_1_compliance false))
(assert (= act_171_compliance false))
(assert (= capital_level 4))
(assert (= capital_level_consistent true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 26
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
