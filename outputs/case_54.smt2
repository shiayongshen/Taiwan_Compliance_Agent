; SMT2 file generated from compliance case automatic
; Case ID: case_54
; Generated at: 2025-10-21T00:17:15.275522
;
; This file can be executed with Z3:
;   z3 case_54.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_guidance_designated Bool)
(declare-const business_guidance_needed Bool)
(declare-const correction_given Bool)
(declare-const correction_ordered Bool)
(declare-const impede_sound_operation Bool)
(declare-const improvement_deadline_given Bool)
(declare-const notify_registration_authority Bool)
(declare-const order_branch_closure Bool)
(declare-const order_director_supervisor_dismissal_or_suspension Bool)
(declare-const order_manager_staff_dismissal_or_suspension Bool)
(declare-const order_or_prohibit_asset_disposition Bool)
(declare-const order_reserve_provision Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalties_applied Bool)
(declare-const penalty Bool)
(declare-const registration_authority_notified Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const suspend_partial_business Bool)
(declare-const violate_articles Bool)
(declare-const violate_law Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_occurred] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred (or impede_sound_operation violate_articles violate_law)))

; [bank:correction_ordered] 主管機關已予以糾正並命其限期改善
(assert (= correction_ordered (and correction_given improvement_deadline_given)))

; [bank:penalties_applied] 主管機關依情節輕重為下列處分之一
(assert (= penalties_applied
   (or restrict_investment
       order_manager_staff_dismissal_or_suspension
       suspend_partial_business
       revoke_statutory_meeting_resolution
       other_necessary_measures
       order_reserve_provision
       order_branch_closure
       order_or_prohibit_asset_disposition
       order_director_supervisor_dismissal_or_suspension)))

; [bank:notify_registration_authority] 依第七款解除董事、監察人職務時通知公司登記主管機關撤銷或廢止其登記
(assert (= notify_registration_authority
   (or registration_authority_notified
       (not order_director_supervisor_dismissal_or_suspension))))

; [bank:business_guidance_needed] 為改善銀行營運缺失有業務輔導之必要
(assert (= business_guidance_needed business_guidance_designated))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行違反法令章程或有礙健全經營且未接受糾正改善或未執行處分時處罰
(assert (= penalty (and violation_occurred (not correction_ordered))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_law true))
(assert (= violate_articles false))
(assert (= impede_sound_operation true))
(assert (= correction_given true))
(assert (= improvement_deadline_given true))
(assert (= correction_ordered true))
(assert (= suspend_partial_business true))
(assert (= revoke_statutory_meeting_resolution false))
(assert (= restrict_investment false))
(assert (= order_or_prohibit_asset_disposition false))
(assert (= order_branch_closure false))
(assert (= order_manager_staff_dismissal_or_suspension false))
(assert (= order_director_supervisor_dismissal_or_suspension false))
(assert (= order_reserve_provision false))
(assert (= other_necessary_measures false))
(assert (= penalties_applied true))
(assert (= business_guidance_designated false))
(assert (= business_guidance_needed false))
(assert (= notify_registration_authority false))
(assert (= registration_authority_notified false))
(assert (= penalty false))
(assert (= violation_occurred true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 22
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
