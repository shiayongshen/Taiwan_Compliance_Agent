; SMT2 file generated from compliance case automatic
; Case ID: case_46
; Generated at: 2025-10-21T21:45:12.066232
;
; This file can be executed with Z3:
;   z3 case_46.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const correction_given Bool)
(declare-const correction_ordered Bool)
(declare-const dispose_shares_and_deregister_after_revoke_permit Bool)
(declare-const dispose_shares_within_deadline Bool)
(declare-const dispose_subsidiary_shares Bool)
(declare-const forbid_use_fhc_name_and_change_registration Bool)
(declare-const improvement_deadline_set Bool)
(declare-const liquidation_ordered Bool)
(declare-const moe_notified_to_revoke_registration Bool)
(declare-const notify_moe_on_remove_director_supervisor Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const reduce_directors_to_meet_requirements Bool)
(declare-const remove_manager_or_staff Bool)
(declare-const remove_or_suspend_director_supervisor Bool)
(declare-const revoke_permit Bool)
(declare-const revoke_statutory_resolution Bool)
(declare-const suspend_subsidiary_business Bool)
(declare-const violation_flag Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:violation_occurred] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [fhc:correction_ordered] 主管機關已予以糾正並限期令其改善
(assert (= correction_ordered (and correction_given improvement_deadline_set)))

; [fhc:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or dispose_subsidiary_shares
       other_necessary_measures
       remove_manager_or_staff
       remove_or_suspend_director_supervisor
       revoke_permit
       revoke_statutory_resolution
       suspend_subsidiary_business)))

; [fhc:notify_moe_on_remove_director_supervisor] 依第四款解除董事、監察人職務時，主管機關通知經濟部廢止其登記
(assert (= notify_moe_on_remove_director_supervisor
   (or moe_notified_to_revoke_registration
       (not remove_or_suspend_director_supervisor))))

; [fhc:dispose_shares_and_deregister_after_revoke_permit] 廢止許可後，限期內處分股份及董事人數不符規定，未完成則解散清算
(assert (let ((a!1 (or (not revoke_permit)
               (and dispose_shares_within_deadline
                    reduce_directors_to_meet_requirements
                    forbid_use_fhc_name_and_change_registration
                    (or liquidation_ordered
                        (and dispose_shares_within_deadline
                             reduce_directors_to_meet_requirements))))))
  (= dispose_shares_and_deregister_after_revoke_permit a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令章程或有礙健全經營且未依規定接受處分時處罰
(assert (= penalty
   (and violation_occurred (not (or correction_ordered penalty_measures)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= correction_given true))
(assert (= improvement_deadline_set true))
(assert (= correction_ordered true))
(assert (= remove_or_suspend_director_supervisor true))
(assert (= penalty_measures true))
(assert (= notify_moe_on_remove_director_supervisor true))
(assert (= moe_notified_to_revoke_registration true))
(assert (= revoke_statutory_resolution false))
(assert (= suspend_subsidiary_business false))
(assert (= remove_manager_or_staff false))
(assert (= dispose_subsidiary_shares false))
(assert (= revoke_permit false))
(assert (= other_necessary_measures false))
(assert (= dispose_shares_and_deregister_after_revoke_permit false))
(assert (= dispose_shares_within_deadline false))
(assert (= reduce_directors_to_meet_requirements false))
(assert (= forbid_use_fhc_name_and_change_registration false))
(assert (= liquidation_ordered false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 21
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
