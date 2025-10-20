; SMT2 file generated from compliance case automatic
; Case ID: case_8
; Generated at: 2025-10-19T05:01:37.467336
;
; This file can be executed with Z3:
;   z3 case_8.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const dispose_shares_completed Bool)
(declare-const liquidation_completed Bool)
(declare-const name_change_completed Bool)
(declare-const notification_sent Bool)
(declare-const notify_company_registry_remove_director_supervisor Bool)
(declare-const notify_economic_ministry_remove_director_supervisor Bool)
(declare-const penalties_applicable Bool)
(declare-const penalty Bool)
(declare-const penalty_order_asset_disposal Bool)
(declare-const penalty_order_asset_disposal_flag Bool)
(declare-const penalty_order_close_branch Bool)
(declare-const penalty_order_close_branch_flag Bool)
(declare-const penalty_order_dispose_subsidiary_shares Bool)
(declare-const penalty_order_dispose_subsidiary_shares_flag Bool)
(declare-const penalty_order_reserve_fund Bool)
(declare-const penalty_order_reserve_fund_flag Bool)
(declare-const penalty_order_reserve_or_increase_capital Bool)
(declare-const penalty_order_reserve_or_increase_capital_flag Bool)
(declare-const penalty_order_suspend_officer Bool)
(declare-const penalty_order_suspend_officer_flag Bool)
(declare-const penalty_other_measures Bool)
(declare-const penalty_other_measures_flag Bool)
(declare-const penalty_remove_director_supervisor Bool)
(declare-const penalty_remove_director_supervisor_flag Bool)
(declare-const penalty_restrict_investment Bool)
(declare-const penalty_restrict_investment_flag Bool)
(declare-const penalty_revoke_meeting_resolution Bool)
(declare-const penalty_revoke_meeting_resolution_flag Bool)
(declare-const penalty_revoke_permit Bool)
(declare-const penalty_revoke_permit_business Bool)
(declare-const penalty_revoke_permit_business_flag Bool)
(declare-const penalty_revoke_permit_dispose_shares_compliance Bool)
(declare-const penalty_revoke_permit_flag Bool)
(declare-const penalty_revoke_permit_liquidation_compliance Bool)
(declare-const penalty_revoke_permit_name_change_compliance Bool)
(declare-const penalty_suspend_partial_business Bool)
(declare-const penalty_suspend_partial_business_flag Bool)
(declare-const penalty_suspend_subsidiary_business Bool)
(declare-const penalty_suspend_subsidiary_business_flag Bool)
(declare-const violation_flag Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_occurred] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [bank:penalties_applicable] 銀行主管機關可依情節輕重採取處分
(assert (= penalties_applicable violation_occurred))

; [bank:penalty_revoke_meeting_resolution] 撤銷法定會議之決議
(assert (= penalty_revoke_meeting_resolution penalty_revoke_meeting_resolution_flag))

; [bank:penalty_suspend_partial_business] 停止銀行部分業務
(assert (= penalty_suspend_partial_business penalty_suspend_partial_business_flag))

; [bank:penalty_restrict_investment] 限制投資
(assert (= penalty_restrict_investment penalty_restrict_investment_flag))

; [bank:penalty_order_asset_disposal] 命令或禁止特定資產之處分或移轉
(assert (= penalty_order_asset_disposal penalty_order_asset_disposal_flag))

; [bank:penalty_order_close_branch] 命令限期裁撤分支機構或部門
(assert (= penalty_order_close_branch penalty_order_close_branch_flag))

; [bank:penalty_order_suspend_officer] 命令銀行解除經理人、職員之職務或停止其於一定期間內執行職務
(assert (= penalty_order_suspend_officer penalty_order_suspend_officer_flag))

; [bank:penalty_remove_director_supervisor] 解除董事、監察人職務或停止其於一定期間內執行職務
(assert (= penalty_remove_director_supervisor penalty_remove_director_supervisor_flag))

; [bank:notify_company_registry_remove_director_supervisor] 解除董事、監察人職務時通知公司登記主管機關撤銷或廢止其董事、監察人登記
(assert (= notify_company_registry_remove_director_supervisor
   (and penalty_remove_director_supervisor notification_sent)))

; [bank:penalty_order_reserve_fund] 命令提撥一定金額之準備
(assert (= penalty_order_reserve_fund penalty_order_reserve_fund_flag))

; [bank:penalty_other_measures] 其他必要之處置
(assert (= penalty_other_measures penalty_other_measures_flag))

; [bill_finance:violation_occurred] 票券金融公司違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [bill_finance:penalties_applicable] 票券金融公司主管機關可依銀行法第61-1條規定採取處分
(assert (= penalties_applicable (and violation_occurred violation_flag)))

; [fhc:violation_occurred] 金融控股公司違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [fhc:penalties_applicable] 金融控股公司主管機關可依情節輕重採取處分
(assert (= penalties_applicable violation_occurred))

; [fhc:penalty_revoke_meeting_resolution] 撤銷法定會議之決議
(assert (= penalty_revoke_meeting_resolution penalty_revoke_meeting_resolution_flag))

; [fhc:penalty_suspend_subsidiary_business] 停止其子公司一部或全部業務
(assert (= penalty_suspend_subsidiary_business penalty_suspend_subsidiary_business_flag))

; [fhc:penalty_order_suspend_officer] 令其解除經理人或職員之職務
(assert (= penalty_order_suspend_officer penalty_order_suspend_officer_flag))

; [fhc:penalty_remove_director_supervisor] 解除董事、監察人職務或停止其於一定期間內執行職務
(assert (= penalty_remove_director_supervisor penalty_remove_director_supervisor_flag))

; [fhc:notify_economic_ministry_remove_director_supervisor] 解除董事、監察人職務時通知經濟部廢止其董事或監察人登記
(assert (= notify_economic_ministry_remove_director_supervisor
   (and penalty_remove_director_supervisor notification_sent)))

; [fhc:penalty_order_dispose_subsidiary_shares] 令其處分持有子公司之股份
(assert (= penalty_order_dispose_subsidiary_shares
   penalty_order_dispose_subsidiary_shares_flag))

; [fhc:penalty_revoke_permit] 廢止許可
(assert (= penalty_revoke_permit penalty_revoke_permit_flag))

; [fhc:penalty_other_measures] 其他必要之處置
(assert (= penalty_other_measures penalty_other_measures_flag))

; [fhc:penalty_revoke_permit_dispose_shares_compliance] 廢止許可時限期處分股份及董事人數不符規定
(assert (= penalty_revoke_permit_dispose_shares_compliance
   (and penalty_revoke_permit (not dispose_shares_completed))))

; [fhc:penalty_revoke_permit_name_change_compliance] 廢止許可時不得再使用金融控股公司名稱及辦理公司變更登記
(assert (= penalty_revoke_permit_name_change_compliance
   (and penalty_revoke_permit (not name_change_completed))))

; [fhc:penalty_revoke_permit_liquidation_compliance] 未於期限內處分完成者應進行解散及清算
(assert (= penalty_revoke_permit_liquidation_compliance
   (and penalty_revoke_permit (not liquidation_completed))))

; [epay:violation_occurred] 專營電子支付機構違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [epay:penalties_applicable] 專營電子支付機構主管機關可依情節輕重採取處分
(assert (= penalties_applicable violation_occurred))

; [epay:penalty_revoke_meeting_resolution] 撤銷股東會或董事會等法定會議之決議
(assert (= penalty_revoke_meeting_resolution penalty_revoke_meeting_resolution_flag))

; [epay:penalty_revoke_permit_business] 廢止專營電子支付機構全部或部分業務之許可
(assert (= penalty_revoke_permit_business penalty_revoke_permit_business_flag))

; [epay:penalty_order_suspend_officer] 命令專營電子支付機構解除經理人或職員之職務
(assert (= penalty_order_suspend_officer penalty_order_suspend_officer_flag))

; [epay:penalty_remove_director_supervisor] 解除董事、監察人職務或停止其於一定期間內執行職務
(assert (= penalty_remove_director_supervisor penalty_remove_director_supervisor_flag))

; [epay:notify_company_registry_remove_director_supervisor] 解除董事、監察人職務時通知公司登記主管機關廢止其董事、監察人登記
(assert (= notify_company_registry_remove_director_supervisor
   (and penalty_remove_director_supervisor notification_sent)))

; [epay:penalty_order_reserve_or_increase_capital] 命令提撥一定金額之準備或令其增資
(assert (= penalty_order_reserve_or_increase_capital
   penalty_order_reserve_or_increase_capital_flag))

; [epay:penalty_other_measures] 其他必要之處置
(assert (= penalty_other_measures penalty_other_measures_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (or (not penalty)
    (and violation_occurred
         (or penalty_order_reserve_or_increase_capital
             penalty_revoke_meeting_resolution
             penalty_revoke_permit_business
             penalty_other_measures
             penalty_order_suspend_officer
             penalty_remove_director_supervisor))
    (and violation_occurred penalties_applicable)
    (and violation_occurred
         (or penalty_revoke_meeting_resolution
             penalty_suspend_partial_business
             penalty_restrict_investment
             penalty_order_asset_disposal
             penalty_order_close_branch
             penalty_other_measures
             penalty_order_suspend_officer
             penalty_order_reserve_fund
             penalty_remove_director_supervisor))
    (and violation_occurred
         (or penalty_revoke_meeting_resolution
             penalty_revoke_permit
             penalty_suspend_subsidiary_business
             penalty_other_measures
             penalty_order_suspend_officer
             penalty_order_dispose_subsidiary_shares
             penalty_remove_director_supervisor))))

; [meta:penalty_conditions] 處罰條件：銀行違反法令章程或有礙健全經營之虞且主管機關採取處分時處罰
(assert (= penalty
   (or (and violation_occurred
            (or penalty_revoke_meeting_resolution
                penalty_suspend_partial_business
                penalty_restrict_investment
                penalty_order_asset_disposal
                penalty_order_close_branch
                penalty_other_measures
                penalty_order_suspend_officer
                penalty_order_reserve_fund
                penalty_remove_director_supervisor))
       (and violation_occurred
            (or penalty_order_reserve_or_increase_capital
                penalty_revoke_meeting_resolution
                penalty_revoke_permit_business
                penalty_other_measures
                penalty_order_suspend_officer
                penalty_remove_director_supervisor))
       (and violation_occurred
            (or penalty_revoke_meeting_resolution
                penalty_revoke_permit
                penalty_suspend_subsidiary_business
                penalty_other_measures
                penalty_order_suspend_officer
                penalty_order_dispose_subsidiary_shares
                penalty_remove_director_supervisor))
       (and violation_occurred penalties_applicable))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation_occurred true))
(assert (= penalties_applicable true))
(assert (= penalty_remove_director_supervisor_flag true))
(assert (= penalty_remove_director_supervisor true))
(assert (= penalty_order_suspend_officer_flag false))
(assert (= penalty_order_suspend_officer false))
(assert (= penalty_revoke_meeting_resolution_flag false))
(assert (= penalty_revoke_meeting_resolution false))
(assert (= penalty_suspend_partial_business_flag false))
(assert (= penalty_suspend_partial_business false))
(assert (= penalty_restrict_investment_flag false))
(assert (= penalty_restrict_investment false))
(assert (= penalty_order_asset_disposal_flag false))
(assert (= penalty_order_asset_disposal false))
(assert (= penalty_order_close_branch_flag false))
(assert (= penalty_order_close_branch false))
(assert (= penalty_order_reserve_fund_flag false))
(assert (= penalty_order_reserve_fund false))
(assert (= penalty_other_measures_flag false))
(assert (= penalty_other_measures false))
(assert (= penalty_order_dispose_subsidiary_shares_flag false))
(assert (= penalty_order_dispose_subsidiary_shares false))
(assert (= penalty_revoke_permit_flag false))
(assert (= penalty_revoke_permit false))
(assert (= penalty_revoke_permit_business_flag false))
(assert (= penalty_revoke_permit_business false))
(assert (= penalty_suspend_subsidiary_business_flag false))
(assert (= penalty_suspend_subsidiary_business false))
(assert (= notification_sent false))
(assert (= notify_company_registry_remove_director_supervisor false))
(assert (= notify_economic_ministry_remove_director_supervisor false))
(assert (= dispose_shares_completed false))
(assert (= liquidation_completed false))
(assert (= name_change_completed false))
(assert (= penalty_order_reserve_or_increase_capital_flag false))
(assert (= penalty_order_reserve_or_increase_capital false))
(assert (= penalty_revoke_permit_dispose_shares_compliance false))
(assert (= penalty_revoke_permit_name_change_compliance false))
(assert (= penalty_revoke_permit_liquidation_compliance false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 38
; Total variables: 41
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
