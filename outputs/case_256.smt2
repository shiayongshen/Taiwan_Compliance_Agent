; SMT2 file generated from compliance case automatic
; Case ID: case_256
; Generated at: 2025-10-21T05:40:57.244630
;
; This file can be executed with Z3:
;   z3 case_256.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_period_limit Int)
(declare-const adjustment_period_years Int)
(declare-const approved_investment_targets Int)
(declare-const board_meeting_approval_ratio Real)
(declare-const board_meeting_attendance_ratio Real)
(declare-const business_is_investment Bool)
(declare-const business_is_management_of_invested_companies Bool)
(declare-const capital_reduction_approved_by_regulator Bool)
(declare-const collateral_conditions_not_better_than_similar Bool)
(declare-const consumer_loan_exempt_limit_ok Bool)
(declare-const days_since_application_received Int)
(declare-const each_extension_years Int)
(declare-const extension_applied Bool)
(declare-const extension_times Int)
(declare-const fhc_officer_is_manager_of_venture_investment Bool)
(declare-const fhc_violation Bool)
(declare-const full_collateral_provided Bool)
(declare-const include_spouse_and_minor_children_shareholding Bool)
(declare-const investment_approval_timing Int)
(declare-const investment_approved Bool)
(declare-const investment_has_no_voting_right Bool)
(declare-const investment_not_counted_in_total_shares Bool)
(declare-const investment_target_in_first_to_ninth_category Bool)
(declare-const investment_target_in_tenth_or_eleventh_category Bool)
(declare-const investment_target_is_bank Bool)
(declare-const investment_target_is_bill_finance Bool)
(declare-const investment_target_is_credit_card Bool)
(declare-const investment_target_is_fhc Bool)
(declare-const investment_target_is_foreign_financial_institution Bool)
(declare-const investment_target_is_futures Bool)
(declare-const investment_target_is_insurance Bool)
(declare-const investment_target_is_other_financial_related Bool)
(declare-const investment_target_is_securities Bool)
(declare-const investment_target_is_trust Bool)
(declare-const investment_target_is_venture_capital Bool)
(declare-const investment_without_approval_prohibited Bool)
(declare-const major_shareholder_definition Int)
(declare-const no_unsecured_credit_over_3_percent Bool)
(declare-const notify_ministry_on_director_removal Bool)
(declare-const notify_ministry_to_revoke_registration Bool)
(declare-const order_disposal_of_subsidiary_shares Bool)
(declare-const order_dispose_shares_and_reduce_directors Bool)
(declare-const order_dissolution_and_liquidation_if_not_completed Bool)
(declare-const other_necessary_measures Bool)
(declare-const paid_in_capital_total Real)
(declare-const penalty Bool)
(declare-const prohibit_use_fhc_name_and_change_registration Bool)
(declare-const prohibited_manager_roles Bool)
(declare-const regulator_defined_threshold Real)
(declare-const regulator_measures_for_violation Bool)
(declare-const regulator_opposition Bool)
(declare-const regulator_orders_adjustment Bool)
(declare-const regulator_orders_disposal Bool)
(declare-const remove_director_or_supervisor_or_suspend_duties Bool)
(declare-const remove_manager_or_officer Bool)
(declare-const revoke_permit Bool)
(declare-const revoke_permit_consequences Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const secured_credit_amount Real)
(declare-const secured_credit_amount_to_related_enterprises Real)
(declare-const secured_credit_over_5_percent_requirements Bool)
(declare-const shareholding_percentage Real)
(declare-const subsidiary_business_or_investment_exceeding Bool)
(declare-const subsidiary_business_or_investment_exceeding_limits Bool)
(declare-const subsidiary_business_scope Bool)
(declare-const subsidiary_capital_reduction Bool)
(declare-const subsidiary_capital_reduction_approval Bool)
(declare-const suspend_subsidiary_business Bool)
(declare-const unsecured_credit_amount_to_related_enterprises Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:no_unsecured_credit_over_3_percent] 銀行不得對持有實收資本總額超過3%之企業及相關人員提供無擔保授信，消費者貸款及政府貸款除外
(assert (= no_unsecured_credit_over_3_percent
   (and (>= (/ 3.0 100.0)
            (/ unsecured_credit_amount_to_related_enterprises
               paid_in_capital_total))
        consumer_loan_exempt_limit_ok)))

; [bank:major_shareholder_definition] 主要股東定義含持股1%以上及自然人股東配偶與未成年子女持股計入
(assert (= major_shareholder_definition
   (ite (and (<= (/ 1.0 100.0) shareholding_percentage)
             include_spouse_and_minor_children_shareholding)
        1
        0)))

; [bank:secured_credit_over_5_percent_requirements] 銀行對持有實收資本總額超過5%之企業及相關人員提供擔保授信，須有十足擔保且條件不得優於同類授信，達主管機關規定金額須董事會通過
(assert (let ((a!1 (and (<= (/ 1.0 20.0)
                    (/ secured_credit_amount_to_related_enterprises
                       paid_in_capital_total))
                full_collateral_provided
                collateral_conditions_not_better_than_similar
                (or (not (>= secured_credit_amount regulator_defined_threshold))
                    (and (<= (/ 6666667.0 10000000.0)
                             board_meeting_attendance_ratio)
                         (<= (/ 3.0 4.0) board_meeting_approval_ratio))))))
  (= secured_credit_over_5_percent_requirements a!1)))

; [fhc:subsidiary_business_scope] 金融控股公司子公司業務限於投資及被投資事業管理
(assert (= subsidiary_business_scope
   (and business_is_investment business_is_management_of_invested_companies)))

; [fhc:approved_investment_targets] 金融控股公司得向主管機關申請核准投資特定金融及相關事業
(assert (= approved_investment_targets
   (ite (or investment_target_is_credit_card
            investment_target_is_futures
            investment_target_is_securities
            investment_target_is_bill_finance
            investment_target_is_bank
            investment_target_is_trust
            investment_target_is_other_financial_related
            investment_target_is_venture_capital
            investment_target_is_insurance
            investment_target_is_fhc
            investment_target_is_foreign_financial_institution)
        1
        0)))

; [fhc:investment_approval_timing] 主管機關於申請書件送達後15或30營業日內未表示反對視為核准
(assert (let ((a!1 (ite (or (and investment_target_in_first_to_ninth_category
                         (>= 15 days_since_application_received)
                         (not regulator_opposition))
                    (and investment_target_in_tenth_or_eleventh_category
                         (>= 30 days_since_application_received)
                         (not regulator_opposition)))
                1
                0)))
  (= investment_approval_timing a!1)))

; [fhc:investment_without_approval_prohibited] 金融控股公司及其關係企業未經核准不得進行申請投資行為，違反者無表決權且不計入股份總數
(assert (= investment_without_approval_prohibited
   (or investment_approved
       (and investment_has_no_voting_right
            investment_not_counted_in_total_shares
            regulator_orders_disposal))))

; [fhc:subsidiary_business_or_investment_exceeding_limits] 子公司業務或投資逾越法令規定範圍者，主管機關應限期命其調整
(assert (= subsidiary_business_or_investment_exceeding_limits
   (or (not subsidiary_business_or_investment_exceeding)
       regulator_orders_adjustment)))

; [fhc:adjustment_period_limit] 調整期限最長三年，必要時得申請延長兩次，每次二年
(assert (let ((a!1 (and (>= 3 adjustment_period_years)
                (or (not extension_applied)
                    (and (>= 2 extension_times) (>= 2 each_extension_years))))))
  (= adjustment_period_limit (ite a!1 1 0))))

; [fhc:prohibited_manager_roles] 金融控股公司負責人或職員不得擔任其創業投資事業所投資事業之經理人
(assert (not (= fhc_officer_is_manager_of_venture_investment prohibited_manager_roles)))

; [fhc:subsidiary_capital_reduction_approval] 金融控股公司子公司減資應事先向主管機關申請核准
(assert (= subsidiary_capital_reduction_approval
   (or capital_reduction_approved_by_regulator
       (not subsidiary_capital_reduction))))

; [fhc:regulator_measures_for_violation] 金融控股公司違反法令或有礙健全經營時，主管機關得採取多種處分措施
(assert (= regulator_measures_for_violation
   (or suspend_subsidiary_business
       order_disposal_of_subsidiary_shares
       other_necessary_measures
       (not fhc_violation)
       revoke_statutory_meeting_resolution
       remove_manager_or_officer
       remove_director_or_supervisor_or_suspend_duties
       revoke_permit)))

; [fhc:notify_ministry_on_director_removal] 解除董事、監察人職務時，主管機關通知經濟部廢止其登記
(assert (= notify_ministry_on_director_removal
   (or (not remove_director_or_supervisor_or_suspend_duties)
       notify_ministry_to_revoke_registration)))

; [fhc:revoke_permit_consequences] 廢止許可時，限期處分股份及董事人數至不符規定，禁止使用名稱及辦理變更登記，未完成者須解散清算
(assert (= revoke_permit_consequences
   (or (not revoke_permit)
       (and order_dispose_shares_and_reduce_directors
            prohibit_use_fhc_name_and_change_registration
            order_dissolution_and_liquidation_if_not_completed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行無擔保授信限制、擔保授信條件、金融控股公司投資及經營規定時處罰
(assert (= penalty
   (or (not investment_without_approval_prohibited)
       (not revoke_permit_consequences)
       (not no_unsecured_credit_over_3_percent)
       (not regulator_measures_for_violation)
       (not (= investment_approval_timing 1))
       (not (= approved_investment_targets 1))
       (not subsidiary_capital_reduction_approval)
       (not subsidiary_business_scope)
       (not subsidiary_business_or_investment_exceeding_limits)
       (not secured_credit_over_5_percent_requirements)
       (not prohibited_manager_roles)
       (not notify_ministry_on_director_removal))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= unsecured_credit_amount_to_related_enterprises 50000000))
(assert (= paid_in_capital_total 1000000000))
(assert (= consumer_loan_exempt_limit_ok true))
(assert (= secured_credit_amount_to_related_enterprises 60000000))
(assert (= secured_credit_amount 60000000))
(assert (= full_collateral_provided false))
(assert (= collateral_conditions_not_better_than_similar false))
(assert (= board_meeting_attendance_ratio (/ 1.0 2.0)))
(assert (= board_meeting_approval_ratio (/ 3.0 5.0)))
(assert (= investment_target_is_fhc false))
(assert (= investment_target_is_bank false))
(assert (= investment_target_is_bill_finance false))
(assert (= investment_target_is_credit_card false))
(assert (= investment_target_is_trust false))
(assert (= investment_target_is_insurance false))
(assert (= investment_target_is_securities false))
(assert (= investment_target_is_futures false))
(assert (= investment_target_is_venture_capital false))
(assert (= investment_target_is_foreign_financial_institution false))
(assert (= investment_target_is_other_financial_related false))
(assert (= investment_approved false))
(assert (= investment_has_no_voting_right false))
(assert (= investment_not_counted_in_total_shares false))
(assert (= regulator_opposition true))
(assert (= investment_target_in_first_to_ninth_category true))
(assert (= days_since_application_received 20))
(assert (= business_is_investment false))
(assert (= business_is_management_of_invested_companies false))
(assert (= subsidiary_business_or_investment_exceeding true))
(assert (= regulator_orders_adjustment true))
(assert (= extension_applied true))
(assert (= extension_times 3))
(assert (= each_extension_years 3))
(assert (= fhc_officer_is_manager_of_venture_investment true))
(assert (= subsidiary_capital_reduction true))
(assert (= capital_reduction_approved_by_regulator false))
(assert (= fhc_violation true))
(assert (= remove_director_or_supervisor_or_suspend_duties true))
(assert (= notify_ministry_to_revoke_registration true))
(assert (= notify_ministry_on_director_removal true))
(assert (= regulator_measures_for_violation true))
(assert (= revoke_permit true))
(assert (= order_dispose_shares_and_reduce_directors true))
(assert (= prohibit_use_fhc_name_and_change_registration true))
(assert (= order_dissolution_and_liquidation_if_not_completed true))
(assert (= revoke_permit_consequences true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 69
; Total facts: 46
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
