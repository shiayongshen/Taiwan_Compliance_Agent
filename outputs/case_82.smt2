; SMT2 file generated from compliance case automatic
; Case ID: case_82
; Generated at: 2025-10-21T01:04:40.534987
;
; This file can be executed with Z3:
;   z3 case_82.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const IF Bool)
(declare-const annual_revenue Real)
(declare-const audit_committee_approval_count Int)
(declare-const audit_committee_approval_required Int)
(declare-const audit_committee_disapproval_resolution Bool)
(declare-const audit_committee_member_count Int)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const board_approval_count Int)
(declare-const board_approval_required Int)
(declare-const board_approved_internal_control Bool)
(declare-const board_meeting_record_includes_audit_committee_resolution Bool)
(declare-const board_member_count Int)
(declare-const board_opposition Bool)
(declare-const board_opposition_recorded Bool)
(declare-const fixed_business_location_and_bookkeeping Bool)
(declare-const has_agent_license Bool)
(declare-const has_audit_committee Bool)
(declare-const has_broker_license Bool)
(declare-const has_dedicated_bookkeeping Bool)
(declare-const has_fixed_business_location Bool)
(declare-const has_notary_license Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_comprehensive_compliance Bool)
(declare-const internal_control_deficiencies_corrected_timely Bool)
(declare-const internal_control_deficiencies_reported Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_execution_required Bool)
(declare-const internal_control_monitoring_and_correction Bool)
(declare-const internal_control_required Bool)
(declare-const internal_control_violation Bool)
(declare-const is_publicly_listed Bool)
(declare-const opposition_recorded_and_sent Bool)
(declare-const penalty Bool)
(declare-const single_license_only Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:fixed_business_location_and_bookkeeping] 保險代理人、經紀人、公證人應有固定業務處所並專設帳簿記載業務收支
(assert (= fixed_business_location_and_bookkeeping
   (and has_fixed_business_location has_dedicated_bookkeeping)))

; [insurance:single_license_only] 兼有保險代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license_only
   (>= 1
       (+ (ite has_agent_license 1 0)
          (ite has_broker_license 1 0)
          (ite has_notary_license 1 0)))))

; [insurance:internal_control_required] 公開發行或一定規模保險代理人公司、經紀人公司應建立內部控制、稽核制度與招攬處理制度及程序
(assert (let ((a!1 (or (not (or is_publicly_listed (<= 200000000.0 annual_revenue)))
               (and internal_control_established
                    audit_system_established
                    solicitation_handling_system_established))))
  (= internal_control_required a!1)))

; [insurance:internal_control_execution_required] 公開發行或一定規模保險代理人公司、經紀人公司應確實執行內部控制、稽核制度與招攬處理制度及程序
(assert (let ((a!1 (or (not (or is_publicly_listed (<= 200000000.0 annual_revenue)))
               (and internal_control_executed
                    audit_system_executed
                    solicitation_handling_system_executed))))
  (= internal_control_execution_required a!1)))

; [insurance:internal_control_compliance] 符合內部控制建立及執行要求
(assert (= internal_control_compliance
   (and internal_control_required internal_control_execution_required)))

; [insurance:internal_control_violation] 違反內部控制建立或執行規定
(assert (not (= internal_control_compliance internal_control_violation)))

; [insurance:board_approval_required] 內部控制、稽核制度與招攬處理制度及程序應經董（理）事會通過
(assert (= board_approval_required (ite board_approved_internal_control 1 0)))

; [insurance:board_opposition_recorded] 董（理）事會有保留或反對意見應記錄並送監察人或審計委員會
(assert (= board_opposition_recorded
   (or (not board_opposition) opposition_recorded_and_sent)))

; [insurance:audit_committee_approval_required] 設置審計委員會者，訂定或修正內部控制制度應經審計委員會半數以上同意並提董（理）事會決議
(assert (let ((a!1 (and (>= (to_real audit_committee_approval_count)
                    (* (/ 1.0 2.0) (to_real audit_committee_member_count)))
                board_approved_internal_control)))
  (= audit_committee_approval_required
     (ite (or (not has_audit_committee) a!1) 1 0))))

; [insurance:audit_committee_disapproval_resolution] 審計委員會不同意時得由全體董（理）事三分之二以上同意行之，並於會議紀錄載明決議
(assert (let ((a!1 (not (<= (* (/ 1.0 2.0) (to_real audit_committee_member_count))
                    (to_real audit_committee_approval_count))))
      (a!2 (and (>= (to_real board_approval_count)
                    (* (/ 2.0 3.0) (to_real board_member_count)))
                board_meeting_record_includes_audit_committee_resolution)))
  (= audit_committee_disapproval_resolution
     (or (not (and has_audit_committee a!1)) a!2))))

; [insurance:internal_control_comprehensive_compliance] 內部控制制度符合規定（含董事會及審計委員會程序）
(assert (let ((a!1 (and internal_control_required
                (or (and (not has_audit_committee)
                         board_approved_internal_control)
                    (and has_audit_committee
                         audit_committee_disapproval_resolution)
                    (and has_audit_committee
                         (= audit_committee_approval_required 1))))))
  (= internal_control_comprehensive_compliance a!1)))

; [insurance:internal_control_monitoring_and_correction] 內部控制制度應持續監督及即時改正缺失
(assert (= internal_control_monitoring_and_correction
   (and internal_control_comprehensive_compliance
        internal_control_deficiencies_reported
        internal_control_deficiencies_corrected_timely)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序時處罰
(assert (= penalty
   (or (not internal_control_required)
       (not internal_control_execution_required))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= has_fixed_business_location true))
(assert (= has_dedicated_bookkeeping true))
(assert (= fixed_business_location_and_bookkeeping true))
(assert (= has_agent_license true))
(assert (= has_broker_license false))
(assert (= has_notary_license false))
(assert (= single_license_only true))
(assert (= is_publicly_listed false))
(assert (= annual_revenue 300000000))
(assert (= internal_control_required true))
(assert (= internal_control_established false))
(assert (= audit_system_established false))
(assert (= solicitation_handling_system_established false))
(assert (= internal_control_execution_required true))
(assert (= internal_control_executed false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_executed false))
(assert (= internal_control_compliance false))
(assert (= internal_control_violation true))
(assert (= board_approved_internal_control false))
(assert (= board_opposition false))
(assert (= board_opposition_recorded false))
(assert (= has_audit_committee false))
(assert (= audit_committee_approval_count 0))
(assert (= audit_committee_member_count 0))
(assert (= audit_committee_approval_required 0))
(assert (= audit_committee_disapproval_resolution false))
(assert (= board_approval_count 0))
(assert (= board_approval_required 0))
(assert (= board_meeting_record_includes_audit_committee_resolution false))
(assert (= internal_control_comprehensive_compliance false))
(assert (= internal_control_deficiencies_reported false))
(assert (= internal_control_deficiencies_corrected_timely false))
(assert (= internal_control_monitoring_and_correction false))
(assert (= opposition_recorded_and_sent false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 38
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
