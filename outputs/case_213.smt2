; SMT2 file generated from compliance case automatic
; Case ID: case_213
; Generated at: 2025-10-21T04:44:42.159125
;
; This file can be executed with Z3:
;   z3 case_213.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_year Int)
(declare-const annual_report_approved_by_board Bool)
(declare-const annual_report_approved_by_supervisor Bool)
(declare-const annual_report_audited_by_accountant Bool)
(declare-const annual_report_compliance Bool)
(declare-const annual_report_consistency Bool)
(declare-const annual_report_distributed Bool)
(declare-const annual_report_prepared_and_distributed Bool)
(declare-const annual_report_shareholders_meeting_approved Bool)
(declare-const annual_report_signed_by_ceo_manager_accountant Bool)
(declare-const annual_report_timing Int)
(declare-const annual_shareholders_meeting_timing Int)
(declare-const board_and_supervisor_dismissal_due_to_no_meeting Bool)
(declare-const board_and_supervisor_dismissed Bool)
(declare-const board_and_supervisor_duties_reorganization Bool)
(declare-const board_failed_to_call_meeting_for_election Bool)
(declare-const board_supervisor_dismissal_due_to_no_meeting Bool)
(declare-const board_supervisor_duties_reorganization Bool)
(declare-const company_in_reorganization Bool)
(declare-const comply_registered_or_listed_country_laws Bool)
(declare-const day_of_month Int)
(declare-const days_after_fiscal_year_end Int)
(declare-const days_after_quarter_end Int)
(declare-const days_after_second_quarter_end Int)
(declare-const duties_exercised_by_reorganizer Bool)
(declare-const exempt_first_and_third_quarter_reports Bool)
(declare-const exempt_monthly_operation_report Bool)
(declare-const first_listing_company Bool)
(declare-const first_listing_second_quarter_report_requirements Bool)
(declare-const large_capital_annual_report_deadline Int)
(declare-const monthly_operation_report_compliance Bool)
(declare-const monthly_operation_report_content_ok Bool)
(declare-const monthly_report_includes_consolidated_revenue Bool)
(declare-const monthly_report_includes_guarantee_amount Bool)
(declare-const monthly_report_includes_other_required_items Bool)
(declare-const not_listed_nor_over_the_counter Bool)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const quarterly_report_compliance Bool)
(declare-const quarterly_report_reported_to_board Bool)
(declare-const quarterly_report_reviewed_by_accountant Bool)
(declare-const quarterly_report_signed_by_ceo_manager_accountant Bool)
(declare-const quarterly_report_timing Int)
(declare-const regulator_called_meeting_deadline_passed Bool)
(declare-const second_listing_company Bool)
(declare-const second_listing_report_requirements Bool)
(declare-const second_quarter_report_approved_by_board Bool)
(declare-const second_quarter_report_approved_by_supervisor Bool)
(declare-const second_quarter_report_audited Bool)
(declare-const significant_event_reported Bool)
(declare-const significant_event_reported_flag Bool)
(declare-const special_circumstances_annual_report_extension Bool)
(declare-const stock_listed_or_traded Bool)
(declare-const violation_36_report_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:annual_report_compliance] 年度財務報告公告申報符合董事長、經理人及會計主管簽名或蓋章，會計師查核簽證，董事會通過及監察人承認
(assert (= annual_report_compliance
   (and annual_report_signed_by_ceo_manager_accountant
        annual_report_audited_by_accountant
        annual_report_approved_by_board
        annual_report_approved_by_supervisor)))

; [securities:annual_report_timing] 年度財務報告於會計年度終了後三個月內公告申報
(assert (= annual_report_timing (ite (>= 90 days_after_fiscal_year_end) 1 0)))

; [securities:quarterly_report_compliance] 第一季、第二季及第三季財務報告公告申報符合董事長、經理人及會計主管簽名或蓋章，會計師核閱及提報董事會
(assert (= quarterly_report_compliance
   (and quarterly_report_signed_by_ceo_manager_accountant
        quarterly_report_reviewed_by_accountant
        quarterly_report_reported_to_board)))

; [securities:quarterly_report_timing] 第一季、第二季及第三季財務報告於季終了後四十五日內公告申報
(assert (= quarterly_report_timing (ite (>= 45 days_after_quarter_end) 1 0)))

; [securities:monthly_operation_report_compliance] 每月十日以前公告申報上月份營運情形
(assert (= monthly_operation_report_compliance (>= 10 day_of_month)))

; [securities:monthly_operation_report_content] 營運情形公告申報包含合併營業收入額、為他人背書及保證金額及主管機關所定事項
(assert (= monthly_operation_report_content_ok
   (and monthly_report_includes_consolidated_revenue
        monthly_report_includes_guarantee_amount
        monthly_report_includes_other_required_items)))

; [securities:annual_report_consistency_report] 股東常會承認之年度財務報告與公告申報之年度財務報告一致
(assert (= annual_report_consistency annual_report_shareholders_meeting_approved))

; [securities:significant_event_reported] 重大影響股東權益或證券價格事項已公告申報
(assert (= significant_event_reported significant_event_reported_flag))

; [securities:annual_report_distributed_to_shareholders] 年度報告編製並於股東常會分送股東
(assert (= annual_report_distributed annual_report_prepared_and_distributed))

; [securities:annual_shareholders_meeting_timing] 股票上市或於證券商營業處所買賣之公司股東常會於會計年度終了後六個月內召開
(assert (= annual_shareholders_meeting_timing
   (ite (>= 180 days_after_fiscal_year_end) 1 0)))

; [securities:board_and_supervisor_duties_in_reorganization] 公司重整期間董事會及監察人職權由重整人及重整監督人行使
(assert (= board_supervisor_duties_reorganization
   (or duties_exercised_by_reorganizer (not company_in_reorganization))))

; [securities:board_and_supervisor_dismissal_due_to_no_meeting] 董事會未依規定召開股東常會改選董事監察人，主管機關得限期召開，屆期仍不召開者董事監察人解任
(assert (= board_supervisor_dismissal_due_to_no_meeting
   (or (not (and stock_listed_or_traded
                 board_failed_to_call_meeting_for_election
                 regulator_called_meeting_deadline_passed))
       board_and_supervisor_dismissed)))

; [securities:special_circumstances_extension_annual_report] 未上市未上櫃公司因作業時間不及，年度財報公告申報期限可延長至四個月，且免公告申報第一季及第三季合併財報
(assert (= special_circumstances_annual_report_extension
   (and not_listed_nor_over_the_counter
        (>= 120 days_after_fiscal_year_end)
        exempt_first_and_third_quarter_reports)))

; [securities:second_listing_report_requirements] 第二上市公司依註冊地或上市地國法令公告申報年度及期中合併財報，免公告申報每月營運情形，年度合併財報公告申報不得逾會計年度終了後六個月
(assert (= second_listing_report_requirements
   (and second_listing_company
        comply_registered_or_listed_country_laws
        exempt_monthly_operation_report
        (>= 180 days_after_fiscal_year_end))))

; [securities:first_listing_second_quarter_report_requirements] 第一上市公司自110會計年度起第二季財報須會計師查核簽證、董事會通過及監察人承認，公告申報不得逾第二季終了後兩個月
(assert (= first_listing_second_quarter_report_requirements
   (and first_listing_company
        (<= 110 accounting_year)
        second_quarter_report_audited
        second_quarter_report_approved_by_board
        second_quarter_report_approved_by_supervisor
        (>= 60 days_after_second_quarter_end))))

; [securities:large_capital_annual_report_deadline] 實收資本額達100億元以上上市公司公告申報年度財報不得逾會計年度終了後75日
(assert (let ((a!1 (ite (or (not (<= 100000000000.0 paid_in_capital))
                    (>= 75 days_after_fiscal_year_end))
                1
                0)))
  (= large_capital_annual_report_deadline a!1)))

; [securities:violation_36_report_penalty] 違反第36條公告申報規定之處罰
(assert (= violation_36_report_penalty
   (or (not annual_report_consistency)
       (not annual_report_distributed)
       (not quarterly_report_compliance)
       (not special_circumstances_annual_report_extension)
       (not (= quarterly_report_timing 1))
       (not board_and_supervisor_duties_reorganization)
       (not board_and_supervisor_dismissal_due_to_no_meeting)
       (not monthly_operation_report_content_ok)
       (not (= large_capital_annual_report_deadline 1))
       (not (= annual_shareholders_meeting_timing 1))
       (not second_listing_report_requirements)
       (not monthly_operation_report_compliance)
       (not (= annual_report_timing 1))
       (not significant_event_reported)
       (not annual_report_compliance)
       (not first_listing_second_quarter_report_requirements))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法第36條公告申報規定時處罰
(assert (= penalty violation_36_report_penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= accounting_year 106))
(assert (= annual_report_signed_by_ceo_manager_accountant false))
(assert (= annual_report_audited_by_accountant false))
(assert (= annual_report_approved_by_board false))
(assert (= annual_report_approved_by_supervisor false))
(assert (= days_after_fiscal_year_end 120))
(assert (= not_listed_nor_over_the_counter true))
(assert (= exempt_first_and_third_quarter_reports true))
(assert (= quarterly_report_signed_by_ceo_manager_accountant false))
(assert (= quarterly_report_reviewed_by_accountant false))
(assert (= quarterly_report_reported_to_board false))
(assert (= days_after_quarter_end 50))
(assert (= monthly_operation_report_compliance false))
(assert (= monthly_report_includes_consolidated_revenue false))
(assert (= monthly_report_includes_guarantee_amount false))
(assert (= monthly_report_includes_other_required_items false))
(assert (= annual_report_consistency false))
(assert (= annual_report_shareholders_meeting_approved false))
(assert (= annual_report_prepared_and_distributed false))
(assert (= annual_report_distributed false))
(assert (= annual_shareholders_meeting_timing 200))
(assert (= significant_event_reported_flag false))
(assert (= stock_listed_or_traded false))
(assert (= board_failed_to_call_meeting_for_election false))
(assert (= regulator_called_meeting_deadline_passed false))
(assert (= board_and_supervisor_duties_reorganization false))
(assert (= company_in_reorganization false))
(assert (= duties_exercised_by_reorganizer false))
(assert (= second_listing_company false))
(assert (= comply_registered_or_listed_country_laws false))
(assert (= exempt_monthly_operation_report false))
(assert (= first_listing_company false))
(assert (= second_quarter_report_audited false))
(assert (= second_quarter_report_approved_by_board false))
(assert (= second_quarter_report_approved_by_supervisor false))
(assert (= days_after_second_quarter_end 70))
(assert (= paid_in_capital 50000000))
(assert (= penalty true))
(assert (= violation_36_report_penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 54
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
