; SMT2 file generated from compliance case automatic
; Case ID: case_380
; Generated at: 2025-10-19T14:28:25.515866
;
; This file can be executed with Z3:
;   z3 case_380.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_company_and_bank_employment_ok Bool)
(declare-const agent_contract_content_ok Bool)
(declare-const agent_employed_multiple_places Bool)
(declare-const agent_license_and_insurance Bool)
(declare-const agent_management_rules_set Bool)
(declare-const agent_no_multiple_employment Bool)
(declare-const agent_prohibited_condition Bool)
(declare-const agent_qualification_and_employment Bool)
(declare-const agent_qualification_met Bool)
(declare-const agent_registration_after_permit Bool)
(declare-const agent_type Int)
(declare-const agents_employed Int)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permission_granted Bool)
(declare-const bank_permitted_to_operate_agent_or_broker Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_report_and_fee_disclosed Bool)
(declare-const company_registration_done Bool)
(declare-const contract_includes_required_items Bool)
(declare-const employment_adjusted_appropriately Bool)
(declare-const fee_charged Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_deposit_minimum Real)
(declare-const guarantee_deposit_minimum_defined_by_authority Bool)
(declare-const guarantee_deposit_minimum_set Bool)
(declare-const license_permitted Bool)
(declare-const management_rules_defined_by_authority Bool)
(declare-const penalty Bool)
(declare-const permit_registration_done Bool)
(declare-const practice_certificate_held Bool)
(declare-const relevant_insurance_purchased Bool)
(declare-const relevant_insurance_type Int)
(declare-const relevant_insurance_type_ok Bool)
(declare-const violate_broker_duties Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_related_provisions Bool)
(declare-const violation_financial_or_business_management_rules Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_insurance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= agent_license_and_insurance
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_deposit_minimum)
        relevant_insurance_purchased
        practice_certificate_held)))

; [insurance:relevant_insurance_type] 相關保險種類依代理人、經紀人、公證人身份不同而定
(assert (let ((a!1 (or (and (= 2 agent_type)
                    (or (= 1 relevant_insurance_type)
                        (= 2 relevant_insurance_type)))
               (and (= 3 agent_type) (= 1 relevant_insurance_type))
               (and (= 1 agent_type) (= 1 relevant_insurance_type)))))
  (= relevant_insurance_type_ok a!1)))

; [insurance:guarantee_deposit_minimum_set] 保證金最低金額及實施方式由主管機關依業務範圍及規模定之
(assert (= guarantee_deposit_minimum_set guarantee_deposit_minimum_defined_by_authority))

; [insurance:agent_management_rules_set] 代理人資格取得、申請許可條件、程序、文件等管理規則由主管機關定之
(assert (= agent_management_rules_set management_rules_defined_by_authority))

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_operate_agent_or_broker
   (and bank_permission_granted (or bank_operate_agent bank_operate_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_duty_of_care broker_fulfill_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人洽訂契約前應主動提供書面分析報告，收取報酬者應明確告知收費標準
(assert (= broker_report_and_fee_disclosed
   (and written_analysis_report_provided
        (or (not fee_charged) fee_standard_disclosed))))

; [insurance:agent_qualification_and_employment] 代理人具資格且無禁止情事，得以個人名義或受代理人公司或銀行任用取得執業證照後執行業務
(assert (= agent_qualification_and_employment
   (and agent_qualification_met
        (not agent_prohibited_condition)
        practice_certificate_held)))

; [insurance:agent_company_and_bank_must_employ_minimum_agents] 代理人公司及銀行應任用代理人至少一人，並視業務規模及品質適當調整
(assert (= agent_company_and_bank_employment_ok
   (and (<= 1 agents_employed) employment_adjusted_appropriately)))

; [insurance:agent_registration_after_permit] 依規定辦理許可登記後，應依法向公司登記主管機關辦理登記
(assert (= agent_registration_after_permit
   (and permit_registration_done company_registration_done)))

; [insurance:agent_no_multiple_employment] 個人執業代理人及受代理人公司或銀行任用代理人不得同時受任於其他代理人公司、保險經紀人公司、公證人公司或銀行
(assert (not (= agent_employed_multiple_places agent_no_multiple_employment)))

; [insurance:agent_contract_must_include_required_items] 保險代理合約內容至少應包括主管機關規定之各項目
(assert (= agent_contract_content_ok contract_includes_required_items))

; [insurance:violation_financial_or_business_management_rules] 違反管理規則中財務或業務管理規定、保險經紀人義務或相關準用規定者，應限期改正或處罰
(assert (= violation_financial_or_business_management_rules
   (or violate_business_management_rules
       violate_broker_duties
       violate_related_provisions
       violate_financial_management_rules)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反財務或業務管理規定、保險經紀人義務或相關準用規定時處罰
(assert (= penalty violation_financial_or_business_management_rules))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_employed_multiple_places true))
(assert (= agent_prohibited_condition true))
(assert (= license_permitted true))
(assert (= practice_certificate_held true))
(assert (= agent_qualification_met true))
(assert (= agent_no_multiple_employment false))
(assert (= agent_qualification_and_employment false))
(assert (= agent_license_and_insurance false))
(assert (= violate_related_provisions true))
(assert (= violation_financial_or_business_management_rules true))
(assert (= penalty true))
(assert (= agent_management_rules_set true))
(assert (= management_rules_defined_by_authority true))
(assert (= permit_registration_done true))
(assert (= company_registration_done true))
(assert (= agent_registration_after_permit true))
(assert (= agent_company_and_bank_employment_ok true))
(assert (= employment_adjusted_appropriately true))
(assert (= agents_employed 1))
(assert (= agent_contract_content_ok true))
(assert (= contract_includes_required_items true))
(assert (= guarantee_deposit_minimum_defined_by_authority true))
(assert (= guarantee_deposit_minimum_set true))
(assert (= guarantee_deposit_amount 1000000.0))
(assert (= guarantee_deposit_minimum 1000000.0))
(assert (= relevant_insurance_purchased true))
(assert (= agent_type 1))
(assert (= relevant_insurance_type 1))
(assert (= relevant_insurance_type_ok true))
(assert (= bank_permission_granted false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= bank_permitted_to_operate_agent_or_broker false))
(assert (= broker_exercise_duty_of_care true))
(assert (= broker_fulfill_fidelity true))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= written_analysis_report_provided true))
(assert (= fee_charged false))
(assert (= fee_standard_disclosed false))
(assert (= broker_report_and_fee_disclosed true))
(assert (= violate_broker_duties false))
(assert (= violate_business_management_rules false))
(assert (= violate_financial_management_rules false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 43
; Total facts: 43
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
