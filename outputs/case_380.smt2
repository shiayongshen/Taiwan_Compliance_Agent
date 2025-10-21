; SMT2 file generated from compliance case automatic
; Case ID: case_380
; Generated at: 2025-10-21T08:30:14.689063
;
; This file can be executed with Z3:
;   z3 case_380.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_company_and_bank_employment_ok Bool)
(declare-const agent_company_and_bank_registered Bool)
(declare-const agent_contract_content_compliant Bool)
(declare-const agent_employed_by_bank Bool)
(declare-const agent_employed_by_broker_company Bool)
(declare-const agent_employed_by_notary_company Bool)
(declare-const agent_employed_by_other_agent_company Bool)
(declare-const agent_employed_count Int)
(declare-const agent_employment_adjusted_properly Bool)
(declare-const agent_employment_exclusivity_ok Bool)
(declare-const agent_license_and_insurance Bool)
(declare-const agent_management_rules_defined Bool)
(declare-const agent_permit_registered Bool)
(declare-const agent_prohibited_condition Bool)
(declare-const agent_qualification_and_employment_ok Bool)
(declare-const agent_qualification_met Bool)
(declare-const agent_type Int)
(declare-const bank_license_permitted Bool)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permitted_to_operate Bool)
(declare-const broker_charge_fee Real)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_operate_in_designated_scope Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_report_and_fee_disclosed Bool)
(declare-const company_registration_completed Bool)
(declare-const contract_agent_authority_scope_included Bool)
(declare-const contract_agent_period_included Bool)
(declare-const contract_breach_liability_included Bool)
(declare-const contract_commission_method_included Bool)
(declare-const contract_commission_standard_included Bool)
(declare-const contract_conflict_of_interest_prevention_included Bool)
(declare-const contract_dispute_resolution_included Bool)
(declare-const contract_financial_account_included Bool)
(declare-const contract_law_compliance_included Bool)
(declare-const contract_other_authority_requirements_included Bool)
(declare-const contract_party_names_included Bool)
(declare-const contract_prohibited_behavior_included Bool)
(declare-const contract_termination_included Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_deposit_minimum Real)
(declare-const guarantee_deposit_minimum_defined Bool)
(declare-const guarantee_deposit_minimum_set_by_authority Bool)
(declare-const insurance_type Int)
(declare-const license_permitted Bool)
(declare-const management_rules_set_by_authority Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const relevant_insurance_subscribed Bool)
(declare-const relevant_insurance_type_ok Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_insurance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_license_and_insurance
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_deposit_minimum)
        relevant_insurance_subscribed
        practice_certificate_held)))

; [insurance:relevant_insurance_type] 相關保險類型依代理人、公證人、經紀人身份區分
(assert (let ((a!1 (or (and (= 2 agent_type)
                    (or (= 1 insurance_type) (= 2 insurance_type)))
               (and (= 3 agent_type) (= 1 insurance_type))
               (and (= 1 agent_type) (= 1 insurance_type)))))
  (= relevant_insurance_type_ok a!1)))

; [insurance:guarantee_deposit_minimum_defined] 保證金最低金額及實施方式由主管機關依經營業務範圍及規模定之
(assert (= guarantee_deposit_minimum_defined guarantee_deposit_minimum_set_by_authority))

; [insurance:agent_management_rules_defined] 代理人資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= agent_management_rules_defined management_rules_set_by_authority))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行經主管機關許可得擇一兼營保險代理人或經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_operate
   (and bank_license_permitted (or bank_operate_agent bank_operate_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂契約前應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (let ((a!1 (and broker_provide_written_report
                (or (not (= broker_charge_fee 1.0))
                    broker_disclose_fee_standard))))
  (= broker_report_and_fee_disclosed
     (or (not broker_operate_in_designated_scope) a!1))))

; [insurance:agent_qualification_and_employment_conditions] 代理人具資格且無禁止情事，得以個人名義或受代理人公司或銀行任用取得執業證照後執行業務
(assert (= agent_qualification_and_employment_ok
   (and agent_qualification_met
        (not agent_prohibited_condition)
        practice_certificate_held)))

; [insurance:agent_company_and_bank_must_employ_minimum_agents] 代理人公司及銀行應任用代理人至少一人，並視業務規模及品質適當調整，主管機關得要求增加
(assert (= agent_company_and_bank_employment_ok
   (and (<= 1 agent_employed_count) agent_employment_adjusted_properly)))

; [insurance:agent_company_and_bank_must_register] 依規定辦理許可登記後，應依法向公司登記主管機關辦理登記
(assert (= agent_company_and_bank_registered
   (or company_registration_completed (not agent_permit_registered))))

; [insurance:agent_not_employed_simultaneously_by_others] 個人執業代理人及受代理人公司或銀行任用之代理人，不得同時受任於其他代理人公司、保險經紀人公司、公證人公司或銀行
(assert (not (= (or agent_employed_by_other_agent_company
            agent_employed_by_notary_company
            agent_employed_by_bank
            agent_employed_by_broker_company)
        agent_employment_exclusivity_ok)))

; [insurance:agent_contract_content_compliance] 保險代理合約內容應包括雙方名稱、代理期限、代理權限、佣酬標準及方式、法令遵循、禁止行為、防範利益衝突、違約責任、爭議處理、合約終止、往來金融機構帳戶及主管機關規定事項
(assert (= agent_contract_content_compliant
   (and contract_party_names_included
        contract_agent_period_included
        contract_agent_authority_scope_included
        contract_commission_standard_included
        contract_commission_method_included
        contract_law_compliance_included
        contract_prohibited_behavior_included
        contract_conflict_of_interest_prevention_included
        contract_breach_liability_included
        contract_dispute_resolution_included
        contract_termination_included
        contract_financial_account_included
        contract_other_authority_requirements_included)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照、保險經紀人未履行義務、代理人資格不符、代理人公司或銀行未任用足夠代理人、代理人同時受任於多處、代理合約內容不符規定時處罰
(assert (= penalty
   (or (not relevant_insurance_subscribed)
       (not practice_certificate_held)
       (not agent_qualification_and_employment_ok)
       (not broker_duty_of_care_and_fidelity)
       (not agent_contract_content_compliant)
       (not agent_employment_exclusivity_ok)
       (not agent_company_and_bank_employment_ok)
       (not relevant_insurance_type_ok)
       (not broker_report_and_fee_disclosed)
       (not (>= guarantee_deposit_amount guarantee_deposit_minimum))
       (not license_permitted))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= guarantee_deposit_amount 0.0))
(assert (= guarantee_deposit_minimum 100000.0))
(assert (= relevant_insurance_subscribed false))
(assert (= practice_certificate_held false))
(assert (= relevant_insurance_type_ok true))
(assert (= agent_qualification_met true))
(assert (= agent_prohibited_condition true))
(assert (= agent_qualification_and_employment_ok false))
(assert (= agent_employed_by_other_agent_company true))
(assert (= agent_employed_by_broker_company false))
(assert (= agent_employed_by_notary_company false))
(assert (= agent_employed_by_bank false))
(assert (= agent_employment_exclusivity_ok false))
(assert (= agent_employed_count 1))
(assert (= agent_employment_adjusted_properly true))
(assert (= agent_company_and_bank_employment_ok true))
(assert (= agent_contract_content_compliant true))
(assert (= agent_company_and_bank_registered true))
(assert (= agent_permit_registered true))
(assert (= agent_management_rules_defined true))
(assert (= management_rules_set_by_authority true))
(assert (= guarantee_deposit_minimum_defined true))
(assert (= guarantee_deposit_minimum_set_by_authority true))
(assert (= agent_type 1))
(assert (= insurance_type 1))
(assert (= bank_license_permitted false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= bank_permitted_to_operate false))
(assert (= broker_exercise_duty_of_care true))
(assert (= broker_fulfill_fidelity true))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= broker_operate_in_designated_scope false))
(assert (= broker_provide_written_report true))
(assert (= broker_charge_fee 0.0))
(assert (= broker_disclose_fee_standard true))
(assert (= broker_report_and_fee_disclosed true))
(assert (= contract_party_names_included true))
(assert (= contract_agent_period_included true))
(assert (= contract_agent_authority_scope_included true))
(assert (= contract_commission_standard_included true))
(assert (= contract_commission_method_included true))
(assert (= contract_law_compliance_included true))
(assert (= contract_prohibited_behavior_included true))
(assert (= contract_conflict_of_interest_prevention_included true))
(assert (= contract_breach_liability_included true))
(assert (= contract_dispute_resolution_included true))
(assert (= contract_termination_included true))
(assert (= contract_financial_account_included true))
(assert (= contract_other_authority_requirements_included true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 54
; Total facts: 52
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
