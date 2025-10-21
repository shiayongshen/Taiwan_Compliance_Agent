; SMT2 file generated from compliance case automatic
; Case ID: case_339
; Generated at: 2025-10-21T07:36:25.075369
;
; This file can be executed with Z3:
;   z3 case_339.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const article_143_5_and_143_6_measures_complied Bool)
(declare-const article_143_complied Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const business_scope_rules_complied Bool)
(declare-const business_year_end Int)
(declare-const capital_level Real)
(declare-const capital_level_severely_insufficient Bool)
(declare-const company_law_369_11_applied Bool)
(declare-const company_law_369_1_applied Bool)
(declare-const company_law_369_2_applied Bool)
(declare-const company_law_369_3_applied Bool)
(declare-const company_law_369_9_applied Bool)
(declare-const degree_of_kinship Int)
(declare-const exclusion_of_certain_shares_in_calculation Bool)
(declare-const financial_or_business_condition_deteriorated Bool)
(declare-const foreign_investment_compliance Bool)
(declare-const foreign_investment_limit Real)
(declare-const foreign_investment_limit_compliance Bool)
(declare-const foreign_investment_total Real)
(declare-const fund_usage_rules_complied Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_and_handling_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const legal_person_1 Bool)
(declare-const legal_person_2 Bool)
(declare-const loan_amount_to_related_corporate Real)
(declare-const loan_amount_to_related_person Real)
(declare-const loan_amount_to_same_person Real)
(declare-const loan_and_other_transaction_limit Real)
(declare-const loan_and_transaction_limits_complied Bool)
(declare-const loan_limit Real)
(declare-const loan_other_transaction_limit_compliance Bool)
(declare-const loan_sufficient_collateral Bool)
(declare-const loan_without_board_approval Bool)
(declare-const loan_without_sufficient_collateral Bool)
(declare-const natural_person_1 Bool)
(declare-const natural_person_2 Bool)
(declare-const other_transaction_amount_to_related_corporate Real)
(declare-const other_transaction_amount_to_related_person Real)
(declare-const other_transaction_amount_to_same_person Real)
(declare-const penalty Bool)
(declare-const person Bool)
(declare-const person_responsible_for_business Bool)
(declare-const related_corporate Bool)
(declare-const related_person Bool)
(declare-const reserve_calculated Bool)
(declare-const reserve_calculation_and_recording Bool)
(declare-const reserve_recorded_in_special_ledger Bool)
(declare-const reserve_rules_complied Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const same_person Bool)
(declare-const self Bool)
(declare-const shares_held_due_to_collateral_under_4_years Bool)
(declare-const shares_held_due_to_inheritance_under_2_years Bool)
(declare-const shares_held_during_underwriting_period Bool)
(declare-const spouse Bool)
(declare-const supervision_measures Bool)
(declare-const transaction_limit Real)
(declare-const unable_to_pay_debts_or_fulfill_contracts Bool)
(declare-const violation_of_article_143 Bool)
(declare-const violation_of_article_143_5_and_143_6_measures Bool)
(declare-const violation_of_business_scope_rules Bool)
(declare-const violation_of_fund_usage_rules Bool)
(declare-const violation_of_internal_control_or_handling Bool)
(declare-const violation_of_loan_and_transaction_limits Bool)
(declare-const violation_of_reserve_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:same_person_definition] 同一人定義為同一自然人或同一法人
(assert (= same_person
   (or (= legal_person_1 legal_person_2) (= natural_person_1 natural_person_2))))

; [insurance:related_person_definition] 同一關係人定義包含本人、配偶、二親等以內血親及以本人或配偶為負責人之事業
(assert (= related_person
   (or (>= 2 degree_of_kinship)
       (= person self)
       person_responsible_for_business
       (= person spouse))))

; [insurance:related_corporate_definition] 同一關係企業範圍依公司法相關條文規定
(assert (= related_corporate
   (or company_law_369_9_applied
       company_law_369_11_applied
       company_law_369_2_applied
       company_law_369_3_applied
       company_law_369_1_applied)))

; [insurance:loan_and_other_transaction_limit] 主管機關得限制保險業對同一人、同一關係人或同一關係企業之放款或其他交易
(assert (= loan_and_other_transaction_limit
   (ite (and (<= loan_amount_to_same_person loan_limit)
             (<= loan_amount_to_related_person loan_limit)
             (<= loan_amount_to_related_corporate loan_limit)
             (<= other_transaction_amount_to_same_person transaction_limit)
             (<= other_transaction_amount_to_related_person transaction_limit)
             (<= other_transaction_amount_to_related_corporate
                 transaction_limit))
        1.0
        0.0)))

; [insurance:loan_other_transaction_limit_compliance] 保險業遵守主管機關對放款及其他交易限額及範圍規定
(assert (= loan_other_transaction_limit_compliance
   (= loan_and_other_transaction_limit 1.0)))

; [insurance:internal_control_and_audit_ok] 建立內部控制及稽核制度且確實執行
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:violation_of_business_scope_rules] 違反業務範圍相關規定
(assert (not (= business_scope_rules_complied violation_of_business_scope_rules)))

; [insurance:violation_of_reserve_rules] 違反賠償準備金提存額度及方式規定
(assert (not (= reserve_rules_complied violation_of_reserve_rules)))

; [insurance:violation_of_article_143] 違反第一百四十三條規定
(assert (not (= article_143_complied violation_of_article_143)))

; [insurance:violation_of_article_143_5_and_143_6_measures] 違反第一百四十三條之五或主管機關依第一百四十三條之六規定所為措施
(assert (not (= article_143_5_and_143_6_measures_complied
        violation_of_article_143_5_and_143_6_measures)))

; [insurance:violation_of_fund_usage_rules] 違反保險業資金運用相關規定
(assert (not (= fund_usage_rules_complied violation_of_fund_usage_rules)))

; [insurance:loan_without_sufficient_collateral] 放款無十足擔保或條件優於其他同類放款對象
(assert (not (= loan_sufficient_collateral loan_without_sufficient_collateral)))

; [insurance:loan_without_board_approval] 擔保放款未經董事會三分之二以上董事出席及四分之三以上同意
(assert (= loan_without_board_approval
   (or (not (<= (/ 6666667.0 10000000.0) board_attendance_ratio))
       (not (<= (/ 3.0 4.0) board_approval_ratio)))))

; [insurance:violation_of_loan_and_transaction_limits] 違反放款或其他交易限額及決議程序規定
(assert (not (= loan_and_transaction_limits_complied
        violation_of_loan_and_transaction_limits)))

; [insurance:reserve_calculation_and_recording] 營業年度屆滿時計算應提存準備金並記載於特設帳簿
(assert (= reserve_calculation_and_recording
   (and (<= 1 business_year_end)
        reserve_calculated
        reserve_recorded_in_special_ledger)))

; [insurance:supervision_measures] 主管機關對違反法令或有礙健全經營保險業得為監管、接管等處分
(assert (= supervision_measures
   (or unable_to_pay_debts_or_fulfill_contracts
       risk_to_insured_rights
       capital_level_severely_insufficient
       financial_or_business_condition_deteriorated)))

; [insurance:capital_level_severely_insufficient] 資本等級為嚴重不足
(assert (= capital_level_severely_insufficient (= 4.0 capital_level)))

; [insurance:internal_control_and_handling_compliance] 內部控制及稽核制度與內部處理制度及程序均已建立且執行
(assert (= internal_control_and_handling_compliance
   (and internal_control_and_audit_ok internal_handling_ok)))

; [insurance:violation_of_internal_control_or_handling] 違反內部控制、稽核或內部處理制度規定
(assert (not (= internal_control_and_handling_compliance
        violation_of_internal_control_or_handling)))

; [insurance:foreign_investment_limit_compliance] 國外投資總額不超過主管機關核定最高限額且符合投資規範
(assert (= foreign_investment_limit_compliance
   (and (<= foreign_investment_total foreign_investment_limit)
        foreign_investment_compliance)))

; [insurance:exclusion_of_certain_shares_in_calculation] 計算同一人或同一關係人持股時排除證券商承銷期間股份、金融機構承受擔保品未滿四年股份及繼承或遺贈未滿二年股份
(assert (= exclusion_of_certain_shares_in_calculation
   (and (not shares_held_during_underwriting_period)
        (not shares_held_due_to_collateral_under_4_years)
        (not shares_held_due_to_inheritance_under_2_years))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一保險法相關規定時處罰
(assert (= penalty
   (or (not article_143_complied)
       (not reserve_rules_complied)
       loan_without_board_approval
       (not exclusion_of_certain_shares_in_calculation)
       (not business_scope_rules_complied)
       (not internal_control_and_handling_compliance)
       (not loan_and_transaction_limits_complied)
       (not fund_usage_rules_complied)
       (not loan_other_transaction_limit_compliance)
       (not loan_sufficient_collateral)
       (not reserve_calculation_and_recording)
       (not foreign_investment_limit_compliance)
       (not article_143_5_and_143_6_measures_complied))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= loan_without_board_approval true))
(assert (= violation_of_loan_and_transaction_limits true))
(assert (= loan_and_transaction_limits_complied false))
(assert (= business_scope_rules_complied false))
(assert (= violation_of_business_scope_rules true))
(assert (= reserve_rules_complied false))
(assert (= violation_of_reserve_rules true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_ok false))
(assert (= internal_control_and_handling_compliance false))
(assert (= violation_of_internal_control_or_handling true))
(assert (= foreign_investment_total 4.0))
(assert (= foreign_investment_limit 3.0))
(assert (= foreign_investment_compliance false))
(assert (= foreign_investment_limit_compliance false))
(assert (= fund_usage_rules_complied false))
(assert (= violation_of_fund_usage_rules true))
(assert (= article_143_complied true))
(assert (= article_143_5_and_143_6_measures_complied true))
(assert (= exclusion_of_certain_shares_in_calculation true))
(assert (= loan_sufficient_collateral true))
(assert (= penalty true))
(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 3.0 5.0)))
(assert (= business_year_end 1))
(assert (= reserve_calculated false))
(assert (= reserve_recorded_in_special_ledger false))
(assert (= reserve_calculation_and_recording false))
(assert (= capital_level 2))
(assert (= capital_level_severely_insufficient false))
(assert (= financial_or_business_condition_deteriorated false))
(assert (= unable_to_pay_debts_or_fulfill_contracts false))
(assert (= risk_to_insured_rights false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 24
; Total variables: 71
; Total facts: 37
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
