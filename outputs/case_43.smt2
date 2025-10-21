; SMT2 file generated from compliance case automatic
; Case ID: case_43
; Generated at: 2025-10-20T23:55:41.524559
;
; This file can be executed with Z3:
;   z3 case_43.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_period_limit Int)
(declare-const adjustment_period_years Int)
(declare-const authority_opposition Bool)
(declare-const bank_commercial Bool)
(declare-const bank_includes_subtypes Bool)
(declare-const bank_professional Bool)
(declare-const bank_trust_investment Bool)
(declare-const business_type Int)
(declare-const capital_percent Real)
(declare-const control_shareholding Bool)
(declare-const days_since_application Int)
(declare-const directly_or_indirectly_appointed_directors_percent Real)
(declare-const disposal_completed Bool)
(declare-const disposal_deadline_days Int)
(declare-const disposal_ordered Bool)
(declare-const dispose_subsidiary_shares Bool)
(declare-const excess_business_or_investment_adjustment_required Bool)
(declare-const extension_period_years Int)
(declare-const extension_times Int)
(declare-const failure_to_dispose_after_revoke_permit Bool)
(declare-const fhc_officer_is_manager_in_venture_invested_company Bool)
(declare-const futures_advisor Bool)
(declare-const futures_broker Bool)
(declare-const futures_includes_subtypes Bool)
(declare-const futures_leveraged_trader Bool)
(declare-const futures_manager Bool)
(declare-const futures_trust Bool)
(declare-const insurance_agent Bool)
(declare-const insurance_broker Bool)
(declare-const insurance_includes_subtypes Bool)
(declare-const insurance_life Bool)
(declare-const insurance_property Bool)
(declare-const insurance_reinsurance Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_executed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const invest_in_bank Bool)
(declare-const invest_in_bill_finance Bool)
(declare-const invest_in_credit_card Bool)
(declare-const invest_in_fhc Bool)
(declare-const invest_in_foreign_financial_institution_approved Bool)
(declare-const invest_in_futures Bool)
(declare-const invest_in_insurance Bool)
(declare-const invest_in_other_financial_related_approved Bool)
(declare-const invest_in_securities Bool)
(declare-const invest_in_trust Bool)
(declare-const invest_in_venture_capital Bool)
(declare-const investment_approval_status Bool)
(declare-const investment_target_approved Bool)
(declare-const investment_without_approval_prohibited Bool)
(declare-const is_bank_subsidiary Bool)
(declare-const is_chairman_or_general_manager_or_majority_director Bool)
(declare-const is_corporate_and_spouse_or_second_degree_relative_of_chairman_or_gm Bool)
(declare-const is_insurance_subsidiary Bool)
(declare-const is_securities_subsidiary Bool)
(declare-const is_spouse_or_second_degree_relative Bool)
(declare-const max_allowed_directors Int)
(declare-const max_allowed_shares Int)
(declare-const notify_economic_ministry_to_revoke_registration Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const prohibit_company_registration_change Bool)
(declare-const prohibit_use_fhc_name Bool)
(declare-const prohibited_manager_in_venture_invested_company Bool)
(declare-const regulatory_actions_for_violation Bool)
(declare-const related_person_corporate Bool)
(declare-const related_person_natural Bool)
(declare-const remove_director_or_supervisor Bool)
(declare-const remove_manager_or_staff Bool)
(declare-const revoke_director_supervisor_registration Bool)
(declare-const revoke_permit Bool)
(declare-const revoke_permit_disposal_requirement Bool)
(declare-const revoke_statutory_resolution Bool)
(declare-const securities_advisor Bool)
(declare-const securities_broker Bool)
(declare-const securities_includes_subtypes Bool)
(declare-const securities_trust Bool)
(declare-const shareholding_approval_required Bool)
(declare-const shareholding_approved Bool)
(declare-const shareholding_change_percent Real)
(declare-const shareholding_excess_disposal_ordered Bool)
(declare-const shareholding_excess_no_voting_right Bool)
(declare-const shareholding_in_enterprise_percent Real)
(declare-const shareholding_percent Real)
(declare-const shareholding_reported Bool)
(declare-const shareholding_reporting_required Bool)
(declare-const subsidiary Bool)
(declare-const subsidiary_business_exceed_limit Bool)
(declare-const subsidiary_business_investment Bool)
(declare-const subsidiary_business_management Bool)
(declare-const subsidiary_business_scope_ok Bool)
(declare-const subsidiary_capital_reduction_approval_required Bool)
(declare-const subsidiary_capital_reduction_approved Bool)
(declare-const subsidiary_directors_held Int)
(declare-const subsidiary_investment_exceed_limit Bool)
(declare-const subsidiary_shares_held Int)
(declare-const suspend_subsidiary_business Bool)
(declare-const voting_shares_percent Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:subsidiary_business_scope_ok] 子公司業務限於投資及對被投資事業之管理
(assert (= subsidiary_business_scope_ok
   (and subsidiary_business_investment subsidiary_business_management)))

; [fhc:investment_target_approved] 投資事業為主管機關核准之類別
(assert (= investment_target_approved
   (or invest_in_futures
       invest_in_bank
       invest_in_foreign_financial_institution_approved
       invest_in_trust
       invest_in_insurance
       invest_in_securities
       invest_in_other_financial_related_approved
       invest_in_bill_finance
       invest_in_fhc
       invest_in_venture_capital
       invest_in_credit_card)))

; [fhc:bank_includes_subtypes] 銀行業包括商業銀行、專業銀行及信託投資公司
(assert (= bank_includes_subtypes
   (and bank_commercial bank_professional bank_trust_investment)))

; [fhc:insurance_includes_subtypes] 保險業包括財產保險業、人身保險業、再保險公司、保險代理人及經紀人
(assert (= insurance_includes_subtypes
   (and insurance_property
        insurance_life
        insurance_reinsurance
        insurance_agent
        insurance_broker)))

; [fhc:securities_includes_subtypes] 證券業包括證券商、證券投資信託事業、證券投資顧問事業
(assert (= securities_includes_subtypes
   (and securities_broker securities_trust securities_advisor)))

; [fhc:futures_includes_subtypes] 期貨業包括期貨商、槓桿交易商、期貨信託事業、期貨經理事業及期貨顧問事業
(assert (= futures_includes_subtypes
   (and futures_broker
        futures_leveraged_trader
        futures_trust
        futures_manager
        futures_advisor)))

; [fhc:investment_approval_status] 投資事業申請核准後，主管機關未於期限內反對視為核准
(assert (let ((a!1 (or (and (<= 1 business_type)
                    (>= 9 business_type)
                    (>= 15 days_since_application)
                    (not authority_opposition))
               (and (or (= 10 business_type) (= 11 business_type))
                    (>= 30 days_since_application)
                    (not authority_opposition)))))
  (= investment_approval_status a!1)))

; [fhc:investment_without_approval_prohibited] 未經核准不得進行申請之投資行為
(assert (not (= investment_approval_status investment_without_approval_prohibited)))

; [fhc:excess_business_or_investment_adjustment_required] 子公司業務或投資逾越法令規定範圍者，主管機關應限期命其調整
(assert (= excess_business_or_investment_adjustment_required
   (or subsidiary_business_exceed_limit subsidiary_investment_exceed_limit)))

; [fhc:adjustment_period_limit] 調整期限最長三年，得申請延長二次，每次二年
(assert (= adjustment_period_limit
   (ite (and (>= 3 adjustment_period_years)
             (>= 2 extension_times)
             (>= 2 extension_period_years))
        1
        0)))

; [fhc:prohibited_manager_in_venture_invested_company] 金融控股公司負責人或職員不得擔任創業投資事業所投資事業之經理人
(assert (not (= fhc_officer_is_manager_in_venture_invested_company
        prohibited_manager_in_venture_invested_company)))

; [fhc:subsidiary_capital_reduction_approval_required] 子公司減資應事先申請核准
(assert (= subsidiary_capital_reduction_approval_required
   subsidiary_capital_reduction_approved))

; [fhc:internal_control_and_audit_established] 金融控股公司應建立內部控制及稽核制度
(assert (= internal_control_and_audit_established internal_control_established))

; [fhc:internal_control_and_audit_executed] 金融控股公司應確實執行內部控制及稽核制度
(assert (= internal_control_and_audit_executed internal_control_executed))

; [fhc:regulatory_actions_for_violation] 主管機關得對違反法令或有礙健全經營者採取處分
(assert (= regulatory_actions_for_violation
   (or remove_manager_or_staff
       suspend_subsidiary_business
       revoke_statutory_resolution
       remove_director_or_supervisor
       other_necessary_measures
       revoke_permit
       dispose_subsidiary_shares)))

; [fhc:revoke_director_supervisor_registration] 解除董事、監察人職務時通知經濟部廢止登記
(assert (= revoke_director_supervisor_registration
   (or (not remove_director_or_supervisor)
       notify_economic_ministry_to_revoke_registration)))

; [fhc:revoke_permit_disposal_requirement] 廢止許可時限期處分股份及董事人數不符規定，禁止使用名稱及變更登記
(assert (= revoke_permit_disposal_requirement
   (and revoke_permit
        (>= 0 disposal_deadline_days)
        (<= subsidiary_shares_held max_allowed_shares)
        (<= subsidiary_directors_held max_allowed_directors)
        prohibit_use_fhc_name
        prohibit_company_registration_change)))

; [fhc:failure_to_dispose_after_revoke_permit] 未於期限內處分完成者，應進行解散及清算
(assert (= failure_to_dispose_after_revoke_permit
   (and revoke_permit
        (not (<= disposal_deadline_days 0))
        (not disposal_completed))))

; [fhc:shareholding_reporting_required] 同一人或同一關係人持股超過規定比例應申報
(assert (let ((a!1 (or (and (not (<= shareholding_percent 5.0))
                    (not (<= shareholding_change_percent 1.0)))
               (not (<= shareholding_percent 5.0))
               (not (<= shareholding_percent 10.0))
               (not (<= shareholding_percent 25.0))
               (not (<= shareholding_percent 50.0)))))
  (= shareholding_reporting_required a!1)))

; [fhc:shareholding_approval_required] 持股超過10%、25%、50%應事先申請核准
(assert (= shareholding_approval_required
   (or (<= 10.0 shareholding_percent)
       (<= 25.0 shareholding_percent)
       (<= 50.0 shareholding_percent))))

; [fhc:shareholding_excess_no_voting_right] 未申報或未核准持股超過部分無表決權
(assert (let ((a!1 (or (and (not (<= shareholding_percent 5.0))
                    (not shareholding_reported))
               (and (not (<= shareholding_percent 10.0))
                    (not shareholding_approved)))))
  (= shareholding_excess_no_voting_right a!1)))

; [fhc:shareholding_excess_disposal_ordered] 主管機關命限期處分超過部分股份
(assert (let ((a!1 (or (and (not (<= shareholding_percent 5.0))
                    (not shareholding_reported))
               (and (not (<= shareholding_percent 10.0))
                    (not shareholding_approved)))))
  (= shareholding_excess_disposal_ordered (and a!1 disposal_ordered))))

; [fhc:control_shareholding_definition] 控制性持股定義
(assert (= control_shareholding
   (or (not (<= voting_shares_percent 25.0))
       (not (<= directly_or_indirectly_appointed_directors_percent 50.0))
       (not (<= capital_percent 25.0)))))

; [fhc:subsidiary_definition] 子公司定義
(assert (let ((a!1 (or is_bank_subsidiary
               is_insurance_subsidiary
               is_securities_subsidiary
               (and (not (<= voting_shares_percent 50.0))
                    (not (<= capital_percent 50.0))
                    (not (<= directly_or_indirectly_appointed_directors_percent
                             50.0))))))
  (= subsidiary a!1)))

; [fhc:related_person_definition] 同一自然人之關係人範圍
(assert (= related_person_natural
   (or is_spouse_or_second_degree_relative
       (not (<= shareholding_in_enterprise_percent 33.0))
       is_chairman_or_general_manager_or_majority_director)))

; [fhc:related_person_corporate] 同一法人之關係人範圍
(assert (= related_person_corporate
   (or (not (<= shareholding_in_enterprise_percent 33.0))
       is_corporate_and_spouse_or_second_degree_relative_of_chairman_or_gm
       is_chairman_or_general_manager_or_majority_director)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法及相關規定時處罰
(assert (= penalty
   (or shareholding_reporting_required
       shareholding_excess_disposal_ordered
       (not subsidiary_business_scope_ok)
       excess_business_or_investment_adjustment_required
       (not subsidiary_capital_reduction_approval_required)
       shareholding_approval_required
       (not prohibited_manager_in_venture_invested_company)
       (not investment_target_approved)
       investment_without_approval_prohibited
       (not internal_control_and_audit_established)
       shareholding_excess_no_voting_right
       (not internal_control_and_audit_executed)
       (not investment_approval_status))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= subsidiary_business_investment true))
(assert (= subsidiary_business_management false))
(assert (= subsidiary_business_scope_ok false))
(assert (= investment_target_approved true))
(assert (= investment_approval_status true))
(assert (= investment_without_approval_prohibited false))
(assert (= excess_business_or_investment_adjustment_required true))
(assert (= fhc_officer_is_manager_in_venture_invested_company false))
(assert (= prohibited_manager_in_venture_invested_company false))
(assert (= subsidiary_capital_reduction_approved true))
(assert (= subsidiary_capital_reduction_approval_required true))
(assert (= internal_control_established false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_and_audit_executed false))
(assert (= shareholding_reporting_required false))
(assert (= shareholding_approval_required false))
(assert (= shareholding_excess_no_voting_right false))
(assert (= shareholding_excess_disposal_ordered false))
(assert (= penalty true))
(assert (= remove_director_or_supervisor false))
(assert (= remove_manager_or_staff false))
(assert (= other_necessary_measures true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 99
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
