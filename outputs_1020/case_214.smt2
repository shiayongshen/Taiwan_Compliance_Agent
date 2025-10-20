; SMT2 file generated from compliance case automatic
; Case ID: case_214
; Generated at: 2025-10-19T10:39:12.508872
;
; This file can be executed with Z3:
;   z3 case_214.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approval_10_percent_granted Bool)
(declare-const approval_25_percent_granted Bool)
(declare-const approval_50_percent_granted Bool)
(declare-const approval_pre_2008_granted Bool)
(declare-const change_declaration_submitted Bool)
(declare-const date Int)
(declare-const declaration_submitted_10_days Bool)
(declare-const declaration_submitted_6_months Bool)
(declare-const disposal_order_issued Bool)
(declare-const excess_shares_disposal_ordered Bool)
(declare-const excess_shares_no_voting_right Bool)
(declare-const exclude_collateral_shares Bool)
(declare-const exclude_inheritance_shares Bool)
(declare-const exclude_underwriting_shares Bool)
(declare-const first_increase_request Bool)
(declare-const notification_to_bank Bool)
(declare-const penalty Bool)
(declare-const shareholding_approval_10_percent Bool)
(declare-const shareholding_approval_25_percent Bool)
(declare-const shareholding_approval_50_percent Bool)
(declare-const shareholding_change_declaration Bool)
(declare-const shareholding_change_percent Real)
(declare-const shareholding_declaration_1_percent Bool)
(declare-const shareholding_declaration_5_percent Bool)
(declare-const shareholding_excess_penalty Bool)
(declare-const shareholding_exclusion_conditions Bool)
(declare-const shareholding_pre_2008_approval Bool)
(declare-const shareholding_pre_2008_declaration Bool)
(declare-const shareholding_ratio_10_percent Real)
(declare-const shareholding_ratio_1_percent_family Real)
(declare-const shareholding_ratio_25_percent Real)
(declare-const shareholding_ratio_50_percent Real)
(declare-const shareholding_ratio_5_percent Real)
(declare-const shareholding_ratio_pre_2008 Real)
(declare-const stock_is_registered Bool)
(declare-const stock_must_be_registered Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:shareholding_declaration_5_percent] 同一人或同一關係人持有股份超過5%應於10日內申報
(assert (= shareholding_declaration_5_percent
   (or (<= shareholding_ratio_5_percent 5.0) declaration_submitted_10_days)))

; [bank:shareholding_declaration_1_percent] 同一人或本人與配偶、未成年子女合計持股超過1%應通知銀行
(assert (= shareholding_declaration_1_percent
   (or (not (<= 1.0 shareholding_ratio_1_percent_family)) notification_to_bank)))

; [bank:shareholding_change_declaration] 持股超過5%後累積增減逾1%應申報
(assert (let ((a!1 (or change_declaration_submitted
               (<= (ite (>= shareholding_change_percent 0.0)
                        shareholding_change_percent
                        (* (- 1.0) shareholding_change_percent))
                   1.0))))
  (= shareholding_change_declaration a!1)))

; [bank:shareholding_approval_10_percent] 持股超過10%應事先申請核准
(assert (= shareholding_approval_10_percent
   (or approval_10_percent_granted (<= shareholding_ratio_10_percent 10.0))))

; [bank:shareholding_approval_25_percent] 持股超過25%應事先申請核准
(assert (= shareholding_approval_25_percent
   (or approval_25_percent_granted (<= shareholding_ratio_25_percent 25.0))))

; [bank:shareholding_approval_50_percent] 持股超過50%應事先申請核准
(assert (= shareholding_approval_50_percent
   (or approval_50_percent_granted (<= shareholding_ratio_50_percent 50.0))))

; [bank:shareholding_pre_2008_declaration] 修正施行前持股超過5%未超過15%者，應於6個月內申報
(assert (let ((a!1 (not (and (not (<= shareholding_ratio_pre_2008 5.0))
                     (>= 15.0 shareholding_ratio_pre_2008)
                     (>= 20081209 date)))))
  (= shareholding_pre_2008_declaration (or declaration_submitted_6_months a!1))))

; [bank:shareholding_pre_2008_approval] 修正施行前持股超過10%第一次擬增加持股應事先申請核准
(assert (let ((a!1 (not (and (not (<= shareholding_ratio_pre_2008 10.0))
                     first_increase_request))))
  (= shareholding_pre_2008_approval (or approval_pre_2008_granted a!1))))

; [bank:shareholding_exclusion_conditions] 計算持股時排除證券商承銷期間股份、金融機構承受擔保品未滿4年股份、繼承或遺贈未滿2年股份
(assert (= shareholding_exclusion_conditions
   (and exclude_underwriting_shares
        exclude_collateral_shares
        exclude_inheritance_shares)))

; [bank:shareholding_excess_penalty] 未依規定申報或核准持有股份超過部分無表決權且須限期處分
(assert (let ((a!1 (or excess_shares_no_voting_right
               (not (or (not shareholding_pre_2008_declaration)
                        (not shareholding_approval_10_percent)
                        (not shareholding_approval_25_percent)
                        (not shareholding_declaration_5_percent))))))
  (= shareholding_excess_penalty a!1)))

; [bank:shareholding_excess_disposal_order] 主管機關命限期處分超過部分股份
(assert (= excess_shares_disposal_ordered
   (or disposal_order_issued (not excess_shares_no_voting_right))))

; [bank:stock_must_be_registered] 銀行股票應為記名式
(assert (= stock_must_be_registered stock_is_registered))

; [bank:penalty_default_false] 預設不處罰
(assert (not penalty))

; [bank:penalty_conditions] 處罰條件：違反持股申報、核准或記名股票規定時處罰
(assert (= penalty
   (or (not shareholding_pre_2008_approval)
       (not shareholding_pre_2008_declaration)
       (not shareholding_approval_50_percent)
       (not shareholding_change_declaration)
       (not stock_must_be_registered)
       (not shareholding_approval_25_percent)
       (not shareholding_declaration_5_percent)
       (not shareholding_approval_10_percent))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= shareholding_ratio_5_percent (/ 453.0 50.0)))
(assert (= shareholding_change_percent (/ 101.0 100.0)))
(assert (= declaration_submitted_10_days false))
(assert (= change_declaration_submitted false))
(assert (= shareholding_declaration_5_percent false))
(assert (= shareholding_change_declaration false))
(assert (= shareholding_approval_10_percent true))
(assert (= approval_10_percent_granted true))
(assert (= shareholding_approval_25_percent true))
(assert (= approval_25_percent_granted true))
(assert (= shareholding_approval_50_percent false))
(assert (= approval_50_percent_granted false))
(assert (= shareholding_pre_2008_declaration true))
(assert (= declaration_submitted_6_months true))
(assert (= shareholding_pre_2008_approval true))
(assert (= approval_pre_2008_granted true))
(assert (= excess_shares_no_voting_right true))
(assert (= disposal_order_issued true))
(assert (= excess_shares_disposal_ordered true))
(assert (= stock_is_registered true))
(assert (= stock_must_be_registered true))
(assert (= notification_to_bank false))
(assert (= shareholding_declaration_1_percent false))
(assert (= shareholding_ratio_1_percent_family 0.0))
(assert (= date 20170816))
(assert (= exclude_underwriting_shares true))
(assert (= exclude_collateral_shares true))
(assert (= exclude_inheritance_shares true))
(assert (= first_increase_request false))
(assert (= penalty true))
(assert (= shareholding_excess_penalty false))
(assert (= shareholding_exclusion_conditions false))
(assert (= shareholding_ratio_10_percent 0.0))
(assert (= shareholding_ratio_25_percent 0.0))
(assert (= shareholding_ratio_50_percent 0.0))
(assert (= shareholding_ratio_pre_2008 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 36
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
