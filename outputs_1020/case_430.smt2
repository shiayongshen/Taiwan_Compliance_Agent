; SMT2 file generated from compliance case automatic
; Case ID: case_430
; Generated at: 2025-10-19T15:46:13.275055
;
; This file can be executed with Z3:
;   z3 case_430.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const acting_as_director Bool)
(declare-const acting_as_supervisor Bool)
(declare-const acting_as_trust_supervisor Bool)
(declare-const appointing_manager Bool)
(declare-const bond_investment_ratio_of_owner_equity Real)
(declare-const bond_investment_ratio_per_company Real)
(declare-const bond_investment_ratio_total Real)
(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficient Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const exercising_voting_rights Bool)
(declare-const financial_bonds_investment_ratio Real)
(declare-const financial_or_business_deterioration Bool)
(declare-const fund_investment_ratio_per_fund Real)
(declare-const fund_investment_ratio_total Real)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const investment_limit_bond_per_company Real)
(declare-const investment_limit_financial_bonds Real)
(declare-const investment_limit_fund_total Real)
(declare-const investment_limit_public_debt Real)
(declare-const investment_limit_securitized_and_others Real)
(declare-const investment_limit_stock_and_bond_combined Real)
(declare-const investment_limit_stock_per_company Real)
(declare-const investment_prohibited_roles Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const participating_in_management_agreement Bool)
(declare-const penalty Bool)
(declare-const plan_completed_within_deadline Bool)
(declare-const prohibited_actions_without_supervisor_consent Bool)
(declare-const public_debt_investment_ok Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const securitized_and_others_investment_ratio Real)
(declare-const stock_investment_ratio_of_issued_shares Real)
(declare-const stock_investment_ratio_per_company Real)
(declare-const stock_investment_ratio_total Real)
(declare-const supervisor_consent_contract_commitment Bool)
(declare-const supervisor_consent_other_major_financial_matters Bool)
(declare-const supervisor_consent_payment_exceed_limit Bool)
(declare-const supervisory_action_executed Bool)
(declare-const supervisory_action_required Bool)
(declare-const supervisory_action_taken Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級嚴重不足判定
(assert (= capital_level_severe_insufficient
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_level_significant_deterioration] 資本等級顯著惡化判定
(assert (= capital_level_significant_deterioration
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級不足判定
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級適足判定
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著惡化, 4=嚴重不足, 0=未分類）
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

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_level_4_measures_executed level_4_measures_executed))

; [insurance:capital_level_3_measures_executed] 資本顯著惡化等級措施已執行
(assert (= capital_level_3_measures_executed level_3_measures_executed))

; [insurance:capital_level_2_measures_executed] 資本不足等級措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限內完成
(assert (= improvement_plan_completed plan_completed_within_deadline))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or cannot_fulfill_contract cannot_pay_debt risk_to_insured_rights)))

; [insurance:supervisory_action_required] 應由主管機關為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_action_required
   (or (and capital_level_severe_insufficient (not improvement_plan_completed))
       (and (not capital_level_severe_insufficient)
            financial_or_business_deterioration))))

; [insurance:supervisory_action_taken] 主管機關已為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_action_taken supervisory_action_executed))

; [insurance:prohibited_actions_without_supervisor_consent] 監管處分期間未經監管人同意禁止之行為
(assert (= prohibited_actions_without_supervisor_consent
   (and (not supervisor_consent_payment_exceed_limit)
        (not supervisor_consent_contract_commitment)
        (not supervisor_consent_other_major_financial_matters))))

; [insurance:internal_control_and_audit_ok] 已建立且執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 已建立且執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:investment_limit_public_debt] 公債、國庫券投資限額符合規定
(assert (= investment_limit_public_debt (ite public_debt_investment_ok 1.0 0.0)))

; [insurance:investment_limit_financial_bonds] 金融債券等投資總額不超過資金35%
(assert (= investment_limit_financial_bonds
   (ite (>= 35.0 financial_bonds_investment_ratio) 1.0 0.0)))

; [insurance:investment_limit_stock_per_company] 每一公司股票投資不超過資金5%且不超過該公司已發行股份10%
(assert (= investment_limit_stock_per_company
   (ite (and (>= 5.0 stock_investment_ratio_per_company)
             (>= 10.0 stock_investment_ratio_of_issued_shares))
        1.0
        0.0)))

; [insurance:investment_limit_bond_per_company] 每一公司公司債及免保證商業本票投資不超過資金5%且不超過公司業主權益10%
(assert (= investment_limit_bond_per_company
   (ite (and (>= 5.0 bond_investment_ratio_per_company)
             (>= 10.0 bond_investment_ratio_of_owner_equity))
        1.0
        0.0)))

; [insurance:investment_limit_fund_total] 證券投資信託基金及共同信託基金投資總額不超過資金10%且每一基金受益憑證不超過10%
(assert (= investment_limit_fund_total
   (ite (and (>= 10.0 fund_investment_ratio_total)
             (>= 10.0 fund_investment_ratio_per_fund))
        1.0
        0.0)))

; [insurance:investment_limit_securitized_and_others] 證券化商品及其他核准有價證券投資總額不超過資金10%
(assert (= investment_limit_securitized_and_others
   (ite (>= 10.0 securitized_and_others_investment_ratio) 1.0 0.0)))

; [insurance:investment_limit_stock_and_bond_combined] 股票及公司債投資總額不超過資金35%
(assert (= investment_limit_stock_and_bond_combined
   (ite (>= 35.0 (+ stock_investment_ratio_total bond_investment_ratio_total))
        1.0
        0.0)))

; [insurance:investment_prohibited_roles] 禁止保險業或代表人擔任被投資公司董事、監察人等角色
(assert (not (= (or appointing_manager
            acting_as_director
            acting_as_supervisor
            participating_in_management_agreement
            acting_as_trust_supervisor
            exercising_voting_rights)
        investment_prohibited_roles)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反資本等級改善計畫、財務或業務惡化未改善、內部控制制度、投資限額及禁止角色規定等任一規定時處罰
(assert (= penalty
   (or (and (not capital_level_severe_insufficient)
            financial_or_business_deterioration)
       (not (= investment_limit_stock_per_company 1.0))
       (not (= investment_limit_stock_and_bond_combined 1.0))
       (not (= investment_limit_bond_per_company 1.0))
       (not (= investment_limit_fund_total 1.0))
       (not (= investment_limit_securitized_and_others 1.0))
       (not internal_control_and_audit_ok)
       (not (= investment_limit_financial_bonds 1.0))
       (not internal_handling_ok)
       (not investment_prohibited_roles)
       (and capital_level_severe_insufficient (not improvement_plan_completed))
       (not (= investment_limit_public_debt 1.0)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 1000000.0))
(assert (= net_worth_ratio 10.0))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= public_debt_investment_ok true))
(assert (= financial_bonds_investment_ratio 35.0))
(assert (= stock_investment_ratio_per_company 5.0))
(assert (= stock_investment_ratio_of_issued_shares 10.0))
(assert (= bond_investment_ratio_per_company 5.0))
(assert (= bond_investment_ratio_of_owner_equity 10.0))
(assert (= fund_investment_ratio_total 10.0))
(assert (= fund_investment_ratio_per_fund 10.0))
(assert (= securitized_and_others_investment_ratio 10.0))
(assert (= stock_investment_ratio_total 20.0))
(assert (= bond_investment_ratio_total 15.0))
(assert (= acting_as_director false))
(assert (= acting_as_supervisor false))
(assert (= acting_as_trust_supervisor false))
(assert (= appointing_manager false))
(assert (= exercising_voting_rights false))
(assert (= participating_in_management_agreement false))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_rights false))
(assert (= financial_or_business_deterioration true))
(assert (= improvement_plan_completed false))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_executed false))
(assert (= level_3_measures_executed false))
(assert (= level_4_measures_executed false))
(assert (= capital_level_2_measures_executed false))
(assert (= supervisor_consent_payment_exceed_limit false))
(assert (= supervisor_consent_contract_commitment false))
(assert (= supervisor_consent_other_major_financial_matters false))
(assert (= prohibited_actions_without_supervisor_consent true))
(assert (= supervisory_action_executed false))
(assert (= supervisory_action_taken false))
(assert (= supervisory_action_required true))
(assert (= investment_limit_public_debt 1.0))
(assert (= investment_limit_financial_bonds 35.0))
(assert (= investment_limit_stock_per_company 5.0))
(assert (= investment_limit_bond_per_company 5.0))
(assert (= investment_limit_fund_total 10.0))
(assert (= investment_limit_securitized_and_others 10.0))
(assert (= investment_limit_stock_and_bond_combined 35.0))
(assert (= investment_prohibited_roles true))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_ok false))
(assert (= penalty true))
(assert (= plan_completed_within_deadline false))
(assert (= capital_level 0))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_4_measures_executed false))
(assert (= capital_level_adequate false))
(assert (= capital_level_insufficient false))
(assert (= capital_level_severe_insufficient false))
(assert (= capital_level_significant_deterioration false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 25
; Total variables: 60
; Total facts: 60
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
