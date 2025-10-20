; SMT2 file generated from compliance case automatic
; Case ID: case_213
; Generated at: 2025-10-19T10:37:56.239098
;
; This file can be executed with Z3:
;   z3 case_213.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_year Int)
(declare-const annual_meeting_days_since_fiscal_year_end Int)
(declare-const annual_meeting_held Bool)
(declare-const annual_report_approved_by_board Bool)
(declare-const annual_report_approved_by_supervisors Bool)
(declare-const annual_report_audited_by_accountant Bool)
(declare-const annual_report_discrepant Bool)
(declare-const annual_report_prepared_and_distributed Bool)
(declare-const annual_report_prepared_and_distributed_to_shareholders Bool)
(declare-const annual_report_signed_by_ceo_manager_accountant Bool)
(declare-const annual_report_submission_days Int)
(declare-const annual_report_submitted Bool)
(declare-const board_and_supervisors_dismissed Bool)
(declare-const board_failed_to_call_annual_meeting Bool)
(declare-const board_term_expired Bool)
(declare-const company_in_reorganization_period Bool)
(declare-const comply_registered_or_listed_country_laws Bool)
(declare-const discrepant_annual_report_reported Bool)
(declare-const discrepant_report_days_since_occurrence Int)
(declare-const excluded_by_articles_177_and_178 Bool)
(declare-const exempt_first_and_third_quarter_reports Bool)
(declare-const exempt_monthly_operation_report Bool)
(declare-const fail_to_prepare_or_report_documents Bool)
(declare-const fail_to_submit_or_obstruct_inspection Bool)
(declare-const first_listing_company Bool)
(declare-const first_listing_second_quarter_report_rules Bool)
(declare-const include_consolidated_revenue Bool)
(declare-const include_endorsement_and_guarantee_amount Bool)
(declare-const include_other_regulator_defined_items Bool)
(declare-const large_capital_annual_report_deadline Bool)
(declare-const legal_entity_violated Bool)
(declare-const material_event_occurred Bool)
(declare-const material_event_report_days_since_occurrence Int)
(declare-const material_event_reported Bool)
(declare-const monthly_operation_report_for_previous_month Bool)
(declare-const monthly_operation_report_items_defined Bool)
(declare-const monthly_operation_report_submission_day Int)
(declare-const monthly_operation_report_submitted Bool)
(declare-const not_listed_or_taipei_over_the_counter Bool)
(declare-const paid_in_capital_ntd Int)
(declare-const penalty Bool)
(declare-const quarterly_report_reported_to_board Bool)
(declare-const quarterly_report_reviewed_by_accountant Bool)
(declare-const quarterly_report_signed_by_ceo_manager_accountant Bool)
(declare-const quarterly_report_submission_days Int)
(declare-const quarterly_report_submitted Bool)
(declare-const regulator_called_meeting_expired Bool)
(declare-const reorganization_period_board_supervisor_powers Bool)
(declare-const report_copies_sent Bool)
(declare-const report_copies_sent_to_designated_agency Bool)
(declare-const report_copies_sent_to_exchange Bool)
(declare-const second_listing_company Bool)
(declare-const second_listing_company_report_rules Bool)
(declare-const second_quarter_report_approved_by_board Bool)
(declare-const second_quarter_report_approved_by_supervisors Bool)
(declare-const second_quarter_report_audited_by_accountant Bool)
(declare-const second_quarter_report_submission_days Int)
(declare-const special_circumstances_applied Bool)
(declare-const special_circumstances_approved Bool)
(declare-const special_circumstances_extension_annual_report Bool)
(declare-const violate_article_14_4_or_165_1_applied_14_4 Bool)
(declare-const violate_article_14_6_or_165_1_applied_14_6 Bool)
(declare-const violate_article_22_2_1_or_2 Bool)
(declare-const violate_article_25_1_or_165_1_applied_25_1 Bool)
(declare-const violate_article_26_1_or_165_1_applied_22_2_1_or_2 Bool)
(declare-const violate_article_26_3_or_165_1_applied_26_3 Bool)
(declare-const violate_article_28_2_or_165_1_applied_28_2 Bool)
(declare-const violate_article_36_1_or_165_1_applied_36_1 Bool)
(declare-const violate_article_43_2_or_43_3_or_43_5_or_165_1_or_165_2_applied Bool)
(declare-const violate_director_supervisor_shareholding_rules Bool)
(declare-const violation_178 Bool)
(declare-const violation_179 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:annual_report_submitted] 每會計年度終了後三個月內公告並申報經董事長、經理人及會計主管簽名或蓋章，經會計師查核簽證、董事會通過及監察人承認之年度財務報告
(assert (= annual_report_submitted
   (and (>= 90 annual_report_submission_days)
        annual_report_signed_by_ceo_manager_accountant
        annual_report_audited_by_accountant
        annual_report_approved_by_board
        annual_report_approved_by_supervisors)))

; [securities:quarterly_report_submitted] 每會計年度第一季、第二季及第三季終了後四十五日內公告並申報經董事長、經理人及會計主管簽名或蓋章，經會計師核閱及提報董事會之財務報告
(assert (= quarterly_report_submitted
   (and (>= 45 quarterly_report_submission_days)
        quarterly_report_signed_by_ceo_manager_accountant
        quarterly_report_reviewed_by_accountant
        quarterly_report_reported_to_board)))

; [securities:monthly_operation_report_submitted] 每月十日以前公告並申報上月份營運情形
(assert (= monthly_operation_report_submitted
   (and (>= 10 monthly_operation_report_submission_day)
        monthly_operation_report_for_previous_month)))

; [securities:special_circumstances_approved] 主管機關另定特殊情形適用範圍、公告、申報期限及其他應遵行事項
(assert (= special_circumstances_approved special_circumstances_applied))

; [securities:discrepant_annual_report_reported] 股東常會承認之年度財務報告與公告申報之年度財務報告不一致，於事實發生日起二日內公告並申報
(assert (= discrepant_annual_report_reported
   (and annual_report_discrepant (>= 2 discrepant_report_days_since_occurrence))))

; [securities:material_event_reported] 發生對股東權益或證券價格有重大影響事項，於事實發生日起二日內公告並申報
(assert (= material_event_reported
   (and material_event_occurred
        (>= 2 material_event_report_days_since_occurrence))))

; [securities:annual_meeting_held] 股票已上市或於證券商營業處所買賣之公司股東常會，於每會計年度終了後六個月內召開
(assert (= annual_meeting_held (>= 180 annual_meeting_days_since_fiscal_year_end)))

; [securities:board_failed_to_call_annual_meeting] 股票已上市或於證券商營業處所買賣之公司董事及監察人任期屆滿之年，董事會未依規定召開股東常會改選董事、監察人
(assert (= board_failed_to_call_annual_meeting
   (and board_term_expired (not annual_meeting_held))))

; [securities:board_and_supervisors_dismissed] 董事會未召開股東常會改選，主管機關限期召開屆期仍不召開者，全體董事及監察人當然解任
(assert (= board_and_supervisors_dismissed
   (and board_failed_to_call_annual_meeting regulator_called_meeting_expired)))

; [securities:reorganization_period_board_supervisor_powers] 公司重整期間董事會及監察人職權由重整人及重整監督人行使
(assert (= reorganization_period_board_supervisor_powers
   company_in_reorganization_period))

; [securities:annual_report_prepared_and_distributed] 公司應編製年報，於股東常會分送股東
(assert (= annual_report_prepared_and_distributed
   annual_report_prepared_and_distributed_to_shareholders))

; [securities:report_copies_sent] 公告申報事項及年報抄本送證券交易所或主管機關指定機構供公眾閱覽
(assert (= report_copies_sent
   (or report_copies_sent_to_exchange report_copies_sent_to_designated_agency)))

; [securities:violation_178] 違反證券交易法第178條規定之行為
(assert (= violation_178
   (or violate_article_14_6_or_165_1_applied_14_6
       violate_director_supervisor_shareholding_rules
       violate_article_28_2_or_165_1_applied_28_2
       violate_article_26_3_or_165_1_applied_26_3
       violate_article_25_1_or_165_1_applied_25_1
       fail_to_submit_or_obstruct_inspection
       violate_article_14_4_or_165_1_applied_14_4
       violate_article_36_1_or_165_1_applied_36_1
       fail_to_prepare_or_report_documents
       violate_article_43_2_or_43_3_or_43_5_or_165_1_or_165_2_applied
       violate_article_22_2_1_or_2
       violate_article_26_1_or_165_1_applied_22_2_1_or_2)))

; [securities:violation_179] 法人及外國公司違反本法規定，依本章各條規定處罰其負責人
(assert (= violation_179
   (and legal_entity_violated (not excluded_by_articles_177_and_178))))

; [securities:special_circumstances_extension_annual_report] 未上市、未上櫃國內外國公司因作業時間不及，得延長公告申報年度財務報告至四個月內，免公告申報第一季及第三季合併財務報告
(assert (= special_circumstances_extension_annual_report
   (and not_listed_or_taipei_over_the_counter
        (>= 120 annual_report_submission_days)
        exempt_first_and_third_quarter_reports)))

; [securities:second_listing_company_report_rules] 第二上市公司依註冊地或上市地國法令公告申報年度及期中合併財務報告，免公告申報每月營運情形，年度合併財務報告不得逾會計年度終了後六個月
(assert (= second_listing_company_report_rules
   (and second_listing_company
        comply_registered_or_listed_country_laws
        exempt_monthly_operation_report
        (>= 180 annual_report_submission_days))))

; [securities:first_listing_second_quarter_report_rules] 自中華民國110會計年度起，第一上市公司第二季財務報告應經會計師查核簽證、董事會通過及監察人承認，公告申報不得逾第二季終了後二個月
(assert (= first_listing_second_quarter_report_rules
   (and (<= 110 accounting_year)
        first_listing_company
        (>= 60 second_quarter_report_submission_days)
        second_quarter_report_audited_by_accountant
        second_quarter_report_approved_by_board
        second_quarter_report_approved_by_supervisors)))

; [securities:large_capital_annual_report_deadline] 自111會計年度起，實收資本額達新臺幣100億元以上上市公司公告申報年度財務報告不得逾會計年度終了後75日
(assert (= large_capital_annual_report_deadline
   (and (<= 111 accounting_year)
        (<= 10000000000 paid_in_capital_ntd)
        (>= 75 annual_report_submission_days))))

; [securities:monthly_operation_report_items_defined] 公告並申報之營運情形包括合併營業收入額、為他人背書及保證之金額及主管機關所定事項
(assert (= monthly_operation_report_items_defined
   (and include_consolidated_revenue
        include_endorsement_and_guarantee_amount
        include_other_regulator_defined_items)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反公告申報及相關規定時處罰
(assert (= penalty
   (or (not quarterly_report_submitted)
       (not monthly_operation_report_submitted)
       (not annual_report_submitted)
       (not discrepant_annual_report_reported)
       (not material_event_reported)
       (not annual_meeting_held)
       board_failed_to_call_annual_meeting
       board_and_supervisors_dismissed
       violation_178
       violation_179)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= accounting_year 106))
(assert (= annual_report_submission_days 120))
(assert (= annual_report_signed_by_ceo_manager_accountant true))
(assert (= annual_report_audited_by_accountant true))
(assert (= annual_report_approved_by_board true))
(assert (= annual_report_approved_by_supervisors true))
(assert (= annual_report_submitted false))
(assert (= legal_entity_violated true))
(assert (= violate_article_36_1_or_165_1_applied_36_1 true))
(assert (= violation_178 true))
(assert (= violation_179 true))
(assert (= penalty true))
(assert (= annual_meeting_days_since_fiscal_year_end 0))
(assert (= annual_meeting_held false))
(assert (= annual_report_discrepant false))
(assert (= annual_report_prepared_and_distributed false))
(assert (= annual_report_prepared_and_distributed_to_shareholders false))
(assert (= board_and_supervisors_dismissed false))
(assert (= board_failed_to_call_annual_meeting false))
(assert (= board_term_expired false))
(assert (= company_in_reorganization_period false))
(assert (= comply_registered_or_listed_country_laws false))
(assert (= discrepant_annual_report_reported false))
(assert (= discrepant_report_days_since_occurrence 0))
(assert (= excluded_by_articles_177_and_178 false))
(assert (= exempt_first_and_third_quarter_reports false))
(assert (= exempt_monthly_operation_report false))
(assert (= fail_to_prepare_or_report_documents false))
(assert (= fail_to_submit_or_obstruct_inspection false))
(assert (= first_listing_company false))
(assert (= first_listing_second_quarter_report_rules false))
(assert (= include_consolidated_revenue false))
(assert (= include_endorsement_and_guarantee_amount false))
(assert (= include_other_regulator_defined_items false))
(assert (= large_capital_annual_report_deadline false))
(assert (= material_event_occurred false))
(assert (= material_event_report_days_since_occurrence 0))
(assert (= material_event_reported false))
(assert (= monthly_operation_report_for_previous_month false))
(assert (= monthly_operation_report_items_defined false))
(assert (= monthly_operation_report_submission_day 0))
(assert (= monthly_operation_report_submitted false))
(assert (= not_listed_or_taipei_over_the_counter false))
(assert (= paid_in_capital_ntd 0))
(assert (= quarterly_report_reported_to_board false))
(assert (= quarterly_report_reviewed_by_accountant false))
(assert (= quarterly_report_signed_by_ceo_manager_accountant false))
(assert (= quarterly_report_submission_days 0))
(assert (= quarterly_report_submitted false))
(assert (= regulator_called_meeting_expired false))
(assert (= reorganization_period_board_supervisor_powers false))
(assert (= report_copies_sent false))
(assert (= report_copies_sent_to_designated_agency false))
(assert (= report_copies_sent_to_exchange false))
(assert (= second_listing_company false))
(assert (= second_listing_company_report_rules false))
(assert (= second_quarter_report_approved_by_board false))
(assert (= second_quarter_report_approved_by_supervisors false))
(assert (= second_quarter_report_audited_by_accountant false))
(assert (= second_quarter_report_submission_days 0))
(assert (= special_circumstances_applied false))
(assert (= special_circumstances_approved false))
(assert (= special_circumstances_extension_annual_report false))
(assert (= violate_article_14_4_or_165_1_applied_14_4 false))
(assert (= violate_article_14_6_or_165_1_applied_14_6 false))
(assert (= violate_article_22_2_1_or_2 false))
(assert (= violate_article_25_1_or_165_1_applied_25_1 false))
(assert (= violate_article_26_1_or_165_1_applied_22_2_1_or_2 false))
(assert (= violate_article_26_3_or_165_1_applied_26_3 false))
(assert (= violate_article_28_2_or_165_1_applied_28_2 false))
(assert (= violate_article_43_2_or_43_3_or_43_5_or_165_1_or_165_2_applied false))
(assert (= violate_director_supervisor_shareholding_rules false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 72
; Total facts: 72
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
