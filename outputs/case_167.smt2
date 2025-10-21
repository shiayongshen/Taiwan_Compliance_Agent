; SMT2 file generated from compliance case automatic
; Case ID: case_167
; Generated at: 2025-10-21T03:44:04.340730
;
; This file can be executed with Z3:
;   z3 case_167.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_cultural_or_public_use Bool)
(declare-const authority_regulations_issued Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const business_guidance_assigned Bool)
(declare-const business_guidance_necessary Bool)
(declare-const director_supervisor_removal_notification Bool)
(declare-const main_part_self_use Bool)
(declare-const net_worth Real)
(declare-const net_worth_at_investment Real)
(declare-const non_self_use_real_estate_investment Real)
(declare-const non_self_use_real_estate_investment_limit Real)
(declare-const non_self_use_real_estate_investment_prohibition Bool)
(declare-const non_self_use_real_estate_investment_total Real)
(declare-const notify_registration_authority Bool)
(declare-const on_site_reconstruction Bool)
(declare-const order_branch_closure Bool)
(declare-const order_director_or_supervisor_removal Bool)
(declare-const order_manager_or_staff_suspension Bool)
(declare-const order_or_prohibit_asset_disposition Bool)
(declare-const order_provision_of_reserve Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const real_estate_transaction_approval Bool)
(declare-const regulations_defined_by_authority Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const self_use_real_estate_investment Real)
(declare-const self_use_real_estate_investment_limit Real)
(declare-const short_term_prepurchase Bool)
(declare-const suspend_partial_business Bool)
(declare-const total_deposit_balance Real)
(declare-const transaction_with_related_party Bool)
(declare-const violate_central_bank_loan_regulations Bool)
(declare-const violate_credit_investment_deposit_bond_regulations Bool)
(declare-const violate_fund_usage_regulations_109 Bool)
(declare-const violate_fund_usage_regulations_111 Bool)
(declare-const violate_investment_regulations_74 Bool)
(declare-const violate_investment_regulations_75 Bool)
(declare-const violate_loan_regulations Bool)
(declare-const violate_other_regulations_76_etc Bool)
(declare-const violation_flag Bool)
(declare-const violation_of_law_or_regulation Bool)
(declare-const violation_penalty Bool)
(declare-const warehouse_investment Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_of_law_or_regulation] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation_of_law_or_regulation violation_flag))

; [bank:penalty_measures] 主管機關可依情節輕重採取處分措施
(assert (= penalty_measures
   (or order_provision_of_reserve
       other_necessary_measures
       suspend_partial_business
       order_or_prohibit_asset_disposition
       revoke_statutory_meeting_resolution
       order_manager_or_staff_suspension
       order_branch_closure
       restrict_investment
       order_director_or_supervisor_removal)))

; [bank:director_supervisor_removal_notification] 解除董事、監察人職務時通知公司登記主管機關撤銷或廢止其登記
(assert (= director_supervisor_removal_notification
   (or (not order_director_or_supervisor_removal) notify_registration_authority)))

; [bank:business_guidance_necessity] 為改善營運缺失有業務輔導必要時，主管機關得指定機構辦理
(assert (= business_guidance_necessary business_guidance_assigned))

; [bank:self_use_real_estate_investment_limit] 自用不動產投資不得超過投資時淨值，營業用倉庫投資不得超過存款總餘額5%
(assert (let ((a!1 (ite (and (<= self_use_real_estate_investment
                         net_worth_at_investment)
                     (<= warehouse_investment (* 5.0 total_deposit_balance)))
                1.0
                0.0)))
  (= self_use_real_estate_investment_limit a!1)))

; [bank:non_self_use_real_estate_investment_prohibition] 商業銀行不得投資非自用不動產，除特定例外
(assert (= non_self_use_real_estate_investment_prohibition
   (or short_term_prepurchase
       on_site_reconstruction
       approved_cultural_or_public_use
       main_part_self_use
       (= 0.0 non_self_use_real_estate_investment))))

; [bank:non_self_use_real_estate_investment_limit] 非自用不動產投資總額不得超過銀行淨值20%，且與自用不動產合計不得超過投資時淨值
(assert (let ((a!1 (ite (and (<= non_self_use_real_estate_investment_total
                         (* 20.0 net_worth))
                     (<= (+ non_self_use_real_estate_investment_total
                            self_use_real_estate_investment)
                         net_worth_at_investment))
                1.0
                0.0)))
  (= non_self_use_real_estate_investment_limit a!1)))

; [bank:real_estate_transaction_approval] 與持有實收資本3%以上企業、負責人、職員、主要股東或利害關係人交易須董事會三分之二出席及四分之三同意
(assert (= real_estate_transaction_approval
   (or (not transaction_with_related_party)
       (and (<= (/ 6667.0 100.0) board_attendance_ratio)
            (<= 75.0 board_approval_ratio)))))

; [bank:regulations_defined_by_authority] 主管機關定自用不動產、非自用不動產範圍及核准程序等相關辦法
(assert (= regulations_defined_by_authority authority_regulations_issued))

; [bank:violation_penalty] 違反特定條款者處新臺幣一百萬元以上二千萬元以下罰鍰
(assert (= violation_penalty
   (or violate_fund_usage_regulations_109
       violate_credit_investment_deposit_bond_regulations
       violate_central_bank_loan_regulations
       violate_investment_regulations_75
       violate_other_regulations_76_etc
       violate_investment_regulations_74
       violate_fund_usage_regulations_111
       violate_loan_regulations)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行法第130條規定之任一條款時處罰
(assert (= penalty violation_penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= non_self_use_real_estate_investment_total 4440194000))
(assert (= net_worth 14100000000))
(assert (= self_use_real_estate_investment 0))
(assert (= net_worth_at_investment 14100000000))
(assert (= violation_flag true))
(assert (= violate_investment_regulations_75 true))
(assert (= penalty true))
(assert (= penalty_measures false))
(assert (= transaction_with_related_party true))
(assert (= board_attendance_ratio 0))
(assert (= board_approval_ratio 0))
(assert (= authority_regulations_issued true))
(assert (= approved_cultural_or_public_use false))
(assert (= main_part_self_use false))
(assert (= short_term_prepurchase false))
(assert (= on_site_reconstruction false))
(assert (= restrict_investment false))
(assert (= revoke_statutory_meeting_resolution false))
(assert (= suspend_partial_business false))
(assert (= order_or_prohibit_asset_disposition false))
(assert (= order_branch_closure false))
(assert (= order_manager_or_staff_suspension false))
(assert (= order_director_or_supervisor_removal false))
(assert (= notify_registration_authority false))
(assert (= other_necessary_measures false))
(assert (= business_guidance_assigned false))
(assert (= business_guidance_necessary false))
(assert (= warehouse_investment 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 46
; Total facts: 28
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
