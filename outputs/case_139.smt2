; SMT2 file generated from compliance case automatic
; Case ID: case_139
; Generated at: 2025-10-22T19:53:12.801329
;
; This file can be executed with Z3:
;   z3 case_139.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const broker_foreign_broker_qualified Bool)
(declare-const broker_reinsurance_conditions_consistent Bool)
(declare-const broker_reinsurance_confirmation_obtained_before_effective Bool)
(declare-const broker_reinsurance_confirmation_ok Bool)
(declare-const complete_contract_delivered Bool)
(declare-const complete_contract_delivered_within_6_months Bool)
(declare-const conflict_of_interest Bool)
(declare-const deliver_complete_contract_within_6_months Bool)
(declare-const deliver_signed_contract_within_60_days Bool)
(declare-const documents_retained_min_5_years Bool)
(declare-const documents_saved_min_5_years Bool)
(declare-const domestic_participation_ratio Real)
(declare-const domestic_participation_sufficient Bool)
(declare-const domestic_reinsurance_approved Bool)
(declare-const dual_agency_disclosed Bool)
(declare-const dual_agency_disclosed_in_contract Bool)
(declare-const eligible_reinsurance_target Bool)
(declare-const ethics_and_self_regulation_ok Bool)
(declare-const exempted_by_risk_management_standards Bool)
(declare-const follow_ethics_and_self_regulation Bool)
(declare-const foreign_broker_aggregate_limit_usd Real)
(declare-const foreign_broker_approved_by_home_authority Bool)
(declare-const foreign_broker_deductible_rate Real)
(declare-const foreign_broker_insurance_period_uninterrupted Int)
(declare-const foreign_broker_per_accident_limit_usd Real)
(declare-const foreign_broker_professional_liability_insurance_valid Bool)
(declare-const foreign_broker_qualified Bool)
(declare-const foreign_reinsurance_approved Bool)
(declare-const foreign_reinsurance_credit_rating Real)
(declare-const internal_control_segregation_established Bool)
(declare-const internal_control_segregation_ok Bool)
(declare-const legal_reinsurance_entity Bool)
(declare-const non_eligible_reinsurance_target Bool)
(declare-const notify_major_info_after_effective Bool)
(declare-const notify_original_insurer_after_effective Bool)
(declare-const other_approved_reinsurance_entity Bool)
(declare-const penalty Bool)
(declare-const penalty_imposed Bool)
(declare-const registered_professional_reinsurance Bool)
(declare-const reinsurance_confirmation_before_effective_ok Bool)
(declare-const reinsurance_confirmation_obtained_before_effective Bool)
(declare-const reinsurance_consent_obtained Bool)
(declare-const reinsurance_credit_and_consent_ok Bool)
(declare-const reinsurance_credit_rating Real)
(declare-const reinsurance_documents_retained Bool)
(declare-const reinsurance_documents_saved Bool)
(declare-const reinsurance_info_delivered Bool)
(declare-const reinsurance_info_delivered_before_effective Bool)
(declare-const reinsurance_target_qualified Bool)
(declare-const reinsurance_written_delegation_obtained Bool)
(declare-const reinsurance_written_delegation_ok Bool)
(declare-const required_credit_rating Real)
(declare-const risk_management_plan_arranged Bool)
(declare-const risk_management_plan_compliant Bool)
(declare-const serious_violation Bool)
(declare-const signed_contract_delivered Bool)
(declare-const signed_contract_delivered_within_60_days Bool)
(declare-const temporary_non_proportional_reinsurance_compliant Bool)
(declare-const temporary_non_proportional_reinsurance_non_compliant Bool)
(declare-const temporary_non_proportional_reinsurance_ok Bool)
(declare-const violated_163_7 Bool)
(declare-const violated_165_1_or_163_5 Bool)
(declare-const violated_management_rules Bool)
(declare-const violation_163_7 Bool)
(declare-const violation_165_1_or_163_5 Bool)
(declare-const violation_any Bool)
(declare-const violation_management_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_broker:internal_control_segregation] 經紀人公司內部控制制度及處理程序應區隔且無利益衝突
(assert (= internal_control_segregation_ok
   (and internal_control_segregation_established (not conflict_of_interest))))

; [insurance_broker:follow_ethics_and_self_regulation] 遵循經紀人商業同業公會執業道德及自律規範
(assert (= ethics_and_self_regulation_ok follow_ethics_and_self_regulation))

; [insurance_broker:reinsurance_written_delegation] 經營再保險經紀業務應取得原保險人書面委任
(assert (= reinsurance_written_delegation_ok reinsurance_written_delegation_obtained))

; [insurance_broker:reinsurance_credit_rating_and_consent] 再保險人信用評等等級符合規定且經原保險人同意
(assert (= reinsurance_credit_and_consent_ok
   (and (>= reinsurance_credit_rating required_credit_rating)
        reinsurance_consent_obtained)))

; [insurance_broker:disclose_dual_agency] 同時受託辦理保險經紀及再保險經紀業務事項載明於委任契約或文件
(assert (= dual_agency_disclosed dual_agency_disclosed_in_contract))

; [insurance_broker:reinsurance_confirmation_before_effective] 原保險契約生效前取得再保險人確認認受文件
(assert (= reinsurance_confirmation_before_effective_ok
   reinsurance_confirmation_obtained_before_effective))

; [insurance_broker:deliver_reinsurance_info_before_effective] 原保險契約生效前交付再保險人相關資訊予原保險人
(assert (= reinsurance_info_delivered_before_effective reinsurance_info_delivered))

; [insurance_broker:deliver_signed_contract_within_60_days] 再保險契約生效日起60日內交付再保險人簽署契約文件
(assert (= signed_contract_delivered_within_60_days signed_contract_delivered))

; [insurance_broker:deliver_complete_contract_within_6_months] 合約再保險於生效日起6個月內交付完整再保險契約書面文件
(assert (= complete_contract_delivered_within_6_months complete_contract_delivered))

; [insurance_broker:retain_reinsurance_documents] 完整保存再保險相關證明文件供主管機關查核
(assert (= reinsurance_documents_retained reinsurance_documents_saved))

; [insurance_broker:foreign_broker_qualification] 委任國外經紀人安排再保險業務符合資格條件
(assert (= foreign_broker_qualified
   (and foreign_broker_approved_by_home_authority
        foreign_broker_professional_liability_insurance_valid
        (<= 5000000.0 foreign_broker_per_accident_limit_usd)
        (<= 10000000.0 foreign_broker_aggregate_limit_usd)
        (>= 5.0 foreign_broker_deductible_rate)
        (= foreign_broker_insurance_period_uninterrupted 1))))

; [insurance_broker:notify_original_insurer_after_effective] 再保險合約生效後通知原保險人重大財務業務資訊
(assert (= notify_original_insurer_after_effective notify_major_info_after_effective))

; [insurance_reinsurance:eligible_reinsurance_target] 符合適格再保險分出對象條件
(assert (= eligible_reinsurance_target
   (or domestic_reinsurance_approved
       foreign_reinsurance_approved
       legal_reinsurance_entity
       other_approved_reinsurance_entity
       (>= foreign_reinsurance_credit_rating required_credit_rating))))

; [insurance_reinsurance:non_eligible_reinsurance_target] 不符合適格再保險分出對象
(assert (not (= eligible_reinsurance_target non_eligible_reinsurance_target)))

; [property_insurance:temporary_non_proportional_reinsurance_requirements] 非比例性臨時再保險分出應符合國際信用評等及國內再保險業參與比例規定
(assert (= temporary_non_proportional_reinsurance_ok
   (or domestic_reinsurance_approved
       (>= foreign_reinsurance_credit_rating required_credit_rating))))

; [property_insurance:temporary_non_proportional_reinsurance_minimum_participation] 國內財產保險業承接部分業務比例達30%以上
(assert (= domestic_participation_sufficient (<= 30.0 domestic_participation_ratio)))

; [property_insurance:temporary_non_proportional_reinsurance_compliance] 非比例性臨時再保險分出符合信用評等及國內參與比例規定
(assert (= temporary_non_proportional_reinsurance_compliant
   (and temporary_non_proportional_reinsurance_ok
        domestic_participation_sufficient)))

; [property_insurance:temporary_non_proportional_reinsurance_non_compliance] 非比例性臨時再保險分出不符合規定
(assert (not (= temporary_non_proportional_reinsurance_compliant
        temporary_non_proportional_reinsurance_non_compliant)))

; [insurance_reinsurance:reinsurance_target_qualification] 分出對象符合營業登記或信用評等等級或主管機關核准
(assert (= reinsurance_target_qualified
   (or other_approved_reinsurance_entity
       registered_professional_reinsurance
       (>= foreign_reinsurance_credit_rating required_credit_rating))))

; [insurance_reinsurance:reinsurance_risk_management_plan_compliance] 配合再保險風險管理計畫安排分出並取得確認認受文件
(assert (= risk_management_plan_compliant
   (and risk_management_plan_arranged
        (or exempted_by_risk_management_standards
            reinsurance_confirmation_obtained_before_effective))))

; [insurance_reinsurance:broker_reinsurance_confirmation_and_check] 保險經紀人於原保險契約生效前取得確認認受文件並檢核一致性
(assert (= broker_reinsurance_confirmation_ok
   (and broker_reinsurance_confirmation_obtained_before_effective
        broker_reinsurance_conditions_consistent)))

; [insurance_reinsurance:broker_foreign_broker_qualification_check] 委任國外保險經紀人安排再保險業務符合資格條件
(assert (= broker_foreign_broker_qualified
   (and foreign_broker_approved_by_home_authority
        foreign_broker_professional_liability_insurance_valid
        (<= 5000000.0 foreign_broker_per_accident_limit_usd)
        (<= 10000000.0 foreign_broker_aggregate_limit_usd)
        (>= 5.0 foreign_broker_deductible_rate)
        (= foreign_broker_insurance_period_uninterrupted 1))))

; [insurance_reinsurance:deliver_signed_contract_within_60_days] 再保險契約生效日起60日內交付再保險人簽署契約文件
(assert (= deliver_signed_contract_within_60_days signed_contract_delivered))

; [insurance_reinsurance:deliver_complete_contract_within_6_months] 合約再保險於生效日起6個月內交付完整再保險契約書面文件
(assert (= deliver_complete_contract_within_6_months complete_contract_delivered))

; [insurance_reinsurance:retain_documents_min_5_years] 妥善保存再保險相關文件保存期間不得低於保險責任終了後五年
(assert (= documents_retained_min_5_years documents_saved_min_5_years))

; [insurance:violation_of_management_rules] 違反保險法第163條相關管理規則財務或業務管理規定
(assert (= violation_management_rules violated_management_rules))

; [insurance:violation_of_163_7] 違反保險法第163條第七項規定
(assert (= violation_163_7 violated_163_7))

; [insurance:violation_of_165_1_or_163_5] 違反保險法第165條第一項或第163條第五項準用規定
(assert (= violation_165_1_or_163_5 violated_165_1_or_163_5))

; [insurance:violation_any] 違反任一相關規定
(assert (= violation_any
   (or violation_163_7 violation_165_1_or_163_5 violation_management_rules)))

; [insurance:penalty_imposed] 違反規定時應限期改正或處罰
(assert (= penalty_imposed (or serious_violation violation_any)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty (or serious_violation violation_any)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= reinsurance_confirmation_obtained_before_effective false))
(assert (= reinsurance_written_delegation_obtained true))
(assert (= violated_165_1_or_163_5 true))
(assert (= violation_165_1_or_163_5 true))
(assert (= violation_any true))
(assert (= penalty_imposed true))
(assert (= penalty true))
(assert (= broker_reinsurance_confirmation_obtained_before_effective false))
(assert (= broker_reinsurance_conditions_consistent false))
(assert (= broker_reinsurance_confirmation_ok false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 32
; Total variables: 67
; Total facts: 10
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
