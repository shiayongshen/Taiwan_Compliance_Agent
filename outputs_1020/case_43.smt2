; SMT2 file generated from compliance case automatic
; Case ID: case_43
; Generated at: 2025-10-19T06:25:43.463027
;
; This file can be executed with Z3:
;   z3 case_43.smt2
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
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const authority_opposed_within_15_days Bool)
(declare-const authority_opposed_within_30_days Bool)
(declare-const authority_order_adjustment Bool)
(declare-const authority_order_dispose_excess_shares Bool)
(declare-const bank_is_commercial Bool)
(declare-const bank_is_professional Bool)
(declare-const bank_is_trust_investment Bool)
(declare-const bank_type_valid Bool)
(declare-const business_regulations_defined Bool)
(declare-const excess_shares_no_voting_right Bool)
(declare-const fhc_officer_is_manager_of_venture_invested Bool)
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
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_executed Bool)
(declare-const internal_control_covers_all_operations Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_policies_and_procedures_defined Bool)
(declare-const internal_control_policies_and_procedures_reviewed Bool)
(declare-const internal_control_required_policies_defined Bool)
(declare-const internal_control_subsidiary_management_defined Bool)
(declare-const internal_control_system_comprehensive Bool)
(declare-const investment_approved Bool)
(declare-const investment_in_bank Bool)
(declare-const investment_in_bill_finance Bool)
(declare-const investment_in_credit_card Bool)
(declare-const investment_in_fhc Bool)
(declare-const investment_in_foreign_financial_institution_approved Bool)
(declare-const investment_in_futures Bool)
(declare-const investment_in_insurance Bool)
(declare-const investment_in_other_financial_related_approved Bool)
(declare-const investment_in_securities Bool)
(declare-const investment_in_trust Bool)
(declare-const investment_in_venture_capital Bool)
(declare-const investment_performed Bool)
(declare-const investment_target_approved Bool)
(declare-const investment_target_in_10_or_11 Bool)
(declare-const investment_target_in_1_to_9 Bool)
(declare-const investment_without_approval_prohibited Bool)
(declare-const joint_marketing_management_defined Bool)
(declare-const operation_manual_defined Bool)
(declare-const organization_rules_defined Bool)
(declare-const penalty Bool)
(declare-const penalty_imposed Bool)
(declare-const penalty_imposed_for_violation Bool)
(declare-const securities_is_advisor Bool)
(declare-const securities_is_broker Bool)
(declare-const securities_is_trust Bool)
(declare-const securities_type_valid Bool)
(declare-const shareholder_reporting_compliance Bool)
(declare-const shareholding_approval_granted Bool)
(declare-const shareholding_excess_must_dispose Bool)
(declare-const shareholding_excess_no_voting_right Bool)
(declare-const shareholding_percent Real)
(declare-const shareholding_reported Bool)
(declare-const subsidiary_business_exceed_limit Bool)
(declare-const subsidiary_business_investment Bool)
(declare-const subsidiary_business_management Bool)
(declare-const subsidiary_business_or_investment_exceed_limit Bool)
(declare-const subsidiary_business_scope_ok Bool)
(declare-const subsidiary_capital_reduction_applied Bool)
(declare-const subsidiary_capital_reduction_approval_granted Bool)
(declare-const subsidiary_capital_reduction_approved Bool)
(declare-const subsidiary_investment_exceed_limit Bool)
(declare-const subsidiary_management_defined Bool)
(declare-const violate_articles Bool)
(declare-const violate_law Bool)
(declare-const violation_penalty_applicable Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:subsidiary_business_scope_ok] 子公司業務限於投資及對被投資事業之管理
(assert (= subsidiary_business_scope_ok
   (and subsidiary_business_investment subsidiary_business_management)))

; [fhc:investment_target_approved] 投資事業為主管機關核准之範圍
(assert (= investment_target_approved
   (or investment_in_foreign_financial_institution_approved
       investment_in_insurance
       investment_in_futures
       investment_in_trust
       investment_in_bill_finance
       investment_in_venture_capital
       investment_in_securities
       investment_in_credit_card
       investment_in_fhc
       investment_in_other_financial_related_approved
       investment_in_bank)))

; [fhc:bank_includes_types] 銀行業包括商業銀行、專業銀行及信託投資公司
(assert (= bank_type_valid
   (or bank_is_commercial bank_is_professional bank_is_trust_investment)))

; [fhc:insurance_includes_types] 保險業包括財產保險業、人身保險業、再保險公司、保險代理人及經紀人
(assert (= insurance_type_valid
   (or insurance_is_reinsurance
       insurance_is_property
       insurance_is_agent
       insurance_is_broker
       insurance_is_life)))

; [fhc:securities_includes_types] 證券業包括證券商、證券投資信託事業、證券投資顧問事業
(assert (= securities_type_valid
   (or securities_is_trust securities_is_advisor securities_is_broker)))

; [fhc:futures_includes_types] 期貨業包括期貨商、槓桿交易商、期貨信託事業、期貨經理事業及期貨顧問事業
(assert (= futures_type_valid
   (or futures_is_leveraged_trader
       futures_is_trust
       futures_is_advisor
       futures_is_manager
       futures_is_broker)))

; [fhc:investment_approval_status] 投資事業申請核准後，主管機關未於期限內反對視為核准
(assert (= investment_approved
   (or (and investment_target_in_10_or_11
            (not authority_opposed_within_30_days))
       (and investment_target_in_1_to_9 (not authority_opposed_within_15_days)))))

; [fhc:investment_without_approval_prohibited] 未經核准不得進行申請之投資行為
(assert (= investment_without_approval_prohibited
   (or investment_approved (not investment_performed))))

; [fhc:subsidiary_business_or_investment_exceed_limit] 子公司業務或投資逾越法令規定範圍
(assert (= subsidiary_business_or_investment_exceed_limit
   (or subsidiary_business_exceed_limit subsidiary_investment_exceed_limit)))

; [fhc:adjustment_ordered] 主管機關限期命金融控股公司調整逾越範圍之子公司業務或投資
(assert (= adjustment_ordered
   (or authority_order_adjustment
       (not subsidiary_business_or_investment_exceed_limit))))

; [fhc:adjustment_period_limit] 調整期限最長三年，得申請延長二次，每次二年
(assert (let ((a!1 (and (>= 3 adjustment_period_years)
                (or (= 0 adjustment_extension_times)
                    (and (>= 2 adjustment_extension_times)
                         (>= 2.0 adjustment_extension_years_per_time))))))
  (= adjustment_period_valid a!1)))

; [fhc:fhc_officer_not_manager_of_venture_invested] 金融控股公司負責人或職員不得擔任創業投資事業所投資事業經理人
(assert (not (= fhc_officer_is_manager_of_venture_invested
        fhc_officer_not_manager_of_venture_invested)))

; [fhc:subsidiary_capital_reduction_approval] 子公司減資應事先申請核准
(assert (= subsidiary_capital_reduction_approved
   (or subsidiary_capital_reduction_approval_granted
       (not subsidiary_capital_reduction_applied))))

; [fhc:internal_control_and_audit_established] 金融控股公司應建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   (and internal_control_established audit_system_established)))

; [fhc:internal_control_and_audit_executed] 金融控股公司應確實執行內部控制及稽核制度
(assert (= internal_control_and_audit_executed
   (and internal_control_executed audit_system_executed)))

; [fhc:violation_penalty_conditions] 違反法令、章程或有礙健全經營之虞時主管機關得為處分
(assert (= violation_penalty_applicable
   (or violate_articles impair_sound_operation violate_law)))

; [fhc:penalty_imposed_for_violation] 違反規定時主管機關得處分
(assert (= penalty_imposed_for_violation
   (or penalty_imposed (not violation_penalty_applicable))))

; [fhc:shareholder_reporting_compliance] 同一人或同一關係人持股超過規定比例應申報及申請核准
(assert (let ((a!1 (not (or (not (<= shareholding_percent 10.0))
                    (not (<= shareholding_percent 25.0))
                    (not (<= shareholding_percent 50.0))))))
  (= shareholder_reporting_compliance
     (and (or shareholding_reported (<= shareholding_percent 5.0))
          (or shareholding_approval_granted a!1)))))

; [fhc:shareholding_excess_no_voting_right] 未申報或未核准持股超過部分無表決權
(assert (let ((a!1 (or excess_shares_no_voting_right
               (not (or (not shareholding_approval_granted)
                        (not shareholding_reported))))))
  (= shareholding_excess_no_voting_right a!1)))

; [fhc:shareholding_excess_must_dispose] 主管機關命限期處分超過部分股份
(assert (= shareholding_excess_must_dispose
   (or authority_order_dispose_excess_shares
       (not excess_shares_no_voting_right))))

; [fhc:internal_control_system_comprehensive] 內部控制制度涵蓋所有營運活動並訂定適當政策及程序
(assert (= internal_control_system_comprehensive
   (and internal_control_covers_all_operations
        internal_control_policies_and_procedures_defined
        internal_control_policies_and_procedures_reviewed)))

; [fhc:internal_control_required_policies] 內部控制制度應包含組織規程、業務規範及處理手冊等多項政策
(assert (= internal_control_required_policies_defined
   (and organization_rules_defined
        business_regulations_defined
        operation_manual_defined)))

; [fhc:internal_control_subsidiary_management] 內部控制制度應包含子公司管理及共同行銷管理
(assert (= internal_control_subsidiary_management_defined
   (and subsidiary_management_defined joint_marketing_management_defined)))

; [fhc:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法第36條、第51條、第54條、第60條及相關規定時處罰
(assert (= penalty
   (or (not investment_target_approved)
       (not subsidiary_capital_reduction_approved)
       (not internal_control_and_audit_executed)
       (not investment_approved)
       (not internal_control_required_policies_defined)
       violation_penalty_applicable
       (not internal_control_subsidiary_management_defined)
       (not internal_control_system_comprehensive)
       (not shareholder_reporting_compliance)
       (not subsidiary_business_scope_ok)
       (not internal_control_and_audit_established)
       (not fhc_officer_not_manager_of_venture_invested))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= subsidiary_business_investment true))
(assert (= subsidiary_business_management true))
(assert (= subsidiary_business_scope_ok false))
(assert (= investment_in_fhc false))
(assert (= investment_in_bank false))
(assert (= investment_in_bill_finance false))
(assert (= investment_in_credit_card false))
(assert (= investment_in_trust false))
(assert (= investment_in_insurance false))
(assert (= investment_in_securities false))
(assert (= investment_in_futures false))
(assert (= investment_in_venture_capital false))
(assert (= investment_in_foreign_financial_institution_approved false))
(assert (= investment_in_other_financial_related_approved false))
(assert (= investment_target_approved true))
(assert (= investment_approved true))
(assert (= investment_performed true))
(assert (= internal_control_established false))
(assert (= audit_system_established false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_executed false))
(assert (= internal_control_and_audit_executed false))
(assert (= internal_control_covers_all_operations false))
(assert (= internal_control_policies_and_procedures_defined false))
(assert (= internal_control_policies_and_procedures_reviewed false))
(assert (= internal_control_required_policies_defined false))
(assert (= subsidiary_management_defined false))
(assert (= joint_marketing_management_defined false))
(assert (= internal_control_subsidiary_management_defined false))
(assert (= violate_law true))
(assert (= violate_articles false))
(assert (= impair_sound_operation true))
(assert (= violation_penalty_applicable true))
(assert (= penalty_imposed true))
(assert (= penalty_imposed_for_violation true))
(assert (= penalty true))
(assert (= fhc_officer_is_manager_of_venture_invested false))
(assert (= fhc_officer_not_manager_of_venture_invested true))
(assert (= subsidiary_capital_reduction_applied false))
(assert (= subsidiary_capital_reduction_approval_granted false))
(assert (= subsidiary_capital_reduction_approved true))
(assert (= subsidiary_business_exceed_limit false))
(assert (= subsidiary_investment_exceed_limit false))
(assert (= subsidiary_business_or_investment_exceed_limit false))
(assert (= adjustment_ordered false))
(assert (= adjustment_period_valid true))
(assert (= adjustment_period_years 0))
(assert (= adjustment_extension_times 0))
(assert (= adjustment_extension_years_per_time 0.0))
(assert (= shareholding_percent 0.0))
(assert (= shareholding_reported true))
(assert (= shareholding_approval_granted true))
(assert (= shareholder_reporting_compliance true))
(assert (= excess_shares_no_voting_right false))
(assert (= authority_order_dispose_excess_shares false))
(assert (= authority_opposed_within_15_days false))
(assert (= authority_opposed_within_30_days false))
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
(assert (= business_regulations_defined false))
(assert (= operation_manual_defined false))
(assert (= organization_rules_defined false))
(assert (= authority_order_adjustment false))
(assert (= internal_control_system_comprehensive false))
(assert (= investment_target_in_10_or_11 false))
(assert (= investment_target_in_1_to_9 false))
(assert (= investment_without_approval_prohibited false))
(assert (= shareholding_excess_must_dispose false))
(assert (= shareholding_excess_no_voting_right false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 25
; Total variables: 88
; Total facts: 88
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
