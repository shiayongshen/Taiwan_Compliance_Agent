; SMT2 file generated from compliance case automatic
; Case ID: case_291
; Generated at: 2025-10-21T06:28:24.653704
;
; This file can be executed with Z3:
;   z3 case_291.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bank_violation Bool)
(declare-const business_guidance_necessary Bool)
(declare-const business_guidance_needed Bool)
(declare-const correction_and_improvement_ordered Bool)
(declare-const correction_ordered Bool)
(declare-const director_supervisor_dismissal_notified Bool)
(declare-const guidance_institution_designated Bool)
(declare-const notification_to_registration_authority Bool)
(declare-const order_branch_closure Bool)
(declare-const order_director_supervisor_dismissal_or_suspension Bool)
(declare-const order_manager_staff_dismissal_or_suspension Bool)
(declare-const order_or_prohibit_asset_disposition Bool)
(declare-const order_reserve_provision Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const suspend_partial_business Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_occurred] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred bank_violation))

; [bank:correction_ordered] 主管機關已予以糾正並命其限期改善
(assert (= correction_ordered correction_and_improvement_ordered))

; [bank:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or order_reserve_provision
       order_director_supervisor_dismissal_or_suspension
       revoke_statutory_meeting_resolution
       order_manager_staff_dismissal_or_suspension
       order_or_prohibit_asset_disposition
       order_branch_closure
       restrict_investment
       other_necessary_measures
       suspend_partial_business)))

; [bank:director_supervisor_dismissal_notified] 依第七款解除董事、監察人職務時，已通知公司登記主管機關撤銷或廢止其登記
(assert (= director_supervisor_dismissal_notified
   (or (not order_director_supervisor_dismissal_or_suspension)
       notification_to_registration_authority)))

; [bank:business_guidance_needed] 為改善銀行營運缺失，有業務輔導之必要且主管機關已指定機構辦理
(assert (= business_guidance_needed
   (and business_guidance_necessary guidance_institution_designated)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行違反法令章程或有礙健全經營且未採取主管機關處分措施時處罰
(assert (= penalty (and violation_occurred (not penalty_measures))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= bank_violation true))
(assert (= violation_occurred true))
(assert (= correction_and_improvement_ordered true))
(assert (= correction_ordered true))
(assert (= restrict_investment true))
(assert (= penalty_measures true))
(assert (= revoke_statutory_meeting_resolution false))
(assert (= suspend_partial_business false))
(assert (= order_or_prohibit_asset_disposition false))
(assert (= order_branch_closure false))
(assert (= order_manager_staff_dismissal_or_suspension false))
(assert (= order_director_supervisor_dismissal_or_suspension false))
(assert (= director_supervisor_dismissal_notified false))
(assert (= notification_to_registration_authority false))
(assert (= business_guidance_necessary false))
(assert (= guidance_institution_designated false))
(assert (= business_guidance_needed false))
(assert (= other_necessary_measures false))
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
; Total variables: 20
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
