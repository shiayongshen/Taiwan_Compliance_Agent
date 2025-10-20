; SMT2 file generated from compliance case automatic
; Case ID: case_18
; Generated at: 2025-10-19T05:28:50.075464
;
; This file can be executed with Z3:
;   z3 case_18.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_order_issued Bool)
(declare-const adjustment_ordered Bool)
(declare-const adjustment_period_limit Int)
(declare-const adjustment_period_years Int)
(declare-const application_submitted Bool)
(declare-const approval_granted Bool)
(declare-const bank_subsidiary Bool)
(declare-const banking_includes_subtypes Bool)
(declare-const banking_institution Bool)
(declare-const business_days_since_application Int)
(declare-const business_regulations_defined Bool)
(declare-const business_transfer Bool)
(declare-const business_type_code Int)
(declare-const capital_percentage Real)
(declare-const capital_reduction_approval_obtained Bool)
(declare-const control_holding Bool)
(declare-const conversion Bool)
(declare-const directly_or_indirectly_appointed_board_members Bool)
(declare-const disapproval_expressed Bool)
(declare-const established_under_fhc_law Bool)
(declare-const extension_period_years Int)
(declare-const extension_times Int)
(declare-const fhc_officer_manager_restriction Bool)
(declare-const fhc_officer_or_staff_is_venture_investment_manager Bool)
(declare-const fhc_shareholding_percentage Real)
(declare-const financial_holding_company Bool)
(declare-const financial_institution Bool)
(declare-const foreign_fhc Bool)
(declare-const futures_includes_subtypes Bool)
(declare-const group_anti_money_laundering_information_sharing_policy Bool)
(declare-const group_anti_money_laundering_plan_established Bool)
(declare-const impair_sound_operation Bool)
(declare-const insurance_company Bool)
(declare-const insurance_includes_subtypes Bool)
(declare-const insurance_subsidiary Bool)
(declare-const internal_audit_unit_participated Bool)
(declare-const internal_control_and_audit_compliance Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_covers_all_operations Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_group_anti_money_laundering Bool)
(declare-const internal_control_policies_and_procedures_defined Bool)
(declare-const internal_control_policies_reviewed_and_updated Bool)
(declare-const internal_control_policy_coverage Bool)
(declare-const internal_control_policy_details Bool)
(declare-const internal_control_policy_revision_participation Bool)
(declare-const internal_control_subsidiary_management Bool)
(declare-const internal_control_system_effective Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const investment_approval_status Bool)
(declare-const investment_in_banking Bool)
(declare-const investment_in_bill_finance Bool)
(declare-const investment_in_commercial_bank Bool)
(declare-const investment_in_credit_card Bool)
(declare-const investment_in_fhc Bool)
(declare-const investment_in_foreign_financial_institution Bool)
(declare-const investment_in_futures Bool)
(declare-const investment_in_futures_advisor Bool)
(declare-const investment_in_futures_broker Bool)
(declare-const investment_in_futures_manager Bool)
(declare-const investment_in_futures_trust Bool)
(declare-const investment_in_insurance Bool)
(declare-const investment_in_insurance_agent Bool)
(declare-const investment_in_insurance_broker Bool)
(declare-const investment_in_leveraged_trader Bool)
(declare-const investment_in_life_insurance Bool)
(declare-const investment_in_other_related_business Bool)
(declare-const investment_in_property_insurance Bool)
(declare-const investment_in_reinsurance_company Bool)
(declare-const investment_in_securities Bool)
(declare-const investment_in_securities_firm Bool)
(declare-const investment_in_securities_investment_advisor Bool)
(declare-const investment_in_securities_investment_trust Bool)
(declare-const investment_in_specialized_bank Bool)
(declare-const investment_in_trust Bool)
(declare-const investment_in_trust_investment_company Bool)
(declare-const investment_in_venture_capital Bool)
(declare-const investment_made Bool)
(declare-const investment_target_approved Bool)
(declare-const investment_without_approval_prohibited Bool)
(declare-const joint_marketing_management_defined Bool)
(declare-const legal_compliance_unit_participated Bool)
(declare-const legal_person_and_executives_and_relatives Bool)
(declare-const legal_person_and_natural_person_holding_over_one_third_or_executive Bool)
(declare-const legal_person_related_enterprises Bool)
(declare-const natural_person_executive_or_majority_board_member Bool)
(declare-const natural_person_holding_over_one_third Bool)
(declare-const natural_person_spouse_and_relatives_within_2nd_degree Bool)
(declare-const operation_manuals_defined Bool)
(declare-const organization_rules_defined Bool)
(declare-const organized_under_foreign_law Bool)
(declare-const penalty Bool)
(declare-const penalty_violation Bool)
(declare-const policy_abolished Bool)
(declare-const policy_established Bool)
(declare-const policy_revised Bool)
(declare-const risk_management_unit_participated Bool)
(declare-const same_legal_person Bool)
(declare-const same_legal_person_related_person Bool)
(declare-const same_natural_person Bool)
(declare-const same_natural_person_related_person Bool)
(declare-const same_person Bool)
(declare-const securities_firm Bool)
(declare-const securities_includes_subtypes Bool)
(declare-const securities_subsidiary Bool)
(declare-const share_conversion Bool)
(declare-const subsidiary Bool)
(declare-const subsidiary_business_exceed_limit Bool)
(declare-const subsidiary_business_investment Bool)
(declare-const subsidiary_business_management Bool)
(declare-const subsidiary_business_or_investment_exceed_limit Bool)
(declare-const subsidiary_business_scope_ok Bool)
(declare-const subsidiary_capital_reduction Bool)
(declare-const subsidiary_capital_reduction_approval Bool)
(declare-const subsidiary_investment_exceed_limit Bool)
(declare-const subsidiary_management_defined Bool)
(declare-const violate_article_16_10 Bool)
(declare-const violate_article_16_1_2_9 Bool)
(declare-const violate_article_16_3 Bool)
(declare-const violate_article_16_5 Bool)
(declare-const violate_article_16_6 Bool)
(declare-const violate_article_18_1 Bool)
(declare-const violate_article_38 Bool)
(declare-const violate_article_39_1 Bool)
(declare-const violate_article_39_2 Bool)
(declare-const violate_article_39_3 Bool)
(declare-const violate_article_40_41 Bool)
(declare-const violate_article_42_1 Bool)
(declare-const violate_article_43_1_2_4 Bool)
(declare-const violate_article_43_3 Bool)
(declare-const violate_article_45_1_4 Bool)
(declare-const violate_article_46_1 Bool)
(declare-const violate_article_51 Bool)
(declare-const violate_article_53_1_2 Bool)
(declare-const violate_article_53_3 Bool)
(declare-const violate_article_55_1 Bool)
(declare-const violate_article_56_1 Bool)
(declare-const violate_article_56_2 Bool)
(declare-const violate_article_6_1 Bool)
(declare-const violate_articles Bool)
(declare-const violate_law Bool)
(declare-const violation_penalty_conditions Bool)
(declare-const voting_shares_percentage Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:subsidiary_business_scope_ok] 子公司業務限於投資及對被投資事業之管理
(assert (= subsidiary_business_scope_ok
   (and subsidiary_business_investment subsidiary_business_management)))

; [fhc:investment_target_approved] 投資標的為主管機關核准之事業類別
(assert (= investment_target_approved
   (or investment_in_futures
       investment_in_foreign_financial_institution
       investment_in_bill_finance
       investment_in_venture_capital
       investment_in_securities
       investment_in_banking
       investment_in_fhc
       investment_in_trust
       investment_in_other_related_business
       investment_in_credit_card
       investment_in_insurance)))

; [fhc:banking_includes_subtypes] 銀行業包括商業銀行、專業銀行及信託投資公司
(assert (= banking_includes_subtypes
   (and investment_in_commercial_bank
        investment_in_specialized_bank
        investment_in_trust_investment_company)))

; [fhc:insurance_includes_subtypes] 保險業包括財產保險業、人身保險業、再保險公司、保險代理人及經紀人
(assert (= insurance_includes_subtypes
   (and investment_in_property_insurance
        investment_in_life_insurance
        investment_in_reinsurance_company
        investment_in_insurance_agent
        investment_in_insurance_broker)))

; [fhc:securities_includes_subtypes] 證券業包括證券商、證券投資信託事業、證券投資顧問事業
(assert (= securities_includes_subtypes
   (and investment_in_securities_firm
        investment_in_securities_investment_trust
        investment_in_securities_investment_advisor)))

; [fhc:futures_includes_subtypes] 期貨業包括期貨商、槓桿交易商、期貨信託事業、期貨經理事業及期貨顧問事業
(assert (= futures_includes_subtypes
   (and investment_in_futures_broker
        investment_in_leveraged_trader
        investment_in_futures_trust
        investment_in_futures_manager
        investment_in_futures_advisor)))

; [fhc:investment_approval_status] 投資行為須經主管機關核准或視為核准
(assert (let ((a!1 (and application_submitted
                (or (and (<= 1 business_type_code)
                         (>= 9 business_type_code)
                         (>= 15 business_days_since_application)
                         (not disapproval_expressed))
                    (and (<= 10 business_type_code)
                         (>= 11 business_type_code)
                         (>= 30 business_days_since_application)
                         (not disapproval_expressed))))))
  (= investment_approval_status (or approval_granted a!1))))

; [fhc:investment_without_approval_prohibited] 未經核准不得進行投資行為
(assert (= investment_without_approval_prohibited
   (or investment_approval_status (not investment_made))))

; [fhc:subsidiary_business_or_investment_exceed_limit] 子公司業務或投資逾越法令規定範圍
(assert (= subsidiary_business_or_investment_exceed_limit
   (or subsidiary_business_exceed_limit subsidiary_investment_exceed_limit)))

; [fhc:adjustment_ordered] 主管機關限期命其調整
(assert (= adjustment_ordered
   (or adjustment_order_issued
       (not subsidiary_business_or_investment_exceed_limit))))

; [fhc:adjustment_period_limit] 調整期限最長三年，得申請延長二次，每次二年
(assert (let ((a!1 (ite (and (>= 3 adjustment_period_years)
                     (or (= 0 extension_times) (>= 2 extension_times))
                     (>= 2 extension_period_years))
                1
                0)))
  (= adjustment_period_limit a!1)))

; [fhc:fhc_officer_manager_restriction] 金融控股公司負責人或職員不得擔任創業投資事業投資事業經理人
(assert (not (= fhc_officer_or_staff_is_venture_investment_manager
        fhc_officer_manager_restriction)))

; [fhc:subsidiary_capital_reduction_approval] 子公司減資應事先申請核准
(assert (= subsidiary_capital_reduction_approval
   (or capital_reduction_approval_obtained (not subsidiary_capital_reduction))))

; [fhc:internal_control_established] 金融控股公司應建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [fhc:internal_control_executed] 金融控股公司應確實執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [fhc:internal_control_compliance] 內部控制制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [fhc:violation_penalty_conditions] 違反法令、章程或有礙健全經營之虞時主管機關得為處分
(assert (= violation_penalty_conditions
   (or violate_articles impair_sound_operation violate_law)))

; [fhc:penalty_violation] 違反金融控股公司法第60條各款規定之一
(assert (= penalty_violation
   (or violate_article_39_3
       violate_article_46_1
       violate_article_40_41
       violate_article_42_1
       violate_article_53_3
       violate_article_45_1_4
       violate_article_56_1
       violate_article_18_1
       violate_article_56_2
       violate_article_43_1_2_4
       violate_article_55_1
       violate_article_6_1
       violate_article_16_6
       violate_article_39_1
       violate_article_16_3
       violate_article_39_2
       violate_article_16_5
       violate_article_53_1_2
       violate_article_51
       violate_article_16_1_2_9
       violate_article_16_10
       violate_article_43_3
       violate_article_38)))

; [fhc:internal_control_and_audit_compliance] 金融控股公司及銀行業建立內部控制制度並持續有效執行
(assert (= internal_control_and_audit_compliance
   (and internal_control_system_established internal_control_system_effective)))

; [fhc:internal_control_policy_coverage] 內部控制制度涵蓋所有營運活動並訂定適當政策及程序
(assert (= internal_control_policy_coverage
   (and internal_control_covers_all_operations
        internal_control_policies_and_procedures_defined
        internal_control_policies_reviewed_and_updated)))

; [fhc:internal_control_policy_details] 內部控制制度應包括組織規程、業務規範及處理手冊等多項內容
(assert (= internal_control_policy_details
   (and organization_rules_defined
        business_regulations_defined
        operation_manuals_defined)))

; [fhc:internal_control_subsidiary_management] 內部控制制度應包括子公司管理及共同行銷管理
(assert (= internal_control_subsidiary_management
   (and subsidiary_management_defined joint_marketing_management_defined)))

; [fhc:internal_control_group_anti_money_laundering] 建立集團整體性防制洗錢及打擊資恐計畫
(assert (= internal_control_group_anti_money_laundering
   (and group_anti_money_laundering_plan_established
        group_anti_money_laundering_information_sharing_policy)))

; [fhc:internal_control_policy_revision_participation] 訂定、修訂或廢止作業及管理規章時，相關單位應參與
(assert (= internal_control_policy_revision_participation
   (or (not (or policy_abolished policy_established policy_revised))
       (and legal_compliance_unit_participated
            internal_audit_unit_participated
            risk_management_unit_participated))))

; [fhc:control_holding_definition] 控制性持股定義
(assert (= control_holding
   (or (not (<= voting_shares_percentage 25.0))
       (not (<= capital_percentage 25.0)))))

; [fhc:financial_holding_company_definition] 金融控股公司定義
(assert (= financial_holding_company (and control_holding established_under_fhc_law)))

; [fhc:financial_institution_definition] 金融機構定義包括銀行、保險公司及證券商
(assert (= financial_institution
   (or banking_institution insurance_company securities_firm)))

; [fhc:subsidiary_definition] 子公司定義
(assert (= subsidiary (or bank_subsidiary securities_subsidiary insurance_subsidiary)))

; [fhc:conversion_definition] 轉換定義為營業讓與及股份轉換
(assert (= conversion (or business_transfer share_conversion)))

; [fhc:foreign_fhc_definition] 外國金融控股公司定義
(assert (= foreign_fhc (and organized_under_foreign_law control_holding)))

; [fhc:same_person_definition] 同一人定義為同一自然人或同一法人
(assert (= same_person (or same_natural_person same_legal_person)))

; [fhc:same_person_related_person_definition] 同一自然人之關係人定義
(assert (= same_natural_person_related_person
   (or natural_person_executive_or_majority_board_member
       natural_person_spouse_and_relatives_within_2nd_degree
       natural_person_holding_over_one_third)))

; [fhc:same_legal_person_related_person_definition] 同一法人之關係人定義
(assert (= same_legal_person_related_person
   (or legal_person_and_executives_and_relatives
       legal_person_and_natural_person_holding_over_one_third_or_executive
       legal_person_related_enterprises)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法第60條各款規定之一
(assert (= penalty penalty_violation))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_article_51 true))
(assert (= violate_law true))
(assert (= impair_sound_operation true))
(assert (= penalty_violation true))
(assert (= penalty true))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= internal_control_and_audit_compliance false))
(assert (= subsidiary_management_defined false))
(assert (= subsidiary_business_management false))
(assert (= subsidiary_business_investment true))
(assert (= subsidiary_business_scope_ok false))
(assert (= adjustment_ordered false))
(assert (= adjustment_order_issued false))
(assert (= control_holding true))
(assert (= established_under_fhc_law true))
(assert (= financial_holding_company true))
(assert (= investment_made false))
(assert (= investment_approval_status false))
(assert (= investment_target_approved false))
(assert (= fhc_officer_or_staff_is_venture_investment_manager false))
(assert (= fhc_officer_manager_restriction true))
(assert (= organization_rules_defined false))
(assert (= business_regulations_defined false))
(assert (= operation_manuals_defined false))
(assert (= joint_marketing_management_defined false))
(assert (= internal_control_covers_all_operations false))
(assert (= internal_control_policies_and_procedures_defined false))
(assert (= internal_control_policies_reviewed_and_updated false))
(assert (= legal_compliance_unit_participated false))
(assert (= internal_audit_unit_participated false))
(assert (= risk_management_unit_participated false))
(assert (= group_anti_money_laundering_plan_established false))
(assert (= group_anti_money_laundering_information_sharing_policy false))
(assert (= subsidiary_business_exceed_limit false))
(assert (= subsidiary_investment_exceed_limit false))
(assert (= subsidiary_business_or_investment_exceed_limit false))
(assert (= subsidiary_capital_reduction false))
(assert (= capital_reduction_approval_obtained false))
(assert (= application_submitted false))
(assert (= approval_granted false))
(assert (= business_days_since_application 0))
(assert (= business_type_code 0))
(assert (= disapproval_expressed false))
(assert (= extension_times 0))
(assert (= adjustment_period_years 0))
(assert (= extension_period_years 0))
(assert (= bank_subsidiary false))
(assert (= insurance_subsidiary false))
(assert (= securities_subsidiary false))
(assert (= subsidiary true))
(assert (= banking_includes_subtypes false))
(assert (= investment_in_commercial_bank false))
(assert (= investment_in_specialized_bank false))
(assert (= investment_in_trust_investment_company false))
(assert (= banking_institution false))
(assert (= insurance_company false))
(assert (= insurance_includes_subtypes false))
(assert (= investment_in_property_insurance false))
(assert (= investment_in_life_insurance false))
(assert (= investment_in_reinsurance_company false))
(assert (= investment_in_insurance_agent false))
(assert (= investment_in_insurance_broker false))
(assert (= securities_firm false))
(assert (= securities_includes_subtypes false))
(assert (= investment_in_securities_firm false))
(assert (= investment_in_securities_investment_trust false))
(assert (= investment_in_securities_investment_advisor false))
(assert (= investment_in_banking false))
(assert (= investment_in_bill_finance false))
(assert (= investment_in_credit_card false))
(assert (= investment_in_trust false))
(assert (= investment_in_insurance false))
(assert (= investment_in_securities false))
(assert (= investment_in_futures false))
(assert (= investment_in_venture_capital false))
(assert (= investment_in_foreign_financial_institution false))
(assert (= investment_in_other_related_business false))
(assert (= investment_in_futures_broker false))
(assert (= investment_in_leveraged_trader false))
(assert (= investment_in_futures_trust false))
(assert (= investment_in_futures_manager false))
(assert (= investment_in_futures_advisor false))
(assert (= conversion false))
(assert (= business_transfer false))
(assert (= share_conversion false))
(assert (= foreign_fhc false))
(assert (= organized_under_foreign_law false))
(assert (= voting_shares_percentage 30.0))
(assert (= capital_percentage 30.0))
(assert (= directly_or_indirectly_appointed_board_members true))
(assert (= same_person false))
(assert (= same_natural_person false))
(assert (= same_legal_person false))
(assert (= same_natural_person_related_person false))
(assert (= same_legal_person_related_person false))
(assert (= natural_person_spouse_and_relatives_within_2nd_degree false))
(assert (= natural_person_holding_over_one_third false))
(assert (= natural_person_executive_or_majority_board_member false))
(assert (= legal_person_and_executives_and_relatives false))
(assert (= legal_person_and_natural_person_holding_over_one_third_or_executive false))
(assert (= legal_person_related_enterprises false))
(assert (= adjustment_period_limit 0))
(assert (= fhc_shareholding_percentage 0.0))
(assert (= financial_institution false))
(assert (= futures_includes_subtypes false))
(assert (= internal_control_group_anti_money_laundering false))
(assert (= internal_control_policy_coverage false))
(assert (= internal_control_policy_details false))
(assert (= internal_control_policy_revision_participation false))
(assert (= internal_control_subsidiary_management false))
(assert (= internal_control_system_effective false))
(assert (= investment_in_fhc false))
(assert (= investment_without_approval_prohibited false))
(assert (= policy_abolished false))
(assert (= policy_established false))
(assert (= policy_revised false))
(assert (= subsidiary_capital_reduction_approval false))
(assert (= violate_article_16_10 false))
(assert (= violate_article_16_1_2_9 false))
(assert (= violate_article_16_3 false))
(assert (= violate_article_16_5 false))
(assert (= violate_article_16_6 false))
(assert (= violate_article_18_1 false))
(assert (= violate_article_38 false))
(assert (= violate_article_39_1 false))
(assert (= violate_article_39_2 false))
(assert (= violate_article_39_3 false))
(assert (= violate_article_40_41 false))
(assert (= violate_article_42_1 false))
(assert (= violate_article_43_1_2_4 false))
(assert (= violate_article_43_3 false))
(assert (= violate_article_45_1_4 false))
(assert (= violate_article_46_1 false))
(assert (= violate_article_53_1_2 false))
(assert (= violate_article_53_3 false))
(assert (= violate_article_55_1 false))
(assert (= violate_article_56_1 false))
(assert (= violate_article_56_2 false))
(assert (= violate_article_6_1 false))
(assert (= violate_articles false))
(assert (= violation_penalty_conditions false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 35
; Total variables: 145
; Total facts: 145
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
