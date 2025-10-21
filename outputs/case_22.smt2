; SMT2 file generated from compliance case automatic
; Case ID: case_22
; Generated at: 2025-10-20T23:15:41.536964
;
; This file can be executed with Z3:
;   z3 case_22.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_guidance_assigned Bool)
(declare-const business_guidance_needed Bool)
(declare-const corrective_action_ordered Bool)
(declare-const notification_sent_to_registration_authority Bool)
(declare-const notify_registration_authority Bool)
(declare-const order_branch_closure Bool)
(declare-const order_director_supervisor_dismissal_or_suspension Bool)
(declare-const order_manager_staff_dismissal_or_suspension Bool)
(declare-const order_or_prohibit_asset_disposition Bool)
(declare-const order_provision_reserve_fund Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty_measures Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const suspend_partial_business Bool)
(declare-const violation_of_law_or_regulation Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_of_law_or_regulation] 銀行違反法令、章程或有礙健全經營之虞
(assert violation_of_law_or_regulation)

; [bank:corrective_action_ordered] 主管機關已予以糾正並命其限期改善
(assert corrective_action_ordered)

; [bank:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or order_manager_staff_dismissal_or_suspension
       suspend_partial_business
       other_necessary_measures
       order_provision_reserve_fund
       order_branch_closure
       order_director_supervisor_dismissal_or_suspension
       revoke_statutory_meeting_resolution
       order_or_prohibit_asset_disposition
       restrict_investment)))

; [bank:notify_registration_authority] 解除董事、監察人職務時通知公司登記主管機關撤銷或廢止其登記
(assert (= notify_registration_authority
   (or notification_sent_to_registration_authority
       (not order_director_supervisor_dismissal_or_suspension))))

; [bank:business_guidance_needed] 為改善營運缺失有業務輔導之必要
(assert business_guidance_needed)

; [bank:business_guidance_assigned] 主管機關指定機構辦理業務輔導
(assert (= business_guidance_assigned
   (or business_guidance_assigned (not business_guidance_needed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行違反法令章程或有礙健全經營且未限期改善時處罰
(assert (= penalty (and violation_of_law_or_regulation (not corrective_action_ordered))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_of_law_or_regulation true))
(assert (= corrective_action_ordered true))
(assert (= restrict_investment true))
(assert (= penalty_measures true))
(assert (= revoke_statutory_meeting_resolution false))
(assert (= suspend_partial_business false))
(assert (= order_or_prohibit_asset_disposition false))
(assert (= order_branch_closure false))
(assert (= order_manager_staff_dismissal_or_suspension false))
(assert (= order_director_supervisor_dismissal_or_suspension false))
(assert (= order_provision_reserve_fund false))
(assert (= other_necessary_measures false))
(assert (= business_guidance_needed false))
(assert (= business_guidance_assigned false))
(assert (= notify_registration_authority false))
(assert (= notification_sent_to_registration_authority false))
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
; Total variables: 17
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
