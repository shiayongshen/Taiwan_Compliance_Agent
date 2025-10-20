; SMT2 file generated from compliance case automatic
; Case ID: case_318
; Generated at: 2025-10-19T12:55:52.291068
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
(declare-const order_or_prohibition_of_asset_disposition Bool)
(declare-const order_to_close_branches_or_departments Bool)
(declare-const order_to_provision_reserve_funds Bool)
(declare-const order_to_remove_or_suspend_managers_or_staff Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const removal_notification_done Bool)
(declare-const removal_or_suspension_of_directors_or_supervisors Bool)
(declare-const revocation_of_statutory_meeting_resolution Bool)
(declare-const suspension_of_partial_business Bool)
(declare-const ticket_finance_business_guidance_assigned Bool)
(declare-const ticket_finance_business_guidance_needed Bool)
(declare-const ticket_finance_investment_restriction Bool)
(declare-const ticket_finance_order_or_prohibition_of_asset_disposition Bool)
(declare-const ticket_finance_order_to_close_branches_or_departments Bool)
(declare-const ticket_finance_order_to_provision_reserve_funds Bool)
(declare-const ticket_finance_order_to_remove_or_suspend_managers_or_staff Bool)
(declare-const ticket_finance_other_necessary_measures Bool)
(declare-const ticket_finance_penalty_measures Bool)
(declare-const ticket_finance_removal_notification_done Bool)
(declare-const ticket_finance_removal_or_suspension_of_directors_or_supervisors Bool)
(declare-const ticket_finance_revocation_of_statutory_meeting_resolution Bool)
(declare-const ticket_finance_suspension_of_partial_business Bool)
(declare-const ticket_finance_violation_of_law_or_regulation Bool)
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
   (or investment_restriction
       order_to_remove_or_suspend_managers_or_staff
       suspension_of_partial_business
       other_necessary_measures
       revocation_of_statutory_meeting_resolution
       order_or_prohibition_of_asset_disposition
       order_to_close_branches_or_departments
       order_to_provision_reserve_funds
       removal_or_suspension_of_directors_or_supervisors)))

; [bank:removal_notification_done] 解除董事、監察人職務時已通知公司登記主管機關撤銷或廢止其登記
(assert removal_notification_done)

; [bank:business_guidance_needed] 為改善營運缺失有業務輔導之必要
(assert business_guidance_needed)

; [bank:business_guidance_assigned] 主管機關已指定機構辦理業務輔導
(assert business_guidance_assigned)

; [ticket_finance:violation_of_law_or_regulation] 票券金融公司違反法令、章程或有礙健全經營之虞
(assert ticket_finance_violation_of_law_or_regulation)

; [ticket_finance:penalty_measures] 主管機關依銀行法第61-1條規定採取處分措施
(assert (= ticket_finance_penalty_measures
   (or ticket_finance_removal_or_suspension_of_directors_or_supervisors
       ticket_finance_other_necessary_measures
       ticket_finance_revocation_of_statutory_meeting_resolution
       ticket_finance_order_or_prohibition_of_asset_disposition
       ticket_finance_order_to_remove_or_suspend_managers_or_staff
       ticket_finance_order_to_close_branches_or_departments
       ticket_finance_order_to_provision_reserve_funds
       ticket_finance_investment_restriction
       ticket_finance_suspension_of_partial_business)))

; [ticket_finance:removal_notification_done] 解除董事、監察人職務時已通知公司登記主管機關撤銷或廢止其登記
(assert ticket_finance_removal_notification_done)

; [ticket_finance:business_guidance_needed] 為改善營運缺失有業務輔導之必要
(assert ticket_finance_business_guidance_needed)

; [ticket_finance:business_guidance_assigned] 主管機關已指定機構辦理業務輔導
(assert ticket_finance_business_guidance_assigned)

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行或票券金融公司違反法令章程且未採取主管機關處分措施時處罰
(assert (= penalty
   (or (and violation_of_law_or_regulation (not penalty_measures))
       (and ticket_finance_violation_of_law_or_regulation
            (not ticket_finance_penalty_measures)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_of_law_or_regulation true))
(assert (= corrective_action_ordered true))
(assert (= suspension_of_partial_business true))
(assert (= investment_restriction false))
(assert (= order_or_prohibition_of_asset_disposition false))
(assert (= order_to_close_branches_or_departments false))
(assert (= order_to_remove_or_suspend_managers_or_staff false))
(assert (= removal_or_suspension_of_directors_or_supervisors false))
(assert (= order_to_provision_reserve_funds false))
(assert (= other_necessary_measures false))
(assert (= penalty_measures true))
(assert (= penalty false))
(assert (= removal_notification_done false))
(assert (= business_guidance_needed false))
(assert (= business_guidance_assigned false))
(assert (= revocation_of_statutory_meeting_resolution false))
(assert (= ticket_finance_business_guidance_assigned false))
(assert (= ticket_finance_business_guidance_needed false))
(assert (= ticket_finance_investment_restriction false))
(assert (= ticket_finance_order_or_prohibition_of_asset_disposition false))
(assert (= ticket_finance_order_to_close_branches_or_departments false))
(assert (= ticket_finance_order_to_provision_reserve_funds false))
(assert (= ticket_finance_order_to_remove_or_suspend_managers_or_staff false))
(assert (= ticket_finance_other_necessary_measures false))
(assert (= ticket_finance_penalty_measures false))
(assert (= ticket_finance_removal_notification_done false))
(assert (= ticket_finance_removal_or_suspension_of_directors_or_supervisors false))
(assert (= ticket_finance_revocation_of_statutory_meeting_resolution false))
(assert (= ticket_finance_suspension_of_partial_business false))
(assert (= ticket_finance_violation_of_law_or_regulation false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 30
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
