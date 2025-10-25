; SMT2 file generated from compliance case automatic
; Case ID: case_454
; Generated at: 2025-10-24T20:28:22.117535
;
; This file can be executed with Z3:
;   z3 case_454.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent Bool)
(declare-const agent_cannot_be_employed_by_multiple_companies Bool)
(declare-const agent_company_and_bank_employ_minimum_agents Bool)
(declare-const agent_company_and_bank_must_register_permit Bool)
(declare-const agent_contract_must_include_required_items Bool)
(declare-const agent_employed_by_multiple_companies Bool)
(declare-const agent_employed_count Int)
(declare-const agent_employment_adjusted_appropriately Bool)
(declare-const agent_prohibited_condition Bool)
(declare-const agent_qualification_and_employment_conditions Bool)
(declare-const agent_qualification_met Bool)
(declare-const apply_agent_broker_rules Bool)
(declare-const approved_by_authority Bool)
(declare-const authority_set_management_rules Bool)
(declare-const authority_set_minimum_and_implementation Bool)
(declare-const bank_permission_and_apply_agent_broker_rules Bool)
(declare-const bank_permitted_to_operate Bool)
(declare-const bond_deposited Bool)
(declare-const broker Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_provide_written_report_and_disclose_fee Bool)
(declare-const company_registration_completed Bool)
(declare-const contract_include_agent_period Bool)
(declare-const contract_include_agent_scope Bool)
(declare-const contract_include_breach_liability Bool)
(declare-const contract_include_commission_method Bool)
(declare-const contract_include_commission_standard Bool)
(declare-const contract_include_conflict_of_interest_prevention Bool)
(declare-const contract_include_contract_termination Bool)
(declare-const contract_include_dispute_resolution Bool)
(declare-const contract_include_financial_institution_account Bool)
(declare-const contract_include_law_compliance Bool)
(declare-const contract_include_other_authority_requirements Bool)
(declare-const contract_include_parties_names Bool)
(declare-const contract_include_prohibited_behaviors Bool)
(declare-const insurance_type_guarantee Bool)
(declare-const insurance_type_responsibility Bool)
(declare-const license_and_bond_insurance_required Bool)
(declare-const license_held Bool)
(declare-const management_rules_set_by_authority Bool)
(declare-const minimum_amount_and_implementation_set_by_authority Bool)
(declare-const notary Bool)
(declare-const penalty Bool)
(declare-const permit_registered_with_authority Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_correct Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_bond_insurance_required] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_bond_insurance_required
   (and approved_by_authority
        bond_deposited
        related_insurance_purchased
        license_held)))

; [insurance:related_insurance_type_correct] 相關保險類型依身份區分：代理人、公證人為責任保險；經紀人為責任保險及保證保險
(assert (= related_insurance_type_correct
   (or (and notary insurance_type_responsibility)
       (and broker insurance_type_responsibility insurance_type_guarantee)
       (and agent insurance_type_responsibility))))

; [insurance:minimum_amount_and_implementation_set_by_authority] 保證金及相關保險最低金額及實施方式由主管機關依經營業務範圍及規模定之
(assert (= minimum_amount_and_implementation_set_by_authority
   authority_set_minimum_and_implementation))

; [insurance:management_rules_set_by_authority] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他應遵行事項由主管機關定之
(assert (= management_rules_set_by_authority authority_set_management_rules))

; [insurance:bank_permission_and_apply_agent_broker_rules] 銀行經主管機關許可擇一兼營保險代理人或經紀人業務，並分別準用相關規定
(assert (= bank_permission_and_apply_agent_broker_rules
   (or apply_agent_broker_rules (not bank_permitted_to_operate))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人洽訂契約前應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_provide_written_report_and_disclose_fee
   (and broker_provide_written_report
        (or (not broker_charge_fee) broker_disclose_fee_standard))))

; [insurance:agent_qualification_and_employment_conditions] 代理人具資格且無禁止情事，得以個人名義或受代理人公司或銀行任用取得執業證照後執行業務
(assert (= agent_qualification_and_employment_conditions
   (and agent_qualification_met (not agent_prohibited_condition) license_held)))

; [insurance:agent_company_and_bank_must_employ_minimum_agents] 代理人公司及銀行應任用代理人至少一人，並視業務規模及品質適當調整，主管機關得要求增加
(assert (= agent_company_and_bank_employ_minimum_agents
   (and (<= 1 agent_employed_count) agent_employment_adjusted_appropriately)))

; [insurance:agent_company_and_bank_must_register_permit] 代理人公司及銀行依規定辦理許可登記並依法向公司登記主管機關辦理登記
(assert (= agent_company_and_bank_must_register_permit
   (and permit_registered_with_authority company_registration_completed)))

; [insurance:agent_cannot_be_employed_by_multiple_companies] 個人執業代理人及受代理人公司或銀行任用之代理人，不得同時受任於其他代理人公司、保險經紀人公司、公證人公司或銀行
(assert (not (= agent_employed_by_multiple_companies
        agent_cannot_be_employed_by_multiple_companies)))

; [insurance:agent_contract_must_include_required_items] 保險代理合約內容至少應包括主管機關規定之十二項目
(assert (= agent_contract_must_include_required_items
   (and contract_include_parties_names
        contract_include_agent_period
        contract_include_agent_scope
        contract_include_commission_standard
        contract_include_commission_method
        contract_include_law_compliance
        contract_include_prohibited_behaviors
        contract_include_conflict_of_interest_prevention
        contract_include_breach_liability
        contract_include_dispute_resolution
        contract_include_contract_termination
        contract_include_financial_institution_account
        contract_include_other_authority_requirements)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未領執業證照、保險類型不符、銀行未依規定申請許可、經紀人未履行義務、代理人資格不符、代理人公司或銀行未任用足夠代理人、未辦理登記、代理人同時受多公司任用、代理合約未包含必要項目時處罰
(assert (= penalty
   (or (not agent_cannot_be_employed_by_multiple_companies)
       (not agent_company_and_bank_must_register_permit)
       (not agent_company_and_bank_employ_minimum_agents)
       (not broker_duty_of_care_and_fidelity)
       (not license_and_bond_insurance_required)
       (not related_insurance_type_correct)
       (not agent_contract_must_include_required_items)
       (not broker_provide_written_report_and_disclose_fee)
       (not agent_qualification_and_employment_conditions)
       (not bank_permission_and_apply_agent_broker_rules))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent true))
(assert (= agent_employed_by_multiple_companies true))
(assert (= agent_cannot_be_employed_by_multiple_companies false))
(assert (= agent_prohibited_condition true))
(assert (= agent_qualification_met false))
(assert (= license_held true))
(assert (= bond_deposited true))
(assert (= related_insurance_purchased true))
(assert (= insurance_type_responsibility true))
(assert (= insurance_type_guarantee false))
(assert (= agent_employed_count 1))
(assert (= agent_employment_adjusted_appropriately true))
(assert (= permit_registered_with_authority true))
(assert (= company_registration_completed true))
(assert (= agent_company_and_bank_employ_minimum_agents true))
(assert (= agent_company_and_bank_must_register_permit true))
(assert (= agent_contract_must_include_required_items true))
(assert (= approved_by_authority true))
(assert (= authority_set_management_rules true))
(assert (= authority_set_minimum_and_implementation true))
(assert (= bank_permitted_to_operate false))
(assert (= apply_agent_broker_rules false))
(assert (= bank_permission_and_apply_agent_broker_rules false))
(assert (= broker false))
(assert (= broker_charge_fee false))
(assert (= broker_disclose_fee_standard false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_fulfill_fidelity false))
(assert (= broker_provide_written_report false))
(assert (= broker_provide_written_report_and_disclose_fee false))
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
; Total variables: 51
; Total facts: 32
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
