; SMT2 file generated from compliance case automatic
; Case ID: case_90
; Generated at: 2025-10-19T07:50:05.042744
;
; This file can be executed with Z3:
;   z3 case_90.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const assistance_and_order_compliance_56 Bool)
(declare-const bank_subsidiary_all_related_parties_limit_ok Bool)
(declare-const bank_subsidiary_all_related_parties_transaction_amount Real)
(declare-const bank_subsidiary_net_worth Real)
(declare-const bank_subsidiary_single_related_party_limit_ok Bool)
(declare-const bank_subsidiary_single_related_party_transaction_amount Real)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const business_scope_and_management_compliant Bool)
(declare-const capital_compliance_and_replenishment Bool)
(declare-const confidentiality_maintained Bool)
(declare-const counterparty_is_affiliated_enterprise_and_responsible_or_major_shareholder Bool)
(declare-const counterparty_is_bank_insurance_securities_subsidiary_or_responsible Bool)
(declare-const counterparty_is_fhc_and_responsible_or_major_shareholder Bool)
(declare-const counterparty_is_responsible_or_major_shareholder_business_or_enterprise Bool)
(declare-const disposition_within_deadline Bool)
(declare-const excluded_securities_ok Bool)
(declare-const fhc_establishment_applied Bool)
(declare-const holding_fhc_shares_compliant Bool)
(declare-const holding_shares_approved Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const issuance_conditions_compliant Bool)
(declare-const merger_and_transfer_permitted Bool)
(declare-const non_credit_transaction_compliance Bool)
(declare-const non_credit_transaction_conditions_met Bool)
(declare-const non_credit_transaction_counterparty_type Bool)
(declare-const non_credit_transaction_type Bool)
(declare-const order_compliance_55_1 Bool)
(declare-const penalty Bool)
(declare-const pledge_setting_compliant Bool)
(declare-const ratio_and_disposition_compliant Bool)
(declare-const reporting_and_announcement_compliant Bool)
(declare-const reporting_and_disclosure_compliant Bool)
(declare-const shareholding_reported_and_compliant Bool)
(declare-const short_term_funds_and_investment_compliant Bool)
(declare-const transaction_includes_bank_subsidiary_negotiable_certificate Bool)
(declare-const transaction_involves_related_third_party Bool)
(declare-const transaction_is_agent_broker_or_commission_service Bool)
(declare-const transaction_is_contract_for_payment_or_service Bool)
(declare-const transaction_is_invest_or_purchase_securities Bool)
(declare-const transaction_is_purchase_real_estate_or_other_assets Bool)
(declare-const transaction_is_sale_securities_real_estate_or_other_assets Bool)
(declare-const violation_45_article Bool)
(declare-const violation_60_article_1 Bool)
(declare-const violation_60_article_10 Bool)
(declare-const violation_60_article_11 Bool)
(declare-const violation_60_article_12 Bool)
(declare-const violation_60_article_13 Bool)
(declare-const violation_60_article_14 Bool)
(declare-const violation_60_article_15 Bool)
(declare-const violation_60_article_16 Bool)
(declare-const violation_60_article_17 Bool)
(declare-const violation_60_article_18 Bool)
(declare-const violation_60_article_19 Bool)
(declare-const violation_60_article_2 Bool)
(declare-const violation_60_article_3 Bool)
(declare-const violation_60_article_4 Bool)
(declare-const violation_60_article_5 Bool)
(declare-const violation_60_article_6 Bool)
(declare-const violation_60_article_7 Bool)
(declare-const violation_60_article_8 Bool)
(declare-const violation_60_article_9 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:non_credit_transaction_conditions_met] 授信以外交易條件符合董事會決議比例
(assert (= non_credit_transaction_conditions_met
   (and (<= (/ 6666667.0 10000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio))))

; [fhc:non_credit_transaction_counterparty_type] 授信以外交易對象類型符合規定
(assert (= non_credit_transaction_counterparty_type
   (or counterparty_is_responsible_or_major_shareholder_business_or_enterprise
       counterparty_is_affiliated_enterprise_and_responsible_or_major_shareholder
       counterparty_is_bank_insurance_securities_subsidiary_or_responsible
       counterparty_is_fhc_and_responsible_or_major_shareholder)))

; [fhc:non_credit_transaction_type] 授信以外交易行為類型符合規定
(assert (= non_credit_transaction_type
   (or transaction_involves_related_third_party
       transaction_is_purchase_real_estate_or_other_assets
       transaction_is_sale_securities_real_estate_or_other_assets
       transaction_is_invest_or_purchase_securities
       transaction_is_contract_for_payment_or_service
       transaction_is_agent_broker_or_commission_service)))

; [fhc:excluded_securities] 有價證券不包括銀行子公司發行之可轉讓定期存單
(assert (not (= transaction_includes_bank_subsidiary_negotiable_certificate
        excluded_securities_ok)))

; [fhc:bank_subsidiary_single_related_party_limit_ok] 銀行子公司與單一關係人交易金額不超過淨值10%
(assert (= bank_subsidiary_single_related_party_limit_ok
   (<= bank_subsidiary_single_related_party_transaction_amount
       (* (/ 1.0 10.0) bank_subsidiary_net_worth))))

; [fhc:bank_subsidiary_all_related_parties_limit_ok] 銀行子公司與所有利害關係人交易總額不超過淨值20%
(assert (= bank_subsidiary_all_related_parties_limit_ok
   (<= bank_subsidiary_all_related_parties_transaction_amount
       (* (/ 1.0 5.0) bank_subsidiary_net_worth))))

; [fhc:non_credit_transaction_compliance] 授信以外交易符合所有規定
(assert (= non_credit_transaction_compliance
   (and non_credit_transaction_conditions_met
        non_credit_transaction_counterparty_type
        non_credit_transaction_type
        excluded_securities_ok
        bank_subsidiary_single_related_party_limit_ok
        bank_subsidiary_all_related_parties_limit_ok)))

; [fhc:violation_45_article] 違反金融控股公司法第45條規定
(assert (not (= non_credit_transaction_compliance violation_45_article)))

; [fhc:violation_60_article_1] 違反第6條第一項規定，未申請設立金融控股公司
(assert (not (= fhc_establishment_applied violation_60_article_1)))

; [fhc:violation_60_article_2] 違反第16條第三項規定，未經主管機關核准而持有股份
(assert (not (= holding_shares_approved violation_60_article_2)))

; [fhc:violation_60_article_3] 違反第16條第一項、第二項或第九項規定未向主管機關申報，或違反同條第七項但書規定增加持股
(assert (not (= shareholding_reported_and_compliant violation_60_article_3)))

; [fhc:violation_60_article_4] 違反第16條第十項規定，未依主管機關所定期限處分
(assert (not (= disposition_within_deadline violation_60_article_4)))

; [fhc:violation_60_article_5] 違反主管機關依第16條第五項所定辦法中有關申報或公告之規定
(assert (not (= reporting_and_announcement_compliant violation_60_article_5)))

; [fhc:violation_60_article_6] 違反第16條第六項規定，為質權之設定
(assert (not (= pledge_setting_compliant violation_60_article_6)))

; [fhc:violation_60_article_7] 違反第18條第一項規定，未經許可為合併、概括讓與或概括承受
(assert (not (= merger_and_transfer_permitted violation_60_article_7)))

; [fhc:violation_60_article_8] 違反第38條規定，持有金融控股公司之股份
(assert (not (= holding_fhc_shares_compliant violation_60_article_8)))

; [fhc:violation_60_article_9] 違反第39條第一項所定短期資金運用項目；或違反同條第二項規定，未經核准投資不動產或投資非自用不動產
(assert (not (= short_term_funds_and_investment_compliant violation_60_article_9)))

; [fhc:violation_60_article_10] 違反主管機關依第39條第三項所定辦法中有關發行條件或期限之規定
(assert (not (= issuance_conditions_compliant violation_60_article_10)))

; [fhc:violation_60_article_11] 違反主管機關依第40條或第41條所定之比率或所為之處置或限制
(assert (not (= ratio_and_disposition_compliant violation_60_article_11)))

; [fhc:violation_60_article_12] 違反第42條第一項規定，未保守秘密
(assert (not (= confidentiality_maintained violation_60_article_12)))

; [fhc:violation_60_article_13] 違反第43條第一項、第二項或第四項規定；或違反主管機關依同條第三項所定辦法中有關可從事之業務範圍、資訊交互運用、共用設備、場所或人員管理之規定
(assert (not (= business_scope_and_management_compliant violation_60_article_13)))

; [fhc:violation_60_article_14] 違反第45條第一項交易條件之限制或董事會之決議方法；或違反同條第四項所定之金額比率
(assert (not (= non_credit_transaction_compliance violation_60_article_14)))

; [fhc:violation_60_article_15] 違反第46條第一項規定，未向主管機關申報或揭露
(assert (not (= reporting_and_disclosure_compliant violation_60_article_15)))

; [fhc:violation_60_article_16] 違反第51條規定，未建立內部控制或稽核制度，或未確實執行
(assert (not (= (and internal_control_established internal_control_executed)
        violation_60_article_16)))

; [fhc:violation_60_article_17] 違反第53條第一項或第二項規定；或未於主管機關依同條第三項所定期限內補足資本
(assert (not (= capital_compliance_and_replenishment violation_60_article_17)))

; [fhc:violation_60_article_18] 違反主管機關依第55條第一項所為之命令
(assert (not (= order_compliance_55_1 violation_60_article_18)))

; [fhc:violation_60_article_19] 違反第56條第一項規定，未盡協助義務；或違反主管機關依同條第二項所為之命令
(assert (not (= assistance_and_order_compliance_56 violation_60_article_19)))

; [insurance:internal_control_and_audit_ok] 保險業建立內部控制及稽核制度且確實執行
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 保險業建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法第45條或第60條規定，或保險法內部控制及處理制度規定時處罰
(assert (= penalty
   (or violation_60_article_15
       violation_60_article_9
       violation_60_article_12
       violation_60_article_1
       violation_60_article_16
       violation_60_article_3
       violation_60_article_10
       violation_60_article_2
       violation_60_article_13
       violation_60_article_6
       violation_60_article_17
       violation_60_article_11
       violation_60_article_14
       violation_60_article_18
       violation_45_article
       violation_60_article_5
       (not internal_handling_ok)
       violation_60_article_19
       violation_60_article_8
       violation_60_article_4
       violation_60_article_7
       (not internal_control_and_audit_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= non_credit_transaction_conditions_met false))
(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 1.0 2.0)))
(assert (= non_credit_transaction_counterparty_type true))
(assert (= counterparty_is_fhc_and_responsible_or_major_shareholder false))
(assert (= counterparty_is_responsible_or_major_shareholder_business_or_enterprise true))
(assert (= counterparty_is_affiliated_enterprise_and_responsible_or_major_shareholder false))
(assert (= counterparty_is_bank_insurance_securities_subsidiary_or_responsible false))
(assert (= non_credit_transaction_type true))
(assert (= transaction_is_invest_or_purchase_securities false))
(assert (= transaction_is_purchase_real_estate_or_other_assets false))
(assert (= transaction_is_sale_securities_real_estate_or_other_assets false))
(assert (= transaction_is_contract_for_payment_or_service true))
(assert (= transaction_is_agent_broker_or_commission_service false))
(assert (= transaction_involves_related_third_party true))
(assert (= excluded_securities_ok true))
(assert (= transaction_includes_bank_subsidiary_negotiable_certificate false))
(assert (= bank_subsidiary_single_related_party_limit_ok true))
(assert (= bank_subsidiary_single_related_party_transaction_amount 0.0))
(assert (= bank_subsidiary_net_worth 1000000000.0))
(assert (= bank_subsidiary_all_related_parties_limit_ok true))
(assert (= bank_subsidiary_all_related_parties_transaction_amount 0.0))
(assert (= non_credit_transaction_compliance false))
(assert (= violation_45_article true))
(assert (= fhc_establishment_applied true))
(assert (= violation_60_article_1 false))
(assert (= holding_shares_approved true))
(assert (= violation_60_article_2 false))
(assert (= shareholding_reported_and_compliant true))
(assert (= violation_60_article_3 false))
(assert (= disposition_within_deadline true))
(assert (= violation_60_article_4 false))
(assert (= reporting_and_announcement_compliant true))
(assert (= violation_60_article_5 false))
(assert (= pledge_setting_compliant true))
(assert (= violation_60_article_6 false))
(assert (= merger_and_transfer_permitted true))
(assert (= violation_60_article_7 false))
(assert (= holding_fhc_shares_compliant true))
(assert (= violation_60_article_8 false))
(assert (= short_term_funds_and_investment_compliant true))
(assert (= violation_60_article_9 false))
(assert (= issuance_conditions_compliant true))
(assert (= violation_60_article_10 false))
(assert (= ratio_and_disposition_compliant false))
(assert (= violation_60_article_11 true))
(assert (= confidentiality_maintained true))
(assert (= violation_60_article_12 false))
(assert (= business_scope_and_management_compliant true))
(assert (= violation_60_article_13 false))
(assert (= violation_60_article_14 true))
(assert (= reporting_and_disclosure_compliant false))
(assert (= violation_60_article_15 true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= violation_60_article_16 true))
(assert (= capital_compliance_and_replenishment true))
(assert (= violation_60_article_17 false))
(assert (= order_compliance_55_1 true))
(assert (= violation_60_article_18 false))
(assert (= assistance_and_order_compliance_56 true))
(assert (= violation_60_article_19 false))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 31
; Total variables: 67
; Total facts: 67
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
