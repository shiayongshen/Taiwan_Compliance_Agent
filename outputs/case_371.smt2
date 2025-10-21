; SMT2 file generated from compliance case automatic
; Case ID: case_371
; Generated at: 2025-10-21T08:17:34.347767
;
; This file can be executed with Z3:
;   z3 case_371.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_or_no_improvement Bool)
(declare-const application_submitted Bool)
(declare-const audit_report_retained_5_years Bool)
(declare-const audit_training_plan_established Bool)
(declare-const board_approval_obtained Bool)
(declare-const board_decision_documents_complete Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_plan_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficiency Bool)
(declare-const capital_level_significant_insufficiency Bool)
(declare-const derivative_financial_product_management_compliant Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const funds Real)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_flag Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_executed_flag Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_audit_frequency_per_year Int)
(declare-const internal_audit_system_established Bool)
(declare-const internal_audit_system_implemented Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_established_flag Bool)
(declare-const internal_procedures_established Bool)
(declare-const legal_compliance_evaluation_data_retained_5_years Bool)
(declare-const legal_compliance_evaluation_frequency_per_half_year Int)
(declare-const legal_compliance_evaluation_performed Bool)
(declare-const legal_compliance_evaluation_plan_established Bool)
(declare-const legal_compliance_evaluation_results_reported Bool)
(declare-const loan_and_other_transaction_limits_compliant Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const no_improvement_after_guidance Bool)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const prohibited_acts_without_regulator_consent Bool)
(declare-const public_tender_or_auction Bool)
(declare-const real_estate_investment_limits_compliant Bool)
(declare-const real_estate_transaction_procedures_compliant Bool)
(declare-const regulator_consent_contract_commitment Bool)
(declare-const regulator_consent_other_major_financial_matters Bool)
(declare-const regulator_consent_payment_exceed_limit Bool)
(declare-const regulatory_action_condition Bool)
(declare-const regulatory_action_executed Bool)
(declare-const regulatory_action_taken Bool)
(declare-const required_documents_submitted Bool)
(declare-const risk_management_policies_established Bool)
(declare-const risk_to_insured Bool)
(declare-const severe_insufficiency_penalty_condition Bool)
(declare-const significant_deterioration_condition Bool)
(declare-const single_real_estate_transaction_amount Real)
(declare-const single_transaction_amount Real)
(declare-const statutory_standard Bool)
(declare-const total_real_estate_transaction_amount Real)
(declare-const total_transaction_balance Real)
(declare-const unable_to_pay_debt Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficiency] 資本等級為嚴重不足
(assert (not (= (<= 2 capital_level) capital_level_severe_insufficiency)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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

; [insurance:capital_level_severe_insufficiency] 資本等級為嚴重不足
(assert (= capital_level_severe_insufficiency (= 4 capital_level)))

; [insurance:capital_level_significant_insufficiency] 資本等級為顯著不足
(assert (= capital_level_significant_insufficiency (= 3 capital_level)))

; [insurance:capital_level_insufficient] 資本等級為不足
(assert (= capital_level_insufficient (= 2 capital_level)))

; [insurance:capital_level_adequate] 資本等級為適足
(assert (= capital_level_adequate (= 1 capital_level)))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限完成
(assert (= improvement_plan_completed improvement_plan_submitted))

; [insurance:improvement_plan_executed] 增資、財務或業務改善計畫或合併已執行完成
(assert (= improvement_plan_executed improvement_plan_executed_flag))

; [insurance:severe_insufficiency_penalty_condition] 資本嚴重不足且未於期限完成增資或改善計畫
(assert (= severe_insufficiency_penalty_condition
   (and (= 4 capital_level)
        (or (not improvement_plan_completed) (not improvement_plan_executed)))))

; [insurance:significant_deterioration_condition] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= significant_deterioration_condition
   (and financial_or_business_deterioration
        (or risk_to_insured unable_to_pay_debt))))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_flag))

; [insurance:accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= accelerated_deterioration_or_no_improvement
   (or profit_loss_accelerated_deterioration no_improvement_after_guidance)))

; [insurance:regulatory_action_condition] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= regulatory_action_condition
   (or severe_insufficiency_penalty_condition
       (and (not severe_insufficiency_penalty_condition)
            significant_deterioration_condition
            improvement_plan_approved
            accelerated_deterioration_or_no_improvement))))

; [insurance:regulatory_action_taken] 主管機關已為監管、接管、勒令停業清理或命令解散之處分
(assert (= regulatory_action_taken regulatory_action_executed))

; [insurance:prohibited_acts_without_regulator_consent] 保險業非經監管人同意不得為禁止行為
(assert (= prohibited_acts_without_regulator_consent
   (and (not regulator_consent_payment_exceed_limit)
        (not regulator_consent_contract_commitment)
        (not regulator_consent_other_major_financial_matters))))

; [insurance:internal_control_and_audit_established] 建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   internal_control_and_audit_system_established))

; [insurance:internal_handling_system_established] 建立內部處理制度及程序
(assert (= internal_handling_system_established
   internal_handling_system_established_flag))

; [insurance:derivative_financial_product_management_compliant] 衍生性金融商品交易管理符合主管機關規定
(assert (= derivative_financial_product_management_compliant
   (and application_submitted
        required_documents_submitted
        board_approval_obtained
        internal_procedures_established
        risk_management_policies_established)))

; [insurance:loan_and_other_transaction_limits_compliant] 同一人、同一關係人或同一關係企業之放款及其他交易限額符合規定
(assert (= loan_and_other_transaction_limits_compliant
   (and (<= single_transaction_amount (* (/ 7.0 20.0) owner_equity))
        (<= total_transaction_balance (* (/ 7.0 10.0) owner_equity)))))

; [insurance:real_estate_investment_limits_compliant] 不動產投資限額符合規定
(assert (let ((a!1 (and (not (<= (ite statutory_standard 1.0 0.0)
                         capital_adequacy_ratio))
                (not (<= owner_equity 0.0))
                capital_increase_plan_submitted
                (<= single_real_estate_transaction_amount
                    (* (/ 1.0 100.0) funds))
                (<= total_real_estate_transaction_amount (* (/ 1.0 50.0) funds))
                public_tender_or_auction
                real_estate_transaction_procedures_compliant
                board_approval_obtained
                board_decision_documents_complete))
      (a!2 (and (not (<= (ite statutory_standard 1.0 0.0)
                         capital_adequacy_ratio))
                (>= 0.0 owner_equity)
                capital_increase_plan_submitted
                (<= single_real_estate_transaction_amount
                    (ite (<= funds 500000000000.0)
                         (* (/ 1.0 100.0) funds)
                         5000000000.0))
                (<= total_real_estate_transaction_amount
                    (ite (<= funds 500000000000.0)
                         (* (/ 1.0 50.0) funds)
                         10000000000.0))
                public_tender_or_auction
                real_estate_transaction_procedures_compliant
                board_approval_obtained
                board_decision_documents_complete)))
(let ((a!3 (or (and (>= capital_adequacy_ratio (ite statutory_standard 1.0 0.0))
                    (<= single_real_estate_transaction_amount
                        (* (/ 3.0 200.0) funds))
                    (<= total_real_estate_transaction_amount
                        (* (/ 3.0 100.0) funds)))
               a!1
               a!2)))
  (= real_estate_investment_limits_compliant a!3))))

; [insurance:internal_audit_system_implemented] 建立自行查核制度並執行
(assert (= internal_audit_system_implemented
   (and internal_audit_system_established
        (<= 1 internal_audit_frequency_per_year)
        audit_report_retained_5_years
        audit_training_plan_established)))

; [insurance:legal_compliance_evaluation_performed] 依法令遵循計畫執行自行評估
(assert (= legal_compliance_evaluation_performed
   (and legal_compliance_evaluation_plan_established
        (<= 1 legal_compliance_evaluation_frequency_per_half_year)
        legal_compliance_evaluation_results_reported
        legal_compliance_evaluation_data_retained_5_years)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未完成改善計畫、財務或業務顯著惡化未改善、未建立內部控制或處理制度、違反衍生性金融商品管理規定、不符交易限額、不符不動產投資限額、未執行自行查核或法令遵循評估時處罰
(assert (= penalty
   (or (not regulatory_action_taken)
       (not internal_handling_system_established)
       (not derivative_financial_product_management_compliant)
       (not internal_control_and_audit_established)
       (not loan_and_other_transaction_limits_compliant)
       (not real_estate_investment_limits_compliant)
       (not legal_compliance_evaluation_performed)
       (not internal_audit_system_implemented))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -1000000.0))
(assert (= net_worth_ratio -5.0))
(assert (= capital_level 4))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_completed false))
(assert (= improvement_plan_executed_flag false))
(assert (= improvement_plan_executed false))
(assert (= financial_or_business_deterioration true))
(assert (= unable_to_pay_debt false))
(assert (= risk_to_insured true))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_handling_system_established_flag false))
(assert (= internal_handling_system_established false))
(assert (= application_submitted false))
(assert (= required_documents_submitted false))
(assert (= board_approval_obtained false))
(assert (= internal_procedures_established false))
(assert (= risk_management_policies_established false))
(assert (= loan_and_other_transaction_limits_compliant false))
(assert (= owner_equity 1000000000.0))
(assert (= single_transaction_amount 400000000.0))
(assert (= total_transaction_balance 800000000.0))
(assert (= real_estate_investment_limits_compliant false))
(assert (= capital_increase_plan_submitted false))
(assert (= funds 10000000000.0))
(assert (= single_real_estate_transaction_amount 200000000.0))
(assert (= total_real_estate_transaction_amount 400000000.0))
(assert (= public_tender_or_auction false))
(assert (= real_estate_transaction_procedures_compliant false))
(assert (= board_decision_documents_complete false))
(assert (= internal_audit_system_established false))
(assert (= internal_audit_frequency_per_year 0))
(assert (= internal_audit_system_implemented false))
(assert (= audit_report_retained_5_years false))
(assert (= audit_training_plan_established false))
(assert (= legal_compliance_evaluation_plan_established false))
(assert (= legal_compliance_evaluation_frequency_per_half_year 0))
(assert (= legal_compliance_evaluation_results_reported false))
(assert (= legal_compliance_evaluation_data_retained_5_years false))
(assert (= legal_compliance_evaluation_performed false))
(assert (= profit_loss_accelerated_deterioration true))
(assert (= no_improvement_after_guidance true))
(assert (= accelerated_deterioration_or_no_improvement true))
(assert (= improvement_plan_approved_flag false))
(assert (= improvement_plan_approved false))
(assert (= regulatory_action_executed false))
(assert (= regulatory_action_taken false))
(assert (= regulatory_action_condition false))
(assert (= prohibited_acts_without_regulator_consent true))
(assert (= severe_insufficiency_penalty_condition true))
(assert (= significant_deterioration_condition true))
(assert (= capital_level_severe_insufficiency true))
(assert (= capital_level_significant_insufficiency false))
(assert (= capital_level_insufficient false))
(assert (= capital_level_adequate false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 24
; Total variables: 63
; Total facts: 57
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
