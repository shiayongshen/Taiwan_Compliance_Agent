; SMT2 file generated from compliance case automatic
; Case ID: case_319
; Generated at: 2025-10-19T13:01:28.203143
;
; This file can be executed with Z3:
;   z3 case_319.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_and_reporting_compliance Bool)
(declare-const act_authorize_others_to_operate Bool)
(declare-const act_contract_with_unapproved_insurer Bool)
(declare-const act_criminal_conviction Bool)
(declare-const act_damage_insurance_image Bool)
(declare-const act_disturb_financial_order Bool)
(declare-const act_employ_unqualified_personnel Bool)
(declare-const act_fail_to_appoint_broker_according_to_regulation Bool)
(declare-const act_fail_to_cancel_license_in_time Bool)
(declare-const act_fail_to_confirm_suitability Bool)
(declare-const act_fail_to_report_to_broker_association Bool)
(declare-const act_false_advertisement Bool)
(declare-const act_false_license_application Bool)
(declare-const act_false_or_incomplete_report Bool)
(declare-const act_force_or_induce_unfairly Bool)
(declare-const act_hide_important_contract_info Bool)
(declare-const act_illegal_fee_collection Bool)
(declare-const act_illegal_insurance_payment Bool)
(declare-const act_improper_commission_payment Bool)
(declare-const act_induce_policy_surrender_or_loan Bool)
(declare-const act_misappropriate_insurance_funds Bool)
(declare-const act_other_violations Bool)
(declare-const act_out_of_scope_business Bool)
(declare-const act_sell_unapproved_foreign_policy_discount_benefit Bool)
(declare-const act_transfer_application_documents_without_consent Bool)
(declare-const act_unauthorized_suspension_or_dissolution Bool)
(declare-const act_unauthorized_use_of_license Bool)
(declare-const act_use_advertisement_without_consent Bool)
(declare-const agent_type Int)
(declare-const annual_report_submitted Bool)
(declare-const authority_inspection_complied Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permitted Bool)
(declare-const board_resolution_reported_within_1_month Bool)
(declare-const broker_cancellation_registered_within_30_days Bool)
(declare-const broker_license_returned Bool)
(declare-const business_operation_change_report Bool)
(declare-const company_license_returned Bool)
(declare-const dissolution_application_submitted Bool)
(declare-const dissolution_not_returned Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_care_and_fidelity Bool)
(declare-const duty_of_fidelity Bool)
(declare-const extension_count Int)
(declare-const extension_requested Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosed Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_deposit_minimum Real)
(declare-const improvement_followup_reported Bool)
(declare-const improvement_measures_implemented Bool)
(declare-const insurance_agent_or_broker_permitted Bool)
(declare-const insurance_fee_collection_compliance Bool)
(declare-const insurance_fee_payer_not_related Bool)
(declare-const insurance_fee_total_remitted Real)
(declare-const insurance_type Int)
(declare-const license_and_insurance_compliance Bool)
(declare-const license_cancellation_and_certificate_return Bool)
(declare-const license_permitted Bool)
(declare-const license_revoked Bool)
(declare-const management_rules_compliance Bool)
(declare-const management_rules_complied Bool)
(declare-const minimum_guarantee_and_insurance_amount_set Bool)
(declare-const minimum_guarantee_and_insurance_amount_set_by_authority Bool)
(declare-const payer_declaration_provided Bool)
(declare-const penalty Bool)
(declare-const practice_license_held Bool)
(declare-const prohibited_acts_compliance Bool)
(declare-const provide_written_analysis_report_and_disclose_fee Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const relevant_insurance_type_compliance Bool)
(declare-const reopen_application_submitted Bool)
(declare-const report_and_registration_compliance Bool)
(declare-const report_to_authority Bool)
(declare-const special_account_book_kept Bool)
(declare-const stop_business Bool)
(declare-const stop_business_application_submitted Bool)
(declare-const stop_business_duration Int)
(declare-const stop_business_not_returned Bool)
(declare-const stop_insurance_brokerage Bool)
(declare-const stop_reinsurance_brokerage Bool)
(declare-const violate_163_5_rule Bool)
(declare-const violate_165_1_rule Bool)
(declare-const violate_business_management_rule Bool)
(declare-const violate_financial_management_rule Bool)
(declare-const violation_financial_or_business_management_rules Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_agent:license_and_insurance_compliance] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_insurance_compliance
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_deposit_minimum)
        relevant_insurance_covered
        practice_license_held)))

; [insurance_agent:relevant_insurance_type_compliance] 相關保險類型依身份區分：保險代理人、公證人為責任保險；保險經紀人為責任保險及保證保險
(assert (let ((a!1 (or (and (= 3 agent_type) (= 1 insurance_type))
               (and (= 1 agent_type) (= 1 insurance_type))
               (and (= 2 agent_type)
                    (or (= 1 insurance_type) (= 2 insurance_type))))))
  (= relevant_insurance_type_compliance a!1)))

; [insurance_agent:minimum_guarantee_and_insurance_amount_set_by_authority] 主管機關依經營業務範圍及規模定最低繳存保證金及投保相關保險金額
(assert (= minimum_guarantee_and_insurance_amount_set_by_authority
   minimum_guarantee_and_insurance_amount_set))

; [insurance_agent:management_rules_compliance] 保險代理人、經紀人、公證人之資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他應遵行事項依主管機關管理規則
(assert (= management_rules_compliance management_rules_complied))

; [bank:insurance_agent_or_broker_permitted] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= insurance_agent_or_broker_permitted
   (and bank_permitted (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance_broker:duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約或提供服務，並負忠實義務
(assert (= duty_of_care_and_fidelity (and duty_of_care duty_of_fidelity)))

; [insurance_broker:provide_written_analysis_report_and_disclose_fee] 保險經紀人洽訂保險契約前，於主管機關指定範圍內，主動提供書面分析報告，收取報酬者明確告知報酬標準
(assert (= provide_written_analysis_report_and_disclose_fee
   (and written_analysis_report_provided (or (not fee_charged) fee_disclosed))))

; [insurance_broker:violation_financial_or_business_management_rules] 違反保險法第163條第四項管理規則中財務或業務管理規定、同條第七項規定，或違反第165條第一項或第163條第五項準用規定者，應限期改正或處罰
(assert (= violation_financial_or_business_management_rules
   (or violate_financial_management_rule
       violate_163_5_rule
       violate_165_1_rule
       violate_business_management_rule)))

; [insurance_broker_company:report_and_registration_compliance] 經紀人公司停業、復業、解散應依規定申請核准並辦理登記，停業期間一年內，正當理由得申請展延一次，未申請復業並任用經紀人者廢止許可並註銷執業證照
(assert (let ((a!1 (not (and stop_business (not (<= stop_business_duration 365))))))
(let ((a!2 (and report_to_authority
                (or (and extension_requested (>= 1 extension_count))
                    (not stop_business)
                    (>= 365 stop_business_duration))
                (or reopen_application_submitted a!1)
                (or reopen_application_submitted license_revoked))))
  (= report_and_registration_compliance a!2))))

; [insurance_broker_company:license_cancellation_and_certificate_return] 經紀人公司申請停業應繳銷經紀人執業證照，申請解散應繳銷經紀人及公司執業證照，未繳銷者經紀人應於30日內委由公會辦理註銷登記
(assert (let ((a!1 (and (or broker_license_returned
                    (not stop_business_application_submitted))
                (or (not dissolution_application_submitted)
                    (and broker_license_returned company_license_returned))
                (or (not (or stop_business_not_returned
                             license_revoked
                             dissolution_not_returned))
                    broker_cancellation_registered_within_30_days))))
  (= license_cancellation_and_certificate_return a!1)))

; [insurance_broker_company:business_operation_change_report] 同時經營保險經紀及再保險經紀業務之公司停止其中一業務，應於一個月內檢具董事會或股東會議事錄報主管機關備查
(assert (= business_operation_change_report
   (or (not (or stop_insurance_brokerage stop_reinsurance_brokerage))
       board_resolution_reported_within_1_month)))

; [insurance_broker:insurance_fee_collection_compliance] 個人執業經紀人、經紀人公司及銀行受要保人委託代收轉付保險費應直接總額解繳保險業，非本人被保險人及受益人名義票據須有聲明書
(assert (= insurance_fee_collection_compliance
   (and (= insurance_fee_total_remitted 1.0)
        (or payer_declaration_provided (not insurance_fee_payer_not_related)))))

; [insurance_broker:accounting_and_reporting_compliance] 個人執業經紀人、經紀人公司及銀行應專設帳簿記載業務收支，並於每年4/1至5/31彙報主管機關，主管機關得隨時檢查並要求限期報告，應確實辦理改善並持續追蹤覆查
(assert (= accounting_and_reporting_compliance
   (and special_account_book_kept
        annual_report_submitted
        authority_inspection_complied
        improvement_measures_implemented
        improvement_followup_reported)))

; [insurance_broker:prohibited_acts_compliance] 個人執業經紀人、經紀人公司、銀行及受任用經紀人不得有申領證照不實、洽訂未核准保險、隱匿重要事項、不當強迫或索取利益、不實宣傳、不當慫恿退保、挪用保險費、證照供他人使用、刑事宣告、超範圍經營、不當收費、不法保險給付、擾亂金融秩序、授權他人經營、未經同意轉報要保文件、聘用無資格人員、未依期限繳銷證照、擅自停業或解散、未依規定任用經紀人、未報備、未經同意使用廣告、佣酬支付不當、未確認適合度、銷售未許可商品、報表不實、其他違規及損保險形象行為
(assert (not (= (or act_illegal_fee_collection
            act_out_of_scope_business
            act_other_violations
            act_hide_important_contract_info
            act_induce_policy_surrender_or_loan
            act_criminal_conviction
            act_sell_unapproved_foreign_policy_discount_benefit
            act_fail_to_appoint_broker_according_to_regulation
            act_fail_to_cancel_license_in_time
            act_force_or_induce_unfairly
            act_contract_with_unapproved_insurer
            act_false_or_incomplete_report
            act_illegal_insurance_payment
            act_false_license_application
            act_damage_insurance_image
            act_use_advertisement_without_consent
            act_disturb_financial_order
            act_improper_commission_payment
            act_misappropriate_insurance_funds
            act_employ_unqualified_personnel
            act_false_advertisement
            act_fail_to_confirm_suitability
            act_unauthorized_suspension_or_dissolution
            act_unauthorized_use_of_license
            act_authorize_others_to_operate
            act_transfer_application_documents_without_consent
            act_fail_to_report_to_broker_association)
        prohibited_acts_compliance)))

; [meta:penalty_default_false] 預設不處罰
(assert (or (not penalty)
    (not (and license_and_insurance_compliance
              relevant_insurance_type_compliance
              minimum_guarantee_and_insurance_amount_set_by_authority
              management_rules_compliance
              insurance_agent_or_broker_permitted
              duty_of_care_and_fidelity
              provide_written_analysis_report_and_disclose_fee
              (not violation_financial_or_business_management_rules)
              report_and_registration_compliance
              license_cancellation_and_certificate_return
              business_operation_change_report
              insurance_fee_collection_compliance
              accounting_and_reporting_compliance
              prohibited_acts_compliance))))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險投保、執業證照、管理規則、財務或業務管理規定，或有禁止行為時處罰
(assert (= penalty
   (or (not accounting_and_reporting_compliance)
       (not report_and_registration_compliance)
       violation_financial_or_business_management_rules
       (not business_operation_change_report)
       (not prohibited_acts_compliance)
       (not insurance_agent_or_broker_permitted)
       (not provide_written_analysis_report_and_disclose_fee)
       (not insurance_fee_collection_compliance)
       (not duty_of_care_and_fidelity)
       (not license_and_insurance_compliance)
       (not minimum_guarantee_and_insurance_amount_set_by_authority)
       (not relevant_insurance_type_compliance)
       (not license_cancellation_and_certificate_return)
       (not management_rules_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted false))
(assert (= guarantee_deposit_amount 0.0))
(assert (= guarantee_deposit_minimum 1000000.0))
(assert (= relevant_insurance_covered false))
(assert (= practice_license_held false))
(assert (= agent_type 2))
(assert (= insurance_type 1))
(assert (= management_rules_complied false))
(assert (= report_to_authority false))
(assert (= stop_business true))
(assert (= stop_business_duration 7))
(assert (= extension_requested false))
(assert (= extension_count 0))
(assert (= reopen_application_submitted false))
(assert (= license_revoked true))
(assert (= stop_business_application_submitted false))
(assert (= dissolution_application_submitted false))
(assert (= broker_license_returned false))
(assert (= company_license_returned false))
(assert (= stop_business_not_returned true))
(assert (= dissolution_not_returned false))
(assert (= board_resolution_reported_within_1_month false))
(assert (= bank_permitted false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= duty_of_care false))
(assert (= duty_of_fidelity false))
(assert (= duty_of_care_and_fidelity false))
(assert (= written_analysis_report_provided false))
(assert (= fee_charged false))
(assert (= fee_disclosed false))
(assert (= violate_financial_management_rule true))
(assert (= violate_business_management_rule true))
(assert (= violate_165_1_rule false))
(assert (= violate_163_5_rule false))
(assert (= violation_financial_or_business_management_rules true))
(assert (= report_and_registration_compliance false))
(assert (= license_cancellation_and_certificate_return false))
(assert (= business_operation_change_report false))
(assert (= insurance_fee_total_remitted 0.0))
(assert (= insurance_fee_payer_not_related false))
(assert (= payer_declaration_provided false))
(assert (= insurance_fee_collection_compliance false))
(assert (= special_account_book_kept false))
(assert (= annual_report_submitted false))
(assert (= authority_inspection_complied false))
(assert (= improvement_measures_implemented false))
(assert (= improvement_followup_reported false))
(assert (= accounting_and_reporting_compliance false))
(assert (= act_false_license_application false))
(assert (= act_contract_with_unapproved_insurer false))
(assert (= act_hide_important_contract_info false))
(assert (= act_force_or_induce_unfairly false))
(assert (= act_false_advertisement false))
(assert (= act_induce_policy_surrender_or_loan false))
(assert (= act_misappropriate_insurance_funds false))
(assert (= act_unauthorized_use_of_license false))
(assert (= act_criminal_conviction false))
(assert (= act_out_of_scope_business false))
(assert (= act_illegal_fee_collection false))
(assert (= act_illegal_insurance_payment false))
(assert (= act_disturb_financial_order false))
(assert (= act_authorize_others_to_operate false))
(assert (= act_transfer_application_documents_without_consent false))
(assert (= act_employ_unqualified_personnel false))
(assert (= act_fail_to_cancel_license_in_time false))
(assert (= act_unauthorized_suspension_or_dissolution true))
(assert (= act_fail_to_appoint_broker_according_to_regulation false))
(assert (= act_fail_to_report_to_broker_association false))
(assert (= act_use_advertisement_without_consent false))
(assert (= act_improper_commission_payment false))
(assert (= act_fail_to_confirm_suitability false))
(assert (= act_sell_unapproved_foreign_policy_discount_benefit false))
(assert (= act_false_or_incomplete_report false))
(assert (= act_other_violations false))
(assert (= act_damage_insurance_image false))
(assert (= prohibited_acts_compliance false))
(assert (= license_and_insurance_compliance false))
(assert (= relevant_insurance_type_compliance false))
(assert (= minimum_guarantee_and_insurance_amount_set false))
(assert (= minimum_guarantee_and_insurance_amount_set_by_authority false))
(assert (= management_rules_compliance false))
(assert (= insurance_agent_or_broker_permitted false))
(assert (= penalty true))
(assert (= provide_written_analysis_report_and_disclose_fee false))
(assert (= broker_cancellation_registered_within_30_days false))
(assert (= stop_insurance_brokerage false))
(assert (= stop_reinsurance_brokerage false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 88
; Total facts: 88
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
