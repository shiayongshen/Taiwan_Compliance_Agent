; SMT2 file generated from compliance case automatic
; Case ID: case_290
; Generated at: 2025-10-19T12:14:29.320366
;
; This file can be executed with Z3:
;   z3 case_290.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_guidance_assigned Bool)
(declare-const business_guidance_needed Bool)
(declare-const corrective_action_ordered Bool)
(declare-const notify_registration_authority Bool)
(declare-const order_branch_closure Bool)
(declare-const order_dismiss_director_or_supervisor Bool)
(declare-const order_dismiss_manager_or_staff Bool)
(declare-const order_or_prohibit_asset_disposition Bool)
(declare-const order_reserve_provision Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const registration_authority_notified Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const suspend_partial_business Bool)
(declare-const violation_flag Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_occurred] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [bank:corrective_action_ordered] 主管機關已予以糾正並命其限期改善
(assert corrective_action_ordered)

; [bank:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or order_or_prohibit_asset_disposition
       revoke_statutory_meeting_resolution
       restrict_investment
       other_necessary_measures
       order_dismiss_director_or_supervisor
       order_reserve_provision
       suspend_partial_business
       order_dismiss_manager_or_staff
       order_branch_closure)))

; [bank:notify_registration_authority] 解除董事、監察人職務時通知公司登記主管機關撤銷或廢止其登記
(assert (= notify_registration_authority
   (or registration_authority_notified
       (not order_dismiss_director_or_supervisor))))

; [bank:business_guidance_needed] 為改善營運缺失有業務輔導之必要
(assert business_guidance_needed)

; [bank:business_guidance_assigned] 主管機關指定機構辦理業務輔導
(assert (= business_guidance_assigned
   (or (not business_guidance_needed) business_guidance_assigned)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行違反法令且主管機關採取處分措施時處罰
(assert (= penalty (and violation_occurred penalty_measures)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation_occurred true))
(assert (= corrective_action_ordered true))
(assert (= restrict_investment true))
(assert (= penalty_measures true))
(assert (= revoke_statutory_meeting_resolution false))
(assert (= suspend_partial_business false))
(assert (= order_or_prohibit_asset_disposition false))
(assert (= order_branch_closure false))
(assert (= order_dismiss_manager_or_staff false))
(assert (= order_dismiss_director_or_supervisor false))
(assert (= registration_authority_notified false))
(assert (= business_guidance_needed false))
(assert (= business_guidance_assigned false))
(assert (= other_necessary_measures false))
(assert (= penalty true))
(assert (= notify_registration_authority false))
(assert (= order_reserve_provision false))

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
