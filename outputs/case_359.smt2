; SMT2 file generated from compliance case automatic
; Case ID: case_359
; Generated at: 2025-10-21T08:01:46.226214
;
; This file can be executed with Z3:
;   z3 case_359.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_made_within_deadline Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_fund Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const company_equity Real)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const investment_amount Real)
(declare-const loan_amount Real)
(declare-const loan_and_investment_limit_combined Real)
(declare-const loan_guarantee_board_approval Bool)
(declare-const loan_guarantee_limit_per_unit Real)
(declare-const loan_guarantee_sufficient_collateral Bool)
(declare-const loan_no_sufficient_collateral_or_preferential_terms Bool)
(declare-const loan_related_party_no_sufficient_collateral_or_preferential_terms Bool)
(declare-const loan_total_limit Real)
(declare-const meets_qualification_criteria Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const no_conflict_of_interest Bool)
(declare-const no_part_time_violation Bool)
(declare-const no_preferential_terms Bool)
(declare-const penalty Bool)
(declare-const regulatory_threshold Real)
(declare-const related_party_loan_amount Real)
(declare-const related_party_loan_board_approval Bool)
(declare-const related_party_loan_limit Real)
(declare-const related_party_no_preferential_terms Bool)
(declare-const related_party_sufficient_collateral Bool)
(declare-const responsible_person_adjusted Bool)
(declare-const responsible_person_conflict_of_interest Bool)
(declare-const responsible_person_qualification Bool)
(declare-const single_loan_amount Real)
(declare-const sufficient_collateral Bool)
(declare-const total_loan_amount Real)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_handling Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:responsible_person_qualification] 保險業負責人具備資格條件
(assert (= responsible_person_qualification meets_qualification_criteria))

; [insurance:responsible_person_conflict_of_interest] 保險業負責人未違反兼職限制及利益衝突禁止
(assert (= responsible_person_conflict_of_interest
   (and no_conflict_of_interest no_part_time_violation)))

; [insurance:responsible_person_adjusted] 保險業負責人違反兼職限制或利益衝突禁止已限期調整
(assert (= responsible_person_adjusted adjustment_made_within_deadline))

; [insurance:loan_guarantee_limit_per_unit] 單一放款金額不得超過資金百分之五
(assert (= loan_guarantee_limit_per_unit
   (ite (<= single_loan_amount (* (/ 1.0 20.0) capital_fund)) 1.0 0.0)))

; [insurance:loan_total_limit] 放款總額不得超過資金百分之三十五
(assert (= loan_total_limit
   (ite (<= total_loan_amount (* (/ 7.0 20.0) capital_fund)) 1.0 0.0)))

; [insurance:loan_guarantee_sufficient_collateral] 對負責人、職員或主要股東之擔保放款有十足擔保且條件不優於其他同類放款
(assert (= loan_guarantee_sufficient_collateral
   (and sufficient_collateral no_preferential_terms)))

; [insurance:loan_guarantee_board_approval] 擔保放款達主管機關規定金額以上經董事會三分之二以上出席及四分之三以上同意
(assert (= loan_guarantee_board_approval
   (and (>= loan_amount regulatory_threshold)
        (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio))))

; [insurance:loan_and_investment_limit_combined] 合併計算放款與投資不得超過資金百分之十及公司業主權益百分之十
(assert (let ((a!1 (ite (and (<= (+ investment_amount loan_amount)
                         (* (/ 1.0 10.0) capital_fund))
                     (<= (+ investment_amount loan_amount)
                         (* (/ 1.0 10.0) company_equity)))
                1.0
                0.0)))
  (= loan_and_investment_limit_combined a!1)))

; [insurance:related_party_loan_limit] 對負責人、職員或利害關係人之擔保放款應有十足擔保且條件不優於其他同類放款
(assert (= related_party_loan_limit
   (ite (and related_party_sufficient_collateral
             related_party_no_preferential_terms)
        1.0
        0.0)))

; [insurance:related_party_loan_board_approval] 利害關係人擔保放款達主管機關規定金額以上經董事會三分之二以上出席及四分之三以上同意
(assert (= related_party_loan_board_approval
   (and (>= related_party_loan_amount regulatory_threshold)
        (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio))))

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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
(assert (= capital_level_4_measures_executed capital_level_4_measures_completed))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級(3)措施已執行
(assert (= capital_level_3_measures_executed capital_level_3_measures_completed))

; [insurance:capital_level_2_measures_executed] 資本不足等級(2)措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:loan_no_sufficient_collateral_or_preferential_terms] 放款無十足擔保或條件優於其他同類放款
(assert (= loan_no_sufficient_collateral_or_preferential_terms
   (or (not loan_guarantee_sufficient_collateral)
       (not loan_guarantee_board_approval))))

; [insurance:loan_related_party_no_sufficient_collateral_or_preferential_terms] 利害關係人放款無十足擔保或條件優於其他同類放款
(assert (= loan_related_party_no_sufficient_collateral_or_preferential_terms
   (or (not (= related_party_loan_limit 1.0))
       (not related_party_loan_board_approval))))

; [insurance:violation_internal_control] 未建立或未執行內部控制及稽核制度
(assert (= violation_internal_control
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violation_internal_handling] 未建立或未執行內部處理制度及程序
(assert (= violation_internal_handling
   (or (not internal_handling_established) (not internal_handling_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反負責人資格條件、兼職限制、利益衝突禁止，或放款無十足擔保、條件優於其他同類放款，或未建立或執行內部控制及內部處理制度
(assert (= penalty
   (or (and (= 3 capital_level) (not capital_level_3_measures_executed))
       loan_no_sufficient_collateral_or_preferential_terms
       (and (not responsible_person_conflict_of_interest)
            (not responsible_person_adjusted))
       (and (= 2 capital_level) (not capital_level_2_measures_executed))
       loan_related_party_no_sufficient_collateral_or_preferential_terms
       (not responsible_person_qualification)
       (and (= 4 capital_level) (not capital_level_4_measures_executed))
       violation_internal_control
       violation_internal_handling)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= meets_qualification_criteria false))
(assert (= no_conflict_of_interest false))
(assert (= no_part_time_violation false))
(assert (= adjustment_made_within_deadline false))
(assert (= loan_guarantee_sufficient_collateral false))
(assert (= no_preferential_terms false))
(assert (= loan_guarantee_board_approval false))
(assert (= related_party_sufficient_collateral false))
(assert (= related_party_no_preferential_terms false))
(assert (= related_party_loan_board_approval false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -1000000))
(assert (= net_worth_ratio -10.0))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level_4_measures_executed false))
(assert (= capital_level_3_measures_completed false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_2_measures_executed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= capital_fund 1000000000))
(assert (= company_equity 5000000000))
(assert (= single_loan_amount 60000000))
(assert (= total_loan_amount 400000000))
(assert (= loan_amount 60000000))
(assert (= investment_amount 10000000))
(assert (= related_party_loan_amount 70000000))
(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 3.0 5.0)))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 24
; Total variables: 52
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
