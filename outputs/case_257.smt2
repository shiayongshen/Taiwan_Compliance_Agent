; SMT2 file generated from compliance case automatic
; Case ID: case_257
; Generated at: 2025-10-21T22:11:13.601816
;
; This file can be executed with Z3:
;   z3 case_257.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_extension_times Int)
(declare-const adjustment_extension_years_per_time Real)
(declare-const adjustment_period_limit Int)
(declare-const adjustment_period_years Int)
(declare-const apply_company_change_registration Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const capital_reduction_approval_applied Bool)
(declare-const consumer_and_government_loans_exempted Bool)
(declare-const credit_amount Real)
(declare-const credit_amount_to_enterprise_percent Real)
(declare-const credit_conditions_better_than_similar Bool)
(declare-const credit_has_full_collateral Bool)
(declare-const credit_is_secured Bool)
(declare-const credit_is_unsecured Bool)
(declare-const credit_to_major_shareholder Bool)
(declare-const credit_to_related_person_of_responsible_or_credit_staff Bool)
(declare-const credit_to_responsible_person Bool)
(declare-const credit_to_staff Bool)
(declare-const dispose_shares_within_deadline Bool)
(declare-const excess_business_or_investment_must_adjust Bool)
(declare-const fail_to_dispose_shares_must_liquidate Bool)
(declare-const fhc_manager_is_venture_invested_company_manager Bool)
(declare-const impede_sound_operation Bool)
(declare-const invest_in_bank Bool)
(declare-const invest_in_bill_finance Bool)
(declare-const invest_in_credit_card Bool)
(declare-const invest_in_fhc Bool)
(declare-const invest_in_foreign_financial_institution Bool)
(declare-const invest_in_futures Bool)
(declare-const invest_in_insurance Bool)
(declare-const invest_in_other_related_financial Bool)
(declare-const invest_in_securities Bool)
(declare-const invest_in_trust Bool)
(declare-const invest_in_venture_capital Bool)
(declare-const investment_approved Bool)
(declare-const investment_no_voting_rights_if_no_approval Bool)
(declare-const investment_performed Bool)
(declare-const investment_without_approval_prohibited Bool)
(declare-const loan_is_consumer_loan Bool)
(declare-const loan_is_government_loan Bool)
(declare-const major_shareholder_definition Int)
(declare-const major_shareholder_minor_children_share_percent Real)
(declare-const major_shareholder_own_share_percent Real)
(declare-const major_shareholder_spouse_share_percent Real)
(declare-const major_shareholder_total_share_percent Real)
(declare-const must_liquidate Bool)
(declare-const no_unsecured_credit_over_3_percent Bool)
(declare-const no_unsecured_credit_to_related_persons Bool)
(declare-const not_use_fhc_name Bool)
(declare-const notify_economic_ministry_to_cancel_registration Bool)
(declare-const order_dispose_subsidiary_shares Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const prohibited_manager_in_venture_invested_company Bool)
(declare-const regulator_defined_threshold Real)
(declare-const regulator_impose_sanctions Bool)
(declare-const regulator_may_impose_sanctions Bool)
(declare-const regulator_order_adjust Bool)
(declare-const regulator_order_disposal Bool)
(declare-const regulator_order_dispose_illegal_investment Bool)
(declare-const remove_director_or_supervisor Bool)
(declare-const remove_director_supervisor_notify_economic_ministry Bool)
(declare-const remove_manager_or_staff Bool)
(declare-const remove_or_suspend_director_or_supervisor Bool)
(declare-const revoke_permit Bool)
(declare-const revoke_permit_must_dispose_shares_and_restrict_name_use Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const sanction_types Int)
(declare-const secured_credit_over_5_percent_requirements Bool)
(declare-const secured_credit_over_threshold_must_board_approval Bool)
(declare-const shares_have_no_voting_right Bool)
(declare-const shares_not_counted_in_total Bool)
(declare-const subsidiary_business_exceed_limit Bool)
(declare-const subsidiary_business_investment Bool)
(declare-const subsidiary_business_management Bool)
(declare-const subsidiary_business_scope_ok Bool)
(declare-const subsidiary_capital_reduction Bool)
(declare-const subsidiary_capital_reduction_approval_required Bool)
(declare-const subsidiary_investment_exceed_limit Bool)
(declare-const suspend_subsidiary_business_part_or_all Bool)
(declare-const violate_law Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:subsidiary_business_scope_ok] 子公司業務限於投資及對被投資事業之管理
(assert (= subsidiary_business_scope_ok
   (and subsidiary_business_investment subsidiary_business_management)))

; [fhc:investment_approved] 投資事業已獲主管機關核准
(assert (= investment_approved
   (or invest_in_venture_capital
       invest_in_bill_finance
       invest_in_securities
       invest_in_trust
       invest_in_insurance
       invest_in_fhc
       invest_in_futures
       invest_in_other_related_financial
       invest_in_bank
       invest_in_credit_card
       invest_in_foreign_financial_institution)))

; [fhc:investment_without_approval_prohibited] 未經核准不得進行投資行為
(assert (= investment_without_approval_prohibited
   (or investment_approved (not investment_performed))))

; [fhc:investment_no_voting_rights_if_no_approval] 未申請核准取得之股份無表決權且不計入已發行股份總數
(assert (= investment_no_voting_rights_if_no_approval
   (or investment_approved
       (and shares_have_no_voting_right shares_not_counted_in_total))))

; [fhc:regulator_may_order_disposal_of_illegal_investment] 主管機關應限令處分違規投資
(assert (= regulator_order_disposal
   (or investment_approved regulator_order_dispose_illegal_investment)))

; [fhc:excess_business_or_investment_must_adjust] 子公司業務或投資逾越法令規定範圍者應限期調整
(assert (= excess_business_or_investment_must_adjust
   (or regulator_order_adjust
       (not (or subsidiary_business_exceed_limit
                subsidiary_investment_exceed_limit)))))

; [fhc:adjustment_period_limit] 調整期限最長三年，得申請延長二次，每次二年
(assert (= adjustment_period_limit
   (ite (and (>= 3 adjustment_period_years)
             (>= 2 adjustment_extension_times)
             (>= 2.0 adjustment_extension_years_per_time))
        1
        0)))

; [fhc:prohibited_manager_in_venture_invested_company] 金融控股公司負責人或職員不得擔任創業投資事業所投資事業經理人
(assert (not (= fhc_manager_is_venture_invested_company_manager
        prohibited_manager_in_venture_invested_company)))

; [fhc:subsidiary_capital_reduction_approval_required] 子公司減資應事先申請核准
(assert (= subsidiary_capital_reduction_approval_required
   (or capital_reduction_approval_applied (not subsidiary_capital_reduction))))

; [fhc:regulator_may_impose_sanctions] 違反法令或有礙健全經營時主管機關得予糾正、限期改善及處分
(assert (= regulator_may_impose_sanctions
   (or regulator_impose_sanctions (not (or violate_law impede_sound_operation)))))

; [fhc:sanction_types] 主管機關可採取之處分種類
(assert (= sanction_types
   (ite (or revoke_statutory_meeting_resolution
            remove_or_suspend_director_or_supervisor
            order_dispose_subsidiary_shares
            other_necessary_measures
            suspend_subsidiary_business_part_or_all
            remove_manager_or_staff
            revoke_permit)
        1
        0)))

; [fhc:remove_director_supervisor_notify_economic_ministry] 解除董事監察人職務時通知經濟部廢止登記
(assert (= remove_director_supervisor_notify_economic_ministry
   (or notify_economic_ministry_to_cancel_registration
       (not remove_director_or_supervisor))))

; [fhc:revoke_permit_must_dispose_shares_and_restrict_name_use] 廢止許可時應限期處分股份及禁止使用金融控股公司名稱
(assert (= revoke_permit_must_dispose_shares_and_restrict_name_use
   (or (not revoke_permit)
       (and dispose_shares_within_deadline
            not_use_fhc_name
            apply_company_change_registration))))

; [fhc:fail_to_dispose_shares_must_liquidate] 未於期限內處分完成者應解散清算
(assert (let ((a!1 (or must_liquidate
               (not (and revoke_permit (not dispose_shares_within_deadline))))))
  (= fail_to_dispose_shares_must_liquidate a!1)))

; [bank:no_unsecured_credit_over_3_percent] 銀行對持有實收資本總額超過3%之企業等不得無擔保授信
(assert (let ((a!1 (= (and (not (<= credit_amount_to_enterprise_percent 3.0))
                   credit_is_unsecured)
              no_unsecured_credit_over_3_percent)))
  (not a!1)))

; [bank:no_unsecured_credit_to_related_persons] 銀行不得對負責人、職員、主要股東及其利害關係人無擔保授信
(assert (not (= (and credit_is_unsecured
             (or credit_to_major_shareholder
                 credit_to_responsible_person
                 credit_to_related_person_of_responsible_or_credit_staff
                 credit_to_staff))
        no_unsecured_credit_to_related_persons)))

; [bank:consumer_and_government_loans_exempted] 消費者貸款及政府貸款不受無擔保授信限制
(assert (= consumer_and_government_loans_exempted
   (or loan_is_consumer_loan loan_is_government_loan)))

; [bank:major_shareholder_definition] 主要股東定義含持股1%以上及其配偶未成年子女持股
(assert (= major_shareholder_definition
   (ite (= major_shareholder_total_share_percent
           (+ major_shareholder_own_share_percent
              major_shareholder_spouse_share_percent
              major_shareholder_minor_children_share_percent))
        1
        0)))

; [bank:secured_credit_over_5_percent_requirements] 銀行對持有實收資本總額超過5%之企業等擔保授信應有十足擔保且條件不得優於同類授信
(assert (let ((a!1 (or (not (and (<= 5.0 credit_amount_to_enterprise_percent)
                         credit_is_secured))
               (and credit_has_full_collateral
                    (not credit_conditions_better_than_similar)))))
  (= secured_credit_over_5_percent_requirements a!1)))

; [bank:secured_credit_over_threshold_must_board_approval] 授信達主管機關規定金額以上須經董事會三分之二出席及四分之三同意
(assert (= secured_credit_over_threshold_must_board_approval
   (or (not (>= credit_amount regulator_defined_threshold))
       (and (<= (/ 6667.0 10000.0) board_attendance_ratio)
            (<= (/ 3.0 4.0) board_approval_ratio)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司投資核准、子公司業務範圍、調整命令、負責人職務限制、子公司減資核准及銀行授信限制等規定時處罰
(assert (= penalty
   (or (not (= major_shareholder_definition 1))
       (not excess_business_or_investment_must_adjust)
       (not investment_approved)
       (not (= adjustment_period_limit 1))
       (not subsidiary_capital_reduction_approval_required)
       (not no_unsecured_credit_over_3_percent)
       (not secured_credit_over_5_percent_requirements)
       (not subsidiary_business_scope_ok)
       (not (= sanction_types 1))
       (not regulator_may_impose_sanctions)
       (not consumer_and_government_loans_exempted)
       (not secured_credit_over_threshold_must_board_approval)
       (not investment_without_approval_prohibited)
       (not prohibited_manager_in_venture_invested_company)
       (not remove_director_supervisor_notify_economic_ministry)
       (not revoke_permit_must_dispose_shares_and_restrict_name_use)
       (not fail_to_dispose_shares_must_liquidate)
       (not investment_no_voting_rights_if_no_approval)
       (not no_unsecured_credit_to_related_persons)
       (not regulator_order_disposal))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= subsidiary_business_investment false))
(assert (= subsidiary_business_management false))
(assert (= subsidiary_business_scope_ok false))
(assert (= investment_approved false))
(assert (= investment_performed true))
(assert (= investment_without_approval_prohibited false))
(assert (= investment_no_voting_rights_if_no_approval false))
(assert (= regulator_order_disposal false))
(assert (= regulator_order_dispose_illegal_investment true))
(assert (= excess_business_or_investment_must_adjust false))
(assert (= regulator_order_adjust true))
(assert (= adjustment_period_years 4))
(assert (= adjustment_extension_times 3))
(assert (= adjustment_extension_years_per_time 3))
(assert (= prohibited_manager_in_venture_invested_company false))
(assert (= fhc_manager_is_venture_invested_company_manager true))
(assert (= subsidiary_capital_reduction false))
(assert (= capital_reduction_approval_applied false))
(assert (= regulator_may_impose_sanctions true))
(assert (= regulator_impose_sanctions true))
(assert (= sanction_types 1))
(assert (= remove_director_or_supervisor false))
(assert (= remove_director_supervisor_notify_economic_ministry false))
(assert (= revoke_permit false))
(assert (= revoke_permit_must_dispose_shares_and_restrict_name_use false))
(assert (= dispose_shares_within_deadline false))
(assert (= not_use_fhc_name false))
(assert (= apply_company_change_registration false))
(assert (= fail_to_dispose_shares_must_liquidate false))
(assert (= must_liquidate false))
(assert (= no_unsecured_credit_over_3_percent false))
(assert (= credit_amount_to_enterprise_percent (/ 717.0 10.0)))
(assert (= credit_is_unsecured true))
(assert (= no_unsecured_credit_to_related_persons false))
(assert (= credit_to_responsible_person true))
(assert (= credit_to_staff false))
(assert (= credit_to_major_shareholder false))
(assert (= credit_to_related_person_of_responsible_or_credit_staff true))
(assert (= consumer_and_government_loans_exempted false))
(assert (= major_shareholder_own_share_percent (/ 3.0 2.0)))
(assert (= major_shareholder_spouse_share_percent (/ 1.0 2.0)))
(assert (= major_shareholder_minor_children_share_percent 0.0))
(assert (= major_shareholder_total_share_percent 2.0))
(assert (= major_shareholder_definition 1))
(assert (= credit_is_secured false))
(assert (= credit_has_full_collateral false))
(assert (= credit_conditions_better_than_similar true))
(assert (= credit_amount 100000000))
(assert (= regulator_defined_threshold 50000000))
(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 3.0 5.0)))
(assert (= penalty true))
(assert (= violate_law true))
(assert (= impede_sound_operation true))
(assert (= invest_in_fhc true))
(assert (= invest_in_bank true))
(assert (= invest_in_bill_finance false))
(assert (= invest_in_credit_card false))
(assert (= invest_in_trust false))
(assert (= invest_in_insurance false))
(assert (= invest_in_securities false))
(assert (= invest_in_futures false))
(assert (= invest_in_venture_capital false))
(assert (= invest_in_foreign_financial_institution false))
(assert (= invest_in_other_related_financial false))
(assert (= shares_have_no_voting_right false))
(assert (= shares_not_counted_in_total false))
(assert (= order_dispose_subsidiary_shares false))
(assert (= remove_manager_or_staff false))
(assert (= remove_or_suspend_director_or_supervisor false))
(assert (= other_necessary_measures false))
(assert (= notify_economic_ministry_to_cancel_registration false))
(assert (= suspend_subsidiary_business_part_or_all true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 82
; Total facts: 73
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
