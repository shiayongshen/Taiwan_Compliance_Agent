; SMT2 file generated from compliance case automatic
; Case ID: case_148
; Generated at: 2025-10-21T21:30:39.116973
;
; This file can be executed with Z3:
;   z3 case_148.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const deposit_limit_approved_by_authority Bool)
(declare-const deposit_limit_per_financial_institution_ok Bool)
(declare-const deposit_per_financial_institution Real)
(declare-const derivative_trading_compliant Bool)
(declare-const derivative_trading_regulation_compliance Bool)
(declare-const full_discretionary_investment_compliance Bool)
(declare-const full_discretionary_investment_licensed Bool)
(declare-const funds_usage_limited_to_specified Bool)
(declare-const funds_used_in_approved_projects Bool)
(declare-const funds_used_in_derivative_trading Bool)
(declare-const funds_used_in_foreign_investment Bool)
(declare-const funds_used_in_insurance_related_business Bool)
(declare-const funds_used_in_loans Bool)
(declare-const funds_used_in_other_approved_usage Bool)
(declare-const funds_used_in_real_estate Bool)
(declare-const funds_used_in_securities Bool)
(declare-const insurance_related_business_compliant Bool)
(declare-const insurance_related_business_definition_ok Bool)
(declare-const investment_insurance_bookkeeping_compliant Bool)
(declare-const investment_insurance_bookkeeping_exemption Bool)
(declare-const investment_insurance_business_bookkeeping_exemption_ok Bool)
(declare-const investment_insurance_business_bookkeeping_ok Bool)
(declare-const loan_guarantee_board_approval Bool)
(declare-const loan_guarantee_board_approval_flag Bool)
(declare-const loan_unsecured_or_better_condition Bool)
(declare-const loan_unsecured_or_better_condition_flag Bool)
(declare-const owner_equity_total Real)
(declare-const penalty Bool)
(declare-const policyholder_full_discretionary_investment Bool)
(declare-const real_estate_acquisition_valuation_ok Bool)
(declare-const real_estate_investment_internal_procedure_compliant Bool)
(declare-const real_estate_investment_internal_procedure_ok Bool)
(declare-const real_estate_investment_limit_ok Bool)
(declare-const real_estate_investment_social_housing_exemption Bool)
(declare-const real_estate_total_investment Real)
(declare-const real_estate_valuation_by_legal_institution Bool)
(declare-const self_use_real_estate_investment Bool)
(declare-const social_housing_only_for_rent Bool)
(declare-const total_funds Real)
(declare-const violation_138_2_reserve Real)
(declare-const violation_138_2_reserve_flag Bool)
(declare-const violation_138_scope Bool)
(declare-const violation_138_scope_flag Bool)
(declare-const violation_143 Bool)
(declare-const violation_143_5_or_measures Bool)
(declare-const violation_143_5_or_measures_flag Bool)
(declare-const violation_143_flag Bool)
(declare-const violation_146_1_investment Bool)
(declare-const violation_146_1_investment_flag Bool)
(declare-const violation_146_2_real_estate Bool)
(declare-const violation_146_2_real_estate_flag Bool)
(declare-const violation_146_3 Bool)
(declare-const violation_146_3_flag Bool)
(declare-const violation_146_4 Bool)
(declare-const violation_146_4_flag Bool)
(declare-const violation_146_5_investment_approval Bool)
(declare-const violation_146_5_investment_approval_flag Bool)
(declare-const violation_146_6_reporting Bool)
(declare-const violation_146_6_reporting_flag Bool)
(declare-const violation_146_7_loan_limit_resolution Bool)
(declare-const violation_146_7_loan_limit_resolution_flag Bool)
(declare-const violation_146_9 Bool)
(declare-const violation_146_9_flag Bool)
(declare-const violation_146_book_investment Bool)
(declare-const violation_146_book_investment_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_138_scope] 違反138條第1、3、5項業務範圍規定
(assert (= violation_138_scope violation_138_scope_flag))

; [insurance:violation_138_2_reserve] 違反138-2條第2、4、5、7項及138-3條第1、2、3項賠償準備金提存額度及方式規定
(assert (= violation_138_2_reserve (ite violation_138_2_reserve_flag 1.0 0.0)))

; [insurance:violation_143] 違反143條規定
(assert (= violation_143 violation_143_flag))

; [insurance:violation_143_5_or_measures] 違反143-5條或主管機關依143-6條規定所為措施
(assert (= violation_143_5_or_measures violation_143_5_or_measures_flag))

; [insurance:violation_146_book_investment] 違反146條第1、3、5、6、7項專設帳簿管理及投資資產運用規定，或第8項衍生性商品交易規定
(assert (= violation_146_book_investment violation_146_book_investment_flag))

; [insurance:violation_146_1_investment] 違反146-1條第1、2、3、5項投資條件及規範，或146-5條第3、4項規定
(assert (= violation_146_1_investment violation_146_1_investment_flag))

; [insurance:violation_146_2_real_estate] 違反146-2條第1、2、4項不動產投資條件限制規定
(assert (= violation_146_2_real_estate violation_146_2_real_estate_flag))

; [insurance:violation_146_3] 違反146-3條第1、2、4項規定
(assert (= violation_146_3 violation_146_3_flag))

; [insurance:violation_146_4] 違反146-4條第1、2、3項投資規範及投資額度規定
(assert (= violation_146_4 violation_146_4_flag))

; [insurance:violation_146_5_investment_approval] 違反146-5條第一項前段未經核准投資或未具備文件程序，或後段運用投資範圍限額規定
(assert (= violation_146_5_investment_approval violation_146_5_investment_approval_flag))

; [insurance:violation_146_6_reporting] 違反146-6條第1、2、3項投資申報方式規定
(assert (= violation_146_6_reporting violation_146_6_reporting_flag))

; [insurance:violation_146_9] 違反146-9條第1、2、3項規定
(assert (= violation_146_9 violation_146_9_flag))

; [insurance:loan_unsecured_or_better_condition] 依146-3條第3項或146-8條第1項規定放款無十足擔保或條件優於同類放款
(assert (= loan_unsecured_or_better_condition loan_unsecured_or_better_condition_flag))

; [insurance:loan_guarantee_board_approval] 依146-3條第3項或146-8條第1項規定擔保放款未經董事會三分之二出席及四分之三同意或違反放款限額規定
(assert (= loan_guarantee_board_approval loan_guarantee_board_approval_flag))

; [insurance:violation_146_7_loan_limit_resolution] 違反146-7條第1項放款或交易限額規定，或第3項決議程序或限額規定
(assert (= violation_146_7_loan_limit_resolution
   violation_146_7_loan_limit_resolution_flag))

; [insurance:real_estate_investment_limit_ok] 不動產投資總額除自用不動產外不超過資金30%，自用不動產不超過業主權益總額
(assert (let ((a!1 (<= (+ real_estate_total_investment
                  (* (- 1.0) (ite self_use_real_estate_investment 1.0 0.0)))
               (* (/ 3.0 10.0) total_funds))))
  (= real_estate_investment_limit_ok
     (and a!1
          (>= owner_equity_total (ite self_use_real_estate_investment 1.0 0.0))))))

; [insurance:real_estate_acquisition_valuation_ok] 不動產取得及處分經合法鑑價機構評價
(assert (= real_estate_acquisition_valuation_ok
   real_estate_valuation_by_legal_institution))

; [insurance:real_estate_investment_social_housing_exemption] 依住宅法興辦社會住宅且僅供租賃者，不受即時利用並有收益限制
(assert (= real_estate_investment_social_housing_exemption social_housing_only_for_rent))

; [insurance:real_estate_investment_internal_procedure_ok] 依主管機關定之辦法辦理不動產投資內部處理程序及條件限制等事項
(assert (= real_estate_investment_internal_procedure_ok
   real_estate_investment_internal_procedure_compliant))

; [insurance:funds_usage_limited_to_specified] 保險業資金運用限於法定項目
(assert (= funds_usage_limited_to_specified
   (and funds_used_in_securities
        funds_used_in_real_estate
        funds_used_in_loans
        funds_used_in_approved_projects
        funds_used_in_foreign_investment
        funds_used_in_insurance_related_business
        funds_used_in_derivative_trading
        funds_used_in_other_approved_usage)))

; [insurance:deposit_limit_per_financial_institution_ok] 存款於每一金融機構金額不超過資金10%，除經主管機關核准
(assert (= deposit_limit_per_financial_institution_ok
   (or (<= deposit_per_financial_institution (* (/ 1.0 10.0) total_funds))
       deposit_limit_approved_by_authority)))

; [insurance:insurance_related_business_definition_ok] 保險相關事業定義符合主管機關認定範圍
(assert (= insurance_related_business_definition_ok
   insurance_related_business_compliant))

; [insurance:investment_insurance_business_bookkeeping_ok] 投資型保險業務專設帳簿記載投資資產價值
(assert (= investment_insurance_business_bookkeeping_ok
   investment_insurance_bookkeeping_compliant))

; [insurance:investment_insurance_business_bookkeeping_exemption_ok] 投資型保險業務專設帳簿管理不受特定條文限制
(assert (= investment_insurance_business_bookkeeping_exemption_ok
   investment_insurance_bookkeeping_exemption))

; [insurance:full_discretionary_investment_compliance] 要保人委任保險業全權決定運用標的且運用於證券交易法第6條有價證券，依法申請兼營全權委託投資業務
(assert (= full_discretionary_investment_compliance
   (or full_discretionary_investment_licensed
       (not policyholder_full_discretionary_investment))))

; [insurance:derivative_trading_regulation_compliance] 依主管機關定之辦法遵守衍生性商品交易條件、範圍、限額及內部程序
(assert (= derivative_trading_regulation_compliance derivative_trading_compliant))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or violation_146_9
       violation_146_4
       violation_146_5_investment_approval
       loan_unsecured_or_better_condition
       violation_146_2_real_estate
       violation_143
       (= violation_138_2_reserve 1.0)
       violation_138_scope
       violation_146_1_investment
       violation_146_6_reporting
       violation_146_7_loan_limit_resolution
       violation_146_book_investment
       loan_guarantee_board_approval
       violation_146_3
       violation_143_5_or_measures)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_146_2_real_estate_flag true))
(assert (= violation_146_2_real_estate true))
(assert (= violation_138_scope_flag false))
(assert (= violation_138_scope false))
(assert (= violation_138_2_reserve_flag false))
(assert (= violation_138_2_reserve 0))
(assert (= violation_143_flag false))
(assert (= violation_143 false))
(assert (= violation_143_5_or_measures_flag false))
(assert (= violation_143_5_or_measures false))
(assert (= violation_146_book_investment_flag false))
(assert (= violation_146_book_investment false))
(assert (= violation_146_1_investment_flag false))
(assert (= violation_146_1_investment false))
(assert (= violation_146_3_flag false))
(assert (= violation_146_3 false))
(assert (= violation_146_4_flag false))
(assert (= violation_146_4 false))
(assert (= violation_146_5_investment_approval_flag false))
(assert (= violation_146_5_investment_approval false))
(assert (= violation_146_6_reporting_flag false))
(assert (= violation_146_6_reporting false))
(assert (= violation_146_9_flag false))
(assert (= violation_146_9 false))
(assert (= loan_unsecured_or_better_condition_flag false))
(assert (= loan_unsecured_or_better_condition false))
(assert (= loan_guarantee_board_approval_flag false))
(assert (= loan_guarantee_board_approval false))
(assert (= violation_146_7_loan_limit_resolution_flag false))
(assert (= violation_146_7_loan_limit_resolution false))
(assert (= deposit_limit_approved_by_authority false))
(assert (= deposit_limit_per_financial_institution_ok true))
(assert (= deposit_per_financial_institution 0.0))
(assert (= derivative_trading_compliant true))
(assert (= derivative_trading_regulation_compliance true))
(assert (= full_discretionary_investment_compliance true))
(assert (= full_discretionary_investment_licensed true))
(assert (= funds_usage_limited_to_specified true))
(assert (= funds_used_in_approved_projects true))
(assert (= funds_used_in_derivative_trading true))
(assert (= funds_used_in_foreign_investment true))
(assert (= funds_used_in_insurance_related_business true))
(assert (= funds_used_in_loans true))
(assert (= funds_used_in_other_approved_usage true))
(assert (= funds_used_in_real_estate true))
(assert (= funds_used_in_securities true))
(assert (= insurance_related_business_compliant true))
(assert (= insurance_related_business_definition_ok true))
(assert (= investment_insurance_bookkeeping_compliant true))
(assert (= investment_insurance_bookkeeping_exemption false))
(assert (= investment_insurance_business_bookkeeping_exemption_ok false))
(assert (= investment_insurance_business_bookkeeping_ok true))
(assert (= owner_equity_total 1000000000))
(assert (= penalty true))
(assert (= policyholder_full_discretionary_investment false))
(assert (= real_estate_acquisition_valuation_ok true))
(assert (= real_estate_investment_internal_procedure_compliant true))
(assert (= real_estate_investment_internal_procedure_ok true))
(assert (= real_estate_investment_limit_ok true))
(assert (= real_estate_investment_social_housing_exemption false))
(assert (= real_estate_total_investment 300000000))
(assert (= real_estate_valuation_by_legal_institution true))
(assert (= self_use_real_estate_investment false))
(assert (= social_housing_only_for_rent false))
(assert (= total_funds 1000000000))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 65
; Total facts: 65
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
