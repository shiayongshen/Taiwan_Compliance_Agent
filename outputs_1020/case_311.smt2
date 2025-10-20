; SMT2 file generated from compliance case automatic
; Case ID: case_311
; Generated at: 2025-10-19T12:47:12.608677
;
; This file can be executed with Z3:
;   z3 case_311.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const actuarial_officer_assigned Bool)
(declare-const actuarial_reports_fair_and_true Bool)
(declare-const actuarial_staff_hired Bool)
(declare-const board_approval_obtained Bool)
(declare-const external_review_actuary_approved_by_board Bool)
(declare-const external_review_actuary_hired Bool)
(declare-const external_review_actuary_hired_flag Bool)
(declare-const external_review_report_fair_and_true Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_established_and_executed Bool)
(declare-const internal_handling_executed Bool)
(declare-const penalty Bool)
(declare-const signing_actuarial_officer_approved_by_board Bool)
(declare-const signing_actuarial_officer_assigned Bool)
(declare-const signing_actuarial_report_fair_and_true Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:actuarial_officer_assigned] 保險業聘用精算人員並指派簽證精算人員
(assert (= actuarial_officer_assigned
   (and actuarial_staff_hired signing_actuarial_officer_assigned)))

; [insurance:external_review_actuary_hired] 保險業聘請外部複核精算人員
(assert (= external_review_actuary_hired external_review_actuary_hired_flag))

; [insurance:board_approval_obtained] 簽證精算人員指派及外部複核精算人員聘請經董（理）事會同意
(assert (= board_approval_obtained
   (and signing_actuarial_officer_approved_by_board
        external_review_actuary_approved_by_board)))

; [insurance:actuarial_reports_fair_and_true] 簽證精算人員及外部複核精算人員報告內容公正且無虛偽隱匿遺漏錯誤
(assert (= actuarial_reports_fair_and_true
   (and signing_actuarial_report_fair_and_true
        external_review_report_fair_and_true)))

; [insurance:internal_control_established_and_executed] 保險業建立並執行內部控制及稽核制度
(assert (= internal_control_established_and_executed
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_established_and_executed] 保險業建立並執行內部處理制度及程序
(assert (= internal_handling_established_and_executed
   (and internal_handling_established internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反精算人員指派、外部複核聘請、董事會同意、報告公正性、內部控制及內部處理制度規定時處罰
(assert (= penalty
   (or (not internal_handling_established_and_executed)
       (not internal_control_established_and_executed)
       (not actuarial_officer_assigned)
       (not board_approval_obtained)
       (not actuarial_reports_fair_and_true)
       (not external_review_actuary_hired))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= actuarial_staff_hired false))
(assert (= signing_actuarial_officer_assigned false))
(assert (= external_review_actuary_hired_flag false))
(assert (= external_review_actuary_hired false))
(assert (= signing_actuarial_officer_approved_by_board false))
(assert (= external_review_actuary_approved_by_board false))
(assert (= signing_actuarial_report_fair_and_true false))
(assert (= external_review_report_fair_and_true false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= actuarial_officer_assigned false))
(assert (= actuarial_reports_fair_and_true false))
(assert (= board_approval_obtained false))
(assert (= internal_control_established_and_executed false))
(assert (= internal_handling_established_and_executed false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 18
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
