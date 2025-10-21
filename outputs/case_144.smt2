; SMT2 file generated from compliance case automatic
; Case ID: case_144
; Generated at: 2025-10-21T03:00:16.763877
;
; This file can be executed with Z3:
;   z3 case_144.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_rule_49_any_violation Bool)
(declare-const agent_rule_49_violation_1 Bool)
(declare-const agent_rule_49_violation_10 Bool)
(declare-const agent_rule_49_violation_11 Bool)
(declare-const agent_rule_49_violation_12 Bool)
(declare-const agent_rule_49_violation_13 Bool)
(declare-const agent_rule_49_violation_14 Bool)
(declare-const agent_rule_49_violation_15 Bool)
(declare-const agent_rule_49_violation_16 Bool)
(declare-const agent_rule_49_violation_17 Bool)
(declare-const agent_rule_49_violation_18 Bool)
(declare-const agent_rule_49_violation_19 Bool)
(declare-const agent_rule_49_violation_2 Bool)
(declare-const agent_rule_49_violation_20 Bool)
(declare-const agent_rule_49_violation_21 Bool)
(declare-const agent_rule_49_violation_22 Bool)
(declare-const agent_rule_49_violation_23 Bool)
(declare-const agent_rule_49_violation_24 Bool)
(declare-const agent_rule_49_violation_25 Bool)
(declare-const agent_rule_49_violation_26 Bool)
(declare-const agent_rule_49_violation_27 Bool)
(declare-const agent_rule_49_violation_28 Bool)
(declare-const agent_rule_49_violation_29 Bool)
(declare-const agent_rule_49_violation_3 Bool)
(declare-const agent_rule_49_violation_30 Bool)
(declare-const agent_rule_49_violation_31 Bool)
(declare-const agent_rule_49_violation_4 Bool)
(declare-const agent_rule_49_violation_5 Bool)
(declare-const agent_rule_49_violation_6 Bool)
(declare-const agent_rule_49_violation_7 Bool)
(declare-const agent_rule_49_violation_8 Bool)
(declare-const agent_rule_49_violation_9 Bool)
(declare-const authorize_others_to_operate_or_execute_business Bool)
(declare-const convicted_of_embezzlement_fraud_breach_of_trust_or_forgery Bool)
(declare-const employ_unqualified_person_for_insurance_solicitation Bool)
(declare-const exaggerated_or_misleading_promotion_or_recruitment Bool)
(declare-const fail_to_appoint_agent_after_resignation Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_consumer_suitability_including_seniors Bool)
(declare-const fail_to_fill_solicitation_report_truthfully_and_completely Bool)
(declare-const fail_to_report_to_agent_association Bool)
(declare-const false_or_incomplete_business_or_financial_reports Bool)
(declare-const false_report_on_license_application Bool)
(declare-const hold_position_in_insurance_or_association_or_registered_as_agent Bool)
(declare-const illegal_inducement_for_improper_insurance_payment Bool)
(declare-const improper_coercion_or_inducement_or_extra_benefit Bool)
(declare-const improper_collection_of_money_or_goods_or_commission Bool)
(declare-const improper_commission_payment_to_non_actual_solicitor Bool)
(declare-const improper_inducement_of_policy_cancellation_or_transfer_or_loan Bool)
(declare-const improper_transfer_of_policy_documents Bool)
(declare-const induce_customer_to_terminate_contract_or_use_loan_or_deposit_to_pay_premium Bool)
(declare-const intentional_concealment_of_contract_important_info Bool)
(declare-const license_used_by_others_without_own_execution Bool)
(declare-const misappropriation_or_embezzlement_of_premiums_or_insurance_money Bool)
(declare-const operation_outside_license_scope Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const penalty Bool)
(declare-const penalty_167_2 Bool)
(declare-const sell_unapproved_foreign_policy_discount_benefit_certificates Bool)
(declare-const serious_violation_167_2 Bool)
(declare-const spread_false_statements_or_disrupt_financial_order Bool)
(declare-const unapproved_insurance_agent_operation Bool)
(declare-const unapproved_insurance_business_execution Bool)
(declare-const unauthorized_suspension_or_termination_of_business Bool)
(declare-const unauthorized_use_of_insurance_related_advertisement Bool)
(declare-const violate_163_4_financial_or_business_rule Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1_or_163_5_applied Bool)
(declare-const violation_167_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_167_2] 違反保險法第163條第4項管理規則財務或業務管理規定、第163條第7項規定，或違反第165條第1項及第163條第5項準用規定
(assert (= violation_167_2
   (or violate_163_4_financial_or_business_rule
       violate_163_7
       violate_165_1_or_163_5_applied)))

; [insurance:penalty_167_2_impose_fine_or_license_revocation] 違反167-2條規定應限期改正或處罰，情節重大者廢止許可並註銷執業證照
(assert (= penalty_167_2 (or serious_violation_167_2 violation_167_2)))

; [insurance:agent_rule_49_violation_1] 申領執業證照時具報不實
(assert (= agent_rule_49_violation_1 false_report_on_license_application))

; [insurance:agent_rule_49_violation_2] 為未經核准登記之保險業代理經營或執行業務
(assert (= agent_rule_49_violation_2 unapproved_insurance_agent_operation))

; [insurance:agent_rule_49_violation_3] 為保險業代理經營或執行未經主管機關核准之保險業務
(assert (= agent_rule_49_violation_3 unapproved_insurance_business_execution))

; [insurance:agent_rule_49_violation_4] 故意隱匿保險契約之重要事項
(assert (= agent_rule_49_violation_4 intentional_concealment_of_contract_important_info))

; [insurance:agent_rule_49_violation_5] 利用職務或業務便利強迫、引誘或限制締約自由或索取額外報酬或利益
(assert (= agent_rule_49_violation_5 improper_coercion_or_inducement_or_extra_benefit))

; [insurance:agent_rule_49_violation_6] 以誇大不實、引人錯誤之宣傳、廣告或其他不當方法經營或執行業務或招聘人員
(assert (= agent_rule_49_violation_6 exaggerated_or_misleading_promotion_or_recruitment))

; [insurance:agent_rule_49_violation_7] 以不當手段慫恿保戶退保、轉保或貸款等行為
(assert (= agent_rule_49_violation_7
   improper_inducement_of_policy_cancellation_or_transfer_or_loan))

; [insurance:agent_rule_49_violation_8] 挪用或侵占保險費、保險金
(assert (= agent_rule_49_violation_8
   misappropriation_or_embezzlement_of_premiums_or_insurance_money))

; [insurance:agent_rule_49_violation_9] 本人未執行業務而以執業證照供他人使用
(assert (= agent_rule_49_violation_9 license_used_by_others_without_own_execution))

; [insurance:agent_rule_49_violation_10] 有侵占、詐欺、背信、偽造文書行為受刑之宣告
(assert (= agent_rule_49_violation_10
   convicted_of_embezzlement_fraud_breach_of_trust_or_forgery))

; [insurance:agent_rule_49_violation_11] 經營或執行執業證照所載範圍以外之保險業務
(assert (= agent_rule_49_violation_11 operation_outside_license_scope))

; [insurance:agent_rule_49_violation_12] 除合約佣酬及費用外，以其他名目或第三人名義向保險人收取金錢、物品、報酬或不合營業常規交易
(assert (= agent_rule_49_violation_12
   improper_collection_of_money_or_goods_or_commission))

; [insurance:agent_rule_49_violation_13] 以不法方式使保險人為不當保險給付
(assert (= agent_rule_49_violation_13 illegal_inducement_for_improper_insurance_payment))

; [insurance:agent_rule_49_violation_14] 散播不實言論或文宣擾亂金融秩序
(assert (= agent_rule_49_violation_14
   spread_false_statements_or_disrupt_financial_order))

; [insurance:agent_rule_49_violation_15] 授權第三人代為經營或執行業務，或以他人名義經營或執行業務
(assert (= agent_rule_49_violation_15 authorize_others_to_operate_or_execute_business))

; [insurance:agent_rule_49_violation_16] 將非所任用代理人或非所屬登錄保險業務員招攬之要保文件轉報保險人或轉由其他保險經紀人或代理人交付保險人（代理人公司收受個人執業代理人已取得書面同意之保件不在此限）
(assert (= agent_rule_49_violation_16 improper_transfer_of_policy_documents))

; [insurance:agent_rule_49_violation_17] 聘用未具保險招攬資格者為其招攬保險業務
(assert (= agent_rule_49_violation_17
   employ_unqualified_person_for_insurance_solicitation))

; [insurance:agent_rule_49_violation_18] 未依規定期限辦理繳銷執業證照
(assert (= agent_rule_49_violation_18 fail_to_cancel_license_within_deadline))

; [insurance:agent_rule_49_violation_19] 擅自停業、暫停業務、復業、恢復業務、解散或終止業務
(assert (= agent_rule_49_violation_19
   unauthorized_suspension_or_termination_of_business))

; [insurance:agent_rule_49_violation_20] 代理人公司或銀行經營業務後，未於代理人離職時依規定任用代理人
(assert (= agent_rule_49_violation_20 fail_to_appoint_agent_after_resignation))

; [insurance:agent_rule_49_violation_21] 未依主管機關規定向代理人商業同業公會報備相關事項
(assert (= agent_rule_49_violation_21 fail_to_report_to_agent_association))

; [insurance:agent_rule_49_violation_22] 使用與保險商品有關之廣告、宣傳內容非屬保險業提供或未經其同意
(assert (= agent_rule_49_violation_22
   unauthorized_use_of_insurance_related_advertisement))

; [insurance:agent_rule_49_violation_23] 將佣酬支付予非實際招攬之保險業務員及其業務主管（支付續期佣酬予接續保戶服務人員不在此限）
(assert (= agent_rule_49_violation_23
   improper_commission_payment_to_non_actual_solicitor))

; [insurance:agent_rule_49_violation_24] 未確認金融消費者對保險商品之適合度，包括對65歲以上客戶提供不適合保險商品
(assert (= agent_rule_49_violation_24
   fail_to_confirm_consumer_suitability_including_seniors))

; [insurance:agent_rule_49_violation_25] 銷售未經主管機關許可之國外保單貼現受益權憑證商品
(assert (= agent_rule_49_violation_25
   sell_unapproved_foreign_policy_discount_benefit_certificates))

; [insurance:agent_rule_49_violation_26] 提報業務或財務報表資料不實或不全
(assert (= agent_rule_49_violation_26 false_or_incomplete_business_or_financial_reports))

; [insurance:agent_rule_49_violation_27] 任職於保險業、擔任有關公會現職人員或登錄為保險業務員
(assert (= agent_rule_49_violation_27
   hold_position_in_insurance_or_association_or_registered_as_agent))

; [insurance:agent_rule_49_violation_28] 勸誘客戶解除或終止契約，或以貸款、定存解約或保險單借款繳交保險費
(assert (= agent_rule_49_violation_28
   induce_customer_to_terminate_contract_or_use_loan_or_deposit_to_pay_premium))

; [insurance:agent_rule_49_violation_29] 未據實填寫招攬報告書，包括未載明65歲以上客戶投保能力及適合度評估及紀錄（特定保險商品除外）
(assert (= agent_rule_49_violation_29
   fail_to_fill_solicitation_report_truthfully_and_completely))

; [insurance:agent_rule_49_violation_30] 其他違反本規則或相關法令
(assert (= agent_rule_49_violation_30 other_violations_of_rules_or_laws))

; [insurance:agent_rule_49_violation_31] 其他有損保險形象行為
(assert (= agent_rule_49_violation_31 other_behaviors_damaging_insurance_image))

; [insurance:agent_rule_49_any_violation] 代理人管理規則第49條任一違規行為
(assert (= agent_rule_49_any_violation
   (or agent_rule_49_violation_26
       agent_rule_49_violation_29
       agent_rule_49_violation_6
       agent_rule_49_violation_22
       agent_rule_49_violation_11
       agent_rule_49_violation_31
       agent_rule_49_violation_3
       agent_rule_49_violation_19
       agent_rule_49_violation_28
       agent_rule_49_violation_17
       agent_rule_49_violation_23
       agent_rule_49_violation_15
       agent_rule_49_violation_1
       agent_rule_49_violation_9
       agent_rule_49_violation_16
       agent_rule_49_violation_8
       agent_rule_49_violation_2
       agent_rule_49_violation_27
       agent_rule_49_violation_30
       agent_rule_49_violation_21
       agent_rule_49_violation_18
       agent_rule_49_violation_12
       agent_rule_49_violation_7
       agent_rule_49_violation_5
       agent_rule_49_violation_14
       agent_rule_49_violation_25
       agent_rule_49_violation_10
       agent_rule_49_violation_13
       agent_rule_49_violation_20
       agent_rule_49_violation_24
       agent_rule_49_violation_4)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法第167-2條或代理人管理規則第49條任一違規行為時處罰
(assert (= penalty (or agent_rule_49_any_violation violation_167_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_rule_49_violation_6 true))
(assert (= agent_rule_49_violation_24 true))
(assert (= agent_rule_49_any_violation true))
(assert (= violation_167_2 true))
(assert (= penalty_167_2 true))
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
; Total variables: 70
; Total facts: 6
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
