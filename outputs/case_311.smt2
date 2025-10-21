; SMT2 file generated from compliance case automatic
; Case ID: case_311
; Generated at: 2025-10-21T06:57:29.436822
;
; This file can be executed with Z3:
;   z3 case_311.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const act_144_actuarial_assignment_approved Bool)
(declare-const act_144_actuarial_report_fair Bool)
(declare-const act_144_external_review_approved Bool)
(declare-const act_144_external_review_report_fair Bool)
(declare-const act_148_1_1_complied Bool)
(declare-const act_148_1_2_complied Bool)
(declare-const act_148_3_internal_control_established_and_executed Bool)
(declare-const act_148_3_internal_handling_established_and_executed Bool)
(declare-const actuarial_assigned Bool)
(declare-const actuarial_report_concealment Bool)
(declare-const actuarial_report_error Bool)
(declare-const actuarial_report_fairness Bool)
(declare-const actuarial_report_falsehood Bool)
(declare-const actuarial_report_omission Bool)
(declare-const board_approved Bool)
(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_falsehood Bool)
(declare-const explanation_document_provided Bool)
(declare-const external_review_report_concealment Bool)
(declare-const external_review_report_error Bool)
(declare-const external_review_report_fairness Bool)
(declare-const external_review_report_falsehood Bool)
(declare-const external_review_report_omission Bool)
(declare-const external_reviewer_hired Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const penalty Bool)
(declare-const public_explanation_provided Bool)
(declare-const report_or_explanation_falsehood Bool)
(declare-const report_to_authority_on_time Bool)
(declare-const reported_to_authority Bool)
(declare-const violation_171_1_148_1_or_2 Bool)
(declare-const violation_171_1_148_2_1 Bool)
(declare-const violation_171_1_148_2_2 Bool)
(declare-const violation_171_1_148_3_1 Bool)
(declare-const violation_171_1_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:act_144_actuarial_assignment_approved] 簽證精算人員指派經董（理）事會同意並報主管機關備查
(assert (= act_144_actuarial_assignment_approved
   (and actuarial_assigned board_approved reported_to_authority)))

; [insurance:act_144_external_review_approved] 外部複核精算人員聘請經董（理）事會同意並報主管機關備查
(assert (= act_144_external_review_approved
   (and external_reviewer_hired board_approved reported_to_authority)))

; [insurance:act_144_actuarial_report_fair] 簽證精算人員簽證報告內容公正且無虛偽隱匿遺漏錯誤
(assert (= act_144_actuarial_report_fair
   (and actuarial_report_fairness
        (not actuarial_report_falsehood)
        (not actuarial_report_concealment)
        (not actuarial_report_omission)
        (not actuarial_report_error))))

; [insurance:act_144_external_review_report_fair] 外部複核精算人員複核報告內容公正且無虛偽隱匿遺漏錯誤
(assert (= act_144_external_review_report_fair
   (and external_review_report_fairness
        (not external_review_report_falsehood)
        (not external_review_report_concealment)
        (not external_review_report_omission)
        (not external_review_report_error))))

; [insurance:act_148_3_internal_control_established_and_executed] 建立並執行內部控制及稽核制度
(assert (= act_148_3_internal_control_established_and_executed
   (and internal_control_established internal_control_executed)))

; [insurance:act_148_3_internal_handling_established_and_executed] 建立並執行內部處理制度及程序
(assert (= act_148_3_internal_handling_established_and_executed
   (and internal_handling_established internal_handling_executed)))

; [insurance:violation_171_1_148_1_or_2] 違反第一百四十八條之一第一項或第二項規定
(assert (not (= (and act_148_1_1_complied act_148_1_2_complied)
        violation_171_1_148_1_or_2)))

; [insurance:violation_171_1_148_2_1] 違反第一百四十八條之二第一項規定：未提供說明文件供查閱、或說明文件未依規定記載或記載不實
(assert (= violation_171_1_148_2_1
   (or (not explanation_document_compliant)
       explanation_document_falsehood
       (not explanation_document_provided))))

; [insurance:violation_171_1_148_2_2] 違反第一百四十八條之二第二項規定：未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violation_171_1_148_2_2
   (or (not report_to_authority_on_time)
       (not public_explanation_provided)
       report_or_explanation_falsehood)))

; [insurance:violation_171_1_148_3_1] 違反第一百四十八條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violation_171_1_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violation_171_1_148_3_2] 違反第一百四十八條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violation_171_1_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一規定時處罰
(assert (= penalty
   (or violation_171_1_148_1_or_2
       violation_171_1_148_2_1
       violation_171_1_148_2_2
       violation_171_1_148_3_1
       violation_171_1_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= actuarial_assigned false))
(assert (= board_approved false))
(assert (= reported_to_authority false))
(assert (= external_reviewer_hired false))
(assert (= actuarial_report_fairness false))
(assert (= actuarial_report_falsehood false))
(assert (= actuarial_report_concealment false))
(assert (= actuarial_report_omission true))
(assert (= actuarial_report_error false))
(assert (= external_review_report_fairness false))
(assert (= external_review_report_falsehood false))
(assert (= external_review_report_concealment false))
(assert (= external_review_report_omission false))
(assert (= external_review_report_error false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= act_148_1_1_complied false))
(assert (= act_148_1_2_complied false))
(assert (= explanation_document_provided true))
(assert (= explanation_document_compliant true))
(assert (= explanation_document_falsehood false))
(assert (= report_to_authority_on_time true))
(assert (= public_explanation_provided true))
(assert (= report_or_explanation_falsehood false))
(assert (= penalty true))
(assert (= violation_171_1_148_1_or_2 true))
(assert (= violation_171_1_148_2_1 false))
(assert (= violation_171_1_148_2_2 false))
(assert (= violation_171_1_148_3_1 true))
(assert (= violation_171_1_148_3_2 true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 38
; Total facts: 32
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
