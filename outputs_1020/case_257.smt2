; SMT2 file generated from compliance case automatic
; Case ID: case_257
; Generated at: 2025-10-19T11:34:07.384910
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
(declare-const adjustment_period_years Real)
(declare-const bank_investment_subtype_ok Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const capital_reduction_approved Bool)
(declare-const consumer_and_government_loan_exemption Bool)
(declare-const credit_amount Real)
(declare-const credit_amount_threshold Real)
(declare-const credit_has_full_collateral Bool)
(declare-const credit_is_unsecured Bool)
(declare-const credit_target_has_conflict_of_interest_with_responsible_or_credit_officer Bool)
(declare-const credit_target_is_major_shareholder Bool)
(declare-const credit_target_is_officer Bool)
(declare-const credit_target_is_responsible_person Bool)
(declare-const credit_target_shareholding_percent Real)
(declare-const credit_terms_better_than_similar Bool)
(declare-const fhc_officer_is_manager_of_venture_investment Bool)
(declare-const fhc_officer_manager_conflict Bool)
(declare-const futures_investment_subtype_ok Bool)
(declare-const insurance_investment_subtype_ok Bool)
(declare-const investment_approval_required Bool)
(declare-const investment_approval_status Bool)
(declare-const investment_deemed_approved Bool)
(declare-const investment_formally_approved Bool)
(declare-const investment_in_bank Bool)
(declare-const investment_in_bill_finance Bool)
(declare-const investment_in_commercial_bank Bool)
(declare-const investment_in_credit_card Bool)
(declare-const investment_in_fhc Bool)
(declare-const investment_in_foreign_financial_institution_approved Bool)
(declare-const investment_in_futures Bool)
(declare-const investment_in_futures_advisor Bool)
(declare-const investment_in_futures_firm Bool)
(declare-const investment_in_futures_manager Bool)
(declare-const investment_in_futures_trust Bool)
(declare-const investment_in_insurance Bool)
(declare-const investment_in_insurance_agent Bool)
(declare-const investment_in_insurance_broker Bool)
(declare-const investment_in_leveraged_trader Bool)
(declare-const investment_in_life_insurance Bool)
(declare-const investment_in_other_financial_related_approved Bool)
(declare-const investment_in_professional_bank Bool)
(declare-const investment_in_property_insurance Bool)
(declare-const investment_in_reinsurance_company Bool)
(declare-const investment_in_securities Bool)
(declare-const investment_in_securities_firm Bool)
(declare-const investment_in_securities_investment_advisor Bool)
(declare-const investment_in_securities_investment_trust Bool)
(declare-const investment_in_trust Bool)
(declare-const investment_in_trust_investment_company Bool)
(declare-const investment_in_venture_capital Bool)
(declare-const investment_performed Bool)
(declare-const investment_target_approved Bool)
(declare-const loan_is_consumer_loan Bool)
(declare-const loan_is_government_loan Bool)
(declare-const major_shareholder_definition_ok Bool)
(declare-const major_shareholder_minor_children_shareholding_percent Real)
(declare-const major_shareholder_own_shareholding_percent Real)
(declare-const major_shareholder_spouse_shareholding_percent Real)
(declare-const major_shareholder_total_shareholding_percent Real)
(declare-const penalty Bool)
(declare-const secured_credit_requirements_met Bool)
(declare-const securities_investment_subtype_ok Bool)
(declare-const subsidiary_adjustment_ordered Bool)
(declare-const subsidiary_adjustment_period_ok Bool)
(declare-const subsidiary_business_investment Bool)
(declare-const subsidiary_business_investment_scope_ok Bool)
(declare-const subsidiary_business_management Bool)
(declare-const subsidiary_business_scope_ok Bool)
(declare-const subsidiary_business_within_legal_scope Bool)
(declare-const subsidiary_capital_reduced Bool)
(declare-const subsidiary_capital_reduction_approval Bool)
(declare-const subsidiary_investment_within_legal_scope Bool)
(declare-const unsecured_credit_prohibited Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:subsidiary_business_scope_ok] 子公司業務限於投資及對被投資事業之管理
(assert (= subsidiary_business_scope_ok
   (and subsidiary_business_investment subsidiary_business_management)))

; [fhc:investment_target_approved] 投資事業為主管機關核准之類別
(assert (= investment_target_approved
   (or investment_in_securities
       investment_in_bank
       investment_in_insurance
       investment_in_fhc
       investment_in_venture_capital
       investment_in_other_financial_related_approved
       investment_in_foreign_financial_institution_approved
       investment_in_bill_finance
       investment_in_credit_card
       investment_in_trust
       investment_in_futures)))

; [fhc:bank_investment_subtype_ok] 銀行業投資子類別符合規定
(assert (= bank_investment_subtype_ok
   (or investment_in_commercial_bank
       investment_in_professional_bank
       investment_in_trust_investment_company)))

; [fhc:insurance_investment_subtype_ok] 保險業投資子類別符合規定
(assert (= insurance_investment_subtype_ok
   (or investment_in_life_insurance
       investment_in_property_insurance
       investment_in_insurance_broker
       investment_in_insurance_agent
       investment_in_reinsurance_company)))

; [fhc:securities_investment_subtype_ok] 證券業投資子類別符合規定
(assert (= securities_investment_subtype_ok
   (or investment_in_securities_firm
       investment_in_securities_investment_advisor
       investment_in_securities_investment_trust)))

; [fhc:futures_investment_subtype_ok] 期貨業投資子類別符合規定
(assert (= futures_investment_subtype_ok
   (or investment_in_futures_manager
       investment_in_leveraged_trader
       investment_in_futures_trust
       investment_in_futures_firm
       investment_in_futures_advisor)))

; [fhc:investment_approval_status] 投資行為經主管機關核准或視為核准
(assert (= investment_approval_status
   (or investment_deemed_approved investment_formally_approved)))

; [fhc:investment_approval_required] 未經核准不得進行投資行為
(assert (= investment_approval_required
   (or investment_approval_status (not investment_performed))))

; [fhc:subsidiary_business_investment_scope_ok] 子公司業務及投資未逾越法令規定範圍
(assert (= subsidiary_business_investment_scope_ok
   (and subsidiary_business_within_legal_scope
        subsidiary_investment_within_legal_scope)))

; [fhc:subsidiary_adjustment_ordered] 主管機關限期命子公司調整逾越範圍之業務或投資
(assert subsidiary_adjustment_ordered)

; [fhc:subsidiary_adjustment_period_ok] 子公司調整期限不超過三年，延長不超過兩次，每次二年
(assert (= subsidiary_adjustment_period_ok
   (and (>= 3.0 adjustment_period_years)
        (>= 2 adjustment_extension_times)
        (>= 2.0 adjustment_extension_years_per_time))))

; [fhc:fhc_officer_manager_conflict] 金融控股公司負責人或職員不得擔任創業投資事業投資事業經理人
(assert (not (= fhc_officer_is_manager_of_venture_investment
        fhc_officer_manager_conflict)))

; [fhc:subsidiary_capital_reduction_approval] 子公司減資應事先申請核准
(assert (= subsidiary_capital_reduction_approval
   (or capital_reduction_approved (not subsidiary_capital_reduced))))

; [bank:unsecured_credit_prohibited] 銀行不得對特定對象為無擔保授信
(assert (let ((a!1 (or (not credit_is_unsecured)
               (not (or (<= 3.0 credit_target_shareholding_percent)
                        credit_target_is_responsible_person
                        credit_target_has_conflict_of_interest_with_responsible_or_credit_officer
                        credit_target_is_major_shareholder
                        credit_target_is_officer)))))
  (= unsecured_credit_prohibited a!1)))

; [bank:consumer_and_government_loan_exemption] 消費者貸款及政府貸款不受無擔保授信限制
(assert (= consumer_and_government_loan_exemption
   (or loan_is_consumer_loan loan_is_government_loan)))

; [bank:major_shareholder_definition] 主要股東定義含自然人及其配偶未成年子女持股
(assert (= major_shareholder_definition_ok
   (= major_shareholder_total_shareholding_percent
      (+ major_shareholder_own_shareholding_percent
         major_shareholder_spouse_shareholding_percent
         major_shareholder_minor_children_shareholding_percent))))

; [bank:secured_credit_requirements] 持股5%以上授信應有十足擔保且條件不得優於同類授信
(assert (let ((a!1 (and credit_has_full_collateral
                (not credit_terms_better_than_similar)
                (or (not (>= credit_amount credit_amount_threshold))
                    (and (<= (/ 6667.0 10000.0) board_attendance_ratio)
                         (<= (/ 3.0 4.0) board_approval_ratio))))))
(let ((a!2 (or (not (or credit_target_is_responsible_person
                        credit_target_has_conflict_of_interest_with_responsible_or_credit_officer
                        credit_target_is_major_shareholder
                        credit_target_is_officer
                        (<= 5.0 credit_target_shareholding_percent)))
               a!1)))
  (= secured_credit_requirements_met a!2))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法及銀行法相關規定時處罰
(assert (= penalty
   (or (not insurance_investment_subtype_ok)
       (not investment_approval_required)
       (not futures_investment_subtype_ok)
       (not secured_credit_requirements_met)
       (not subsidiary_business_scope_ok)
       (not unsecured_credit_prohibited)
       (not subsidiary_business_investment_scope_ok)
       (not bank_investment_subtype_ok)
       (not securities_investment_subtype_ok)
       (not major_shareholder_definition_ok)
       (not investment_target_approved)
       (not subsidiary_adjustment_period_ok)
       fhc_officer_is_manager_of_venture_investment
       (not subsidiary_capital_reduction_approval)
       (not investment_approval_status))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= subsidiary_business_investment true))
(assert (= subsidiary_business_management false))
(assert (= subsidiary_business_scope_ok false))
(assert (= investment_in_fhc true))
(assert (= investment_in_bank true))
(assert (= investment_in_bill_finance false))
(assert (= investment_in_credit_card false))
(assert (= investment_in_trust false))
(assert (= investment_in_insurance false))
(assert (= investment_in_securities false))
(assert (= investment_in_futures false))
(assert (= investment_in_venture_capital false))
(assert (= investment_in_foreign_financial_institution_approved false))
(assert (= investment_in_other_financial_related_approved false))
(assert (= investment_target_approved false))
(assert (= bank_investment_subtype_ok false))
(assert (= insurance_investment_subtype_ok false))
(assert (= securities_investment_subtype_ok false))
(assert (= futures_investment_subtype_ok false))
(assert (= investment_approval_status false))
(assert (= investment_formally_approved false))
(assert (= investment_deemed_approved false))
(assert (= investment_approval_required false))
(assert (= investment_performed true))
(assert (= subsidiary_business_investment_scope_ok false))
(assert (= subsidiary_business_within_legal_scope false))
(assert (= subsidiary_investment_within_legal_scope false))
(assert (= subsidiary_adjustment_ordered true))
(assert (= subsidiary_adjustment_period_ok true))
(assert (= adjustment_period_years 3.0))
(assert (= adjustment_extension_times 0))
(assert (= adjustment_extension_years_per_time 0.0))
(assert (= fhc_officer_is_manager_of_venture_investment true))
(assert (= fhc_officer_manager_conflict false))
(assert (= subsidiary_capital_reduced false))
(assert (= subsidiary_capital_reduction_approval true))
(assert (= credit_target_shareholding_percent 0.0))
(assert (= credit_target_is_responsible_person true))
(assert (= credit_target_is_officer true))
(assert (= credit_target_is_major_shareholder true))
(assert (= credit_target_has_conflict_of_interest_with_responsible_or_credit_officer true))
(assert (= credit_is_unsecured true))
(assert (= unsecured_credit_prohibited false))
(assert (= loan_is_consumer_loan false))
(assert (= loan_is_government_loan false))
(assert (= major_shareholder_own_shareholding_percent 0.0))
(assert (= major_shareholder_spouse_shareholding_percent 0.0))
(assert (= major_shareholder_minor_children_shareholding_percent 0.0))
(assert (= major_shareholder_total_shareholding_percent 0.0))
(assert (= major_shareholder_definition_ok false))
(assert (= credit_has_full_collateral false))
(assert (= credit_terms_better_than_similar true))
(assert (= credit_amount 15000000.0))
(assert (= credit_amount_threshold 10000000.0))
(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 1.0 2.0)))
(assert (= secured_credit_requirements_met false))
(assert (= capital_reduction_approved false))
(assert (= consumer_and_government_loan_exemption false))
(assert (= investment_in_commercial_bank false))
(assert (= investment_in_futures_advisor false))
(assert (= investment_in_futures_firm false))
(assert (= investment_in_futures_manager false))
(assert (= investment_in_futures_trust false))
(assert (= investment_in_insurance_agent false))
(assert (= investment_in_insurance_broker false))
(assert (= investment_in_leveraged_trader false))
(assert (= investment_in_life_insurance false))
(assert (= investment_in_professional_bank false))
(assert (= investment_in_property_insurance false))
(assert (= investment_in_reinsurance_company false))
(assert (= investment_in_securities_firm false))
(assert (= investment_in_securities_investment_advisor false))
(assert (= investment_in_securities_investment_trust false))
(assert (= investment_in_trust_investment_company false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 76
; Total facts: 76
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
