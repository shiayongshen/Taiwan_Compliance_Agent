; SMT2 file generated from compliance case automatic
; Case ID: case_382
; Generated at: 2025-10-21T08:34:16.908348
;
; This file can be executed with Z3:
;   z3 case_382.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const confidentiality_measures_disclosed Bool)
(declare-const confidentiality_obligation Bool)
(declare-const fhc_assistance_duties_fulfilled Bool)
(declare-const fhc_capital_replenished_within_deadline Bool)
(declare-const fhc_confidentiality_maintained Bool)
(declare-const fhc_confidentiality_measures_disclosed Bool)
(declare-const fhc_establishment_application_submitted Bool)
(declare-const fhc_hold_shares_without_approval Bool)
(declare-const fhc_illegal_merger_or_transfer Bool)
(declare-const fhc_illegal_pledge_setting Bool)
(declare-const fhc_illegal_real_estate_investment Bool)
(declare-const fhc_illegal_share_increase Bool)
(declare-const fhc_illegal_shareholding Bool)
(declare-const fhc_internal_control_established Bool)
(declare-const fhc_internal_control_executed Bool)
(declare-const fhc_not_disposed_within_deadline Bool)
(declare-const fhc_not_reported_or_disclosed Bool)
(declare-const fhc_not_reported_to_authority Bool)
(declare-const fhc_violate_article_43_rules Bool)
(declare-const fhc_violate_article_45_rules Bool)
(declare-const fhc_violate_article_53_1_or_2 Bool)
(declare-const fhc_violate_issuance_conditions_or_deadline Bool)
(declare-const fhc_violate_order_article_55_1 Bool)
(declare-const fhc_violate_order_article_56_2 Bool)
(declare-const fhc_violate_ratio_or_disposal_restrictions Bool)
(declare-const fhc_violate_reporting_or_announcement_rules Bool)
(declare-const fhc_violate_short_term_fund_use Bool)
(declare-const penalty Bool)
(declare-const violation_1 Bool)
(declare-const violation_10 Bool)
(declare-const violation_11 Bool)
(declare-const violation_12 Bool)
(declare-const violation_13 Bool)
(declare-const violation_14 Bool)
(declare-const violation_15 Bool)
(declare-const violation_16 Bool)
(declare-const violation_17 Bool)
(declare-const violation_18 Bool)
(declare-const violation_19 Bool)
(declare-const violation_2 Bool)
(declare-const violation_3 Bool)
(declare-const violation_4 Bool)
(declare-const violation_5 Bool)
(declare-const violation_6 Bool)
(declare-const violation_7 Bool)
(declare-const violation_8 Bool)
(declare-const violation_9 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:confidentiality_obligation] 金融控股公司及其子公司應保守客戶個人資料、往來交易資料及其他相關資料秘密
(assert (= confidentiality_obligation fhc_confidentiality_maintained))

; [fhc:confidentiality_measures_disclosed] 主管機關已令金融控股公司及其子公司訂定書面保密措施並揭露重要事項
(assert (= confidentiality_measures_disclosed fhc_confidentiality_measures_disclosed))

; [fhc:violation_1] 違反第六條第一項規定，未申請設立金融控股公司
(assert (not (= fhc_establishment_application_submitted violation_1)))

; [fhc:violation_2] 違反第十六條第三項規定，未經主管機關核准而持有股份
(assert (= violation_2 fhc_hold_shares_without_approval))

; [fhc:violation_3] 違反第十六條第一項、第二項或第九項規定未向主管機關申報，或違反同條第七項但書規定增加持股
(assert (= violation_3 (or fhc_not_reported_to_authority fhc_illegal_share_increase)))

; [fhc:violation_4] 違反第十六條第十項規定，未依主管機關所定期限處分
(assert (= violation_4 fhc_not_disposed_within_deadline))

; [fhc:violation_5] 違反主管機關依第十六條第五項所定辦法中有關申報或公告之規定
(assert (= violation_5 fhc_violate_reporting_or_announcement_rules))

; [fhc:violation_6] 違反第十六條第六項規定，為質權之設定
(assert (= violation_6 fhc_illegal_pledge_setting))

; [fhc:violation_7] 違反第十八條第一項規定，未經許可為合併、概括讓與或概括承受
(assert (= violation_7 fhc_illegal_merger_or_transfer))

; [fhc:violation_8] 違反第三十八條規定，持有金融控股公司之股份
(assert (= violation_8 fhc_illegal_shareholding))

; [fhc:violation_9] 違反第三十九條第一項所定短期資金運用項目；或違反同條第二項規定，未經核准投資不動產或投資非自用不動產
(assert (= violation_9
   (or fhc_violate_short_term_fund_use fhc_illegal_real_estate_investment)))

; [fhc:violation_10] 違反主管機關依第三十九條第三項所定辦法中有關發行條件或期限之規定
(assert (= violation_10 fhc_violate_issuance_conditions_or_deadline))

; [fhc:violation_11] 違反主管機關依第四十條或第四十一條所定之比率或所為之處置或限制
(assert (= violation_11 fhc_violate_ratio_or_disposal_restrictions))

; [fhc:violation_12] 違反第四十二條第一項規定，未保守秘密
(assert (not (= confidentiality_obligation violation_12)))

; [fhc:violation_13] 違反第四十三條第一項、第二項或第四項規定；或違反主管機關依同條第三項所定辦法中有關可從事之業務範圍、資訊交互運用、共用設備、場所或人員管理之規定
(assert (= violation_13 fhc_violate_article_43_rules))

; [fhc:violation_14] 違反第四十五條第一項交易條件之限制或董事會之決議方法；或違反同條第四項所定之金額比率
(assert (= violation_14 fhc_violate_article_45_rules))

; [fhc:violation_15] 違反第四十六條第一項規定，未向主管機關申報或揭露
(assert (= violation_15 fhc_not_reported_or_disclosed))

; [fhc:violation_16] 違反第五十一條規定，未建立內部控制或稽核制度，或未確實執行
(assert (= violation_16
   (or (not fhc_internal_control_established)
       (not fhc_internal_control_executed))))

; [fhc:violation_17] 違反第五十三條第一項或第二項規定；或未於主管機關依同條第三項所定期限內補足資本
(assert (= violation_17
   (or fhc_violate_article_53_1_or_2
       (not fhc_capital_replenished_within_deadline))))

; [fhc:violation_18] 違反主管機關依第五十五條第一項所為之命令
(assert (= violation_18 fhc_violate_order_article_55_1))

; [fhc:violation_19] 違反第五十六條第一項規定，未盡協助義務；或違反主管機關依同條第二項所為之命令
(assert (= violation_19
   (or fhc_violate_order_article_56_2 (not fhc_assistance_duties_fulfilled))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一規定時處罰
(assert (= penalty
   (or violation_11
       violation_2
       violation_9
       violation_18
       violation_15
       violation_13
       violation_12
       violation_3
       violation_6
       violation_7
       violation_5
       violation_4
       violation_8
       violation_10
       violation_17
       violation_14
       violation_16
       violation_1
       violation_19)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fhc_confidentiality_maintained false))
(assert (= confidentiality_obligation false))
(assert (= violation_12 true))
(assert (= penalty true))
(assert (= fhc_confidentiality_measures_disclosed false))
(assert (= confidentiality_measures_disclosed false))
(assert (= fhc_assistance_duties_fulfilled true))
(assert (= fhc_capital_replenished_within_deadline true))
(assert (= fhc_establishment_application_submitted true))
(assert (= fhc_hold_shares_without_approval false))
(assert (= fhc_illegal_merger_or_transfer false))
(assert (= fhc_illegal_pledge_setting false))
(assert (= fhc_illegal_real_estate_investment false))
(assert (= fhc_illegal_share_increase false))
(assert (= fhc_illegal_shareholding false))
(assert (= fhc_internal_control_established true))
(assert (= fhc_internal_control_executed true))
(assert (= fhc_not_disposed_within_deadline false))
(assert (= fhc_not_reported_or_disclosed false))
(assert (= fhc_not_reported_to_authority false))
(assert (= fhc_violate_article_43_rules false))
(assert (= fhc_violate_article_45_rules false))
(assert (= fhc_violate_article_53_1_or_2 false))
(assert (= fhc_violate_issuance_conditions_or_deadline false))
(assert (= fhc_violate_order_article_55_1 false))
(assert (= fhc_violate_order_article_56_2 false))
(assert (= fhc_violate_ratio_or_disposal_restrictions false))
(assert (= fhc_violate_reporting_or_announcement_rules false))
(assert (= fhc_violate_short_term_fund_use false))
(assert (= violation_1 false))
(assert (= violation_2 false))
(assert (= violation_3 false))
(assert (= violation_4 false))
(assert (= violation_5 false))
(assert (= violation_6 false))
(assert (= violation_7 false))
(assert (= violation_8 false))
(assert (= violation_9 false))
(assert (= violation_10 false))
(assert (= violation_11 false))
(assert (= violation_13 false))
(assert (= violation_14 false))
(assert (= violation_15 false))
(assert (= violation_16 false))
(assert (= violation_17 false))
(assert (= violation_18 false))
(assert (= violation_19 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 23
; Total variables: 47
; Total facts: 47
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
