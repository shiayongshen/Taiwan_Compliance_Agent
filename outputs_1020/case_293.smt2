; SMT2 file generated from compliance case automatic
; Case ID: case_293
; Generated at: 2025-10-19T12:18:38.087892
;
; This file can be executed with Z3:
;   z3 case_293.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_review_done Bool)
(declare-const authorized_trading_person_has_financial_expertise Bool)
(declare-const board_approved_selection_method_used Bool)
(declare-const customer_and_product_grading_basis_established Bool)
(declare-const customer_attribute_assessed Bool)
(declare-const customer_attribute_reviewed_at_least_annually Bool)
(declare-const customer_attribute_reviewed_by_appropriate_unit Bool)
(declare-const customer_confirmation_obtained Bool)
(declare-const customer_confirmation_obtained_on_update Bool)
(declare-const customer_is_bank Bool)
(declare-const customer_is_bill_finance_company Bool)
(declare-const customer_is_fund_management_company Bool)
(declare-const customer_is_futures_broker Bool)
(declare-const customer_is_futures_service_company Bool)
(declare-const customer_is_general Bool)
(declare-const customer_is_government_fund Bool)
(declare-const customer_is_government_investment_agency Bool)
(declare-const customer_is_high_net_worth_investor Bool)
(declare-const customer_is_insurance_company Bool)
(declare-const customer_is_listed_company Bool)
(declare-const customer_is_mutual_fund Bool)
(declare-const customer_is_national_agricultural_bank Bool)
(declare-const customer_is_other_approved_institution Bool)
(declare-const customer_is_pension_fund Bool)
(declare-const customer_is_postal_savings_institution Bool)
(declare-const customer_is_professional Bool)
(declare-const customer_is_professional_investor Bool)
(declare-const customer_is_securities_firm Bool)
(declare-const customer_is_securities_investment_advisor_company Bool)
(declare-const customer_is_securities_investment_trust_company Bool)
(declare-const customer_is_trust_company Bool)
(declare-const customer_is_unit_trust Bool)
(declare-const customer_suitability_level Int)
(declare-const customer_understanding_procedure_established Bool)
(declare-const customer_understands_liability_exemption_and_signed Bool)
(declare-const derivative_product_attribute_assessed Bool)
(declare-const derivative_product_customer_review_updated Bool)
(declare-const derivative_product_customer_reviewed Bool)
(declare-const derivative_product_not_exceed_suitability Bool)
(declare-const derivative_product_suitability_content_ok Bool)
(declare-const derivative_product_suitability_established Bool)
(declare-const derivative_product_suitability_system_established Bool)
(declare-const financial_proof_amount Real)
(declare-const foreign_internal_audit_staff_meet_local_regulations Bool)
(declare-const has_financial_expertise_and_experience Bool)
(declare-const has_investment_unit_with_qualified_personnel Bool)
(declare-const high_net_worth_investor_criteria_met Bool)
(declare-const internal_audit_staff_accountant_or_programmer_or_analyst_ratio Real)
(declare-const internal_audit_staff_accountant_or_programmer_or_analyst_years Int)
(declare-const internal_audit_staff_college_graduate Bool)
(declare-const internal_audit_staff_demerit_due_to_others_offset Bool)
(declare-const internal_audit_staff_duty_adjusted Bool)
(declare-const internal_audit_staff_duty_adjusted_if_violation Bool)
(declare-const internal_audit_staff_financial_experience_years Int)
(declare-const internal_audit_staff_financial_inspection_experience_years Int)
(declare-const internal_audit_staff_foreign_unit_qualification_ok Bool)
(declare-const internal_audit_staff_leader_audit_experience_years Int)
(declare-const internal_audit_staff_leader_audit_or_inspection_experience_years Int)
(declare-const internal_audit_staff_leader_experience_ok Bool)
(declare-const internal_audit_staff_leader_financial_experience_years Int)
(declare-const internal_audit_staff_major_demerit_record Bool)
(declare-const internal_audit_staff_no_major_demerit Bool)
(declare-const internal_audit_staff_pass_cia_exam Bool)
(declare-const internal_audit_staff_pass_high_exam Bool)
(declare-const internal_audit_staff_qualification_compliance Bool)
(declare-const internal_audit_staff_qualification_ok Bool)
(declare-const internal_audit_staff_training_months Int)
(declare-const internal_audit_staff_violation_found Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_has_appropriate_investment_procedure_and_risk_management Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const is_corporate Bool)
(declare-const is_foreign_corporate_branch Bool)
(declare-const is_subsidiary_100_percent_owned Bool)
(declare-const knowledge_assessment_included_in_customer_understanding_procedure Bool)
(declare-const latest_financial_report_net_assets Real)
(declare-const latest_financial_report_securities_or_derivative_investment Real)
(declare-const latest_financial_report_total_assets Real)
(declare-const meets_conditions_for_professional_customer Bool)
(declare-const parent_meets_conditions_for_professional_customer Bool)
(declare-const penalty Bool)
(declare-const product_level Int)
(declare-const professional_customer_annual_review_done Bool)
(declare-const professional_customer_corporate_conditions_met Bool)
(declare-const professional_customer_corporate_criteria_met Bool)
(declare-const professional_customer_individual_conditions_met Bool)
(declare-const professional_customer_knowledge_assessment_reported Bool)
(declare-const professional_customer_trust_conditions_met Bool)
(declare-const professional_investor_criteria_met Bool)
(declare-const reported_to_board_of_directors Bool)
(declare-const single_transaction_amount Real)
(declare-const total_assets_in_bank Real)
(declare-const total_financial_assets Real)
(declare-const transaction_is_non_structured_and_hedging_purpose Bool)
(declare-const trust_principal_meets_professional_customer_conditions Bool)
(declare-const understands_liability_exemption_and_signed Bool)
(declare-const unit_head_financial_experience_years Int)
(declare-const unit_head_financial_investment_experience_years Int)
(declare-const unit_head_other_qualified_experience Bool)
(declare-const violation_discovery_days Int)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_control_ok] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:derivative_product_suitability_established] 建立衍生性金融商品適合度制度
(assert (= derivative_product_suitability_established
   derivative_product_suitability_system_established))

; [bank:derivative_product_suitability_content_ok] 衍生性金融商品適合度制度內容符合規定
(assert (= derivative_product_suitability_content_ok
   (and derivative_product_attribute_assessed
        customer_understanding_procedure_established
        customer_attribute_assessed
        customer_and_product_grading_basis_established)))

; [bank:derivative_product_customer_reviewed] 客戶屬性評估及分級結果覆核且每年檢視並確認
(assert (= derivative_product_customer_reviewed
   (and customer_attribute_reviewed_by_appropriate_unit
        customer_attribute_reviewed_at_least_annually
        customer_confirmation_obtained)))

; [bank:derivative_product_customer_review_updated] 客戶屬性評估及分級結果修正時須確認
(assert (= derivative_product_customer_review_updated
   customer_confirmation_obtained_on_update))

; [bank:derivative_product_not_exceed_suitability] 不得向一般客戶提供超過其適合等級之衍生性金融商品交易服務
(assert (let ((a!1 (or (not customer_is_general)
               (and customer_is_general
                    (or transaction_is_non_structured_and_hedging_purpose
                        (<= product_level customer_suitability_level))))))
  (= derivative_product_not_exceed_suitability a!1)))

; [bank:internal_audit_staff_qualification_ok] 內部稽核人員資格條件符合規定
(assert (let ((a!1 (and (or (<= 5 internal_audit_staff_financial_experience_years)
                    (and internal_audit_staff_college_graduate
                         (or internal_audit_staff_pass_high_exam
                             internal_audit_staff_pass_cia_exam)
                         (<= 2 internal_audit_staff_financial_experience_years))
                    (<= 2
                        internal_audit_staff_financial_inspection_experience_years))
                (>= 2
                    internal_audit_staff_accountant_or_programmer_or_analyst_years)
                (= internal_audit_staff_training_months 1)
                (>= (/ 3333333333.0 10000000000.0)
                    internal_audit_staff_accountant_or_programmer_or_analyst_ratio))))
  (= internal_audit_staff_qualification_ok a!1)))

; [bank:internal_audit_staff_no_major_demerit] 內部稽核人員最近三年內無記過以上不良紀錄
(assert (= internal_audit_staff_no_major_demerit
   (or internal_audit_staff_demerit_due_to_others_offset
       (not internal_audit_staff_major_demerit_record))))

; [bank:internal_audit_staff_leader_experience_ok] 內部稽核人員充任領隊資格符合規定
(assert (= internal_audit_staff_leader_experience_ok
   (or (<= 3 internal_audit_staff_leader_audit_or_inspection_experience_years)
       (and (<= 1 internal_audit_staff_leader_audit_experience_years)
            (<= 5 internal_audit_staff_leader_financial_experience_years)))))

; [bank:internal_audit_staff_qualification_compliance] 內部稽核人員資格條件符合且無不良紀錄且領隊資格符合
(assert (= internal_audit_staff_qualification_compliance
   (and internal_audit_staff_qualification_ok
        internal_audit_staff_no_major_demerit
        internal_audit_staff_leader_experience_ok)))

; [bank:internal_audit_staff_foreign_unit_qualification_ok] 國外營業單位內部稽核人員資格符合當地法令及主管機關要求
(assert (= internal_audit_staff_foreign_unit_qualification_ok
   (or foreign_internal_audit_staff_meet_local_regulations
       (and (not foreign_internal_audit_staff_meet_local_regulations)
            board_approved_selection_method_used))))

; [bank:internal_audit_staff_duty_adjusted_if_violation] 內部稽核人員違反規定逾期未改善應立即調整職務
(assert (let ((a!1 (= (and internal_audit_staff_violation_found
                   (not (<= violation_discovery_days 60))
                   (not internal_audit_staff_duty_adjusted))
              internal_audit_staff_duty_adjusted_if_violation)))
  (not a!1)))

; [bank:customer_is_professional] 客戶為專業客戶
(assert (= customer_is_professional
   (or customer_is_high_net_worth_investor customer_is_professional_investor)))

; [bank:professional_investor_criteria_met] 符合專業機構投資人資格條件
(assert (= professional_investor_criteria_met
   (or customer_is_bill_finance_company
       customer_is_mutual_fund
       customer_is_government_investment_agency
       customer_is_trust_company
       customer_is_fund_management_company
       customer_is_national_agricultural_bank
       customer_is_insurance_company
       customer_is_futures_broker
       customer_is_government_fund
       customer_is_pension_fund
       customer_is_other_approved_institution
       customer_is_securities_firm
       customer_is_postal_savings_institution
       customer_is_unit_trust
       customer_is_futures_service_company
       customer_is_bank
       customer_is_securities_investment_trust_company
       customer_is_securities_investment_advisor_company)))

; [bank:high_net_worth_investor_criteria_met] 符合高淨值投資法人資格條件
(assert (= high_net_worth_investor_criteria_met
   (and (<= 20000000000.0 latest_financial_report_net_assets)
        has_investment_unit_with_qualified_personnel
        (or (<= 4 unit_head_financial_investment_experience_years)
            (<= 3 unit_head_financial_experience_years)
            unit_head_other_qualified_experience)
        (<= 1000000000.0
            latest_financial_report_securities_or_derivative_investment)
        internal_control_has_appropriate_investment_procedure_and_risk_management)))

; [bank:professional_customer_corporate_criteria_met] 法人專業客戶資格條件符合
(assert (= professional_customer_corporate_criteria_met
   (or (and is_subsidiary_100_percent_owned
            parent_meets_conditions_for_professional_customer)
       (and is_foreign_corporate_branch
            meets_conditions_for_professional_customer)
       (and is_corporate meets_conditions_for_professional_customer))))

; [bank:professional_customer_corporate_conditions_met] 法人專業客戶條件符合
(assert (= professional_customer_corporate_conditions_met
   (and (<= 100000000.0 latest_financial_report_total_assets)
        authorized_trading_person_has_financial_expertise
        customer_understands_liability_exemption_and_signed)))

; [bank:professional_customer_individual_conditions_met] 自然人專業客戶條件符合
(assert (let ((a!1 (and (or (<= 30000000.0 financial_proof_amount)
                    (and (<= 3000000.0 single_transaction_amount)
                         (<= 15000000.0 total_assets_in_bank)
                         (<= 30000000.0 total_financial_assets)))
                has_financial_expertise_and_experience
                understands_liability_exemption_and_signed)))
  (= professional_customer_individual_conditions_met a!1)))

; [bank:professional_customer_trust_conditions_met] 信託業委託人符合專業客戶條件
(assert (= professional_customer_trust_conditions_met
   trust_principal_meets_professional_customer_conditions))

; [bank:professional_customer_annual_review_done] 每年辦理一次覆審檢視專業客戶資格
(assert (= professional_customer_annual_review_done
   (or customer_is_listed_company annual_review_done)))

; [bank:professional_customer_knowledge_assessment_reported] 非專業機構投資人之專業客戶金融商品專業知識評估納入瞭解客戶程序並報董(理)事會通過
(assert (= professional_customer_knowledge_assessment_reported
   (and knowledge_assessment_included_in_customer_understanding_procedure
        reported_to_board_of_directors)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度及程序時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= annual_review_done false))
(assert (= authorized_trading_person_has_financial_expertise false))
(assert (= board_approved_selection_method_used false))
(assert (= customer_and_product_grading_basis_established false))
(assert (= customer_attribute_assessed false))
(assert (= customer_attribute_reviewed_at_least_annually false))
(assert (= customer_attribute_reviewed_by_appropriate_unit false))
(assert (= customer_confirmation_obtained false))
(assert (= customer_confirmation_obtained_on_update false))
(assert (= customer_is_bank false))
(assert (= customer_is_bill_finance_company false))
(assert (= customer_is_fund_management_company false))
(assert (= customer_is_futures_broker false))
(assert (= customer_is_futures_service_company false))
(assert (= customer_is_general false))
(assert (= customer_is_government_fund false))
(assert (= customer_is_government_investment_agency false))
(assert (= customer_is_high_net_worth_investor false))
(assert (= customer_is_insurance_company false))
(assert (= customer_is_listed_company false))
(assert (= customer_is_mutual_fund false))
(assert (= customer_is_national_agricultural_bank false))
(assert (= customer_is_other_approved_institution false))
(assert (= customer_is_pension_fund false))
(assert (= customer_is_postal_savings_institution false))
(assert (= customer_is_professional false))
(assert (= customer_is_professional_investor false))
(assert (= customer_is_securities_firm false))
(assert (= customer_is_securities_investment_advisor_company false))
(assert (= customer_is_securities_investment_trust_company false))
(assert (= customer_is_trust_company false))
(assert (= customer_is_unit_trust false))
(assert (= customer_suitability_level 0))
(assert (= customer_understanding_procedure_established false))
(assert (= customer_understands_liability_exemption_and_signed false))
(assert (= derivative_product_attribute_assessed false))
(assert (= derivative_product_customer_review_updated false))
(assert (= derivative_product_customer_reviewed false))
(assert (= derivative_product_not_exceed_suitability false))
(assert (= derivative_product_suitability_content_ok false))
(assert (= derivative_product_suitability_established false))
(assert (= derivative_product_suitability_system_established false))
(assert (= financial_proof_amount 0.0))
(assert (= foreign_internal_audit_staff_meet_local_regulations false))
(assert (= has_financial_expertise_and_experience false))
(assert (= has_investment_unit_with_qualified_personnel false))
(assert (= high_net_worth_investor_criteria_met false))
(assert (= internal_audit_staff_accountant_or_programmer_or_analyst_ratio 0.0))
(assert (= internal_audit_staff_accountant_or_programmer_or_analyst_years 0))
(assert (= internal_audit_staff_college_graduate false))
(assert (= internal_audit_staff_demerit_due_to_others_offset false))
(assert (= internal_audit_staff_duty_adjusted false))
(assert (= internal_audit_staff_duty_adjusted_if_violation false))
(assert (= internal_audit_staff_financial_experience_years 0))
(assert (= internal_audit_staff_financial_inspection_experience_years 0))
(assert (= internal_audit_staff_foreign_unit_qualification_ok false))
(assert (= internal_audit_staff_leader_audit_experience_years 0))
(assert (= internal_audit_staff_leader_audit_or_inspection_experience_years 0))
(assert (= internal_audit_staff_leader_experience_ok false))
(assert (= internal_audit_staff_leader_financial_experience_years 0))
(assert (= internal_audit_staff_major_demerit_record false))
(assert (= internal_audit_staff_no_major_demerit false))
(assert (= internal_audit_staff_pass_cia_exam false))
(assert (= internal_audit_staff_pass_high_exam false))
(assert (= internal_audit_staff_qualification_compliance false))
(assert (= internal_audit_staff_qualification_ok false))
(assert (= internal_audit_staff_training_months 0))
(assert (= internal_audit_staff_violation_found false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_has_appropriate_investment_procedure_and_risk_management false))
(assert (= internal_control_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_operation_ok false))
(assert (= is_corporate false))
(assert (= is_foreign_corporate_branch false))
(assert (= is_subsidiary_100_percent_owned false))
(assert (= knowledge_assessment_included_in_customer_understanding_procedure false))
(assert (= latest_financial_report_net_assets 0.0))
(assert (= latest_financial_report_securities_or_derivative_investment 0.0))
(assert (= latest_financial_report_total_assets 0.0))
(assert (= meets_conditions_for_professional_customer false))
(assert (= parent_meets_conditions_for_professional_customer false))
(assert (= penalty false))
(assert (= product_level 0))
(assert (= professional_customer_annual_review_done false))
(assert (= professional_customer_corporate_conditions_met false))
(assert (= professional_customer_corporate_criteria_met false))
(assert (= professional_customer_individual_conditions_met false))
(assert (= professional_customer_knowledge_assessment_reported false))
(assert (= professional_customer_trust_conditions_met false))
(assert (= professional_investor_criteria_met false))
(assert (= reported_to_board_of_directors false))
(assert (= single_transaction_amount 0.0))
(assert (= total_assets_in_bank 0.0))
(assert (= total_financial_assets 0.0))
(assert (= transaction_is_non_structured_and_hedging_purpose false))
(assert (= trust_principal_meets_professional_customer_conditions false))
(assert (= understands_liability_exemption_and_signed false))
(assert (= unit_head_financial_experience_years 0))
(assert (= unit_head_financial_investment_experience_years 0))
(assert (= unit_head_other_qualified_experience false))
(assert (= violation_discovery_days 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 31
; Total variables: 113
; Total facts: 113
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
