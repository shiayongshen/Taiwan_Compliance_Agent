; SMT2 file generated from compliance case automatic
; Case ID: case_332
; Generated at: 2025-10-19T13:26:44.915971
;
; This file can be executed with Z3:
;   z3 case_332.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_meeting_days_after_fiscal_year_end Int)
(declare-const annual_meeting_timing_compliance Bool)
(declare-const annual_report_approved_by_board Bool)
(declare-const annual_report_approved_by_supervisors Bool)
(declare-const annual_report_audited_by_accountant Bool)
(declare-const annual_report_compliance Bool)
(declare-const annual_report_inconsistent_with_shareholders_meeting Bool)
(declare-const annual_report_signed_by_ceo_cfo_accounting Bool)
(declare-const board_and_supervisors_dismissed_due_to_no_meeting Bool)
(declare-const board_and_supervisors_term_expired_this_year Bool)
(declare-const board_meeting_and_supervisors_term_compliance Bool)
(declare-const board_meeting_held_for_election Bool)
(declare-const board_meeting_not_held_for_election Bool)
(declare-const change_of_auditor_not_due_to_internal_adjustment Bool)
(declare-const change_of_chairman_or_general_manager_or_over_one_third_board_members Bool)
(declare-const company_law_article_185_events Bool)
(declare-const court_prohibition_on_stock_transfer Bool)
(declare-const insufficient_deposit_or_bounced_check_or_credit_loss Bool)
(declare-const litigation_or_administrative_action_affecting_finance_or_business Bool)
(declare-const material_event_affecting_shareholders_or_security_price Bool)
(declare-const material_event_definition Bool)
(declare-const monthly_operating_report_compliance Bool)
(declare-const monthly_operating_report_submitted_before_10th Bool)
(declare-const other_major_events_affecting_continuity Bool)
(declare-const penalty Bool)
(declare-const quarterly_report_compliance Bool)
(declare-const quarterly_report_reported_to_board Bool)
(declare-const quarterly_report_reviewed_by_accountant Bool)
(declare-const quarterly_report_signed_by_ceo_cfo_accounting Bool)
(declare-const regulator_called_meeting_expired Bool)
(declare-const severe_production_reduction_or_shutdown_or_asset_lease_or_pledge Bool)
(declare-const significant_memo_or_strategic_alliance_or_contract_change Bool)
(declare-const special_event_report_compliance Bool)
(declare-const special_event_report_submitted_within_2_days Bool)
(declare-const stock_listed_or_traded_at_broker Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:annual_report_compliance] 年度財務報告公告及申報符合董事長、經理人及會計主管簽名或蓋章，會計師查核簽證，董事會通過及監察人承認
(assert (= annual_report_compliance
   (and annual_report_signed_by_ceo_cfo_accounting
        annual_report_audited_by_accountant
        annual_report_approved_by_board
        annual_report_approved_by_supervisors)))

; [securities:quarterly_report_compliance] 第一季、第二季及第三季財務報告公告及申報符合董事長、經理人及會計主管簽名或蓋章，會計師核閱及提報董事會
(assert (= quarterly_report_compliance
   (and quarterly_report_signed_by_ceo_cfo_accounting
        quarterly_report_reviewed_by_accountant
        quarterly_report_reported_to_board)))

; [securities:monthly_operating_report_compliance] 每月十日前公告並申報上月份營運情形
(assert (= monthly_operating_report_compliance
   monthly_operating_report_submitted_before_10th))

; [securities:special_event_report_compliance] 特殊情事發生後二日內公告並申報
(assert (= special_event_report_compliance
   (and (or annual_report_inconsistent_with_shareholders_meeting
            material_event_affecting_shareholders_or_security_price)
        special_event_report_submitted_within_2_days)))

; [securities:annual_meeting_timing_compliance] 股票上市或於證券商營業處所買賣之公司股東常會於每會計年度終了後六個月內召開
(assert (= annual_meeting_timing_compliance
   (or (not stock_listed_or_traded_at_broker)
       (>= 180 annual_meeting_days_after_fiscal_year_end))))

; [securities:board_meeting_and_supervisors_term_compliance] 股票上市或於證券商營業處所買賣之公司董事及監察人任期屆滿之年，董事會依規定召開股東常會改選董事、監察人
(assert (= board_meeting_and_supervisors_term_compliance
   (or (not (and stock_listed_or_traded_at_broker
                 board_and_supervisors_term_expired_this_year))
       board_meeting_held_for_election)))

; [securities:board_and_supervisors_dismissal_due_to_no_meeting] 董事會未依規定召開股東常會改選董事、監察人者，主管機關得限期召開，屆期仍不召開者，全體董事及監察人解任
(assert (= board_and_supervisors_dismissed_due_to_no_meeting
   (and board_meeting_not_held_for_election regulator_called_meeting_expired)))

; [securities:material_event_definition] 重大影響股東權益或證券價格之事項定義
(assert (= material_event_definition
   (or litigation_or_administrative_action_affecting_finance_or_business
       significant_memo_or_strategic_alliance_or_contract_change
       company_law_article_185_events
       other_major_events_affecting_continuity
       change_of_chairman_or_general_manager_or_over_one_third_board_members
       court_prohibition_on_stock_transfer
       severe_production_reduction_or_shutdown_or_asset_lease_or_pledge
       insufficient_deposit_or_bounced_check_or_credit_loss
       change_of_auditor_not_due_to_internal_adjustment)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反公告申報及股東會召開等規定時處罰
(assert (= penalty
   (or (not monthly_operating_report_compliance)
       (not quarterly_report_compliance)
       (and stock_listed_or_traded_at_broker
            (not annual_meeting_timing_compliance))
       (not annual_report_compliance)
       (and stock_listed_or_traded_at_broker
            board_and_supervisors_term_expired_this_year
            (not board_meeting_and_supervisors_term_compliance))
       board_and_supervisors_dismissed_due_to_no_meeting
       (not special_event_report_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= material_event_affecting_shareholders_or_security_price true))
(assert (= special_event_report_submitted_within_2_days false))
(assert (= special_event_report_compliance false))
(assert (= penalty true))
(assert (= annual_meeting_days_after_fiscal_year_end 0))
(assert (= annual_meeting_timing_compliance false))
(assert (= annual_report_approved_by_board false))
(assert (= annual_report_approved_by_supervisors false))
(assert (= annual_report_audited_by_accountant false))
(assert (= annual_report_compliance false))
(assert (= annual_report_inconsistent_with_shareholders_meeting false))
(assert (= annual_report_signed_by_ceo_cfo_accounting false))
(assert (= board_and_supervisors_dismissed_due_to_no_meeting false))
(assert (= board_and_supervisors_term_expired_this_year false))
(assert (= board_meeting_and_supervisors_term_compliance false))
(assert (= board_meeting_held_for_election false))
(assert (= board_meeting_not_held_for_election false))
(assert (= change_of_auditor_not_due_to_internal_adjustment false))
(assert (= change_of_chairman_or_general_manager_or_over_one_third_board_members false))
(assert (= company_law_article_185_events false))
(assert (= court_prohibition_on_stock_transfer false))
(assert (= insufficient_deposit_or_bounced_check_or_credit_loss false))
(assert (= litigation_or_administrative_action_affecting_finance_or_business false))
(assert (= material_event_definition false))
(assert (= monthly_operating_report_compliance false))
(assert (= monthly_operating_report_submitted_before_10th false))
(assert (= other_major_events_affecting_continuity false))
(assert (= quarterly_report_compliance false))
(assert (= quarterly_report_reported_to_board false))
(assert (= quarterly_report_reviewed_by_accountant false))
(assert (= quarterly_report_signed_by_ceo_cfo_accounting false))
(assert (= regulator_called_meeting_expired false))
(assert (= severe_production_reduction_or_shutdown_or_asset_lease_or_pledge false))
(assert (= significant_memo_or_strategic_alliance_or_contract_change false))
(assert (= stock_listed_or_traded_at_broker false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 35
; Total facts: 35
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
