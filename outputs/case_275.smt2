; SMT2 file generated from compliance case automatic
; Case ID: case_275
; Generated at: 2025-10-21T06:09:11.471818
;
; This file can be executed with Z3:
;   z3 case_275.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_outside_license_scope Bool)
(declare-const coerce_contract Bool)
(declare-const coerce_or_induce Bool)
(declare-const commission_paid_to_non_actual_broker Bool)
(declare-const conceal_important_info Bool)
(declare-const conflict_of_interest Bool)
(declare-const conflict_of_interest_employment_or_registration Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const contract_without_approval Bool)
(declare-const convicted_of_fraud_or_related_crimes Bool)
(declare-const criminal_conviction Bool)
(declare-const damage_insurance_image Bool)
(declare-const delay_in_license_cancellation Bool)
(declare-const demand_extra_benefits Bool)
(declare-const disrupt_financial_order Bool)
(declare-const employ_unqualified_personnel Bool)
(declare-const exaggerated_or_false_promotion Bool)
(declare-const exempted_by_product_characteristics Bool)
(declare-const failure_to_confirm_product_suitability Bool)
(declare-const failure_to_confirm_suitability Bool)
(declare-const failure_to_reappoint Bool)
(declare-const failure_to_reappoint_broker_after_resignation Bool)
(declare-const failure_to_report Bool)
(declare-const failure_to_report_to_broker_association Bool)
(declare-const false_or_incomplete_business_or_financial_report Bool)
(declare-const false_or_incomplete_report Bool)
(declare-const false_report_on_license_application Bool)
(declare-const illegal_insurance_payment Bool)
(declare-const illegal_insurance_payment_made Bool)
(declare-const improper_commission_payment Bool)
(declare-const improper_document_handling Bool)
(declare-const improper_document_transferred Bool)
(declare-const improper_fee_collection Bool)
(declare-const improper_fee_or_commission_collection Bool)
(declare-const improper_inducement_of_policy_surrender Bool)
(declare-const incomplete_suitability_report Bool)
(declare-const incomplete_suitability_report_filled Bool)
(declare-const induce_contract Bool)
(declare-const induce_contract_termination Bool)
(declare-const induce_contract_termination_or_payment_by_loan Bool)
(declare-const induce_policy_surrender Bool)
(declare-const intentional_concealment_of_contract_info Bool)
(declare-const license_cancellation_delay Bool)
(declare-const license_used_by_others Bool)
(declare-const misappropriate_funds Bool)
(declare-const misappropriation_of_insurance_funds Bool)
(declare-const misconduct_reported Bool)
(declare-const misleading_promotion Bool)
(declare-const other_behaviors_damaging_insurance_image Bool)
(declare-const other_violations Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const penalty Bool)
(declare-const prior_written_consent_obtained Bool)
(declare-const renewal_commission_payment_exempted Bool)
(declare-const restrict_contract_freedom Bool)
(declare-const sale_of_unapproved_foreign_discounted_policies Bool)
(declare-const sale_of_unapproved_foreign_products Bool)
(declare-const spread_false_information Bool)
(declare-const unauthorized_advertisement Bool)
(declare-const unauthorized_business_scope Bool)
(declare-const unauthorized_business_suspension Bool)
(declare-const unauthorized_business_suspension_or_termination Bool)
(declare-const unauthorized_delegation Bool)
(declare-const unauthorized_delegation_or_proxy Bool)
(declare-const unauthorized_use_of_insurance_advertisement Bool)
(declare-const unauthorized_use_of_license Bool)
(declare-const unqualified_employment Bool)
(declare-const violation_any Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_broker:misconduct_reported] 申領執業證照時具報不實
(assert (= misconduct_reported false_report_on_license_application))

; [insurance_broker:contract_without_approval] 為未經核准登記之保險業洽訂保險契約
(assert (= contract_without_approval contract_with_unapproved_insurer))

; [insurance_broker:conceal_important_info] 故意隱匿保險契約之重要事項
(assert (= conceal_important_info intentional_concealment_of_contract_info))

; [insurance_broker:coerce_or_induce] 利用職務或業務便利強迫、引誘或限制締約自由或索取額外利益
(assert (= coerce_or_induce
   (or demand_extra_benefits
       coerce_contract
       restrict_contract_freedom
       induce_contract)))

; [insurance_broker:misleading_promotion] 以誇大不實、引人錯誤之宣傳、廣告或其他不當方法經營或執行業務或招聘人員
(assert (= misleading_promotion exaggerated_or_false_promotion))

; [insurance_broker:induce_policy_surrender] 以不當手段慫恿保戶退保、轉保或貸款
(assert (= induce_policy_surrender improper_inducement_of_policy_surrender))

; [insurance_broker:misappropriate_funds] 挪用或侵占保險費、再保險費、保險金或再保險賠款
(assert (= misappropriate_funds misappropriation_of_insurance_funds))

; [insurance_broker:unauthorized_use_of_license] 本人未執行業務而以執業證照供他人使用
(assert (= unauthorized_use_of_license license_used_by_others))

; [insurance_broker:criminal_conviction] 有侵占、詐欺、背信、偽造文書行為受刑之宣告
(assert (= criminal_conviction convicted_of_fraud_or_related_crimes))

; [insurance_broker:unauthorized_business_scope] 經營或執行執業證照所載範圍以外之保險業務
(assert (= unauthorized_business_scope business_outside_license_scope))

; [insurance_broker:improper_fee_collection] 以其他費用名目或第三人名義向保險人收取不合營業常規之報酬
(assert (= improper_fee_collection improper_fee_or_commission_collection))

; [insurance_broker:illegal_insurance_payment] 以不法方式使保險人為不當之保險給付
(assert (= illegal_insurance_payment illegal_insurance_payment_made))

; [insurance_broker:disrupt_financial_order] 散播不實言論或文宣擾亂金融秩序
(assert (= disrupt_financial_order spread_false_information))

; [insurance_broker:unauthorized_delegation] 授權第三人代為經營或執行業務，或以他人名義經營或執行業務
(assert (= unauthorized_delegation unauthorized_delegation_or_proxy))

; [insurance_broker:improper_document_handling] 將非所任用經紀人或非所屬登錄保險業務員招攬之要保文件轉報保險人或轉由他人交付保險人
(assert (= improper_document_handling
   (and improper_document_transferred (not prior_written_consent_obtained))))

; [insurance_broker:unqualified_employment] 聘用未具保險招攬資格者為其招攬保險業務
(assert (= unqualified_employment employ_unqualified_personnel))

; [insurance_broker:license_cancellation_delay] 未依規定期限內辦理繳銷或註銷執業證照
(assert (= license_cancellation_delay delay_in_license_cancellation))

; [insurance_broker:unauthorized_business_suspension] 擅自停業、暫停業務、復業、解散或終止業務
(assert (= unauthorized_business_suspension
   unauthorized_business_suspension_or_termination))

; [insurance_broker:failure_to_reappoint] 經紀人公司或銀行未於經紀人離職時依規定任用經紀人
(assert (= failure_to_reappoint failure_to_reappoint_broker_after_resignation))

; [insurance_broker:failure_to_report] 未依主管機關規定向經紀人公會報備相關事項
(assert (= failure_to_report failure_to_report_to_broker_association))

; [insurance_broker:unauthorized_advertisement] 使用非保險業提供或未經同意之保險商品廣告、宣傳內容
(assert (= unauthorized_advertisement unauthorized_use_of_insurance_advertisement))

; [insurance_broker:improper_commission_payment] 將佣酬支付予非實際招攬之保險業務員及其業務主管（續期佣酬除外）
(assert (= improper_commission_payment
   (and commission_paid_to_non_actual_broker
        (not renewal_commission_payment_exempted))))

; [insurance_broker:failure_to_confirm_suitability] 未確認金融消費者對保險商品之適合度，包括65歲以上客戶提供不適合商品
(assert (= failure_to_confirm_suitability failure_to_confirm_product_suitability))

; [insurance_broker:sale_of_unapproved_foreign_products] 銷售未經主管機關許可之國外保單貼現受益權憑證商品
(assert (= sale_of_unapproved_foreign_products
   sale_of_unapproved_foreign_discounted_policies))

; [insurance_broker:false_or_incomplete_report] 提報業務或財務報表資料不實或不全
(assert (= false_or_incomplete_report false_or_incomplete_business_or_financial_report))

; [insurance_broker:conflict_of_interest] 任職於保險業、擔任有關公會現職人員或登錄為保險業務員
(assert (= conflict_of_interest conflict_of_interest_employment_or_registration))

; [insurance_broker:induce_contract_termination] 勸誘客戶解除或終止契約，或以貸款、定存解約或保險單借款繳交保險費
(assert (= induce_contract_termination induce_contract_termination_or_payment_by_loan))

; [insurance_broker:incomplete_suitability_report] 未據實填寫招攬報告書，未載明65歲以上客戶是否具辨識能力及保險商品適合度評估
(assert (= incomplete_suitability_report
   (and incomplete_suitability_report_filled
        (not exempted_by_product_characteristics))))

; [insurance_broker:other_violations] 其他違反本規則或相關法令
(assert (= other_violations other_violations_of_rules_or_laws))

; [insurance_broker:damage_insurance_image] 其他有損保險形象行為
(assert (= damage_insurance_image other_behaviors_damaging_insurance_image))

; [insurance_broker:violation_any] 違反保險經紀人管理規則第49條任一規定
(assert (= violation_any
   (or license_cancellation_delay
       contract_without_approval
       improper_fee_collection
       illegal_insurance_payment
       misleading_promotion
       unauthorized_delegation
       misconduct_reported
       unauthorized_advertisement
       failure_to_report
       damage_insurance_image
       induce_policy_surrender
       failure_to_confirm_suitability
       unqualified_employment
       induce_contract_termination
       improper_commission_payment
       criminal_conviction
       incomplete_suitability_report
       unauthorized_business_scope
       improper_document_handling
       coerce_or_induce
       sale_of_unapproved_foreign_products
       misappropriate_funds
       disrupt_financial_order
       unauthorized_business_suspension
       conflict_of_interest
       other_violations
       failure_to_reappoint
       conceal_important_info
       false_or_incomplete_report
       unauthorized_use_of_license)))

; [insurance_broker:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance_broker:penalty_conditions] 處罰條件：違反保險經紀人管理規則第49條任一規定時處罰
(assert (= penalty violation_any))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= false_report_on_license_application true))
(assert (= license_used_by_others true))
(assert (= misconduct_reported true))
(assert (= unauthorized_use_of_license true))
(assert (= violation_any true))
(assert (= business_outside_license_scope false))
(assert (= coerce_contract false))
(assert (= coerce_or_induce false))
(assert (= commission_paid_to_non_actual_broker false))
(assert (= conceal_important_info false))
(assert (= conflict_of_interest false))
(assert (= conflict_of_interest_employment_or_registration false))
(assert (= contract_with_unapproved_insurer false))
(assert (= contract_without_approval false))
(assert (= convicted_of_fraud_or_related_crimes false))
(assert (= criminal_conviction false))
(assert (= damage_insurance_image false))
(assert (= delay_in_license_cancellation false))
(assert (= demand_extra_benefits false))
(assert (= disrupt_financial_order false))
(assert (= employ_unqualified_personnel false))
(assert (= exaggerated_or_false_promotion false))
(assert (= exempted_by_product_characteristics false))
(assert (= failure_to_confirm_product_suitability false))
(assert (= failure_to_confirm_suitability false))
(assert (= failure_to_reappoint false))
(assert (= failure_to_reappoint_broker_after_resignation false))
(assert (= failure_to_report false))
(assert (= failure_to_report_to_broker_association false))
(assert (= false_or_incomplete_business_or_financial_report false))
(assert (= false_or_incomplete_report false))
(assert (= illegal_insurance_payment false))
(assert (= illegal_insurance_payment_made false))
(assert (= improper_commission_payment false))
(assert (= improper_document_handling false))
(assert (= improper_document_transferred false))
(assert (= improper_fee_collection false))
(assert (= improper_fee_or_commission_collection false))
(assert (= improper_inducement_of_policy_surrender false))
(assert (= incomplete_suitability_report false))
(assert (= incomplete_suitability_report_filled false))
(assert (= induce_contract false))
(assert (= induce_contract_termination false))
(assert (= induce_contract_termination_or_payment_by_loan false))
(assert (= induce_policy_surrender false))
(assert (= intentional_concealment_of_contract_info false))
(assert (= license_cancellation_delay false))
(assert (= misappropriate_funds false))
(assert (= misappropriation_of_insurance_funds false))
(assert (= misleading_promotion false))
(assert (= other_behaviors_damaging_insurance_image false))
(assert (= other_violations false))
(assert (= other_violations_of_rules_or_laws false))
(assert (= penalty true))
(assert (= prior_written_consent_obtained false))
(assert (= renewal_commission_payment_exempted false))
(assert (= restrict_contract_freedom false))
(assert (= sale_of_unapproved_foreign_discounted_policies false))
(assert (= sale_of_unapproved_foreign_products false))
(assert (= spread_false_information false))
(assert (= unauthorized_advertisement false))
(assert (= unauthorized_business_scope false))
(assert (= unauthorized_business_suspension false))
(assert (= unauthorized_business_suspension_or_termination false))
(assert (= unauthorized_delegation false))
(assert (= unauthorized_delegation_or_proxy false))
(assert (= unauthorized_use_of_insurance_advertisement false))
(assert (= unqualified_employment false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 33
; Total variables: 68
; Total facts: 68
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
