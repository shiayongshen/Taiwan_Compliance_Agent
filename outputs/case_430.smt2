; SMT2 file generated from compliance case automatic
; Case ID: case_430
; Generated at: 2025-10-21T09:37:09.787639
;
; This file can be executed with Z3:
;   z3 case_430.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_or_no_improvement Bool)
(declare-const business_status_deteriorated Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_or_improvement_plan_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_severe_insufficient Bool)
(declare-const deadline_days_after_expiry Int)
(declare-const financial_status_deteriorated Bool)
(declare-const foreign_investment_total Real)
(declare-const harm_to_insured_risk Bool)
(declare-const improvement_after_guidance Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_by_authority Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const investment_146_1_3 Real)
(declare-const investment_146_1_4 Real)
(declare-const investment_limit_146_1_3_and_4 Real)
(declare-const investment_limit_foreign Real)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_deterioration Bool)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const potential_harm_to_insured Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const received_guidance Bool)
(declare-const significant_worsening Bool)
(declare-const supervisory_consent_contract_commitment Bool)
(declare-const supervisory_consent_other_major_financial_matters Bool)
(declare-const supervisory_consent_payment_exceed_limit Bool)
(declare-const supervisory_measures_applicable Bool)
(declare-const supervisory_restrictions Bool)
(declare-const total_funds Real)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const unable_to_pay_or_fulfill Bool)
(declare-const violate_article_143 Bool)
(declare-const violate_article_143_5_or_6_measures Bool)
(declare-const violate_article_148_1 Bool)
(declare-const violate_article_148_2_1 Bool)
(declare-const violate_article_148_2_2 Bool)
(declare-const violate_article_148_3_1 Bool)
(declare-const violate_article_148_3_2 Bool)
(declare-const violate_business_scope_regulations Bool)
(declare-const violate_fund_management_146_1 Bool)
(declare-const violate_fund_management_146_1_2 Bool)
(declare-const violate_fund_management_146_2 Bool)
(declare-const violate_fund_management_146_3 Bool)
(declare-const violate_fund_management_146_4 Bool)
(declare-const violate_fund_management_146_5 Bool)
(declare-const violate_fund_management_146_6 Bool)
(declare-const violate_fund_management_146_7 Bool)
(declare-const violate_fund_management_146_9 Bool)
(declare-const violate_internal_control Bool)
(declare-const violate_internal_handling Bool)
(declare-const violate_loan_approval_regulations Bool)
(declare-const violate_loan_guarantee_regulations Bool)
(declare-const violate_loan_limit_regulations Bool)
(declare-const violate_reserve_deposit_regulations Bool)
(declare-const violation_article_143 Bool)
(declare-const violation_article_143_5_or_6_measures Bool)
(declare-const violation_article_148_1 Bool)
(declare-const violation_article_148_2_1 Bool)
(declare-const violation_article_148_2_2 Bool)
(declare-const violation_article_148_3_1 Bool)
(declare-const violation_article_148_3_2 Bool)
(declare-const violation_business_scope Bool)
(declare-const violation_fund_management Bool)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_handling Bool)
(declare-const violation_loan_approval Bool)
(declare-const violation_loan_guarantee Bool)
(declare-const violation_loan_limit Bool)
(declare-const violation_reserve_requirements Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級為嚴重不足
(assert (not (= (<= 1 capital_level) capital_level_severe_insufficient)))

; [insurance:capital_level] 資本等級分類（1=適足, 4=嚴重不足）
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
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_severe_insufficient] 資本等級為嚴重不足（等級4）
(assert (= capital_level_severe_insufficient (= 4 capital_level)))

; [insurance:capital_level_significant_worsening] 財務或業務狀況顯著惡化
(assert (= significant_worsening
   (or business_status_deteriorated financial_status_deteriorated)))

; [insurance:unable_to_pay_debt_or_fulfill_contract] 不能支付債務或履行契約責任
(assert (= unable_to_pay_or_fulfill (or unable_to_fulfill_contract unable_to_pay_debt)))

; [insurance:potential_harm_to_insured] 有損及被保險人權益之虞
(assert (= potential_harm_to_insured harm_to_insured_risk))

; [insurance:improvement_plan_submitted_and_approved] 提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_approved
   (and improvement_plan_submitted improvement_plan_approved_by_authority)))

; [insurance:accelerated_deterioration_or_no_improvement_after_guidance] 損益、淨值加速惡化或經輔導仍未改善
(assert (= accelerated_deterioration_or_no_improvement
   (or profit_loss_accelerated_deterioration
       (and received_guidance (not improvement_after_guidance))
       net_worth_accelerated_deterioration)))

; [insurance:supervisory_measures_applicable] 主管機關得為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_applicable
   (or (and capital_level_severe_insufficient
            (not capital_increase_or_improvement_plan_completed)
            (>= 90 deadline_days_after_expiry))
       (and (not capital_level_severe_insufficient)
            significant_worsening
            unable_to_pay_or_fulfill
            potential_harm_to_insured
            improvement_plan_approved
            accelerated_deterioration_or_no_improvement))))

; [insurance:supervisory_restrictions] 保險業監管處分限制行為
(assert (= supervisory_restrictions
   (and (not supervisory_consent_payment_exceed_limit)
        (not supervisory_consent_contract_commitment)
        (not supervisory_consent_other_major_financial_matters))))

; [insurance:violation_of_business_scope_regulations] 違反業務範圍規定
(assert (= violation_business_scope violate_business_scope_regulations))

; [insurance:violation_of_reserve_requirements] 違反賠償準備金提存額度或方式規定
(assert (= violation_reserve_requirements violate_reserve_deposit_regulations))

; [insurance:violation_of_article_143] 違反第一百四十三條規定
(assert (= violation_article_143 violate_article_143))

; [insurance:violation_of_article_143_5_or_143_6_measures] 違反第一百四十三條之五或主管機關依第一百四十三條之六規定所為措施
(assert (= violation_article_143_5_or_6_measures violate_article_143_5_or_6_measures))

; [insurance:violation_of_fund_management_regulations] 違反資金運用相關規定
(assert (= violation_fund_management
   (or violate_fund_management_146_1
       violate_fund_management_146_1_2
       violate_fund_management_146_2
       violate_fund_management_146_3
       violate_fund_management_146_4
       violate_fund_management_146_5
       violate_fund_management_146_6
       violate_fund_management_146_7
       violate_fund_management_146_9)))

; [insurance:violation_of_loan_guarantee_regulations] 違反放款無十足擔保或條件優於其他同類放款規定
(assert (= violation_loan_guarantee violate_loan_guarantee_regulations))

; [insurance:violation_of_loan_approval_regulations] 違反放款金額及董事會同意程序規定
(assert (= violation_loan_approval violate_loan_approval_regulations))

; [insurance:violation_of_loan_limit_regulations] 違反放款或其他交易限額及決議程序規定
(assert (= violation_loan_limit violate_loan_limit_regulations))

; [insurance:violation_of_internal_control] 未建立或未執行內部控制或稽核制度
(assert (= violation_internal_control violate_internal_control))

; [insurance:violation_of_internal_handling] 未建立或未執行內部處理制度或程序
(assert (= violation_internal_handling violate_internal_handling))

; [insurance:violation_of_article_148_1] 違反第一百四十八條之一規定
(assert (= violation_article_148_1 violate_article_148_1))

; [insurance:violation_of_article_148_2_1] 違反第一百四十八條之二第一項規定
(assert (= violation_article_148_2_1 violate_article_148_2_1))

; [insurance:violation_of_article_148_2_2] 違反第一百四十八條之二第二項規定
(assert (= violation_article_148_2_2 violate_article_148_2_2))

; [insurance:violation_of_article_148_3_1] 違反第一百四十八條之三第一項規定
(assert (= violation_article_148_3_1 violate_article_148_3_1))

; [insurance:violation_of_article_148_3_2] 違反第一百四十八條之三第二項規定
(assert (= violation_article_148_3_2 violate_article_148_3_2))

; [insurance:investment_limit_146_1_3_and_4] 第三款及第四款投資總額不得超過資金35%
(assert (= investment_limit_146_1_3_and_4
   (ite (<= (+ investment_146_1_3 investment_146_1_4)
            (* (/ 7.0 20.0) total_funds))
        1.0
        0.0)))

; [insurance:investment_limit_foreign_investment] 國外投資總額不得超過資金45%
(assert (= investment_limit_foreign
   (ite (<= foreign_investment_total (* (/ 9.0 20.0) total_funds)) 1.0 0.0)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反任一法令規定時處罰
(assert (= penalty
   (or (not (= investment_limit_foreign 1.0))
       violation_loan_approval
       violation_loan_guarantee
       violation_loan_limit
       violation_article_148_1
       (not (= investment_limit_146_1_3_and_4 1.0))
       violation_reserve_requirements
       violation_business_scope
       violation_internal_control
       violation_fund_management
       violation_internal_handling
       violation_article_148_2_1
       violation_article_143
       violation_article_148_2_2
       violation_article_148_3_1
       violation_article_143_5_or_6_measures
       violation_article_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= foreign_investment_total 50.0))
(assert (= investment_146_1_3 20.0))
(assert (= investment_146_1_4 20.0))
(assert (= total_funds 100.0))
(assert (= violate_fund_management_146_1 true))
(assert (= violate_loan_limit_regulations true))
(assert (= violate_internal_control true))
(assert (= violate_internal_handling true))
(assert (= violation_fund_management true))
(assert (= violation_loan_limit true))
(assert (= violation_internal_control true))
(assert (= violation_internal_handling true))
(assert (= capital_level 4))
(assert (= capital_level_severe_insufficient true))
(assert (= deadline_days_after_expiry 7))
(assert (= capital_increase_or_improvement_plan_completed false))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_approved_by_authority false))
(assert (= improvement_plan_approved false))
(assert (= significant_worsening false))
(assert (= financial_status_deteriorated false))
(assert (= business_status_deteriorated false))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= unable_to_pay_or_fulfill false))
(assert (= harm_to_insured_risk false))
(assert (= potential_harm_to_insured false))
(assert (= accelerated_deterioration_or_no_improvement false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= net_worth_accelerated_deterioration false))
(assert (= received_guidance false))
(assert (= improvement_after_guidance false))
(assert (= supervisory_consent_payment_exceed_limit false))
(assert (= supervisory_consent_contract_commitment false))
(assert (= supervisory_consent_other_major_financial_matters false))
(assert (= supervisory_restrictions true))
(assert (= supervisory_measures_applicable true))
(assert (= penalty true))
(assert (= violate_business_scope_regulations false))
(assert (= violation_business_scope false))
(assert (= violate_reserve_deposit_regulations false))
(assert (= violation_reserve_requirements false))
(assert (= violate_article_143 false))
(assert (= violation_article_143 false))
(assert (= violate_article_143_5_or_6_measures false))
(assert (= violation_article_143_5_or_6_measures false))
(assert (= violate_article_148_1 false))
(assert (= violation_article_148_1 false))
(assert (= violate_article_148_2_1 false))
(assert (= violation_article_148_2_1 false))
(assert (= violate_article_148_2_2 false))
(assert (= violation_article_148_2_2 false))
(assert (= violate_article_148_3_1 false))
(assert (= violation_article_148_3_1 false))
(assert (= violate_article_148_3_2 false))
(assert (= violation_article_148_3_2 false))
(assert (= violate_loan_guarantee_regulations false))
(assert (= violation_loan_guarantee false))
(assert (= violate_loan_approval_regulations false))
(assert (= violation_loan_approval false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 29
; Total variables: 73
; Total facts: 63
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
