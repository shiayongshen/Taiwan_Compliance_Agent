; SMT2 file generated from compliance case automatic
; Case ID: case_332
; Generated at: 2025-10-21T07:28:45.886293
;
; This file can be executed with Z3:
;   z3 case_332.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_meeting_held Bool)
(declare-const annual_report_acknowledged_by_supervisors Bool)
(declare-const annual_report_approved_by_board Bool)
(declare-const annual_report_audited_by_cpa Bool)
(declare-const annual_report_inconsistent_with_shareholders_meeting Bool)
(declare-const annual_report_signed_by_ceo_cfo_accounting Bool)
(declare-const annual_report_submitted Bool)
(declare-const board_and_supervisors_dismissed Bool)
(declare-const board_and_supervisors_term_expired_meeting_held Bool)
(declare-const board_and_supervisors_term_expired_year Int)
(declare-const day_of_month Int)
(declare-const days_after_fiscal_year_end Int)
(declare-const days_after_quarter_end Int)
(declare-const days_since_special_event Int)
(declare-const deadline_passed Bool)
(declare-const event_board_or_ceo_change Bool)
(declare-const event_company_law_185 Bool)
(declare-const event_cpa_change Bool)
(declare-const event_deposit_insufficient_or_bounced Bool)
(declare-const event_important_memo_or_contract_change Bool)
(declare-const event_litigation_or_admin_action Bool)
(declare-const event_other_major_impact Bool)
(declare-const event_production_reduction_or_asset_lease Bool)
(declare-const event_stock_transfer_prohibition Bool)
(declare-const major_impact_event_occurred Bool)
(declare-const monthly_operation_report_submitted Bool)
(declare-const penalty Bool)
(declare-const quarter Int)
(declare-const quarterly_report_reported_to_board Bool)
(declare-const quarterly_report_reviewed_by_cpa Bool)
(declare-const quarterly_report_signed_by_ceo_cfo_accounting Bool)
(declare-const quarterly_report_submitted Bool)
(declare-const regulator_forced_meeting_held Bool)
(declare-const special_event_occurred Bool)
(declare-const special_event_report_submitted Bool)
(declare-const special_event_type Int)
(declare-const special_event_type_1 Int)
(declare-const special_event_type_2 Int)
(declare-const stock_listed_or_traded Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:annual_report_submitted] 每會計年度終了後三個月內公告並申報經董事長、經理人及會計主管簽名或蓋章，經會計師查核簽證、董事會通過及監察人承認之年度財務報告
(assert (= annual_report_submitted
   (and annual_report_signed_by_ceo_cfo_accounting
        annual_report_audited_by_cpa
        annual_report_approved_by_board
        annual_report_acknowledged_by_supervisors
        (>= 90.0 (to_real days_after_fiscal_year_end)))))

; [securities:quarterly_report_submitted] 每會計年度第一季、第二季及第三季終了後四十五日內公告並申報經董事長、經理人及會計主管簽名或蓋章，經會計師核閱及提報董事會之財務報告
(assert (= quarterly_report_submitted
   (and quarterly_report_signed_by_ceo_cfo_accounting
        quarterly_report_reviewed_by_cpa
        quarterly_report_reported_to_board
        (>= 45.0 (to_real days_after_quarter_end))
        (or (= 1 quarter) (= 2 quarter) (= 3 quarter)))))

; [securities:monthly_operation_report_submitted] 每月十日以前公告並申報上月份營運情形
(assert (= monthly_operation_report_submitted (>= 10.0 (to_real day_of_month))))

; [securities:special_event_report_submitted] 發生特定重大事項後二日內公告並申報
(assert (= special_event_report_submitted
   (and special_event_occurred
        (>= 2.0 (to_real days_since_special_event))
        (or (= 1 special_event_type) (= 2 special_event_type)))))

; [securities:special_event_type_1] 股東常會承認之年度財務報告與公告並申報之年度財務報告不一致
(assert (= special_event_type_1
   (ite annual_report_inconsistent_with_shareholders_meeting 1 0)))

; [securities:special_event_type_2] 發生對股東權益或證券價格有重大影響之事項
(assert (= special_event_type_2 (ite major_impact_event_occurred 1 0)))

; [securities:annual_meeting_held] 股票已上市或於證券商營業處所買賣之公司股東常會於每會計年度終了後六個月內召開
(assert (= annual_meeting_held
   (and (>= 180.0 (to_real days_after_fiscal_year_end)) stock_listed_or_traded)))

; [securities:board_and_supervisors_term_expired_meeting_held] 董事及監察人任期屆滿之年，董事會依規定召開股東常會改選董事、監察人
(assert (let ((a!1 (or (not (and (= board_and_supervisors_term_expired_year 1)
                         stock_listed_or_traded))
               annual_meeting_held)))
  (= board_and_supervisors_term_expired_meeting_held a!1)))

; [securities:board_and_supervisors_dismissed_if_meeting_not_held] 董事會未依規定召開股東常會改選董事、監察人者，主管機關得限期召開，屆期仍不召開者，全體董事及監察人當然解任
(assert (= board_and_supervisors_dismissed
   (and (= board_and_supervisors_term_expired_year 1)
        stock_listed_or_traded
        (not annual_meeting_held)
        (not regulator_forced_meeting_held)
        deadline_passed)))

; [securities:major_impact_event_definition] 重大影響事項定義
(assert (= major_impact_event_occurred
   (or event_company_law_185
       event_stock_transfer_prohibition
       event_important_memo_or_contract_change
       event_litigation_or_admin_action
       event_other_major_impact
       event_production_reduction_or_asset_lease
       event_deposit_insufficient_or_bounced
       event_cpa_change
       event_board_or_ceo_change)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反公告及申報規定時處罰
(assert (= penalty
   (or (not monthly_operation_report_submitted)
       (and special_event_occurred (not special_event_report_submitted))
       (and (= board_and_supervisors_term_expired_year 1)
            (not annual_meeting_held))
       (not quarterly_report_submitted)
       (not annual_report_submitted))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= special_event_occurred true))
(assert (= days_since_special_event 14))
(assert (= special_event_report_submitted false))
(assert (= event_litigation_or_admin_action true))
(assert (= special_event_type 2))
(assert (= special_event_type_2 2))
(assert (= penalty true))
(assert (= annual_report_signed_by_ceo_cfo_accounting true))
(assert (= annual_report_audited_by_cpa true))
(assert (= annual_report_approved_by_board true))
(assert (= annual_report_acknowledged_by_supervisors true))
(assert (= annual_report_submitted true))
(assert (= quarterly_report_signed_by_ceo_cfo_accounting true))
(assert (= quarterly_report_reviewed_by_cpa true))
(assert (= quarterly_report_reported_to_board true))
(assert (= quarterly_report_submitted true))
(assert (= monthly_operation_report_submitted true))
(assert (= annual_meeting_held true))
(assert (= board_and_supervisors_term_expired_year 0))
(assert (= board_and_supervisors_term_expired_meeting_held true))
(assert (= board_and_supervisors_dismissed false))
(assert (= regulator_forced_meeting_held false))
(assert (= deadline_passed false))
(assert (= day_of_month 1))
(assert (= days_after_fiscal_year_end 1))
(assert (= days_after_quarter_end 1))
(assert (= quarter 1))
(assert (= stock_listed_or_traded true))
(assert (= annual_report_inconsistent_with_shareholders_meeting false))
(assert (= special_event_type_1 0))
(assert (= event_board_or_ceo_change false))
(assert (= event_company_law_185 false))
(assert (= event_cpa_change false))
(assert (= event_deposit_insufficient_or_bounced false))
(assert (= event_important_memo_or_contract_change false))
(assert (= event_other_major_impact false))
(assert (= event_production_reduction_or_asset_lease false))
(assert (= event_stock_transfer_prohibition false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 39
; Total facts: 38
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
