; SMT2 file generated from compliance case automatic
; Case ID: case_293
; Generated at: 2025-10-21T06:31:41.118949
;
; This file can be executed with Z3:
;   z3 case_293.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_firm_experience_years Real)
(declare-const annual_review_done Bool)
(declare-const audit_experience_years Real)
(declare-const audit_or_inspection_experience_years Real)
(declare-const authorized_trader_has_expertise Bool)
(declare-const board_approved_selection Bool)
(declare-const college_graduate Bool)
(declare-const customer_attribute_evaluation_separation Bool)
(declare-const customer_evaluation_review_confirmed Bool)
(declare-const customer_evaluation_reviewed Bool)
(declare-const customer_evaluator Bool)
(declare-const customer_is_general Bool)
(declare-const customer_is_professional Bool)
(declare-const derivative_customer_evaluation_reviewed Bool)
(declare-const derivative_product_level_restriction Bool)
(declare-const derivative_product_suitability_established Bool)
(declare-const derivative_product_suitability_system_established Bool)
(declare-const disciplinary_records_in_3_years Bool)
(declare-const disciplinary_records_offset Bool)
(declare-const evaluation_recorded_audio Bool)
(declare-const evaluation_recorded_electronic Bool)
(declare-const evaluation_recorded_video Bool)
(declare-const financial_capacity Real)
(declare-const financial_experience_years Real)
(declare-const financial_investment_experience_years Real)
(declare-const financial_report_securities_or_derivatives Bool)
(declare-const financial_report_total_assets Real)
(declare-const first_time_customer_evaluation_recorded Bool)
(declare-const foreign_office_audit_staff_qualified Bool)
(declare-const has_financial_knowledge_and_experience Bool)
(declare-const has_investment_decision_unit Bool)
(declare-const has_other_financial_knowledge Bool)
(declare-const has_qualified_financial_report Bool)
(declare-const internal_audit_experience_years Real)
(declare-const internal_audit_staff_compliance Bool)
(declare-const internal_audit_staff_qualified Bool)
(declare-const internal_audit_staff_total Int)
(declare-const internal_audit_staff_violation Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
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
(declare-const investment_experience_years Real)
(declare-const is_corporate_or_fund Bool)
(declare-const is_corporate_or_subsidiary Bool)
(declare-const is_individual Bool)
(declare-const is_professional_institutional_investor Bool)
(declare-const is_team_leader Bool)
(declare-const is_trust_company Bool)
(declare-const local_regulation_has_qualification_requirements Bool)
(declare-const passed_cia_exam Bool)
(declare-const passed_equivalent_exam Bool)
(declare-const passed_high_exam Bool)
(declare-const penalty Bool)
(declare-const product_is_non_structured Bool)
(declare-const product_promoter Bool)
(declare-const professional_client_definition_met Bool)
(declare-const professional_client_due_diligence Bool)
(declare-const reasonable_investigation_done Bool)
(declare-const signed_professional_client_agreement Bool)
(declare-const single_transaction_amount Real)
(declare-const total_assets Real)
(declare-const transaction_is_hedging Bool)
(declare-const trustee_meets_professional_client_conditions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_control_ok] 建立內部控制及稽核制度且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 建立內部作業制度及程序且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:derivative_product_suitability_established] 建立衍生性金融商品適合度制度
(assert (= derivative_product_suitability_established
   derivative_product_suitability_system_established))

; [bank:derivative_customer_evaluation_reviewed] 客戶屬性評估及分級結果覆核且每年檢視並確認
(assert (= derivative_customer_evaluation_reviewed
   (and customer_evaluation_reviewed customer_evaluation_review_confirmed)))

; [bank:derivative_product_level_restriction] 不得向一般客戶提供超過其適合等級之衍生性金融商品交易服務，除避險非結構型商品外
(assert (= derivative_product_level_restriction
   (or customer_is_professional
       (and customer_is_general
            product_is_non_structured
            transaction_is_hedging))))

; [bank:internal_audit_staff_qualified] 內部稽核人員具備資格條件
(assert (let ((a!1 (or disciplinary_records_offset
               (not (<= 1 (ite disciplinary_records_in_3_years 1 0))))))
(let ((a!2 (and (or (<= 2.0 internal_audit_experience_years)
                    (and college_graduate
                         (or passed_equivalent_exam
                             passed_cia_exam
                             passed_high_exam)
                         (<= 2.0 financial_experience_years))
                    (<= 5.0 financial_experience_years))
                (<= accounting_firm_experience_years
                    (* (/ 3333.0 10000.0) (to_real internal_audit_staff_total)))
                a!1
                (or (not is_team_leader)
                    (<= 3.0 audit_or_inspection_experience_years)
                    (and (<= 1.0 audit_experience_years)
                         (<= 5.0 financial_experience_years))))))
  (= internal_audit_staff_qualified a!2))))

; [bank:foreign_office_audit_staff_qualified] 國外營業單位內部稽核人員資格符合當地法令或董事會評估遴選
(assert (= foreign_office_audit_staff_qualified
   (or board_approved_selection local_regulation_has_qualification_requirements)))

; [bank:internal_audit_staff_compliance] 內部稽核人員無違反資格規定，違反者限期改善
(assert (not (= internal_audit_staff_violation internal_audit_staff_compliance)))

; [bank:customer_attribute_evaluation_separation] 客戶屬性評估人員與推介人員不同
(assert (not (= (= customer_evaluator product_promoter)
        customer_attribute_evaluation_separation)))

; [bank:first_time_customer_evaluation_recorded] 首次自然人客戶屬性評估有錄音錄影或電子設備留存
(assert (= first_time_customer_evaluation_recorded
   (or evaluation_recorded_electronic
       evaluation_recorded_audio
       evaluation_recorded_video)))

; [bank:professional_client_definition_met] 符合專業客戶定義條件
(assert (let ((a!1 (and is_individual
                (or (<= 3000.0 financial_capacity)
                    (and (<= 300.0 single_transaction_amount)
                         (<= 1500.0 total_assets)))
                has_financial_knowledge_and_experience
                signed_professional_client_agreement)))
(let ((a!2 (or (and is_corporate_or_subsidiary
                    has_qualified_financial_report
                    has_investment_decision_unit
                    (or has_other_financial_knowledge
                        (<= 3.0 investment_experience_years)
                        (<= 4.0 financial_investment_experience_years))
                    (<= 10.0
                        (ite financial_report_securities_or_derivatives 1.0 0.0)))
               is_professional_institutional_investor
               a!1
               (and is_trust_company
                    trustee_meets_professional_client_conditions)
               (and is_corporate_or_fund
                    (<= 1.0 financial_report_total_assets)
                    authorized_trader_has_expertise
                    signed_professional_client_agreement))))
  (= professional_client_definition_met a!2))))

; [bank:professional_client_due_diligence] 銀行對專業客戶資格條件盡合理調查並每年覆審
(assert (= professional_client_due_diligence
   (and reasonable_investigation_done annual_review_done)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度或其他違反銀行法規定時處罰
(assert (= penalty
   (or (not internal_operation_ok)
       internal_audit_staff_violation
       (not internal_handling_ok)
       (not internal_control_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= internal_audit_staff_violation false))
(assert (= customer_evaluation_reviewed false))
(assert (= customer_evaluation_review_confirmed false))
(assert (= derivative_product_suitability_system_established false))
(assert (= customer_is_professional false))
(assert (= customer_is_general true))
(assert (= product_is_non_structured false))
(assert (= transaction_is_hedging false))
(assert (= reasonable_investigation_done false))
(assert (= annual_review_done false))
(assert (= internal_audit_experience_years 0))
(assert (= college_graduate false))
(assert (= passed_high_exam false))
(assert (= passed_equivalent_exam false))
(assert (= passed_cia_exam false))
(assert (= financial_experience_years 0))
(assert (= accounting_firm_experience_years 0))
(assert (= disciplinary_records_in_3_years false))
(assert (= disciplinary_records_offset false))
(assert (= is_professional_institutional_investor false))
(assert (= is_corporate_or_subsidiary false))
(assert (= has_qualified_financial_report false))
(assert (= has_investment_decision_unit false))
(assert (= investment_experience_years 0))
(assert (= financial_investment_experience_years 0))
(assert (= has_other_financial_knowledge false))
(assert (= financial_report_securities_or_derivatives false))
(assert (= is_corporate_or_fund false))
(assert (= financial_report_total_assets 0))
(assert (= authorized_trader_has_expertise false))
(assert (= signed_professional_client_agreement false))
(assert (= is_individual false))
(assert (= financial_capacity 0))
(assert (= single_transaction_amount 0))
(assert (= total_assets 0))
(assert (= has_financial_knowledge_and_experience false))
(assert (= is_trust_company false))
(assert (= trustee_meets_professional_client_conditions false))
(assert (= customer_evaluator true))
(assert (= product_promoter true))
(assert (= evaluation_recorded_audio false))
(assert (= evaluation_recorded_video false))
(assert (= evaluation_recorded_electronic false))
(assert (= board_approved_selection false))
(assert (= local_regulation_has_qualification_requirements false))
(assert (= internal_audit_staff_compliance false))
(assert (= internal_audit_staff_total 0))
(assert (= is_team_leader false))
(assert (= audit_or_inspection_experience_years 0))
(assert (= audit_experience_years 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 75
; Total facts: 56
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
