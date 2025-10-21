; SMT2 file generated from compliance case automatic
; Case ID: case_155
; Generated at: 2025-10-21T03:30:08.500460
;
; This file can be executed with Z3:
;   z3 case_155.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bank_notify_done Bool)
(declare-const bank_shareholding_approved Bool)
(declare-const bank_shareholding_change_percent Real)
(declare-const bank_shareholding_change_reported Bool)
(declare-const bank_shareholding_excess_no_voting_right_enforced Bool)
(declare-const bank_shareholding_family_percent Real)
(declare-const bank_shareholding_not_approved Bool)
(declare-const bank_shareholding_not_reported Bool)
(declare-const bank_shareholding_percent Real)
(declare-const bank_shareholding_reported_within_10_days Bool)
(declare-const bank_stock_registered Bool)
(declare-const bank_subsidiary_all_related_party_limit Real)
(declare-const bank_subsidiary_all_related_party_transaction_amount Real)
(declare-const bank_subsidiary_net_worth Real)
(declare-const bank_subsidiary_single_related_party_limit Real)
(declare-const bank_subsidiary_single_related_party_transaction_amount Real)
(declare-const fhc_applied Bool)
(declare-const fhc_board_approval_ratio Real)
(declare-const fhc_board_attendance_ratio Real)
(declare-const fhc_capital_not_filled_in_time Bool)
(declare-const fhc_confidentiality_breached Bool)
(declare-const fhc_dispose_within_deadline Bool)
(declare-const fhc_hold_approved Bool)
(declare-const fhc_hold_fhc_shares_violated Bool)
(declare-const fhc_hold_shares Real)
(declare-const fhc_increase_hold_violated Bool)
(declare-const fhc_internal_audit_established Bool)
(declare-const fhc_internal_control_established Bool)
(declare-const fhc_internal_control_executed Bool)
(declare-const fhc_issue_condition_violated Bool)
(declare-const fhc_merger_approved Bool)
(declare-const fhc_non_preferential_condition Bool)
(declare-const fhc_not_assist Bool)
(declare-const fhc_pledge_set Bool)
(declare-const fhc_ratio_or_disposal_violated Bool)
(declare-const fhc_report_or_announce_violated Bool)
(declare-const fhc_report_or_disclose_violated Bool)
(declare-const fhc_reported Bool)
(declare-const fhc_shareholding_approved Bool)
(declare-const fhc_shareholding_change_percent Real)
(declare-const fhc_shareholding_change_reported Bool)
(declare-const fhc_shareholding_excess_no_voting_right_enforced Bool)
(declare-const fhc_shareholding_not_approved Bool)
(declare-const fhc_shareholding_not_reported Bool)
(declare-const fhc_shareholding_percent Real)
(declare-const fhc_shareholding_pledge_to_subsidiary Bool)
(declare-const fhc_shareholding_reported Bool)
(declare-const fhc_shareholding_reported_within_10_days Bool)
(declare-const fhc_short_term_fund_violation Bool)
(declare-const fhc_unapproved_real_estate_investment Bool)
(declare-const fhc_violate_43_1_2_4 Bool)
(declare-const fhc_violate_43_3_regulations Bool)
(declare-const fhc_violate_45_1 Bool)
(declare-const fhc_violate_45_4_ratio Bool)
(declare-const fhc_violate_53_1_2 Bool)
(declare-const fhc_violate_55_1_order Bool)
(declare-const fhc_violate_56_2_order Bool)
(declare-const insurance_notify_done Bool)
(declare-const insurance_related_party_limit_set Bool)
(declare-const insurance_shareholding_approved Bool)
(declare-const insurance_shareholding_change_percent Real)
(declare-const insurance_shareholding_change_reported Bool)
(declare-const insurance_shareholding_excess_no_voting_right_enforced Bool)
(declare-const insurance_shareholding_family_percent Real)
(declare-const insurance_shareholding_not_approved Bool)
(declare-const insurance_shareholding_not_reported Bool)
(declare-const insurance_shareholding_percent Real)
(declare-const insurance_shareholding_reported_within_10_days Bool)
(declare-const non_credit_transaction_types Bool)
(declare-const notify_bank_if_1_percent_or_more Bool)
(declare-const notify_insurance_if_1_percent_or_more Bool)
(declare-const penalty Bool)
(declare-const related_party_loan_limit Real)
(declare-const related_party_non_preferential_approval Bool)
(declare-const shareholding_10_percent_reported Bool)
(declare-const shareholding_5_percent_change_reported Bool)
(declare-const shareholding_5_percent_change_reported_after_establishment Bool)
(declare-const shareholding_5_percent_reported Bool)
(declare-const shareholding_5_percent_reported_after_establishment Bool)
(declare-const shareholding_approval_obtained Bool)
(declare-const shareholding_approval_required Bool)
(declare-const shareholding_excess_no_voting_right Bool)
(declare-const shareholding_pledge_prohibited Bool)
(declare-const stock_registered Bool)
(declare-const transaction_agent_or_commission_service Bool)
(declare-const transaction_buy_real_estate_or_assets Bool)
(declare-const transaction_contract_payment_or_service Bool)
(declare-const transaction_invest_or_buy_securities Bool)
(declare-const transaction_related_third_party Bool)
(declare-const transaction_sell_securities_real_estate_assets Bool)
(declare-const violation_60_1 Bool)
(declare-const violation_60_10 Bool)
(declare-const violation_60_11 Bool)
(declare-const violation_60_12 Bool)
(declare-const violation_60_13 Bool)
(declare-const violation_60_14 Bool)
(declare-const violation_60_15 Bool)
(declare-const violation_60_16 Bool)
(declare-const violation_60_17 Bool)
(declare-const violation_60_18 Bool)
(declare-const violation_60_19 Bool)
(declare-const violation_60_2 Bool)
(declare-const violation_60_3 Bool)
(declare-const violation_60_4 Bool)
(declare-const violation_60_5 Bool)
(declare-const violation_60_6 Bool)
(declare-const violation_60_7 Bool)
(declare-const violation_60_8 Bool)
(declare-const violation_60_9 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:violation_60_1] 違反第六條第一項規定，未申請設立金融控股公司
(assert (not (= fhc_applied violation_60_1)))

; [fhc:violation_60_2] 違反第十六條第三項規定，未經主管機關核准而持有股份
(assert (= violation_60_2 (and (= fhc_hold_shares 1.0) (not fhc_hold_approved))))

; [fhc:violation_60_3] 違反第十六條第一項、第二項或第九項規定未向主管機關申報，或違反同條第七項但書規定增加持股
(assert (= violation_60_3 (or (not fhc_reported) fhc_increase_hold_violated)))

; [fhc:violation_60_4] 違反第十六條第十項規定，未依主管機關所定期限處分
(assert (not (= fhc_dispose_within_deadline violation_60_4)))

; [fhc:violation_60_5] 違反主管機關依第十六條第五項所定辦法中有關申報或公告之規定
(assert (= violation_60_5 fhc_report_or_announce_violated))

; [fhc:violation_60_6] 違反第十六條第六項規定，為質權之設定
(assert (= violation_60_6 fhc_pledge_set))

; [fhc:violation_60_7] 違反第十八條第一項規定，未經許可為合併、概括讓與或概括承受
(assert (not (= fhc_merger_approved violation_60_7)))

; [fhc:violation_60_8] 違反第三十八條規定，持有金融控股公司之股份
(assert (= violation_60_8 fhc_hold_fhc_shares_violated))

; [fhc:violation_60_9] 違反第三十九條第一項所定短期資金運用項目；或違反同條第二項規定，未經核准投資不動產或投資非自用不動產
(assert (= violation_60_9
   (or fhc_short_term_fund_violation fhc_unapproved_real_estate_investment)))

; [fhc:violation_60_10] 違反主管機關依第三十九條第三項所定辦法中有關發行條件或期限之規定
(assert (= violation_60_10 fhc_issue_condition_violated))

; [fhc:violation_60_11] 違反主管機關依第四十條或第四十一條所定之比率或所為之處置或限制
(assert (= violation_60_11 fhc_ratio_or_disposal_violated))

; [fhc:violation_60_12] 違反第四十二條第一項規定，未保守秘密
(assert (= violation_60_12 fhc_confidentiality_breached))

; [fhc:violation_60_13] 違反第四十三條第一項、第二項或第四項規定；或違反主管機關依同條第三項所定辦法中有關可從事之業務範圍、資訊交互運用、共用設備、場所或人員管理之規定
(assert (= violation_60_13 (or fhc_violate_43_1_2_4 fhc_violate_43_3_regulations)))

; [fhc:violation_60_14] 違反第四十五條第一項交易條件之限制或董事會之決議方法；或違反同條第四項所定之金額比率
(assert (= violation_60_14 (or fhc_violate_45_1 fhc_violate_45_4_ratio)))

; [fhc:violation_60_15] 違反第四十六條第一項規定，未向主管機關申報或揭露
(assert (= violation_60_15 fhc_report_or_disclose_violated))

; [fhc:violation_60_16] 違反第五十一條規定，未建立內部控制或稽核制度，或未確實執行
(assert (= violation_60_16
   (or (not fhc_internal_control_executed)
       (not fhc_internal_control_established)
       (not fhc_internal_audit_established))))

; [fhc:violation_60_17] 違反第五十三條第一項或第二項規定；或未於主管機關依同條第三項所定期限內補足資本
(assert (= violation_60_17 (or fhc_violate_53_1_2 fhc_capital_not_filled_in_time)))

; [fhc:violation_60_18] 違反主管機關依第五十五條第一項所為之命令
(assert (= violation_60_18 fhc_violate_55_1_order))

; [fhc:violation_60_19] 違反第五十六條第一項規定，未盡協助義務；或違反主管機關依同條第二項所為之命令
(assert (= violation_60_19 (or fhc_not_assist fhc_violate_56_2_order)))

; [fhc:related_party_non_preferential_approval] 金融控股公司與關係人授信以外交易條件不得優於其他同類對象，且須經董事會三分之二出席及四分之三決議
(assert (= related_party_non_preferential_approval
   (and fhc_non_preferential_condition
        (<= (/ 6666667.0 10000000.0) fhc_board_attendance_ratio)
        (<= (/ 3.0 4.0) fhc_board_approval_ratio))))

; [fhc:non_credit_transaction_types] 授信以外之交易類型
(assert (= non_credit_transaction_types
   (or transaction_sell_securities_real_estate_assets
       transaction_related_third_party
       transaction_invest_or_buy_securities
       transaction_contract_payment_or_service
       transaction_buy_real_estate_or_assets
       transaction_agent_or_commission_service)))

; [fhc:bank_subsidiary_single_related_party_limit] 銀行子公司與單一關係人交易金額不得超過淨值10%
(assert (= bank_subsidiary_single_related_party_limit
   (ite (<= (/ bank_subsidiary_single_related_party_transaction_amount
               bank_subsidiary_net_worth)
            (/ 1.0 10.0))
        1.0
        0.0)))

; [fhc:bank_subsidiary_all_related_party_limit] 銀行子公司與所有利害關係人交易總額不得超過淨值20%
(assert (= bank_subsidiary_all_related_party_limit
   (ite (<= (/ bank_subsidiary_all_related_party_transaction_amount
               bank_subsidiary_net_worth)
            (/ 1.0 5.0))
        1.0
        0.0)))

; [insurance:related_party_loan_limit] 主管機關對保險業就同一人、同一關係人或同一關係企業放款或其他交易限制
(assert (= related_party_loan_limit (ite insurance_related_party_limit_set 1.0 0.0)))

; [bank:stock_registered] 銀行股票應為記名式
(assert (= stock_registered bank_stock_registered))

; [bank:shareholding_5_percent_reported] 同一人或同一關係人持有銀行股份超過5%且已於10日內申報
(assert (= shareholding_5_percent_reported
   (or (<= bank_shareholding_percent 5.0)
       bank_shareholding_reported_within_10_days)))

; [bank:shareholding_5_percent_change_reported] 持股超過5%後累積增減逾1%者已申報
(assert (let ((a!1 (not (and (not (<= bank_shareholding_percent 5.0))
                     (not (<= bank_shareholding_change_percent 1.0))))))
  (= shareholding_5_percent_change_reported
     (or bank_shareholding_change_reported a!1))))

; [bank:shareholding_approval_required] 持股超過10%、25%、50%者應事先申請核准
(assert (= shareholding_approval_required
   (or (<= 10.0 bank_shareholding_percent)
       (<= 25.0 bank_shareholding_percent)
       (<= 50.0 bank_shareholding_percent))))

; [bank:shareholding_approval_obtained] 持股超過10%、25%、50%者已取得核准
(assert (let ((a!1 (or (not (or (<= 10.0 bank_shareholding_percent)
                        (<= 25.0 bank_shareholding_percent)
                        (<= 50.0 bank_shareholding_percent)))
               bank_shareholding_approved)))
  (= shareholding_approval_obtained a!1)))

; [bank:shareholding_excess_no_voting_right] 未依規定申報或核准持有銀行股份超過部分無表決權且須限期處分
(assert (= shareholding_excess_no_voting_right
   (and (or bank_shareholding_not_approved bank_shareholding_not_reported)
        bank_shareholding_excess_no_voting_right_enforced)))

; [bank:notify_bank_if_1_percent_or_more] 同一人或本人與配偶、未成年子女合計持有銀行股份1%以上應通知銀行
(assert (= notify_bank_if_1_percent_or_more
   (or bank_notify_done (not (<= 1.0 bank_shareholding_family_percent)))))

; [insurance:shareholding_5_percent_reported] 同一人或同一關係人持有保險公司股份超過5%且已於10日內申報
(assert (= shareholding_5_percent_reported
   (or (<= insurance_shareholding_percent 5.0)
       insurance_shareholding_reported_within_10_days)))

; [insurance:shareholding_5_percent_change_reported] 持股超過5%後累積增減逾1%者已申報
(assert (let ((a!1 (not (and (not (<= insurance_shareholding_percent 5.0))
                     (not (<= insurance_shareholding_change_percent 1.0))))))
  (= shareholding_5_percent_change_reported
     (or a!1 insurance_shareholding_change_reported))))

; [insurance:shareholding_approval_required] 持股超過10%、25%、50%者應事先申請核准
(assert (= shareholding_approval_required
   (or (<= 10.0 insurance_shareholding_percent)
       (<= 25.0 insurance_shareholding_percent)
       (<= 50.0 insurance_shareholding_percent))))

; [insurance:shareholding_approval_obtained] 持股超過10%、25%、50%者已取得核准
(assert (let ((a!1 (or insurance_shareholding_approved
               (not (or (<= 10.0 insurance_shareholding_percent)
                        (<= 25.0 insurance_shareholding_percent)
                        (<= 50.0 insurance_shareholding_percent))))))
  (= shareholding_approval_obtained a!1)))

; [insurance:shareholding_excess_no_voting_right] 未依規定申報或核准持有保險公司股份超過部分無表決權且須限期處分
(assert (= shareholding_excess_no_voting_right
   (and (or insurance_shareholding_not_reported
            insurance_shareholding_not_approved)
        insurance_shareholding_excess_no_voting_right_enforced)))

; [insurance:notify_insurance_if_1_percent_or_more] 同一人或本人與配偶、未成年子女合計持有保險公司股份1%以上應通知保險公司
(assert (= notify_insurance_if_1_percent_or_more
   (or (not (<= 1.0 insurance_shareholding_family_percent))
       insurance_notify_done)))

; [fhc:shareholding_10_percent_reported] 金融控股公司轉換時，同一人或同一關係人持有股份超過10%應申報
(assert (= shareholding_10_percent_reported
   (or (<= fhc_shareholding_percent 10.0) fhc_shareholding_reported)))

; [fhc:shareholding_5_percent_reported_after_establishment] 金融控股公司設立後，同一人或同一關係人持有股份超過5%且已於10日內申報
(assert (= shareholding_5_percent_reported_after_establishment
   (or (<= fhc_shareholding_percent 5.0)
       fhc_shareholding_reported_within_10_days)))

; [fhc:shareholding_5_percent_change_reported_after_establishment] 持股超過5%後累積增減逾1%者已申報
(assert (let ((a!1 (not (and (not (<= fhc_shareholding_percent 5.0))
                     (not (<= fhc_shareholding_change_percent 1.0))))))
  (= shareholding_5_percent_change_reported_after_establishment
     (or fhc_shareholding_change_reported a!1))))

; [fhc:shareholding_approval_required] 持股超過10%、25%、50%者應事先申請核准
(assert (= shareholding_approval_required
   (or (<= 10.0 fhc_shareholding_percent)
       (<= 25.0 fhc_shareholding_percent)
       (<= 50.0 fhc_shareholding_percent))))

; [fhc:shareholding_approval_obtained] 持股超過10%、25%、50%者已取得核准
(assert (let ((a!1 (or (not (or (<= 10.0 fhc_shareholding_percent)
                        (<= 25.0 fhc_shareholding_percent)
                        (<= 50.0 fhc_shareholding_percent)))
               fhc_shareholding_approved)))
  (= shareholding_approval_obtained a!1)))

; [fhc:shareholding_excess_no_voting_right] 未依規定申報或核准持有金融控股公司股份超過部分無表決權且須限期處分
(assert (= shareholding_excess_no_voting_right
   (and (or fhc_shareholding_not_reported fhc_shareholding_not_approved)
        fhc_shareholding_excess_no_voting_right_enforced)))

; [fhc:shareholding_pledge_prohibited] 持有金融控股公司股份超過10%不得設定質權予子公司，例外於轉換前原質權存續期限內不適用
(assert (= shareholding_pledge_prohibited
   (or (<= fhc_shareholding_percent 10.0)
       (not fhc_shareholding_pledge_to_subsidiary))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法第60條任一規定時處罰
(assert (= penalty
   (or violation_60_5
       violation_60_19
       violation_60_4
       violation_60_9
       violation_60_18
       violation_60_17
       violation_60_16
       violation_60_15
       violation_60_14
       violation_60_13
       violation_60_12
       violation_60_11
       violation_60_10
       violation_60_3
       violation_60_1
       violation_60_2
       violation_60_7
       violation_60_8
       violation_60_6)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fhc_violate_45_1 true))
(assert (= fhc_non_preferential_condition false))
(assert (= fhc_board_attendance_ratio (/ 1.0 2.0)))
(assert (= fhc_board_approval_ratio (/ 3.0 5.0)))
(assert (= transaction_sell_securities_real_estate_assets true))
(assert (= non_credit_transaction_types true))
(assert (= violation_60_14 true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 46
; Total variables: 109
; Total facts: 8
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
