; SMT2 file generated from compliance case automatic
; Case ID: case_138
; Generated at: 2025-10-19T09:00:46.522953
;
; This file can be executed with Z3:
;   z3 case_138.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_by_authority Bool)
(declare-const approved_foreign_investment_quota Bool)
(declare-const bond_investment_limit_1_ok Bool)
(declare-const bond_investment_limit_2_ok Bool)
(declare-const bond_investment_limit_3_ok Bool)
(declare-const bond_investment_limit_4_ok Bool)
(declare-const bond_investment_limit_5_ok Bool)
(declare-const bond_rating_compliance_ok Bool)
(declare-const bond_rating_level Int)
(declare-const bond_rating_substitute_used Bool)
(declare-const conflict_of_interest Bool)
(declare-const credit_rating_agency Bool)
(declare-const credit_rating_minimum_acceptable_level Int)
(declare-const credit_rating_minimum_investment_level Int)
(declare-const foreign_broker_approved_by_home_authority Bool)
(declare-const foreign_broker_insurance_period_continuous Bool)
(declare-const foreign_broker_professional_liability_deductible_rate Real)
(declare-const foreign_broker_professional_liability_insurance_amount_usd Real)
(declare-const foreign_broker_qualification_ok Bool)
(declare-const internal_control_segregation_established Bool)
(declare-const internal_control_segregation_ok Bool)
(declare-const investment_amount_bb_plus Real)
(declare-const investment_amount_bbb_level Real)
(declare-const investment_amount_bbb_minus Real)
(declare-const investment_amount_per_company Real)
(declare-const investment_amount_specified_securities Real)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const reinsurance_accepted_by_original_insurer Bool)
(declare-const reinsurance_complete_contract_delivered Bool)
(declare-const reinsurance_complete_contract_delivery_ok Bool)
(declare-const reinsurance_conditions_compliance_ok Bool)
(declare-const reinsurance_conditions_compliant Bool)
(declare-const reinsurance_confirmation_document_obtained Bool)
(declare-const reinsurance_contract_documents_delivered Bool)
(declare-const reinsurance_contract_documents_delivery_ok Bool)
(declare-const reinsurance_credit_rating_level Int)
(declare-const reinsurance_credit_rating_ok Bool)
(declare-const reinsurance_document_preservation_ok Bool)
(declare-const reinsurance_documents_preserved Bool)
(declare-const reinsurance_dual_business_disclosure_made Bool)
(declare-const reinsurance_dual_business_disclosure_ok Bool)
(declare-const reinsurance_information_delivered Bool)
(declare-const reinsurance_information_delivery_ok Bool)
(declare-const reinsurance_market_info_notification_ok Bool)
(declare-const reinsurance_market_info_notified Bool)
(declare-const reinsurance_pre_contract_documents_obtained Bool)
(declare-const reinsurance_written_delegation_obtained Bool)
(declare-const reinsurance_written_delegation_ok Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [brokerage:internal_control_segregation] 經紀人公司內部控制制度及處理程序應區隔且無利益衝突
(assert (= internal_control_segregation_ok
   (and internal_control_segregation_established (not conflict_of_interest))))

; [brokerage:reinsurance_written_delegation] 經紀人公司經營再保險經紀業務應取得原保險人書面委任
(assert (= reinsurance_written_delegation_ok reinsurance_written_delegation_obtained))

; [brokerage:reinsurance_credit_rating_ok] 再保險人信用評等等級符合規定且原保險人同意
(assert (= reinsurance_credit_rating_ok
   (and (<= 3 reinsurance_credit_rating_level)
        reinsurance_accepted_by_original_insurer)))

; [brokerage:reinsurance_dual_business_disclosure] 同時受託辦理保險經紀及再保險經紀業務事項已載明於委任契約或文件
(assert (= reinsurance_dual_business_disclosure_ok
   reinsurance_dual_business_disclosure_made))

; [brokerage:reinsurance_pre_contract_documents_obtained] 原保險契約生效前取得再保險人確認認受文件
(assert (= reinsurance_pre_contract_documents_obtained
   reinsurance_confirmation_document_obtained))

; [brokerage:reinsurance_information_delivery] 原保險契約生效前交付再保險相關重大資訊予原保險人
(assert (= reinsurance_information_delivery_ok reinsurance_information_delivered))

; [brokerage:reinsurance_contract_documents_delivery] 再保險契約生效日起60日內交付再保險人簽署契約文件予原保險人
(assert (= reinsurance_contract_documents_delivery_ok
   reinsurance_contract_documents_delivered))

; [brokerage:reinsurance_complete_contract_delivery] 合約再保險於生效日起6個月內交付完整再保險契約書面文件予原保險人
(assert (= reinsurance_complete_contract_delivery_ok
   reinsurance_complete_contract_delivered))

; [brokerage:reinsurance_document_preservation] 完整保存再保險相關證明文件供主管機關查核
(assert (= reinsurance_document_preservation_ok reinsurance_documents_preserved))

; [brokerage:foreign_broker_qualification] 委任國外經紀人符合資格條件
(assert (= foreign_broker_qualification_ok
   (and foreign_broker_approved_by_home_authority
        (<= 5000000.0
            foreign_broker_professional_liability_insurance_amount_usd)
        (>= 5.0 foreign_broker_professional_liability_deductible_rate)
        foreign_broker_insurance_period_continuous)))

; [brokerage:reinsurance_market_info_notification] 再保險合約生效後通知原保險人影響再保險人財務業務之重大資訊
(assert (= reinsurance_market_info_notification_ok reinsurance_market_info_notified))

; [brokerage:reinsurance_conditions_compliance] 再保險條件及各再保費率符合保險業辦理再保險分出分入及其他危險分散機制管理辦法第10及11條規定
(assert (= reinsurance_conditions_compliance_ok reinsurance_conditions_compliant))

; [credit_rating:minimum_acceptable_level] 再保險人信用評等等級符合最低標準（1=BBB/B++/Baa2/twA+等級）
(assert (= credit_rating_minimum_acceptable_level (ite credit_rating_agency 3 0)))

; [credit_rating:minimum_investment_level] 投資項目信用評等等級符合最低投資標準（1=A/A/A2/twAA+等級）
(assert (= credit_rating_minimum_investment_level (ite credit_rating_agency 5 0)))

; [investment:bond_rating_compliance] 債券發行評等等級符合規定
(assert (= bond_rating_compliance_ok
   (or (<= 4 bond_rating_level)
       (and (>= 3 bond_rating_level) bond_rating_substitute_used))))

; [investment:bond_investment_limit_1] 投資於BB+級債券總額不超過核定國外投資額度2%
(assert (= bond_investment_limit_1_ok
   (<= investment_amount_bb_plus
       (ite approved_foreign_investment_quota (/ 1.0 50.0) 0.0))))

; [investment:bond_investment_limit_2] 投資於BB+及BBB-級債券總額不超過核定國外投資額度7.5%或業主權益30%較高者
(assert (let ((a!1 (<= (+ investment_amount_bb_plus investment_amount_bbb_minus)
               (ite (>= (ite approved_foreign_investment_quota (/ 3.0 40.0) 0.0)
                        (* (/ 3.0 10.0) owner_equity))
                    (ite approved_foreign_investment_quota (/ 3.0 40.0) 0.0)
                    (* (/ 3.0 10.0) owner_equity)))))
  (= bond_investment_limit_2_ok a!1)))

; [investment:bond_investment_limit_3] 投資於債券發行評等為BBB、BBB-、BB+級之每一公司發行或保證債券總額不超過業主權益10%
(assert (= bond_investment_limit_3_ok
   (<= investment_amount_per_company (* (/ 1.0 10.0) owner_equity))))

; [investment:bond_investment_limit_4] 投資於第一項第一款、第二款、第四款有價證券總額不超過核定國外投資總額40%
(assert (= bond_investment_limit_4_ok
   (<= investment_amount_specified_securities
       (ite approved_foreign_investment_quota (/ 2.0 5.0) 0.0))))

; [investment:bond_investment_limit_5] 符合主管機關條件者，投資BBB、BBB-級公司債額度不超過核定國外投資額度3%或業主權益18%較高者
(assert (let ((a!1 (<= investment_amount_bbb_level
               (ite (>= (ite approved_foreign_investment_quota
                             (/ 3.0 100.0)
                             0.0)
                        (* (/ 9.0 50.0) owner_equity))
                    (ite approved_foreign_investment_quota (/ 3.0 100.0) 0.0)
                    (* (/ 9.0 50.0) owner_equity)))))
  (= bond_investment_limit_5_ok (or (not approved_by_authority) a!1))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一經紀人公司管理規定或再保險經紀業務規定時處罰
(assert (= penalty
   (or (not bond_investment_limit_2_ok)
       (not foreign_broker_qualification_ok)
       (not reinsurance_written_delegation_ok)
       (not reinsurance_conditions_compliance_ok)
       (not internal_control_segregation_ok)
       (not bond_rating_compliance_ok)
       (not bond_investment_limit_3_ok)
       (not reinsurance_credit_rating_ok)
       (not reinsurance_contract_documents_delivery_ok)
       (not bond_investment_limit_1_ok)
       (and approved_by_authority (not bond_investment_limit_5_ok))
       (not reinsurance_complete_contract_delivery_ok)
       (not reinsurance_dual_business_disclosure_ok)
       (not reinsurance_market_info_notification_ok)
       (not reinsurance_document_preservation_ok)
       (not reinsurance_information_delivery_ok)
       (not reinsurance_pre_contract_documents_obtained)
       (not bond_investment_limit_4_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= reinsurance_confirmation_document_obtained false))
(assert (= reinsurance_written_delegation_obtained true))
(assert (= internal_control_segregation_established true))
(assert (= conflict_of_interest false))
(assert (= reinsurance_accepted_by_original_insurer true))
(assert (= reinsurance_dual_business_disclosure_made true))
(assert (= reinsurance_information_delivered true))
(assert (= reinsurance_contract_documents_delivered true))
(assert (= reinsurance_complete_contract_delivered true))
(assert (= reinsurance_documents_preserved true))
(assert (= foreign_broker_approved_by_home_authority true))
(assert (= foreign_broker_professional_liability_insurance_amount_usd 5000000.0))
(assert (= foreign_broker_professional_liability_deductible_rate 5.0))
(assert (= foreign_broker_insurance_period_continuous true))
(assert (= bond_rating_level 4))
(assert (= bond_rating_substitute_used false))
(assert (= approved_by_authority false))
(assert (= approved_foreign_investment_quota false))
(assert (= investment_amount_bb_plus 0.0))
(assert (= investment_amount_bbb_minus 0.0))
(assert (= investment_amount_per_company 0.0))
(assert (= investment_amount_specified_securities 0.0))
(assert (= investment_amount_bbb_level 0.0))
(assert (= bond_investment_limit_1_ok false))
(assert (= bond_investment_limit_2_ok false))
(assert (= bond_investment_limit_3_ok false))
(assert (= bond_investment_limit_4_ok false))
(assert (= bond_investment_limit_5_ok false))
(assert (= bond_rating_compliance_ok false))
(assert (= credit_rating_agency false))
(assert (= credit_rating_minimum_acceptable_level 0))
(assert (= credit_rating_minimum_investment_level 0))
(assert (= foreign_broker_qualification_ok false))
(assert (= internal_control_segregation_ok false))
(assert (= owner_equity 0.0))
(assert (= penalty false))
(assert (= reinsurance_complete_contract_delivery_ok false))
(assert (= reinsurance_conditions_compliance_ok false))
(assert (= reinsurance_conditions_compliant false))
(assert (= reinsurance_contract_documents_delivery_ok false))
(assert (= reinsurance_credit_rating_level 0))
(assert (= reinsurance_credit_rating_ok false))
(assert (= reinsurance_document_preservation_ok false))
(assert (= reinsurance_dual_business_disclosure_ok false))
(assert (= reinsurance_information_delivery_ok false))
(assert (= reinsurance_market_info_notification_ok false))
(assert (= reinsurance_market_info_notified false))
(assert (= reinsurance_pre_contract_documents_obtained false))
(assert (= reinsurance_written_delegation_ok false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 49
; Total facts: 49
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
