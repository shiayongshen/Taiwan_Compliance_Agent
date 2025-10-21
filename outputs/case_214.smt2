; SMT2 file generated from compliance case automatic
; Case ID: case_214
; Generated at: 2025-10-21T04:47:04.821062
;
; This file can be executed with Z3:
;   z3 case_214.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_before_acquisition Bool)
(declare-const conceal_or_destroy_data Bool)
(declare-const cumulative_change_percent Real)
(declare-const director_or_supervisor_fail_report Bool)
(declare-const false_or_late_report Bool)
(declare-const financial_info_service_violate Bool)
(declare-const first_increase_approved_before_acquisition Bool)
(declare-const foreign_bank_responsible_violate Bool)
(declare-const no_reasonable_response Bool)
(declare-const penalty Bool)
(declare-const refuse_inspection Bool)
(declare-const reported_within_10_days Bool)
(declare-const reported_within_6_months_after_revision Bool)
(declare-const shareholder_approval_compliance Bool)
(declare-const shareholder_compliance Bool)
(declare-const shareholder_cumulative_change_reported Bool)
(declare-const shareholder_exceeds_10_percent Bool)
(declare-const shareholder_exceeds_10_percent_approved Bool)
(declare-const shareholder_exceeds_10_percent_pre_2008_approved Bool)
(declare-const shareholder_exceeds_1_percent_notify_bank Bool)
(declare-const shareholder_exceeds_25_percent Bool)
(declare-const shareholder_exceeds_25_percent_approved Bool)
(declare-const shareholder_exceeds_50_percent Bool)
(declare-const shareholder_exceeds_50_percent_approved Bool)
(declare-const shareholder_exceeds_5_percent Bool)
(declare-const shareholder_exceeds_5_percent_cumulative_change Bool)
(declare-const shareholder_exceeds_5_percent_penalty Bool)
(declare-const shareholder_exceeds_5_percent_penalty_effect Bool)
(declare-const shareholder_exceeds_5_percent_reported Bool)
(declare-const shareholder_exceeds_5_percent_reported_or_pre_2008_compliant Bool)
(declare-const shareholder_exceeds_5_to_15_percent_pre_2008_reported Bool)
(declare-const shareholder_penalty Bool)
(declare-const trust_investment_company_violate Bool)
(declare-const unauthorized_disclosure Bool)
(declare-const unauthorized_financial_info_service_operation Bool)
(declare-const unauthorized_operation Bool)
(declare-const unauthorized_stop_business Bool)
(declare-const violate_article_108 Bool)
(declare-const violate_article_123_108 Bool)
(declare-const violate_article_64_1 Bool)
(declare-const voting_shares_percent Real)
(declare-const voting_shares_percent_family Real)
(declare-const voting_shares_percent_intent Real)
(declare-const voting_shares_percent_pre_2008 Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:shareholder_exceeds_5_percent] 同一人或同一關係人持有有表決權股份超過5%
(assert (not (= (<= voting_shares_percent 5.0) shareholder_exceeds_5_percent)))

; [bank:shareholder_exceeds_10_percent] 同一人或同一關係人擬持有有表決權股份超過10%
(assert (not (= (<= voting_shares_percent_intent 10.0) shareholder_exceeds_10_percent)))

; [bank:shareholder_exceeds_25_percent] 同一人或同一關係人擬持有有表決權股份超過25%
(assert (not (= (<= voting_shares_percent_intent 25.0) shareholder_exceeds_25_percent)))

; [bank:shareholder_exceeds_50_percent] 同一人或同一關係人擬持有有表決權股份超過50%
(assert (not (= (<= voting_shares_percent_intent 50.0) shareholder_exceeds_50_percent)))

; [bank:shareholder_exceeds_5_percent_cumulative_change] 持股超過5%後累積增減逾1個百分點
(assert (= shareholder_exceeds_5_percent_cumulative_change
   (and (not (<= voting_shares_percent 5.0))
        (not (<= cumulative_change_percent 1.0)))))

; [bank:shareholder_exceeds_5_percent_reported] 同一人或同一關係人持有超過5%股份已於10日內申報
(assert (= shareholder_exceeds_5_percent_reported
   (and shareholder_exceeds_5_percent reported_within_10_days)))

; [bank:shareholder_cumulative_change_reported] 持股超過5%後累積增減逾1%已於10日內申報
(assert (= shareholder_cumulative_change_reported
   (and shareholder_exceeds_5_percent_cumulative_change reported_within_10_days)))

; [bank:shareholder_exceeds_10_percent_approved] 同一人或同一關係人擬持有超過10%股份已事先申請核准
(assert (= shareholder_exceeds_10_percent_approved
   (or (not shareholder_exceeds_10_percent) approved_before_acquisition)))

; [bank:shareholder_exceeds_25_percent_approved] 同一人或同一關係人擬持有超過25%股份已事先申請核准
(assert (= shareholder_exceeds_25_percent_approved
   (or approved_before_acquisition (not shareholder_exceeds_25_percent))))

; [bank:shareholder_exceeds_50_percent_approved] 同一人或同一關係人擬持有超過50%股份已事先申請核准
(assert (= shareholder_exceeds_50_percent_approved
   (or approved_before_acquisition (not shareholder_exceeds_50_percent))))

; [bank:shareholder_exceeds_5_to_15_percent_pre_2008_reported] 修正施行前持股超過5%未超過15%者於6個月內申報
(assert (= shareholder_exceeds_5_to_15_percent_pre_2008_reported
   (and (<= 5.0 voting_shares_percent_pre_2008)
        (>= 15.0 voting_shares_percent_pre_2008)
        reported_within_6_months_after_revision)))

; [bank:shareholder_exceeds_10_percent_pre_2008_approved] 修正施行前持股超過10%者第一次擬增加持股應事先申請核准
(assert (= shareholder_exceeds_10_percent_pre_2008_approved
   (or first_increase_approved_before_acquisition
       (<= voting_shares_percent_pre_2008 10.0))))

; [bank:shareholder_exceeds_5_percent_reported_or_pre_2008_compliant] 持股超過5%已申報或符合修正施行前申報規定
(assert (= shareholder_exceeds_5_percent_reported_or_pre_2008_compliant
   (or shareholder_exceeds_5_percent_reported
       shareholder_exceeds_5_to_15_percent_pre_2008_reported)))

; [bank:shareholder_approval_compliance] 擬持有超過10%、25%、50%股份均已事先申請核准
(assert (= shareholder_approval_compliance
   (and (or (not shareholder_exceeds_10_percent)
            shareholder_exceeds_10_percent_approved)
        (or (not shareholder_exceeds_25_percent)
            shareholder_exceeds_25_percent_approved)
        (or (not shareholder_exceeds_50_percent)
            shareholder_exceeds_50_percent_approved))))

; [bank:shareholder_compliance] 持股申報及核准均符合規定
(assert (= shareholder_compliance
   (and shareholder_exceeds_5_percent_reported_or_pre_2008_compliant
        shareholder_approval_compliance)))

; [bank:shareholder_exceeds_1_percent_notify_bank] 同一人或本人與配偶、未成年子女合計持股超過1%應通知銀行
(assert (= shareholder_exceeds_1_percent_notify_bank
   (<= 1.0 voting_shares_percent_family)))

; [bank:shareholder_exceeds_5_percent_penalty] 未依規定申報或核准持有超過5%股份者，超過部分無表決權
(assert (not (= shareholder_compliance shareholder_exceeds_5_percent_penalty)))

; [bank:shareholder_exceeds_5_percent_penalty_effect] 超過部分股份無表決權且主管機關命限期處分
(assert (= shareholder_exceeds_5_percent_penalty_effect
   shareholder_exceeds_5_percent_penalty))

; [bank:director_or_supervisor_fail_report] 銀行董事或監察人違反申報規定怠於申報
(assert (= director_or_supervisor_fail_report violate_article_64_1))

; [bank:trust_investment_company_violate] 信託投資公司董事或職員違反規定參與決定
(assert (= trust_investment_company_violate violate_article_108))

; [bank:foreign_bank_responsible_violate] 外國銀行負責人或職員違反規定參與決定
(assert (= foreign_bank_responsible_violate violate_article_123_108))

; [bank:shareholder_penalty] 銀行股東持股違反申報或核准規定處罰
(assert (not (= shareholder_compliance shareholder_penalty)))

; [bank:financial_info_service_violate] 金融資訊服務事業違反檢查、提報、停止業務或洩漏資料規定
(assert (= financial_info_service_violate
   (or unauthorized_disclosure
       no_reasonable_response
       conceal_or_destroy_data
       false_or_late_report
       refuse_inspection
       unauthorized_stop_business)))

; [bank:unauthorized_financial_info_service_operation] 金融資訊服務事業未經主管機關許可擅自營業
(assert (= unauthorized_financial_info_service_operation unauthorized_operation))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反申報、核准、董事監察人申報義務、信託投資公司規定、金融資訊服務事業規定或擅自營業時處罰
(assert (= penalty
   (or foreign_bank_responsible_violate
       (not shareholder_compliance)
       unauthorized_financial_info_service_operation
       trust_investment_company_violate
       director_or_supervisor_fail_report
       financial_info_service_violate)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= voting_shares_percent (/ 453.0 50.0)))
(assert (= cumulative_change_percent (/ 3.0 2.0)))
(assert (= reported_within_10_days false))
(assert (= shareholder_exceeds_5_percent true))
(assert (= shareholder_exceeds_5_percent_cumulative_change true))
(assert (= shareholder_exceeds_5_percent_reported false))
(assert (= shareholder_exceeds_5_percent_reported_or_pre_2008_compliant false))
(assert (= shareholder_approval_compliance false))
(assert (= shareholder_compliance false))
(assert (= shareholder_exceeds_5_percent_penalty true))
(assert (= shareholder_exceeds_5_percent_penalty_effect true))
(assert (= penalty true))
(assert (= approved_before_acquisition false))
(assert (= director_or_supervisor_fail_report false))
(assert (= trust_investment_company_violate false))
(assert (= foreign_bank_responsible_violate false))
(assert (= financial_info_service_violate false))
(assert (= unauthorized_financial_info_service_operation false))
(assert (= conceal_or_destroy_data false))
(assert (= false_or_late_report false))
(assert (= no_reasonable_response false))
(assert (= refuse_inspection false))
(assert (= unauthorized_stop_business false))
(assert (= unauthorized_disclosure false))
(assert (= unauthorized_operation false))
(assert (= violate_article_64_1 false))
(assert (= violate_article_108 false))
(assert (= violate_article_123_108 false))
(assert (= shareholder_exceeds_10_percent false))
(assert (= shareholder_exceeds_10_percent_approved false))
(assert (= shareholder_exceeds_25_percent false))
(assert (= shareholder_exceeds_25_percent_approved false))
(assert (= shareholder_exceeds_50_percent false))
(assert (= shareholder_exceeds_50_percent_approved false))
(assert (= shareholder_exceeds_1_percent_notify_bank false))
(assert (= first_increase_approved_before_acquisition false))
(assert (= reported_within_6_months_after_revision false))
(assert (= shareholder_exceeds_5_to_15_percent_pre_2008_reported false))
(assert (= shareholder_exceeds_10_percent_pre_2008_approved false))
(assert (= voting_shares_percent_intent 0.0))
(assert (= voting_shares_percent_family 0.0))
(assert (= voting_shares_percent_pre_2008 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 26
; Total variables: 44
; Total facts: 42
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
