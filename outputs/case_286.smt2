; SMT2 file generated from compliance case automatic
; Case ID: case_286
; Generated at: 2025-10-21T06:24:24.350174
;
; This file can be executed with Z3:
;   z3 case_286.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authority_action_taken Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_3_measures_executed_flag Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_4_measures_executed_flag Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const order_capital_increase Bool)
(declare-const order_close_branch_or_department Bool)
(declare-const order_dispose_subsidiary_shares Bool)
(declare-const order_prohibit_asset_disposal Bool)
(declare-const order_provision_reserve Bool)
(declare-const order_provision_reserve_or_capital_increase Bool)
(declare-const order_remove_manager_staff Bool)
(declare-const order_stop_insurance_products Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalties_applicable Bool)
(declare-const penalty_types Bool)
(declare-const penalty Bool)
(declare-const remove_director_supervisor Bool)
(declare-const restrict_business_or_fund_usage Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_all_or_partial_business_license Bool)
(declare-const revoke_license Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const suspend_partial_business Bool)
(declare-const suspend_subsidiary_business Bool)
(declare-const violation_flag Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:violation_occurred] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [bank:penalties_applicable] 銀行主管機關可視情節輕重採取處分
(assert (= penalties_applicable (and violation_occurred authority_action_taken)))

; [bank:penalty_types] 銀行可採取之處分類型
(assert (let ((a!1 (ite order_remove_manager_staff
                6
                (ite remove_director_supervisor
                     7
                     (ite order_provision_reserve
                          8
                          (ite other_necessary_measures 9 0))))))
(let ((a!2 (ite suspend_partial_business
                2
                (ite restrict_investment
                     3
                     (ite order_prohibit_asset_disposal
                          4
                          (ite order_close_branch_or_department 5 a!1))))))
  (= (ite penalty_types 1 0) (ite revoke_statutory_meeting_resolution 1 a!2)))))

; [bill_finance:violation_occurred] 票券金融公司違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [bill_finance:penalties_applicable] 票券金融公司主管機關可視情節輕重採取處分
(assert (= penalties_applicable (and violation_occurred authority_action_taken)))

; [financial_holdings:violation_occurred] 金融控股公司違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [financial_holdings:penalties_applicable] 金融控股公司主管機關可視情節輕重採取處分
(assert (= penalties_applicable (and violation_occurred authority_action_taken)))

; [financial_holdings:penalty_types] 金融控股公司可採取之處分類型
(assert (let ((a!1 (ite remove_director_supervisor
                4
                (ite order_dispose_subsidiary_shares
                     5
                     (ite revoke_license 6 (ite other_necessary_measures 7 0))))))
  (= (ite penalty_types 1 0)
     (ite revoke_statutory_meeting_resolution
          1
          (ite suspend_subsidiary_business
               2
               (ite order_remove_manager_staff 3 a!1))))))

; [electronic_payment:violation_occurred] 專營電子支付機構違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [electronic_payment:penalties_applicable] 專營電子支付機構主管機關可視情節輕重採取處分
(assert (= penalties_applicable (and violation_occurred authority_action_taken)))

; [electronic_payment:penalty_types] 專營電子支付機構可採取之處分類型
(assert (let ((a!1 (ite order_remove_manager_staff
                3
                (ite remove_director_supervisor
                     4
                     (ite order_provision_reserve_or_capital_increase
                          5
                          (ite other_necessary_measures 6 0))))))
  (= (ite penalty_types 1 0)
     (ite revoke_statutory_meeting_resolution
          1
          (ite revoke_all_or_partial_business_license 2 a!1)))))

; [insurance:violation_occurred] 保險業違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [insurance:penalties_applicable] 保險業主管機關可視情況採取處分
(assert (= penalties_applicable (and violation_occurred authority_action_taken)))

; [insurance:penalty_types] 保險業可採取之處分類型
(assert (let ((a!1 (ite order_remove_manager_staff
                4
                (ite revoke_statutory_meeting_resolution
                     5
                     (ite remove_director_supervisor
                          6
                          (ite other_necessary_measures 7 0))))))
  (= (ite penalty_types 1 0)
     (ite restrict_business_or_fund_usage
          1
          (ite order_stop_insurance_products
               2
               (ite order_capital_increase 3 a!1))))))

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級(4)措施已執行
(assert (= capital_level_4_measures_executed capital_level_4_measures_executed_flag))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級(3)措施已執行
(assert (= capital_level_3_measures_executed capital_level_3_measures_executed_flag))

; [insurance:capital_level_2_measures_executed] 資本不足等級(2)措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行、票券金融、金融控股、電子支付、保險業相關規定時處罰
(assert (= penalty
   (or (and (= 4 capital_level) (not capital_level_4_measures_executed))
       (and (= 3 capital_level) (not capital_level_3_measures_executed))
       (and (= 2 capital_level) (not capital_level_2_measures_executed))
       (and violation_occurred (not authority_action_taken)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation_occurred true))
(assert (= authority_action_taken true))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 1000000.0))
(assert (= net_worth_ratio 5.0))
(assert (= capital_level_2_measures_executed false))
(assert (= capital_level_3_measures_executed_flag false))
(assert (= capital_level_4_measures_executed_flag false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= revoke_statutory_meeting_resolution false))
(assert (= suspend_partial_business false))
(assert (= restrict_investment false))
(assert (= order_prohibit_asset_disposal false))
(assert (= order_close_branch_or_department false))
(assert (= order_remove_manager_staff false))
(assert (= remove_director_supervisor true))
(assert (= order_provision_reserve false))
(assert (= other_necessary_measures false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 34
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
