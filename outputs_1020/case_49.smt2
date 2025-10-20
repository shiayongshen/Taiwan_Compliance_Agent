; SMT2 file generated from compliance case automatic
; Case ID: case_49
; Generated at: 2025-10-19T06:39:28.776809
;
; This file can be executed with Z3:
;   z3 case_49.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_and_guarantee Bool)
(declare-const agent_type Int)
(declare-const authority_inspection_and_report_request Bool)
(declare-const authorize_others_to_operate Bool)
(declare-const bank_engage_agent Bool)
(declare-const bank_engage_broker Bool)
(declare-const bank_permit_granted Bool)
(declare-const bank_permitted_to_engage_agent_or_broker Bool)
(declare-const board_resolution_reported Bool)
(declare-const books_kept Bool)
(declare-const broker_annual_financial_report_submitted Bool)
(declare-const broker_cancel_certificate_within_30_days Bool)
(declare-const broker_certificate_cancellation_days Int)
(declare-const broker_certificate_cancellation_reported Bool)
(declare-const broker_certificates_cancelled Bool)
(declare-const broker_company_cancel_certificates Bool)
(declare-const broker_company_reappoint_broker_after_resume Bool)
(declare-const broker_company_report_stop_business_within_one_month Bool)
(declare-const broker_company_status_reported Bool)
(declare-const broker_company_stop_business_within_limit Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_due_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_improvement_and_reporting_done Bool)
(declare-const broker_reappointed Bool)
(declare-const broker_written_report_and_fee_disclosed Bool)
(declare-const charge_unapproved_fees_or_commissions Bool)
(declare-const coerce_or_induce_unfair_contract Bool)
(declare-const company_certificate_cancelled Bool)
(declare-const company_dissolution Bool)
(declare-const company_license_revoked Bool)
(declare-const company_stop_business Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const criminal_conviction_for_fraud_or_breach Bool)
(declare-const dissolution_applied Bool)
(declare-const dissolution_reported Bool)
(declare-const employ_unqualified_insurance_agents Bool)
(declare-const extension_application_days_before_expiry Int)
(declare-const extension_applied Bool)
(declare-const extension_count Int)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_suitability_for_elderly Bool)
(declare-const fail_to_fill_out_recruitment_report_truthfully Bool)
(declare-const fail_to_reappoint_broker_after_resignation Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_or_incomplete_financial_reports Bool)
(declare-const false_report_on_license_application Bool)
(declare-const fee_charged Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const financial_report_submitted Bool)
(declare-const follow_up_tracking_done Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_minimum_amount Real)
(declare-const guarantee_minimum_amount_defined Bool)
(declare-const guarantee_minimum_amount_defined_by_authority Bool)
(declare-const hold_positions_in_insurance_or_association Bool)
(declare-const illegal_insurance_payments Bool)
(declare-const induce_contract_termination_or_loan Bool)
(declare-const induce_policyholder_to_cancel_or_loan Bool)
(declare-const inspection_conducted Bool)
(declare-const inspection_findings_improved Bool)
(declare-const insurance_brokerage_stopped Bool)
(declare-const insurance_type Int)
(declare-const license_permitted Bool)
(declare-const management_rules_defined Bool)
(declare-const management_rules_set_by_authority Bool)
(declare-const misappropriate_insurance_funds Bool)
(declare-const misleading_promotion_or_recruitment Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_acts_damaging_insurance_image Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_agents Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const prohibited_conducts_absent Bool)
(declare-const reinsurance_brokerage_stopped Bool)
(declare-const relevant_insurance_covered Bool)
(declare-const report_days_after_stop Int)
(declare-const report_request_issued Bool)
(declare-const report_submission_date Int)
(declare-const report_submitted_to_authority Bool)
(declare-const resume_business_applied Bool)
(declare-const resume_business_reported Bool)
(declare-const sell_unapproved_foreign_policy_discount_products Bool)
(declare-const spread_false_information Bool)
(declare-const stop_business_applied Bool)
(declare-const stop_business_duration_days Int)
(declare-const stop_business_reported Bool)
(declare-const transfer_documents_to_unaffiliated_agents Bool)
(declare-const unauthorized_advertisement Bool)
(declare-const unauthorized_stop_or_resume_or_dissolution Bool)
(declare-const use_license_for_others Bool)
(declare-const violate_article_163_5 Bool)
(declare-const violate_article_165_1 Bool)
(declare-const violate_business_management_rule Bool)
(declare-const violate_financial_management_rule Bool)
(declare-const violation_financial_or_business_management_rules Bool)
(declare-const written_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= agent_license_and_guarantee
   (and license_permitted
        (>= guarantee_deposit_amount guarantee_minimum_amount)
        relevant_insurance_covered
        practice_certificate_held)))

; [insurance:relevant_insurance_type] 相關保險類型依保險代理人、公證人為責任保險，保險經紀人為責任保險及保證保險
(assert (let ((a!1 (or (and (= 1 agent_type) (= 1 insurance_type))
               (and (= 2 agent_type)
                    (or (= 1 insurance_type) (= 2 insurance_type)))
               (and (= 3 agent_type) (= 1 insurance_type)))))
  (= relevant_insurance_covered a!1)))

; [insurance:guarantee_minimum_amount_defined] 主管機關定最低保證金及投保相關保險金額及實施方式
(assert (= guarantee_minimum_amount_defined
   (= guarantee_minimum_amount
      (ite guarantee_minimum_amount_defined_by_authority 1.0 0.0))))

; [insurance:management_rules_defined] 主管機關定保險代理人、經紀人、公證人資格取得、申請許可條件、程序、文件、董事監察人資格、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則
(assert (= management_rules_defined management_rules_set_by_authority))

; [insurance:bank_permitted_to_engage_agent_or_broker] 銀行經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permitted_to_engage_agent_or_broker
   (and bank_permit_granted (or bank_engage_agent bank_engage_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約或提供服務，並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_due_care broker_fulfill_fidelity)))

; [insurance:broker_must_provide_written_report_and_disclose_fee] 保險經紀人洽訂保險契約前，於主管機關指定範圍內，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_written_report_and_fee_disclosed
   (and written_report_provided (or fee_standard_disclosed (not fee_charged)))))

; [insurance:violation_financial_or_business_management_rules] 違反保險法第163條第四項管理規則中財務或業務管理規定、同條第七項規定，或違反第165條第一項或第163條第五項準用規定者，應限期改正或處罰
(assert (= violation_financial_or_business_management_rules
   (or violate_article_165_1
       violate_article_163_5
       violate_financial_management_rule
       violate_business_management_rule)))

; [insurance:broker_company_must_report_status] 經紀人公司停業、復業、解散等情事應報主管機關核准並辦理登記
(assert (= broker_company_status_reported
   (or dissolution_reported resume_business_reported stop_business_reported)))

; [insurance:broker_company_stop_business_limit_and_extension] 經紀人公司停業期間以一年為限，得申請一次展延，應於屆滿前十五日提出
(assert (= broker_company_stop_business_within_limit
   (and (>= 365 stop_business_duration_days)
        (or (not extension_applied) (= 1 extension_count))
        (or (not extension_applied)
            (>= 15 extension_application_days_before_expiry)))))

; [insurance:broker_company_must_reappoint_broker_after_resume] 經紀人公司停業屆滿未申請復業並依規定任用經紀人者，主管機關廢止許可並註銷執業證照
(assert (= broker_company_reappoint_broker_after_resume
   (or resume_business_applied (not broker_reappointed))))

; [insurance:broker_company_must_cancel_certificates_on_stop_or_dissolution] 經紀人公司申請停業或解散，應繳銷所任用經紀人及公司執業證照
(assert (= broker_company_cancel_certificates
   (or (not (or stop_business_applied dissolution_applied))
       (and broker_certificates_cancelled company_certificate_cancelled))))

; [insurance:broker_must_cancel_certificate_within_30_days_after_company_stop_or_dissolution] 經紀人公司停業、解散或主管機關註銷公司執業證照後30日內，受任用經紀人應委由公會辦理註銷登記
(assert (= broker_cancel_certificate_within_30_days
   (or (not (or company_dissolution
                company_license_revoked
                company_stop_business))
       (and broker_certificate_cancellation_reported
            (>= 30 broker_certificate_cancellation_days)))))

; [insurance:broker_company_must_report_stop_reinsurance_or_insurance_business] 同時經營保險經紀及再保險經紀業務之經紀人公司停止其中一業務，應於一個月內報主管機關備查
(assert (= broker_company_report_stop_business_within_one_month
   (or (not (or insurance_brokerage_stopped reinsurance_brokerage_stopped))
       (and board_resolution_reported (>= 30 report_days_after_stop)))))

; [insurance:broker_must_keep_books_and_report_financials_annually] 個人執業經紀人、經紀人公司及銀行應專設帳簿，記載業務收支，並於每年4/1至5/31期間彙報主管機關財務報表及其他指定事項
(assert (= broker_annual_financial_report_submitted
   (and books_kept
        financial_report_submitted
        (<= 401 report_submission_date)
        (>= 531 report_submission_date))))

; [insurance:authority_may_inspect_and_request_reports] 主管機關得隨時派員檢查或令限期內報告營業狀況
(assert (= authority_inspection_and_report_request
   (or inspection_conducted report_request_issued)))

; [insurance:broker_must_improve_and_report_on_inspection_findings] 個人執業經紀人、經紀人公司及銀行應確實辦理改善檢查意見並持續追蹤覆查，於期限內函送主管機關
(assert (= broker_improvement_and_reporting_done
   (and inspection_findings_improved
        follow_up_tracking_done
        report_submitted_to_authority)))

; [insurance:prohibited_conducts] 個人執業經紀人、經紀人公司、銀行及受任用經紀人不得有列舉之不當行為
(assert (= prohibited_conducts_absent
   (and (not false_report_on_license_application)
        (not contract_with_unapproved_insurer)
        (not conceal_important_contract_info)
        (not coerce_or_induce_unfair_contract)
        (not misleading_promotion_or_recruitment)
        (not induce_policyholder_to_cancel_or_loan)
        (not misappropriate_insurance_funds)
        (not use_license_for_others)
        (not criminal_conviction_for_fraud_or_breach)
        (not operate_outside_license_scope)
        (not charge_unapproved_fees_or_commissions)
        (not illegal_insurance_payments)
        (not spread_false_information)
        (not authorize_others_to_operate)
        (not transfer_documents_to_unaffiliated_agents)
        (not employ_unqualified_insurance_agents)
        (not fail_to_cancel_license_within_deadline)
        (not unauthorized_stop_or_resume_or_dissolution)
        (not fail_to_reappoint_broker_after_resignation)
        (not fail_to_report_to_broker_association)
        (not unauthorized_advertisement)
        (not pay_commission_to_non_actual_agents)
        (not fail_to_confirm_suitability_for_elderly)
        (not sell_unapproved_foreign_policy_discount_products)
        (not false_or_incomplete_financial_reports)
        (not hold_positions_in_insurance_or_association)
        (not induce_contract_termination_or_loan)
        (not fail_to_fill_out_recruitment_report_truthfully)
        (not other_violations_of_rules_or_laws)
        (not other_acts_damaging_insurance_image))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、繳存保證金、投保相關保險、執業證照、管理規則、停業復業規定、帳簿報告義務、改善義務或有不當行為時處罰
(assert (= penalty
   (or (not broker_company_stop_business_within_limit)
       (not broker_company_cancel_certificates)
       (not broker_annual_financial_report_submitted)
       (not broker_company_status_reported)
       (not broker_cancel_certificate_within_30_days)
       violation_financial_or_business_management_rules
       (not broker_improvement_and_reporting_done)
       (not agent_license_and_guarantee)
       (not broker_company_report_stop_business_within_one_month)
       (not management_rules_defined)
       (not prohibited_conducts_absent)
       (not broker_company_reappoint_broker_after_resume))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_type 2))
(assert (= license_permitted false))
(assert (= guarantee_deposit_amount 0.0))
(assert (= guarantee_minimum_amount 1000000.0))
(assert (= guarantee_minimum_amount_defined_by_authority true))
(assert (= management_rules_set_by_authority true))
(assert (= violate_financial_management_rule true))
(assert (= violate_business_management_rule false))
(assert (= violate_article_165_1 false))
(assert (= violate_article_163_5 false))
(assert (= stop_business_reported false))
(assert (= resume_business_reported false))
(assert (= dissolution_reported false))
(assert (= stop_business_applied false))
(assert (= dissolution_applied false))
(assert (= broker_certificates_cancelled true))
(assert (= company_certificate_cancelled true))
(assert (= company_license_revoked true))
(assert (= company_stop_business true))
(assert (= broker_certificate_cancellation_reported true))
(assert (= broker_certificate_cancellation_days 7))
(assert (= insurance_brokerage_stopped true))
(assert (= board_resolution_reported false))
(assert (= report_days_after_stop 7))
(assert (= books_kept false))
(assert (= financial_report_submitted false))
(assert (= report_submission_date 0))
(assert (= inspection_conducted false))
(assert (= report_request_issued false))
(assert (= inspection_findings_improved false))
(assert (= follow_up_tracking_done false))
(assert (= report_submitted_to_authority false))
(assert (= broker_reappointed false))
(assert (= resume_business_applied false))
(assert (= extension_applied false))
(assert (= extension_count 0))
(assert (= extension_application_days_before_expiry 0))
(assert (= broker_improvement_and_reporting_done false))
(assert (= prohibited_conducts_absent false))
(assert (= false_or_incomplete_financial_reports false))
(assert (= agent_license_and_guarantee false))
(assert (= relevant_insurance_covered false))
(assert (= practice_certificate_held false))
(assert (= broker_company_status_reported false))
(assert (= broker_company_stop_business_within_limit false))
(assert (= broker_company_reappoint_broker_after_resume false))
(assert (= broker_company_cancel_certificates true))
(assert (= broker_cancel_certificate_within_30_days true))
(assert (= broker_company_report_stop_business_within_one_month false))
(assert (= authority_inspection_and_report_request false))
(assert (= written_report_provided false))
(assert (= fee_charged false))
(assert (= fee_standard_disclosed false))
(assert (= broker_written_report_and_fee_disclosed false))
(assert (= bank_permit_granted false))
(assert (= bank_engage_agent false))
(assert (= bank_engage_broker false))
(assert (= bank_permitted_to_engage_agent_or_broker false))
(assert (= broker_exercise_due_care false))
(assert (= broker_fulfill_fidelity false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= false_report_on_license_application false))
(assert (= contract_with_unapproved_insurer false))
(assert (= conceal_important_contract_info false))
(assert (= coerce_or_induce_unfair_contract false))
(assert (= misleading_promotion_or_recruitment false))
(assert (= induce_policyholder_to_cancel_or_loan false))
(assert (= misappropriate_insurance_funds false))
(assert (= use_license_for_others false))
(assert (= criminal_conviction_for_fraud_or_breach false))
(assert (= operate_outside_license_scope false))
(assert (= charge_unapproved_fees_or_commissions false))
(assert (= illegal_insurance_payments false))
(assert (= spread_false_information false))
(assert (= authorize_others_to_operate false))
(assert (= transfer_documents_to_unaffiliated_agents false))
(assert (= employ_unqualified_insurance_agents false))
(assert (= fail_to_cancel_license_within_deadline false))
(assert (= unauthorized_stop_or_resume_or_dissolution true))
(assert (= fail_to_reappoint_broker_after_resignation false))
(assert (= fail_to_report_to_broker_association false))
(assert (= unauthorized_advertisement false))
(assert (= pay_commission_to_non_actual_agents false))
(assert (= fail_to_confirm_suitability_for_elderly false))
(assert (= sell_unapproved_foreign_policy_discount_products false))
(assert (= hold_positions_in_insurance_or_association false))
(assert (= induce_contract_termination_or_loan false))
(assert (= fail_to_fill_out_recruitment_report_truthfully false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= other_acts_damaging_insurance_image false))
(assert (= broker_annual_financial_report_submitted false))
(assert (= company_dissolution false))
(assert (= guarantee_minimum_amount_defined false))
(assert (= insurance_type 0))
(assert (= management_rules_defined false))
(assert (= penalty false))
(assert (= reinsurance_brokerage_stopped false))
(assert (= stop_business_duration_days 0))
(assert (= violation_financial_or_business_management_rules false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 99
; Total facts: 99
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
