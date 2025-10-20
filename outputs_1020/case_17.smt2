; SMT2 file generated from compliance case automatic
; Case ID: case_17
; Generated at: 2025-10-19T05:12:39.159771
;
; This file can be executed with Z3:
;   z3 case_17.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_guidance_needed Bool)
(declare-const business_guidance_required Bool)
(declare-const director_supervisor_removal_notify Bool)
(declare-const dispose_subsidiary_shares_within_deadline Bool)
(declare-const failure_dispose_shares_must_liquidate Bool)
(declare-const liquidate_and_dissolve Bool)
(declare-const non_e_payment_foreign_remittance_violation Bool)
(declare-const notify_economic_ministry Bool)
(declare-const notify_registration_authority Bool)
(declare-const order_close_branch_or_department Bool)
(declare-const order_dispose_subsidiary_shares Bool)
(declare-const order_provision_reserve Bool)
(declare-const order_provision_reserve_or_capital_increase Bool)
(declare-const order_remove_manager_or_staff Bool)
(declare-const order_restrict_asset_disposal Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const prohibit_use_name_and_change_registration Bool)
(declare-const remove_director_or_supervisor Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_all_or_partial_business_permit Bool)
(declare-const revoke_meeting_resolution Bool)
(declare-const revoke_permit Bool)
(declare-const revoke_permit_dispose_shares Bool)
(declare-const suspend_partial_business Bool)
(declare-const suspend_subsidiary_business Bool)
(declare-const violation_flag Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_occurred] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [bank:penalty_measures] 銀行主管機關可採取之處分措施
(assert (= penalty_measures
   (or suspend_partial_business
       order_close_branch_or_department
       remove_director_or_supervisor
       other_necessary_measures
       order_provision_reserve
       revoke_meeting_resolution
       order_restrict_asset_disposal
       order_remove_manager_or_staff
       restrict_investment)))

; [bank:director_supervisor_removal_notify] 解除董事、監察人職務時通知公司登記主管機關撤銷或廢止其登記
(assert (= director_supervisor_removal_notify
   (or notify_registration_authority (not remove_director_or_supervisor))))

; [bank:business_guidance_needed] 為改善銀行營運缺失有業務輔導之必要
(assert (= business_guidance_needed business_guidance_required))

; [bill_finance:violation_occurred] 票券金融公司違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [bill_finance:penalty_measures] 票券金融公司主管機關可採取之處分措施，準用銀行法第61-1條
(assert penalty_measures)

; [financial_holdings:violation_occurred] 金融控股公司違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [financial_holdings:penalty_measures] 金融控股公司主管機關可採取之處分措施
(assert (= penalty_measures
   (or order_dispose_subsidiary_shares
       remove_director_or_supervisor
       other_necessary_measures
       revoke_permit
       suspend_subsidiary_business
       revoke_meeting_resolution
       order_remove_manager_or_staff)))

; [financial_holdings:director_supervisor_removal_notify] 解除董事、監察人職務時通知經濟部廢止其登記
(assert (= director_supervisor_removal_notify
   (or notify_economic_ministry (not remove_director_or_supervisor))))

; [financial_holdings:revoke_permit_dispose_shares] 廢止許可時限期處分持有子公司股份及限制名稱使用
(assert (= revoke_permit_dispose_shares
   (or (not revoke_permit)
       (and dispose_subsidiary_shares_within_deadline
            prohibit_use_name_and_change_registration))))

; [financial_holdings:failure_dispose_shares_must_liquidate] 未於期限內處分完成者，應進行解散及清算
(assert (= failure_dispose_shares_must_liquidate
   (or dispose_subsidiary_shares_within_deadline liquidate_and_dissolve)))

; [e_payment:violation_occurred] 專營電子支付機構違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [e_payment:penalty_measures] 專營電子支付機構主管機關可採取之處分措施
(assert (= penalty_measures
   (or order_provision_reserve_or_capital_increase
       revoke_all_or_partial_business_permit
       remove_director_or_supervisor
       other_necessary_measures
       revoke_meeting_resolution
       order_remove_manager_or_staff)))

; [e_payment:director_supervisor_removal_notify] 解除董事、監察人職務時通知公司登記主管機關廢止其登記
(assert (= director_supervisor_removal_notify
   (or (not remove_director_or_supervisor) notify_registration_authority)))

; [e_payment:non_e_payment_foreign_remittance_violation] 非電子支付機構經主管機關許可經營國外小額匯兌及買賣外幣業務違反規定，準用電子支付機構管理條例處分
(assert (= non_e_payment_foreign_remittance_violation violation_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (or (and violation_occurred penalty_measures) (not penalty)))

; [meta:penalty_conditions] 處罰條件：銀行、票券金融公司、金融控股公司或電子支付機構違反法令、章程或有礙健全經營之虞且主管機關採取處分時處罰
(assert (= penalty (and violation_occurred penalty_measures)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation_occurred true))
(assert (= penalty_measures true))
(assert (= revoke_meeting_resolution false))
(assert (= suspend_partial_business false))
(assert (= restrict_investment false))
(assert (= order_restrict_asset_disposal false))
(assert (= order_close_branch_or_department false))
(assert (= order_remove_manager_or_staff true))
(assert (= remove_director_or_supervisor false))
(assert (= order_provision_reserve false))
(assert (= other_necessary_measures false))
(assert (= business_guidance_required false))
(assert (= business_guidance_needed false))
(assert (= director_supervisor_removal_notify false))
(assert (= dispose_subsidiary_shares_within_deadline false))
(assert (= failure_dispose_shares_must_liquidate false))
(assert (= liquidate_and_dissolve false))
(assert (= non_e_payment_foreign_remittance_violation false))
(assert (= notify_economic_ministry false))
(assert (= notify_registration_authority false))
(assert (= order_provision_reserve_or_capital_increase false))
(assert (= penalty true))
(assert (= prohibit_use_name_and_change_registration false))
(assert (= revoke_all_or_partial_business_permit false))
(assert (= revoke_permit false))
(assert (= revoke_permit_dispose_shares false))
(assert (= suspend_subsidiary_business false))
(assert (= order_dispose_subsidiary_shares false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 29
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
