; SMT2 file generated from compliance case automatic
; Case ID: case_152
; Generated at: 2025-10-21T03:22:17.079229
;
; This file can be executed with Z3:
;   z3 case_152.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authorize_others_or_use_others_name_to_operate Bool)
(declare-const broker_misconduct_49_1 Bool)
(declare-const broker_misconduct_49_10 Bool)
(declare-const broker_misconduct_49_11 Bool)
(declare-const broker_misconduct_49_12 Bool)
(declare-const broker_misconduct_49_13 Bool)
(declare-const broker_misconduct_49_14 Bool)
(declare-const broker_misconduct_49_15 Bool)
(declare-const broker_misconduct_49_16 Bool)
(declare-const broker_misconduct_49_17 Bool)
(declare-const broker_misconduct_49_18 Bool)
(declare-const broker_misconduct_49_19 Bool)
(declare-const broker_misconduct_49_2 Bool)
(declare-const broker_misconduct_49_20 Bool)
(declare-const broker_misconduct_49_21 Bool)
(declare-const broker_misconduct_49_22 Bool)
(declare-const broker_misconduct_49_23 Bool)
(declare-const broker_misconduct_49_24 Bool)
(declare-const broker_misconduct_49_25 Bool)
(declare-const broker_misconduct_49_26 Bool)
(declare-const broker_misconduct_49_27 Bool)
(declare-const broker_misconduct_49_28 Bool)
(declare-const broker_misconduct_49_29 Bool)
(declare-const broker_misconduct_49_3 Bool)
(declare-const broker_misconduct_49_30 Bool)
(declare-const broker_misconduct_49_4 Bool)
(declare-const broker_misconduct_49_5 Bool)
(declare-const broker_misconduct_49_6 Bool)
(declare-const broker_misconduct_49_7 Bool)
(declare-const broker_misconduct_49_8 Bool)
(declare-const broker_misconduct_49_9 Bool)
(declare-const charge_improper_fees_or_third_party Bool)
(declare-const coerce_or_induce_or_limit_contract_freedom_or_extra_fee Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const convicted_of_embezzlement_fraud_breach_forgery Bool)
(declare-const deposit_guarantee Bool)
(declare-const employ_unqualified_insurance_solicitor Bool)
(declare-const exaggerate_or_mislead_or_improper_business_or_recruit Bool)
(declare-const fail_to_appoint_broker_after_resignation Bool)
(declare-const fail_to_cancel_license_in_time Bool)
(declare-const fail_to_confirm_consumer_suitability Bool)
(declare-const fail_to_fill_solicitation_report_truthfully Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_or_incomplete_business_or_financial_report Bool)
(declare-const false_report_on_license_application Bool)
(declare-const hold_conflicting_positions Bool)
(declare-const illegal_induce_improper_insurance_payment Bool)
(declare-const improperly_induce_policyholder_to_cancel_or_transfer_or_loan Bool)
(declare-const induce_contract_termination_or_use_loan_to_pay_premium Bool)
(declare-const insurance_purchased Bool)
(declare-const license_issued Bool)
(declare-const license_permit_required Bool)
(declare-const license_used_by_others_without_own_execution Bool)
(declare-const misappropriate_or_embezzle_premiums_or_claims Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_behavior_harm_insurance_image Bool)
(declare-const other_violation_of_rules_or_laws Bool)
(declare-const pay_commission_to_non_actual_solicitor Bool)
(declare-const penalty Bool)
(declare-const permit_obtained Bool)
(declare-const sell_unapproved_foreign_policy_discount_benefit Bool)
(declare-const spread_false_statements_disturb_financial_order Bool)
(declare-const transfer_unassigned_policy_documents Bool)
(declare-const unauthorized_suspend_resume_or_terminate_business Bool)
(declare-const use_unauthorized_insurance_advertisement Bool)
(declare-const violate_163_4_financial_or_business_management Bool)
(declare-const violate_163_5_applied_165_1 Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1 Bool)
(declare-const violate_license_permit Bool)
(declare-const violation_167_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_167_2] 違反保險法第163條第4項財務或業務管理規定、第7項規定，或違反第165條第1項及第163條第5項準用規定
(assert (= violation_167_2
   (or violate_165_1
       violate_163_5_applied_165_1
       violate_163_7
       violate_163_4_financial_or_business_management)))

; [insurance:penalty_167_2] 違反第167-2條規定應處罰
(assert (= penalty violation_167_2))

; [insurance:license_permit_required] 保險代理人、經紀人、公證人須經主管機關許可並繳存保證金及投保相關保險
(assert (= license_permit_required
   (and permit_obtained deposit_guarantee insurance_purchased license_issued)))

; [insurance:violate_license_permit] 違反保險代理人、經紀人、公證人許可及保證金、保險投保規定
(assert (not (= license_permit_required violate_license_permit)))

; [insurance:broker_misconduct_49_1] 申領執業證照時具報不實
(assert (= broker_misconduct_49_1 false_report_on_license_application))

; [insurance:broker_misconduct_49_2] 為未經核准登記之保險業洽訂保險契約
(assert (= broker_misconduct_49_2 contract_with_unapproved_insurer))

; [insurance:broker_misconduct_49_3] 故意隱匿保險契約之重要事項
(assert (= broker_misconduct_49_3 conceal_important_contract_info))

; [insurance:broker_misconduct_49_4] 利用職務或業務便利強迫、引誘或限制締約自由或索取額外報酬
(assert (= broker_misconduct_49_4
   coerce_or_induce_or_limit_contract_freedom_or_extra_fee))

; [insurance:broker_misconduct_49_5] 以誇大不實或其他不當方法經營或執行業務或招聘人員
(assert (= broker_misconduct_49_5 exaggerate_or_mislead_or_improper_business_or_recruit))

; [insurance:broker_misconduct_49_6] 以不當手段慫恿保戶退保、轉保或貸款
(assert (= broker_misconduct_49_6
   improperly_induce_policyholder_to_cancel_or_transfer_or_loan))

; [insurance:broker_misconduct_49_7] 挪用或侵占保險費、再保險費、保險金或再保險賠款
(assert (= broker_misconduct_49_7 misappropriate_or_embezzle_premiums_or_claims))

; [insurance:broker_misconduct_49_8] 本人未執行業務而以執業證照供他人使用
(assert (= broker_misconduct_49_8 license_used_by_others_without_own_execution))

; [insurance:broker_misconduct_49_9] 有侵占、詐欺、背信、偽造文書行為受刑之宣告
(assert (= broker_misconduct_49_9 convicted_of_embezzlement_fraud_breach_forgery))

; [insurance:broker_misconduct_49_10] 經營或執行執業證照所載範圍以外之保險業務
(assert (= broker_misconduct_49_10 operate_outside_license_scope))

; [insurance:broker_misconduct_49_11] 除合約及法定合理報酬外，以其他費用名目或第三人名義向保險人收取不當報酬
(assert (= broker_misconduct_49_11 charge_improper_fees_or_third_party))

; [insurance:broker_misconduct_49_12] 以不法方式使保險人為不當保險給付
(assert (= broker_misconduct_49_12 illegal_induce_improper_insurance_payment))

; [insurance:broker_misconduct_49_13] 散播不實言論或文宣擾亂金融秩序
(assert (= broker_misconduct_49_13 spread_false_statements_disturb_financial_order))

; [insurance:broker_misconduct_49_14] 授權第三人代為經營或以他人名義經營或執行業務
(assert (= broker_misconduct_49_14 authorize_others_or_use_others_name_to_operate))

; [insurance:broker_misconduct_49_15] 將非所任用經紀人或非所屬保險業務員招攬之要保文件轉報保險人或轉由他人交付
(assert (= broker_misconduct_49_15 transfer_unassigned_policy_documents))

; [insurance:broker_misconduct_49_16] 聘用未具保險招攬資格者為招攬保險業務
(assert (= broker_misconduct_49_16 employ_unqualified_insurance_solicitor))

; [insurance:broker_misconduct_49_17] 未依規定期限辦理繳銷或註銷執業證照
(assert (= broker_misconduct_49_17 fail_to_cancel_license_in_time))

; [insurance:broker_misconduct_49_18] 擅自停業、暫停業務、復業、解散或終止業務
(assert (= broker_misconduct_49_18 unauthorized_suspend_resume_or_terminate_business))

; [insurance:broker_misconduct_49_19] 經紀人公司或銀行未於經紀人離職時依規定任用經紀人
(assert (= broker_misconduct_49_19 fail_to_appoint_broker_after_resignation))

; [insurance:broker_misconduct_49_20] 未依主管機關規定向經紀人商業同業公會或經紀人公會報備
(assert (= broker_misconduct_49_20 fail_to_report_to_broker_association))

; [insurance:broker_misconduct_49_21] 使用非保險業提供或未經同意之保險商品廣告宣傳內容
(assert (= broker_misconduct_49_21 use_unauthorized_insurance_advertisement))

; [insurance:broker_misconduct_49_22] 將佣酬支付予非實際招攬之保險業務員及其業務主管（續期佣酬除外）
(assert (= broker_misconduct_49_22 pay_commission_to_non_actual_solicitor))

; [insurance:broker_misconduct_49_23] 未確認金融消費者對保險商品之適合度，含65歲以上客戶提供不適合商品
(assert (= broker_misconduct_49_23 fail_to_confirm_consumer_suitability))

; [insurance:broker_misconduct_49_24] 銷售未經主管機關許可之國外保單貼現受益權憑證商品
(assert (= broker_misconduct_49_24 sell_unapproved_foreign_policy_discount_benefit))

; [insurance:broker_misconduct_49_25] 提報業務或財務報表資料不實或不全
(assert (= broker_misconduct_49_25 false_or_incomplete_business_or_financial_report))

; [insurance:broker_misconduct_49_26] 任職於保險業、擔任有關公會現職人員或登錄為保險業務員
(assert (= broker_misconduct_49_26 hold_conflicting_positions))

; [insurance:broker_misconduct_49_27] 勸誘客戶解除或終止契約，或以貸款、定存解約或保險單借款繳交保險費
(assert (= broker_misconduct_49_27
   induce_contract_termination_or_use_loan_to_pay_premium))

; [insurance:broker_misconduct_49_28] 未據實填寫招攬報告書，未載明65歲以上客戶能力及保險商品適合度評估
(assert (= broker_misconduct_49_28 fail_to_fill_solicitation_report_truthfully))

; [insurance:broker_misconduct_49_29] 其他違反本規則或相關法令
(assert (= broker_misconduct_49_29 other_violation_of_rules_or_laws))

; [insurance:broker_misconduct_49_30] 其他有損保險形象行為
(assert (= broker_misconduct_49_30 other_behavior_harm_insurance_image))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第167-2條或違反許可及保證金投保規定，或違反經紀人管理規則第49條任一條款時處罰
(assert (= penalty
   (or broker_misconduct_49_25
       broker_misconduct_49_30
       broker_misconduct_49_22
       violation_167_2
       broker_misconduct_49_12
       broker_misconduct_49_27
       broker_misconduct_49_7
       broker_misconduct_49_19
       broker_misconduct_49_6
       broker_misconduct_49_11
       broker_misconduct_49_20
       broker_misconduct_49_10
       broker_misconduct_49_17
       broker_misconduct_49_14
       broker_misconduct_49_23
       broker_misconduct_49_18
       broker_misconduct_49_5
       broker_misconduct_49_1
       broker_misconduct_49_4
       broker_misconduct_49_21
       broker_misconduct_49_2
       violate_license_permit
       broker_misconduct_49_29
       broker_misconduct_49_16
       broker_misconduct_49_24
       broker_misconduct_49_3
       broker_misconduct_49_8
       broker_misconduct_49_26
       broker_misconduct_49_15
       broker_misconduct_49_13
       broker_misconduct_49_9
       broker_misconduct_49_28)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_163_4_financial_or_business_management true))
(assert (= violation_167_2 true))
(assert (= false_or_incomplete_business_or_financial_report true))
(assert (= fail_to_fill_solicitation_report_truthfully true))
(assert (= induce_contract_termination_or_use_loan_to_pay_premium true))
(assert (= permit_obtained true))
(assert (= deposit_guarantee true))
(assert (= insurance_purchased true))
(assert (= license_issued true))
(assert (= violate_license_permit false))
(assert (= broker_misconduct_49_23 true))
(assert (= broker_misconduct_49_28 true))
(assert (= broker_misconduct_49_27 true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 36
; Total variables: 72
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
