; SMT2 file generated from compliance case automatic
; Case ID: case_317
; Generated at: 2025-10-19T12:54:42.195348
;
; This file can be executed with Z3:
;   z3 case_317.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_guidance_designated Bool)
(declare-const business_guidance_needed Bool)
(declare-const correction_given Bool)
(declare-const correction_ordered Bool)
(declare-const improvement_deadline_set Bool)
(declare-const notification_sent_to_registration_authority Bool)
(declare-const notify_registration_authority Bool)
(declare-const order_close_branch_or_department Bool)
(declare-const order_prohibit_asset_disposition Bool)
(declare-const order_provision_of_reserve Bool)
(declare-const order_remove_or_suspend_director_or_supervisor Bool)
(declare-const order_remove_or_suspend_manager_or_staff Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
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

; [bank:correction_ordered] 主管機關已予以糾正並命其限期改善
(assert (= correction_ordered (and correction_given improvement_deadline_set)))

; [bank:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or order_remove_or_suspend_director_or_supervisor
       order_provision_of_reserve
       order_remove_or_suspend_manager_or_staff
       order_close_branch_or_department
       order_prohibit_asset_disposition
       suspend_partial_business
       restrict_investment
       other_necessary_measures
       revoke_statutory_meeting_resolution)))

; [bank:notify_registration_authority] 解除董事、監察人職務時通知公司登記主管機關撤銷或廢止其登記
(assert (= notify_registration_authority
   (or notification_sent_to_registration_authority
       (not order_remove_or_suspend_director_or_supervisor))))

; [bank:business_guidance_needed] 為改善營運缺失有業務輔導必要
(assert (= business_guidance_needed business_guidance_designated))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行違反法令、章程或有礙健全經營且未依主管機關命令改善時處罰
(assert (= penalty (and violation_occurred (not correction_ordered))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= correction_given true))
(assert (= improvement_deadline_set true))
(assert (= business_guidance_designated false))
(assert (= notification_sent_to_registration_authority false))
(assert (= notify_registration_authority false))
(assert (= order_close_branch_or_department false))
(assert (= order_prohibit_asset_disposition false))
(assert (= order_provision_of_reserve false))
(assert (= order_remove_or_suspend_director_or_supervisor false))
(assert (= order_remove_or_suspend_manager_or_staff false))
(assert (= other_necessary_measures false))
(assert (= penalty false))
(assert (= penalty_measures false))
(assert (= restrict_investment false))
(assert (= revoke_statutory_meeting_resolution false))
(assert (= suspend_partial_business true))
(assert (= violation_occurred true))
(assert (= correction_ordered true))
(assert (= business_guidance_needed false))

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
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
