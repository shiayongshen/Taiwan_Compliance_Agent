; SMT2 file generated from compliance case automatic
; Case ID: case_369
; Generated at: 2025-10-19T14:13:26.852217
;
; This file can be executed with Z3:
;   z3 case_369.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_guidance_needed Bool)
(declare-const business_guidance_needed_flag Bool)
(declare-const correction_ordered Bool)
(declare-const correction_ordered_flag Bool)
(declare-const director_supervisor_registration_revoked Bool)
(declare-const director_supervisor_registration_revoked_flag Bool)
(declare-const other_necessary_measures_ordered Bool)
(declare-const other_necessary_measures_ordered_flag Bool)
(declare-const penalty Bool)
(declare-const penalty_asset_disposal_restriction Bool)
(declare-const penalty_asset_disposal_restriction_flag Bool)
(declare-const penalty_branch_closure_order Bool)
(declare-const penalty_branch_closure_order_flag Bool)
(declare-const penalty_director_supervisor_dismissal_or_suspension Bool)
(declare-const penalty_director_supervisor_dismissal_or_suspension_flag Bool)
(declare-const penalty_investment_restriction Bool)
(declare-const penalty_investment_restriction_flag Bool)
(declare-const penalty_manager_staff_dismissal_or_suspension Bool)
(declare-const penalty_manager_staff_dismissal_or_suspension_flag Bool)
(declare-const penalty_revocation_resolution Bool)
(declare-const penalty_revocation_resolution_flag Bool)
(declare-const penalty_suspend_partial_business Bool)
(declare-const penalty_suspend_partial_business_flag Bool)
(declare-const reserve_fund_ordered Bool)
(declare-const reserve_fund_ordered_flag Bool)
(declare-const violation_flag Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_occurred] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [bank:correction_ordered] 主管機關已予以糾正並命其限期改善
(assert (= correction_ordered correction_ordered_flag))

; [bank:penalty_revocation_resolution] 撤銷法定會議之決議
(assert (= penalty_revocation_resolution penalty_revocation_resolution_flag))

; [bank:penalty_suspend_partial_business] 停止銀行部分業務
(assert (= penalty_suspend_partial_business penalty_suspend_partial_business_flag))

; [bank:penalty_investment_restriction] 限制投資
(assert (= penalty_investment_restriction penalty_investment_restriction_flag))

; [bank:penalty_asset_disposal_restriction] 命令或禁止特定資產之處分或移轉
(assert (= penalty_asset_disposal_restriction penalty_asset_disposal_restriction_flag))

; [bank:penalty_branch_closure_order] 命令限期裁撤分支機構或部門
(assert (= penalty_branch_closure_order penalty_branch_closure_order_flag))

; [bank:penalty_manager_staff_dismissal_or_suspension] 命令銀行解除經理人、職員之職務或停止其於一定期間內執行職務
(assert (= penalty_manager_staff_dismissal_or_suspension
   penalty_manager_staff_dismissal_or_suspension_flag))

; [bank:penalty_director_supervisor_dismissal_or_suspension] 解除董事、監察人職務或停止其於一定期間內執行職務
(assert (= penalty_director_supervisor_dismissal_or_suspension
   penalty_director_supervisor_dismissal_or_suspension_flag))

; [bank:director_supervisor_registration_revoked] 主管機關通知公司登記主管機關撤銷或廢止董事、監察人登記
(assert (= director_supervisor_registration_revoked
   director_supervisor_registration_revoked_flag))

; [bank:reserve_fund_ordered] 命令提撥一定金額之準備
(assert (= reserve_fund_ordered reserve_fund_ordered_flag))

; [bank:other_necessary_measures_ordered] 其他必要之處置
(assert (= other_necessary_measures_ordered other_necessary_measures_ordered_flag))

; [bank:business_guidance_needed] 為改善銀行營運缺失有業務輔導之必要
(assert (= business_guidance_needed business_guidance_needed_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行違反法令、章程或有礙健全經營且主管機關依規定處分時處罰
(assert (= penalty
   (and violation_occurred
        (or penalty_suspend_partial_business
            penalty_branch_closure_order
            penalty_asset_disposal_restriction
            other_necessary_measures_ordered
            penalty_manager_staff_dismissal_or_suspension
            reserve_fund_ordered
            penalty_investment_restriction
            penalty_revocation_resolution
            penalty_director_supervisor_dismissal_or_suspension))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= correction_ordered_flag true))
(assert (= penalty_suspend_partial_business_flag true))
(assert (= penalty_revocation_resolution_flag false))
(assert (= penalty_investment_restriction_flag false))
(assert (= penalty_asset_disposal_restriction_flag false))
(assert (= penalty_branch_closure_order_flag false))
(assert (= penalty_manager_staff_dismissal_or_suspension_flag false))
(assert (= penalty_director_supervisor_dismissal_or_suspension_flag false))
(assert (= director_supervisor_registration_revoked_flag false))
(assert (= reserve_fund_ordered_flag false))
(assert (= other_necessary_measures_ordered_flag false))
(assert (= business_guidance_needed_flag false))
(assert (= business_guidance_needed false))
(assert (= correction_ordered false))
(assert (= director_supervisor_registration_revoked false))
(assert (= other_necessary_measures_ordered false))
(assert (= penalty false))
(assert (= penalty_asset_disposal_restriction false))
(assert (= penalty_branch_closure_order false))
(assert (= penalty_director_supervisor_dismissal_or_suspension false))
(assert (= penalty_investment_restriction false))
(assert (= penalty_manager_staff_dismissal_or_suspension false))
(assert (= penalty_revocation_resolution false))
(assert (= penalty_suspend_partial_business false))
(assert (= reserve_fund_ordered false))
(assert (= violation_occurred false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 27
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
