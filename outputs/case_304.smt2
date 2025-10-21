; SMT2 file generated from compliance case automatic
; Case ID: case_304
; Generated at: 2025-10-21T06:46:42.008758
;
; This file can be executed with Z3:
;   z3 case_304.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const act_144_actuarial_staff_assigned Bool)
(declare-const act_144_board_approval_obtained Bool)
(declare-const act_144_external_review_engaged Bool)
(declare-const act_144_reports_fair_and_true Bool)
(declare-const act_148_3_internal_control_established Bool)
(declare-const act_148_3_internal_handling_established Bool)
(declare-const act_171_1_violation_act_148_2_1 Bool)
(declare-const act_171_1_violation_act_148_2_2 Bool)
(declare-const act_171_1_violation_act_148_3_1 Bool)
(declare-const act_171_1_violation_act_148_3_1_or_2 Bool)
(declare-const act_171_1_violation_act_148_3_2 Bool)
(declare-const act_171_violation_act_144_1_to_4 Bool)
(declare-const act_171_violation_act_144_5 Bool)
(declare-const actuarial_staff_hired Bool)
(declare-const external_review_actuarial_staff_hired Bool)
(declare-const external_review_actuarial_staff_hired_board_approved Bool)
(declare-const external_review_report_fair_and_true Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const penalty Bool)
(declare-const signing_actuarial_report_fair_and_true Bool)
(declare-const signing_actuarial_staff_assigned Bool)
(declare-const signing_actuarial_staff_assigned_board_approved Bool)
(declare-const violate_act_144_1_to_4 Bool)
(declare-const violate_act_144_5 Bool)
(declare-const violate_act_148_2_1 Bool)
(declare-const violate_act_148_2_2 Bool)
(declare-const violate_act_148_3_1_or_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:act_144_actuarial_staff_assigned] 保險業聘用精算人員並指派簽證精算人員
(assert (= act_144_actuarial_staff_assigned
   (and actuarial_staff_hired signing_actuarial_staff_assigned)))

; [insurance:act_144_external_review_engaged] 保險業聘請外部複核精算人員
(assert (= act_144_external_review_engaged external_review_actuarial_staff_hired))

; [insurance:act_144_board_approval_obtained] 簽證精算人員指派及外部複核精算人員聘請經董事會同意
(assert (= act_144_board_approval_obtained
   (and signing_actuarial_staff_assigned_board_approved
        external_review_actuarial_staff_hired_board_approved)))

; [insurance:act_144_reports_fair_and_true] 簽證及複核報告內容公正且無虛偽隱匿遺漏錯誤
(assert (= act_144_reports_fair_and_true
   (and signing_actuarial_report_fair_and_true
        external_review_report_fair_and_true)))

; [insurance:act_148_3_internal_control_established] 保險業建立內部控制及稽核制度
(assert (= act_148_3_internal_control_established
   internal_control_and_audit_system_established))

; [insurance:act_148_3_internal_handling_established] 保險業建立內部處理制度及程序
(assert (= act_148_3_internal_handling_established internal_handling_system_established))

; [insurance:act_171_violation_act_144_1_to_4] 違反保險法第144條第1至4項規定
(assert (= act_171_violation_act_144_1_to_4 violate_act_144_1_to_4))

; [insurance:act_171_violation_act_144_5] 簽證精算人員或外部複核精算人員違反保險法第144條第5項規定
(assert (= act_171_violation_act_144_5 violate_act_144_5))

; [insurance:act_171_1_violation_act_148_3_1_or_2] 違反保險法第148條之三第1或第2項規定
(assert (= act_171_1_violation_act_148_3_1_or_2 violate_act_148_3_1_or_2))

; [insurance:act_171_1_violation_act_148_2_1] 違反保險法第148條之二第1項規定，未提供或提供不實說明文件
(assert (= act_171_1_violation_act_148_2_1 violate_act_148_2_1))

; [insurance:act_171_1_violation_act_148_2_2] 違反保險法第148條之二第2項規定，未依限報告或公開說明或內容不實
(assert (= act_171_1_violation_act_148_2_2 violate_act_148_2_2))

; [insurance:act_171_1_violation_act_148_3_1] 違反保險法第148條之三第1項規定，未建立或未執行內部控制或稽核制度
(assert (not (= internal_control_and_audit_system_established
        act_171_1_violation_act_148_3_1)))

; [insurance:act_171_1_violation_act_148_3_2] 違反保險法第148條之三第2項規定，未建立或未執行內部處理制度或程序
(assert (not (= internal_handling_system_established act_171_1_violation_act_148_3_2)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反保險法第144條第1至4項、簽證精算人員或外部複核精算人員違反第144條第5項、違反第148條之三第1或2項規定，或未建立或執行內部控制及內部處理制度時處罰
(assert (= penalty
   (or act_171_1_violation_act_148_3_1_or_2
       act_171_violation_act_144_1_to_4
       act_171_1_violation_act_148_3_1
       act_171_1_violation_act_148_3_2
       act_171_violation_act_144_5
       act_171_1_violation_act_148_2_1
       act_171_1_violation_act_148_2_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= act_144_actuarial_staff_assigned false))
(assert (= act_144_board_approval_obtained false))
(assert (= act_144_external_review_engaged false))
(assert (= act_144_reports_fair_and_true false))
(assert (= act_148_3_internal_control_established false))
(assert (= act_148_3_internal_handling_established false))
(assert (= act_171_1_violation_act_148_2_1 false))
(assert (= act_171_1_violation_act_148_2_2 false))
(assert (= act_171_1_violation_act_148_3_1 true))
(assert (= act_171_1_violation_act_148_3_1_or_2 true))
(assert (= act_171_1_violation_act_148_3_2 true))
(assert (= act_171_violation_act_144_1_to_4 true))
(assert (= act_171_violation_act_144_5 false))
(assert (= actuarial_staff_hired false))
(assert (= external_review_actuarial_staff_hired false))
(assert (= external_review_actuarial_staff_hired_board_approved false))
(assert (= external_review_report_fair_and_true false))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_handling_system_established false))
(assert (= penalty true))
(assert (= signing_actuarial_report_fair_and_true false))
(assert (= signing_actuarial_staff_assigned false))
(assert (= signing_actuarial_staff_assigned_board_approved false))
(assert (= violate_act_144_1_to_4 true))
(assert (= violate_act_144_5 false))
(assert (= violate_act_148_2_1 false))
(assert (= violate_act_148_2_2 false))
(assert (= violate_act_148_3_1_or_2 true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 28
; Total facts: 28
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
