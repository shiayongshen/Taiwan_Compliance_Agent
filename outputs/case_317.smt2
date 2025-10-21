; SMT2 file generated from compliance case automatic
; Case ID: case_317
; Generated at: 2025-10-21T07:07:08.360290
;
; This file can be executed with Z3:
;   z3 case_317.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bank_violation Bool)
(declare-const business_guidance_assigned Bool)
(declare-const business_guidance_needed Bool)
(declare-const business_guidance_required Bool)
(declare-const correction_given Bool)
(declare-const correction_ordered Bool)
(declare-const guidance_institution_assigned Bool)
(declare-const improvement_deadline_set Bool)
(declare-const notify_registration_authority Bool)
(declare-const order_branch_closure Bool)
(declare-const order_dismissal_or_suspension_director_supervisor Bool)
(declare-const order_dismissal_or_suspension_manager_staff Bool)
(declare-const order_or_prohibit_asset_disposition Bool)
(declare-const order_provision_reserve_fund Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const registration_authority_notified Bool)
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
(assert (= correction_ordered (and correction_given improvement_deadline_set)))

; [bank:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or order_branch_closure
       revoke_statutory_meeting_resolution
       order_dismissal_or_suspension_manager_staff
       order_dismissal_or_suspension_director_supervisor
       restrict_investment
       order_or_prohibit_asset_disposition
       other_necessary_measures
       suspend_partial_business
       order_provision_reserve_fund)))

; [bank:notify_registration_authority] 解除董事、監察人職務時通知公司登記主管機關撤銷或廢止其登記
(assert (= notify_registration_authority
   (or (not order_dismissal_or_suspension_director_supervisor)
       registration_authority_notified)))

; [bank:business_guidance_needed] 為改善營運缺失有業務輔導必要
(assert (= business_guidance_needed business_guidance_required))

; [bank:business_guidance_assigned] 主管機關指定機構辦理業務輔導
(assert (= business_guidance_assigned
   (or guidance_institution_assigned (not business_guidance_needed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行違反法令章程或有礙健全經營且未改善時處罰
(assert (= penalty (and violation_occurred (not correction_ordered))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= bank_violation true))
(assert (= correction_given true))
(assert (= improvement_deadline_set true))
(assert (= correction_ordered true))
(assert (= violation_occurred true))
(assert (= suspend_partial_business true))
(assert (= penalty_measures true))
(assert (= penalty false))
(assert (= business_guidance_required false))
(assert (= business_guidance_needed false))
(assert (= business_guidance_assigned false))
(assert (= order_branch_closure false))
(assert (= order_dismissal_or_suspension_manager_staff false))
(assert (= order_dismissal_or_suspension_director_supervisor false))
(assert (= notify_registration_authority false))
(assert (= registration_authority_notified false))
(assert (= restrict_investment false))
(assert (= revoke_statutory_meeting_resolution false))
(assert (= order_or_prohibit_asset_disposition false))
(assert (= order_provision_reserve_fund false))
(assert (= other_necessary_measures false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 22
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
