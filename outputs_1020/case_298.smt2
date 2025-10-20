; SMT2 file generated from compliance case automatic
; Case ID: case_298
; Generated at: 2025-10-19T12:25:04.224821
;
; This file can be executed with Z3:
;   z3 case_298.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const asset_quality_evaluation_system_established Bool)
(declare-const audit_system_established Bool)
(declare-const bad_debt_writeoff_system_established Bool)
(declare-const business_is_bank Bool)
(declare-const business_is_bills_finance Bool)
(declare-const business_is_credit_card Bool)
(declare-const business_is_finance_lease Bool)
(declare-const business_is_financial_holding Bool)
(declare-const business_is_futures Bool)
(declare-const business_is_insurance Bool)
(declare-const business_is_investment_type_insurance_or_pension Bool)
(declare-const business_is_other_approved_by_authority Bool)
(declare-const business_is_securities Bool)
(declare-const business_is_securities_investment_advisory Bool)
(declare-const business_is_securities_investment_trust Bool)
(declare-const business_is_trust Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const collection_management_established Bool)
(declare-const complies_with_derivative_transaction_regulations Bool)
(declare-const deposit_amount_per_financial_institution Real)
(declare-const deposit_limit_approved_by_authority Real)
(declare-const deposit_limit_per_financial_institution Real)
(declare-const derivative_contract_value_for_investment_purpose Real)
(declare-const derivative_contract_value_hedged_expected_investment Real)
(declare-const derivative_contract_value_hedged_invested_assets Real)
(declare-const derivative_contract_value_hedged_specific_liabilities Real)
(declare-const derivative_offsetting_principles_followed Bool)
(declare-const derivative_transaction_compliant Bool)
(declare-const derivative_transaction_limit_compliant Bool)
(declare-const engages_in_derivative_transactions Bool)
(declare-const engages_in_project_investment_or_public_welfare_investment Bool)
(declare-const foreign_derivative_contract_value_for_investment_purpose Real)
(declare-const full_discretionary_investment_license_compliant Bool)
(declare-const has_full_discretionary_investment_license Bool)
(declare-const hedged_expected_investment_value Real)
(declare-const hedged_invested_assets_value Real)
(declare-const hedged_specific_liabilities_value Real)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const independent_board_seats Int)
(declare-const insurance_fund_total Real)
(declare-const insurance_related_business_valid Bool)
(declare-const insurance_representative_board_seats Int)
(declare-const insurance_staff_appointed_as_invested_company_manager Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_handling_compliant Bool)
(declare-const internal_control_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const investment_bookkeeping_compliant Bool)
(declare-const investment_bookkeeping_exempted Bool)
(declare-const investment_in_allowed_categories Bool)
(declare-const investment_in_derivative_transactions Bool)
(declare-const investment_in_foreign_investments Bool)
(declare-const investment_in_insurance_related_business Bool)
(declare-const investment_in_loans Bool)
(declare-const investment_in_other_approved_uses Bool)
(declare-const investment_in_real_estate Bool)
(declare-const investment_in_securities Bool)
(declare-const investment_in_securities_under_securities_law_article_6 Bool)
(declare-const investment_in_special_approved_projects Bool)
(declare-const loan_approval_not_meeting_board_approval Bool)
(declare-const loan_exceeding_limits Bool)
(declare-const loan_guarantee_and_approval_compliance Bool)
(declare-const loan_guarantee_and_approval_compliant Bool)
(declare-const loan_without_full_guarantee_or_better_conditions Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const not_limited_by_specified_articles Bool)
(declare-const overdue_loan_management_established Bool)
(declare-const penalty Bool)
(declare-const policy_sales_and_claims_system_established Bool)
(declare-const policyholder_grants_full_discretionary_investment Bool)
(declare-const project_investment_approval_compliant Bool)
(declare-const project_investment_approved Bool)
(declare-const project_investment_available_for_post_audit Bool)
(declare-const project_investment_governance_compliant Bool)
(declare-const reserve_provision_system_established Bool)
(declare-const single_company_equity_derivative_contract_value Real)
(declare-const special_accounting_book_established Bool)
(declare-const total_board_seats_of_invested_company Int)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:deposit_limit_per_financial_institution] 存款於每一金融機構之金額不得超過保險業資金10%，除非經主管機關核准
(assert (let ((a!1 (ite (or (= deposit_limit_approved_by_authority 1.0)
                    (<= deposit_amount_per_financial_institution
                        (* (/ 1.0 10.0) insurance_fund_total)))
                1.0
                0.0)))
  (= deposit_limit_per_financial_institution a!1)))

; [insurance:investment_allowed_categories] 保險業資金運用限於法定八類項目
(assert (= investment_in_allowed_categories
   (or investment_in_securities
       investment_in_other_approved_uses
       investment_in_special_approved_projects
       investment_in_derivative_transactions
       investment_in_real_estate
       investment_in_insurance_related_business
       investment_in_loans
       investment_in_foreign_investments)))

; [insurance:insurance_related_business_definition] 保險相關事業定義符合主管機關認定範圍
(assert (= insurance_related_business_valid
   (or business_is_other_approved_by_authority
       business_is_credit_card
       business_is_insurance
       business_is_bills_finance
       business_is_financial_holding
       business_is_securities_investment_advisory
       business_is_securities
       business_is_futures
       business_is_bank
       business_is_securities_investment_trust
       business_is_trust
       business_is_finance_lease)))

; [insurance:investment_bookkeeping_requirement] 投資型保險業務應專設帳簿記載投資資產價值
(assert (= investment_bookkeeping_compliant
   (or (not business_is_investment_type_insurance_or_pension)
       special_accounting_book_established)))

; [insurance:investment_bookkeeping_exemption] 專設帳簿管理不受特定條文限制
(assert (= investment_bookkeeping_exempted
   (or (not special_accounting_book_established)
       not_limited_by_specified_articles)))

; [insurance:full_discretionary_investment_requires_license] 要保人委任全權運用且投資於證券交易法第六條有價證券者，須申請兼營全權委託投資業務
(assert (= full_discretionary_investment_license_compliant
   (or (not (and policyholder_grants_full_discretionary_investment
                 investment_in_securities_under_securities_law_article_6))
       has_full_discretionary_investment_license)))

; [insurance:derivative_transaction_regulation_compliance] 從事衍生性商品交易應符合主管機關定之條件及程序
(assert (= derivative_transaction_compliant
   (or complies_with_derivative_transaction_regulations
       (not engages_in_derivative_transactions))))

; [insurance:internal_control_and_audit_established] 保險業建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   (and internal_control_established audit_system_established)))

; [insurance:internal_handling_system_established] 保險業建立內部處理制度及程序
(assert (= internal_handling_system_established
   (and asset_quality_evaluation_system_established
        reserve_provision_system_established
        overdue_loan_management_established
        collection_management_established
        bad_debt_writeoff_system_established
        policy_sales_and_claims_system_established)))

; [insurance:capital_level_classification] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級(4)應執行之措施已完成
(assert (= capital_level_4_measures_executed capital_level_4_measures_completed))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級(3)應執行之措施已完成
(assert (= capital_level_3_measures_executed capital_level_3_measures_completed))

; [insurance:capital_level_2_measures_executed] 資本不足等級(2)應執行之措施已完成
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:loan_guarantee_and_approval_compliance] 放款無十足擔保或條件優於同類放款者，應依法處罰
(assert (not (= (or loan_approval_not_meeting_board_approval
            loan_without_full_guarantee_or_better_conditions
            loan_exceeding_limits)
        loan_guarantee_and_approval_compliant)))

; [insurance:derivative_transaction_limit_compliance] 衍生性金融商品交易限額及沖抵原則符合規定
(assert (= derivative_transaction_limit_compliant
   (and (or (<= derivative_contract_value_hedged_expected_investment
                hedged_expected_investment_value)
            (<= derivative_contract_value_hedged_invested_assets
                hedged_invested_assets_value)
            (<= derivative_contract_value_hedged_specific_liabilities
                hedged_specific_liabilities_value))
        (<= derivative_contract_value_for_investment_purpose
            (* (/ 1.0 20.0) insurance_fund_total))
        (<= foreign_derivative_contract_value_for_investment_purpose
            (* (/ 3.0 100.0) insurance_fund_total))
        (<= single_company_equity_derivative_contract_value
            (* (/ 1.0 200.0) insurance_fund_total))
        derivative_offsetting_principles_followed)))

; [insurance:project_investment_approval_compliance] 專案運用及公共社會福利事業投資應申請核准或備供查核
(assert (= project_investment_approval_compliant
   (or (not engages_in_project_investment_or_public_welfare_investment)
       project_investment_available_for_post_audit
       project_investment_approved)))

; [insurance:project_investment_governance_compliance] 公共及社會福利事業投資治理規定符合
(assert (let ((a!1 (not (>= (to_real insurance_representative_board_seats)
                    (* (/ 1.0 2.0)
                       (to_real total_board_seats_of_invested_company))))))
(let ((a!2 (and (<= (to_real insurance_representative_board_seats)
                    (* (/ 6666667.0 10000000.0)
                       (to_real total_board_seats_of_invested_company)))
                (or a!1 (<= 1 independent_board_seats))
                (not insurance_staff_appointed_as_invested_company_manager))))
  (= project_investment_governance_compliant a!2))))

; [insurance:internal_control_and_handling_compliance] 內部控制及稽核制度與內部處理制度及程序均已建立
(assert (= internal_control_and_handling_compliant
   (and internal_control_and_audit_established
        internal_handling_system_established)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反資金運用限制、內部控制、放款規定、專案投資核准或資本不足措施未執行等情形
(assert (let ((a!1 (or (and (= 4 capital_level) (not capital_level_4_measures_executed))
               (and (= 2 capital_level) (not capital_level_2_measures_executed))
               (and (= 3 capital_level) (not capital_level_3_measures_executed))
               (not (and (= deposit_limit_per_financial_institution 1.0)
                         investment_in_allowed_categories
                         insurance_related_business_valid
                         investment_bookkeeping_compliant
                         full_discretionary_investment_license_compliant
                         derivative_transaction_compliant
                         internal_control_and_handling_compliant
                         loan_guarantee_and_approval_compliance
                         project_investment_approval_compliant
                         project_investment_governance_compliant
                         (<= 1 capital_level))))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= business_is_insurance true))
(assert (= business_is_financial_holding false))
(assert (= business_is_bank false))
(assert (= business_is_bills_finance false))
(assert (= business_is_credit_card false))
(assert (= business_is_finance_lease false))
(assert (= business_is_futures false))
(assert (= business_is_securities false))
(assert (= business_is_securities_investment_trust false))
(assert (= business_is_securities_investment_advisory false))
(assert (= business_is_trust false))
(assert (= business_is_other_approved_by_authority false))
(assert (= business_is_investment_type_insurance_or_pension false))
(assert (= deposit_amount_per_financial_institution 0.0))
(assert (= deposit_limit_approved_by_authority 0.0))
(assert (= deposit_limit_per_financial_institution 1.0))
(assert (= investment_in_securities false))
(assert (= investment_in_real_estate false))
(assert (= investment_in_loans false))
(assert (= investment_in_special_approved_projects false))
(assert (= investment_in_foreign_investments true))
(assert (= investment_in_insurance_related_business false))
(assert (= investment_in_derivative_transactions true))
(assert (= investment_in_other_approved_uses false))
(assert (= insurance_fund_total 1000000000.0))
(assert (= insurance_related_business_valid true))
(assert (= policyholder_grants_full_discretionary_investment false))
(assert (= investment_in_securities_under_securities_law_article_6 false))
(assert (= has_full_discretionary_investment_license false))
(assert (= engages_in_derivative_transactions true))
(assert (= complies_with_derivative_transaction_regulations false))
(assert (= derivative_contract_value_hedged_invested_assets 0.0))
(assert (= hedged_invested_assets_value 0.0))
(assert (= derivative_contract_value_hedged_expected_investment 0.0))
(assert (= hedged_expected_investment_value 0.0))
(assert (= derivative_contract_value_hedged_specific_liabilities 0.0))
(assert (= hedged_specific_liabilities_value 0.0))
(assert (= derivative_contract_value_for_investment_purpose 60000000.0))
(assert (= foreign_derivative_contract_value_for_investment_purpose 40000000.0))
(assert (= single_company_equity_derivative_contract_value 0.0))
(assert (= derivative_offsetting_principles_followed false))
(assert (= project_investment_approved false))
(assert (= project_investment_available_for_post_audit false))
(assert (= engages_in_project_investment_or_public_welfare_investment true))
(assert (= project_investment_approval_compliant false))
(assert (= insurance_representative_board_seats 0))
(assert (= total_board_seats_of_invested_company 0))
(assert (= independent_board_seats 0))
(assert (= insurance_staff_appointed_as_invested_company_manager false))
(assert (= project_investment_governance_compliant false))
(assert (= internal_control_established false))
(assert (= audit_system_established false))
(assert (= internal_control_and_audit_established false))
(assert (= asset_quality_evaluation_system_established false))
(assert (= reserve_provision_system_established false))
(assert (= overdue_loan_management_established false))
(assert (= collection_management_established false))
(assert (= bad_debt_writeoff_system_established false))
(assert (= policy_sales_and_claims_system_established false))
(assert (= internal_handling_system_established false))
(assert (= internal_control_and_handling_compliant false))
(assert (= loan_without_full_guarantee_or_better_conditions true))
(assert (= loan_approval_not_meeting_board_approval true))
(assert (= loan_exceeding_limits false))
(assert (= loan_guarantee_and_approval_compliance false))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100000000.0))
(assert (= net_worth_ratio 5.0))
(assert (= capital_level 1))
(assert (= capital_level_2_measures_executed false))
(assert (= capital_level_3_measures_completed false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level_4_measures_executed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= investment_bookkeeping_compliant false))
(assert (= special_accounting_book_established false))
(assert (= not_limited_by_specified_articles false))
(assert (= investment_bookkeeping_exempted false))
(assert (= penalty true))
(assert (= derivative_transaction_compliant false))
(assert (= derivative_transaction_limit_compliant false))
(assert (= full_discretionary_investment_license_compliant false))
(assert (= investment_in_allowed_categories false))
(assert (= loan_guarantee_and_approval_compliant false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 86
; Total facts: 86
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
