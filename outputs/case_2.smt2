; SMT2 file generated from compliance case automatic
; Case ID: case_2
; Generated at: 2025-10-20T22:43:59.132768
;
; This file can be executed with Z3:
;   z3 case_2.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accumulated_loss Real)
(declare-const accumulated_loss_exceeds_limit Bool)
(declare-const authority_imposes_sanctions Bool)
(declare-const authority_minimum_capital_adequacy_ratio Real)
(declare-const authority_notifies_economic_ministry Bool)
(declare-const authority_order_issued Bool)
(declare-const authority_orders_capital_replenishment Bool)
(declare-const authority_orders_fhc_to_assist_or_dispose Bool)
(declare-const board_meeting_held Bool)
(declare-const board_meeting_held_and_reported Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_funding Real)
(declare-const capital_increase_occurred Bool)
(declare-const capital_level Int)
(declare-const capital_replenishment_approved Bool)
(declare-const capital_replenishment_approved_and_executed Bool)
(declare-const capital_replenishment_executed Bool)
(declare-const dissolution_and_liquidation_ordered Bool)
(declare-const fhc_assists_subsidiary_recovery Bool)
(declare-const funding_raised_within_share_ratio Real)
(declare-const license_revoked_disposal_and_dissolution Bool)
(declare-const net_worth_ratio Real)
(declare-const own_capital Real)
(declare-const owner_equity Real)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const report_to_authority_submitted Bool)
(declare-const risk_capital Real)
(declare-const sanction_dispose_subsidiary_shares Bool)
(declare-const sanction_other_measures Bool)
(declare-const sanction_remove_director_or_supervisor Bool)
(declare-const sanction_remove_manager_or_staff Bool)
(declare-const sanction_revoke_license Bool)
(declare-const sanction_revoke_meeting_resolution Bool)
(declare-const sanction_suspend_subsidiary_business Bool)
(declare-const shares_disposed_within_deadline Bool)
(declare-const subsidiary_capital_adequacy_below_minimum Bool)
(declare-const subsidiary_capital_adequacy_ratio Real)
(declare-const subsidiary_financial_condition_bad Bool)
(declare-const subsidiary_financial_condition_deteriorated Bool)
(declare-const supervisors_notified Bool)
(declare-const total_assets_excluding_investment_type Real)
(declare-const violation_flag Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:capital_increase_funding] 金融控股公司應於持股比例範圍內為子公司增資籌募資金
(assert (= capital_increase_funding
   (ite (or (not capital_increase_occurred)
            (= funding_raised_within_share_ratio 1.0))
        1.0
        0.0)))

; [fhc:accumulated_loss_exceeds_limit] 金融控股公司累積虧損逾實收資本額三分之一
(assert (not (= (<= (/ accumulated_loss paid_in_capital) (/ 3333333333.0 10000000000.0))
        accumulated_loss_exceeds_limit)))

; [fhc:board_meeting_held_and_reported] 累積虧損逾三分之一時召開董事會並通知監察人列席，並函報主管機關
(assert (= board_meeting_held_and_reported
   (and accumulated_loss_exceeds_limit
        board_meeting_held
        supervisors_notified
        report_to_authority_submitted)))

; [fhc:authority_orders_capital_replenishment] 主管機關限期令金融控股公司補足資本
(assert (= authority_orders_capital_replenishment accumulated_loss_exceeds_limit))

; [fhc:capital_replenishment_approved_and_executed] 金融控股公司報經主管機關核准以累積虧損減資並辦理現金增資
(assert (= capital_replenishment_approved_and_executed
   (and capital_replenishment_approved capital_replenishment_executed)))

; [fhc:violation_occurred] 金融控股公司違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [fhc:authority_imposes_sanctions] 主管機關依違反情節輕重，對金融控股公司採取處分
(assert (= authority_imposes_sanctions
   (or sanction_dispose_subsidiary_shares
       sanction_revoke_meeting_resolution
       sanction_other_measures
       sanction_remove_manager_or_staff
       sanction_remove_director_or_supervisor
       sanction_revoke_license
       sanction_suspend_subsidiary_business)))

; [fhc:authority_notifies_economic_ministry] 主管機關通知經濟部廢止董事或監察人登記
(assert (= authority_notifies_economic_ministry sanction_remove_director_or_supervisor))

; [fhc:license_revoked_disposal_and_dissolution] 廢止許可後未於期限內處分股份者，須解散清算
(assert (= license_revoked_disposal_and_dissolution
   (and sanction_revoke_license
        (not shares_disposed_within_deadline)
        dissolution_and_liquidation_ordered)))

; [fhc:subsidiary_capital_adequacy_below_minimum] 銀行、保險或證券子公司資本適足性比率未達主管機關規定最低標準
(assert (not (= (<= authority_minimum_capital_adequacy_ratio
            subsidiary_capital_adequacy_ratio)
        subsidiary_capital_adequacy_below_minimum)))

; [fhc:subsidiary_financial_condition_deteriorated] 銀行、保險或證券子公司業務或財務狀況顯著惡化，不能支付債務或有損及存款人利益之虞
(assert (= subsidiary_financial_condition_deteriorated
   subsidiary_financial_condition_bad))

; [fhc:fhc_assists_subsidiary_recovery] 金融控股公司協助子公司回復正常營運
(assert (= fhc_assists_subsidiary_recovery
   (or subsidiary_capital_adequacy_below_minimum
       subsidiary_financial_condition_deteriorated)))

; [fhc:authority_orders_fhc_to_assist_or_dispose] 主管機關命金融控股公司履行協助義務或處分其他投資事業股份、營業或資產
(assert (= authority_orders_fhc_to_assist_or_dispose
   (and (or subsidiary_capital_adequacy_below_minimum
            subsidiary_financial_condition_deteriorated)
        authority_order_issued)))

; [insurance:capital_adequacy_ratio] 保險業資本適足率計算
(assert (= capital_adequacy_ratio (* 100.0 (/ own_capital risk_capital))))

; [insurance:net_worth_ratio] 保險業淨值比率計算
(assert (= net_worth_ratio
   (* 100.0 (/ owner_equity total_assets_excluding_investment_type))))

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足, 0=未分類）
(assert (let ((a!1 (ite (or (not (<= 200.0 capital_adequacy_ratio))
                    (<= 150.0 capital_adequacy_ratio))
                2
                (ite (and (<= 200.0 capital_adequacy_ratio)
                          (<= 3.0 net_worth_ratio))
                     1
                     0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 owner_equity)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_corrected] 保險業資本等級分類修正（符合二等級以較低等級為準）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (and (<= 200.0 capital_adequacy_ratio)
                          (<= 3.0 net_worth_ratio))
                     1
                     0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 owner_equity))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：金融控股公司違反法令、章程或有礙健全經營之虞時處罰
(assert (= penalty (or violation_occurred license_revoked_disposal_and_dissolution)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= own_capital 169000000000))
(assert (= risk_capital 100000000000))
(assert (= capital_adequacy_ratio 169.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= subsidiary_capital_adequacy_ratio 169.0))
(assert (= authority_minimum_capital_adequacy_ratio 180.0))
(assert (= subsidiary_capital_adequacy_below_minimum true))
(assert (= subsidiary_financial_condition_bad true))
(assert (= subsidiary_financial_condition_deteriorated true))
(assert (= fhc_assists_subsidiary_recovery true))
(assert (= authority_order_issued true))
(assert (= authority_orders_fhc_to_assist_or_dispose true))
(assert (= capital_increase_occurred false))
(assert (= funding_raised_within_share_ratio 0.0))
(assert (= violation_flag true))
(assert (= violation_occurred true))
(assert (= authority_imposes_sanctions true))
(assert (= sanction_other_measures true))
(assert (= board_meeting_held false))
(assert (= supervisors_notified false))
(assert (= report_to_authority_submitted false))
(assert (= accumulated_loss 0.0))
(assert (= accumulated_loss_exceeds_limit false))
(assert (= capital_replenishment_approved false))
(assert (= capital_replenishment_executed false))
(assert (= capital_replenishment_approved_and_executed false))
(assert (= authority_orders_capital_replenishment false))
(assert (= penalty true))
(assert (= capital_level 3))
(assert (= owner_equity 1500000000))
(assert (= total_assets_excluding_investment_type 100000000000))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 44
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
