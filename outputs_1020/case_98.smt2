; SMT2 file generated from compliance case automatic
; Case ID: case_98
; Generated at: 2025-10-19T08:01:21.083901
;
; This file can be executed with Z3:
;   z3 case_98.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_by_authority Bool)
(declare-const authorize_others_or_use_others_name_for_business Bool)
(declare-const based_on_insured_interest Bool)
(declare-const charge_unreasonable_fee_or_third_party Bool)
(declare-const coerce_or_induce_or_limit_contract_freedom_or_extra_fee Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const conclude_insurance_contract_or_provide_service Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const convicted_of_embezzlement_fraud_breach_forgery Bool)
(declare-const correction_within_deadline Bool)
(declare-const damage_insurance_image Bool)
(declare-const duty_of_care_exercised Bool)
(declare-const employ_unqualified_insurance_solicitor Bool)
(declare-const exaggerate_or_mislead_or_improper_business_or_recruitment Bool)
(declare-const fail_to_appoint_broker_after_resignation Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_consumer_suitability Bool)
(declare-const fail_to_fill_true_solicitation_report Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const faithful_duty_performed Bool)
(declare-const false_report_on_license_application Bool)
(declare-const fee_disclosure_made Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance_purchased Bool)
(declare-const hold_conflicting_positions Bool)
(declare-const illegal_inducement_for_improper_insurance_payment Bool)
(declare-const improper_inducement_for_policy_cancellation_or_transfer_or_loan Bool)
(declare-const induce_contract_termination_or_use_loan_to_pay_premium Bool)
(declare-const insurance_broker_definition Bool)
(declare-const insurance_broker_duties Bool)
(declare-const insurance_broker_insurance_types Bool)
(declare-const insurance_broker_report_and_fee_disclosure Bool)
(declare-const liability_insurance_purchased Bool)
(declare-const license_and_guarantee_compliance Bool)
(declare-const license_issued Bool)
(declare-const license_used_by_others_without_execution Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const misappropriate_or_embezzle_insurance_funds Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const pay_commission_to_non_actual_solicitor Bool)
(declare-const penalty Bool)
(declare-const penalty_violation_financial_or_business_management Bool)
(declare-const prohibited_act_1 Bool)
(declare-const prohibited_act_10 Bool)
(declare-const prohibited_act_11 Bool)
(declare-const prohibited_act_12 Bool)
(declare-const prohibited_act_13 Bool)
(declare-const prohibited_act_14 Bool)
(declare-const prohibited_act_15 Bool)
(declare-const prohibited_act_16 Bool)
(declare-const prohibited_act_17 Bool)
(declare-const prohibited_act_18 Bool)
(declare-const prohibited_act_19 Bool)
(declare-const prohibited_act_2 Bool)
(declare-const prohibited_act_20 Bool)
(declare-const prohibited_act_21 Bool)
(declare-const prohibited_act_22 Bool)
(declare-const prohibited_act_23 Bool)
(declare-const prohibited_act_24 Bool)
(declare-const prohibited_act_25 Bool)
(declare-const prohibited_act_26 Bool)
(declare-const prohibited_act_27 Bool)
(declare-const prohibited_act_28 Bool)
(declare-const prohibited_act_29 Bool)
(declare-const prohibited_act_3 Bool)
(declare-const prohibited_act_30 Bool)
(declare-const prohibited_act_4 Bool)
(declare-const prohibited_act_5 Bool)
(declare-const prohibited_act_6 Bool)
(declare-const prohibited_act_7 Bool)
(declare-const prohibited_act_8 Bool)
(declare-const prohibited_act_9 Bool)
(declare-const receive_commission_or_fee Bool)
(declare-const relevant_insurance_purchased Bool)
(declare-const sell_unapproved_foreign_policy_discount_benefit Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const submit_false_or_incomplete_reports Bool)
(declare-const transfer_unassigned_proposal_documents Bool)
(declare-const unauthorized_suspend_resume_dissolve_terminate_business Bool)
(declare-const use_unauthorized_insurance_advertisement Bool)
(declare-const violate_business_management_rules Bool)
(declare-const violate_financial_management_rules Bool)
(declare-const violate_other_rules_or_laws Bool)
(declare-const violation_financial_or_business_management Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:insurance_broker_definition] 保險經紀人定義：基於被保險人利益洽訂保險契約或提供服務並收取佣金或報酬
(assert (= insurance_broker_definition
   (and based_on_insured_interest
        conclude_insurance_contract_or_provide_service
        receive_commission_or_fee)))

; [insurance:license_and_guarantee_compliance] 保險代理人、經紀人、公證人須經主管機關許可、繳存保證金、投保相關保險並領有執業證照
(assert (= license_and_guarantee_compliance
   (and approved_by_authority
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_purchased
        license_issued)))

; [insurance:insurance_broker_insurance_types] 保險經紀人須投保責任保險及保證保險
(assert (= insurance_broker_insurance_types
   (and liability_insurance_purchased guarantee_insurance_purchased)))

; [insurance:insurance_broker_duties] 保險經紀人應以善良管理人注意義務為被保險人洽訂契約並負忠實義務
(assert (= insurance_broker_duties (and duty_of_care_exercised faithful_duty_performed)))

; [insurance:insurance_broker_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內應主動提供書面分析報告並明確告知報酬標準
(assert (= insurance_broker_report_and_fee_disclosure
   (and written_analysis_report_provided fee_disclosure_made)))

; [insurance:violation_financial_or_business_management] 違反財務或業務管理規定應限期改正或處罰
(assert (= violation_financial_or_business_management
   (or violate_business_management_rules violate_financial_management_rules)))

; [insurance:penalty_violation_financial_or_business_management] 違反財務或業務管理規定且未限期改正時處罰
(assert (= penalty_violation_financial_or_business_management
   (and violation_financial_or_business_management
        (not correction_within_deadline))))

; [insurance:prohibited_acts_1] 禁止申領執業證照時具報不實
(assert (= prohibited_act_1 false_report_on_license_application))

; [insurance:prohibited_acts_2] 禁止為未經核准登記之保險業洽訂保險契約
(assert (= prohibited_act_2 contract_with_unapproved_insurer))

; [insurance:prohibited_acts_3] 禁止故意隱匿保險契約重要事項
(assert (= prohibited_act_3 conceal_important_contract_info))

; [insurance:prohibited_acts_4] 禁止利用職務便利強迫、引誘或限制締約自由或索取額外報酬
(assert (= prohibited_act_4 coerce_or_induce_or_limit_contract_freedom_or_extra_fee))

; [insurance:prohibited_acts_5] 禁止以誇大不實或不當方法經營或執行業務或招聘人員
(assert (= prohibited_act_5 exaggerate_or_mislead_or_improper_business_or_recruitment))

; [insurance:prohibited_acts_6] 禁止以不當手段慫恿保戶退保、轉保或貸款
(assert (= prohibited_act_6
   improper_inducement_for_policy_cancellation_or_transfer_or_loan))

; [insurance:prohibited_acts_7] 禁止挪用或侵占保險費、再保險費、保險金或再保險賠款
(assert (= prohibited_act_7 misappropriate_or_embezzle_insurance_funds))

; [insurance:prohibited_acts_8] 禁止本人未執行業務而以執業證照供他人使用
(assert (= prohibited_act_8 license_used_by_others_without_execution))

; [insurance:prohibited_acts_9] 禁止有侵占、詐欺、背信、偽造文書行為受刑之宣告
(assert (= prohibited_act_9 convicted_of_embezzlement_fraud_breach_forgery))

; [insurance:prohibited_acts_10] 禁止經營或執行執業證照範圍以外之保險業務
(assert (= prohibited_act_10 operate_outside_license_scope))

; [insurance:prohibited_acts_11] 禁止以其他費用名目或第三人名義向保險人收取不合理報酬
(assert (= prohibited_act_11 charge_unreasonable_fee_or_third_party))

; [insurance:prohibited_acts_12] 禁止以不法方式使保險人為不當保險給付
(assert (= prohibited_act_12 illegal_inducement_for_improper_insurance_payment))

; [insurance:prohibited_acts_13] 禁止散播不實言論或文宣擾亂金融秩序
(assert (= prohibited_act_13 spread_false_information_disturb_financial_order))

; [insurance:prohibited_acts_14] 禁止授權第三人代為經營或以他人名義經營業務
(assert (= prohibited_act_14 authorize_others_or_use_others_name_for_business))

; [insurance:prohibited_acts_15] 禁止將非所任用經紀人招攬之要保文件轉報保險人或轉由他人交付
(assert (= prohibited_act_15 transfer_unassigned_proposal_documents))

; [insurance:prohibited_acts_16] 禁止聘用未具保險招攬資格者招攬保險業務
(assert (= prohibited_act_16 employ_unqualified_insurance_solicitor))

; [insurance:prohibited_acts_17] 禁止未依規定期限辦理繳銷或註銷執業證照
(assert (= prohibited_act_17 fail_to_cancel_license_within_deadline))

; [insurance:prohibited_acts_18] 禁止擅自停業、暫停、復業、解散或終止業務
(assert (= prohibited_act_18 unauthorized_suspend_resume_dissolve_terminate_business))

; [insurance:prohibited_acts_19] 禁止經紀人公司或銀行未於經紀人離職時依規定任用經紀人
(assert (= prohibited_act_19 fail_to_appoint_broker_after_resignation))

; [insurance:prohibited_acts_20] 禁止未依主管機關規定向經紀人公會報備相關事項
(assert (= prohibited_act_20 fail_to_report_to_broker_association))

; [insurance:prohibited_acts_21] 禁止使用非保險業提供或未經同意之保險商品廣告宣傳內容
(assert (= prohibited_act_21 use_unauthorized_insurance_advertisement))

; [insurance:prohibited_acts_22] 禁止將佣酬支付予非實際招攬之保險業務員及其主管
(assert (= prohibited_act_22 pay_commission_to_non_actual_solicitor))

; [insurance:prohibited_acts_23] 禁止未確認金融消費者對保險商品之適合度，含65歲以上客戶不適合商品
(assert (= prohibited_act_23 fail_to_confirm_consumer_suitability))

; [insurance:prohibited_acts_24] 禁止銷售未經主管機關許可之國外保單貼現受益權憑證商品
(assert (= prohibited_act_24 sell_unapproved_foreign_policy_discount_benefit))

; [insurance:prohibited_acts_25] 禁止提報業務或財務報表資料不實或不全
(assert (= prohibited_act_25 submit_false_or_incomplete_reports))

; [insurance:prohibited_acts_26] 禁止任職於保險業、擔任公會現職人員或登錄為保險業務員
(assert (= prohibited_act_26 hold_conflicting_positions))

; [insurance:prohibited_acts_27] 禁止勸誘客戶解除或終止契約，或以貸款、定存解約或保險單借款繳交保險費
(assert (= prohibited_act_27 induce_contract_termination_or_use_loan_to_pay_premium))

; [insurance:prohibited_acts_28] 禁止未據實填寫招攬報告書，含65歲以上客戶投保財產保險及微型保險以外案件
(assert (= prohibited_act_28 fail_to_fill_true_solicitation_report))

; [insurance:prohibited_acts_29] 禁止其他違反本規則或相關法令行為
(assert (= prohibited_act_29 violate_other_rules_or_laws))

; [insurance:prohibited_acts_30] 禁止其他有損保險形象行為
(assert (= prohibited_act_30 damage_insurance_image))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一禁止行為或違反財務或業務管理規定且未限期改正時處罰
(assert (= penalty
   (or prohibited_act_2
       prohibited_act_8
       prohibited_act_15
       prohibited_act_7
       prohibited_act_4
       prohibited_act_23
       prohibited_act_5
       prohibited_act_3
       prohibited_act_9
       prohibited_act_20
       prohibited_act_13
       prohibited_act_16
       prohibited_act_25
       prohibited_act_19
       prohibited_act_30
       prohibited_act_22
       violation_financial_or_business_management
       prohibited_act_17
       prohibited_act_10
       prohibited_act_14
       prohibited_act_18
       prohibited_act_28
       prohibited_act_29
       prohibited_act_6
       (not correction_within_deadline)
       prohibited_act_27
       prohibited_act_12
       prohibited_act_21
       prohibited_act_11
       prohibited_act_24
       prohibited_act_1
       prohibited_act_26)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= based_on_insured_interest true))
(assert (= conclude_insurance_contract_or_provide_service true))
(assert (= receive_commission_or_fee true))
(assert (= violate_business_management_rules true))
(assert (= correction_within_deadline false))
(assert (= prohibited_act_11 true))
(assert (= approved_by_authority true))
(assert (= guarantee_deposit_amount 1000000.0))
(assert (= minimum_guarantee_deposit 1000000.0))
(assert (= relevant_insurance_purchased true))
(assert (= license_issued true))
(assert (= liability_insurance_purchased true))
(assert (= guarantee_insurance_purchased true))
(assert (= duty_of_care_exercised true))
(assert (= faithful_duty_performed true))
(assert (= written_analysis_report_provided true))
(assert (= fee_disclosure_made true))
(assert (= authorize_others_or_use_others_name_for_business false))
(assert (= charge_unreasonable_fee_or_third_party true))
(assert (= coerce_or_induce_or_limit_contract_freedom_or_extra_fee false))
(assert (= conceal_important_contract_info false))
(assert (= contract_with_unapproved_insurer false))
(assert (= convicted_of_embezzlement_fraud_breach_forgery false))
(assert (= damage_insurance_image false))
(assert (= employ_unqualified_insurance_solicitor false))
(assert (= exaggerate_or_mislead_or_improper_business_or_recruitment false))
(assert (= fail_to_appoint_broker_after_resignation false))
(assert (= fail_to_cancel_license_within_deadline false))
(assert (= fail_to_confirm_consumer_suitability false))
(assert (= fail_to_fill_true_solicitation_report false))
(assert (= fail_to_report_to_broker_association false))
(assert (= false_report_on_license_application false))
(assert (= illegal_inducement_for_improper_insurance_payment false))
(assert (= improper_inducement_for_policy_cancellation_or_transfer_or_loan false))
(assert (= induce_contract_termination_or_use_loan_to_pay_premium false))
(assert (= license_used_by_others_without_execution false))
(assert (= misappropriate_or_embezzle_insurance_funds false))
(assert (= operate_outside_license_scope true))
(assert (= pay_commission_to_non_actual_solicitor false))
(assert (= spread_false_information_disturb_financial_order false))
(assert (= submit_false_or_incomplete_reports false))
(assert (= transfer_unassigned_proposal_documents false))
(assert (= unauthorized_suspend_resume_dissolve_terminate_business false))
(assert (= use_unauthorized_insurance_advertisement false))
(assert (= violate_other_rules_or_laws false))
(assert (= hold_conflicting_positions false))
(assert (= insurance_broker_definition false))
(assert (= insurance_broker_duties false))
(assert (= insurance_broker_insurance_types false))
(assert (= insurance_broker_report_and_fee_disclosure false))
(assert (= license_and_guarantee_compliance false))
(assert (= penalty false))
(assert (= penalty_violation_financial_or_business_management false))
(assert (= prohibited_act_1 false))
(assert (= prohibited_act_10 false))
(assert (= prohibited_act_12 false))
(assert (= prohibited_act_13 false))
(assert (= prohibited_act_14 false))
(assert (= prohibited_act_15 false))
(assert (= prohibited_act_16 false))
(assert (= prohibited_act_17 false))
(assert (= prohibited_act_18 false))
(assert (= prohibited_act_19 false))
(assert (= prohibited_act_2 false))
(assert (= prohibited_act_20 false))
(assert (= prohibited_act_21 false))
(assert (= prohibited_act_22 false))
(assert (= prohibited_act_23 false))
(assert (= prohibited_act_24 false))
(assert (= prohibited_act_25 false))
(assert (= prohibited_act_26 false))
(assert (= prohibited_act_27 false))
(assert (= prohibited_act_28 false))
(assert (= prohibited_act_29 false))
(assert (= prohibited_act_3 false))
(assert (= prohibited_act_30 false))
(assert (= prohibited_act_4 false))
(assert (= prohibited_act_5 false))
(assert (= prohibited_act_6 false))
(assert (= prohibited_act_7 false))
(assert (= prohibited_act_8 false))
(assert (= prohibited_act_9 false))
(assert (= sell_unapproved_foreign_policy_discount_benefit false))
(assert (= violate_financial_management_rules false))
(assert (= violation_financial_or_business_management false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 39
; Total variables: 85
; Total facts: 85
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
