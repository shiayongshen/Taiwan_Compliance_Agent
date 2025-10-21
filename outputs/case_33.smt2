; SMT2 file generated from compliance case automatic
; Case ID: case_33
; Generated at: 2025-10-21T21:10:31.585567
;
; This file can be executed with Z3:
;   z3 case_33.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const academic_performance_good Bool)
(declare-const annual_report_audited Bool)
(declare-const annual_report_board_approved Bool)
(declare-const annual_report_submission_months_after_year_end Int)
(declare-const annual_report_supervisor_approved Bool)
(declare-const approval_reported_to_authority Bool)
(declare-const asset_insufficient_liability_improvement_required Bool)
(declare-const assets Real)
(declare-const business_guarantee_deposit_amount Real)
(declare-const business_guarantee_deposit_change_requires_approval Bool)
(declare-const business_guarantee_deposit_conditions Bool)
(declare-const business_guarantee_deposit_required Bool)
(declare-const department_and_staffing_requirements Bool)
(declare-const department_head_adequate_and_qualified Bool)
(declare-const deposit_amount_withdrawn Real)
(declare-const deposit_exempted_by_fiduciary_management Bool)
(declare-const deposit_exempted_by_overseas_fund Bool)
(declare-const deposit_institution_changed Bool)
(declare-const deposit_pledge_set Bool)
(declare-const deposit_provide_guarantee Bool)
(declare-const deposit_single_financial_institution Bool)
(declare-const deposit_type_bank Bool)
(declare-const deposit_type_cash Bool)
(declare-const deposit_type_financial_bond Bool)
(declare-const deposit_type_government_bond Bool)
(declare-const financial_accounting_department_established Bool)
(declare-const financial_report_annual_submission Bool)
(declare-const general_manager_count Int)
(declare-const general_manager_qualification Bool)
(declare-const general_manager_required Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const has_approved_college_degree Bool)
(declare-const has_securities_analyst_qualification Bool)
(declare-const improvement_ordered_by_authority Bool)
(declare-const improvement_period_months Int)
(declare-const investment_research_department_established Bool)
(declare-const liabilities Real)
(declare-const license_duration_months Int)
(declare-const manager_adequate_and_qualified Bool)
(declare-const net_asset_value_below_par_improvement_required Bool)
(declare-const net_asset_value_below_par_restriction Bool)
(declare-const net_asset_value_per_share Real)
(declare-const no_other_equivalent_responsibility Bool)
(declare-const other_qualifications_sufficient Bool)
(declare-const paid_in_capital Real)
(declare-const par_value_per_share Real)
(declare-const penalty Bool)
(declare-const professional_investment_experience_years Int)
(declare-const reopen_application_approved Bool)
(declare-const reopen_application_submitted Bool)
(declare-const responsible_personnel_qualification_met Bool)
(declare-const staff_adequate_and_qualified Bool)
(declare-const stop_business_application_once Bool)
(declare-const stop_business_application_submitted Bool)
(declare-const stop_business_approval_limit Bool)
(declare-const stop_business_duration_months Int)
(declare-const stop_business_permit_revoked_if_no_reopen Bool)
(declare-const stop_business_permit_revoked_if_unapproved_stop Bool)
(declare-const unapproved_stop_duration_months Int)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities_advisory:stop_business_approval_limit] 停業申請以一次為限，停業期間自核准日起不得超過一年
(assert (= stop_business_approval_limit
   (and stop_business_application_once (>= 12 stop_business_duration_months))))

; [securities_advisory:stop_business_permit_revoked_if_no_reopen] 停業屆期未申請復業或申請復業未獲核准，營業許可廢止
(assert (= stop_business_permit_revoked_if_no_reopen
   (or (not reopen_application_submitted) (not reopen_application_approved))))

; [securities_advisory:stop_business_permit_revoked_if_unapproved_stop] 未依規定申請停業而自行停業連續三個月以上，營業許可廢止
(assert (= stop_business_permit_revoked_if_unapproved_stop
   (and (not stop_business_application_submitted)
        (<= 3 unapproved_stop_duration_months))))

; [securities_advisory:business_guarantee_deposit_required] 應向符合條件金融機構提存新臺幣五百萬元營業保證金，除已依境外基金管理辦法或全權委託投資業務管理辦法提存者外
(assert (= business_guarantee_deposit_required
   (and (not deposit_exempted_by_overseas_fund)
        (not deposit_exempted_by_fiduciary_management)
        (= 5000000.0 guarantee_deposit_amount))))

; [securities_advisory:business_guarantee_deposit_conditions] 營業保證金應以現金、銀行存款、政府債券或金融債券提存，不得設定質權或以任何方式提供擔保，且不得分散提存於不同金融機構
(assert (= business_guarantee_deposit_conditions
   (and (or deposit_type_bank
            deposit_type_cash
            deposit_type_financial_bond
            deposit_type_government_bond)
        (not deposit_pledge_set)
        (not deposit_provide_guarantee)
        deposit_single_financial_institution)))

; [securities_advisory:business_guarantee_deposit_change_requires_approval] 提存金融機構更換或營業保證金提取應函報本會核准後始得為之
(assert (let ((a!1 (or approval_reported_to_authority
               (not (or deposit_institution_changed
                        (= deposit_amount_withdrawn 1.0))))))
  (= business_guarantee_deposit_change_requires_approval a!1)))

; [securities_advisory:financial_report_annual_submission] 每會計年度終了後三個月內，公告並向本會申報經會計師查核簽證、董事會通過及監察人承認之年度財務報告
(assert (= financial_report_annual_submission
   (and annual_report_audited
        annual_report_board_approved
        annual_report_supervisor_approved
        (>= 3 annual_report_submission_months_after_year_end))))

; [securities_advisory:net_asset_value_below_par_improvement_required] 每股淨值低於面額者，應於一年內改善
(assert (= net_asset_value_below_par_improvement_required
   (or (<= par_value_per_share net_asset_value_per_share)
       (>= 12 improvement_period_months))))

; [securities_advisory:net_asset_value_below_par_restriction] 屆期未改善者，本會得限制其於傳播媒體從事證券投資分析活動，但取得營業執照未滿一年者不在此限
(assert (= net_asset_value_below_par_restriction
   (and (not (<= improvement_period_months 12))
        (not (= 0 license_duration_months))
        (<= 12 license_duration_months))))

; [securities_advisory:asset_insufficient_liability_improvement_required] 資產不足抵償負債，經本會命令限期改善，屆期仍未改善者，本會得廢止營業許可
(assert (let ((a!1 (not (and (not (<= liabilities assets))
                     improvement_ordered_by_authority))))
  (= asset_insufficient_liability_improvement_required
     (or a!1 (>= 0 improvement_period_months)))))

; [securities_advisory:general_manager_required] 應置總經理一人，負責綜理全公司業務，且不得有其他職責相當之人
(assert (= general_manager_required
   (and (= 1 general_manager_count) no_other_equivalent_responsibility)))

; [securities_advisory:general_manager_qualification] 總經理應具備資格之一：證券投資分析人員資格且具一年以上專業投資機構經驗，或國內外專科以上學校畢業且具四年以上專業投資機構經驗且成績優良，或其他具證券金融專業知識、經營經驗及領導能力
(assert (= general_manager_qualification
   (or other_qualifications_sufficient
       (and has_approved_college_degree
            (<= 4 professional_investment_experience_years)
            academic_performance_good)
       (and has_securities_analyst_qualification
            (<= 1 professional_investment_experience_years)))))

; [securities_advisory:department_and_staffing_requirements] 應至少設置投資研究、財務會計部門，配置適足、適任經理人、部門主管及業務人員，並符合負責人與業務人員管理規則資格條件
(assert (= department_and_staffing_requirements
   (and investment_research_department_established
        financial_accounting_department_established
        manager_adequate_and_qualified
        department_head_adequate_and_qualified
        staff_adequate_and_qualified
        responsible_personnel_qualification_met)))

; [securities_advisory:business_guarantee_deposit_amount] 依實收資本額分級提存營業保證金
(assert (let ((a!1 (ite (and (<= 200000000.0 paid_in_capital)
                     (not (<= 300000000.0 paid_in_capital)))
                20000000.0
                (ite (<= 300000000.0 paid_in_capital) 25000000.0 0.0))))
(let ((a!2 (ite (and (<= 100000000.0 paid_in_capital)
                     (not (<= 200000000.0 paid_in_capital)))
                15000000.0
                a!1)))
  (= business_guarantee_deposit_amount
     (ite (<= 100000000.0 paid_in_capital) a!2 10000000.0)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反停業申請規定、未依規定提存營業保證金、未按時申報財務報告、未改善淨值或資產負債狀況、未符合總經理資格、未設置必要部門及人員等情形
(assert (= penalty
   (or stop_business_permit_revoked_if_no_reopen
       stop_business_permit_revoked_if_unapproved_stop
       (not financial_report_annual_submission)
       (not general_manager_qualification)
       (not asset_insufficient_liability_improvement_required)
       (not net_asset_value_below_par_improvement_required)
       (not business_guarantee_deposit_required)
       (not business_guarantee_deposit_conditions)
       (not stop_business_approval_limit)
       (not department_and_staffing_requirements)
       (not general_manager_required)
       (not business_guarantee_deposit_change_requires_approval))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= deposit_exempted_by_overseas_fund false))
(assert (= deposit_exempted_by_fiduciary_management false))
(assert (= guarantee_deposit_amount 5000000.0))
(assert (= business_guarantee_deposit_required true))
(assert (= deposit_amount_withdrawn 5000000.0))
(assert (= deposit_institution_changed false))
(assert (= approval_reported_to_authority false))
(assert (= business_guarantee_deposit_change_requires_approval false))
(assert (= business_guarantee_deposit_conditions false))
(assert (= annual_report_audited true))
(assert (= annual_report_board_approved true))
(assert (= annual_report_supervisor_approved true))
(assert (= annual_report_submission_months_after_year_end 4))
(assert (= assets 4000000.0))
(assert (= liabilities 5000000.0))
(assert (= improvement_ordered_by_authority true))
(assert (= improvement_period_months 0))
(assert (= asset_insufficient_liability_improvement_required true))
(assert (= general_manager_count 0))
(assert (= no_other_equivalent_responsibility true))
(assert (= general_manager_required false))
(assert (= general_manager_qualification false))
(assert (= has_securities_analyst_qualification false))
(assert (= has_approved_college_degree false))
(assert (= professional_investment_experience_years 0))
(assert (= academic_performance_good false))
(assert (= other_qualifications_sufficient false))
(assert (= investment_research_department_established false))
(assert (= financial_accounting_department_established false))
(assert (= manager_adequate_and_qualified false))
(assert (= department_head_adequate_and_qualified false))
(assert (= staff_adequate_and_qualified false))
(assert (= responsible_personnel_qualification_met false))
(assert (= department_and_staffing_requirements false))
(assert (= stop_business_application_once false))
(assert (= stop_business_duration_months 0))
(assert (= stop_business_application_submitted false))
(assert (= unapproved_stop_duration_months 0))
(assert (= stop_business_permit_revoked_if_unapproved_stop false))
(assert (= reopen_application_submitted false))
(assert (= reopen_application_approved false))
(assert (= stop_business_permit_revoked_if_no_reopen true))
(assert (= paid_in_capital 10000000.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 59
; Total facts: 43
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
