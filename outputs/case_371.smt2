; SMT2 file generated from compliance case automatic
; Case ID: case_371
; Generated at: 2025-10-21T22:27:07.871531
;
; This file can be executed with Z3:
;   z3 case_371.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration Bool)
(declare-const accelerated_deterioration_and_no_improvement Bool)
(declare-const annual_regular_audit_done Bool)
(declare-const audit_report_retention_years Int)
(declare-const audit_training_plan_implemented Bool)
(declare-const board_approval Bool)
(declare-const board_authorization_submitted Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_funds Real)
(declare-const capital_level Int)
(declare-const capital_level_1_adequate Bool)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficiency Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const compliance_statement_submitted Bool)
(declare-const compliance_with_internal_control_and_handling Bool)
(declare-const derivative_trading_approval_submitted Bool)
(declare-const derivative_trading_procedure_approved Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const insufficient_and_no_measures Bool)
(declare-const internal_audit_report_retained Bool)
(declare-const internal_audit_system_created Bool)
(declare-const internal_audit_system_established Bool)
(declare-const internal_audit_training_plan_established Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const legal_violations_fines Bool)
(declare-const loan_and_other_transaction_limits_ok Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const personnel_experience_proof_submitted Bool)
(declare-const project_audit_done_as_needed Bool)
(declare-const real_estate_investment_limits_ok Bool)
(declare-const real_estate_investment_meets_internal_procedures Bool)
(declare-const real_estate_investment_special_cases_ok Bool)
(declare-const real_estate_investment_total Real)
(declare-const regulatory_action_required Bool)
(declare-const risk_management_policy_submitted Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const self_use_real_estate_total Real)
(declare-const severe_insufficiency_and_no_measures Bool)
(declare-const significant_deterioration_and_no_measures Bool)
(declare-const single_transaction_amount Real)
(declare-const social_housing_rental_only Bool)
(declare-const total_transaction_amount Real)
(declare-const trading_procedure_submitted Bool)
(declare-const transaction_object_is_government_or_public Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const violate_article_143 Bool)
(declare-const violate_article_143_5_or_143_6_measures Bool)
(declare-const violate_business_scope_regulations Bool)
(declare-const violate_fund_usage_regulations Bool)
(declare-const violate_internal_control_penalty Bool)
(declare-const violate_loan_guarantee_regulations Bool)
(declare-const violate_loan_limit_regulations Bool)
(declare-const violate_reserve_fund_regulations Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficiency] 資本等級嚴重不足判定
(assert (= capital_level_severe_insufficiency
   (or (not (<= 0.0 net_worth)) (not (<= 50.0 capital_adequacy_ratio)))))

; [insurance:capital_level_significant_deterioration] 資本等級顯著惡化判定
(assert (= capital_level_significant_deterioration
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級不足判定
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級適足判定
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著惡化, 4=嚴重不足, 0=未分類）
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

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_level_4_measures_executed capital_level_4_measures_completed))

; [insurance:capital_level_3_measures_executed] 資本顯著惡化等級措施已執行
(assert (= capital_level_3_measures_executed capital_level_3_measures_completed))

; [insurance:capital_level_2_measures_executed] 資本不足等級措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:capital_level_1_adequate] 資本適足等級
(assert (= capital_level_1_adequate capital_level_adequate))

; [insurance:severe_insufficiency_and_no_measures] 資本嚴重不足且未完成增資、改善計畫或合併
(assert (= severe_insufficiency_and_no_measures
   (and (= 4 capital_level) (not capital_level_4_measures_executed))))

; [insurance:significant_deterioration_and_no_measures] 資本顯著惡化且未完成改善計畫
(assert (= significant_deterioration_and_no_measures
   (and (= 3 capital_level) (not capital_level_3_measures_executed))))

; [insurance:insufficient_and_no_measures] 資本不足且未完成改善計畫
(assert (= insufficient_and_no_measures
   (and (= 2 capital_level) (not capital_level_2_measures_executed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or unable_to_pay_debt risk_to_insured_rights unable_to_fulfill_contract)))

; [insurance:improvement_plan_submitted_and_approved] 已提出並經主管機關核定財務或業務改善計畫
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:accelerated_deterioration_and_no_improvement] 損益、淨值加速惡化且經輔導仍未改善
(assert (= accelerated_deterioration_and_no_improvement
   (and accelerated_deterioration (not improvement_plan_executed))))

; [insurance:regulatory_action_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= regulatory_action_required
   (or severe_insufficiency_and_no_measures
       (and (not severe_insufficiency_and_no_measures)
            financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            accelerated_deterioration_and_no_improvement))))

; [insurance:internal_control_and_audit_ok] 建立內部控制及稽核制度且確實執行
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:derivative_trading_approval_submitted] 衍生性金融商品交易申請核准文件已提交
(assert (= derivative_trading_approval_submitted
   (and compliance_statement_submitted
        board_authorization_submitted
        personnel_experience_proof_submitted
        trading_procedure_submitted
        risk_management_policy_submitted)))

; [insurance:derivative_trading_procedure_approved] 衍生性金融商品交易處理程序經董（理）事會通過
(assert (= derivative_trading_procedure_approved board_approval))

; [insurance:loan_and_other_transaction_limits_ok] 同一人、同一關係人或同一關係企業之放款及其他交易限額符合規定
(assert (let ((a!1 (and (or (<= single_transaction_amount (* (/ 7.0 20.0) owner_equity))
                    transaction_object_is_government_or_public)
                (or transaction_object_is_government_or_public
                    (<= total_transaction_amount (* (/ 7.0 10.0) owner_equity)))
                (or (<= 100000000.0 single_transaction_amount)
                    (>= 100000000.0 single_transaction_amount))
                (or (<= 200000000.0 total_transaction_amount)
                    (>= 200000000.0 total_transaction_amount)))))
  (= loan_and_other_transaction_limits_ok a!1)))

; [insurance:real_estate_investment_limits_ok] 不動產投資限額符合規定
(assert (= real_estate_investment_limits_ok
   (and (<= real_estate_investment_total (* (/ 3.0 10.0) capital_funds))
        (<= self_use_real_estate_total owner_equity))))

; [insurance:real_estate_investment_special_cases_ok] 不動產投資特殊情形符合規定
(assert (= real_estate_investment_special_cases_ok
   (or social_housing_rental_only
       real_estate_investment_meets_internal_procedures)))

; [insurance:internal_audit_system_established] 建立自行查核制度且執行
(assert (= internal_audit_system_established
   (and internal_audit_system_created
        annual_regular_audit_done
        project_audit_done_as_needed)))

; [insurance:internal_audit_report_retained] 自行查核報告及工作底稿至少保存五年
(assert (= internal_audit_report_retained (<= 5 audit_report_retention_years)))

; [insurance:internal_audit_training_plan_established] 訂定自行查核訓練計畫並持續施訓
(assert (= internal_audit_training_plan_established audit_training_plan_implemented))

; [insurance:compliance_with_internal_control_and_handling] 符合內部控制及稽核制度與內部處理制度規定
(assert (= compliance_with_internal_control_and_handling
   (and internal_control_and_audit_ok internal_handling_ok)))

; [insurance:legal_violations_fines] 違反相關法令規定之罰鍰處分
(assert (= legal_violations_fines
   (or violate_loan_guarantee_regulations
       violate_loan_limit_regulations
       violate_article_143
       violate_reserve_fund_regulations
       violate_business_scope_regulations
       violate_article_143_5_or_143_6_measures
       violate_fund_usage_regulations)))

; [insurance:violate_internal_control_penalty] 違反內部控制及稽核制度規定罰鍰
(assert (= violate_internal_control_penalty
   (or (not internal_control_and_audit_ok) (not internal_handling_ok))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或資本顯著惡化且未完成改善計畫，或資本不足且未完成改善計畫，或違反內部控制及稽核制度規定，或違反相關法令規定時處罰
(assert (= penalty
   (or (not internal_control_and_audit_ok)
       (and (= 3 capital_level) (not capital_level_3_measures_executed))
       (and (= 2 capital_level) (not capital_level_2_measures_executed))
       (and (= 4 capital_level) (not capital_level_4_measures_executed))
       legal_violations_fines)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 1000000))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_funds 5000000))
(assert (= owner_equity 3000000))
(assert (= real_estate_investment_total 2000000))
(assert (= self_use_real_estate_total 3500000))
(assert (= single_transaction_amount 200000000))
(assert (= total_transaction_amount 400000000))
(assert (= transaction_object_is_government_or_public false))
(assert (= compliance_statement_submitted false))
(assert (= board_authorization_submitted false))
(assert (= personnel_experience_proof_submitted false))
(assert (= trading_procedure_submitted false))
(assert (= risk_management_policy_submitted false))
(assert (= board_approval false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= legal_violations_fines true))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_executed false))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level_4_measures_executed false))
(assert (= capital_level_3_measures_completed false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_2_measures_executed false))
(assert (= financial_or_business_deterioration true))
(assert (= risk_to_insured_rights true))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= accelerated_deterioration false))
(assert (= audit_report_retention_years 3))
(assert (= annual_regular_audit_done false))
(assert (= audit_training_plan_implemented false))
(assert (= internal_audit_system_created false))
(assert (= project_audit_done_as_needed false))
(assert (= internal_audit_report_retained false))
(assert (= internal_audit_training_plan_established false))
(assert (= internal_audit_system_established false))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_ok false))
(assert (= compliance_with_internal_control_and_handling false))
(assert (= derivative_trading_approval_submitted false))
(assert (= derivative_trading_procedure_approved false))
(assert (= loan_and_other_transaction_limits_ok false))
(assert (= real_estate_investment_limits_ok false))
(assert (= real_estate_investment_meets_internal_procedures false))
(assert (= real_estate_investment_special_cases_ok false))
(assert (= social_housing_rental_only false))
(assert (= violate_internal_control_penalty true))
(assert (= violate_business_scope_regulations true))
(assert (= violate_reserve_fund_regulations false))
(assert (= violate_article_143 false))
(assert (= violate_article_143_5_or_143_6_measures false))
(assert (= violate_fund_usage_regulations false))
(assert (= violate_loan_guarantee_regulations false))
(assert (= violate_loan_limit_regulations false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 31
; Total variables: 73
; Total facts: 61
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
