; SMT2 file generated from compliance case automatic
; Case ID: case_369
; Generated at: 2025-10-21T08:13:03.685950
;
; This file can be executed with Z3:
;   z3 case_369.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bank_violation_flag Bool)
(declare-const business_guidance_needed Bool)
(declare-const business_guidance_required Bool)
(declare-const company_registry_notified Bool)
(declare-const correction_issued Bool)
(declare-const correction_ordered Bool)
(declare-const improvement_deadline_set Bool)
(declare-const notify_company_registry Bool)
(declare-const order_branch_closure Bool)
(declare-const order_director_supervisor_dismissal_or_suspension Bool)
(declare-const order_manager_staff_dismissal_or_suspension Bool)
(declare-const order_or_prohibit_asset_disposition Bool)
(declare-const order_provision_reserve_fund Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalties_applied Bool)
(declare-const penalty Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const suspend_partial_business Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_occurred] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred bank_violation_flag))

; [bank:correction_ordered] 主管機關已予以糾正並命其限期改善
(assert (= correction_ordered (and correction_issued improvement_deadline_set)))

; [bank:penalties_applied] 主管機關依情節輕重為下列處分之一
(assert (= penalties_applied
   (or order_director_supervisor_dismissal_or_suspension
       order_or_prohibit_asset_disposition
       suspend_partial_business
       restrict_investment
       other_necessary_measures
       order_branch_closure
       revoke_statutory_meeting_resolution
       order_provision_reserve_fund
       order_manager_staff_dismissal_or_suspension)))

; [bank:notify_company_registry] 依第七款解除董事、監察人職務時通知公司登記主管機關撤銷或廢止其登記
(assert (= notify_company_registry
   (or company_registry_notified
       (not order_director_supervisor_dismissal_or_suspension))))

; [bank:business_guidance_needed] 為改善銀行營運缺失有業務輔導必要
(assert (= business_guidance_needed business_guidance_required))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行違反法令章程或有礙健全經營且未依主管機關處分改善時處罰
(assert (= penalty (and violation_occurred (not penalties_applied))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= bank_violation_flag true))
(assert (= correction_issued true))
(assert (= improvement_deadline_set true))
(assert (= correction_ordered true))
(assert (= penalties_applied false))
(assert (= penalty true))
(assert (= business_guidance_required false))
(assert (= business_guidance_needed false))
(assert (= revoke_statutory_meeting_resolution false))
(assert (= suspend_partial_business false))
(assert (= restrict_investment false))
(assert (= order_or_prohibit_asset_disposition false))
(assert (= order_branch_closure false))
(assert (= order_manager_staff_dismissal_or_suspension false))
(assert (= order_director_supervisor_dismissal_or_suspension false))
(assert (= notify_company_registry false))
(assert (= company_registry_notified false))
(assert (= other_necessary_measures false))

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
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
