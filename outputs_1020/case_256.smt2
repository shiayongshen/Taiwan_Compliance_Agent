; SMT2 file generated from compliance case automatic
; Case ID: case_256
; Generated at: 2025-10-19T11:31:51.181038
;
; This file can be executed with Z3:
;   z3 case_256.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_period_valid Bool)
(declare-const adjustment_period_years Int)
(declare-const authority_opposition Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const business_suspension_ordered Bool)
(declare-const company_dissolved_and_liquidated Bool)
(declare-const consumer_loan_limit Real)
(declare-const correction_ordered Bool)
(declare-const credit_conditions Bool)
(declare-const days_since_application Int)
(declare-const director_supervisor_dismissal_notified Bool)
(declare-const director_supervisor_dismissed Bool)
(declare-const director_supervisor_dismissed_or_suspended Bool)
(declare-const directors_after_disposal Int)
(declare-const disposal_completed_within_deadline Bool)
(declare-const economic_ministry_notified Bool)
(declare-const exceed_business_scope_must_adjust Bool)
(declare-const extension_applied Bool)
(declare-const extension_count Int)
(declare-const extension_period_years Int)
(declare-const fhc_officer_is_venture_manager Bool)
(declare-const fhc_officers_not_venture_managers Int)
(declare-const full_collateral_provided Bool)
(declare-const investment_and_management Bool)
(declare-const investment_approval_status Bool)
(declare-const investment_approved Bool)
(declare-const investment_business Bool)
(declare-const investment_business_approved Bool)
(declare-const investment_without_approval_prohibited Bool)
(declare-const license_revocation_compliance Bool)
(declare-const license_revoked Bool)
(declare-const major_shareholder_holdings Real)
(declare-const manager_dismissed Bool)
(declare-const no_unsecured_credit_over_3_percent Bool)
(declare-const other_measures_taken Bool)
(declare-const paid_in_capital_total Real)
(declare-const penalty Bool)
(declare-const regulatory_actions_taken Bool)
(declare-const regulatory_limit_directors Int)
(declare-const regulatory_limit_shareholding Real)
(declare-const regulatory_threshold_amount Real)
(declare-const secured_credit_amount Real)
(declare-const secured_credit_amount_to_related_parties Real)
(declare-const secured_credit_over_5_percent_require_full_collateral Bool)
(declare-const secured_credit_over_threshold_require_board_approval Bool)
(declare-const share_disposal_ordered Bool)
(declare-const shareholder_own_percentage Real)
(declare-const shareholding_after_disposal Real)
(declare-const similar_credit_conditions Bool)
(declare-const spouse_and_minor_children_percentage Real)
(declare-const subsidiary_business_exceed Bool)
(declare-const subsidiary_business_scope Bool)
(declare-const subsidiary_business_scope_limited Bool)
(declare-const subsidiary_capital_reduction_applied Bool)
(declare-const subsidiary_capital_reduction_approved Bool)
(declare-const subsidiary_capital_reduction_approved_flag Bool)
(declare-const subsidiary_investment_exceed Bool)
(declare-const unsecured_consumer_loan_amount Real)
(declare-const unsecured_credit_amount_to_related_parties Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:no_unsecured_credit_over_3_percent] 銀行不得對持有實收資本總額超過3%之企業及相關人員為無擔保授信，消費者貸款及政府貸款除外
(assert (= no_unsecured_credit_over_3_percent
   (and (>= (/ 3.0 100.0)
            (/ unsecured_credit_amount_to_related_parties paid_in_capital_total))
        (<= (/ unsecured_consumer_loan_amount paid_in_capital_total)
            consumer_loan_limit))))

; [bank:major_shareholder_definition] 主要股東定義含持股1%以上及自然人股東配偶與未成年子女持股計入
(assert (= major_shareholder_holdings
   (+ shareholder_own_percentage spouse_and_minor_children_percentage)))

; [bank:secured_credit_over_5_percent_require_full_collateral] 銀行對持有實收資本總額超過5%之企業及相關人員為擔保授信，應有十足擔保且條件不得優於同類授信
(assert (let ((a!1 (or (<= (/ secured_credit_amount_to_related_parties
                      paid_in_capital_total)
                   (/ 1.0 20.0))
               (and full_collateral_provided
                    (not (= credit_conditions similar_credit_conditions))))))
  (= secured_credit_over_5_percent_require_full_collateral a!1)))

; [bank:secured_credit_over_threshold_require_board_approval] 授信達主管機關規定金額以上，須三分之二董事出席及四分之三出席董事同意
(assert (= secured_credit_over_threshold_require_board_approval
   (or (not (>= secured_credit_amount regulatory_threshold_amount))
       (and (<= (/ 6666667.0 10000000.0) board_attendance_ratio)
            (<= (/ 3.0 4.0) board_approval_ratio)))))

; [fhc:subsidiary_business_scope_limited_to_investment_and_management] 金融控股公司子公司業務限於投資及被投資事業管理
(assert (= subsidiary_business_scope_limited
   (= subsidiary_business_scope investment_and_management)))

; [fhc:approved_investment_business_list] 金融控股公司得申請核准投資之事業類別
(assert (= investment_business_approved investment_business))

; [fhc:investment_approval_timing] 主管機關於申請書件送達後15或30營業日內未表示反對視為核准
(assert (= investment_approval_status
   (and investment_business
        (>= 15 days_since_application)
        (not authority_opposition))))

; [fhc:investment_without_approval_prohibited] 金融控股公司及關係企業未經核准不得進行投資行為，違反者無表決權且不計入股份總數
(assert (not (= investment_approved investment_without_approval_prohibited)))

; [fhc:exceed_business_scope_must_adjust] 子公司業務或投資逾越法令規定範圍者，主管機關應限期命其調整
(assert (= exceed_business_scope_must_adjust
   (or subsidiary_business_exceed subsidiary_investment_exceed)))

; [fhc:adjustment_period_limit] 調整期限最長三年，必要時得申請延長二次，每次二年
(assert (let ((a!1 (and (>= 3 adjustment_period_years)
                (or (not extension_applied)
                    (and (>= 2 extension_count) (>= 2 extension_period_years))))))
  (= adjustment_period_valid a!1)))

; [fhc:fhc_officers_cannot_be_manager_of_venture_investment] 金融控股公司負責人或職員不得擔任創業投資事業所投資事業經理人
(assert (= fhc_officers_not_venture_managers (ite fhc_officer_is_venture_manager 0 1)))

; [fhc:subsidiary_capital_reduction_requires_approval] 金融控股公司子公司減資應事先申請核准
(assert (= subsidiary_capital_reduction_approved
   (or (not subsidiary_capital_reduction_applied)
       subsidiary_capital_reduction_approved_flag)))

; [fhc:regulatory_actions_for_violation] 金融控股公司違反法令或有礙健全經營時主管機關可採取多種處分措施
(assert (= regulatory_actions_taken
   (or business_suspension_ordered
       director_supervisor_dismissed_or_suspended
       other_measures_taken
       manager_dismissed
       correction_ordered
       share_disposal_ordered
       license_revoked)))

; [fhc:director_supervisor_dismissal_notification] 解除董事監察人職務時須通知經濟部廢止登記
(assert (= director_supervisor_dismissal_notified
   (or (not director_supervisor_dismissed) economic_ministry_notified)))

; [fhc:license_revocation_must_reduce_shareholding_and_directors] 廢止許可時須限期處分股份及董事人數至符規定，未完成須解散清算
(assert (= license_revocation_compliance
   (or (not license_revoked)
       (and (<= shareholding_after_disposal regulatory_limit_shareholding)
            (<= directors_after_disposal regulatory_limit_directors)
            (or disposal_completed_within_deadline
                company_dissolved_and_liquidated)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行無擔保授信限制、擔保授信擔保及董事會決議規定，或金融控股公司投資及經營規定時處罰
(assert (= penalty
   (or (not investment_approval_status)
       (not director_supervisor_dismissal_notified)
       (not investment_business_approved)
       (not subsidiary_capital_reduction_approved)
       (not no_unsecured_credit_over_3_percent)
       (not regulatory_actions_taken)
       exceed_business_scope_must_adjust
       (not secured_credit_over_threshold_require_board_approval)
       (not secured_credit_over_5_percent_require_full_collateral)
       (not license_revocation_compliance)
       (not investment_without_approval_prohibited)
       (not (= fhc_officers_not_venture_managers 1))
       (not adjustment_period_valid))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= unsecured_credit_amount_to_related_parties 0.0))
(assert (= paid_in_capital_total 1000000000.0))
(assert (= unsecured_consumer_loan_amount 0.0))
(assert (= consumer_loan_limit (/ 3.0 100.0)))
(assert (= secured_credit_amount_to_related_parties 750000000.0))
(assert (= secured_credit_amount 750000000.0))
(assert (= full_collateral_provided false))
(assert (= credit_conditions false))
(assert (= board_attendance_ratio 0.0))
(assert (= board_approval_ratio 0.0))
(assert (= investment_business false))
(assert (= investment_business_approved false))
(assert (= investment_approval_status false))
(assert (= investment_approved false))
(assert (= authority_opposition false))
(assert (= investment_without_approval_prohibited false))
(assert (= subsidiary_business_exceed true))
(assert (= subsidiary_investment_exceed true))
(assert (= exceed_business_scope_must_adjust true))
(assert (= adjustment_period_valid false))
(assert (= adjustment_period_years 7))
(assert (= extension_applied false))
(assert (= extension_count 0))
(assert (= extension_period_years 0))
(assert (= fhc_officer_is_venture_manager true))
(assert (= fhc_officers_not_venture_managers 0))
(assert (= subsidiary_capital_reduction_applied false))
(assert (= subsidiary_capital_reduction_approved_flag false))
(assert (= subsidiary_capital_reduction_approved false))
(assert (= regulatory_actions_taken true))
(assert (= correction_ordered true))
(assert (= business_suspension_ordered false))
(assert (= manager_dismissed false))
(assert (= director_supervisor_dismissed_or_suspended true))
(assert (= director_supervisor_dismissed true))
(assert (= director_supervisor_dismissal_notified true))
(assert (= economic_ministry_notified true))
(assert (= share_disposal_ordered false))
(assert (= license_revoked false))
(assert (= license_revocation_compliance true))
(assert (= shareholding_after_disposal 0.0))
(assert (= regulatory_limit_shareholding (/ 3.0 100.0)))
(assert (= directors_after_disposal 0))
(assert (= regulatory_limit_directors 0))
(assert (= disposal_completed_within_deadline false))
(assert (= company_dissolved_and_liquidated false))
(assert (= major_shareholder_holdings 1.0))
(assert (= shareholder_own_percentage (/ 3.0 5.0)))
(assert (= spouse_and_minor_children_percentage (/ 2.0 5.0)))
(assert (= penalty true))
(assert (= other_measures_taken false))
(assert (= days_since_application 0))
(assert (= investment_and_management false))
(assert (= no_unsecured_credit_over_3_percent false))
(assert (= regulatory_threshold_amount 0.0))
(assert (= secured_credit_over_5_percent_require_full_collateral false))
(assert (= secured_credit_over_threshold_require_board_approval false))
(assert (= similar_credit_conditions false))
(assert (= subsidiary_business_scope false))
(assert (= subsidiary_business_scope_limited false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 60
; Total facts: 60
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
