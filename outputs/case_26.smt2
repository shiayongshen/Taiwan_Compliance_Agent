; SMT2 file generated from compliance case automatic
; Case ID: case_26
; Generated at: 2025-10-20T23:21:39.792408
;
; This file can be executed with Z3:
;   z3 case_26.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_deadline_within_limit Bool)
(declare-const adjustment_deadline_years Int)
(declare-const adjustment_extension_times Int)
(declare-const adjustment_extension_years_per_extension Int)
(declare-const adjustment_order_issued Bool)
(declare-const adjustment_ordered Bool)
(declare-const application_submitted Bool)
(declare-const approval_obtained Bool)
(declare-const approval_obtained_for_thresholds Bool)
(declare-const bank_investment_subtypes_ok Bool)
(declare-const business_days_since_application Int)
(declare-const capital_reduction_approval_obtained Bool)
(declare-const correction_ordered Bool)
(declare-const director_or_supervisor_dismissed_or_suspended Bool)
(declare-const disapproval_expressed Bool)
(declare-const exceeding_shares_no_voting_right Bool)
(declare-const fhc_officer_or_staff Bool)
(declare-const futures_investment_subtypes_ok Bool)
(declare-const hold_shares_exceed_without_approval Bool)
(declare-const improvement_ordered Bool)
(declare-const insurance_investment_subtypes_ok Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_executed Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_control_and_audit_system_executed Bool)
(declare-const invest_in_bank Bool)
(declare-const invest_in_bill_finance Bool)
(declare-const invest_in_commercial_bank Bool)
(declare-const invest_in_credit_card Bool)
(declare-const invest_in_fhc Bool)
(declare-const invest_in_foreign_financial_institution_approved Bool)
(declare-const invest_in_futures Bool)
(declare-const invest_in_futures_advisor Bool)
(declare-const invest_in_futures_broker Bool)
(declare-const invest_in_futures_manager Bool)
(declare-const invest_in_futures_trust Bool)
(declare-const invest_in_insurance Bool)
(declare-const invest_in_insurance_agent Bool)
(declare-const invest_in_insurance_broker Bool)
(declare-const invest_in_leveraged_trader Bool)
(declare-const invest_in_life_insurance Bool)
(declare-const invest_in_other_financial_related_approved Bool)
(declare-const invest_in_property_insurance Bool)
(declare-const invest_in_reinsurance_company Bool)
(declare-const invest_in_securities Bool)
(declare-const invest_in_securities_firm Bool)
(declare-const invest_in_securities_investment_advisor Bool)
(declare-const invest_in_securities_investment_trust Bool)
(declare-const invest_in_specialized_bank Bool)
(declare-const invest_in_trust Bool)
(declare-const invest_in_trust_investment_company Bool)
(declare-const invest_in_venture_capital Bool)
(declare-const investment_approval_scope Bool)
(declare-const investment_approval_status Bool)
(declare-const investment_made Bool)
(declare-const investment_without_approval_prohibited Bool)
(declare-const legal_person_related_definition_met Bool)
(declare-const license_revoked Bool)
(declare-const manager_or_staff_dismissed Bool)
(declare-const natural_person_related_definition_met Bool)
(declare-const other_necessary_measures_taken Bool)
(declare-const penalty Bool)
(declare-const pledge_to_subsidiary Bool)
(declare-const prohibited_manager_in_venture_invested_company Bool)
(declare-const prohibited_pledge_of_shares Bool)
(declare-const regulator_orders_disposal Bool)
(declare-const related_persons_definition_ok Bool)
(declare-const reporting_and_approval_compliance Bool)
(declare-const reporting_obligation_met Bool)
(declare-const securities_investment_subtypes_ok Bool)
(declare-const shareholder_is_same_person_or_related Bool)
(declare-const shareholding_exceedance_penalty Bool)
(declare-const statutory_meeting_resolution_revoked Bool)
(declare-const subsidiary_business_exceed_limit Bool)
(declare-const subsidiary_business_investment Bool)
(declare-const subsidiary_business_management Bool)
(declare-const subsidiary_business_or_investment_exceed_limit Bool)
(declare-const subsidiary_business_scope_ok Bool)
(declare-const subsidiary_business_suspension Bool)
(declare-const subsidiary_capital_reduction Bool)
(declare-const subsidiary_capital_reduction_approval_required Bool)
(declare-const subsidiary_investment_exceed_limit Bool)
(declare-const subsidiary_shares_disposed Bool)
(declare-const venture_invested_company_manager Bool)
(declare-const violation_penalty_conditions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:subsidiary_business_scope_ok] 子公司業務限於投資及對被投資事業之管理
(assert (= subsidiary_business_scope_ok
   (and subsidiary_business_investment subsidiary_business_management)))

; [fhc:investment_approval_scope] 投資事業類別符合主管機關核准範圍
(assert (= investment_approval_scope
   (or invest_in_securities
       invest_in_futures
       invest_in_bill_finance
       invest_in_credit_card
       invest_in_foreign_financial_institution_approved
       invest_in_bank
       invest_in_venture_capital
       invest_in_insurance
       invest_in_trust
       invest_in_other_financial_related_approved
       invest_in_fhc)))

; [fhc:bank_investment_subtypes_ok] 銀行業投資包含商業銀行、專業銀行及信託投資公司
(assert (= bank_investment_subtypes_ok
   (or invest_in_commercial_bank
       invest_in_specialized_bank
       invest_in_trust_investment_company)))

; [fhc:insurance_investment_subtypes_ok] 保險業投資包含財產保險業、人身保險業、再保險公司、保險代理人及經紀人
(assert (= insurance_investment_subtypes_ok
   (or invest_in_reinsurance_company
       invest_in_property_insurance
       invest_in_life_insurance
       invest_in_insurance_broker
       invest_in_insurance_agent)))

; [fhc:securities_investment_subtypes_ok] 證券業投資包含證券商、證券投資信託事業、證券投資顧問事業
(assert (= securities_investment_subtypes_ok
   (or invest_in_securities_investment_advisor
       invest_in_securities_firm
       invest_in_securities_investment_trust)))

; [fhc:futures_investment_subtypes_ok] 期貨業投資包含期貨商、槓桿交易商、期貨信託事業、期貨經理事業及期貨顧問事業
(assert (= futures_investment_subtypes_ok
   (or invest_in_leveraged_trader
       invest_in_futures_broker
       invest_in_futures_manager
       invest_in_futures_advisor
       invest_in_futures_trust)))

; [fhc:investment_approval_status] 投資行為經主管機關核准或視為核准
(assert (let ((a!1 (and application_submitted
                (or (and (or invest_in_securities
                             invest_in_futures
                             invest_in_bill_finance
                             invest_in_credit_card
                             invest_in_bank
                             invest_in_venture_capital
                             invest_in_insurance
                             invest_in_trust
                             invest_in_fhc)
                         (>= 15 business_days_since_application))
                    (and (or invest_in_foreign_financial_institution_approved
                             invest_in_other_financial_related_approved)
                         (>= 30 business_days_since_application)))
                (not disapproval_expressed))))
  (= investment_approval_status (or approval_obtained a!1))))

; [fhc:investment_without_approval_prohibited] 未經核准不得進行投資行為
(assert (= investment_without_approval_prohibited
   (or (not investment_made) investment_approval_status)))

; [fhc:subsidiary_business_or_investment_exceed_limit] 子公司業務或投資逾越法令規定範圍
(assert (= subsidiary_business_or_investment_exceed_limit
   (or subsidiary_business_exceed_limit subsidiary_investment_exceed_limit)))

; [fhc:adjustment_ordered] 主管機關限期命金融控股公司調整逾越範圍之業務或投資
(assert (= adjustment_ordered
   (or (not subsidiary_business_or_investment_exceed_limit)
       adjustment_order_issued)))

; [fhc:adjustment_deadline_within_limit] 調整期限最長三年，必要時得申請延長二次，每次二年
(assert (let ((a!1 (and (>= 3 adjustment_deadline_years)
                (or (<= adjustment_extension_times 0)
                    (and (>= 2 adjustment_extension_times)
                         (>= 2 adjustment_extension_years_per_extension))))))
  (= adjustment_deadline_within_limit a!1)))

; [fhc:prohibited_manager_in_venture_invested_company] 金融控股公司負責人或職員不得擔任創業投資事業所投資事業經理人
(assert (not (= (and fhc_officer_or_staff venture_invested_company_manager)
        prohibited_manager_in_venture_invested_company)))

; [fhc:subsidiary_capital_reduction_approval_required] 子公司減資應事先申請核准
(assert (= subsidiary_capital_reduction_approval_required
   (or capital_reduction_approval_obtained (not subsidiary_capital_reduction))))

; [fhc:internal_control_and_audit_established] 金融控股公司應建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   internal_control_and_audit_system_established))

; [fhc:internal_control_and_audit_executed] 金融控股公司應確實執行內部控制及稽核制度
(assert (= internal_control_and_audit_executed
   internal_control_and_audit_system_executed))

; [fhc:violation_penalty_conditions] 違反法令、章程或有礙健全經營之虞時主管機關得處分
(assert (= violation_penalty_conditions
   (or manager_or_staff_dismissed
       correction_ordered
       license_revoked
       subsidiary_business_suspension
       improvement_ordered
       other_necessary_measures_taken
       director_or_supervisor_dismissed_or_suspended
       statutory_meeting_resolution_revoked
       subsidiary_shares_disposed)))

; [fhc:shareholding_exceedance_penalty] 未經核准持有股份超過規定部分無表決權且應限令處分
(assert (= shareholding_exceedance_penalty
   (and hold_shares_exceed_without_approval
        exceeding_shares_no_voting_right
        regulator_orders_disposal)))

; [fhc:reporting_and_approval_compliance] 持股超過規定比例應申報及申請核准
(assert (= reporting_and_approval_compliance
   (and reporting_obligation_met approval_obtained_for_thresholds)))

; [fhc:prohibited_pledge_of_shares] 同一人或同一關係人持有股份不得設定質權予子公司
(assert (not (= (and shareholder_is_same_person_or_related pledge_to_subsidiary)
        prohibited_pledge_of_shares)))

; [fhc:related_persons_definition_ok] 同一自然人及同一法人之關係人定義符合規定
(assert (= related_persons_definition_ok
   (and natural_person_related_definition_met
        legal_person_related_definition_met)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法第36條、51條、54條、60條及相關規定時處罰
(assert (= penalty
   (or (not related_persons_definition_ok)
       (not subsidiary_business_scope_ok)
       (not reporting_and_approval_compliance)
       (not investment_approval_status)
       (not prohibited_manager_in_venture_invested_company)
       (and investment_made (not investment_approval_status))
       (not investment_approval_scope)
       shareholding_exceedance_penalty
       (not subsidiary_capital_reduction_approval_required)
       (not internal_control_and_audit_established)
       (not internal_control_and_audit_executed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= subsidiary_business_investment true))
(assert (= subsidiary_business_management false))
(assert (= subsidiary_business_scope_ok false))
(assert (= investment_approval_scope true))
(assert (= investment_approval_status true))
(assert (= investment_made false))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_control_and_audit_system_executed false))
(assert (= internal_control_and_audit_executed false))
(assert (= reporting_obligation_met true))
(assert (= approval_obtained_for_thresholds true))
(assert (= reporting_and_approval_compliance true))
(assert (= shareholding_exceedance_penalty false))
(assert (= fhc_officer_or_staff true))
(assert (= venture_invested_company_manager false))
(assert (= prohibited_manager_in_venture_invested_company true))
(assert (= subsidiary_capital_reduction false))
(assert (= capital_reduction_approval_obtained true))
(assert (= related_persons_definition_ok false))
(assert (= natural_person_related_definition_met true))
(assert (= legal_person_related_definition_met false))
(assert (= adjustment_ordered true))
(assert (= adjustment_order_issued true))
(assert (= adjustment_deadline_years 3))
(assert (= adjustment_extension_times 0))
(assert (= adjustment_extension_years_per_extension 0))
(assert (= correction_ordered true))
(assert (= improvement_ordered true))
(assert (= statutory_meeting_resolution_revoked false))
(assert (= subsidiary_business_suspension false))
(assert (= manager_or_staff_dismissed false))
(assert (= director_or_supervisor_dismissed_or_suspended false))
(assert (= subsidiary_shares_disposed false))
(assert (= license_revoked false))
(assert (= other_necessary_measures_taken false))
(assert (= penalty true))
(assert (= application_submitted false))
(assert (= approval_obtained false))
(assert (= disapproval_expressed false))
(assert (= hold_shares_exceed_without_approval false))
(assert (= exceeding_shares_no_voting_right false))
(assert (= regulator_orders_disposal false))
(assert (= pledge_to_subsidiary false))
(assert (= shareholder_is_same_person_or_related false))
(assert (= bank_investment_subtypes_ok true))
(assert (= insurance_investment_subtypes_ok true))
(assert (= securities_investment_subtypes_ok true))
(assert (= futures_investment_subtypes_ok true))
(assert (= invest_in_fhc false))
(assert (= invest_in_bank false))
(assert (= invest_in_bill_finance false))
(assert (= invest_in_credit_card false))
(assert (= invest_in_trust false))
(assert (= invest_in_insurance false))
(assert (= invest_in_securities false))
(assert (= invest_in_futures false))
(assert (= invest_in_venture_capital false))
(assert (= invest_in_foreign_financial_institution_approved false))
(assert (= invest_in_other_financial_related_approved false))
(assert (= invest_in_commercial_bank false))
(assert (= invest_in_specialized_bank false))
(assert (= invest_in_trust_investment_company false))
(assert (= invest_in_property_insurance false))
(assert (= invest_in_life_insurance false))
(assert (= invest_in_reinsurance_company false))
(assert (= invest_in_insurance_agent false))
(assert (= invest_in_insurance_broker false))
(assert (= invest_in_securities_firm false))
(assert (= invest_in_securities_investment_trust false))
(assert (= invest_in_securities_investment_advisor false))
(assert (= invest_in_futures_broker false))
(assert (= invest_in_leveraged_trader false))
(assert (= invest_in_futures_trust false))
(assert (= invest_in_futures_manager false))
(assert (= invest_in_futures_advisor false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 85
; Total facts: 76
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
