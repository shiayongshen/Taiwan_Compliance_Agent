; SMT2 file generated from compliance case automatic
; Case ID: case_300
; Generated at: 2025-10-21T06:39:58.287166
;
; This file can be executed with Z3:
;   z3 case_300.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const caused_illegal_insurance_payment Bool)
(declare-const coerce_or_induce_unfairly Bool)
(declare-const collected_improper_fees Bool)
(declare-const conceal_important_contract_info Bool)
(declare-const concealed_important_contract_info Bool)
(declare-const conflict_of_interest Bool)
(declare-const contract_with_unregistered_insurer Bool)
(declare-const convicted_of_criminal_offense Bool)
(declare-const criminal_conviction Bool)
(declare-const damage_insurance_image Bool)
(declare-const damaged_insurance_image Bool)
(declare-const disrupt_financial_order Bool)
(declare-const employ_unqualified_recruit Bool)
(declare-const employed_unqualified_recruit Bool)
(declare-const failed_to_cancel_license_in_time Bool)
(declare-const failed_to_complete_recruitment_report Bool)
(declare-const failed_to_confirm_suitability Bool)
(declare-const failed_to_reappoint_broker Bool)
(declare-const failed_to_report_to_association Bool)
(declare-const failure_to_confirm_suitability Bool)
(declare-const failure_to_reappoint_broker Bool)
(declare-const failure_to_report_to_association Bool)
(declare-const false_or_incomplete_report Bool)
(declare-const has_conflict_of_interest Bool)
(declare-const illegal_insurance_payment Bool)
(declare-const improper_commission_payment Bool)
(declare-const improper_document_handling Bool)
(declare-const improper_fee_collection Bool)
(declare-const incomplete_recruitment_report Bool)
(declare-const induce_contract_termination_or_loan Bool)
(declare-const induce_policy_surrender_or_loan Bool)
(declare-const induced_contract_termination_or_loan Bool)
(declare-const induced_policy_surrender_or_loan Bool)
(declare-const license_cancellation_delay Bool)
(declare-const license_used_by_others Bool)
(declare-const misappropriate_insurance_funds Bool)
(declare-const misappropriated_insurance_funds Bool)
(declare-const misconduct_reported_false Bool)
(declare-const misleading_promotion Bool)
(declare-const operated_outside_license_scope Bool)
(declare-const other_violations Bool)
(declare-const paid_commission_to_non_actual_recruit Bool)
(declare-const penalty Bool)
(declare-const reported_false_at_license_application Bool)
(declare-const reported_false_or_incomplete_data Bool)
(declare-const sale_of_unapproved_foreign_policy Bool)
(declare-const sold_unapproved_foreign_policy Bool)
(declare-const spread_false_information Bool)
(declare-const unauthorized_advertisement Bool)
(declare-const unauthorized_business_scope Bool)
(declare-const unauthorized_business_suspension Bool)
(declare-const unauthorized_delegation Bool)
(declare-const unauthorized_use_of_license Bool)
(declare-const used_misleading_promotion Bool)
(declare-const used_unauthorized_advertisement Bool)
(declare-const used_unfair_means_to_coerce_or_induce Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_broker:misconduct_reported_false] 申領執業證照時具報不實
(assert (= misconduct_reported_false reported_false_at_license_application))

; [insurance_broker:contract_with_unregistered_insurer] 為未經核准登記之保險業洽訂保險契約
(assert true)

; [insurance_broker:conceal_important_contract_info] 故意隱匿保險契約之重要事項
(assert (= conceal_important_contract_info concealed_important_contract_info))

; [insurance_broker:coerce_or_induce_unfairly] 利用職務或業務上之便利或其他不正當手段強迫、引誘或限制締約自由或索取額外報酬
(assert (= coerce_or_induce_unfairly used_unfair_means_to_coerce_or_induce))

; [insurance_broker:misleading_promotion] 以誇大不實、引人錯誤之宣傳、廣告或其他不當方法經營或執行業務或招聘人員
(assert (= misleading_promotion used_misleading_promotion))

; [insurance_broker:induce_policy_surrender_or_loan] 以不當手段慫恿保戶退保、轉保或貸款
(assert (= induce_policy_surrender_or_loan induced_policy_surrender_or_loan))

; [insurance_broker:misappropriate_insurance_funds] 挪用或侵占保險費、再保險費、保險金或再保險賠款
(assert (= misappropriate_insurance_funds misappropriated_insurance_funds))

; [insurance_broker:unauthorized_use_of_license] 本人未執行業務而以執業證照供他人使用
(assert (= unauthorized_use_of_license license_used_by_others))

; [insurance_broker:criminal_conviction] 有侵占、詐欺、背信、偽造文書行為受刑之宣告
(assert (= criminal_conviction convicted_of_criminal_offense))

; [insurance_broker:unauthorized_business_scope] 經營或執行執業證照所載範圍以外之保險業務
(assert (= unauthorized_business_scope operated_outside_license_scope))

; [insurance_broker:improper_fee_collection] 除合約及法定合理報酬外，以其他費用名目或第三人名義向保險人收取金錢、物品或其他報酬
(assert (= improper_fee_collection collected_improper_fees))

; [insurance_broker:illegal_insurance_payment] 以不法方式使保險人為不當之保險給付
(assert (= illegal_insurance_payment caused_illegal_insurance_payment))

; [insurance_broker:disrupt_financial_order] 散播不實言論或文宣擾亂金融秩序
(assert (= disrupt_financial_order spread_false_information))

; [insurance_broker:unauthorized_delegation] 授權第三人代為經營或執行業務，或以他人名義經營或執行業務
(assert true)

; [insurance_broker:improper_document_handling] 將非所任用經紀人或非所屬登錄保險業務員招攬之要保文件轉報保險人或轉由其他經紀人或保險代理人交付保險人
(assert true)

; [insurance_broker:employ_unqualified_recruit] 聘用未具保險招攬資格者為其招攬保險業務
(assert (= employ_unqualified_recruit employed_unqualified_recruit))

; [insurance_broker:license_cancellation_delay] 未依規定期限內辦理繳銷或註銷執業證照
(assert (= license_cancellation_delay failed_to_cancel_license_in_time))

; [insurance_broker:unauthorized_business_suspension] 擅自停業、暫停一部或全部業務、復業、恢復業務、解散或終止一部或全部業務
(assert true)

; [insurance_broker:failure_to_reappoint_broker] 經紀人公司或銀行經營業務後，未於所任用經紀人離職時依規定任用經紀人
(assert (= failure_to_reappoint_broker failed_to_reappoint_broker))

; [insurance_broker:failure_to_report_to_association] 未依主管機關規定向經紀人商業同業公會或經紀人公會報備
(assert (= failure_to_report_to_association failed_to_report_to_association))

; [insurance_broker:unauthorized_advertisement] 使用與保險商品有關之廣告、宣傳內容非屬保險業提供或未經其同意
(assert (= unauthorized_advertisement used_unauthorized_advertisement))

; [insurance_broker:improper_commission_payment] 將佣酬支付予非實際招攬之保險業務員及其業務主管（續期佣酬除外）
(assert (= improper_commission_payment paid_commission_to_non_actual_recruit))

; [insurance_broker:failure_to_confirm_suitability] 未確認金融消費者對保險商品之適合度，包括對65歲以上客戶提供不適合商品
(assert (= failure_to_confirm_suitability failed_to_confirm_suitability))

; [insurance_broker:sale_of_unapproved_foreign_policy] 銷售未經主管機關許可之國外保單貼現受益權憑證商品
(assert (= sale_of_unapproved_foreign_policy sold_unapproved_foreign_policy))

; [insurance_broker:false_or_incomplete_report] 提報業務或財務報表之資料不實或不全
(assert (= false_or_incomplete_report reported_false_or_incomplete_data))

; [insurance_broker:conflict_of_interest] 任職於保險業、擔任有關公會現職人員或登錄為保險業務員
(assert (= conflict_of_interest has_conflict_of_interest))

; [insurance_broker:induce_contract_termination_or_loan] 勸誘客戶解除或終止契約，或以貸款、定存解約或保險單借款繳交保險費
(assert (= induce_contract_termination_or_loan induced_contract_termination_or_loan))

; [insurance_broker:incomplete_recruitment_report] 未據實填寫招攬報告書，未載明65歲以上客戶是否具有辨識不利其投保權益能力及評估理由，且未做成評估紀錄（特定例外除外）
(assert (= incomplete_recruitment_report failed_to_complete_recruitment_report))

; [insurance_broker:other_violations] 其他違反本規則或相關法令
(assert true)

; [insurance_broker:damage_insurance_image] 其他有損保險形象
(assert (= damage_insurance_image damaged_insurance_image))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一保險經紀人管理規則第49條規定時處罰
(assert (= penalty
   (or sale_of_unapproved_foreign_policy
       conflict_of_interest
       disrupt_financial_order
       unauthorized_advertisement
       failure_to_reappoint_broker
       coerce_or_induce_unfairly
       employ_unqualified_recruit
       license_cancellation_delay
       improper_commission_payment
       incomplete_recruitment_report
       induce_contract_termination_or_loan
       other_violations
       conceal_important_contract_info
       damage_insurance_image
       unauthorized_business_suspension
       misleading_promotion
       false_or_incomplete_report
       criminal_conviction
       misconduct_reported_false
       unauthorized_business_scope
       contract_with_unregistered_insurer
       failure_to_confirm_suitability
       illegal_insurance_payment
       misappropriate_insurance_funds
       unauthorized_delegation
       induce_policy_surrender_or_loan
       improper_document_handling
       failure_to_report_to_association
       improper_fee_collection
       unauthorized_use_of_license)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= reported_false_at_license_application true))
(assert (= license_used_by_others true))
(assert (= misconduct_reported_false true))
(assert (= unauthorized_use_of_license true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 32
; Total variables: 56
; Total facts: 4
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
