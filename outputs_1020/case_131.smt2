; SMT2 file generated from compliance case automatic
; Case ID: case_131
; Generated at: 2025-10-19T08:47:21.623921
;
; This file can be executed with Z3:
;   z3 case_131.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_violation Bool)
(declare-const audit_committee_approval Bool)
(declare-const audit_committee_approval_ratio Real)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const board_of_directors_approval Bool)
(declare-const board_of_directors_approval_after_audit_committee Bool)
(declare-const board_of_directors_two_thirds_approval_ratio Real)
(declare-const board_opposition_exists Bool)
(declare-const board_resolution_after_audit_committee Bool)
(declare-const board_resolution_recorded Bool)
(declare-const board_resolution_two_thirds_without_audit_committee Bool)
(declare-const internal_control_approved Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_opposition_recorded Bool)
(declare-const internal_control_valid Bool)
(declare-const opposition_recorded_in_minutes Int)
(declare-const opposition_sent_to_supervisors_or_audit_committee Bool)
(declare-const penalty Bool)
(declare-const solicitation_system_established Bool)
(declare-const solicitation_system_executed Bool)
(declare-const violate_financial_or_business_management_rules Bool)
(declare-const violate_law_or_impair_sound_operation Bool)
(declare-const violation_167_2 Bool)
(declare-const violation_167_3 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_approved] 內部控制、稽核制度與招攬處理制度經董（理）事會通過
(assert (= internal_control_approved board_of_directors_approval))

; [insurance:internal_control_opposition_recorded] 董（理）事有保留或反對意見且已記錄於會議紀錄並送監察人或審計委員會
(assert (= internal_control_opposition_recorded
   (and board_opposition_exists
        (= opposition_recorded_in_minutes 1)
        opposition_sent_to_supervisors_or_audit_committee)))

; [insurance:audit_committee_approval] 審計委員會全體成員二分之一以上同意內部控制、稽核制度與招攬處理制度
(assert (= audit_committee_approval (<= (/ 1.0 2.0) audit_committee_approval_ratio)))

; [insurance:board_resolution_after_audit_committee] 董（理）事會決議通過內部控制、稽核制度與招攬處理制度
(assert (= board_resolution_after_audit_committee
   board_of_directors_approval_after_audit_committee))

; [insurance:board_resolution_two_thirds_without_audit_committee] 未經審計委員會同意時，董（理）事會三分之二以上同意並記錄決議
(assert (= board_resolution_two_thirds_without_audit_committee
   (and (not audit_committee_approval)
        (<= (/ 6666667.0 10000000.0)
            board_of_directors_two_thirds_approval_ratio)
        board_resolution_recorded)))

; [insurance:internal_control_valid] 內部控制、稽核制度與招攬處理制度有效且合法
(assert (= internal_control_valid
   (or board_resolution_two_thirds_without_audit_committee
       internal_control_opposition_recorded
       internal_control_approved)))

; [insurance:violation_167_2] 違反保險法第167-2條相關財務或業務管理規定
(assert (= violation_167_2 violate_financial_or_business_management_rules))

; [insurance:violation_167_3] 違反保險法第167-3條未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序
(assert (= violation_167_3
   (or (not solicitation_system_established)
       (not solicitation_system_executed)
       (not audit_system_established)
       (not audit_system_executed)
       (not internal_control_established)
       (not internal_control_executed))))

; [insurance:agent_broker_violation] 保險代理人、經紀人、公證人違反法令或有礙健全經營
(assert (= agent_broker_violation violate_law_or_impair_sound_operation))

; [insurance:penalty_conditions] 處罰條件：違反相關法令或未依規定建立執行內部控制等制度時處罰
(assert (= penalty (or agent_broker_violation violation_167_2 violation_167_3)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_broker_violation true))
(assert (= violate_financial_or_business_management_rules true))
(assert (= violation_167_2 true))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= audit_system_established true))
(assert (= audit_system_executed true))
(assert (= solicitation_system_established true))
(assert (= solicitation_system_executed false))
(assert (= internal_control_approved false))
(assert (= board_of_directors_approval false))
(assert (= board_opposition_exists false))
(assert (= opposition_recorded_in_minutes 0))
(assert (= opposition_sent_to_supervisors_or_audit_committee false))
(assert (= audit_committee_approval false))
(assert (= audit_committee_approval_ratio 0.0))
(assert (= board_of_directors_approval_after_audit_committee false))
(assert (= board_resolution_after_audit_committee false))
(assert (= board_of_directors_two_thirds_approval_ratio 0.0))
(assert (= board_resolution_recorded false))
(assert (= board_resolution_two_thirds_without_audit_committee false))
(assert (= internal_control_opposition_recorded false))
(assert (= violation_167_3 true))
(assert (= violate_law_or_impair_sound_operation true))
(assert (= penalty true))
(assert (= internal_control_valid false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 26
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
