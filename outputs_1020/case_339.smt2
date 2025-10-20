; SMT2 file generated from compliance case automatic
; Case ID: case_339
; Generated at: 2025-10-19T13:32:49.078005
;
; This file can be executed with Z3:
;   z3 case_339.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_foreign_currency_securities_investment_excluded Bool)
(declare-const approved_foreign_insurance_related_investment_excluded Bool)
(declare-const approved_non_investment_foreign_currency_insurance_amount_excluded Bool)
(declare-const blood_relation_degree Int)
(declare-const company_law_related_enterprise Bool)
(declare-const financial_institution_shares_excluded Bool)
(declare-const foreign_investment_amount Real)
(declare-const foreign_investment_exclusions_ok Bool)
(declare-const foreign_investment_limit_ok Bool)
(declare-const inheritance_shares_excluded Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_handling_system_and_procedure_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const is_business_responsible_by_self_or_spouse Bool)
(declare-const is_self Bool)
(declare-const is_spouse Bool)
(declare-const loan_and_other_transaction_limit Real)
(declare-const loan_guarantee_no_board_approval Bool)
(declare-const loan_guarantee_without_board_approval Bool)
(declare-const loan_limit_imposed Bool)
(declare-const loan_no_sufficient_collateral_or_better_terms Bool)
(declare-const loan_without_sufficient_collateral Bool)
(declare-const other_approved_exclusions Bool)
(declare-const other_transaction_limit_imposed Bool)
(declare-const penalty Bool)
(declare-const person_type Int)
(declare-const related_person_defined Bool)
(declare-const related_person_other_transaction_limit Real)
(declare-const reserve_calculated Bool)
(declare-const reserve_calculated_and_recorded Bool)
(declare-const reserve_recorded_in_special_ledger Bool)
(declare-const same_person Bool)
(declare-const same_related_enterprise Bool)
(declare-const same_related_person Bool)
(declare-const shareholding_exclusion_applied Bool)
(declare-const total_funds Real)
(declare-const underwriting_shares_excluded Bool)
(declare-const violate_article_138_2_and_138_3_rules Bool)
(declare-const violate_article_138_rules Bool)
(declare-const violate_article_143 Bool)
(declare-const violate_article_143_5_or_143_6_measures Bool)
(declare-const violate_article_146_7_loan_transaction_limits Bool)
(declare-const violate_article_146_fund_management Bool)
(declare-const violate_internal_control_or_audit Bool)
(declare-const violate_internal_handling_system Bool)
(declare-const violation_article_143 Bool)
(declare-const violation_article_143_5_6 Bool)
(declare-const violation_business_scope Bool)
(declare-const violation_fund_management Bool)
(declare-const violation_internal_control_and_handling Bool)
(declare-const violation_loan_transaction_limits Bool)
(declare-const violation_reserve_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:same_person_definition] 同一人定義為同一自然人或同一法人
(assert (= same_person (or (= 1 person_type) (= 2 person_type))))

; [insurance:same_related_person_definition] 同一關係人範圍包含本人、配偶、二親等以內血親及以本人或配偶為負責人之事業
(assert (= same_related_person
   (or is_self
       is_spouse
       is_business_responsible_by_self_or_spouse
       (>= 2 blood_relation_degree))))

; [insurance:same_related_enterprise_definition] 同一關係企業範圍依公司法相關條文規定
(assert (= same_related_enterprise company_law_related_enterprise))

; [insurance:loan_and_other_transaction_limit_applicable] 主管機關得對保險業就同一人、同一關係人或同一關係企業之放款或其他交易予以限制
(assert (= loan_and_other_transaction_limit
   (ite (or loan_limit_imposed other_transaction_limit_imposed) 1.0 0.0)))

; [insurance:related_person_and_transaction_limit] 主管機關得對保險業與利害關係人從事放款以外之其他交易予以限制
(assert (= related_person_other_transaction_limit
   (ite (and related_person_defined other_transaction_limit_imposed) 1.0 0.0)))

; [insurance:violation_of_business_scope_rules] 違反第一百三十八條相關業務範圍規定
(assert (= violation_business_scope violate_article_138_rules))

; [insurance:violation_of_reserve_rules] 違反第一百三十八條之二及第一百三十八條之三有關賠償準備金提存額度及方式規定
(assert (= violation_reserve_rules violate_article_138_2_and_138_3_rules))

; [insurance:violation_of_article_143] 違反第一百四十三條規定
(assert (= violation_article_143 violate_article_143))

; [insurance:violation_of_article_143_5_and_143_6_measures] 違反第一百四十三條之五或主管機關依第一百四十三條之六規定所為措施
(assert (= violation_article_143_5_6 violate_article_143_5_or_143_6_measures))

; [insurance:violation_of_fund_management_rules] 違反第一百四十六條相關資金運用規定
(assert (= violation_fund_management violate_article_146_fund_management))

; [insurance:loan_without_sufficient_collateral] 依第一百四十六條之三或第一百四十六條之八規定放款無十足擔保或條件優於其他同類放款對象
(assert (= loan_without_sufficient_collateral
   loan_no_sufficient_collateral_or_better_terms))

; [insurance:loan_guarantee_without_board_approval] 擔保放款達主管機關規定金額以上，未經董事會三分之二以上董事出席及四分之三以上同意
(assert (= loan_guarantee_without_board_approval loan_guarantee_no_board_approval))

; [insurance:violation_of_loan_and_transaction_limits] 違反第一百四十六條之七有關放款或其他交易限額及決議程序規定
(assert (= violation_loan_transaction_limits
   violate_article_146_7_loan_transaction_limits))

; [insurance:reserve_calculation_and_recording] 保險業於營業年度屆滿時計算應提存準備金並記載於特設帳簿
(assert (= reserve_calculated_and_recorded
   (and reserve_calculated reserve_recorded_in_special_ledger)))

; [insurance:internal_control_and_audit_established] 保險業建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   internal_control_and_audit_system_established))

; [insurance:internal_handling_system_established] 保險業建立內部處理制度及程序
(assert (= internal_handling_system_established
   internal_handling_system_and_procedure_established))

; [insurance:violation_of_internal_control_and_handling] 違反第一百四十八條之一及相關規定未建立或未執行內部控制、稽核及處理制度
(assert (= violation_internal_control_and_handling
   (or violate_internal_control_or_audit violate_internal_handling_system)))

; [insurance:foreign_investment_limit] 保險業國外投資總額不得超過資金45%，特定項目不計入限額
(assert (= foreign_investment_limit_ok
   (<= foreign_investment_amount (* (/ 9.0 20.0) total_funds))))

; [insurance:foreign_investment_exclusions] 特定投資金額不計入國外投資限額
(assert (= foreign_investment_exclusions_ok
   (and approved_non_investment_foreign_currency_insurance_amount_excluded
        approved_foreign_currency_securities_investment_excluded
        approved_foreign_insurance_related_investment_excluded
        other_approved_exclusions)))

; [insurance:shareholding_exclusion] 計算同一人或同一關係人持有股份時排除特定情形所持股份
(assert (= shareholding_exclusion_applied
   (and underwriting_shares_excluded
        financial_institution_shares_excluded
        inheritance_shares_excluded)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一保險法相關規定時處罰
(assert (= penalty
   (or (not internal_control_and_audit_established)
       violation_reserve_rules
       (not foreign_investment_limit_ok)
       (not foreign_investment_exclusions_ok)
       violation_internal_control_and_handling
       violation_loan_transaction_limits
       violation_article_143_5_6
       (not reserve_calculated_and_recorded)
       (not shareholding_exclusion_applied)
       (not internal_handling_system_established)
       violation_business_scope
       violation_article_143
       violation_fund_management
       loan_without_sufficient_collateral
       loan_guarantee_without_board_approval)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_article_138_rules true))
(assert (= violate_article_138_2_and_138_3_rules true))
(assert (= violate_article_146_fund_management true))
(assert (= violate_internal_control_or_audit true))
(assert (= violate_article_143 false))
(assert (= violate_article_143_5_or_143_6_measures false))
(assert (= loan_guarantee_no_board_approval false))
(assert (= loan_no_sufficient_collateral_or_better_terms false))
(assert (= violate_article_146_7_loan_transaction_limits false))
(assert (= reserve_calculated true))
(assert (= reserve_recorded_in_special_ledger true))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_handling_system_and_procedure_established false))
(assert (= approved_non_investment_foreign_currency_insurance_amount_excluded true))
(assert (= approved_foreign_currency_securities_investment_excluded true))
(assert (= approved_foreign_insurance_related_investment_excluded true))
(assert (= other_approved_exclusions true))
(assert (= foreign_investment_amount (/ 1.0 25.0)))
(assert (= total_funds 1.0))
(assert (= foreign_investment_limit_ok false))
(assert (= foreign_investment_exclusions_ok true))
(assert (= underwriting_shares_excluded true))
(assert (= financial_institution_shares_excluded true))
(assert (= inheritance_shares_excluded true))
(assert (= shareholding_exclusion_applied true))
(assert (= same_person true))
(assert (= person_type 2))
(assert (= is_self true))
(assert (= is_spouse false))
(assert (= blood_relation_degree 0))
(assert (= is_business_responsible_by_self_or_spouse false))
(assert (= same_related_person true))
(assert (= company_law_related_enterprise false))
(assert (= same_related_enterprise false))
(assert (= related_person_defined true))
(assert (= loan_limit_imposed false))
(assert (= other_transaction_limit_imposed true))
(assert (= loan_and_other_transaction_limit 1.0))
(assert (= related_person_other_transaction_limit 1.0))
(assert (= loan_guarantee_without_board_approval false))
(assert (= loan_without_sufficient_collateral false))
(assert (= reserve_calculated_and_recorded true))
(assert (= internal_control_and_audit_established false))
(assert (= internal_handling_system_established false))
(assert (= violation_business_scope true))
(assert (= violation_reserve_rules true))
(assert (= violation_fund_management true))
(assert (= violation_internal_control_and_handling true))
(assert (= violation_loan_transaction_limits false))
(assert (= violation_article_143 false))
(assert (= violation_article_143_5_6 false))
(assert (= penalty true))
(assert (= violate_internal_handling_system false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 53
; Total facts: 53
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
