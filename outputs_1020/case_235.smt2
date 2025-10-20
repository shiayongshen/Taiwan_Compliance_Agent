; SMT2 file generated from compliance case automatic
; Case ID: case_235
; Generated at: 2025-10-19T11:01:37.247176
;
; This file can be executed with Z3:
;   z3 case_235.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_and_operating_report_compliance Bool)
(declare-const annual_and_operating_report_compliance_or_special Bool)
(declare-const annual_meeting_not_called_in_time Bool)
(declare-const annual_meeting_timing Real)
(declare-const annual_report_approved_by_board Bool)
(declare-const annual_report_approved_by_supervisors Bool)
(declare-const annual_report_audited_by_cpa Bool)
(declare-const annual_report_compliance Bool)
(declare-const annual_report_discrepancy_reported_within_2_days Bool)
(declare-const annual_report_signed_by_ceo_cfo_accounting Bool)
(declare-const annual_report_timing Real)
(declare-const board_and_supervisor_dismissal Bool)
(declare-const board_and_supervisor_dismissed Bool)
(declare-const days_after_fiscal_year_end Int)
(declare-const days_after_fiscal_year_end_for_annual_meeting Int)
(declare-const days_after_month_end Int)
(declare-const days_after_quarter_end Int)
(declare-const discrepancy_announcement Bool)
(declare-const extension_application_approved Bool)
(declare-const extension_application_submitted_within_15_days Bool)
(declare-const extension_period_days Int)
(declare-const extension_period_extended Bool)
(declare-const material_event_announcement Bool)
(declare-const material_event_reported_within_2_days Bool)
(declare-const monthly_operating_report_timing Real)
(declare-const penalty Bool)
(declare-const quarterly_report_compliance Bool)
(declare-const quarterly_report_reported_to_board Bool)
(declare-const quarterly_report_reviewed_by_cpa Bool)
(declare-const quarterly_report_signed_by_ceo_cfo_accounting Bool)
(declare-const quarterly_report_timing Real)
(declare-const reporting_compliance_with_extension Bool)
(declare-const reporting_delay_extension_approved Bool)
(declare-const reporting_delay_extension_compliance Bool)
(declare-const reporting_delay_extension_valid Bool)
(declare-const reporting_obligation_compliance Bool)
(declare-const special_circumstances_approved Bool)
(declare-const special_circumstances_regulation_by_authority Bool)
(declare-const stock_listed_or_traded Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:annual_report_compliance] 年度財務報告公告申報符合董事長、經理人及會計主管簽名或蓋章，會計師查核簽證，董事會通過及監察人承認
(assert (= annual_report_compliance
   (and annual_report_signed_by_ceo_cfo_accounting
        annual_report_audited_by_cpa
        annual_report_approved_by_board
        annual_report_approved_by_supervisors)))

; [securities:annual_report_timing] 年度財務報告於會計年度終了後三個月內公告並申報
(assert (= annual_report_timing (ite (>= 90 days_after_fiscal_year_end) 1.0 0.0)))

; [securities:quarterly_report_compliance] 第一季、第二季及第三季財務報告公告申報符合董事長、經理人及會計主管簽名或蓋章，會計師核閱及提報董事會
(assert (= quarterly_report_compliance
   (and quarterly_report_signed_by_ceo_cfo_accounting
        quarterly_report_reviewed_by_cpa
        quarterly_report_reported_to_board)))

; [securities:quarterly_report_timing] 第一季、第二季及第三季財務報告於季終了後四十五日內公告並申報
(assert (= quarterly_report_timing (ite (>= 45 days_after_quarter_end) 1.0 0.0)))

; [securities:monthly_operating_report_timing] 每月營運情形於次月十日以前公告並申報
(assert (= monthly_operating_report_timing (ite (>= 10 days_after_month_end) 1.0 0.0)))

; [securities:special_circumstances_approval] 特殊情形經主管機關另行規定公告申報期限及事項
(assert (= special_circumstances_approved special_circumstances_regulation_by_authority))

; [securities:discrepancy_announcement] 股東常會承認之年度財務報告與公告申報之年度財務報告不一致時，二日內公告並申報
(assert (= discrepancy_announcement annual_report_discrepancy_reported_within_2_days))

; [securities:material_event_announcement] 發生對股東權益或證券價格有重大影響事項時，二日內公告並申報
(assert (= material_event_announcement material_event_reported_within_2_days))

; [securities:annual_meeting_timing] 股票上市或於證券商營業處所買賣之公司股東常會於會計年度終了後六個月內召開
(assert (= annual_meeting_timing
   (ite (>= 180 days_after_fiscal_year_end_for_annual_meeting) 1.0 0.0)))

; [securities:board_and_supervisor_dismissal] 董事會未依規定召開股東常會改選董事監察人，主管機關得限期召開，屆期不召開者董事監察人解任
(assert (= board_and_supervisor_dismissal
   (or (not (and stock_listed_or_traded annual_meeting_not_called_in_time))
       board_and_supervisor_dismissed)))

; [securities:annual_report_and_operating_report_compliance] 公告申報年度財務報告、季報及每月營運情形符合規定
(assert (= annual_and_operating_report_compliance
   (and annual_report_compliance
        (= annual_report_timing 1.0)
        quarterly_report_compliance
        (= quarterly_report_timing 1.0)
        (= monthly_operating_report_timing 1.0))))

; [securities:annual_report_and_operating_report_compliance_or_special] 公告申報符合規定或經主管機關另行規定特殊情形
(assert (= annual_and_operating_report_compliance_or_special
   (or annual_and_operating_report_compliance special_circumstances_approved)))

; [securities:reporting_obligation_compliance] 公告申報義務符合所有規定
(assert (= reporting_obligation_compliance
   (and annual_and_operating_report_compliance_or_special
        discrepancy_announcement
        material_event_announcement)))

; [securities:reporting_delay_extension_approved] 因不可抗力或主管機關指派接管等情形申請延長公告申報期限且獲核准
(assert (= reporting_delay_extension_approved
   (and extension_application_submitted_within_15_days
        extension_application_approved)))

; [securities:reporting_delay_extension_valid] 公告申報期限延長以一個月為限，必要時得延長
(assert (= reporting_delay_extension_valid (>= 31 extension_period_days)))

; [securities:reporting_delay_extension_compliance] 公告申報期限延長申請符合規定
(assert (= reporting_delay_extension_compliance
   (and reporting_delay_extension_approved reporting_delay_extension_valid)))

; [securities:reporting_compliance_with_extension] 公告申報符合規定或經延長申請核准
(assert (= reporting_compliance_with_extension
   (or reporting_delay_extension_compliance reporting_obligation_compliance)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定公告申報或未於規定期限內公告申報且未獲核准延長者處罰
(assert (= penalty
   (or (not reporting_compliance_with_extension)
       (and stock_listed_or_traded
            annual_meeting_not_called_in_time
            (not board_and_supervisor_dismissal)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= annual_report_signed_by_ceo_cfo_accounting false))
(assert (= annual_report_audited_by_cpa false))
(assert (= annual_report_approved_by_board false))
(assert (= annual_report_approved_by_supervisors false))
(assert (= annual_report_timing 91.0))
(assert (= quarterly_report_signed_by_ceo_cfo_accounting false))
(assert (= quarterly_report_reviewed_by_cpa false))
(assert (= quarterly_report_reported_to_board false))
(assert (= quarterly_report_timing 46.0))
(assert (= annual_report_discrepancy_reported_within_2_days true))
(assert (= material_event_reported_within_2_days true))
(assert (= discrepancy_announcement true))
(assert (= material_event_announcement true))
(assert (= monthly_operating_report_timing 10.0))
(assert (= special_circumstances_regulation_by_authority false))
(assert (= stock_listed_or_traded true))
(assert (= annual_meeting_not_called_in_time false))
(assert (= board_and_supervisor_dismissal false))
(assert (= board_and_supervisor_dismissed false))
(assert (= extension_application_submitted_within_15_days false))
(assert (= extension_application_approved false))
(assert (= extension_period_days 0))
(assert (= extension_period_extended false))
(assert (= annual_and_operating_report_compliance false))
(assert (= annual_and_operating_report_compliance_or_special false))
(assert (= annual_meeting_timing 0.0))
(assert (= annual_report_compliance false))
(assert (= days_after_fiscal_year_end 0))
(assert (= days_after_fiscal_year_end_for_annual_meeting 0))
(assert (= days_after_month_end 0))
(assert (= days_after_quarter_end 0))
(assert (= penalty false))
(assert (= quarterly_report_compliance false))
(assert (= reporting_compliance_with_extension false))
(assert (= reporting_delay_extension_approved false))
(assert (= reporting_delay_extension_compliance false))
(assert (= reporting_delay_extension_valid false))
(assert (= reporting_obligation_compliance false))
(assert (= special_circumstances_approved false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 39
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
