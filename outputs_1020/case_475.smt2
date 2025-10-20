; SMT2 file generated from compliance case automatic
; Case ID: case_475
; Generated at: 2025-10-19T16:49:31.650338
;
; This file can be executed with Z3:
;   z3 case_475.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_contract_content_compliant Bool)
(declare-const agent_or_notary Bool)
(declare-const approved_by_authority Bool)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_engage_agent Bool)
(declare-const bank_engage_broker Bool)
(declare-const bank_permitted_to_engage_agent_or_broker Bool)
(declare-const bond_deposit_amount Real)
(declare-const bond_minimum_amount Real)
(declare-const bond_minimum_amount_set Bool)
(declare-const bond_minimum_amount_set_by_authority Bool)
(declare-const broker Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_fidelity_duty Bool)
(declare-const broker_report_and_fee_disclosure Bool)
(declare-const contract_agent_period_included Bool)
(declare-const contract_agent_scope_included Bool)
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
(declare-const fee_charged Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const guarantee_insurance_covered Bool)
(declare-const holding_practice_license Bool)
(declare-const law_compliance_personnel_training_completed Bool)
(declare-const law_compliance_training_hours Real)
(declare-const liability_insurance_covered Bool)
(declare-const license_and_bond_insurance_required Bool)
(declare-const penalty Bool)
(declare-const pre_service_training_completed Bool)
(declare-const pre_service_training_hours Real)
(declare-const pre_service_training_passed Bool)
(declare-const pre_service_training_within_one_year Bool)
(declare-const qualification_and_management_rules_set Bool)
(declare-const qualification_and_management_rules_set_by_authority Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_related_provisions Bool)
(declare-const violate_written_report_rules Bool)
(declare-const violation_financial_or_business_management_rules Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_bond_insurance_required] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_bond_insurance_required
   (and approved_by_authority
        (>= bond_deposit_amount bond_minimum_amount)
        relevant_insurance_covered
        holding_practice_license)))

; [insurance:relevant_insurance_type] 相關保險類型依身份區分：代理人、公證人為責任保險；經紀人為責任保險及保證保險
(assert (= relevant_insurance_covered
   (or (and agent_or_notary liability_insurance_covered)
       (and broker liability_insurance_covered guarantee_insurance_covered))))

; [insurance:bond_minimum_amount_set_by_authority] 保證金最低金額及實施方式由主管機關依經營業務範圍及規模定之
(assert (= bond_minimum_amount_set bond_minimum_amount_set_by_authority))

; [insurance:qualification_and_management_rules_set] 資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則由主管機關定之
(assert (= qualification_and_management_rules_set
   qualification_and_management_rules_set_by_authority))

; [insurance:bank_permitted_to_engage_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_engage_agent_or_broker
   (and bank_approved_by_authority (or bank_engage_agent bank_engage_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_duty_of_care broker_fidelity_duty)))

; [insurance:broker_must_provide_written_report_and_disclose_fee] 保險經紀人洽訂契約前應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_report_and_fee_disclosure
   (and written_analysis_report_provided
        (or (not fee_charged) fee_standard_disclosed))))

; [insurance:violation_financial_or_business_management_rules] 違反財務或業務管理規定、書面分析報告規定或相關準用規定者，應限期改正或處罰
(assert (= violation_financial_or_business_management_rules
   (or violate_related_provisions
       violate_written_report_rules
       violate_financial_management_rules
       violate_business_management_rules)))

; [insurance:agent_contract_must_include_required_items] 保險代理合約應包括雙方名稱、代理期限、代理權限範圍、佣酬支付標準及方式、法令遵循、禁止行為、防範利益衝突、違約責任、爭議處理、合約終止、往來金融機構帳戶及其他主管機關規定事項
(assert (= agent_contract_content_compliant
   (and contract_party_names_included
        contract_agent_period_included
        contract_agent_scope_included
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

; [insurance:pre_service_training_completed] 個人執業代理人、受代理人公司或銀行任用代理人應於申請執行業務前一年內參加職前教育訓練達32小時以上並測驗及格
(assert (= pre_service_training_completed
   (and (<= 32.0 pre_service_training_hours)
        pre_service_training_passed
        pre_service_training_within_one_year)))

; [insurance:law_compliance_personnel_training_completed] 法令遵循人員應參加職前教育訓練30小時以上
(assert (= law_compliance_personnel_training_completed
   (<= 30.0 law_compliance_training_hours)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險、執業證照、財務或業務管理規定，或代理合約內容不符，或未完成職前教育訓練時處罰
(assert (= penalty
   (or (not license_and_bond_insurance_required)
       (not law_compliance_personnel_training_completed)
       (not bank_permitted_to_engage_agent_or_broker)
       (not pre_service_training_completed)
       (not broker_duty_of_care_and_fidelity)
       (not qualification_and_management_rules_set)
       (not broker_report_and_fee_disclosure)
       (not agent_contract_content_compliant)
       violation_financial_or_business_management_rules)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_or_notary true))
(assert (= approved_by_authority true))
(assert (= bond_deposit_amount 0.0))
(assert (= bond_minimum_amount 0.0))
(assert (= bond_minimum_amount_set true))
(assert (= bond_minimum_amount_set_by_authority true))
(assert (= holding_practice_license false))
(assert (= liability_insurance_covered false))
(assert (= relevant_insurance_covered false))
(assert (= agent_contract_content_compliant false))
(assert (= qualification_and_management_rules_set true))
(assert (= qualification_and_management_rules_set_by_authority true))
(assert (= pre_service_training_completed true))
(assert (= pre_service_training_hours 32.0))
(assert (= pre_service_training_passed true))
(assert (= pre_service_training_within_one_year true))
(assert (= law_compliance_personnel_training_completed true))
(assert (= law_compliance_training_hours 30.0))
(assert (= violate_business_management_rules true))
(assert (= violate_financial_management_rules false))
(assert (= violate_related_provisions true))
(assert (= violate_written_report_rules false))
(assert (= violation_financial_or_business_management_rules true))
(assert (= penalty true))
(assert (= broker false))
(assert (= broker_duty_of_care false))
(assert (= broker_fidelity_duty false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= broker_report_and_fee_disclosure false))
(assert (= written_analysis_report_provided false))
(assert (= fee_charged false))
(assert (= fee_standard_disclosed false))
(assert (= bank_approved_by_authority false))
(assert (= bank_engage_agent false))
(assert (= bank_engage_broker false))
(assert (= bank_permitted_to_engage_agent_or_broker false))
(assert (= contract_party_names_included false))
(assert (= contract_agent_period_included false))
(assert (= contract_agent_scope_included false))
(assert (= contract_commission_standard_included false))
(assert (= contract_commission_method_included false))
(assert (= contract_law_compliance_included false))
(assert (= contract_prohibited_behavior_included false))
(assert (= contract_conflict_of_interest_prevention_included false))
(assert (= contract_breach_liability_included false))
(assert (= contract_dispute_resolution_included false))
(assert (= contract_termination_included false))
(assert (= contract_financial_account_included false))
(assert (= contract_other_authority_requirements_included false))
(assert (= guarantee_insurance_covered false))
(assert (= license_and_bond_insurance_required false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 51
; Total facts: 51
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
