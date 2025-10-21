; SMT2 file generated from compliance case automatic
; Case ID: case_134
; Generated at: 2025-10-21T02:42:40.209398
;
; This file can be executed with Z3:
;   z3 case_134.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_outside_license_scope Bool)
(declare-const coerce_or_induce Bool)
(declare-const conceal_important_info Bool)
(declare-const conflict_of_interest Bool)
(declare-const conflict_of_interest_employment_or_registration Bool)
(declare-const contract_with_unapproved_insurer Bool)
(declare-const contract_without_approval Bool)
(declare-const convicted_of_embezzlement_fraud_breach_of_trust_or_forgery Bool)
(declare-const criminal_conviction Bool)
(declare-const damage_insurance_image Bool)
(declare-const disrupt_financial_order Bool)
(declare-const employ_unqualified_insurance_recruiter Bool)
(declare-const employ_unqualified_recruiter Bool)
(declare-const exaggerated_or_false_promotion Bool)
(declare-const failure_to_appoint_replacement Bool)
(declare-const failure_to_appoint_replacement_broker Bool)
(declare-const failure_to_confirm_product_suitability Bool)
(declare-const failure_to_confirm_suitability Bool)
(declare-const failure_to_report_to_association Bool)
(declare-const failure_to_report_to_broker_association Bool)
(declare-const false_or_incomplete_business_or_financial_report Bool)
(declare-const false_or_incomplete_recruitment_report Bool)
(declare-const false_or_incomplete_report Bool)
(declare-const false_reported_on_license_application Bool)
(declare-const illegal_insurance_payment Bool)
(declare-const improper_commission_payment Bool)
(declare-const improper_commission_payment_to_non_actual_recruiter Bool)
(declare-const improper_document_transfer Bool)
(declare-const improper_fee_collection Bool)
(declare-const improper_fee_or_commission_collection Bool)
(declare-const improper_inducement_of_policy_surrender_or_transfer_or_loan Bool)
(declare-const improper_transfer_of_application_documents Bool)
(declare-const induce_contract_termination Bool)
(declare-const induce_contract_termination_or_payment_by_loan Bool)
(declare-const induce_policy_surrender Bool)
(declare-const intentional_concealment_of_contract_info Bool)
(declare-const license_not_canceled_in_time Bool)
(declare-const license_not_canceled_within_deadline Bool)
(declare-const license_used_by_others_without_execution Bool)
(declare-const misappropriate_funds Bool)
(declare-const misappropriation_of_insurance_funds Bool)
(declare-const misconduct_reported Bool)
(declare-const misleading_promotion Bool)
(declare-const other_behavior_damaging_insurance_image Bool)
(declare-const other_violations Bool)
(declare-const other_violations_of_rules_or_laws Bool)
(declare-const penalty Bool)
(declare-const sale_of_unapproved_foreign_policy Bool)
(declare-const sale_of_unapproved_foreign_policy_discount_benefit Bool)
(declare-const spread_false_information_or_disrupt_financial_order Bool)
(declare-const unauthorized_advertisement Bool)
(declare-const unauthorized_business_scope Bool)
(declare-const unauthorized_business_suspension Bool)
(declare-const unauthorized_business_suspension_or_termination Bool)
(declare-const unauthorized_delegation Bool)
(declare-const unauthorized_delegation_or_use_of_others_name Bool)
(declare-const unauthorized_use_of_insurance_advertisement Bool)
(declare-const unauthorized_use_of_license Bool)
(declare-const use_position_to_coerce_or_induce_or_limit_contract_freedom_or_extra_fee Bool)
(declare-const violation_167_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_broker:misconduct_reported] 申領執業證照時具報不實
(assert (= misconduct_reported false_reported_on_license_application))

; [insurance_broker:contract_without_approval] 為未經核准登記之保險業洽訂保險契約
(assert (= contract_without_approval contract_with_unapproved_insurer))

; [insurance_broker:conceal_important_info] 故意隱匿保險契約之重要事項
(assert (= conceal_important_info intentional_concealment_of_contract_info))

; [insurance_broker:coerce_or_induce] 利用職務或業務便利強迫、引誘或限制締約自由或索取額外報酬
(assert (= coerce_or_induce
   use_position_to_coerce_or_induce_or_limit_contract_freedom_or_extra_fee))

; [insurance_broker:misleading_promotion] 以誇大不實、引人錯誤之宣傳、廣告或其他不當方法經營或執行業務
(assert (= misleading_promotion exaggerated_or_false_promotion))

; [insurance_broker:induce_policy_surrender] 以不當手段慫恿保戶退保、轉保或貸款
(assert (= induce_policy_surrender
   improper_inducement_of_policy_surrender_or_transfer_or_loan))

; [insurance_broker:misappropriate_funds] 挪用或侵占保險費、再保險費、保險金或再保險賠款
(assert (= misappropriate_funds misappropriation_of_insurance_funds))

; [insurance_broker:unauthorized_use_of_license] 本人未執行業務而以執業證照供他人使用
(assert (= unauthorized_use_of_license license_used_by_others_without_execution))

; [insurance_broker:criminal_conviction] 有侵占、詐欺、背信、偽造文書行為受刑之宣告
(assert (= criminal_conviction
   convicted_of_embezzlement_fraud_breach_of_trust_or_forgery))

; [insurance_broker:unauthorized_business_scope] 經營或執行執業證照所載範圍以外之保險業務
(assert (= unauthorized_business_scope business_outside_license_scope))

; [insurance_broker:improper_fee_collection] 以其他費用名目或第三人名義向保險人收取不合理報酬
(assert (= improper_fee_collection improper_fee_or_commission_collection))

; [insurance_broker:illegal_insurance_payment] 以不法方式使保險人為不當保險給付
(assert true)

; [insurance_broker:disrupt_financial_order] 散播不實言論或文宣擾亂金融秩序
(assert (= disrupt_financial_order spread_false_information_or_disrupt_financial_order))

; [insurance_broker:unauthorized_delegation] 授權第三人代為經營或以他人名義經營業務
(assert (= unauthorized_delegation unauthorized_delegation_or_use_of_others_name))

; [insurance_broker:improper_document_transfer] 將非所任用經紀人或非所屬保險業務員招攬之要保文件轉報保險人或轉由他人交付
(assert (= improper_document_transfer improper_transfer_of_application_documents))

; [insurance_broker:employ_unqualified_recruiter] 聘用未具保險招攬資格者為招攬保險業務
(assert (= employ_unqualified_recruiter employ_unqualified_insurance_recruiter))

; [insurance_broker:license_not_canceled_in_time] 未依規定期限內辦理繳銷或註銷執業證照
(assert (= license_not_canceled_in_time license_not_canceled_within_deadline))

; [insurance_broker:unauthorized_business_suspension] 擅自停業、暫停業務、復業、解散或終止業務
(assert (= unauthorized_business_suspension
   unauthorized_business_suspension_or_termination))

; [insurance_broker:failure_to_appoint_replacement] 經紀人公司或銀行未於經紀人離職時依規定任用經紀人
(assert (= failure_to_appoint_replacement failure_to_appoint_replacement_broker))

; [insurance_broker:failure_to_report_to_association] 未依主管機關規定向經紀人公會報備相關事項
(assert (= failure_to_report_to_association failure_to_report_to_broker_association))

; [insurance_broker:unauthorized_advertisement] 使用非保險業提供或未經同意之保險商品廣告宣傳內容
(assert (= unauthorized_advertisement unauthorized_use_of_insurance_advertisement))

; [insurance_broker:improper_commission_payment] 將佣酬支付予非實際招攬之保險業務員及其主管（續期佣酬除外）
(assert (= improper_commission_payment
   improper_commission_payment_to_non_actual_recruiter))

; [insurance_broker:failure_to_confirm_suitability] 未確認金融消費者對保險商品之適合度（含65歲以上客戶）
(assert (= failure_to_confirm_suitability failure_to_confirm_product_suitability))

; [insurance_broker:sale_of_unapproved_foreign_policy] 銷售未經主管機關許可之國外保單貼現受益權憑證商品
(assert (= sale_of_unapproved_foreign_policy
   sale_of_unapproved_foreign_policy_discount_benefit))

; [insurance_broker:false_or_incomplete_report] 提報業務或財務報表資料不實或不全
(assert (= false_or_incomplete_report false_or_incomplete_business_or_financial_report))

; [insurance_broker:conflict_of_interest] 任職於保險業、擔任有關公會現職人員或登錄為保險業務員
(assert (= conflict_of_interest conflict_of_interest_employment_or_registration))

; [insurance_broker:induce_contract_termination] 勸誘客戶解除或終止契約，或以貸款、定存解約或保險單借款繳交保險費
(assert (= induce_contract_termination induce_contract_termination_or_payment_by_loan))

; [insurance_broker:false_or_incomplete_recruitment_report] 未據實填寫招攬報告書（含65歲以上客戶投保案件）
(assert true)

; [insurance_broker:other_violations] 其他違反本規則或相關法令
(assert (= other_violations other_violations_of_rules_or_laws))

; [insurance_broker:damage_insurance_image] 其他有損保險形象行為
(assert (= damage_insurance_image other_behavior_damaging_insurance_image))

; [insurance:violation_167_2] 違反保險法第167-2條相關規定
(assert (= violation_167_2
   (or unauthorized_business_scope
       conceal_important_info
       conflict_of_interest
       improper_fee_collection
       other_violations
       failure_to_confirm_suitability
       sale_of_unapproved_foreign_policy
       false_or_incomplete_recruitment_report
       unauthorized_business_suspension
       contract_without_approval
       misconduct_reported
       misleading_promotion
       damage_insurance_image
       criminal_conviction
       license_not_canceled_in_time
       improper_document_transfer
       induce_contract_termination
       improper_commission_payment
       disrupt_financial_order
       employ_unqualified_recruiter
       failure_to_appoint_replacement
       unauthorized_delegation
       coerce_or_induce
       unauthorized_use_of_license
       failure_to_report_to_association
       false_or_incomplete_report
       unauthorized_advertisement
       illegal_insurance_payment
       misappropriate_funds
       induce_policy_surrender)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法第167-2條相關規定時處罰
(assert (= penalty violation_167_2))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= employ_unqualified_insurance_recruiter true))
(assert (= employ_unqualified_recruiter true))
(assert (= improper_fee_or_commission_collection true))
(assert (= improper_fee_collection true))
(assert (= contract_with_unapproved_insurer true))
(assert (= contract_without_approval true))
(assert (= violation_167_2 true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 33
; Total variables: 60
; Total facts: 8
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
