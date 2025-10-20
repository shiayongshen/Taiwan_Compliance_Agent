; SMT2 file generated from compliance case automatic
; Case ID: case_139
; Generated at: 2025-10-19T09:03:06.623751
;
; This file can be executed with Z3:
;   z3 case_139.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const broker_foreign_broker_qualified Bool)
(declare-const broker_reinsurance_check_consistent Bool)
(declare-const broker_reinsurance_confirmation_and_check_ok Bool)
(declare-const broker_reinsurance_confirmation_date Int)
(declare-const broker_reinsurance_confirmation_document_obtained Bool)
(declare-const complete_contract_delivered Bool)
(declare-const complete_contract_delivered_within_6_months Bool)
(declare-const complete_contract_delivery_date Int)
(declare-const conflict_of_interest Bool)
(declare-const contract_documents_ok Bool)
(declare-const contract_type Int)
(declare-const correction_or_penalty_required Bool)
(declare-const documents_retained Bool)
(declare-const documents_retention_period_years Int)
(declare-const domestic_reinsurance_licensed Bool)
(declare-const domestic_reinsurance_participation_ratio Real)
(declare-const dual_agency_disclosed_and_agreed Bool)
(declare-const dual_agency_disclosed_in_contract Bool)
(declare-const ethics_and_self_discipline_ok Bool)
(declare-const follow_ethics_and_self_discipline Bool)
(declare-const foreign_broker_approved_by_home_authority Bool)
(declare-const foreign_broker_deductible_rate Real)
(declare-const foreign_broker_insurance_period_uninterrupted Int)
(declare-const foreign_broker_professional_liability_insurance_aggregate_usd Real)
(declare-const foreign_broker_professional_liability_insurance_per_claim_usd Real)
(declare-const foreign_broker_qualified Bool)
(declare-const foreign_professional_reinsurance_credit_rating_level Int)
(declare-const foreign_reinsurance_credit_rating_level Int)
(declare-const foreign_reinsurance_licensed Bool)
(declare-const insured_and_insurer_consent Bool)
(declare-const internal_control_separated Bool)
(declare-const internal_control_separation_ok Bool)
(declare-const legal_reinsurance_organization Bool)
(declare-const major_financial_info_notified Bool)
(declare-const not_qualified_reinsurance_object Bool)
(declare-const notify_original_insurer_after_effective_ok Bool)
(declare-const original_insurance_effective_date Int)
(declare-const original_insurer_approval Bool)
(declare-const other_approved_institutions Bool)
(declare-const other_approved_reinsurance_organization Bool)
(declare-const penalty Bool)
(declare-const qualified_reinsurance_object Bool)
(declare-const qualified_reinsurance_object_14th_article Bool)
(declare-const registered_professional_reinsurance_company Bool)
(declare-const reinsurance_confirmation_before_effective_ok Bool)
(declare-const reinsurance_confirmation_date Int)
(declare-const reinsurance_confirmation_document_obtained Bool)
(declare-const reinsurance_contract_effective Bool)
(declare-const reinsurance_contract_effective_date Int)
(declare-const reinsurance_credit_rating_level Int)
(declare-const reinsurance_credit_rating_ok Bool)
(declare-const reinsurance_documents_retained Bool)
(declare-const reinsurance_info_delivered Bool)
(declare-const reinsurance_info_delivery_date Int)
(declare-const reinsurance_risk_management_plan_arranged Bool)
(declare-const reinsurance_terms_delivered Bool)
(declare-const reinsurance_written_delegation Bool)
(declare-const reinsurance_written_delegation_ok Bool)
(declare-const required_credit_rating_level Int)
(declare-const risk_management_plan_compliance Bool)
(declare-const severe_violation Bool)
(declare-const signed_contract_delivered Bool)
(declare-const signed_contract_delivered_within_60_days Bool)
(declare-const signed_contract_delivery_date Int)
(declare-const temporary_non_proportional_reinsurance_ok Bool)
(declare-const temporary_non_proportional_reinsurance_violation Bool)
(declare-const treaty_reinsurance Bool)
(declare-const violate_163_4_financial_or_business_management Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1_or_163_5_applied Bool)
(declare-const violation_of_management_rules Bool)
(declare-const violation_severity_major Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_broker:internal_control_separation] 經紀人公司內部控制制度及處理程序應區隔且無利益衝突
(assert (= internal_control_separation_ok
   (and internal_control_separated (not conflict_of_interest))))

; [insurance_broker:follow_ethics_and_self_discipline] 遵循經紀人商業同業公會執業道德及自律規範
(assert (= ethics_and_self_discipline_ok follow_ethics_and_self_discipline))

; [insurance_broker:reinsurance_written_delegation] 經營再保險經紀業務應取得原保險人書面委任
(assert (= reinsurance_written_delegation_ok reinsurance_written_delegation))

; [insurance_broker:reinsurance_credit_rating_ok] 再保險人信用評等等級符合規定且原保險人同意
(assert (= reinsurance_credit_rating_ok
   (and (>= reinsurance_credit_rating_level required_credit_rating_level)
        original_insurer_approval)))

; [insurance_broker:disclose_dual_agency] 同時受託辦理保險經紀及再保險經紀業務事項載明於委任契約並取得同意
(assert (= dual_agency_disclosed_and_agreed
   (and dual_agency_disclosed_in_contract insured_and_insurer_consent)))

; [insurance_broker:reinsurance_confirmation_before_effective] 原保險契約生效前取得再保險人確認認受文件
(assert (= reinsurance_confirmation_before_effective_ok
   (and reinsurance_confirmation_document_obtained
        (<= reinsurance_confirmation_date original_insurance_effective_date))))

; [insurance_broker:deliver_reinsurance_info_to_original_insurer] 於原保險契約生效前交付再保險人相關資訊予原保險人
(assert (= reinsurance_info_delivered
   (and reinsurance_terms_delivered
        (<= reinsurance_info_delivery_date original_insurance_effective_date))))

; [insurance_broker:deliver_signed_contract_within_60_days] 再保險契約生效日起60日內交付再保險人簽署契約文件予原保險人
(assert (let ((a!1 (and signed_contract_delivered
                (>= 60
                    (+ signed_contract_delivery_date
                       (* (- 1) reinsurance_contract_effective_date))))))
  (= signed_contract_delivered_within_60_days a!1)))

; [insurance_broker:deliver_complete_contract_within_6_months] 合約再保險於生效日起6個月內交付完整再保險契約書面文件
(assert (let ((a!1 (and complete_contract_delivered
                (>= 180
                    (+ complete_contract_delivery_date
                       (* (- 1) reinsurance_contract_effective_date))))))
(let ((a!2 (or (not (= contract_type (ite treaty_reinsurance 1 0))) a!1)))
  (= complete_contract_delivered_within_6_months a!2))))

; [insurance_broker:retain_reinsurance_documents] 完整保存再保險相關證明文件供主管機關查核
(assert (= reinsurance_documents_retained documents_retained))

; [insurance_broker:foreign_broker_qualification] 委任國外經紀人安排再保險業務符合資格條件
(assert (= foreign_broker_qualified
   (and foreign_broker_approved_by_home_authority
        (<= 5000000.0
            foreign_broker_professional_liability_insurance_per_claim_usd)
        (<= 10000000.0
            foreign_broker_professional_liability_insurance_aggregate_usd)
        (>= 5.0 foreign_broker_deductible_rate)
        (= foreign_broker_insurance_period_uninterrupted 1))))

; [insurance_broker:notify_original_insurer_after_effective] 再保險合約生效後通知原保險人重大財務業務資訊
(assert (= notify_original_insurer_after_effective_ok
   (or major_financial_info_notified (not reinsurance_contract_effective))))

; [reinsurance:qualified_reinsurance_object] 符合適格再保險分出對象條件
(assert (= qualified_reinsurance_object
   (or domestic_reinsurance_licensed
       foreign_reinsurance_licensed
       legal_reinsurance_organization
       other_approved_reinsurance_organization
       (>= foreign_reinsurance_credit_rating_level required_credit_rating_level))))

; [reinsurance:not_qualified_reinsurance_object] 未符合適格再保險分出對象
(assert (not (= qualified_reinsurance_object not_qualified_reinsurance_object)))

; [reinsurance:temporary_non_proportional_reinsurance_requirements] 非比例性臨時再保險分出符合國內外再保險業參與比例及信用評等要求
(assert (= temporary_non_proportional_reinsurance_ok
   (and (or (>= foreign_reinsurance_credit_rating_level
                required_credit_rating_level)
            domestic_reinsurance_licensed)
        (<= 30.0 domestic_reinsurance_participation_ratio))))

; [reinsurance:temporary_non_proportional_reinsurance_violation] 非比例性臨時再保險分出未符合規定
(assert (not (= temporary_non_proportional_reinsurance_ok
        temporary_non_proportional_reinsurance_violation)))

; [reinsurance:qualified_reinsurance_object_for_14th_article] 第十四條規定業務分出對象符合條件
(assert (= qualified_reinsurance_object_14th_article
   (or other_approved_institutions
       registered_professional_reinsurance_company
       (>= foreign_professional_reinsurance_credit_rating_level
           required_credit_rating_level))))

; [reinsurance:reinsurance_risk_management_plan_compliance] 配合再保險風險管理計畫安排分出並取得確認認受文件
(assert (= risk_management_plan_compliance
   (and reinsurance_risk_management_plan_arranged
        reinsurance_confirmation_document_obtained
        (<= reinsurance_confirmation_date original_insurance_effective_date))))

; [reinsurance:broker_reinsurance_confirmation_and_check] 保險經紀人於原保險契約生效前取得確認認受文件並檢核一致性
(assert (= broker_reinsurance_confirmation_and_check_ok
   (and broker_reinsurance_confirmation_document_obtained
        (<= broker_reinsurance_confirmation_date
            original_insurance_effective_date)
        broker_reinsurance_check_consistent)))

; [reinsurance:broker_foreign_broker_qualification_check] 委任國外保險經紀人符合資格條件
(assert (= broker_foreign_broker_qualified
   (and foreign_broker_approved_by_home_authority
        (<= 5000000.0
            foreign_broker_professional_liability_insurance_per_claim_usd)
        (<= 10000000.0
            foreign_broker_professional_liability_insurance_aggregate_usd)
        (>= 5.0 foreign_broker_deductible_rate)
        (= foreign_broker_insurance_period_uninterrupted 1))))

; [reinsurance:contract_documents_delivery_and_retention] 再保險契約文件於規定期限內交付並妥善保存
(assert (let ((a!1 (or (not (= contract_type (ite treaty_reinsurance 1 0)))
               complete_contract_delivered_within_6_months)))
  (= contract_documents_ok
     (and signed_contract_delivered_within_60_days
          a!1
          documents_retained
          (<= 5 documents_retention_period_years)))))

; [insurance:violation_of_management_rules] 違反保險法第163條相關管理規則規定
(assert (= violation_of_management_rules
   (or violate_163_4_financial_or_business_management
       violate_163_7
       violate_165_1_or_163_5_applied)))

; [insurance:correction_or_penalty] 違反管理規則者應限期改正或處罰
(assert (= correction_or_penalty_required violation_of_management_rules))

; [insurance:severe_violation] 情節重大者廢止許可並註銷執業證照
(assert (= severe_violation
   (and violation_of_management_rules violation_severity_major)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則且未限期改正或情節重大者處罰
(assert (= penalty
   (or severe_violation
       (and violation_of_management_rules (not correction_or_penalty_required)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= reinsurance_confirmation_document_obtained true))
(assert (= reinsurance_confirmation_date 1090915))
(assert (= original_insurance_effective_date 1090914))
(assert (= violation_of_management_rules true))
(assert (= correction_or_penalty_required true))
(assert (= penalty true))
(assert (= broker_foreign_broker_qualified false))
(assert (= broker_reinsurance_check_consistent false))
(assert (= broker_reinsurance_confirmation_and_check_ok false))
(assert (= broker_reinsurance_confirmation_date 0))
(assert (= broker_reinsurance_confirmation_document_obtained false))
(assert (= complete_contract_delivered false))
(assert (= complete_contract_delivered_within_6_months false))
(assert (= complete_contract_delivery_date 0))
(assert (= conflict_of_interest false))
(assert (= contract_documents_ok false))
(assert (= contract_type 0))
(assert (= documents_retained false))
(assert (= documents_retention_period_years 0))
(assert (= domestic_reinsurance_licensed false))
(assert (= domestic_reinsurance_participation_ratio 0.0))
(assert (= dual_agency_disclosed_and_agreed false))
(assert (= dual_agency_disclosed_in_contract false))
(assert (= ethics_and_self_discipline_ok false))
(assert (= follow_ethics_and_self_discipline false))
(assert (= foreign_broker_approved_by_home_authority false))
(assert (= foreign_broker_deductible_rate 0.0))
(assert (= foreign_broker_insurance_period_uninterrupted 0))
(assert (= foreign_broker_professional_liability_insurance_aggregate_usd 0.0))
(assert (= foreign_broker_professional_liability_insurance_per_claim_usd 0.0))
(assert (= foreign_broker_qualified false))
(assert (= foreign_professional_reinsurance_credit_rating_level 0))
(assert (= foreign_reinsurance_credit_rating_level 0))
(assert (= foreign_reinsurance_licensed false))
(assert (= insured_and_insurer_consent false))
(assert (= internal_control_separated false))
(assert (= internal_control_separation_ok false))
(assert (= legal_reinsurance_organization false))
(assert (= major_financial_info_notified false))
(assert (= not_qualified_reinsurance_object false))
(assert (= notify_original_insurer_after_effective_ok false))
(assert (= original_insurer_approval false))
(assert (= other_approved_institutions false))
(assert (= other_approved_reinsurance_organization false))
(assert (= qualified_reinsurance_object false))
(assert (= qualified_reinsurance_object_14th_article false))
(assert (= registered_professional_reinsurance_company false))
(assert (= reinsurance_confirmation_before_effective_ok false))
(assert (= reinsurance_contract_effective false))
(assert (= reinsurance_contract_effective_date 0))
(assert (= reinsurance_credit_rating_level 0))
(assert (= reinsurance_credit_rating_ok false))
(assert (= reinsurance_documents_retained false))
(assert (= reinsurance_info_delivered false))
(assert (= reinsurance_info_delivery_date 0))
(assert (= reinsurance_risk_management_plan_arranged false))
(assert (= reinsurance_terms_delivered false))
(assert (= reinsurance_written_delegation false))
(assert (= reinsurance_written_delegation_ok false))
(assert (= required_credit_rating_level 0))
(assert (= risk_management_plan_compliance false))
(assert (= severe_violation false))
(assert (= signed_contract_delivered false))
(assert (= signed_contract_delivered_within_60_days false))
(assert (= signed_contract_delivery_date 0))
(assert (= temporary_non_proportional_reinsurance_ok false))
(assert (= temporary_non_proportional_reinsurance_violation false))
(assert (= treaty_reinsurance false))
(assert (= violate_163_4_financial_or_business_management false))
(assert (= violate_163_7 false))
(assert (= violate_165_1_or_163_5_applied false))
(assert (= violation_severity_major false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 26
; Total variables: 72
; Total facts: 72
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
