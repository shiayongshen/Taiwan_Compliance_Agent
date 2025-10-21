; SMT2 file generated from compliance case automatic
; Case ID: case_318
; Generated at: 2025-10-21T07:08:01.155736
;
; This file can be executed with Z3:
;   z3 case_318.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_guidance_assigned Bool)
(declare-const business_guidance_needed Bool)
(declare-const corrective_action_ordered Bool)
(declare-const investment_restriction Bool)
(declare-const notification_to_registration_authority Bool)
(declare-const order_or_prohibition_of_asset_disposition Bool)
(declare-const order_to_close_branches_or_departments Bool)
(declare-const order_to_provision_reserve_funds Bool)
(declare-const order_to_remove_or_suspend_manager_or_staff Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const removal_of_directors_supervisors_notified Bool)
(declare-const removal_or_suspension_of_directors_or_supervisors Bool)
(declare-const revocation_of_statutory_meeting_resolution Bool)
(declare-const suspension_of_partial_business Bool)
(declare-const violation_of_law_or_regulation Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_of_law_or_regulation] 銀行違反法令、章程或有礙健全經營之虞
(assert violation_of_law_or_regulation)

; [bank:corrective_action_ordered] 主管機關已予以糾正並命其限期改善
(assert corrective_action_ordered)

; [bank:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or order_to_provision_reserve_funds
       suspension_of_partial_business
       investment_restriction
       order_to_close_branches_or_departments
       other_necessary_measures
       revocation_of_statutory_meeting_resolution
       removal_or_suspension_of_directors_or_supervisors
       order_to_remove_or_suspend_manager_or_staff
       order_or_prohibition_of_asset_disposition)))

; [bank:removal_of_directors_supervisors_notified] 解除董事、監察人職務時已通知公司登記主管機關撤銷或廢止其登記
(assert (= removal_of_directors_supervisors_notified
   (or (not removal_or_suspension_of_directors_or_supervisors)
       notification_to_registration_authority)))

; [bank:business_guidance_needed] 為改善營運缺失有業務輔導之必要
(assert business_guidance_needed)

; [bank:business_guidance_assigned] 主管機關已指定機構辦理業務輔導
(assert (= business_guidance_assigned
   (or (not business_guidance_needed) business_guidance_assigned)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行違反法令章程或有礙健全經營且未接受主管機關處分時處罰
(assert (= penalty (and violation_of_law_or_regulation (not penalty_measures))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_of_law_or_regulation true))
(assert (= corrective_action_ordered true))
(assert (= penalty_measures true))
(assert (= investment_restriction true))
(assert (= suspension_of_partial_business true))
(assert (= other_necessary_measures true))
(assert (= removal_or_suspension_of_directors_or_supervisors false))
(assert (= removal_of_directors_supervisors_notified false))
(assert (= revocation_of_statutory_meeting_resolution false))
(assert (= order_or_prohibition_of_asset_disposition false))
(assert (= order_to_close_branches_or_departments false))
(assert (= order_to_provision_reserve_funds false))
(assert (= order_to_remove_or_suspend_manager_or_staff false))
(assert (= business_guidance_needed false))
(assert (= business_guidance_assigned false))
(assert (= penalty false))
(assert (= notification_to_registration_authority false))

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
