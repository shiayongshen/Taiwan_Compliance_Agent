; SMT2 file generated from compliance case automatic
; Case ID: case_453
; Generated at: 2025-10-19T16:23:58.630760
;
; This file can be executed with Z3:
;   z3 case_453.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_improvement_plan_completed Bool)
(declare-const capital_improvement_plan_not_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_4_penalty_condition Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficient Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const financial_or_business_condition_deteriorated Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_by_authority Bool)
(declare-const improvement_plan_completed_within_deadline Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_not_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_to_authority Bool)
(declare-const internal_control_content_compliant Bool)
(declare-const internal_control_content_meets_requirements Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const penalty_violation_financial_business Bool)
(declare-const penalty_violation_internal_control Bool)
(declare-const supervisory_measures_applicable Bool)
(declare-const violate_article_143 Bool)
(declare-const violate_article_143_5_or_6_measures Bool)
(declare-const violate_business_scope_rule Bool)
(declare-const violate_fund_management_rules Bool)
(declare-const violate_loan_approval_rules Bool)
(declare-const violate_loan_guarantee_rules Bool)
(declare-const violate_loan_limit_rules Bool)
(declare-const violate_reserve_rules Bool)
(declare-const violation_article_143 Bool)
(declare-const violation_article_143_5_6 Bool)
(declare-const violation_business_scope Bool)
(declare-const violation_fund_management Bool)
(declare-const violation_loan_approval Bool)
(declare-const violation_loan_guarantee Bool)
(declare-const violation_loan_limit Bool)
(declare-const violation_reserve_requirements Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級為嚴重不足
(assert (= capital_level_severe_insufficient
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_level_significant_deterioration] 資本等級為顯著惡化
(assert (= capital_level_significant_deterioration
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級為不足
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級為適足
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

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
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_improvement_plan_completed] 增資、財務或業務改善計畫或合併於主管機關規定期限內完成
(assert (= capital_improvement_plan_completed
   improvement_plan_completed_within_deadline))

; [insurance:capital_improvement_plan_not_completed] 未於主管機關規定期限內完成增資、財務或業務改善計畫或合併
(assert (not (= capital_improvement_plan_completed
        capital_improvement_plan_not_completed)))

; [insurance:capital_level_4_penalty_condition] 資本嚴重不足且未完成改善計畫
(assert (= capital_level_4_penalty_condition
   (and (= 4 capital_level) capital_improvement_plan_not_completed)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   financial_or_business_condition_deteriorated))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_by_authority))

; [insurance:improvement_plan_submitted] 保險業提出財務或業務改善計畫
(assert (= improvement_plan_submitted improvement_plan_submitted_to_authority))

; [insurance:improvement_plan_not_effective] 損益、淨值加速惡化或經輔導仍未改善
(assert (not (= improvement_plan_effective improvement_plan_not_effective)))

; [insurance:supervisory_measures_applicable] 主管機關得依情節輕重為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_applicable
   (and financial_or_business_deterioration
        improvement_plan_approved
        improvement_plan_not_effective)))

; [insurance:penalty_violation_financial_business] 違反財務或業務改善計畫規定
(assert (= penalty_violation_financial_business
   (or capital_level_4_penalty_condition supervisory_measures_applicable)))

; [insurance:violation_business_scope] 違反第一百三十八條相關業務範圍規定
(assert (= violation_business_scope violate_business_scope_rule))

; [insurance:violation_reserve_requirements] 違反賠償準備金提存額度或提存方式規定
(assert (= violation_reserve_requirements violate_reserve_rules))

; [insurance:violation_article_143] 違反第一百四十三條規定
(assert (= violation_article_143 violate_article_143))

; [insurance:violation_article_143_5_6] 違反第一百四十三條之五或主管機關依第一百四十三條之六規定措施
(assert (= violation_article_143_5_6 violate_article_143_5_or_6_measures))

; [insurance:violation_fund_management] 違反資金運用相關規定
(assert (= violation_fund_management violate_fund_management_rules))

; [insurance:violation_loan_guarantee] 違反放款無十足擔保或條件優於其他同類放款規定
(assert (= violation_loan_guarantee violate_loan_guarantee_rules))

; [insurance:violation_loan_approval] 違反放款董事會同意或限額規定
(assert (= violation_loan_approval violate_loan_approval_rules))

; [insurance:violation_loan_limit] 違反放款或其他交易限額及決議程序規定
(assert (= violation_loan_limit violate_loan_limit_rules))

; [money_laundering:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established internal_control_system_established))

; [money_laundering:internal_control_content_compliant] 內部控制制度內容符合防制洗錢及打擊資恐規定
(assert (= internal_control_content_compliant
   internal_control_content_meets_requirements))

; [money_laundering:internal_control_executed] 內部控制制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [money_laundering:penalty_condition_internal_control] 違反洗錢防制內部控制制度規定
(assert (= penalty_violation_internal_control
   (or (not internal_control_established)
       (not internal_control_content_compliant)
       (not internal_control_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險業資本不足改善計畫或財務業務惡化規定，或違反保險業相關法令規定，或違反洗錢防制內部控制制度規定時處罰
(assert (= penalty
   (or violation_fund_management
       penalty_violation_financial_business
       violation_article_143
       violation_article_143_5_6
       violation_loan_guarantee
       violation_loan_approval
       penalty_violation_internal_control
       violation_loan_limit
       violation_reserve_requirements
       violation_business_scope)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= capital_improvement_plan_completed false))
(assert (= capital_improvement_plan_not_completed true))
(assert (= financial_or_business_condition_deteriorated true))
(assert (= improvement_plan_approved_by_authority false))
(assert (= improvement_plan_effective false))
(assert (= improvement_plan_submitted_to_authority false))
(assert (= internal_control_system_established false))
(assert (= internal_control_content_meets_requirements false))
(assert (= internal_control_system_executed false))
(assert (= violate_business_scope_rule true))
(assert (= violate_loan_approval_rules true))
(assert (= violate_loan_limit_rules true))
(assert (= penalty_violation_financial_business true))
(assert (= penalty_violation_internal_control true))
(assert (= violation_business_scope true))
(assert (= violation_loan_approval true))
(assert (= violation_loan_limit true))
(assert (= capital_level 0))
(assert (= capital_level_4_penalty_condition false))
(assert (= capital_level_adequate false))
(assert (= capital_level_insufficient false))
(assert (= capital_level_severe_insufficient false))
(assert (= capital_level_significant_deterioration false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_completed_within_deadline false))
(assert (= improvement_plan_not_effective false))
(assert (= improvement_plan_submitted false))
(assert (= internal_control_content_compliant false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= penalty false))
(assert (= supervisory_measures_applicable false))
(assert (= violate_article_143 false))
(assert (= violate_article_143_5_or_6_measures false))
(assert (= violate_fund_management_rules false))
(assert (= violate_loan_guarantee_rules false))
(assert (= violate_reserve_rules false))
(assert (= violation_article_143 false))
(assert (= violation_article_143_5_6 false))
(assert (= violation_fund_management false))
(assert (= violation_loan_guarantee false))
(assert (= violation_reserve_requirements false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 46
; Total facts: 46
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
