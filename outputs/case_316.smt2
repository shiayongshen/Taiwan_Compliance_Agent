; SMT2 file generated from compliance case automatic
; Case ID: case_316
; Generated at: 2025-10-21T07:06:25.668787
;
; This file can be executed with Z3:
;   z3 case_316.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_foreign_currency_domestic_securities_amount Real)
(declare-const approved_foreign_currency_non_investment_amount Real)
(declare-const approved_foreign_insurance_related_investment_amount Real)
(declare-const approved_other_foreign_investment_amount Real)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const foreign_investment_amount Real)
(declare-const foreign_investment_exclusion_valid Bool)
(declare-const foreign_investment_within_limit Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_and_handling_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const loan_and_other_transaction_limit_compliance Bool)
(declare-const loan_and_other_transaction_within_limit Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const related_person_definition_valid Bool)
(declare-const same_person_defined Bool)
(declare-const same_related_enterprise_defined Bool)
(declare-const same_related_person_defined Bool)
(declare-const total_funds Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:foreign_investment_limit] 國外投資總額不得超過資金45%，扣除不計入項目
(assert (= foreign_investment_within_limit
   (<= foreign_investment_amount (* (/ 9.0 20.0) total_funds))))

; [insurance:foreign_investment_exclusion_valid] 國外投資不計入限額之金額均經主管機關核准
(assert (= foreign_investment_exclusion_valid
   (and (= approved_foreign_currency_non_investment_amount 1.0)
        (= approved_foreign_currency_domestic_securities_amount 1.0)
        (= approved_foreign_insurance_related_investment_amount 1.0)
        (= approved_other_foreign_investment_amount 1.0))))

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

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
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級(4)措施已執行
(assert (= capital_level_4_measures_executed level_4_measures_executed))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級(3)措施已執行
(assert (= capital_level_3_measures_executed level_3_measures_executed))

; [insurance:capital_level_2_measures_executed] 資本不足等級(2)措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:loan_and_other_transaction_limit_compliance] 放款及其他交易限額及範圍符合主管機關規定
(assert (= loan_and_other_transaction_limit_compliance
   loan_and_other_transaction_within_limit))

; [insurance:related_person_definition_valid] 同一人、同一關係人及同一關係企業定義符合規定
(assert (= related_person_definition_valid
   (and same_person_defined
        same_related_person_defined
        same_related_enterprise_defined)))

; [insurance:internal_control_executed] 內部控制及稽核制度已執行
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_executed] 內部處理制度及程序已執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:internal_control_and_handling_ok] 內部控制及稽核制度與內部處理制度及程序均已建立且執行
(assert (= internal_control_and_handling_ok
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反國外投資限額、內部控制、資本等級措施或放款及其他交易限額規定時處罰
(assert (= penalty
   (or (not foreign_investment_within_limit)
       (and (= 2 capital_level) (not capital_level_2_measures_executed))
       (and (= 4 capital_level) (not capital_level_4_measures_executed))
       (not loan_and_other_transaction_limit_compliance)
       (not foreign_investment_exclusion_valid)
       (and (= 3 capital_level) (not capital_level_3_measures_executed))
       (not internal_control_and_handling_ok)
       (not related_person_definition_valid))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 1000000))
(assert (= net_worth_ratio 5.0))
(assert (= capital_level 1))
(assert (= foreign_investment_amount 6000000))
(assert (= total_funds 10000000))
(assert (= foreign_investment_within_limit false))
(assert (= approved_foreign_currency_non_investment_amount 0.0))
(assert (= approved_foreign_currency_domestic_securities_amount 0.0))
(assert (= approved_foreign_insurance_related_investment_amount 0.0))
(assert (= approved_other_foreign_investment_amount 0.0))
(assert (= foreign_investment_exclusion_valid false))
(assert (= internal_control_system_established false))
(assert (= internal_control_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_handling_executed false))
(assert (= internal_control_and_handling_ok false))
(assert (= loan_and_other_transaction_within_limit false))
(assert (= loan_and_other_transaction_limit_compliance false))
(assert (= related_person_definition_valid false))
(assert (= same_person_defined false))
(assert (= same_related_person_defined false))
(assert (= same_related_enterprise_defined false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= capital_level_2_measures_executed false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_4_measures_executed false))
(assert (= level_3_measures_executed false))
(assert (= level_4_measures_executed false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 35
; Total facts: 35
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
