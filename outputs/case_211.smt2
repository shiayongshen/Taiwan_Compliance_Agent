; SMT2 file generated from compliance case automatic
; Case ID: case_211
; Generated at: 2025-10-21T04:41:30.102318
;
; This file can be executed with Z3:
;   z3 case_211.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const article_16_10_compliance Bool)
(declare-const article_16_1_2_9_7_compliance Bool)
(declare-const article_16_3_compliance Bool)
(declare-const article_16_5_compliance Bool)
(declare-const article_16_6_compliance Bool)
(declare-const article_18_1_compliance Bool)
(declare-const article_38_compliance Bool)
(declare-const article_39_1_2_compliance Bool)
(declare-const article_39_3_compliance Bool)
(declare-const article_40_41_compliance Bool)
(declare-const article_42_1_compliance Bool)
(declare-const article_43_1_2_4_compliance Bool)
(declare-const article_45_1_4_compliance Bool)
(declare-const article_46_1_compliance Bool)
(declare-const article_51_compliance Bool)
(declare-const article_53_1_2_compliance Bool)
(declare-const article_55_1_compliance Bool)
(declare-const article_56_1_compliance Bool)
(declare-const article_6_1_compliance Bool)
(declare-const asset_transaction_approval_required Bool)
(declare-const asset_transaction_exclusion Bool)
(declare-const asset_transaction_reporting_required Bool)
(declare-const asset_transaction_shareholder_approval_required Bool)
(declare-const bank_subsidiary_all_related_party_limit_ok Bool)
(declare-const bank_subsidiary_all_related_party_transaction_amount Real)
(declare-const bank_subsidiary_net_worth Real)
(declare-const bank_subsidiary_single_related_party_limit_ok Bool)
(declare-const bank_subsidiary_single_related_party_transaction_amount Real)
(declare-const board_approval Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const board_member_recusal Bool)
(declare-const board_member_recusal_compliance Bool)
(declare-const domestic_government_bond Bool)
(declare-const insurance_owner_equity Real)
(declare-const internal_operation_rules_authorized Bool)
(declare-const is_fhc_affiliated_company_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_bank_insurance_securities_subsidiary_or_subsidiary_responsible Bool)
(declare-const is_fhc_responsible_or_major_shareholder_sole_proprietor_or_partner_or_enterprise_or_representative Bool)
(declare-const is_transaction_between_parent_subsidiaries Bool)
(declare-const money_market_fund Bool)
(declare-const no_proxy_vote Bool)
(declare-const non_credit_transaction_compliance Bool)
(declare-const non_credit_transaction_condition_met Bool)
(declare-const non_credit_transaction_party Bool)
(declare-const non_loan_transaction_all_related_party_amount Real)
(declare-const non_loan_transaction_authorized Bool)
(declare-const non_loan_transaction_compliance Bool)
(declare-const non_loan_transaction_condition_met Bool)
(declare-const non_loan_transaction_limit_all_related_party_ok Bool)
(declare-const non_loan_transaction_limit_single_related_party_ok Bool)
(declare-const non_loan_transaction_single_related_party_amount Real)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const repo_bond Bool)
(declare-const single_corporate_shareholder Bool)
(declare-const supervisor_approval Bool)
(declare-const total_assets Real)
(declare-const transaction_amount Real)
(declare-const transaction_condition_not_better_than_others Bool)
(declare-const transaction_type Bool)
(declare-const violation_article_45 Bool)
(declare-const violation_article_60_1 Bool)
(declare-const violation_article_60_10 Bool)
(declare-const violation_article_60_11 Bool)
(declare-const violation_article_60_12 Bool)
(declare-const violation_article_60_13 Bool)
(declare-const violation_article_60_14 Bool)
(declare-const violation_article_60_15 Bool)
(declare-const violation_article_60_16 Bool)
(declare-const violation_article_60_17 Bool)
(declare-const violation_article_60_18 Bool)
(declare-const violation_article_60_19 Bool)
(declare-const violation_article_60_2 Bool)
(declare-const violation_article_60_3 Bool)
(declare-const violation_article_60_4 Bool)
(declare-const violation_article_60_5 Bool)
(declare-const violation_article_60_6 Bool)
(declare-const violation_article_60_7 Bool)
(declare-const violation_article_60_8 Bool)
(declare-const violation_article_60_9 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:non_credit_transaction_party] 授信以外交易對象分類
(assert (let ((a!1 (ite is_fhc_and_responsible_or_major_shareholder
                1
                (ite is_fhc_responsible_or_major_shareholder_sole_proprietor_or_partner_or_enterprise_or_representative
                     2
                     (ite is_fhc_affiliated_company_and_responsible_or_major_shareholder
                          3
                          (ite is_fhc_bank_insurance_securities_subsidiary_or_subsidiary_responsible
                               4
                               0))))))
  (= (ite non_credit_transaction_party 1 0) a!1)))

; [fhc:non_credit_transaction_condition_met] 授信以外交易條件不得優於其他同類對象且董事會決議通過
(assert (= non_credit_transaction_condition_met
   (and transaction_condition_not_better_than_others
        (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio))))

; [fhc:bank_subsidiary_single_related_party_limit_ok] 銀行子公司與單一關係人交易金額不超過淨值10%
(assert (= bank_subsidiary_single_related_party_limit_ok
   (<= bank_subsidiary_single_related_party_transaction_amount
       (* (/ 1.0 10.0) bank_subsidiary_net_worth))))

; [fhc:bank_subsidiary_all_related_party_limit_ok] 銀行子公司與所有利害關係人交易總額不超過淨值20%
(assert (= bank_subsidiary_all_related_party_limit_ok
   (<= bank_subsidiary_all_related_party_transaction_amount
       (* (/ 1.0 5.0) bank_subsidiary_net_worth))))

; [fhc:non_credit_transaction_compliance] 授信以外交易符合條件及限額規定
(assert (= non_credit_transaction_compliance
   (and non_credit_transaction_condition_met
        bank_subsidiary_single_related_party_limit_ok
        bank_subsidiary_all_related_party_limit_ok)))

; [fhc:violation_article_45] 違反金融控股公司法第45條規定
(assert (= violation_article_45
   (or (not bank_subsidiary_single_related_party_limit_ok)
       (not non_credit_transaction_condition_met)
       (not bank_subsidiary_all_related_party_limit_ok))))

; [fhc:violation_article_60_1] 違反第六條第一項規定，未申請設立金融控股公司
(assert (not (= article_6_1_compliance violation_article_60_1)))

; [fhc:violation_article_60_2] 違反第十六條第三項規定，未經主管機關核准而持有股份
(assert (not (= article_16_3_compliance violation_article_60_2)))

; [fhc:violation_article_60_3] 違反第十六條第一項、第二項或第九項規定未向主管機關申報，或違反同條第七項但書規定增加持股
(assert (not (= article_16_1_2_9_7_compliance violation_article_60_3)))

; [fhc:violation_article_60_4] 違反第十六條第十項規定，未依主管機關所定期限處分
(assert (not (= article_16_10_compliance violation_article_60_4)))

; [fhc:violation_article_60_5] 違反主管機關依第十六條第五項所定辦法中有關申報或公告之規定
(assert (not (= article_16_5_compliance violation_article_60_5)))

; [fhc:violation_article_60_6] 違反第十六條第六項規定，為質權之設定
(assert (not (= article_16_6_compliance violation_article_60_6)))

; [fhc:violation_article_60_7] 違反第十八條第一項規定，未經許可為合併、概括讓與或概括承受
(assert (not (= article_18_1_compliance violation_article_60_7)))

; [fhc:violation_article_60_8] 違反第三十八條規定，持有金融控股公司之股份
(assert (not (= article_38_compliance violation_article_60_8)))

; [fhc:violation_article_60_9] 違反第三十九條第一項所定短期資金運用項目；或違反同條第二項規定，未經核准投資不動產或投資非自用不動產
(assert (not (= article_39_1_2_compliance violation_article_60_9)))

; [fhc:violation_article_60_10] 違反主管機關依第三十九條第三項所定辦法中有關發行條件或期限之規定
(assert (not (= article_39_3_compliance violation_article_60_10)))

; [fhc:violation_article_60_11] 違反主管機關依第四十條或第四十一條所定之比率或所為之處置或限制
(assert (not (= article_40_41_compliance violation_article_60_11)))

; [fhc:violation_article_60_12] 違反第四十二條第一項規定，未保守秘密
(assert (not (= article_42_1_compliance violation_article_60_12)))

; [fhc:violation_article_60_13] 違反第四十三條第一項、第二項或第四項規定；或違反主管機關依同條第三項所定辦法中有關可從事之業務範圍、資訊交互運用、共用設備、場所或人員管理之規定
(assert (not (= article_43_1_2_4_compliance violation_article_60_13)))

; [fhc:violation_article_60_14] 違反第四十五條第一項交易條件之限制或董事會之決議方法；或違反同條第四項所定之金額比率
(assert (not (= article_45_1_4_compliance violation_article_60_14)))

; [fhc:violation_article_60_15] 違反第四十六條第一項規定，未向主管機關申報或揭露
(assert (not (= article_46_1_compliance violation_article_60_15)))

; [fhc:violation_article_60_16] 違反第五十一條規定，未建立內部控制或稽核制度，或未確實執行
(assert (not (= article_51_compliance violation_article_60_16)))

; [fhc:violation_article_60_17] 違反第五十三條第一項或第二項規定；或未於主管機關依同條第三項所定期限內補足資本
(assert (not (= article_53_1_2_compliance violation_article_60_17)))

; [fhc:violation_article_60_18] 違反主管機關依第五十五條第一項所為之命令
(assert (not (= article_55_1_compliance violation_article_60_18)))

; [fhc:violation_article_60_19] 違反第五十六條第一項規定，未盡協助義務；或違反主管機關依同條第二項所為之命令
(assert (not (= article_56_1_compliance violation_article_60_19)))

; [insurance:non_loan_transaction_condition_met] 保險業與利害關係人從事放款以外其他交易條件不得優於其他同類對象且董事會決議通過
(assert (= non_loan_transaction_condition_met
   (and transaction_condition_not_better_than_others
        (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio))))

; [insurance:board_member_recusal_compliance] 出席董事對本人或利害關係者案件迴避且不得代理表決權（單一法人股東組織除外）
(assert (= board_member_recusal_compliance
   (or single_corporate_shareholder (and board_member_recusal no_proxy_vote))))

; [insurance:non_loan_transaction_authorized] 符合董事會授權及交易條件不得優於其他同類對象之規定
(assert (= non_loan_transaction_authorized
   (and internal_operation_rules_authorized
        (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio)
        transaction_condition_not_better_than_others)))

; [insurance:non_loan_transaction_limit_single_related_party_ok] 與單一利害關係人交易總餘額不超過業主權益10%
(assert (= non_loan_transaction_limit_single_related_party_ok
   (<= non_loan_transaction_single_related_party_amount
       (* (/ 1.0 10.0) insurance_owner_equity))))

; [insurance:non_loan_transaction_limit_all_related_party_ok] 與所有利害關係人交易總餘額不超過業主權益60%
(assert (= non_loan_transaction_limit_all_related_party_ok
   (<= non_loan_transaction_all_related_party_amount
       (* (/ 3.0 5.0) insurance_owner_equity))))

; [insurance:non_loan_transaction_compliance] 保險業與利害關係人從事放款以外其他交易符合條件及限額規定
(assert (= non_loan_transaction_compliance
   (and non_loan_transaction_condition_met
        board_member_recusal_compliance
        non_loan_transaction_limit_single_related_party_ok
        non_loan_transaction_limit_all_related_party_ok)))

; [public_company:asset_transaction_reporting_required] 公開發行公司與關係人取得或處分資產達一定金額須提交董事會及監察人承認
(assert (= asset_transaction_reporting_required
   (or (>= transaction_amount (* (/ 1.0 5.0) paid_in_capital))
       (>= transaction_amount (* (/ 1.0 10.0) total_assets))
       (<= 300000000.0 transaction_amount))))

; [public_company:asset_transaction_exclusion] 不包括買賣國內公債、附買回賣回條件債券及申購或買回國內證券投資信託事業貨幣市場基金
(assert (not (= (or (= transaction_type domestic_government_bond)
            (= transaction_type money_market_fund)
            (= transaction_type repo_bond))
        asset_transaction_exclusion)))

; [public_company:asset_transaction_approval_required] 須提交董事會通過及監察人承認後始得簽訂交易契約及支付款項
(assert (= asset_transaction_approval_required
   (and asset_transaction_reporting_required
        asset_transaction_exclusion
        board_approval
        supervisor_approval)))

; [public_company:asset_transaction_shareholder_approval_required] 交易金額達總資產10%以上須提交股東會同意後始得簽訂交易契約及支付款項
(assert (= asset_transaction_shareholder_approval_required
   (and (>= transaction_amount (* (/ 1.0 10.0) total_assets))
        board_approval
        supervisor_approval
        (not is_transaction_between_parent_subsidiaries))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法第45條交易條件限制或董事會決議方法，或銀行子公司交易限額規定；及違反第60條各款規定
(assert (= penalty
   (or violation_article_60_3
       violation_article_60_9
       violation_article_60_7
       violation_article_60_8
       violation_article_60_19
       violation_article_60_10
       violation_article_60_6
       violation_article_60_4
       violation_article_60_11
       violation_article_60_5
       violation_article_60_12
       violation_article_60_18
       violation_article_60_1
       violation_article_60_16
       violation_article_60_2
       violation_article_60_15
       violation_article_45
       violation_article_60_14
       violation_article_60_17
       violation_article_60_13)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= transaction_condition_not_better_than_others false))
(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 7.0 10.0)))
(assert (= article_45_1_4_compliance false))
(assert (= violation_article_60_14 true))
(assert (= violation_article_45 true))
(assert (= non_credit_transaction_condition_met false))
(assert (= bank_subsidiary_single_related_party_limit_ok true))
(assert (= bank_subsidiary_all_related_party_limit_ok true))
(assert (= non_credit_transaction_compliance false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 37
; Total variables: 82
; Total facts: 11
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
