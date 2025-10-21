; SMT2 file generated from compliance case automatic
; Case ID: case_465
; Generated at: 2025-10-21T10:23:44.432736
;
; This file can be executed with Z3:
;   z3 case_465.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const CAR Real)
(declare-const NWR Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_3_measures_executed_flag Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_4_measures_executed_flag Bool)
(declare-const criminal_liability_loan Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const loan_without_sufficient_collateral Bool)
(declare-const net_worth Real)
(declare-const penalty Bool)
(declare-const related_party_definition Bool)
(declare-const violate_article_138_2_rules Bool)
(declare-const violate_article_138_rules Bool)
(declare-const violate_article_143 Bool)
(declare-const violate_article_143_5_or_143_6_measures Bool)
(declare-const violate_fund_management_rules Bool)
(declare-const violate_loan_approval_rules Bool)
(declare-const violate_loan_limit_rules Bool)
(declare-const violation_article_143 Bool)
(declare-const violation_article_143_5_6 Bool)
(declare-const violation_business_scope Bool)
(declare-const violation_fund_management Bool)
(declare-const violation_loan_approval Bool)
(declare-const violation_loan_limit Bool)
(declare-const violation_reserve_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:related_party_definition] 同一人、同一關係人及同一關係企業定義
(assert related_party_definition)

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (ite (and (<= 150.0 CAR) (not (<= 200.0 CAR)))
                2
                (ite (<= 200.0 CAR) 1 0))))
(let ((a!2 (ite (and (<= 50.0 CAR)
                     (not (<= 150.0 CAR))
                     (<= 0.0 NWR)
                     (not (<= 2.0 NWR)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth)) (not (<= 50.0 CAR))) 4 a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_level_4_measures_executed capital_level_4_measures_executed_flag))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_level_3_measures_executed capital_level_3_measures_executed_flag))

; [insurance:capital_level_2_measures_executed] 資本不足等級措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:violation_business_scope] 違反業務範圍規定
(assert (= violation_business_scope violate_article_138_rules))

; [insurance:violation_reserve_rules] 違反賠償準備金提存額度及方式規定
(assert (= violation_reserve_rules violate_article_138_2_rules))

; [insurance:violation_article_143] 違反第一百四十三條規定
(assert (= violation_article_143 violate_article_143))

; [insurance:violation_article_143_5_6] 違反第一百四十三條之五或主管機關依第一百四十三條之六規定措施
(assert (= violation_article_143_5_6 violate_article_143_5_or_143_6_measures))

; [insurance:violation_fund_management] 違反資金運用相關規定
(assert (= violation_fund_management violate_fund_management_rules))

; [insurance:criminal_liability_loan] 放款無十足擔保或條件優於其他同類放款對象之刑事責任
(assert (= criminal_liability_loan loan_without_sufficient_collateral))

; [insurance:violation_loan_approval] 擔保放款未經董事會三分之二以上董事出席及四分之三以上同意或違反放款限額規定
(assert (= violation_loan_approval violate_loan_approval_rules))

; [insurance:violation_loan_limit] 違反放款或其他交易限額及決議程序規定
(assert (= violation_loan_limit violate_loan_limit_rules))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本等級措施或違反相關法令規定時處罰
(assert (= penalty
   (or violation_reserve_rules
       (and (= 2 capital_level) (not capital_level_2_measures_executed))
       violation_business_scope
       (and (= 4 capital_level) (not capital_level_4_measures_executed))
       violation_fund_management
       violation_loan_approval
       violation_loan_limit
       violation_article_143
       criminal_liability_loan
       (and (= 3 capital_level) (not capital_level_3_measures_executed))
       violation_article_143_5_6)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= CAR 100.0))
(assert (= NWR 1.0))
(assert (= net_worth 100.0))
(assert (= capital_level 0))
(assert (= capital_level_2_measures_executed false))
(assert (= capital_level_3_measures_executed_flag false))
(assert (= capital_level_4_measures_executed_flag false))
(assert (= criminal_liability_loan false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= loan_without_sufficient_collateral false))
(assert (= related_party_definition true))
(assert (= violate_article_138_2_rules false))
(assert (= violate_article_138_rules false))
(assert (= violate_article_143 false))
(assert (= violate_article_143_5_or_143_6_measures false))
(assert (= violate_fund_management_rules true))
(assert (= violate_loan_approval_rules false))
(assert (= violate_loan_limit_rules false))
(assert (= violation_article_143 false))
(assert (= violation_article_143_5_6 false))
(assert (= violation_business_scope false))
(assert (= violation_fund_management true))
(assert (= violation_loan_approval false))
(assert (= violation_loan_limit false))
(assert (= violation_reserve_rules true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 29
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
