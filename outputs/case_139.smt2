; SMT2 file generated from compliance case automatic
; Case ID: case_139
; Generated at: 2025-10-21T02:52:18.094245
;
; This file can be executed with Z3:
;   z3 case_139.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const broker_reinsurance_dual_business_disclosure Bool)
(declare-const broker_reinsurance_written_delegation Bool)
(declare-const broker_reinsurer_confirmation_and_check Bool)
(declare-const complete_reinsurance_contract_delivered_within_6_months Bool)
(declare-const conflict_of_interest Bool)
(declare-const contract_documents_obtained_within_time_limit Bool)
(declare-const contract_signed_documents_delivered_within_60_days Bool)
(declare-const correction_order_issued Bool)
(declare-const correction_order_or_penalty Bool)
(declare-const domestic_reinsurance_company_approved Bool)
(declare-const domestic_reinsurance_participation_percentage Real)
(declare-const dual_business_disclosed_in_contract Bool)
(declare-const eligible_reinsurance_target Bool)
(declare-const foreign_broker_approved_by_home_regulator Bool)
(declare-const foreign_broker_deductible_percentage Real)
(declare-const foreign_broker_insurance_period_uninterrupted Bool)
(declare-const foreign_broker_professional_liability_insurance_aggregate_usd Real)
(declare-const foreign_broker_professional_liability_insurance_per_accident_usd Real)
(declare-const foreign_broker_qualification Bool)
(declare-const foreign_broker_qualification_checked Bool)
(declare-const foreign_reinsurance_company_approved Bool)
(declare-const foreign_reinsurance_credit_rating_level Int)
(declare-const internal_control_segregated Bool)
(declare-const internal_control_segregation Bool)
(declare-const international_reinsurer_credit_rating_level Int)
(declare-const legal_reinsurance_organization Bool)
(declare-const license_revoked Bool)
(declare-const market_information_notification Bool)
(declare-const non_eligible_reinsurance_target Bool)
(declare-const original_insurer_consent Bool)
(declare-const other_approved_reinsurance_organization Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_imposed Bool)
(declare-const post_contract_major_info_notified_to_original_insurer Bool)
(declare-const property_insurance_temporary_reinsurance_compliance Bool)
(declare-const property_insurance_temporary_reinsurance_non_compliance Bool)
(declare-const reinsurance_business_operational_rules_compliance Bool)
(declare-const reinsurance_conditions_and_rates_compliant Bool)
(declare-const reinsurance_conditions_compliance Bool)
(declare-const reinsurance_confirmation_before_effective Bool)
(declare-const reinsurance_contract_document_delivery Bool)
(declare-const reinsurance_document_preservation Bool)
(declare-const reinsurance_documents_preservation_period_years Int)
(declare-const reinsurance_documents_preserved Bool)
(declare-const reinsurance_documents_properly_preserved Bool)
(declare-const reinsurance_information_delivery Bool)
(declare-const reinsurance_major_info_delivered_before_effective Bool)
(declare-const reinsurance_risk_management_plan_complied Bool)
(declare-const reinsurer_confirmation_document_obtained_before_effective Bool)
(declare-const reinsurer_credit_rating_compliance Bool)
(declare-const reinsurer_credit_rating_level Int)
(declare-const required_credit_rating_level Int)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1_or_163_5_applied Bool)
(declare-const violate_financial_or_business_management_rules_163_4 Bool)
(declare-const violation_of_management_rules Bool)
(declare-const written_delegation_from_original_insurer Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_segregation] 經紀人公司內部控制制度及處理程序應區隔且無利益衝突
(assert (= internal_control_segregation
   (and internal_control_segregated (not conflict_of_interest))))

; [insurance:broker_reinsurance_written_delegation] 經紀人公司經營再保險經紀業務應取得原保險人書面委任
(assert (= broker_reinsurance_written_delegation
   written_delegation_from_original_insurer))

; [insurance:reinsurer_credit_rating_compliance] 再保險人信用評等等級符合規定且原保險人同意
(assert (= reinsurer_credit_rating_compliance
   (and (>= reinsurer_credit_rating_level required_credit_rating_level)
        original_insurer_consent)))

; [insurance:broker_reinsurance_dual_business_disclosure] 同時受託辦理保險經紀及再保險經紀業務事項載明於委任契約或文件
(assert (= broker_reinsurance_dual_business_disclosure
   dual_business_disclosed_in_contract))

; [insurance:reinsurance_confirmation_before_effective] 原保險契約生效前或分出保險責任開始前取得再保險人確認認受文件
(assert (= reinsurance_confirmation_before_effective
   reinsurer_confirmation_document_obtained_before_effective))

; [insurance:reinsurance_information_delivery] 於原保險契約生效前或分出保險責任開始前交付再保險相關重大資訊予原保險人
(assert (= reinsurance_information_delivery
   reinsurance_major_info_delivered_before_effective))

; [insurance:reinsurance_contract_document_delivery] 再保險契約生效日起60日內交付再保險人簽署契約文件，合約再保險於6個月內交付完整書面文件
(assert (= reinsurance_contract_document_delivery
   (and contract_signed_documents_delivered_within_60_days
        complete_reinsurance_contract_delivered_within_6_months)))

; [insurance:reinsurance_document_preservation] 完整保存再保險相關證明文件，保存期間不得低於保險責任終了後五年
(assert (= reinsurance_document_preservation
   (and reinsurance_documents_preserved
        (<= 5 reinsurance_documents_preservation_period_years))))

; [insurance:foreign_broker_qualification] 委任國外經紀人安排再保險業務須符合主管機關核准及專業責任保險條件
(assert (= foreign_broker_qualification
   (and foreign_broker_approved_by_home_regulator
        (<= 5000000.0
            foreign_broker_professional_liability_insurance_per_accident_usd)
        (<= 10000000.0
            foreign_broker_professional_liability_insurance_aggregate_usd)
        (>= 5.0 foreign_broker_deductible_percentage)
        foreign_broker_insurance_period_uninterrupted)))

; [insurance:market_information_notification] 再保險合約生效後通知原保險人影響再保險人財務業務之重大資訊
(assert (= market_information_notification
   post_contract_major_info_notified_to_original_insurer))

; [insurance:reinsurance_conditions_compliance] 再保險條件及各再保費率符合管理辦法第10條及第11條規定
(assert (= reinsurance_conditions_compliance reinsurance_conditions_and_rates_compliant))

; [insurance:eligible_reinsurance_target] 再保險分出對象符合管理辦法第7條規定
(assert (= eligible_reinsurance_target
   (or (>= foreign_reinsurance_credit_rating_level required_credit_rating_level)
       domestic_reinsurance_company_approved
       other_approved_reinsurance_organization
       foreign_reinsurance_company_approved
       legal_reinsurance_organization)))

; [insurance:non_eligible_reinsurance_target] 再保險分出對象不符合管理辦法第7條規定
(assert (not (= eligible_reinsurance_target non_eligible_reinsurance_target)))

; [insurance:property_insurance_temporary_reinsurance_compliance] 財產保險業非比例性臨時再保險分出符合管理辦法第11條規定
(assert (= property_insurance_temporary_reinsurance_compliance
   (or (>= international_reinsurer_credit_rating_level
           required_credit_rating_level)
       domestic_reinsurance_company_approved
       (<= 30.0 domestic_reinsurance_participation_percentage))))

; [insurance:property_insurance_temporary_reinsurance_non_compliance] 財產保險業非比例性臨時再保險分出不符合管理辦法第11條規定
(assert (not (= property_insurance_temporary_reinsurance_compliance
        property_insurance_temporary_reinsurance_non_compliance)))

; [insurance:reinsurance_business_operational_rules_compliance] 保險業辦理再保險業務遵守管理辦法第3條作業規定
(assert (= reinsurance_business_operational_rules_compliance
   (and reinsurance_risk_management_plan_complied
        reinsurer_confirmation_document_obtained_before_effective
        broker_reinsurer_confirmation_and_check
        foreign_broker_qualification_checked
        contract_documents_obtained_within_time_limit
        reinsurance_documents_properly_preserved)))

; [insurance:violation_of_management_rules] 違反保險法第163條第4項管理規則、163條第7項、165條第1項或163條第5項準用規定
(assert (= violation_of_management_rules
   (or violate_financial_or_business_management_rules_163_4
       violate_165_1_or_163_5_applied
       violate_163_7)))

; [insurance:correction_order_or_penalty] 違反管理規則者應限期改正或處罰鍰，情節重大者廢止許可並註銷執業證照
(assert (= correction_order_or_penalty
   (or correction_order_issued
       license_revoked
       penalty_fine_imposed
       (not violation_of_management_rules))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則且未限期改正或未處罰鍰或未廢止許可註銷執照時處罰
(assert (= penalty
   (and violation_of_management_rules
        (not (or correction_order_issued license_revoked penalty_fine_imposed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= reinsurer_confirmation_document_obtained_before_effective false))
(assert (= violate_163_7 true))
(assert (= violation_of_management_rules true))
(assert (= correction_order_issued true))
(assert (= penalty_fine_imposed true))
(assert (= license_revoked false))
(assert (= penalty true))
(assert (= written_delegation_from_original_insurer true))
(assert (= broker_reinsurance_written_delegation true))
(assert (= broker_reinsurer_confirmation_and_check false))
(assert (= contract_signed_documents_delivered_within_60_days true))
(assert (= complete_reinsurance_contract_delivered_within_6_months true))
(assert (= contract_documents_obtained_within_time_limit true))
(assert (= reinsurance_documents_properly_preserved true))
(assert (= reinsurance_documents_preserved true))
(assert (= reinsurance_documents_preservation_period_years 5))
(assert (= internal_control_segregated true))
(assert (= conflict_of_interest false))
(assert (= internal_control_segregation true))
(assert (= dual_business_disclosed_in_contract true))
(assert (= broker_reinsurance_dual_business_disclosure true))
(assert (= original_insurer_consent true))
(assert (= reinsurance_major_info_delivered_before_effective true))
(assert (= reinsurance_information_delivery true))
(assert (= post_contract_major_info_notified_to_original_insurer true))
(assert (= market_information_notification true))
(assert (= reinsurance_conditions_and_rates_compliant true))
(assert (= reinsurance_conditions_compliance true))
(assert (= reinsurance_risk_management_plan_complied true))
(assert (= foreign_broker_approved_by_home_regulator true))
(assert (= foreign_broker_professional_liability_insurance_per_accident_usd 5000000.0))
(assert (= foreign_broker_professional_liability_insurance_aggregate_usd 10000000.0))
(assert (= foreign_broker_deductible_percentage 5.0))
(assert (= foreign_broker_insurance_period_uninterrupted true))
(assert (= foreign_broker_qualification_checked true))
(assert (= foreign_broker_qualification true))
(assert (= domestic_reinsurance_company_approved true))
(assert (= foreign_reinsurance_company_approved true))
(assert (= foreign_reinsurance_credit_rating_level 5))
(assert (= required_credit_rating_level 3))
(assert (= eligible_reinsurance_target true))
(assert (= non_eligible_reinsurance_target false))
(assert (= legal_reinsurance_organization false))
(assert (= other_approved_reinsurance_organization false))
(assert (= property_insurance_temporary_reinsurance_compliance true))
(assert (= property_insurance_temporary_reinsurance_non_compliance false))
(assert (= correction_order_or_penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 57
; Total facts: 47
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
