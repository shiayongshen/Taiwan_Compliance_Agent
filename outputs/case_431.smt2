; SMT2 file generated from compliance case automatic
; Case ID: case_431
; Generated at: 2025-10-21T09:39:21.322830
;
; This file can be executed with Z3:
;   z3 case_431.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_4_compliance Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const contract_or_major_commitment_made Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_impact Bool)
(declare-const payment_exceeding_limit Bool)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const prohibited_acts_without_supervisor_consent Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const significant_deterioration Bool)
(declare-const supervisory_measures_applicable Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const violation_138 Bool)
(declare-const violation_138_2_etc Bool)
(declare-const violation_143 Bool)
(declare-const violation_143_5_or_143_6 Bool)
(declare-const violation_article_143 Bool)
(declare-const violation_article_143_5_or_143_6_measures Bool)
(declare-const violation_business_scope Bool)
(declare-const violation_fund_management Bool)
(declare-const violation_fund_management_rules Bool)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_control_execution Bool)
(declare-const violation_internal_handling Bool)
(declare-const violation_internal_handling_execution Bool)
(declare-const violation_loan_approval Bool)
(declare-const violation_loan_approval_flag Bool)
(declare-const violation_loan_guarantee_criminal Bool)
(declare-const violation_loan_guarantee_criminal_flag Bool)
(declare-const violation_loan_limit_decision Bool)
(declare-const violation_loan_limit_decision_flag Bool)
(declare-const violation_reserve_requirements Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著惡化, 4=嚴重不足）
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

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未於期限完成增資或改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level) (not capital_level_4_compliance))))

; [insurance:capital_level_4_compliance] 資本嚴重不足等級完成增資、財務或業務改善計畫或合併
(assert (= capital_level_4_compliance capital_level_4_measures_executed))

; [insurance:significant_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約或有損及被保險人權益之虞
(assert (= significant_deterioration
   (and financial_or_business_deterioration
        (or risk_to_insured_interest
            unable_to_pay_debt
            unable_to_fulfill_contract))))

; [insurance:improvement_plan_submitted_and_approved] 已提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值加速惡化且經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration
   (and profit_loss_accelerated_deterioration (not improvement_plan_effective))))

; [insurance:supervisory_measures_applicable] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_applicable
   (or capital_level_4_noncompliance
       (and significant_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_accelerated_deterioration))))

; [insurance:prohibited_acts_without_supervisor_consent] 監管處分期間未經監管人同意之禁止行為
(assert (= prohibited_acts_without_supervisor_consent
   (or contract_or_major_commitment_made
       other_major_financial_impact
       payment_exceeding_limit)))

; [insurance:violation_business_scope] 違反第一百三十八條相關業務範圍規定
(assert (= violation_business_scope violation_138))

; [insurance:violation_reserve_requirements] 違反賠償準備金提存額度或方式規定
(assert (= violation_reserve_requirements violation_138_2_etc))

; [insurance:violation_article_143] 違反第一百四十三條規定
(assert (= violation_article_143 violation_143))

; [insurance:violation_article_143_5_or_143_6_measures] 違反第一百四十三條之五或主管機關依第一百四十三條之六規定所為措施
(assert (= violation_article_143_5_or_143_6_measures violation_143_5_or_143_6))

; [insurance:violation_fund_management] 資金運用違反相關規定
(assert (= violation_fund_management violation_fund_management_rules))

; [insurance:violation_loan_guarantee_criminal] 放款無十足擔保或條件優於同類放款者，行為負責人刑責
(assert (= violation_loan_guarantee_criminal violation_loan_guarantee_criminal_flag))

; [insurance:violation_loan_approval] 擔保放款未經董事會三分之二出席及四分之三同意或違反放款限額規定
(assert (= violation_loan_approval violation_loan_approval_flag))

; [insurance:violation_loan_limit_decision] 違反放款或其他交易限額及決議程序規定
(assert (= violation_loan_limit_decision violation_loan_limit_decision_flag))

; [insurance:violation_internal_control] 未建立或未執行內部控制或稽核制度
(assert (not (= internal_control_established violation_internal_control)))

; [insurance:violation_internal_control_execution] 未執行內部控制或稽核制度
(assert (not (= internal_control_executed violation_internal_control_execution)))

; [insurance:violation_internal_handling] 未建立或未執行內部處理制度或程序
(assert (not (= internal_handling_established violation_internal_handling)))

; [insurance:violation_internal_handling_execution] 未執行內部處理制度或程序
(assert (not (= internal_handling_executed violation_internal_handling_execution)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法令規定或資本嚴重不足且未完成改善計畫時處罰
(assert (= penalty
   (or violation_loan_limit_decision
       violation_internal_handling_execution
       violation_internal_handling
       capital_level_4_noncompliance
       violation_business_scope
       violation_reserve_requirements
       violation_internal_control
       violation_article_143_5_or_143_6_measures
       violation_loan_approval
       violation_loan_guarantee_criminal
       violation_article_143
       violation_fund_management
       violation_internal_control_execution)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 45.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_level_4_compliance false))
(assert (= capital_level_4_measures_executed false))
(assert (= violation_fund_management_rules true))
(assert (= violation_fund_management true))
(assert (= violation_internal_control true))
(assert (= internal_control_established false))
(assert (= violation_internal_control_execution true))
(assert (= internal_control_executed false))
(assert (= violation_loan_limit_decision_flag true))
(assert (= violation_loan_limit_decision true))
(assert (= violation_loan_approval_flag true))
(assert (= violation_loan_approval true))
(assert (= violation_138 false))
(assert (= violation_138_2_etc false))
(assert (= violation_143 false))
(assert (= violation_143_5_or_143_6 false))
(assert (= violation_article_143 false))
(assert (= violation_article_143_5_or_143_6_measures false))
(assert (= violation_internal_handling true))
(assert (= internal_handling_established false))
(assert (= violation_internal_handling_execution true))
(assert (= internal_handling_executed false))
(assert (= capital_level_4_noncompliance true))
(assert (= penalty true))
(assert (= payment_exceeding_limit false))
(assert (= contract_or_major_commitment_made false))
(assert (= other_major_financial_impact false))
(assert (= financial_or_business_deterioration false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_effective false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= significant_deterioration false))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= risk_to_insured_interest false))
(assert (= supervisory_measures_applicable true))
(assert (= prohibited_acts_without_supervisor_consent false))
(assert (= violation_loan_guarantee_criminal_flag false))
(assert (= violation_loan_guarantee_criminal false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 48
; Total facts: 45
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
