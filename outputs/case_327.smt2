; SMT2 file generated from compliance case automatic
; Case ID: case_327
; Generated at: 2025-10-21T07:24:00.625948
;
; This file can be executed with Z3:
;   z3 case_327.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const act_144_actuarial_staff_assigned Bool)
(declare-const act_144_board_approval_obtained Bool)
(declare-const act_144_external_review_hired Bool)
(declare-const act_144_reports_fair_and_true Bool)
(declare-const act_145_reserve_calculated_and_recorded Bool)
(declare-const act_146_7_limitations_defined Bool)
(declare-const act_146_deposit_limit_respected Bool)
(declare-const act_146_derivative_trading_compliance Bool)
(declare-const act_146_fund_usage_limited Bool)
(declare-const act_146_insurance_related_business_defined Bool)
(declare-const act_146_investment_accounting_compliance Bool)
(declare-const act_148_3_internal_control_established Bool)
(declare-const act_148_3_internal_handling_established Bool)
(declare-const act_149_capital_level_severe_and_no_improvement Bool)
(declare-const act_149_financial_deterioration_and_no_improvement Bool)
(declare-const act_149_violation_penalties Bool)
(declare-const act_171_1_violation_148_1_2_penalty Bool)
(declare-const act_171_1_violation_148_2_2_penalty Bool)
(declare-const act_171_1_violation_148_2_penalty Bool)
(declare-const act_171_1_violation_148_3_1_penalty Bool)
(declare-const act_171_1_violation_148_3_2_penalty Bool)
(declare-const act_171_violation_144_145_penalty Bool)
(declare-const act_171_violation_144_5_144_6_penalty Bool)
(declare-const actuarial_experience_years Int)
(declare-const actuarial_personnel_qualified Bool)
(declare-const actuarial_staff_hired Bool)
(declare-const business_restriction_imposed Bool)
(declare-const capital_improvement_completed Bool)
(declare-const capital_increase_ordered Bool)
(declare-const capital_level Int)
(declare-const claims_experience_years Int)
(declare-const claims_personnel_qualified Bool)
(declare-const deposit_limit_approved_by_authority Bool)
(declare-const deposit_per_financial_institution_percentage Real)
(declare-const derivative_trading_conditions_met Bool)
(declare-const derivative_trading_internal_procedures_followed Bool)
(declare-const derivative_trading_limit_respected Bool)
(declare-const derivative_trading_scope_limited Bool)
(declare-const director_supervisor_dismissal_ordered Bool)
(declare-const external_review_actuarial_staff_board_approved Bool)
(declare-const external_review_actuarial_staff_hired Bool)
(declare-const external_review_report_fair_and_true Bool)
(declare-const financial_or_business_condition_deteriorated Bool)
(declare-const financial_or_business_improvement_completed Bool)
(declare-const fund_usage_derivative_transactions Bool)
(declare-const fund_usage_foreign_investment Bool)
(declare-const fund_usage_insurance_related_business Bool)
(declare-const fund_usage_loans Bool)
(declare-const fund_usage_other_approved Bool)
(declare-const fund_usage_real_estate Bool)
(declare-const fund_usage_securities Bool)
(declare-const fund_usage_special_approved_projects Bool)
(declare-const insurance_product_sales_stopped Bool)
(declare-const insurance_related_business_defined_by_authority Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const investment_accounting_book_established Bool)
(declare-const investment_accounting_book_managed_per_rules Bool)
(declare-const investment_experience_years Int)
(declare-const investment_personnel_qualified Bool)
(declare-const legal_experience_years Int)
(declare-const legal_personnel_qualified Bool)
(declare-const manager_dismissal_ordered Bool)
(declare-const other_necessary_measures_taken Bool)
(declare-const penalty Bool)
(declare-const policy_service_experience_years Int)
(declare-const policy_service_personnel_qualified Bool)
(declare-const qualified_signing_personnel_human_insurance Bool)
(declare-const qualified_signing_personnel_property_insurance Bool)
(declare-const regulatory_limits_defined Bool)
(declare-const reserves_calculated_per_insurance_type Bool)
(declare-const reserves_recorded_in_special_books Bool)
(declare-const risk_management_experience_years Int)
(declare-const risk_management_personnel_qualified Bool)
(declare-const signing_actuarial_staff_assigned Bool)
(declare-const signing_actuarial_staff_board_approved Bool)
(declare-const signing_report_fair_and_true Bool)
(declare-const statutory_meeting_resolution_revoked Bool)
(declare-const underwriting_experience_years Int)
(declare-const underwriting_personnel_qualified Bool)
(declare-const violation_144_145 Bool)
(declare-const violation_144_5_or_144_6_measures Bool)
(declare-const violation_148_1_1_or_2 Bool)
(declare-const violation_148_2_1 Bool)
(declare-const violation_148_2_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:act_144_actuarial_staff_assigned] 保險業聘用精算人員並指派簽證精算人員
(assert (= act_144_actuarial_staff_assigned
   (and actuarial_staff_hired signing_actuarial_staff_assigned)))

; [insurance:act_144_external_review_hired] 保險業聘請外部複核精算人員
(assert (= act_144_external_review_hired external_review_actuarial_staff_hired))

; [insurance:act_144_board_approval_obtained] 簽證精算人員指派及外部複核精算人員聘請經董（理）事會同意
(assert (= act_144_board_approval_obtained
   (and signing_actuarial_staff_board_approved
        external_review_actuarial_staff_board_approved)))

; [insurance:act_144_reports_fair_and_true] 簽證報告及複核報告內容公正且無虛偽隱匿遺漏錯誤
(assert (= act_144_reports_fair_and_true
   (and signing_report_fair_and_true external_review_report_fair_and_true)))

; [insurance:act_146_7_limitations_defined] 主管機關對同一人、同一關係人或同一關係企業放款或其他交易限制已定
(assert (= act_146_7_limitations_defined regulatory_limits_defined))

; [insurance:act_146_fund_usage_limited] 保險業資金運用限於法定項目
(assert (= act_146_fund_usage_limited
   (or fund_usage_other_approved
       fund_usage_real_estate
       fund_usage_securities
       fund_usage_loans
       fund_usage_derivative_transactions
       fund_usage_foreign_investment
       fund_usage_special_approved_projects
       fund_usage_insurance_related_business)))

; [insurance:act_146_deposit_limit_respected] 存款於每一金融機構金額不超過資金百分之十，或經主管機關核准
(assert (= act_146_deposit_limit_respected
   (or (>= 10.0 deposit_per_financial_institution_percentage)
       deposit_limit_approved_by_authority)))

; [insurance:act_146_insurance_related_business_defined] 保險相關事業範圍已依主管機關定義
(assert (= act_146_insurance_related_business_defined
   insurance_related_business_defined_by_authority))

; [insurance:act_146_investment_accounting_compliance] 投資型保險業務專設帳簿並依主管機關辦法管理
(assert (= act_146_investment_accounting_compliance
   (and investment_accounting_book_established
        investment_accounting_book_managed_per_rules)))

; [insurance:act_146_derivative_trading_compliance] 衍生性商品交易符合主管機關規定條件、範圍、限額及程序
(assert (= act_146_derivative_trading_compliance
   (and derivative_trading_conditions_met
        derivative_trading_scope_limited
        derivative_trading_limit_respected
        derivative_trading_internal_procedures_followed)))

; [insurance:act_148_3_internal_control_established] 保險業建立內部控制及稽核制度
(assert (= act_148_3_internal_control_established
   internal_control_and_audit_system_established))

; [insurance:act_148_3_internal_handling_established] 保險業建立內部處理制度及程序
(assert (= act_148_3_internal_handling_established internal_handling_system_established))

; [insurance:act_149_violation_penalties] 保險業違反法令或有礙健全經營時主管機關得為處分
(assert (= act_149_violation_penalties
   (or business_restriction_imposed
       statutory_meeting_resolution_revoked
       insurance_product_sales_stopped
       other_necessary_measures_taken
       capital_increase_ordered
       manager_dismissal_ordered
       director_supervisor_dismissal_ordered)))

; [insurance:act_149_capital_level_severe_and_no_improvement] 資本嚴重不足且未依主管機關規定期限完成增資或改善計畫
(assert (= act_149_capital_level_severe_and_no_improvement
   (and (= 4 capital_level) (not capital_improvement_completed))))

; [insurance:act_149_financial_deterioration_and_no_improvement] 財務或業務狀況顯著惡化且未改善
(assert (= act_149_financial_deterioration_and_no_improvement
   (and financial_or_business_condition_deteriorated
        (not financial_or_business_improvement_completed))))

; [insurance:act_171_violation_144_145_penalty] 違反第144條第一項至第四項及第145條規定處罰
(assert (= act_171_violation_144_145_penalty violation_144_145))

; [insurance:act_171_violation_144_5_144_6_penalty] 違反第144條之五或主管機關依第144條之六措施處罰
(assert (= act_171_violation_144_5_144_6_penalty violation_144_5_or_144_6_measures))

; [insurance:act_171_1_violation_148_1_2_penalty] 違反第148條之一第一項或第二項規定處罰
(assert (= act_171_1_violation_148_1_2_penalty violation_148_1_1_or_2))

; [insurance:act_171_1_violation_148_2_penalty] 違反第148條之二第一項規定，未提供或不實說明文件處罰
(assert (= act_171_1_violation_148_2_penalty violation_148_2_1))

; [insurance:act_171_1_violation_148_2_2_penalty] 違反第148條之二第二項規定，未依限報告或內容不實處罰
(assert (= act_171_1_violation_148_2_2_penalty violation_148_2_2))

; [insurance:act_171_1_violation_148_3_1_penalty] 違反第148條之三第一項規定，未建立或未執行內部控制或稽核制度處罰
(assert (not (= internal_control_and_audit_system_established
        act_171_1_violation_148_3_1_penalty)))

; [insurance:act_171_1_violation_148_3_2_penalty] 違反第148條之三第二項規定，未建立或未執行內部處理制度或程序處罰
(assert (not (= internal_handling_system_established
        act_171_1_violation_148_3_2_penalty)))

; [insurance:qualified_signing_personnel_human_insurance] 人身保險商品合格簽署人員資格符合規定
(assert (= qualified_signing_personnel_human_insurance
   (or (and claims_personnel_qualified (<= 3 claims_experience_years))
       (and investment_personnel_qualified (<= 3 investment_experience_years))
       (and legal_personnel_qualified (<= 5 legal_experience_years))
       (and actuarial_personnel_qualified (<= 3 actuarial_experience_years))
       (and risk_management_personnel_qualified
            (<= 3 risk_management_experience_years))
       (and underwriting_personnel_qualified
            (<= 3 underwriting_experience_years))
       (and policy_service_personnel_qualified
            (<= 3 policy_service_experience_years)))))

; [insurance:qualified_signing_personnel_property_insurance] 財產保險商品合格簽署人員資格符合規定
(assert (= qualified_signing_personnel_property_insurance
   (or (and legal_personnel_qualified (<= 5 legal_experience_years))
       (and risk_management_personnel_qualified
            (<= 3 risk_management_experience_years))
       (and actuarial_personnel_qualified (<= 3 actuarial_experience_years))
       (and claims_personnel_qualified (<= 3 claims_experience_years))
       (and investment_personnel_qualified (<= 3 investment_experience_years))
       (and underwriting_personnel_qualified
            (<= 3 underwriting_experience_years)))))

; [insurance:act_145_reserve_calculated_and_recorded] 保險業於營業年度屆滿時計算各種準備金並記載於特設帳簿
(assert (= act_145_reserve_calculated_and_recorded
   (and reserves_calculated_per_insurance_type
        reserves_recorded_in_special_books)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法相關規定時處罰
(assert (= penalty
   (or act_149_capital_level_severe_and_no_improvement
       (not act_144_board_approval_obtained)
       act_171_violation_144_5_144_6_penalty
       act_149_violation_penalties
       (not act_146_7_limitations_defined)
       (not qualified_signing_personnel_property_insurance)
       (not act_148_3_internal_control_established)
       act_149_financial_deterioration_and_no_improvement
       (not act_148_3_internal_handling_established)
       (not act_146_derivative_trading_compliance)
       (not act_145_reserve_calculated_and_recorded)
       act_171_1_violation_148_2_penalty
       (not act_146_investment_accounting_compliance)
       act_171_violation_144_145_penalty
       (not act_146_deposit_limit_respected)
       act_171_1_violation_148_1_2_penalty
       act_171_1_violation_148_3_2_penalty
       (not act_144_external_review_hired)
       (not act_146_fund_usage_limited)
       (not act_144_reports_fair_and_true)
       act_171_1_violation_148_2_2_penalty
       act_171_1_violation_148_3_1_penalty
       (not qualified_signing_personnel_human_insurance)
       (not act_144_actuarial_staff_assigned)
       (not act_146_insurance_related_business_defined))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= act_144_actuarial_staff_assigned false))
(assert (= actuarial_staff_hired false))
(assert (= signing_actuarial_staff_assigned false))
(assert (= act_144_external_review_hired false))
(assert (= external_review_actuarial_staff_hired false))
(assert (= act_144_board_approval_obtained false))
(assert (= signing_actuarial_staff_board_approved false))
(assert (= external_review_actuarial_staff_board_approved false))
(assert (= act_144_reports_fair_and_true false))
(assert (= signing_report_fair_and_true false))
(assert (= external_review_report_fair_and_true false))
(assert (= act_146_7_limitations_defined false))
(assert (= regulatory_limits_defined false))
(assert (= act_146_fund_usage_limited false))
(assert (= fund_usage_derivative_transactions false))
(assert (= fund_usage_foreign_investment false))
(assert (= fund_usage_insurance_related_business false))
(assert (= fund_usage_loans false))
(assert (= fund_usage_other_approved false))
(assert (= fund_usage_real_estate false))
(assert (= fund_usage_securities false))
(assert (= fund_usage_special_approved_projects false))
(assert (= act_146_deposit_limit_respected false))
(assert (= deposit_per_financial_institution_percentage 20.0))
(assert (= deposit_limit_approved_by_authority false))
(assert (= act_146_insurance_related_business_defined false))
(assert (= insurance_related_business_defined_by_authority false))
(assert (= act_146_investment_accounting_compliance false))
(assert (= investment_accounting_book_established false))
(assert (= investment_accounting_book_managed_per_rules false))
(assert (= act_146_derivative_trading_compliance false))
(assert (= derivative_trading_conditions_met false))
(assert (= derivative_trading_scope_limited false))
(assert (= derivative_trading_limit_respected false))
(assert (= derivative_trading_internal_procedures_followed false))
(assert (= act_148_3_internal_control_established false))
(assert (= internal_control_and_audit_system_established false))
(assert (= act_148_3_internal_handling_established false))
(assert (= internal_handling_system_established false))
(assert (= act_149_capital_level_severe_and_no_improvement false))
(assert (= capital_level 1))
(assert (= capital_improvement_completed false))
(assert (= act_149_financial_deterioration_and_no_improvement true))
(assert (= financial_or_business_condition_deteriorated true))
(assert (= financial_or_business_improvement_completed false))
(assert (= act_149_violation_penalties true))
(assert (= business_restriction_imposed true))
(assert (= insurance_product_sales_stopped false))
(assert (= capital_increase_ordered false))
(assert (= manager_dismissal_ordered false))
(assert (= statutory_meeting_resolution_revoked false))
(assert (= director_supervisor_dismissal_ordered false))
(assert (= other_necessary_measures_taken false))
(assert (= act_171_violation_144_145_penalty true))
(assert (= violation_144_145 true))
(assert (= act_171_violation_144_5_144_6_penalty false))
(assert (= violation_144_5_or_144_6_measures false))
(assert (= act_171_1_violation_148_1_2_penalty false))
(assert (= violation_148_1_1_or_2 false))
(assert (= act_171_1_violation_148_2_penalty false))
(assert (= violation_148_2_1 false))
(assert (= act_171_1_violation_148_2_2_penalty false))
(assert (= violation_148_2_2 false))
(assert (= act_171_1_violation_148_3_1_penalty true))
(assert (= act_171_1_violation_148_3_2_penalty true))
(assert (= qualified_signing_personnel_human_insurance false))
(assert (= underwriting_personnel_qualified false))
(assert (= underwriting_experience_years 0))
(assert (= claims_personnel_qualified false))
(assert (= claims_experience_years 0))
(assert (= actuarial_personnel_qualified false))
(assert (= actuarial_experience_years 0))
(assert (= legal_personnel_qualified false))
(assert (= legal_experience_years 0))
(assert (= investment_personnel_qualified false))
(assert (= investment_experience_years 0))
(assert (= policy_service_personnel_qualified false))
(assert (= policy_service_experience_years 0))
(assert (= risk_management_personnel_qualified false))
(assert (= risk_management_experience_years 0))
(assert (= qualified_signing_personnel_property_insurance false))
(assert (= reserves_calculated_per_insurance_type false))
(assert (= reserves_recorded_in_special_books false))
(assert (= act_145_reserve_calculated_and_recorded false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 27
; Total variables: 85
; Total facts: 85
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
