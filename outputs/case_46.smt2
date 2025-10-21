; SMT2 file generated from compliance case automatic
; Case ID: case_46
; Generated at: 2025-10-21T00:02:18.715109
;
; This file can be executed with Z3:
;   z3 case_46.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const director_supervisor_removal_notify Bool)
(declare-const dispose_shares_and_reduce_directors Bool)
(declare-const dispose_subsidiary_shares Bool)
(declare-const dissolution_and_liquidation_ordered Bool)
(declare-const fhc_violation_flag Bool)
(declare-const license_revocation_penalty Bool)
(declare-const license_revocation_requirements_met Bool)
(declare-const notify_economic_ministry_to_revoke_registration Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty_measures Bool)
(declare-const penalty Bool)
(declare-const prohibit_use_name_and_change_registration Bool)
(declare-const remove_manager_or_staff Bool)
(declare-const remove_or_suspend_director_supervisor Bool)
(declare-const revoke_license Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const suspend_subsidiary_business Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:violation_occurred] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred fhc_violation_flag))

; [fhc:penalty_measures] 主管機關可採取之處分措施
(assert (= penalty_measures
   (or revoke_license
       revoke_statutory_meeting_resolution
       remove_manager_or_staff
       dispose_subsidiary_shares
       suspend_subsidiary_business
       remove_or_suspend_director_supervisor
       other_necessary_measures)))

; [fhc:director_supervisor_removal_notify] 依第四款解除董事、監察人職務時，主管機關通知經濟部廢止登記
(assert (= director_supervisor_removal_notify
   (or notify_economic_ministry_to_revoke_registration
       (not remove_or_suspend_director_supervisor))))

; [fhc:license_revocation_requirements] 廢止許可時，應令金融控股公司於期限內處分股份及董事人數不符規定，並不得再使用名稱及辦理變更登記
(assert (= license_revocation_requirements_met
   (and revoke_license
        dispose_shares_and_reduce_directors
        prohibit_use_name_and_change_registration)))

; [fhc:license_revocation_penalty] 未於期限內完成處分者，應令解散及清算
(assert (= license_revocation_penalty
   (and revoke_license
        (not dispose_shares_and_reduce_directors)
        dissolution_and_liquidation_ordered)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令或未依規定完成廢止許可相關處分時處罰
(assert (= penalty
   (or (and revoke_license (not dispose_shares_and_reduce_directors))
       (and violation_occurred (not penalty_measures)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fhc_violation_flag true))
(assert (= violation_occurred true))
(assert (= remove_or_suspend_director_supervisor true))
(assert (= penalty_measures true))
(assert (= director_supervisor_removal_notify true))
(assert (= revoke_license false))
(assert (= dispose_shares_and_reduce_directors false))
(assert (= dispose_subsidiary_shares false))
(assert (= dissolution_and_liquidation_ordered false))
(assert (= license_revocation_requirements_met false))
(assert (= license_revocation_penalty false))
(assert (= notify_economic_ministry_to_revoke_registration true))
(assert (= other_necessary_measures false))
(assert (= penalty false))
(assert (= remove_manager_or_staff false))
(assert (= revoke_statutory_meeting_resolution false))
(assert (= suspend_subsidiary_business false))
(assert (= prohibit_use_name_and_change_registration false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 18
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
