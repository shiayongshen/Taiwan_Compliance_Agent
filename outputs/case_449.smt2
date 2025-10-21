; SMT2 file generated from compliance case automatic
; Case ID: case_449
; Generated at: 2025-10-21T10:07:49.111384
;
; This file can be executed with Z3:
;   z3 case_449.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bank_subsidiary_all_related_limit_ok Bool)
(declare-const bank_subsidiary_all_related_transaction_amount Real)
(declare-const bank_subsidiary_net_worth Real)
(declare-const bank_subsidiary_single_related_limit_ok Bool)
(declare-const bank_subsidiary_single_related_transaction_amount Real)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const fhc_16_10_compliance Bool)
(declare-const fhc_16_1_2_9_7_compliance Bool)
(declare-const fhc_16_3_compliance Bool)
(declare-const fhc_16_5_compliance Bool)
(declare-const fhc_16_6_compliance Bool)
(declare-const fhc_18_1_compliance Bool)
(declare-const fhc_38_compliance Bool)
(declare-const fhc_39_1_2_compliance Bool)
(declare-const fhc_39_3_compliance Bool)
(declare-const fhc_40_41_compliance Bool)
(declare-const fhc_42_1_compliance Bool)
(declare-const fhc_43_compliance Bool)
(declare-const fhc_45_compliance Bool)
(declare-const fhc_46_1_compliance Bool)
(declare-const fhc_51_compliance Bool)
(declare-const fhc_53_compliance Bool)
(declare-const fhc_55_1_compliance Bool)
(declare-const fhc_56_compliance Bool)
(declare-const fhc_6_1_compliance Bool)
(declare-const is_fhc_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_bank_insurance_securities_subsidiary_or_responsible Bool)
(declare-const is_fhc_related_enterprise_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_responsible_or_major_shareholder_business Bool)
(declare-const non_credit_transaction_condition_met Bool)
(declare-const penalty Bool)
(declare-const related_party_involved Bool)
(declare-const transaction_agent_commission_service Bool)
(declare-const transaction_condition_preferential_degree Real)
(declare-const transaction_condition_valid Bool)
(declare-const transaction_contract_payment_service Bool)
(declare-const transaction_invest_security Bool)
(declare-const transaction_purchase_asset Bool)
(declare-const transaction_related_third_party Bool)
(declare-const transaction_sell_asset Bool)
(declare-const violation_fhc_45 Bool)
(declare-const violation_fhc_60_1 Bool)
(declare-const violation_fhc_60_10 Bool)
(declare-const violation_fhc_60_11 Bool)
(declare-const violation_fhc_60_12 Bool)
(declare-const violation_fhc_60_13 Bool)
(declare-const violation_fhc_60_14 Bool)
(declare-const violation_fhc_60_15 Bool)
(declare-const violation_fhc_60_16 Bool)
(declare-const violation_fhc_60_17 Bool)
(declare-const violation_fhc_60_18 Bool)
(declare-const violation_fhc_60_19 Bool)
(declare-const violation_fhc_60_2 Bool)
(declare-const violation_fhc_60_3 Bool)
(declare-const violation_fhc_60_4 Bool)
(declare-const violation_fhc_60_5 Bool)
(declare-const violation_fhc_60_6 Bool)
(declare-const violation_fhc_60_7 Bool)
(declare-const violation_fhc_60_8 Bool)
(declare-const violation_fhc_60_9 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:non_credit_transaction_condition_met] 授信以外之交易條件成立
(assert (= non_credit_transaction_condition_met
   (or transaction_agent_commission_service
       transaction_invest_security
       transaction_related_third_party
       transaction_purchase_asset
       transaction_contract_payment_service
       transaction_sell_asset)))

; [fhc:related_party_involved] 交易對象為金融控股公司或其子公司負責人、大股東、關係企業、銀行子公司、保險子公司、證券子公司及其負責人
(assert (= related_party_involved
   (or is_fhc_related_enterprise_and_responsible_or_major_shareholder
       is_fhc_and_responsible_or_major_shareholder
       is_fhc_bank_insurance_securities_subsidiary_or_responsible
       is_fhc_responsible_or_major_shareholder_business)))

; [fhc:transaction_condition_valid] 授信以外交易條件不得優於其他同類對象且經董事會三分之二以上出席及四分之三以上決議
(assert (= transaction_condition_valid
   (and non_credit_transaction_condition_met
        related_party_involved
        (>= 0.0 transaction_condition_preferential_degree)
        (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio))))

; [fhc:bank_subsidiary_single_related_limit_ok] 銀行子公司與單一關係人交易金額不超過淨值10%
(assert (= bank_subsidiary_single_related_limit_ok
   (<= bank_subsidiary_single_related_transaction_amount
       (* (/ 1.0 10.0) bank_subsidiary_net_worth))))

; [fhc:bank_subsidiary_all_related_limit_ok] 銀行子公司與所有利害關係人交易總額不超過淨值20%
(assert (= bank_subsidiary_all_related_limit_ok
   (<= bank_subsidiary_all_related_transaction_amount
       (* (/ 1.0 5.0) bank_subsidiary_net_worth))))

; [fhc:fhc_45_compliance] 金融控股公司法第45條授信以外交易條件及董事會決議符合規定
(assert (= fhc_45_compliance
   (or (not (and non_credit_transaction_condition_met related_party_involved))
       (and transaction_condition_valid
            bank_subsidiary_single_related_limit_ok
            bank_subsidiary_all_related_limit_ok))))

; [fhc:violation_fhc_45] 違反金融控股公司法第45條規定
(assert (not (= fhc_45_compliance violation_fhc_45)))

; [fhc:violation_fhc_60_1] 違反第6條第一項規定，未申請設立金融控股公司
(assert (not (= fhc_6_1_compliance violation_fhc_60_1)))

; [fhc:violation_fhc_60_2] 違反第16條第三項規定，未經主管機關核准而持有股份
(assert (not (= fhc_16_3_compliance violation_fhc_60_2)))

; [fhc:violation_fhc_60_3] 違反第16條第一項、第二項或第九項規定未向主管機關申報，或違反同條第七項但書規定增加持股
(assert (not (= fhc_16_1_2_9_7_compliance violation_fhc_60_3)))

; [fhc:violation_fhc_60_4] 違反第16條第十項規定，未依主管機關所定期限處分
(assert (not (= fhc_16_10_compliance violation_fhc_60_4)))

; [fhc:violation_fhc_60_5] 違反主管機關依第16條第五項所定辦法中有關申報或公告之規定
(assert (not (= fhc_16_5_compliance violation_fhc_60_5)))

; [fhc:violation_fhc_60_6] 違反第16條第六項規定，為質權之設定
(assert (not (= fhc_16_6_compliance violation_fhc_60_6)))

; [fhc:violation_fhc_60_7] 違反第18條第一項規定，未經許可為合併、概括讓與或概括承受
(assert (not (= fhc_18_1_compliance violation_fhc_60_7)))

; [fhc:violation_fhc_60_8] 違反第38條規定，持有金融控股公司之股份
(assert (not (= fhc_38_compliance violation_fhc_60_8)))

; [fhc:violation_fhc_60_9] 違反第39條第一項所定短期資金運用項目；或違反同條第二項規定，未經核准投資不動產或投資非自用不動產
(assert (not (= fhc_39_1_2_compliance violation_fhc_60_9)))

; [fhc:violation_fhc_60_10] 違反主管機關依第39條第三項所定辦法中有關發行條件或期限之規定
(assert (not (= fhc_39_3_compliance violation_fhc_60_10)))

; [fhc:violation_fhc_60_11] 違反主管機關依第40條或第41條所定之比率或所為之處置或限制
(assert (not (= fhc_40_41_compliance violation_fhc_60_11)))

; [fhc:violation_fhc_60_12] 違反第42條第一項規定，未保守秘密
(assert (not (= fhc_42_1_compliance violation_fhc_60_12)))

; [fhc:violation_fhc_60_13] 違反第43條第一項、第二項或第四項規定；或違反主管機關依同條第三項所定辦法中有關可從事之業務範圍、資訊交互運用、共用設備、場所或人員管理之規定
(assert (not (= fhc_43_compliance violation_fhc_60_13)))

; [fhc:violation_fhc_60_14] 違反第45條第一項交易條件之限制或董事會之決議方法；或違反同條第四項所定之金額比率
(assert (not (= fhc_45_compliance violation_fhc_60_14)))

; [fhc:violation_fhc_60_15] 違反第46條第一項規定，未向主管機關申報或揭露
(assert (not (= fhc_46_1_compliance violation_fhc_60_15)))

; [fhc:violation_fhc_60_16] 違反第51條規定，未建立內部控制或稽核制度，或未確實執行
(assert (not (= fhc_51_compliance violation_fhc_60_16)))

; [fhc:violation_fhc_60_17] 違反第53條第一項或第二項規定；或未於主管機關依同條第三項所定期限內補足資本
(assert (not (= fhc_53_compliance violation_fhc_60_17)))

; [fhc:violation_fhc_60_18] 違反主管機關依第55條第一項所為之命令
(assert (not (= fhc_55_1_compliance violation_fhc_60_18)))

; [fhc:violation_fhc_60_19] 違反第56條第一項規定，未盡協助義務；或違反主管機關依同條第二項所為之命令
(assert (not (= fhc_56_compliance violation_fhc_60_19)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法第60條任一規定時處罰
(assert (= penalty
   (or violation_fhc_60_14
       violation_fhc_60_17
       violation_fhc_60_18
       violation_fhc_60_13
       violation_fhc_60_9
       violation_fhc_60_12
       violation_fhc_60_2
       violation_fhc_60_6
       violation_fhc_60_19
       violation_fhc_60_5
       violation_fhc_60_15
       violation_fhc_60_10
       violation_fhc_60_8
       violation_fhc_60_16
       violation_fhc_60_4
       violation_fhc_60_3
       violation_fhc_60_1
       violation_fhc_60_11
       violation_fhc_60_7)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= transaction_invest_security true))
(assert (= transaction_purchase_asset false))
(assert (= transaction_sell_asset false))
(assert (= transaction_contract_payment_service false))
(assert (= transaction_agent_commission_service false))
(assert (= transaction_related_third_party true))
(assert (= is_fhc_and_responsible_or_major_shareholder false))
(assert (= is_fhc_responsible_or_major_shareholder_business false))
(assert (= is_fhc_related_enterprise_and_responsible_or_major_shareholder false))
(assert (= is_fhc_bank_insurance_securities_subsidiary_or_responsible false))
(assert (= board_attendance_ratio (/ 3.0 5.0)))
(assert (= board_approval_ratio (/ 7.0 10.0)))
(assert (= transaction_condition_preferential_degree 1))
(assert (= bank_subsidiary_single_related_transaction_amount 2000000))
(assert (= bank_subsidiary_net_worth 10000000))
(assert (= bank_subsidiary_single_related_limit_ok true))
(assert (= bank_subsidiary_all_related_transaction_amount 1500000))
(assert (= bank_subsidiary_all_related_limit_ok true))
(assert (= fhc_16_10_compliance true))
(assert (= fhc_16_1_2_9_7_compliance true))
(assert (= fhc_16_3_compliance true))
(assert (= fhc_16_5_compliance true))
(assert (= fhc_16_6_compliance true))
(assert (= fhc_18_1_compliance true))
(assert (= fhc_38_compliance true))
(assert (= fhc_39_1_2_compliance true))
(assert (= fhc_39_3_compliance true))
(assert (= fhc_40_41_compliance true))
(assert (= fhc_42_1_compliance true))
(assert (= fhc_43_compliance true))
(assert (= fhc_45_compliance false))
(assert (= fhc_46_1_compliance true))
(assert (= fhc_51_compliance true))
(assert (= fhc_53_compliance true))
(assert (= fhc_55_1_compliance true))
(assert (= fhc_56_compliance true))
(assert (= fhc_6_1_compliance true))
(assert (= non_credit_transaction_condition_met true))
(assert (= related_party_involved true))
(assert (= transaction_condition_valid false))
(assert (= violation_fhc_45 true))
(assert (= violation_fhc_60_14 true))
(assert (= violation_fhc_60_1 false))
(assert (= violation_fhc_60_2 false))
(assert (= violation_fhc_60_3 false))
(assert (= violation_fhc_60_4 false))
(assert (= violation_fhc_60_5 false))
(assert (= violation_fhc_60_6 false))
(assert (= violation_fhc_60_7 false))
(assert (= violation_fhc_60_8 false))
(assert (= violation_fhc_60_9 false))
(assert (= violation_fhc_60_10 false))
(assert (= violation_fhc_60_11 false))
(assert (= violation_fhc_60_12 false))
(assert (= violation_fhc_60_13 false))
(assert (= violation_fhc_60_15 false))
(assert (= violation_fhc_60_16 false))
(assert (= violation_fhc_60_17 false))
(assert (= violation_fhc_60_18 false))
(assert (= violation_fhc_60_19 false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 61
; Total facts: 61
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
