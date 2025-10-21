; SMT2 file generated from compliance case automatic
; Case ID: case_255
; Generated at: 2025-10-21T22:07:59.444678
;
; This file can be executed with Z3:
;   z3 case_255.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_deadline_valid Bool)
(declare-const adjustment_deadline_years Int)
(declare-const adjustment_extension_times Int)
(declare-const adjustment_extension_years_per_time Int)
(declare-const application_documents_submitted Bool)
(declare-const application_procedures_followed Bool)
(declare-const application_review_conditions_met Bool)
(declare-const authority_opposition Bool)
(declare-const board_meeting_approval_ratio Real)
(declare-const board_meeting_attendance_ratio Real)
(declare-const capital_reduction_application_complete Bool)
(declare-const capital_reduction_application_submitted Bool)
(declare-const central_authority_threshold Real)
(declare-const consumer_loan_exempted Bool)
(declare-const credit_amount Real)
(declare-const credit_conditions_better_than_similar Bool)
(declare-const days_since_application Int)
(declare-const direct_indirect_directors_after_disposition Int)
(declare-const director_supervisor_registration_revoked Bool)
(declare-const disposition_deadline_days Int)
(declare-const excess_business_or_investment_adjustment_required Bool)
(declare-const fhc_officer_is_manager_of_invested_startup Bool)
(declare-const fhc_officer_not_manager_of_invested_startup Bool)
(declare-const full_collateral_provided Bool)
(declare-const government_loan_exempted Bool)
(declare-const investment_and_management Bool)
(declare-const investment_approved Bool)
(declare-const investment_approved_by_default Bool)
(declare-const investment_business_approved Bool)
(declare-const investment_business_type Int)
(declare-const investment_without_approval_prohibited Bool)
(declare-const liquidation_ordered Bool)
(declare-const major_shareholder_holding_percent Real)
(declare-const major_shareholder_minor_children_percent Real)
(declare-const major_shareholder_own_percent Real)
(declare-const major_shareholder_spouse_percent Real)
(declare-const max_allowed_directors Int)
(declare-const max_allowed_shares Int)
(declare-const no_unsecured_credit_over_3_percent Bool)
(declare-const notify_ministry_economy Bool)
(declare-const order_dispose_subsidiary_shares Bool)
(declare-const other_necessary_measures Bool)
(declare-const other_requirements_complied Bool)
(declare-const paid_in_capital_total Real)
(declare-const penalty Bool)
(declare-const permit_revoked Bool)
(declare-const regulatory_action_taken Bool)
(declare-const remove_director_or_supervisor_or_suspend_duties Bool)
(declare-const remove_manager_or_officer Bool)
(declare-const revoke_permit Bool)
(declare-const revoke_permit_compliance Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const secured_credit_over_5_percent_compliant Bool)
(declare-const secured_credit_to_enterprise_over_5_percent Bool)
(declare-const shares_held_after_disposition Int)
(declare-const specified_deadline_days Int)
(declare-const subsidiary_business_exceeds_limit Bool)
(declare-const subsidiary_business_type Int)
(declare-const subsidiary_business_within_scope Bool)
(declare-const subsidiary_capital_reduction_approved Bool)
(declare-const subsidiary_investment_exceeds_limit Bool)
(declare-const suspend_subsidiary_business_part_or_all Bool)
(declare-const unsecured_credit_to_enterprise_over_3_percent Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:no_unsecured_credit_over_3_percent] 銀行不得對持有實收資本總額超過3%之企業及相關人員提供無擔保授信（消費者貸款及政府貸款除外）
(assert (let ((a!1 (and (<= (/ (ite unsecured_credit_to_enterprise_over_3_percent
                            1.0
                            0.0)
                       paid_in_capital_total)
                    (/ 3.0 100.0))
                consumer_loan_exempted
                government_loan_exempted)))
  (= no_unsecured_credit_over_3_percent a!1)))

; [bank:major_shareholder_definition] 主要股東定義：持股超過1%，自然人主要股東含配偶及未成年子女持股
(assert (= major_shareholder_holding_percent
   (+ major_shareholder_own_percent
      major_shareholder_spouse_percent
      major_shareholder_minor_children_percent)))

; [bank:secured_credit_over_5_percent_requirements] 銀行對持有實收資本總額超過5%之企業及相關人員提供擔保授信，須有十足擔保且條件不得優於同類授信，且達一定金額須董事會通過
(assert (let ((a!1 (and (>= (/ (ite secured_credit_to_enterprise_over_5_percent 1.0 0.0)
                       paid_in_capital_total)
                    (/ 1.0 20.0))
                full_collateral_provided
                (not credit_conditions_better_than_similar)
                (or (not (>= credit_amount central_authority_threshold))
                    (and (<= (/ 6666667.0 10000000.0)
                             board_meeting_attendance_ratio)
                         (<= (/ 3.0 4.0) board_meeting_approval_ratio))))))
  (= secured_credit_over_5_percent_compliant a!1)))

; [fhc:subsidiary_business_scope] 金融控股公司子公司業務限於投資及被投資事業管理
(assert (= subsidiary_business_within_scope
   (= subsidiary_business_type (ite investment_and_management 1 0))))

; [fhc:approved_investment_businesses] 金融控股公司可投資之事業類別
(assert (= investment_business_approved
   (or (= 1 investment_business_type)
       (= 2 investment_business_type)
       (= 3 investment_business_type)
       (= 4 investment_business_type)
       (= 5 investment_business_type)
       (= 6 investment_business_type)
       (= 7 investment_business_type)
       (= 8 investment_business_type)
       (= 9 investment_business_type)
       (= 10 investment_business_type)
       (= 11 investment_business_type))))

; [fhc:investment_approval_timing] 金融控股公司投資申請未於期限內反對視為核准
(assert (let ((a!1 (or (and (= 1 investment_business_type)
                    (>= 15 days_since_application)
                    (not authority_opposition))
               (and (or (<= 2 investment_business_type)
                        (>= 11 investment_business_type))
                    (>= 30 days_since_application)
                    (not authority_opposition)))))
  (= investment_approved_by_default a!1)))

; [fhc:investment_without_approval_prohibited] 金融控股公司及其關係企業未經核准不得進行投資行為
(assert (not (= investment_approved investment_without_approval_prohibited)))

; [fhc:excess_business_or_investment_adjustment_required] 金融控股公司因設立或轉換致子公司業務或投資逾越規定，須限期調整
(assert (= excess_business_or_investment_adjustment_required
   (or subsidiary_business_exceeds_limit subsidiary_investment_exceeds_limit)))

; [fhc:adjustment_deadline_maximum] 調整期限最長三年，得申請延長兩次，每次二年
(assert (= adjustment_deadline_valid
   (and (>= 3 adjustment_deadline_years)
        (>= 2 adjustment_extension_times)
        (>= 2 adjustment_extension_years_per_time))))

; [fhc:fhc_officer_not_manager_of_invested_startup] 金融控股公司負責人或職員不得擔任其創業投資事業所投資事業經理人
(assert (not (= fhc_officer_is_manager_of_invested_startup
        fhc_officer_not_manager_of_invested_startup)))

; [fhc:subsidiary_capital_reduction_approval_required] 金融控股公司子公司減資須事先申請核准
(assert (= subsidiary_capital_reduction_approved
   capital_reduction_application_submitted))

; [fhc:subsidiary_capital_reduction_application_complete] 子公司減資申請應附書件、程序、審查條件及其他應遵行事項
(assert (= capital_reduction_application_complete
   (and application_documents_submitted
        application_procedures_followed
        application_review_conditions_met
        other_requirements_complied)))

; [fhc:regulatory_action_for_violation] 金融控股公司違反法令或有礙健全經營時主管機關可採取處分
(assert (= regulatory_action_taken
   (or order_dispose_subsidiary_shares
       remove_manager_or_officer
       revoke_permit
       remove_director_or_supervisor_or_suspend_duties
       suspend_subsidiary_business_part_or_all
       other_necessary_measures
       revoke_statutory_meeting_resolution)))

; [fhc:revoke_director_supervisor_registration] 解除董事監察人職務時通知經濟部廢止登記
(assert (= director_supervisor_registration_revoked
   (or notify_ministry_economy
       (not remove_director_or_supervisor_or_suspend_duties))))

; [fhc:revoke_permit_requirements] 廢止許可時須令金融控股公司於期限內處分股份及董事人數至符規定，未完成者須解散清算
(assert (let ((a!1 (and permit_revoked
                (<= disposition_deadline_days specified_deadline_days)
                (<= shares_held_after_disposition max_allowed_shares)
                (<= direct_indirect_directors_after_disposition
                    max_allowed_directors)
                (or liquidation_ordered
                    (and (<= shares_held_after_disposition max_allowed_shares)
                         (<= direct_indirect_directors_after_disposition
                             max_allowed_directors))))))
  (= revoke_permit_compliance a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行無擔保授信限制、擔保授信條件、金融控股公司投資及經營規定時處罰
(assert (= penalty
   (or (not no_unsecured_credit_over_3_percent)
       (not investment_approved_by_default)
       (not subsidiary_business_within_scope)
       (not investment_business_approved)
       excess_business_or_investment_adjustment_required
       (not capital_reduction_application_complete)
       (not adjustment_deadline_valid)
       (not fhc_officer_not_manager_of_invested_startup)
       (not subsidiary_capital_reduction_approved)
       (not regulatory_action_taken)
       (not director_supervisor_registration_revoked)
       (not revoke_permit_compliance)
       (not investment_without_approval_prohibited)
       (not secured_credit_over_5_percent_compliant))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= no_unsecured_credit_over_3_percent false))
(assert (= unsecured_credit_to_enterprise_over_3_percent true))
(assert (= paid_in_capital_total 1000000000))
(assert (= consumer_loan_exempted false))
(assert (= government_loan_exempted false))
(assert (= secured_credit_over_5_percent_compliant false))
(assert (= full_collateral_provided false))
(assert (= credit_conditions_better_than_similar true))
(assert (= credit_amount 100000000))
(assert (= central_authority_threshold 50000000))
(assert (= board_meeting_attendance_ratio (/ 1.0 2.0)))
(assert (= board_meeting_approval_ratio (/ 3.0 5.0)))
(assert (= investment_business_approved false))
(assert (= investment_approved_by_default false))
(assert (= investment_approved false))
(assert (= investment_without_approval_prohibited false))
(assert (= subsidiary_business_within_scope false))
(assert (= subsidiary_business_exceeds_limit true))
(assert (= subsidiary_investment_exceeds_limit true))
(assert (= excess_business_or_investment_adjustment_required true))
(assert (= adjustment_deadline_valid false))
(assert (= adjustment_deadline_years 5))
(assert (= adjustment_extension_times 3))
(assert (= adjustment_extension_years_per_time 3))
(assert (= fhc_officer_is_manager_of_invested_startup true))
(assert (= fhc_officer_not_manager_of_invested_startup false))
(assert (= capital_reduction_application_submitted false))
(assert (= subsidiary_capital_reduction_approved false))
(assert (= application_documents_submitted false))
(assert (= application_procedures_followed false))
(assert (= application_review_conditions_met false))
(assert (= other_requirements_complied false))
(assert (= capital_reduction_application_complete false))
(assert (= regulatory_action_taken true))
(assert (= remove_director_or_supervisor_or_suspend_duties true))
(assert (= director_supervisor_registration_revoked false))
(assert (= notify_ministry_economy false))
(assert (= revoke_permit true))
(assert (= permit_revoked true))
(assert (= revoke_permit_compliance false))
(assert (= disposition_deadline_days 10))
(assert (= specified_deadline_days 7))
(assert (= shares_held_after_disposition 100))
(assert (= max_allowed_shares 50))
(assert (= direct_indirect_directors_after_disposition 10))
(assert (= max_allowed_directors 5))
(assert (= liquidation_ordered false))
(assert (= order_dispose_subsidiary_shares true))
(assert (= other_necessary_measures true))
(assert (= major_shareholder_own_percent 2.0))
(assert (= major_shareholder_spouse_percent (/ 3.0 2.0)))
(assert (= major_shareholder_minor_children_percent 0.0))
(assert (= major_shareholder_holding_percent (/ 7.0 2.0)))
(assert (= days_since_application 20))
(assert (= authority_opposition true))
(assert (= remove_manager_or_officer true))
(assert (= suspend_subsidiary_business_part_or_all false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 63
; Total facts: 57
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
