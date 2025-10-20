; SMT2 file generated from compliance case automatic
; Case ID: case_54
; Generated at: 2025-10-19T06:44:03.166325
;
; This file can be executed with Z3:
;   z3 case_54.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_guidance_assigned Bool)
(declare-const business_guidance_needed Bool)
(declare-const business_guidance_required Bool)
(declare-const correction_given Bool)
(declare-const correction_ordered Bool)
(declare-const guidance_institution_assigned Bool)
(declare-const impair_sound_operation Bool)
(declare-const improvement_deadline_given Bool)
(declare-const notify_registration_authority Bool)
(declare-const order_asset_disposal_restriction Bool)
(declare-const order_branch_closure Bool)
(declare-const order_director_supervisor_dismissal_or_suspension Bool)
(declare-const order_manager_staff_dismissal_or_suspension Bool)
(declare-const order_reserve_provision Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty_measures Bool)
(declare-const registration_authority_notified Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_statutory_resolution Bool)
(declare-const suspend_partial_business Bool)
(declare-const violate_articles Bool)
(declare-const violate_law Bool)
(declare-const violation_occurred Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_occurred] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred (or violate_articles violate_law impair_sound_operation)))

; [bank:correction_ordered] 主管機關已予以糾正並命其限期改善
(assert (= correction_ordered (and correction_given improvement_deadline_given)))

; [bank:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or order_director_supervisor_dismissal_or_suspension
       suspend_partial_business
       order_reserve_provision
       order_manager_staff_dismissal_or_suspension
       order_asset_disposal_restriction
       revoke_statutory_resolution
       order_branch_closure
       restrict_investment
       other_necessary_measures)))

; [bank:notify_registration_authority] 解除董事、監察人職務時通知公司登記主管機關撤銷或廢止其登記
(assert (= notify_registration_authority
   (or (not order_director_supervisor_dismissal_or_suspension)
       registration_authority_notified)))

; [bank:business_guidance_needed] 為改善營運缺失有業務輔導之必要
(assert (= business_guidance_needed business_guidance_required))

; [bank:business_guidance_assigned] 主管機關指定機構辦理業務輔導
(assert (= business_guidance_assigned
   (or (not business_guidance_needed) guidance_institution_assigned)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行違反法令、章程或有礙健全經營且未予以糾正或未採取處分措施時處罰
(assert (= penalty
   (and violation_occurred (or (not correction_ordered) (not penalty_measures)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_law false))
(assert (= violate_articles false))
(assert (= impair_sound_operation true))
(assert (= violation_occurred true))
(assert (= correction_given true))
(assert (= improvement_deadline_given true))
(assert (= correction_ordered true))
(assert (= revoke_statutory_resolution false))
(assert (= suspend_partial_business true))
(assert (= restrict_investment false))
(assert (= order_asset_disposal_restriction false))
(assert (= order_branch_closure false))
(assert (= order_manager_staff_dismissal_or_suspension false))
(assert (= order_director_supervisor_dismissal_or_suspension false))
(assert (= order_reserve_provision false))
(assert (= other_necessary_measures false))
(assert (= penalty_measures true))
(assert (= notify_registration_authority false))
(assert (= business_guidance_required false))
(assert (= business_guidance_needed false))
(assert (= business_guidance_assigned false))
(assert (= guidance_institution_assigned false))
(assert (= penalty false))
(assert (= registration_authority_notified false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 24
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
