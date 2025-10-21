; SMT2 file generated from compliance case automatic
; Case ID: case_298
; Generated at: 2025-10-21T06:36:29.177629
;
; This file can be executed with Z3:
;   z3 case_298.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const asset_quality_evaluation_system Bool)
(declare-const audit_system_established Bool)
(declare-const bad_debt_writeoff Bool)
(declare-const business_investment_type Bool)
(declare-const business_is_bank Bool)
(declare-const business_is_bills_finance Bool)
(declare-const business_is_credit_card Bool)
(declare-const business_is_finance_lease Bool)
(declare-const business_is_financial_holding Bool)
(declare-const business_is_futures Bool)
(declare-const business_is_insurance Bool)
(declare-const business_is_other_approved_insurance_related Bool)
(declare-const business_is_securities Bool)
(declare-const business_is_securities_investment_advisory Bool)
(declare-const business_is_securities_investment_trust Bool)
(declare-const business_is_trust Bool)
(declare-const collection_management Bool)
(declare-const deposit_amount_per_financial_institution Real)
(declare-const deposit_limit_approved_by_authority Real)
(declare-const deposit_limit_per_financial_institution Real)
(declare-const derivative_transaction_compliant Bool)
(declare-const derivative_transaction_regulations_followed Bool)
(declare-const engage_in_derivative_transactions Bool)
(declare-const exempt_from_specified_articles Bool)
(declare-const full_discretionary_investment_license_compliant Bool)
(declare-const full_discretionary_investment_license_obtained Bool)
(declare-const insurance_fund_total Real)
(declare-const insurance_related_business_valid Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const investment_bookkeeping_compliant Bool)
(declare-const investment_in_allowed_categories Bool)
(declare-const investment_in_derivative_transactions Bool)
(declare-const investment_in_foreign_investments Bool)
(declare-const investment_in_insurance_related_business Bool)
(declare-const investment_in_loans Bool)
(declare-const investment_in_other_approved_uses Bool)
(declare-const investment_in_real_estate Bool)
(declare-const investment_in_securities Bool)
(declare-const investment_in_special_approved_projects Bool)
(declare-const investment_insurance_business Bool)
(declare-const overdue_loan_management Bool)
(declare-const penalty Bool)
(declare-const policy_sales_underwriting_claims_system Bool)
(declare-const policyholder_full_discretionary_investment Bool)
(declare-const reserve_provision_system Bool)
(declare-const special_accounting_book_established Bool)
(declare-const special_accounting_book_exemption Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:deposit_limit_per_financial_institution] 存款於每一金融機構金額不得超過保險業資金10%，除經主管機關核准
(assert (let ((a!1 (ite (or (= deposit_limit_approved_by_authority 1.0)
                    (<= deposit_amount_per_financial_institution
                        (* (/ 1.0 10.0) insurance_fund_total)))
                1.0
                0.0)))
  (= deposit_limit_per_financial_institution a!1)))

; [insurance:investment_in_allowed_categories] 資金運用限於法定八類項目或經主管機關核准之其他運用
(assert (= investment_in_allowed_categories
   (or investment_in_insurance_related_business
       investment_in_loans
       investment_in_real_estate
       investment_in_other_approved_uses
       investment_in_securities
       investment_in_foreign_investments
       investment_in_special_approved_projects
       investment_in_derivative_transactions)))

; [insurance:insurance_related_business_definition] 保險相關事業定義符合主管機關認定範圍
(assert (= insurance_related_business_valid
   (or business_is_financial_holding
       business_is_securities
       business_is_insurance
       business_is_securities_investment_advisory
       business_is_bills_finance
       business_is_other_approved_insurance_related
       business_is_trust
       business_is_finance_lease
       business_is_securities_investment_trust
       business_is_futures
       business_is_credit_card
       business_is_bank)))

; [insurance:investment_bookkeeping_requirement] 投資型保險業務應專設帳簿記載投資資產價值
(assert (= investment_bookkeeping_compliant
   (or special_accounting_book_established
       (not (= business_investment_type investment_insurance_business)))))

; [insurance:investment_bookkeeping_exemption] 專設帳簿管理不受特定條文限制
(assert (= special_accounting_book_exemption
   (or (not special_accounting_book_established) exempt_from_specified_articles)))

; [insurance:full_discretionary_investment_requires_license] 要保人委任全權運用且投資有價證券須申請兼營全權委託投資業務
(assert (= full_discretionary_investment_license_compliant
   (or full_discretionary_investment_license_obtained
       (not (and policyholder_full_discretionary_investment
                 investment_in_securities)))))

; [insurance:derivative_transaction_regulation_compliance] 從事衍生性商品交易符合主管機關規定
(assert (= derivative_transaction_compliant
   (or derivative_transaction_regulations_followed
       (not engage_in_derivative_transactions))))

; [insurance:internal_control_and_audit_established] 建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   (and internal_control_established audit_system_established)))

; [insurance:internal_handling_system_established] 建立內部處理制度及程序
(assert (= internal_handling_system_established
   (and asset_quality_evaluation_system
        reserve_provision_system
        overdue_loan_management
        collection_management
        bad_debt_writeoff
        policy_sales_underwriting_claims_system)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資金運用限制、內部控制、內部處理制度或衍生性商品交易規定時處罰
(assert (= penalty
   (or (not (= deposit_limit_per_financial_institution 1.0))
       (not derivative_transaction_compliant)
       (not internal_handling_system_established)
       (not investment_in_allowed_categories)
       (not insurance_related_business_valid)
       (not internal_control_and_audit_established)
       (not full_discretionary_investment_license_compliant))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= deposit_amount_per_financial_institution 2000000000))
(assert (= insurance_fund_total 10000000000))
(assert (= deposit_limit_approved_by_authority 0))
(assert (= deposit_limit_per_financial_institution 0))
(assert (= investment_in_securities true))
(assert (= investment_in_real_estate false))
(assert (= investment_in_loans true))
(assert (= investment_in_special_approved_projects false))
(assert (= investment_in_foreign_investments true))
(assert (= investment_in_insurance_related_business true))
(assert (= investment_in_derivative_transactions true))
(assert (= investment_in_other_approved_uses false))
(assert (= investment_in_allowed_categories false))
(assert (= engage_in_derivative_transactions true))
(assert (= derivative_transaction_regulations_followed false))
(assert (= derivative_transaction_compliant false))
(assert (= business_is_insurance true))
(assert (= business_is_financial_holding false))
(assert (= business_is_bank false))
(assert (= business_is_bills_finance false))
(assert (= business_is_credit_card false))
(assert (= business_is_finance_lease false))
(assert (= business_is_securities false))
(assert (= business_is_futures false))
(assert (= business_is_securities_investment_trust false))
(assert (= business_is_securities_investment_advisory false))
(assert (= business_is_trust false))
(assert (= business_is_other_approved_insurance_related false))
(assert (= insurance_related_business_valid true))
(assert (= policyholder_full_discretionary_investment false))
(assert (= full_discretionary_investment_license_obtained false))
(assert (= full_discretionary_investment_license_compliant true))
(assert (= business_investment_type true))
(assert (= special_accounting_book_established false))
(assert (= investment_bookkeeping_compliant false))
(assert (= special_accounting_book_exemption false))
(assert (= internal_control_established false))
(assert (= audit_system_established false))
(assert (= internal_control_and_audit_established false))
(assert (= asset_quality_evaluation_system false))
(assert (= reserve_provision_system false))
(assert (= overdue_loan_management false))
(assert (= collection_management false))
(assert (= bad_debt_writeoff false))
(assert (= policy_sales_underwriting_claims_system false))
(assert (= internal_handling_system_established false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 49
; Total facts: 47
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
