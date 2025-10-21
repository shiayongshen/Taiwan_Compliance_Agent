; SMT2 file generated from compliance case automatic
; Case ID: case_146
; Generated at: 2025-10-21T03:08:15.395132
;
; This file can be executed with Z3:
;   z3 case_146.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advertisement_and_promotion_management Bool)
(declare-const agent_violation_1 Bool)
(declare-const agent_violation_10 Bool)
(declare-const agent_violation_11 Bool)
(declare-const agent_violation_12 Bool)
(declare-const agent_violation_13 Bool)
(declare-const agent_violation_14 Bool)
(declare-const agent_violation_15 Bool)
(declare-const agent_violation_16 Bool)
(declare-const agent_violation_17 Bool)
(declare-const agent_violation_18 Bool)
(declare-const agent_violation_19 Bool)
(declare-const agent_violation_2 Bool)
(declare-const agent_violation_20 Bool)
(declare-const agent_violation_21 Bool)
(declare-const agent_violation_22 Bool)
(declare-const agent_violation_23 Bool)
(declare-const agent_violation_24 Bool)
(declare-const agent_violation_25 Bool)
(declare-const agent_violation_26 Bool)
(declare-const agent_violation_27 Bool)
(declare-const agent_violation_28 Bool)
(declare-const agent_violation_29 Bool)
(declare-const agent_violation_3 Bool)
(declare-const agent_violation_30 Bool)
(declare-const agent_violation_31 Bool)
(declare-const agent_violation_4 Bool)
(declare-const agent_violation_5 Bool)
(declare-const agent_violation_6 Bool)
(declare-const agent_violation_7 Bool)
(declare-const agent_violation_8 Bool)
(declare-const agent_violation_9 Bool)
(declare-const audit_committee_established Bool)
(declare-const audit_committee_management_included Bool)
(declare-const audit_committee_management_included_flag Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const authorize_others_to_operate_or_use_others_name Bool)
(declare-const business_outside_license_scope Bool)
(declare-const coerce_or_induce_or_limit_contract_freedom_or_extra_fee Bool)
(declare-const compensation_and_risk_linkage Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const correction_ordered Bool)
(declare-const criminal_conviction_for_fraud_or_breach Bool)
(declare-const customer_complaints_handling Bool)
(declare-const customer_need_and_suitability_assessment Bool)
(declare-const dismiss_director_supervisor Bool)
(declare-const dismiss_manager_staff Bool)
(declare-const employ_unqualified_solicitors Bool)
(declare-const fail_to_appoint_agent_after_resignation Bool)
(declare-const fail_to_cancel_license_in_time Bool)
(declare-const fail_to_confirm_product_suitability Bool)
(declare-const fail_to_fill_solicitation_report_truthfully Bool)
(declare-const fail_to_report_to_agent_association Bool)
(declare-const false_or_incomplete_report Bool)
(declare-const false_or_misleading_promotion_or_recruitment Bool)
(declare-const false_report_on_license_application Bool)
(declare-const fine_imposed Bool)
(declare-const hold_conflicting_positions Bool)
(declare-const illegal_insurance_payment Bool)
(declare-const improper_collection_of_funds_or_rewards Bool)
(declare-const improper_inducement_of_policyholder Bool)
(declare-const improper_transfer_of_solicitation_documents Bool)
(declare-const induce_contract_termination_or_loan_payment Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_defined Bool)
(declare-const internal_control_system_established Bool)
(declare-const license_revoked Bool)
(declare-const license_used_by_others Bool)
(declare-const limit_business_scope Bool)
(declare-const misappropriation_of_premiums_or_claims Bool)
(declare-const notification_sent Bool)
(declare-const notify_deregistration Bool)
(declare-const other_behavior_harm_insurance_image Bool)
(declare-const other_designated_matters Bool)
(declare-const other_rule_or_law_violation Bool)
(declare-const pay_commission_to_non_actual_solicitor Bool)
(declare-const penalty_dismiss_director_supervisor Bool)
(declare-const penalty_dismiss_manager_staff Bool)
(declare-const penalty_fine_or_license_revocation Bool)
(declare-const penalty_internal_control_violation Bool)
(declare-const penalty_limit_business_scope Bool)
(declare-const penalty_measures_applicable Bool)
(declare-const penalty_measures_taken Bool)
(declare-const pre_submission_check_mechanism Bool)
(declare-const premium_collection_and_management Bool)
(declare-const product_information_disclosure Bool)
(declare-const qualification_and_solicitation_management Bool)
(declare-const sell_unapproved_foreign_policy_discount Bool)
(declare-const solicitation_document_control_and_storage Bool)
(declare-const solicitation_handling_minimum_requirements Bool)
(declare-const solicitation_handling_system_defined Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const truthful_solicitation_report_management Bool)
(declare-const unapproved_insurance_agent_business Bool)
(declare-const unapproved_insurance_business Bool)
(declare-const unauthorized_suspend_or_terminate_business Bool)
(declare-const use_unapproved_advertisement Bool)
(declare-const violate_finance_or_business_management_rules Bool)
(declare-const violate_internal_control_or_audit Bool)
(declare-const violate_rule_163_4 Bool)
(declare-const violate_rule_163_5 Bool)
(declare-const violate_rule_163_7 Bool)
(declare-const violate_rule_165_1 Bool)
(declare-const violation_flag Bool)
(declare-const violation_occurred Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_occurred] 保險代理人、經紀人、公證人違反法令或有礙健全經營
(assert (= violation_occurred violation_flag))

; [insurance:penalty_measures_applicable] 主管機關得視情節輕重採取處分措施
(assert (= penalty_measures_applicable (and violation_occurred penalty_measures_taken)))

; [insurance:penalty_limit_business_scope] 限制經營或執行業務範圍處分
(assert (= limit_business_scope penalty_limit_business_scope))

; [insurance:penalty_dismiss_manager_staff] 命公司解除經理人或職員職務處分
(assert (= dismiss_manager_staff penalty_dismiss_manager_staff))

; [insurance:penalty_dismiss_director_supervisor] 解除公司董事、監察人職務或停止執行職務處分
(assert (= dismiss_director_supervisor penalty_dismiss_director_supervisor))

; [insurance:notify_deregistration] 主管機關通知公司登記主管機關註銷董事或監察人登記
(assert (= notify_deregistration (and dismiss_director_supervisor notification_sent)))

; [insurance:violate_finance_or_business_management_rules] 違反財務或業務管理規定
(assert (= violate_finance_or_business_management_rules
   (or violate_rule_163_4
       violate_rule_163_5
       violate_rule_163_7
       violate_rule_165_1)))

; [insurance:penalty_fine_or_license_revocation] 限期改正或處罰鍰，情節重大廢止許可並註銷執業證照
(assert (= penalty_fine_or_license_revocation
   (or correction_ordered fine_imposed license_revoked)))

; [insurance:violate_internal_control_or_audit] 未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序
(assert (= violate_internal_control_or_audit
   (or (not solicitation_handling_system_executed)
       (not internal_control_executed)
       (not audit_system_executed)
       (not solicitation_handling_system_established)
       (not audit_system_established)
       (not internal_control_established))))

; [insurance:penalty_internal_control_violation] 限期改正或處罰鍰因內部控制或稽核制度違反
(assert (= penalty_internal_control_violation (or correction_ordered fine_imposed)))

; [insurance:agent_violation_1] 申領執業證照時具報不實
(assert (= agent_violation_1 false_report_on_license_application))

; [insurance:agent_violation_2] 為未經核准登記之保險業代理經營或執行業務
(assert (= agent_violation_2 unapproved_insurance_agent_business))

; [insurance:agent_violation_3] 為保險業代理經營或執行未經主管機關核准之保險業務
(assert (= agent_violation_3 unapproved_insurance_business))

; [insurance:agent_violation_4] 故意隱匿保險契約之重要事項
(assert (= agent_violation_4 conceal_important_contract_info))

; [insurance:agent_violation_5] 利用職務或業務便利強迫、引誘或限制締約自由或索取額外報酬
(assert (= agent_violation_5 coerce_or_induce_or_limit_contract_freedom_or_extra_fee))

; [insurance:agent_violation_6] 以誇大不實、引人錯誤之宣傳、廣告或其他不當方法經營或執行業務或招聘人員
(assert (= agent_violation_6 false_or_misleading_promotion_or_recruitment))

; [insurance:agent_violation_7] 以不當手段慫恿保戶退保、轉保或貸款等行為
(assert (= agent_violation_7 improper_inducement_of_policyholder))

; [insurance:agent_violation_8] 挪用或侵占保險費、保險金
(assert (= agent_violation_8 misappropriation_of_premiums_or_claims))

; [insurance:agent_violation_9] 本人未執行業務而以執業證照供他人使用
(assert (= agent_violation_9 license_used_by_others))

; [insurance:agent_violation_10] 侵占、詐欺、背信、偽造文書行為受刑宣告
(assert (= agent_violation_10 criminal_conviction_for_fraud_or_breach))

; [insurance:agent_violation_11] 經營或執行執業證照範圍以外之保險業務
(assert (= agent_violation_11 business_outside_license_scope))

; [insurance:agent_violation_12] 除合約佣酬及費用外，以其他名目或第三人名義向保險人收取金錢或其他報酬
(assert (= agent_violation_12 improper_collection_of_funds_or_rewards))

; [insurance:agent_violation_13] 以不法方式使保險人為不當保險給付
(assert (= agent_violation_13 illegal_insurance_payment))

; [insurance:agent_violation_14] 散播不實言論或文宣擾亂金融秩序
(assert (= agent_violation_14 spread_false_information_disturb_financial_order))

; [insurance:agent_violation_15] 授權第三人代為經營或以他人名義經營或執行業務
(assert (= agent_violation_15 authorize_others_to_operate_or_use_others_name))

; [insurance:agent_violation_16] 將非所任用代理人或非所屬登錄保險業務員招攬之要保文件轉報保險人或轉由他人交付
(assert (= agent_violation_16 improper_transfer_of_solicitation_documents))

; [insurance:agent_violation_17] 聘用未具保險招攬資格者為招攬保險業務
(assert (= agent_violation_17 employ_unqualified_solicitors))

; [insurance:agent_violation_18] 未依規定期限辦理繳銷執業證照
(assert (= agent_violation_18 fail_to_cancel_license_in_time))

; [insurance:agent_violation_19] 擅自停業、暫停業務、復業、解散或終止業務
(assert (= agent_violation_19 unauthorized_suspend_or_terminate_business))

; [insurance:agent_violation_20] 代理人公司或銀行未於代理人離職時依規定任用代理人
(assert (= agent_violation_20 fail_to_appoint_agent_after_resignation))

; [insurance:agent_violation_21] 未依主管機關規定向代理人商業同業公會報備
(assert (= agent_violation_21 fail_to_report_to_agent_association))

; [insurance:agent_violation_22] 使用非保險業提供或未經同意之廣告、宣傳內容
(assert (= agent_violation_22 use_unapproved_advertisement))

; [insurance:agent_violation_23] 將佣酬支付予非實際招攬之保險業務員及其主管
(assert (= agent_violation_23 pay_commission_to_non_actual_solicitor))

; [insurance:agent_violation_24] 未確認金融消費者對保險商品之適合度，含65歲以上客戶提供不適合商品
(assert (= agent_violation_24 fail_to_confirm_product_suitability))

; [insurance:agent_violation_25] 銷售未經主管機關許可之國外保單貼現受益權憑證商品
(assert (= agent_violation_25 sell_unapproved_foreign_policy_discount))

; [insurance:agent_violation_26] 提報業務或財務報表資料不實或不全
(assert (= agent_violation_26 false_or_incomplete_report))

; [insurance:agent_violation_27] 任職於保險業、擔任公會現職人員或登錄為保險業務員
(assert (= agent_violation_27 hold_conflicting_positions))

; [insurance:agent_violation_28] 勸誘客戶解除或終止契約，或以貸款、定存解約或保險單借款繳交保險費
(assert (= agent_violation_28 induce_contract_termination_or_loan_payment))

; [insurance:agent_violation_29] 未據實填寫招攬報告書，未載明客戶辨識能力及保險商品適合度評估
(assert (= agent_violation_29 fail_to_fill_solicitation_report_truthfully))

; [insurance:agent_violation_30] 其他違反本規則或相關法令
(assert (= agent_violation_30 other_rule_or_law_violation))

; [insurance:agent_violation_31] 其他有損保險形象行為
(assert (= agent_violation_31 other_behavior_harm_insurance_image))

; [insurance:internal_control_system_established] 保險代理人公司、經紀人公司、銀行依業務性質及規模訂定內部控制及招攬處理制度
(assert (= internal_control_system_established
   (and internal_control_system_defined solicitation_handling_system_defined)))

; [insurance:audit_committee_management_included] 設置審計委員會者，內部控制制度包括審計委員會議事運作管理
(assert (= audit_committee_management_included
   (or (not audit_committee_established)
       audit_committee_management_included_flag)))

; [insurance:solicitation_handling_minimum_requirements] 招攬處理制度及程序至少包括規定之十一項內容
(assert (= solicitation_handling_minimum_requirements
   (and qualification_and_solicitation_management
        compensation_and_risk_linkage
        premium_collection_and_management
        product_information_disclosure
        advertisement_and_promotion_management
        customer_need_and_suitability_assessment
        truthful_solicitation_report_management
        pre_submission_check_mechanism
        solicitation_document_control_and_storage
        customer_complaints_handling
        other_designated_matters)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation_occurred true))
(assert (= penalty_measures_taken true))
(assert (= correction_ordered true))
(assert (= fine_imposed true))
(assert (= violate_internal_control_or_audit true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_established false))
(assert (= solicitation_handling_system_executed false))
(assert (= fail_to_confirm_product_suitability true))
(assert (= fail_to_fill_solicitation_report_truthfully true))
(assert (= truthful_solicitation_report_management false))
(assert (= customer_need_and_suitability_assessment false))
(assert (= customer_complaints_handling false))
(assert (= other_rule_or_law_violation false))
(assert (= advertisement_and_promotion_management false))
(assert (= penalty_fine_or_license_revocation true))
(assert (= penalty_internal_control_violation true))
(assert (= penalty_measures_applicable true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 44
; Total variables: 110
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
