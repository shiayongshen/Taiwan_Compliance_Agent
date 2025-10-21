; SMT2 file generated from compliance case automatic
; Case ID: case_138
; Generated at: 2025-10-21T02:49:46.169205
;
; This file can be executed with Z3:
;   z3 case_138.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const broker_follow_ethics Bool)
(declare-const broker_internal_control_segregation Bool)
(declare-const broker_reinsurance_contract_delivery Bool)
(declare-const broker_reinsurance_credit_rating_ok Bool)
(declare-const broker_reinsurance_document_preservation Bool)
(declare-const broker_reinsurance_dual_agency_disclosure Bool)
(declare-const broker_reinsurance_foreign_broker_qualification Bool)
(declare-const broker_reinsurance_info_delivery Bool)
(declare-const broker_reinsurance_market_info_notification Bool)
(declare-const broker_reinsurance_pre_contract_confirmation Bool)
(declare-const broker_reinsurance_written_delegation Bool)
(declare-const complete_reinsurance_contract_delivered_within_6_months Bool)
(declare-const conflict_of_interest Bool)
(declare-const contract_signed_documents_delivered_within_60_days Bool)
(declare-const credit_rating_level Int)
(declare-const dual_agency_disclosed_in_contract Bool)
(declare-const follow_ethics_and_self_discipline Bool)
(declare-const foreign_broker_approved_by_home_regulator Bool)
(declare-const foreign_broker_deductible_rate Real)
(declare-const foreign_broker_insurance_period_continuous Int)
(declare-const foreign_broker_professional_liability_insurance_amount_usd Real)
(declare-const internal_control_segregated Bool)
(declare-const notify_original_insurer_after_contract_effective Bool)
(declare-const original_insurer_agreed Bool)
(declare-const penalty Bool)
(declare-const reinsurance_condition_compliance Bool)
(declare-const reinsurance_conditions_and_rates_compliant Bool)
(declare-const reinsurance_documents_preserved Bool)
(declare-const reinsurance_info_delivered_before_contract_effective Bool)
(declare-const reinsurer_confirmation_document_obtained_before_contract_effective Bool)
(declare-const reinsurer_credit_rating_level Int)
(declare-const standard_and_poors_rating Int)
(declare-const written_delegation_from_original_insurer Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:broker_internal_control_segregation] 經紀人公司內部控制制度及處理程序應區隔且無利益衝突
(assert (= broker_internal_control_segregation
   (and internal_control_segregated (not conflict_of_interest))))

; [insurance:broker_follow_ethics] 經紀人公司遵循執業道德規範及自律規範
(assert (= broker_follow_ethics follow_ethics_and_self_discipline))

; [insurance:broker_reinsurance_written_delegation] 經紀人公司經營再保險經紀業務應取得原保險人書面委任
(assert (= broker_reinsurance_written_delegation
   written_delegation_from_original_insurer))

; [insurance:broker_reinsurance_credit_rating_ok] 再保險人信用評等等級符合規定且原保險人同意
(assert (= broker_reinsurance_credit_rating_ok
   (and (<= 1 reinsurer_credit_rating_level) original_insurer_agreed)))

; [insurance:broker_reinsurance_dual_agency_disclosure] 同時受託辦理保險經紀及再保險經紀業務事項載明於委任契約或文件
(assert (= broker_reinsurance_dual_agency_disclosure dual_agency_disclosed_in_contract))

; [insurance:broker_reinsurance_pre_contract_confirmation] 原保險契約生效前取得再保險人確認認受文件
(assert (= broker_reinsurance_pre_contract_confirmation
   reinsurer_confirmation_document_obtained_before_contract_effective))

; [insurance:broker_reinsurance_info_delivery] 原保險契約生效前交付再保險人相關重大資訊予原保險人
(assert (= broker_reinsurance_info_delivery
   reinsurance_info_delivered_before_contract_effective))

; [insurance:broker_reinsurance_contract_delivery] 再保險契約生效日起60日內交付再保險人簽署契約文件，合約再保險於6個月內交付完整契約書面文件
(assert (= broker_reinsurance_contract_delivery
   (and contract_signed_documents_delivered_within_60_days
        complete_reinsurance_contract_delivered_within_6_months)))

; [insurance:broker_reinsurance_document_preservation] 完整保存再保險相關證明文件備供主管機關查核
(assert (= broker_reinsurance_document_preservation reinsurance_documents_preserved))

; [insurance:broker_reinsurance_foreign_broker_qualification] 委任符合資格之國外經紀人安排再保險業務
(assert (= broker_reinsurance_foreign_broker_qualification
   (and foreign_broker_approved_by_home_regulator
        (<= 5000000.0
            foreign_broker_professional_liability_insurance_amount_usd)
        (>= 5.0 foreign_broker_deductible_rate)
        (= foreign_broker_insurance_period_continuous 1))))

; [insurance:broker_reinsurance_market_info_notification] 再保險合約生效後通知原保險人影響再保險人財務業務之重大資訊
(assert (= broker_reinsurance_market_info_notification
   notify_original_insurer_after_contract_effective))

; [insurance:reinsurance_condition_compliance] 再保險條件及各再保費率符合管理辦法第10及11條規定
(assert (= reinsurance_condition_compliance reinsurance_conditions_and_rates_compliant))

; [insurance:credit_rating_level] 國際信用評等機構評等達一定等級分類（1=達標準普爾BBB等級, 2=達標準普爾A等級, 0=未達標準）
(assert (= credit_rating_level
   (ite (<= 3 standard_and_poors_rating)
        1
        (ite (<= 4 standard_and_poors_rating) 2 0))))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反保險法第167-2條及相關管理規則規定時處罰
(assert (= penalty
   (or (not broker_reinsurance_written_delegation)
       (not broker_reinsurance_info_delivery)
       (not broker_internal_control_segregation)
       (not broker_reinsurance_credit_rating_ok)
       (not broker_reinsurance_document_preservation)
       (not broker_follow_ethics)
       (not broker_reinsurance_dual_agency_disclosure)
       (not reinsurance_condition_compliance)
       (not broker_reinsurance_foreign_broker_qualification)
       (not broker_reinsurance_contract_delivery)
       (not broker_reinsurance_pre_contract_confirmation)
       (not broker_reinsurance_market_info_notification))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= broker_follow_ethics true))
(assert (= internal_control_segregated true))
(assert (= conflict_of_interest false))
(assert (= broker_internal_control_segregation true))
(assert (= written_delegation_from_original_insurer false))
(assert (= broker_reinsurance_written_delegation false))
(assert (= reinsurer_confirmation_document_obtained_before_contract_effective false))
(assert (= broker_reinsurance_pre_contract_confirmation false))
(assert (= reinsurance_info_delivered_before_contract_effective true))
(assert (= broker_reinsurance_info_delivery true))
(assert (= contract_signed_documents_delivered_within_60_days true))
(assert (= complete_reinsurance_contract_delivered_within_6_months true))
(assert (= broker_reinsurance_contract_delivery true))
(assert (= reinsurance_documents_preserved true))
(assert (= broker_reinsurance_document_preservation true))
(assert (= foreign_broker_approved_by_home_regulator true))
(assert (= foreign_broker_professional_liability_insurance_amount_usd 5000000.0))
(assert (= foreign_broker_deductible_rate 5.0))
(assert (= foreign_broker_insurance_period_continuous 7))
(assert (= broker_reinsurance_foreign_broker_qualification true))
(assert (= reinsurer_credit_rating_level 2))
(assert (= original_insurer_agreed true))
(assert (= broker_reinsurance_credit_rating_ok true))
(assert (= dual_agency_disclosed_in_contract true))
(assert (= broker_reinsurance_dual_agency_disclosure true))
(assert (= notify_original_insurer_after_contract_effective true))
(assert (= broker_reinsurance_market_info_notification true))
(assert (= reinsurance_conditions_and_rates_compliant true))
(assert (= reinsurance_condition_compliance true))
(assert (= penalty true))
(assert (= follow_ethics_and_self_discipline true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 33
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
