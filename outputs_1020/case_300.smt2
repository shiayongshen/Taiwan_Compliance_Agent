; SMT2 file generated from compliance case automatic
; Case ID: case_300
; Generated at: 2025-10-19T12:32:21.450072
;
; This file can be executed with Z3:
;   z3 case_300.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authorize_others_to_operate_or_execute Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const convicted_of_embezzlement_fraud_breach_forgery Bool)
(declare-const employ_unqualified_person_for_insurance_solicitation Bool)
(declare-const fail_to_cancel_license_within_deadline Bool)
(declare-const fail_to_confirm_consumer_suitability_including_seniors Bool)
(declare-const fail_to_fill_solicitation_report_accurately Bool)
(declare-const fail_to_reappoint_broker_after_resignation Bool)
(declare-const fail_to_report_to_broker_association Bool)
(declare-const false_or_incomplete_business_or_financial_reports Bool)
(declare-const false_or_misleading_promotion_or_recruitment Bool)
(declare-const hold_conflicting_positions_or_registration Bool)
(declare-const illegal_inducement_for_improper_insurance_payment Bool)
(declare-const improper_coercion_or_inducement_or_extra_benefit Bool)
(declare-const improper_commission_payment_to_non_actual_solicitor Bool)
(declare-const improper_fee_or_benefit_collection Bool)
(declare-const improper_inducement_to_cancel_or_transfer_or_loan Bool)
(declare-const improper_transfer_of_proposal_documents Bool)
(declare-const induce_contract_termination_or_use_loan_or_deposit_to_pay_premium Bool)
(declare-const intentional_concealment_important_contract_info Bool)
(declare-const license_application_false_reported Bool)
(declare-const license_used_by_others_without_own_execution Bool)
(declare-const misappropriation_or_embezzlement_of_funds Bool)
(declare-const misconduct_1 Bool)
(declare-const misconduct_10 Bool)
(declare-const misconduct_11 Bool)
(declare-const misconduct_12 Bool)
(declare-const misconduct_13 Bool)
(declare-const misconduct_14 Bool)
(declare-const misconduct_15 Bool)
(declare-const misconduct_16 Bool)
(declare-const misconduct_17 Bool)
(declare-const misconduct_18 Bool)
(declare-const misconduct_19 Bool)
(declare-const misconduct_2 Bool)
(declare-const misconduct_20 Bool)
(declare-const misconduct_21 Bool)
(declare-const misconduct_22 Bool)
(declare-const misconduct_23 Bool)
(declare-const misconduct_24 Bool)
(declare-const misconduct_25 Bool)
(declare-const misconduct_26 Bool)
(declare-const misconduct_27 Bool)
(declare-const misconduct_28 Bool)
(declare-const misconduct_29 Bool)
(declare-const misconduct_3 Bool)
(declare-const misconduct_30 Bool)
(declare-const misconduct_4 Bool)
(declare-const misconduct_5 Bool)
(declare-const misconduct_6 Bool)
(declare-const misconduct_7 Bool)
(declare-const misconduct_8 Bool)
(declare-const misconduct_9 Bool)
(declare-const operate_outside_license_scope Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const penalty Bool)
(declare-const sell_unapproved_foreign_policy_discount_benefit_certificates Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const unauthorized_suspension_or_termination_of_business Bool)
(declare-const unauthorized_use_of_insurance_related_advertisement Bool)
(declare-const violate_163_4_financial_or_business_rule Bool)
(declare-const violate_163_7_rule Bool)
(declare-const violate_165_1_or_163_5_applied_rule Bool)
(declare-const violation_167_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_167_2] 違反保險法第163條第4項管理規則財務或業務管理規定、第163條第7項規定，或違反第165條第1項及第163條第5項準用規定
(assert (= violation_167_2
   (or violate_163_4_financial_or_business_rule
       violate_163_7_rule
       violate_165_1_or_163_5_applied_rule)))

; [broker:misconduct_1] 申領執業證照時具報不實
(assert (= misconduct_1 license_application_false_reported))

; [broker:misconduct_2] 為未經核准登記之保險業洽訂保險契約
(assert (= misconduct_2 contract_with_unapproved_insurer))

; [broker:misconduct_3] 故意隱匿保險契約之重要事項
(assert (= misconduct_3 intentional_concealment_important_contract_info))

; [broker:misconduct_4] 利用職務或業務便利或其他不正當手段強迫、引誘或限制締約自由或索取額外報酬或利益
(assert (= misconduct_4 improper_coercion_or_inducement_or_extra_benefit))

; [broker:misconduct_5] 以誇大不實、引人錯誤之宣傳、廣告或其他不當方法經營或執行業務或招聘人員
(assert (= misconduct_5 false_or_misleading_promotion_or_recruitment))

; [broker:misconduct_6] 以不當手段慫恿保戶退保、轉保或貸款等行為
(assert (= misconduct_6 improper_inducement_to_cancel_or_transfer_or_loan))

; [broker:misconduct_7] 挪用或侵占保險費、再保險費、保險金或再保險賠款
(assert (= misconduct_7 misappropriation_or_embezzlement_of_funds))

; [broker:misconduct_8] 本人未執行業務而以執業證照供他人使用
(assert (= misconduct_8 license_used_by_others_without_own_execution))

; [broker:misconduct_9] 有侵占、詐欺、背信、偽造文書行為受刑之宣告
(assert (= misconduct_9 convicted_of_embezzlement_fraud_breach_forgery))

; [broker:misconduct_10] 經營或執行執業證照所載範圍以外之保險業務
(assert (= misconduct_10 operate_outside_license_scope))

; [broker:misconduct_11] 除合約及合理報酬外，以其他費用名目或第三人名義向保險人收取金錢、物品、報酬或不合營業常規交易
(assert (= misconduct_11 improper_fee_or_benefit_collection))

; [broker:misconduct_12] 以不法方式使保險人為不當保險給付
(assert (= misconduct_12 illegal_inducement_for_improper_insurance_payment))

; [broker:misconduct_13] 散播不實言論或文宣擾亂金融秩序
(assert (= misconduct_13 spread_false_information_disturb_financial_order))

; [broker:misconduct_14] 授權第三人代為經營或執行業務，或以他人名義經營或執行業務
(assert (= misconduct_14 authorize_others_to_operate_or_execute))

; [broker:misconduct_15] 將非所任用經紀人或非所屬登錄保險業務員招攬之要保文件轉報保險人或轉由其他經紀人或保險代理人交付保險人（經紀人公司收受個人執業經紀人已取得書面同意之保件除外）
(assert (= misconduct_15 improper_transfer_of_proposal_documents))

; [broker:misconduct_16] 聘用未具保險招攬資格者為其招攬保險業務
(assert (= misconduct_16 employ_unqualified_person_for_insurance_solicitation))

; [broker:misconduct_17] 未依規定期限內辦理繳銷或註銷執業證照
(assert (= misconduct_17 fail_to_cancel_license_within_deadline))

; [broker:misconduct_18] 擅自停業、暫停一部或全部業務、復業、恢復業務、解散或終止一部或全部業務
(assert (= misconduct_18 unauthorized_suspension_or_termination_of_business))

; [broker:misconduct_19] 經紀人公司或銀行經營業務後，未於所任用經紀人離職時依規定任用經紀人
(assert (= misconduct_19 fail_to_reappoint_broker_after_resignation))

; [broker:misconduct_20] 未依主管機關規定向經紀人商業同業公會或經紀人公會報備相關事項
(assert (= misconduct_20 fail_to_report_to_broker_association))

; [broker:misconduct_21] 使用與保險商品有關之廣告、宣傳內容非屬保險業提供或未經其同意
(assert (= misconduct_21 unauthorized_use_of_insurance_related_advertisement))

; [broker:misconduct_22] 將佣酬支付予非實際招攬之保險業務員及其業務主管（支付續期佣酬予接續保戶服務人員除外）
(assert (= misconduct_22 improper_commission_payment_to_non_actual_solicitor))

; [broker:misconduct_23] 未確認金融消費者對保險商品之適合度，包括對65歲以上客戶提供不適合保險商品
(assert (= misconduct_23 fail_to_confirm_consumer_suitability_including_seniors))

; [broker:misconduct_24] 銷售未經主管機關許可之國外保單貼現受益權憑證商品
(assert (= misconduct_24 sell_unapproved_foreign_policy_discount_benefit_certificates))

; [broker:misconduct_25] 提報業務或財務報表資料不實或不全
(assert (= misconduct_25 false_or_incomplete_business_or_financial_reports))

; [broker:misconduct_26] 任職於保險業、擔任有關公會現職人員或登錄為保險業務員
(assert (= misconduct_26 hold_conflicting_positions_or_registration))

; [broker:misconduct_27] 勸誘客戶解除或終止契約，或以貸款、定存解約或保險單借款繳交保險費
(assert (= misconduct_27
   induce_contract_termination_or_use_loan_or_deposit_to_pay_premium))

; [broker:misconduct_28] 未據實填寫招攬報告書，包括65歲以上客戶投保財產保險及微型保險以外投保案件未載明辨識能力、商品適合度及評估理由並做成紀錄（特性經評估不具潛在影響者除外）
(assert (= misconduct_28 fail_to_fill_solicitation_report_accurately))

; [broker:misconduct_29] 其他違反本規則或相關法令
(assert (= misconduct_29 other_violations_of_rules_or_laws))

; [broker:misconduct_30] 其他有損保險形象行為
(assert (= misconduct_30 other_behaviors_damaging_insurance_image))

; [meta:penalty_default_false] 預設不處罰
(assert (or misconduct_10
    misconduct_7
    misconduct_4
    misconduct_2
    misconduct_14
    misconduct_9
    misconduct_3
    misconduct_21
    misconduct_28
    violation_167_2
    misconduct_29
    misconduct_25
    misconduct_23
    misconduct_27
    misconduct_19
    misconduct_1
    misconduct_5
    misconduct_8
    misconduct_24
    misconduct_11
    misconduct_30
    misconduct_13
    misconduct_12
    misconduct_26
    misconduct_22
    misconduct_20
    (not penalty)
    misconduct_15
    misconduct_16
    misconduct_17
    misconduct_18
    misconduct_6))

; [meta:penalty_conditions] 處罰條件：違反保險法第167-2條及保險經紀人管理規則第49條任一規定時處罰
(assert (= penalty
   (or misconduct_10
       misconduct_7
       misconduct_4
       misconduct_2
       misconduct_14
       misconduct_9
       misconduct_3
       misconduct_21
       misconduct_28
       violation_167_2
       misconduct_29
       misconduct_25
       misconduct_23
       misconduct_27
       misconduct_19
       misconduct_1
       misconduct_5
       misconduct_8
       misconduct_24
       misconduct_11
       misconduct_30
       misconduct_13
       misconduct_12
       misconduct_26
       misconduct_22
       misconduct_20
       misconduct_15
       misconduct_16
       misconduct_17
       misconduct_18
       misconduct_6)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_application_false_reported true))
(assert (= license_used_by_others_without_own_execution true))
(assert (= authorize_others_to_operate_or_execute false))
(assert (= contract_with_unapproved_insurer false))
(assert (= convicted_of_embezzlement_fraud_breach_forgery false))
(assert (= employ_unqualified_person_for_insurance_solicitation false))
(assert (= fail_to_cancel_license_within_deadline false))
(assert (= fail_to_confirm_consumer_suitability_including_seniors false))
(assert (= fail_to_fill_solicitation_report_accurately false))
(assert (= fail_to_reappoint_broker_after_resignation false))
(assert (= fail_to_report_to_broker_association false))
(assert (= false_or_incomplete_business_or_financial_reports false))
(assert (= false_or_misleading_promotion_or_recruitment false))
(assert (= hold_conflicting_positions_or_registration false))
(assert (= illegal_inducement_for_improper_insurance_payment false))
(assert (= improper_coercion_or_inducement_or_extra_benefit false))
(assert (= improper_commission_payment_to_non_actual_solicitor false))
(assert (= improper_fee_or_benefit_collection false))
(assert (= improper_inducement_to_cancel_or_transfer_or_loan false))
(assert (= improper_transfer_of_proposal_documents false))
(assert (= induce_contract_termination_or_use_loan_or_deposit_to_pay_premium false))
(assert (= intentional_concealment_important_contract_info false))
(assert (= misappropriation_or_embezzlement_of_funds false))
(assert (= misconduct_1 false))
(assert (= misconduct_10 false))
(assert (= misconduct_11 false))
(assert (= misconduct_12 false))
(assert (= misconduct_13 false))
(assert (= misconduct_14 false))
(assert (= misconduct_15 false))
(assert (= misconduct_16 false))
(assert (= misconduct_17 false))
(assert (= misconduct_18 false))
(assert (= misconduct_19 false))
(assert (= misconduct_2 false))
(assert (= misconduct_20 false))
(assert (= misconduct_21 false))
(assert (= misconduct_22 false))
(assert (= misconduct_23 false))
(assert (= misconduct_24 false))
(assert (= misconduct_25 false))
(assert (= misconduct_26 false))
(assert (= misconduct_27 false))
(assert (= misconduct_28 false))
(assert (= misconduct_29 false))
(assert (= misconduct_3 false))
(assert (= misconduct_30 false))
(assert (= misconduct_4 false))
(assert (= misconduct_5 false))
(assert (= misconduct_6 false))
(assert (= misconduct_7 false))
(assert (= misconduct_8 true))
(assert (= misconduct_9 false))
(assert (= operate_outside_license_scope false))
(assert (= other_behaviors_damaging_insurance_image false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= penalty true))
(assert (= sell_unapproved_foreign_policy_discount_benefit_certificates false))
(assert (= spread_false_information_disturb_financial_order false))
(assert (= unauthorized_suspension_or_termination_of_business false))
(assert (= unauthorized_use_of_insurance_related_advertisement false))
(assert (= violate_163_4_financial_or_business_rule false))
(assert (= violate_163_7_rule false))
(assert (= violate_165_1_or_163_5_applied_rule false))
(assert (= violation_167_2 true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 33
; Total variables: 65
; Total facts: 65
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
