; SMT2 file generated from compliance case automatic
; Case ID: case_8
; Generated at: 2025-10-20T22:55:37.793606
;
; This file can be executed with Z3:
;   z3 case_8.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_guidance_needed Bool)
(declare-const business_guidance_required Bool)
(declare-const director_supervisor_registration_revoked Bool)
(declare-const followup_completed Bool)
(declare-const non_special_penalty_measures Bool)
(declare-const non_special_violation Bool)
(declare-const non_special_violation_flag Bool)
(declare-const notify_economic_ministry Bool)
(declare-const notify_registration_authority Bool)
(declare-const order_close_branch_or_department Bool)
(declare-const order_dispose_subsidiary_shares Bool)
(declare-const order_prohibit_asset_disposition Bool)
(declare-const order_provision_amount Real)
(declare-const order_provision_or_capital_increase Bool)
(declare-const order_remove_manager_staff Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measure_1 Bool)
(declare-const penalty_measure_2 Bool)
(declare-const penalty_measure_3 Bool)
(declare-const penalty_measure_4 Bool)
(declare-const penalty_measure_5 Bool)
(declare-const penalty_measure_6 Bool)
(declare-const penalty_measure_7 Bool)
(declare-const penalty_measure_8 Bool)
(declare-const penalty_measure_9 Bool)
(declare-const penalty_measures Bool)
(declare-const penalty_measures_issued Bool)
(declare-const remove_director_supervisor Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_permit Bool)
(declare-const revoke_permit_followup Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const suspend_partial_business Bool)
(declare-const suspend_subsidiary_business Bool)
(declare-const violation Bool)
(declare-const violation_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation violation_flag))

; [bank:penalty_measures] 銀行主管機關可採取之處分措施
(assert (= penalty_measures (and violation penalty_measures_issued)))

; [bank:penalty_measure_1] 撤銷法定會議之決議
(assert (= penalty_measure_1 revoke_statutory_meeting_resolution))

; [bank:penalty_measure_2] 停止銀行部分業務
(assert (= penalty_measure_2 suspend_partial_business))

; [bank:penalty_measure_3] 限制投資
(assert (= penalty_measure_3 restrict_investment))

; [bank:penalty_measure_4] 命令或禁止特定資產之處分或移轉
(assert (= penalty_measure_4 order_prohibit_asset_disposition))

; [bank:penalty_measure_5] 命令限期裁撤分支機構或部門
(assert (= penalty_measure_5 order_close_branch_or_department))

; [bank:penalty_measure_6] 命令銀行解除經理人、職員之職務或停止其於一定期間內執行職務
(assert (= penalty_measure_6 order_remove_manager_staff))

; [bank:penalty_measure_7] 解除董事、監察人職務或停止其於一定期間內執行職務
(assert (= penalty_measure_7 remove_director_supervisor))

; [bank:penalty_measure_8] 命令提撥一定金額之準備
(assert (= penalty_measure_8 (= order_provision_amount 1.0)))

; [bank:penalty_measure_9] 其他必要之處置
(assert (= penalty_measure_9 other_necessary_measures))

; [bank:director_supervisor_registration_revoked] 解除董事、監察人職務時，通知公司登記主管機關撤銷或廢止其董事、監察人登記
(assert (= director_supervisor_registration_revoked
   (and penalty_measure_7 notify_registration_authority)))

; [bank:business_guidance_needed] 為改善銀行營運缺失而有業務輔導之必要
(assert (= business_guidance_needed business_guidance_required))

; [bill_finance:violation] 票券金融公司違反法令、章程或有礙健全經營之虞
(assert (= violation violation_flag))

; [bill_finance:penalty_measures] 票券金融公司主管機關可採取之處分措施，準用銀行法第61-1條
(assert true)

; [financial_holding:violation] 金融控股公司違反法令、章程或有礙健全經營之虞
(assert (= violation violation_flag))

; [financial_holding:penalty_measures] 金融控股公司主管機關可採取之處分措施
(assert (= penalty_measures (and violation penalty_measures_issued)))

; [financial_holding:penalty_measure_1] 撤銷法定會議之決議
(assert (= penalty_measure_1 revoke_statutory_meeting_resolution))

; [financial_holding:penalty_measure_2] 停止其子公司一部或全部業務
(assert (= penalty_measure_2 suspend_subsidiary_business))

; [financial_holding:penalty_measure_3] 令其解除經理人或職員之職務
(assert (= penalty_measure_3 order_remove_manager_staff))

; [financial_holding:penalty_measure_4] 解除董事、監察人職務或停止其於一定期間內執行職務
(assert (= penalty_measure_4 remove_director_supervisor))

; [financial_holding:penalty_measure_5] 令其處分持有子公司之股份
(assert (= penalty_measure_5 order_dispose_subsidiary_shares))

; [financial_holding:penalty_measure_6] 廢止許可
(assert (= penalty_measure_6 revoke_permit))

; [financial_holding:penalty_measure_7] 其他必要之處置
(assert (= penalty_measure_7 other_necessary_measures))

; [financial_holding:director_supervisor_registration_revoked] 解除董事、監察人職務時，通知經濟部廢止其董事或監察人登記
(assert (= director_supervisor_registration_revoked
   (and penalty_measure_4 notify_economic_ministry)))

; [financial_holding:revoke_permit_followup] 廢止許可時，限期處分持股及禁止使用名稱，未完成者應解散清算
(assert (= revoke_permit_followup (and penalty_measure_6 followup_completed)))

; [electronic_payment:violation] 專營電子支付機構違反法令、章程或有礙健全經營之虞
(assert (= violation violation_flag))

; [electronic_payment:penalty_measures] 專營電子支付機構主管機關可採取之處分措施
(assert (= penalty_measures (and violation penalty_measures_issued)))

; [electronic_payment:penalty_measure_1] 撤銷股東會或董事會等法定會議之決議
(assert (= penalty_measure_1 revoke_statutory_meeting_resolution))

; [electronic_payment:penalty_measure_2] 廢止專營電子支付機構全部或部分業務之許可
(assert (= penalty_measure_2 revoke_permit))

; [electronic_payment:penalty_measure_3] 命令專營電子支付機構解除經理人或職員之職務
(assert (= penalty_measure_3 order_remove_manager_staff))

; [electronic_payment:penalty_measure_4] 解除董事、監察人職務或停止其於一定期間內執行職務
(assert (= penalty_measure_4 remove_director_supervisor))

; [electronic_payment:penalty_measure_5] 命令提撥一定金額之準備或令其增資
(assert (= penalty_measure_5 order_provision_or_capital_increase))

; [electronic_payment:director_supervisor_registration_revoked] 解除董事、監察人職務時，通知公司登記主管機關廢止其董事、監察人登記
(assert (= director_supervisor_registration_revoked
   (and penalty_measure_4 notify_registration_authority)))

; [electronic_payment:non_special_violation] 非電子支付機構經主管機關許可經營國外小額匯兌及買賣外幣業務違反法令、章程或有礙健全經營之虞
(assert (= non_special_violation non_special_violation_flag))

; [electronic_payment:non_special_penalty_measures] 非電子支付機構違反規定時，準用專營電子支付機構處分規定
(assert (= non_special_penalty_measures penalty_measures))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：銀行違反法令、章程或有礙健全經營之虞且主管機關已採取處分措施時處罰
(assert (= penalty (and violation penalty_measures_issued)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation true))
(assert (= penalty_measures_issued true))
(assert (= penalty_measures true))
(assert (= penalty_measure_7 true))
(assert (= remove_director_supervisor true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 38
; Total variables: 37
; Total facts: 6
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
