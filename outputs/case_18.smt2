; SMT2 file generated from compliance case automatic
; Case ID: case_18
; Generated at: 2025-10-20T23:07:20.802179
;
; This file can be executed with Z3:
;   z3 case_18.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_extension_times Int)
(declare-const adjustment_extension_years_per_time Real)
(declare-const adjustment_ordered Bool)
(declare-const adjustment_period_valid Bool)
(declare-const adjustment_period_years Int)
(declare-const authority_opposition Bool)
(declare-const authority_order_adjustment Bool)
(declare-const bank_is_commercial Bool)
(declare-const bank_is_professional Bool)
(declare-const bank_is_trust_investment Bool)
(declare-const bank_type_valid Bool)
(declare-const business_days_since_application Int)
(declare-const capital_reduction_approved Bool)
(declare-const fhc_officer_is_manager_of_venture_invested Bool)
(declare-const fhc_officer_manager_venture_penalty Bool)
(declare-const fhc_officer_not_manager_of_venture_invested Bool)
(declare-const futures_is_advisor Bool)
(declare-const futures_is_broker Bool)
(declare-const futures_is_leveraged_trader Bool)
(declare-const futures_is_manager Bool)
(declare-const futures_is_trust Bool)
(declare-const futures_type_valid Bool)
(declare-const impair_sound_operation Bool)
(declare-const insurance_is_agent Bool)
(declare-const insurance_is_broker Bool)
(declare-const insurance_is_life Bool)
(declare-const insurance_is_property Bool)
(declare-const insurance_is_reinsurance Bool)
(declare-const insurance_type_valid Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_not_established_or_executed_penalty Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
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
(declare-const investment_approval_scope Bool)
(declare-const investment_approval_timing_ok Bool)
(declare-const investment_approved Bool)
(declare-const investment_in_10_or_11 Bool)
(declare-const investment_in_1_to_9 Bool)
(declare-const investment_made Bool)
(declare-const investment_without_approval_penalty Bool)
(declare-const investment_without_approval_prohibited Bool)
(declare-const penalty Bool)
(declare-const penalty_imposed Bool)
(declare-const penalty_imposed_for_violation Bool)
(declare-const securities_is_advisor Bool)
(declare-const securities_is_broker Bool)
(declare-const securities_is_trust Bool)
(declare-const securities_type_valid Bool)
(declare-const subsidiary_business_exceed_limit Bool)
(declare-const subsidiary_business_investment Bool)
(declare-const subsidiary_business_management Bool)
(declare-const subsidiary_business_or_investment_exceed_limit Bool)
(declare-const subsidiary_business_scope_ok Bool)
(declare-const subsidiary_capital_reduced Bool)
(declare-const subsidiary_capital_reduction_approval Bool)
(declare-const subsidiary_capital_reduction_without_approval_penalty Bool)
(declare-const subsidiary_investment_exceed_limit Bool)
(declare-const violate_articles Bool)
(declare-const violate_law Bool)
(declare-const violation_penalty_conditions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:subsidiary_business_scope_ok] 子公司業務限於投資及對被投資事業之管理
(assert (= subsidiary_business_scope_ok
   (and subsidiary_business_investment subsidiary_business_management)))

; [fhc:investment_approval_scope] 投資事業類別符合主管機關核准範圍
(assert (= investment_approval_scope
   (or invest_in_other_financial_related_approved
       invest_in_bill_finance
       invest_in_bank
       invest_in_trust
       invest_in_credit_card
       invest_in_futures
       invest_in_securities
       invest_in_fhc
       invest_in_foreign_financial_institution_approved
       invest_in_venture_capital
       invest_in_insurance)))

; [fhc:bank_includes_types] 銀行業包括商業銀行、專業銀行及信託投資公司
(assert (= bank_type_valid
   (or bank_is_commercial bank_is_professional bank_is_trust_investment)))

; [fhc:insurance_includes_types] 保險業包括財產保險業、人身保險業、再保險公司、保險代理人及經紀人
(assert (= insurance_type_valid
   (or insurance_is_property
       insurance_is_broker
       insurance_is_life
       insurance_is_agent
       insurance_is_reinsurance)))

; [fhc:securities_includes_types] 證券業包括證券商、證券投資信託事業、證券投資顧問事業
(assert (= securities_type_valid
   (or securities_is_trust securities_is_broker securities_is_advisor)))

; [fhc:futures_includes_types] 期貨業包括期貨商、槓桿交易商、期貨信託事業、期貨經理事業及期貨顧問事業
(assert (= futures_type_valid
   (or futures_is_advisor
       futures_is_manager
       futures_is_broker
       futures_is_trust
       futures_is_leveraged_trader)))

; [fhc:investment_approval_timing_ok] 主管機關於申請後15或30營業日內未反對視為核准
(assert (= investment_approval_timing_ok
   (or (and investment_in_1_to_9
            (>= 15 business_days_since_application)
            (not authority_opposition))
       (and investment_in_10_or_11
            (>= 30 business_days_since_application)
            (not authority_opposition)))))

; [fhc:investment_without_approval_prohibited] 未經核准不得進行申請之投資行為
(assert (= investment_without_approval_prohibited
   (or (not investment_made) investment_approved)))

; [fhc:subsidiary_business_or_investment_exceed_limit] 子公司業務或投資逾越法令規定範圍
(assert (= subsidiary_business_or_investment_exceed_limit
   (or subsidiary_business_exceed_limit subsidiary_investment_exceed_limit)))

; [fhc:adjustment_ordered] 主管機關限期命金融控股公司調整逾越範圍之子公司業務或投資
(assert (= adjustment_ordered
   (or (not subsidiary_business_or_investment_exceed_limit)
       authority_order_adjustment)))

; [fhc:adjustment_period_limit] 調整期限最長三年，得申請延長二次，每次二年
(assert (let ((a!1 (and (>= 3 adjustment_period_years)
                (or (<= adjustment_extension_times 0)
                    (and (>= 2 adjustment_extension_times)
                         (>= 2.0 adjustment_extension_years_per_time))))))
  (= adjustment_period_valid a!1)))

; [fhc:fhc_officer_not_manager_of_venture_invested] 金融控股公司負責人或職員不得擔任創業投資事業所投資事業經理人
(assert (not (= fhc_officer_is_manager_of_venture_invested
        fhc_officer_not_manager_of_venture_invested)))

; [fhc:subsidiary_capital_reduction_approval] 子公司減資應事先申請核准
(assert (= subsidiary_capital_reduction_approval
   (or capital_reduction_approved (not subsidiary_capital_reduced))))

; [fhc:internal_control_established] 金融控股公司建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [fhc:internal_control_executed] 金融控股公司確實執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [fhc:violation_penalty_conditions] 違反法令、章程或有礙健全經營之虞時主管機關可處分
(assert (= violation_penalty_conditions
   (or impair_sound_operation violate_articles violate_law)))

; [fhc:penalty_imposed_for_violation] 主管機關得依情節輕重處分金融控股公司
(assert (= penalty_imposed_for_violation
   (or (not violation_penalty_conditions) penalty_imposed)))

; [fhc:fhc_officer_not_manager_of_venture_invested_penalty] 金融控股公司負責人或職員擔任創業投資事業所投資事業經理人者處罰
(assert (not (= fhc_officer_not_manager_of_venture_invested
        fhc_officer_manager_venture_penalty)))

; [fhc:investment_without_approval_penalty] 未經核准進行投資行為者處罰
(assert (not (= investment_approved investment_without_approval_penalty)))

; [fhc:subsidiary_capital_reduction_without_approval_penalty] 子公司減資未事先申請核准者處罰
(assert (= subsidiary_capital_reduction_without_approval_penalty
   (and subsidiary_capital_reduced (not capital_reduction_approved))))

; [fhc:internal_control_not_established_or_executed_penalty] 未建立或未確實執行內部控制及稽核制度者處罰
(assert (= internal_control_not_established_or_executed_penalty
   (or (not internal_control_established) (not internal_control_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反投資核准、子公司減資核准、內部控制制度或負責人擔任經理人等規定時處罰
(assert (= penalty
   (or (not internal_control_executed)
       (not investment_approval_scope)
       (not investment_without_approval_prohibited)
       (not investment_approval_timing_ok)
       (and subsidiary_capital_reduced (not capital_reduction_approved))
       (not internal_control_established)
       (not fhc_officer_not_manager_of_venture_invested))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= violate_law true))
(assert (= impair_sound_operation true))
(assert (= violation_penalty_conditions true))
(assert (= penalty_imposed true))
(assert (= penalty true))
(assert (= fhc_officer_is_manager_of_venture_invested false))
(assert (= fhc_officer_not_manager_of_venture_invested true))
(assert (= investment_approval_scope true))
(assert (= investment_approval_timing_ok true))
(assert (= investment_without_approval_prohibited true))
(assert (= investment_approved true))
(assert (= investment_made false))
(assert (= subsidiary_business_investment true))
(assert (= subsidiary_business_management true))
(assert (= subsidiary_business_scope_ok true))
(assert (= subsidiary_business_exceed_limit false))
(assert (= subsidiary_investment_exceed_limit false))
(assert (= subsidiary_business_or_investment_exceed_limit false))
(assert (= adjustment_ordered false))
(assert (= authority_order_adjustment false))
(assert (= authority_opposition false))
(assert (= capital_reduction_approved true))
(assert (= subsidiary_capital_reduced false))
(assert (= subsidiary_capital_reduction_approval true))
(assert (= bank_is_commercial false))
(assert (= bank_is_professional false))
(assert (= bank_is_trust_investment false))
(assert (= bank_type_valid false))
(assert (= insurance_is_agent false))
(assert (= insurance_is_broker false))
(assert (= insurance_is_life false))
(assert (= insurance_is_property false))
(assert (= insurance_is_reinsurance false))
(assert (= insurance_type_valid false))
(assert (= securities_is_advisor false))
(assert (= securities_is_broker false))
(assert (= securities_is_trust false))
(assert (= securities_type_valid false))
(assert (= futures_is_advisor false))
(assert (= futures_is_broker false))
(assert (= futures_is_leveraged_trader false))
(assert (= futures_is_manager false))
(assert (= futures_is_trust false))
(assert (= futures_type_valid false))
(assert (= invest_in_bank false))
(assert (= invest_in_bill_finance false))
(assert (= invest_in_credit_card false))
(assert (= invest_in_fhc false))
(assert (= invest_in_foreign_financial_institution_approved false))
(assert (= invest_in_futures false))
(assert (= invest_in_insurance false))
(assert (= invest_in_other_financial_related_approved false))
(assert (= invest_in_securities false))
(assert (= invest_in_trust false))
(assert (= invest_in_venture_capital false))
(assert (= investment_in_1_to_9 false))
(assert (= investment_in_10_or_11 false))
(assert (= business_days_since_application 0))
(assert (= adjustment_extension_times 0))
(assert (= adjustment_extension_years_per_time 0.0))
(assert (= adjustment_period_years 0))
(assert (= adjustment_period_valid true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 23
; Total variables: 72
; Total facts: 66
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
