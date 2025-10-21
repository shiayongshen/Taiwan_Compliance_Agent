; SMT2 file generated from compliance case automatic
; Case ID: case_312
; Generated at: 2025-10-21T07:01:09.294323
;
; This file can be executed with Z3:
;   z3 case_312.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const act_144_actuarial_staff_assigned Bool)
(declare-const act_144_board_approval_obtained Bool)
(declare-const act_144_external_review_engaged Bool)
(declare-const act_144_reports_fair_and_true Bool)
(declare-const actuarial_data_online_and_checked Bool)
(declare-const actuarial_staff_hired Bool)
(declare-const assumption_reasonableness_checked Bool)
(declare-const authority_orders_change_submission_method Bool)
(declare-const authorized_person_false_or_major_error_statement Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const corrections_completed_within_35_working_days Bool)
(declare-const corrections_completed_within_65_working_days Bool)
(declare-const documents_printed Bool)
(declare-const external_review_actuary_hired Bool)
(declare-const external_review_board_approved Bool)
(declare-const external_review_report_fair_and_true Bool)
(declare-const formal_development_done Bool)
(declare-const information_system_configured_and_tested Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_established_and_executed Bool)
(declare-const internal_handling_executed Bool)
(declare-const items_consistent_with_evaluation_results Bool)
(declare-const life_insurance_rate_setting_complied Bool)
(declare-const life_insurance_risk_assessment_complied Bool)
(declare-const life_insurance_risk_control_complied Bool)
(declare-const management_meeting_held Bool)
(declare-const meeting_recorded Bool)
(declare-const minor_violation_of_submission_method Bool)
(declare-const net_worth_ratio Real)
(declare-const own_capital Real)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const policy_and_calculation_consistent Bool)
(declare-const product_content_major_error_or_omission Bool)
(declare-const product_content_major_violation Bool)
(declare-const product_design_procedures_complied Bool)
(declare-const product_info_disclosed Bool)
(declare-const product_management_meeting_held_and_checked Bool)
(declare-const product_may_be_rejected_or_sales_stopped Bool)
(declare-const product_minor_violation_may_require_change_and_suspend Bool)
(declare-const product_research_done Bool)
(declare-const product_review_meeting_held Bool)
(declare-const profit_indicators_checked Bool)
(declare-const property_insurance_rate_setting_complied Bool)
(declare-const property_insurance_risk_control_complied Bool)
(declare-const rate_meets_authority_check_mechanism Bool)
(declare-const rate_not_unreasonable_pricing Bool)
(declare-const rate_pricing_adequate_reasonable_fair Bool)
(declare-const rate_reference_data_collected Bool)
(declare-const rate_reference_data_domestic_dominant Bool)
(declare-const rate_reference_data_original_obtained Bool)
(declare-const rate_reference_data_recent_3_to_5_years Bool)
(declare-const rate_reference_data_relevant Bool)
(declare-const rate_reflects_cost_and_profit Bool)
(declare-const record_sent_to_general_manager Bool)
(declare-const reinsurance_arrangement_evaluated Bool)
(declare-const rejected_three_times_cumulative Bool)
(declare-const reported_to_authority Bool)
(declare-const required_documents_missing_or_not_corrected_in_time Bool)
(declare-const required_procedures_followed Bool)
(declare-const review_meeting_held Bool)
(declare-const risk_assessment_results_appropriate Bool)
(declare-const risk_capital Real)
(declare-const risk_control_and_reinsurance_arranged Bool)
(declare-const sales_limit_meets_risk_tolerance Bool)
(declare-const sales_limit_warning_and_control_mechanism_included Bool)
(declare-const sales_preparation_procedures_complied Bool)
(declare-const sales_preparation_procedures_followed Bool)
(declare-const sales_suspended_until_resubmission_complete Bool)
(declare-const serious_violation_of_specified_articles Bool)
(declare-const signed_by_authorized_person Bool)
(declare-const signing_actuary_assigned Bool)
(declare-const signing_actuary_board_approved Bool)
(declare-const signing_report_fair_and_true Bool)
(declare-const submission_data_false Bool)
(declare-const submission_method_compliant Bool)
(declare-const submission_preparation_done Bool)
(declare-const total_assets_excluding_investment_type Real)
(declare-const training_conducted Bool)
(declare-const training_includes_65_plus_customer_guidance Bool)
(declare-const training_includes_customer_characteristics_guidance Bool)
(declare-const training_includes_unsuitable_customer_guidance Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:act_144_actuarial_staff_assigned] 保險業聘用精算人員並指派簽證精算人員
(assert (= act_144_actuarial_staff_assigned
   (and actuarial_staff_hired signing_actuary_assigned)))

; [insurance:act_144_external_review_engaged] 保險業聘請外部複核精算人員
(assert (= act_144_external_review_engaged external_review_actuary_hired))

; [insurance:act_144_board_approval_obtained] 簽證精算人員指派及外部複核精算人員聘請經董（理）事會同意
(assert (= act_144_board_approval_obtained
   (and signing_actuary_board_approved external_review_board_approved)))

; [insurance:act_144_reports_fair_and_true] 簽證報告及複核報告內容公正且無虛偽隱匿遺漏錯誤
(assert (= act_144_reports_fair_and_true
   (and signing_report_fair_and_true external_review_report_fair_and_true)))

; [insurance:internal_control_established_and_executed] 保險業建立並執行內部控制及稽核制度
(assert (= internal_control_established_and_executed
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_established_and_executed] 保險業建立並執行內部處理制度及程序
(assert (= internal_handling_established_and_executed
   (and internal_handling_established internal_handling_executed)))

; [insurance:sales_preparation_procedures_complied] 保險業銷售前程序依規定辦理
(assert (= sales_preparation_procedures_complied sales_preparation_procedures_followed))

; [insurance:product_design_procedures_complied] 保險商品設計程序包括商品研發、正式開發及送審準備並報主管機關備查
(assert (= product_design_procedures_complied
   (and product_research_done
        formal_development_done
        submission_preparation_done
        reported_to_authority)))

; [insurance:product_review_meeting_held] 保險商品評議小組評議並作成紀錄送總經理核閱
(assert (= product_review_meeting_held
   (and review_meeting_held meeting_recorded record_sent_to_general_manager)))

; [insurance:property_insurance_rate_setting_complied] 財產保險商品費率釐訂符合規定及檢核機制
(assert (= property_insurance_rate_setting_complied
   (and rate_reference_data_collected
        rate_reference_data_relevant
        rate_reference_data_recent_3_to_5_years
        rate_reference_data_domestic_dominant
        rate_reference_data_original_obtained
        rate_pricing_adequate_reasonable_fair
        rate_reflects_cost_and_profit
        rate_not_unreasonable_pricing
        rate_meets_authority_check_mechanism)))

; [insurance:property_insurance_risk_control_complied] 財產保險商品風險控管說明書內容符合規定
(assert (= property_insurance_risk_control_complied
   (and reinsurance_arrangement_evaluated
        sales_limit_warning_and_control_mechanism_included
        sales_limit_meets_risk_tolerance)))

; [insurance:product_management_meeting_held_and_checked] 保險商品管理小組會議召開並查核各項事項後始得銷售
(assert (= product_management_meeting_held_and_checked
   (and management_meeting_held
        product_info_disclosed
        actuarial_data_online_and_checked
        risk_control_and_reinsurance_arranged
        information_system_configured_and_tested
        documents_printed
        training_conducted
        training_includes_65_plus_customer_guidance
        training_includes_unsuitable_customer_guidance
        training_includes_customer_characteristics_guidance
        items_consistent_with_evaluation_results)))

; [insurance:product_may_be_rejected_or_sales_stopped] 保險商品有重大錯誤或違規情形主管機關得退回或停止銷售
(assert (= product_may_be_rejected_or_sales_stopped
   (or rejected_three_times_cumulative
       submission_data_false
       (not submission_method_compliant)
       product_content_major_violation
       (not signed_by_authorized_person)
       product_content_major_error_or_omission
       serious_violation_of_specified_articles
       (not corrections_completed_within_35_working_days)
       authorized_person_false_or_major_error_statement
       required_documents_missing_or_not_corrected_in_time
       (not corrections_completed_within_65_working_days)
       (not required_procedures_followed))))

; [insurance:product_minor_violation_may_require_change_and_suspend] 主管機關認定輕微違規得命改變送審方式並暫停銷售
(assert (= product_minor_violation_may_require_change_and_suspend
   (and minor_violation_of_submission_method
        authority_orders_change_submission_method
        sales_suspended_until_resubmission_complete)))

; [insurance:life_insurance_rate_setting_complied] 人身保險商品費率釐訂符合規定及檢核機制
(assert (= life_insurance_rate_setting_complied
   (and rate_reference_data_collected
        rate_reference_data_relevant
        rate_reference_data_recent_3_to_5_years
        rate_reference_data_domestic_dominant
        rate_reference_data_original_obtained
        rate_pricing_adequate_reasonable_fair
        rate_reflects_cost_and_profit
        rate_not_unreasonable_pricing)))

; [insurance:life_insurance_risk_control_complied] 人身保險商品風險控管說明書內容符合規定
(assert (= life_insurance_risk_control_complied
   (and reinsurance_arrangement_evaluated
        sales_limit_warning_and_control_mechanism_included
        sales_limit_meets_risk_tolerance)))

; [insurance:life_insurance_risk_assessment_complied] 人身保險商品檢測定價及風險評估符合規定
(assert (= life_insurance_risk_assessment_complied
   (and assumption_reasonableness_checked
        profit_indicators_checked
        risk_assessment_results_appropriate
        policy_and_calculation_consistent)))

; [insurance:capital_adequacy_ratio] 資本適足率計算
(assert (= capital_adequacy_ratio (* 100.0 (/ own_capital risk_capital))))

; [insurance:net_worth_ratio] 淨值比率計算
(assert (= net_worth_ratio
   (* 100.0 (/ owner_equity total_assets_excluding_investment_type))))

; [insurance:capital_level] 資本適足等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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
(let ((a!3 (ite (or (not (<= 0.0 net_worth_ratio))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反精算人員聘用、報告公正、內部控制或內部處理制度規定時處罰
(assert (= penalty
   (or (not internal_handling_established_and_executed)
       (not life_insurance_risk_assessment_complied)
       (not product_review_meeting_held)
       (not life_insurance_rate_setting_complied)
       (not life_insurance_risk_control_complied)
       (not act_144_reports_fair_and_true)
       (not product_design_procedures_complied)
       (not act_144_external_review_engaged)
       (not act_144_board_approval_obtained)
       (not product_management_meeting_held_and_checked)
       (and product_minor_violation_may_require_change_and_suspend
            (not product_management_meeting_held_and_checked))
       (not internal_control_established_and_executed)
       (not act_144_actuarial_staff_assigned)
       (not sales_preparation_procedures_complied)
       product_may_be_rejected_or_sales_stopped
       (not property_insurance_risk_control_complied)
       (not property_insurance_rate_setting_complied))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= actuarial_staff_hired false))
(assert (= signing_actuary_assigned false))
(assert (= external_review_actuary_hired false))
(assert (= signing_actuary_board_approved false))
(assert (= external_review_board_approved false))
(assert (= signing_report_fair_and_true false))
(assert (= external_review_report_fair_and_true false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= sales_preparation_procedures_followed false))
(assert (= product_research_done false))
(assert (= formal_development_done false))
(assert (= submission_preparation_done false))
(assert (= reported_to_authority false))
(assert (= review_meeting_held false))
(assert (= meeting_recorded false))
(assert (= record_sent_to_general_manager false))
(assert (= rate_reference_data_collected false))
(assert (= rate_reference_data_relevant false))
(assert (= rate_reference_data_recent_3_to_5_years false))
(assert (= rate_reference_data_domestic_dominant false))
(assert (= rate_reference_data_original_obtained false))
(assert (= rate_pricing_adequate_reasonable_fair false))
(assert (= rate_reflects_cost_and_profit false))
(assert (= rate_not_unreasonable_pricing false))
(assert (= rate_meets_authority_check_mechanism false))
(assert (= reinsurance_arrangement_evaluated false))
(assert (= sales_limit_warning_and_control_mechanism_included false))
(assert (= sales_limit_meets_risk_tolerance false))
(assert (= management_meeting_held false))
(assert (= product_info_disclosed false))
(assert (= actuarial_data_online_and_checked false))
(assert (= risk_control_and_reinsurance_arranged false))
(assert (= information_system_configured_and_tested false))
(assert (= documents_printed false))
(assert (= training_conducted false))
(assert (= training_includes_65_plus_customer_guidance false))
(assert (= training_includes_unsuitable_customer_guidance false))
(assert (= training_includes_customer_characteristics_guidance false))
(assert (= items_consistent_with_evaluation_results false))
(assert (= product_content_major_violation true))
(assert (= signed_by_authorized_person true))
(assert (= product_content_major_error_or_omission true))
(assert (= submission_data_false false))
(assert (= authorized_person_false_or_major_error_statement false))
(assert (= required_procedures_followed false))
(assert (= submission_method_compliant false))
(assert (= required_documents_missing_or_not_corrected_in_time true))
(assert (= serious_violation_of_specified_articles true))
(assert (= corrections_completed_within_65_working_days false))
(assert (= corrections_completed_within_35_working_days false))
(assert (= rejected_three_times_cumulative false))
(assert (= minor_violation_of_submission_method false))
(assert (= authority_orders_change_submission_method false))
(assert (= sales_suspended_until_resubmission_complete false))
(assert (= own_capital 1000000))
(assert (= risk_capital 1000000))
(assert (= owner_equity 500000))
(assert (= total_assets_excluding_investment_type 1000000))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 86
; Total facts: 61
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
