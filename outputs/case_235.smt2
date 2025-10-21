; SMT2 file generated from compliance case automatic
; Case ID: case_235
; Generated at: 2025-10-21T05:10:59.961561
;
; This file can be executed with Z3:
;   z3 case_235.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_year Int)
(declare-const annual_consolidated_report_submission_days Int)
(declare-const annual_meeting_days_after_fiscal_year_end Int)
(declare-const annual_meeting_held Bool)
(declare-const annual_report_approved_by_board Bool)
(declare-const annual_report_approved_by_supervisors Bool)
(declare-const annual_report_audited_by_cpa Bool)
(declare-const annual_report_compliance Bool)
(declare-const annual_report_inconsistency_reported Bool)
(declare-const annual_report_inconsistency_reported_flag Bool)
(declare-const annual_report_signed_by_ceo_cfo_accounting Bool)
(declare-const annual_report_submission_days Int)
(declare-const application_documents_submitted Bool)
(declare-const auditor_suspended_and_no_successor Bool)
(declare-const authority_deadline_days_passed Int)
(declare-const board_and_supervisors_dismissed Bool)
(declare-const board_supervisors_term_expired Bool)
(declare-const change_of_auditor_not_internal Bool)
(declare-const change_of_ceo_or_major_board_members Bool)
(declare-const company_in_reorganization Bool)
(declare-const company_law_article_185_events Bool)
(declare-const court_prohibition_on_stock_transfer Bool)
(declare-const days_since_event Int)
(declare-const days_until_report_deadline Int)
(declare-const exempt_first_and_third_quarter_reports Bool)
(declare-const exempt_monthly_operating_report Bool)
(declare-const extension_application_eligibility Bool)
(declare-const extension_application_requirements Bool)
(declare-const extension_period_days Int)
(declare-const extension_period_limit Int)
(declare-const financial_institution_taken_over Bool)
(declare-const first_listing_company Bool)
(declare-const first_listing_second_quarter_report_rule Bool)
(declare-const force_majeure_occurred Bool)
(declare-const insufficient_deposit_or_bounced_check Bool)
(declare-const large_capital_annual_report_deadline Bool)
(declare-const litigation_or_administrative_action_impact Bool)
(declare-const material_event_definition Bool)
(declare-const material_event_occurred Bool)
(declare-const material_event_reported Bool)
(declare-const monthly_operating_report_compliance Bool)
(declare-const monthly_operating_report_submission_day Int)
(declare-const other_major_events_affecting_continuity Bool)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const quarterly_report_compliance Bool)
(declare-const quarterly_report_reported_to_board Bool)
(declare-const quarterly_report_reviewed_by_cpa Bool)
(declare-const quarterly_report_signed_by_ceo_cfo_accounting Bool)
(declare-const quarterly_report_submission_days Int)
(declare-const reorganization_period_authority Bool)
(declare-const second_listing_company Bool)
(declare-const second_listing_company_report_rules Bool)
(declare-const second_quarter_report_approved_by_board Bool)
(declare-const second_quarter_report_approved_by_supervisors Bool)
(declare-const second_quarter_report_audited Bool)
(declare-const second_quarter_report_submission_days Int)
(declare-const severe_production_reduction_or_asset_lease Bool)
(declare-const significant_memo_or_business_change Bool)
(declare-const special_circumstances_approved_by_authority Bool)
(declare-const special_circumstances_exemption Bool)
(declare-const special_extension_annual_report Bool)
(declare-const stock_listed_or_traded Bool)
(declare-const unlisted_unot_taipei_stock_exchange Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:annual_report_compliance] 年度財務報告於會計年度終了後三個月內公告申報，並經董事長、經理人及會計主管簽名或蓋章，會計師查核簽證，董事會通過及監察人承認
(assert (= annual_report_compliance
   (and (>= 90 annual_report_submission_days)
        annual_report_signed_by_ceo_cfo_accounting
        annual_report_audited_by_cpa
        annual_report_approved_by_board
        annual_report_approved_by_supervisors)))

; [securities:quarterly_report_compliance] 第一季、第二季及第三季財務報告於季終了後四十五日內公告申報，並經董事長、經理人及會計主管簽名或蓋章，會計師核閱及提報董事會
(assert (= quarterly_report_compliance
   (and (>= 45 quarterly_report_submission_days)
        quarterly_report_signed_by_ceo_cfo_accounting
        quarterly_report_reviewed_by_cpa
        quarterly_report_reported_to_board)))

; [securities:monthly_operating_report_compliance] 每月十日以前公告申報上月份營運情形
(assert (= monthly_operating_report_compliance
   (>= 10 monthly_operating_report_submission_day)))

; [securities:special_circumstances_exemption] 情形特殊經主管機關另行規定者，公告申報期限及事項可變更
(assert (= special_circumstances_exemption special_circumstances_approved_by_authority))

; [securities:annual_report_inconsistency_reported] 股東常會承認之年度財務報告與公告申報之年度財務報告不一致，應於事實發生日起二日內公告申報
(assert (= annual_report_inconsistency_reported
   annual_report_inconsistency_reported_flag))

; [securities:material_event_reported] 發生對股東權益或證券價格有重大影響事項，應於事實發生日起二日內公告申報
(assert (= material_event_reported material_event_occurred))

; [securities:annual_meeting_held] 股票已上市或於證券商營業處所買賣之公司股東常會，應於每會計年度終了後六個月內召開
(assert (= annual_meeting_held (>= 180 annual_meeting_days_after_fiscal_year_end)))

; [securities:board_and_supervisors_dismissed_if_no_meeting] 股票已上市或於證券商營業處所買賣之公司董事及監察人任期屆滿之年，董事會未依規定召開股東常會改選，主管機關限期召開屆期仍不召開者，董事及監察人解任
(assert (= board_and_supervisors_dismissed
   (and stock_listed_or_traded
        board_supervisors_term_expired
        (not annual_meeting_held)
        (<= 0 authority_deadline_days_passed))))

; [securities:reorganization_period_authority] 公司重整期間董事會及監察人職權由重整人及重整監督人行使
(assert (= reorganization_period_authority company_in_reorganization))

; [securities:material_event_definition] 重大影響事項定義依證券交易法施行細則第7條規定
(assert (= material_event_definition
   (or significant_memo_or_business_change
       change_of_auditor_not_internal
       severe_production_reduction_or_asset_lease
       change_of_ceo_or_major_board_members
       court_prohibition_on_stock_transfer
       litigation_or_administrative_action_impact
       other_major_events_affecting_continuity
       insufficient_deposit_or_bounced_check
       company_law_article_185_events)))

; [securities:special_extension_annual_report] 未上市未上櫃公司因作業時間不足，年度財報公告申報期限可延長至四個月，且可免公告申報第一季及第三季合併財報
(assert (= special_extension_annual_report
   (and unlisted_unot_taipei_stock_exchange
        (>= 120 annual_report_submission_days)
        exempt_first_and_third_quarter_reports)))

; [securities:second_listing_company_report_rules] 第二上市公司依註冊地國法令公告申報年度及期中合併財報，免公告申報每月營運情形，年度合併財報公告申報不得逾會計年度終了後六個月
(assert (= second_listing_company_report_rules
   (and second_listing_company
        (>= 180 annual_consolidated_report_submission_days)
        exempt_monthly_operating_report)))

; [securities:first_listing_second_quarter_report_rule] 自110會計年度起，第一上市公司第二季財報應經會計師查核簽證、董事會通過及監察人承認，公告申報不得逾季終了後二個月
(assert (= first_listing_second_quarter_report_rule
   (and (<= 110 accounting_year)
        first_listing_company
        second_quarter_report_audited
        second_quarter_report_approved_by_board
        second_quarter_report_approved_by_supervisors
        (>= 60 second_quarter_report_submission_days))))

; [securities:large_capital_annual_report_deadline] 自111會計年度起，實收資本額達100億元以上上市公司年度財報公告申報不得逾會計年度終了後75日
(assert (= large_capital_annual_report_deadline
   (and (<= 111 accounting_year)
        (<= 100000000000.0 paid_in_capital)
        (>= 75 annual_report_submission_days))))

; [securities:extension_application_eligibility] 發行人除第二上市公司外，因不可抗力等情形無法如期公告申報財報時，得申請延長公告申報期限
(assert (= extension_application_eligibility
   (and (not second_listing_company)
        (or auditor_suspended_and_no_successor
            force_majeure_occurred
            financial_institution_taken_over))))

; [securities:extension_application_requirements] 申請延長公告申報期限應於事實發生日起15日內且公告申報期限屆至前，檢具理由證明及擬展延期限向主管機關申請核准
(assert (= extension_application_requirements
   (and (>= 15 days_since_event)
        (>= 0 days_until_report_deadline)
        application_documents_submitted)))

; [securities:extension_period_limit] 公告申報期限延長以一個月為限，必要時得再延長
(assert (= extension_period_limit (ite (>= 31 extension_period_days) 1 0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反公告申報規定或未依主管機關規定申報或公告，或未於期限內申報重大事項，或未召開股東常會，或董事監察人未依規定改選時處罰
(assert (let ((a!1 (or (not quarterly_report_compliance)
               (and stock_listed_or_traded
                    (not board_and_supervisors_dismissed))
               (and (not special_circumstances_exemption)
                    (or (not annual_report_inconsistency_reported)
                        (not material_event_reported)))
               (not annual_meeting_held)
               (not annual_report_compliance)
               (not monthly_operating_report_compliance))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= accounting_year 106))
(assert (= annual_report_submission_days 120))
(assert (= annual_report_signed_by_ceo_cfo_accounting false))
(assert (= annual_report_audited_by_cpa false))
(assert (= annual_report_approved_by_board false))
(assert (= annual_report_approved_by_supervisors false))
(assert (= quarterly_report_submission_days 60))
(assert (= quarterly_report_signed_by_ceo_cfo_accounting false))
(assert (= quarterly_report_reviewed_by_cpa false))
(assert (= quarterly_report_reported_to_board false))
(assert (= special_circumstances_approved_by_authority false))
(assert (= special_circumstances_exemption false))
(assert (= annual_report_inconsistency_reported_flag false))
(assert (= annual_report_inconsistency_reported false))
(assert (= material_event_occurred false))
(assert (= material_event_reported false))
(assert (= annual_meeting_held true))
(assert (= stock_listed_or_traded true))
(assert (= board_supervisors_term_expired false))
(assert (= board_and_supervisors_dismissed false))
(assert (= application_documents_submitted false))
(assert (= force_majeure_occurred false))
(assert (= financial_institution_taken_over false))
(assert (= auditor_suspended_and_no_successor false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 64
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
