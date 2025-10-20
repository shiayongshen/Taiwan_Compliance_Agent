; SMT2 file generated from compliance case automatic
; Case ID: case_36
; Generated at: 2025-10-19T06:10:35.489312
;
; This file can be executed with Z3:
;   z3 case_36.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accept_different_account_offsetting_trade Bool)
(declare-const accept_full_discretionary_trust Bool)
(declare-const accept_full_discretionary_trust_by_personnel Bool)
(declare-const accept_non_authorized_proxy Bool)
(declare-const accept_non_authorized_proxy_by_personnel Bool)
(declare-const accept_non_self_account_opening Bool)
(declare-const accept_non_self_account_opening_by_personnel Bool)
(declare-const accept_offsetting_trade_by_personnel Bool)
(declare-const accept_proxy_by_internal_personnel Bool)
(declare-const accept_proxy_by_internal_personnel_personnel Bool)
(declare-const accept_same_account_offsetting_trade Bool)
(declare-const accept_trust_with_insider_info_or_manipulation Bool)
(declare-const accept_trust_with_insider_info_or_manipulation_by_personnel Bool)
(declare-const accept_unexecuted_trust_contract Bool)
(declare-const accept_unexecuted_trust_contract_by_personnel Bool)
(declare-const articles_compliance Bool)
(declare-const auto_rebalance_exception_applied Bool)
(declare-const business_compliance Bool)
(declare-const commission_exception_applied Bool)
(declare-const credit_transaction_exception_applied Bool)
(declare-const custody_of_client_assets Bool)
(declare-const director_officer_compliance Bool)
(declare-const director_officer_violation Bool)
(declare-const exception_37_1_applied Bool)
(declare-const execute_trades_per_client_instructions Bool)
(declare-const fail_to_submit_documents Bool)
(declare-const fraud_or_misleading_behavior Bool)
(declare-const illegal_disclosure_by_personnel Bool)
(declare-const illegal_disclosure_of_client_info Bool)
(declare-const improper_benefit_agreement Bool)
(declare-const internal_control_by_commission Bool)
(declare-const internal_control_by_related_org Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_updated Bool)
(declare-const internal_control_updated_within_deadline Bool)
(declare-const joint_risk_sharing Bool)
(declare-const law_compliance Bool)
(declare-const legal_proxy_exception_applied Bool)
(declare-const loan_or_securities_mediation Bool)
(declare-const misappropriate_client_assets Bool)
(declare-const misappropriate_or_custody_by_personnel Bool)
(declare-const obstruct_inspection Bool)
(declare-const other_violations Bool)
(declare-const other_violations_by_personnel Bool)
(declare-const penalty Bool)
(declare-const penalty_conditions_met Bool)
(declare-const penalty_imposed Bool)
(declare-const profit_guarantee_or_sharing Bool)
(declare-const prohibited_behavior_1 Bool)
(declare-const prohibited_behavior_10 Bool)
(declare-const prohibited_behavior_11 Bool)
(declare-const prohibited_behavior_12 Bool)
(declare-const prohibited_behavior_13 Bool)
(declare-const prohibited_behavior_14 Bool)
(declare-const prohibited_behavior_15 Bool)
(declare-const prohibited_behavior_16 Bool)
(declare-const prohibited_behavior_17 Bool)
(declare-const prohibited_behavior_18 Bool)
(declare-const prohibited_behavior_19 Bool)
(declare-const prohibited_behavior_2 Bool)
(declare-const prohibited_behavior_20 Bool)
(declare-const prohibited_behavior_21 Bool)
(declare-const prohibited_behavior_22 Bool)
(declare-const prohibited_behavior_3 Bool)
(declare-const prohibited_behavior_4 Bool)
(declare-const prohibited_behavior_5 Bool)
(declare-const prohibited_behavior_6 Bool)
(declare-const prohibited_behavior_7 Bool)
(declare-const prohibited_behavior_8 Bool)
(declare-const prohibited_behavior_9 Bool)
(declare-const provide_account_for_trading Bool)
(declare-const provide_false_or_fraud_info Bool)
(declare-const provide_price_trend_judgment Bool)
(declare-const provide_price_trend_judgment_by_personnel Bool)
(declare-const provide_specific_benefit_or_loss Bool)
(declare-const proxy_account_opening_by_personnel Bool)
(declare-const recommend_specific_stocks Bool)
(declare-const responsible_person_behavior_1 Bool)
(declare-const responsible_person_behavior_10 Bool)
(declare-const responsible_person_behavior_11 Bool)
(declare-const responsible_person_behavior_12 Bool)
(declare-const responsible_person_behavior_13 Bool)
(declare-const responsible_person_behavior_14 Bool)
(declare-const responsible_person_behavior_15 Bool)
(declare-const responsible_person_behavior_16 Bool)
(declare-const responsible_person_behavior_17 Bool)
(declare-const responsible_person_behavior_18 Bool)
(declare-const responsible_person_behavior_19 Bool)
(declare-const responsible_person_behavior_2 Bool)
(declare-const responsible_person_behavior_20 Bool)
(declare-const responsible_person_behavior_21 Bool)
(declare-const responsible_person_behavior_22 Bool)
(declare-const responsible_person_behavior_23 Bool)
(declare-const responsible_person_behavior_24 Bool)
(declare-const responsible_person_behavior_3 Bool)
(declare-const responsible_person_behavior_4 Bool)
(declare-const responsible_person_behavior_5 Bool)
(declare-const responsible_person_behavior_6 Bool)
(declare-const responsible_person_behavior_7 Bool)
(declare-const responsible_person_behavior_8 Bool)
(declare-const responsible_person_behavior_9 Bool)
(declare-const self_dealing Bool)
(declare-const set_fixed_place_contract_or_settlement Bool)
(declare-const set_fixed_place_outside_office Bool)
(declare-const unapproved_margin_or_securities_lending Bool)
(declare-const unapproved_securities_promotion Bool)
(declare-const underwriting_exception_applied Bool)
(declare-const use_client_name_or_account_by_personnel Bool)
(declare-const use_client_name_or_account_for_trading Bool)
(declare-const use_insider_info_for_trading Bool)
(declare-const use_non_securities_personnel_or_unreasonable_commission Bool)
(declare-const use_others_or_relatives_name Bool)
(declare-const violate_financial_business_management_rules Bool)
(declare-const violate_other_regulations Bool)
(declare-const violate_settlement_obligation Bool)
(declare-const violate_specified_articles Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:internal_control_established] 證券商依本會及相關機構訂定標準建立內部控制制度
(assert (= internal_control_established
   (and internal_control_by_commission internal_control_by_related_org)))

; [securities:business_compliance] 證券商業務依法令、章程及內部控制制度經營
(assert (= business_compliance
   (and law_compliance articles_compliance internal_control_compliance)))

; [securities:internal_control_updated] 內部控制制度變更於限期內完成
(assert (= internal_control_updated internal_control_updated_within_deadline))

; [securities:prohibited_behavior_1] 禁止提供有價證券漲跌判斷以勸誘客戶買賣
(assert (not (= provide_price_trend_judgment prohibited_behavior_1)))

; [securities:prohibited_behavior_2] 禁止約定或提供特定利益或負擔損失以勸誘客戶買賣
(assert (not (= provide_specific_benefit_or_loss prohibited_behavior_2)))

; [securities:prohibited_behavior_3] 禁止提供帳戶供客戶申購、買賣有價證券
(assert (not (= provide_account_for_trading prohibited_behavior_3)))

; [securities:prohibited_behavior_4] 禁止對客戶提供虛偽、詐騙或足致他人誤信之有價證券資訊
(assert (not (= provide_false_or_fraud_info prohibited_behavior_4)))

; [securities:prohibited_behavior_5] 禁止接受客戶對買賣有價證券之種類、數量、價格及買進或賣出之全權委託
(assert (not (= accept_full_discretionary_trust prohibited_behavior_5)))

; [securities:prohibited_behavior_6] 禁止接受客戶以同一帳戶為同種有價證券買進與賣出或賣出與買進相抵之交割，除符合第37-1條規定者外
(assert (= prohibited_behavior_6
   (or (not accept_same_account_offsetting_trade) exception_37_1_applied)))

; [securities:prohibited_behavior_7] 禁止接受客戶以不同帳戶為同一種有價證券買進與賣出或賣出與買進相抵之交割
(assert (not (= accept_different_account_offsetting_trade prohibited_behavior_7)))

; [securities:prohibited_behavior_8] 禁止於本公司或分支機構營業場所外設置固定場所接受有價證券買賣委託
(assert (not (= set_fixed_place_outside_office prohibited_behavior_8)))

; [securities:prohibited_behavior_9] 禁止於本公司或分支機構營業場所外設置固定場所從事受託契約簽訂或有價證券買賣交割，除本會另有規定者外
(assert (= prohibited_behavior_9
   (or commission_exception_applied
       (not set_fixed_place_contract_or_settlement))))

; [securities:prohibited_behavior_10] 禁止受理未辦妥受託契約之客戶買賣有價證券
(assert (not (= accept_unexecuted_trust_contract prohibited_behavior_10)))

; [securities:prohibited_behavior_11] 禁止受理本公司董事、監察人、受僱人代理他人開戶、申購、買賣或交割有價證券
(assert (not (= accept_proxy_by_internal_personnel prohibited_behavior_11)))

; [securities:prohibited_behavior_12] 禁止受理非本人開戶，除本會另有規定者外
(assert (= prohibited_behavior_12
   (or commission_exception_applied (not accept_non_self_account_opening))))

; [securities:prohibited_behavior_13] 禁止受理非本人或未具客戶委任書之代理人申購、買賣或交割有價證券，除依三方契約由證券投資顧問事業自動執行者外
(assert (= prohibited_behavior_13
   (or auto_rebalance_exception_applied (not accept_non_authorized_proxy))))

; [securities:prohibited_behavior_14] 禁止知悉客戶利用未公開重大消息或操縱市場意圖仍接受委託買賣
(assert (not (= accept_trust_with_insider_info_or_manipulation prohibited_behavior_14)))

; [securities:prohibited_behavior_15] 禁止利用客戶名義或帳戶申購、買賣有價證券
(assert (not (= use_client_name_or_account_for_trading prohibited_behavior_15)))

; [securities:prohibited_behavior_16] 禁止非依法令所為之查詢洩露客戶委託事項及業務秘密
(assert (not (= illegal_disclosure_of_client_info prohibited_behavior_16)))

; [securities:prohibited_behavior_17] 禁止挪用客戶所有或暫存於證券商之有價證券或款項
(assert (not (= misappropriate_client_assets prohibited_behavior_17)))

; [securities:prohibited_behavior_18] 禁止代客戶保管有價證券、款項、印鑑或存摺
(assert (not (= custody_of_client_assets prohibited_behavior_18)))

; [securities:prohibited_behavior_19] 禁止未經本會核准辦理有價證券買賣之融資或融券，提供款項或有價證券供客戶交割
(assert (not (= unapproved_margin_or_securities_lending prohibited_behavior_19)))

; [securities:prohibited_behavior_20] 禁止違反證券交易市場交割義務
(assert (not (= violate_settlement_obligation prohibited_behavior_20)))

; [securities:prohibited_behavior_21] 禁止利用非證券商人員招攬業務或給付不合理佣金
(assert (not (= use_non_securities_personnel_or_unreasonable_commission
        prohibited_behavior_21)))

; [securities:prohibited_behavior_22] 禁止其他違反證券管理法令或本會規定應為或不得為之行為
(assert (not (= other_violations prohibited_behavior_22)))

; [securities:director_officer_violation] 證券商董事、監察人及受僱人違反法令影響業務正常執行
(assert (not (= director_officer_compliance director_officer_violation)))

; [securities:penalty_imposed] 主管機關依情節輕重對證券商處分
(assert (= penalty_imposed penalty))

; [securities:penalty_conditions_met] 證券商違反證券交易法第178-1條規定之處罰條件
(assert (= penalty_conditions_met
   (or (not internal_control_executed)
       violate_specified_articles
       violate_other_regulations
       fail_to_submit_documents
       obstruct_inspection
       violate_financial_business_management_rules)))

; [securities:responsible_person_behavior_1] 負責人及業務人員不得以職務消息從事上市或上櫃有價證券買賣
(assert (not (= use_insider_info_for_trading responsible_person_behavior_1)))

; [securities:responsible_person_behavior_2] 負責人及業務人員不得非法洩漏客戶委託事項及職務秘密
(assert (not (= illegal_disclosure_by_personnel responsible_person_behavior_2)))

; [securities:responsible_person_behavior_3] 負責人及業務人員不得受理客戶全權委託買賣有價證券
(assert (not (= accept_full_discretionary_trust_by_personnel
        responsible_person_behavior_3)))

; [securities:responsible_person_behavior_4] 負責人及業務人員不得對客戶作贏利保證或分享利益之證券買賣
(assert (not (= profit_guarantee_or_sharing responsible_person_behavior_4)))

; [securities:responsible_person_behavior_5] 負責人及業務人員不得約定與客戶共同承擔買賣損益
(assert (not (= joint_risk_sharing responsible_person_behavior_5)))

; [securities:responsible_person_behavior_6] 負責人及業務人員不得同時以自己計算為買入或賣出相對行為
(assert (not (= self_dealing responsible_person_behavior_6)))

; [securities:responsible_person_behavior_7] 負責人及業務人員不得利用客戶名義或帳戶申購、買賣有價證券
(assert (not (= use_client_name_or_account_by_personnel responsible_person_behavior_7)))

; [securities:responsible_person_behavior_8] 負責人及業務人員不得以他人或親屬名義供客戶申購、買賣有價證券
(assert (not (= use_others_or_relatives_name responsible_person_behavior_8)))

; [securities:responsible_person_behavior_9] 負責人及業務人員不得與客戶有借貸款項、有價證券或媒介情事
(assert (not (= loan_or_securities_mediation responsible_person_behavior_9)))

; [securities:responsible_person_behavior_10] 負責人及業務人員辦理承銷或買賣有價證券時不得有隱瞞、詐欺或致人誤信行為
(assert (not (= fraud_or_misleading_behavior responsible_person_behavior_10)))

; [securities:responsible_person_behavior_11] 負責人及業務人員不得挪用或代客戶保管有價證券、款項、印鑑或存摺
(assert (not (= misappropriate_or_custody_by_personnel responsible_person_behavior_11)))

; [securities:responsible_person_behavior_12] 負責人及業務人員不得受理未辦妥受託契約之客戶買賣有價證券
(assert (not (= accept_unexecuted_trust_contract_by_personnel
        responsible_person_behavior_12)))

; [securities:responsible_person_behavior_13] 負責人及業務人員未依客戶委託事項及條件執行有價證券買賣
(assert (not (= execute_trades_per_client_instructions responsible_person_behavior_13)))

; [securities:responsible_person_behavior_14] 負責人及業務人員不得向客戶或不特定多數人提供漲跌判斷以勸誘買賣
(assert (not (= provide_price_trend_judgment_by_personnel
        responsible_person_behavior_14)))

; [securities:responsible_person_behavior_15] 負責人及業務人員不得向不特定多數人推介特定股票，承銷所需除外
(assert (= responsible_person_behavior_15
   (or (not recommend_specific_stocks) underwriting_exception_applied)))

; [securities:responsible_person_behavior_16] 負責人及業務人員不得接受客戶以同一或不同帳戶為同種有價證券買賣相抵交割，依法令信用交易及同日成交現券賣出例外
(assert (= responsible_person_behavior_16
   (or credit_transaction_exception_applied
       (not accept_offsetting_trade_by_personnel))))

; [securities:responsible_person_behavior_17] 負責人及業務人員代理他人開戶、申購、買賣或交割有價證券，法定代理人除外
(assert (= responsible_person_behavior_17
   (or legal_proxy_exception_applied (not proxy_account_opening_by_personnel))))

; [securities:responsible_person_behavior_18] 負責人及業務人員不得受理本公司董事、監察人、受僱人代理他人開戶、申購、買賣或交割有價證券
(assert (not (= accept_proxy_by_internal_personnel_personnel
        responsible_person_behavior_18)))

; [securities:responsible_person_behavior_19] 負責人及業務人員不得受理非本人開戶，除本會另有規定者外
(assert (= responsible_person_behavior_19
   (or commission_exception_applied
       (not accept_non_self_account_opening_by_personnel))))

; [securities:responsible_person_behavior_20] 負責人及業務人員不得受理非本人或未具客戶委任書之代理人申購、買賣或交割有價證券，三方契約自動執行除外
(assert (= responsible_person_behavior_20
   (or auto_rebalance_exception_applied
       (not accept_non_authorized_proxy_by_personnel))))

; [securities:responsible_person_behavior_21] 負責人及業務人員不得知悉客戶利用未公開重大消息或操縱市場意圖仍接受委託買賣
(assert (not (= accept_trust_with_insider_info_or_manipulation_by_personnel
        responsible_person_behavior_21)))

; [securities:responsible_person_behavior_22] 負責人及業務人員辦理有價證券承銷業務時不得與發行公司或相關人員有不當利益約定
(assert (not (= improper_benefit_agreement responsible_person_behavior_22)))

; [securities:responsible_person_behavior_23] 負責人及業務人員不得招攬、媒介、促銷未經核准之有價證券或衍生性商品
(assert (not (= unapproved_securities_promotion responsible_person_behavior_23)))

; [securities:responsible_person_behavior_24] 負責人及業務人員不得有其他違反證券管理法令或本會規定不得為之行為
(assert (not (= other_violations_by_personnel responsible_person_behavior_24)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一證券商管理規則或證券交易法規定時處罰
(assert (= penalty
   (or (not prohibited_behavior_5)
       (not prohibited_behavior_17)
       (not prohibited_behavior_2)
       (not responsible_person_behavior_22)
       (not prohibited_behavior_14)
       (not prohibited_behavior_11)
       (not responsible_person_behavior_23)
       (not prohibited_behavior_19)
       (not prohibited_behavior_16)
       (not responsible_person_behavior_11)
       (not prohibited_behavior_15)
       (not director_officer_violation)
       (not responsible_person_behavior_19)
       (not responsible_person_behavior_2)
       (not prohibited_behavior_4)
       (not prohibited_behavior_1)
       (not prohibited_behavior_9)
       (not prohibited_behavior_6)
       (not responsible_person_behavior_17)
       (not responsible_person_behavior_6)
       (not prohibited_behavior_3)
       (not prohibited_behavior_7)
       (not responsible_person_behavior_12)
       (not responsible_person_behavior_18)
       (not prohibited_behavior_8)
       (not responsible_person_behavior_9)
       (not responsible_person_behavior_1)
       (not responsible_person_behavior_7)
       (not responsible_person_behavior_4)
       (not responsible_person_behavior_3)
       (not prohibited_behavior_12)
       (not prohibited_behavior_13)
       (not prohibited_behavior_18)
       (not prohibited_behavior_22)
       (not penalty_conditions_met)
       (not responsible_person_behavior_24)
       (not responsible_person_behavior_21)
       (not business_compliance)
       (not prohibited_behavior_20)
       (not responsible_person_behavior_5)
       (not responsible_person_behavior_15)
       (not responsible_person_behavior_13)
       (not internal_control_updated)
       (not internal_control_established)
       (not responsible_person_behavior_14)
       (not responsible_person_behavior_10)
       (not responsible_person_behavior_8)
       (not prohibited_behavior_21)
       (not responsible_person_behavior_16)
       (not prohibited_behavior_10)
       (not responsible_person_behavior_20))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_by_commission false))
(assert (= internal_control_by_related_org true))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_updated_within_deadline true))
(assert (= internal_control_updated true))
(assert (= law_compliance false))
(assert (= articles_compliance false))
(assert (= business_compliance false))
(assert (= prohibited_behavior_1 true))
(assert (= prohibited_behavior_2 true))
(assert (= prohibited_behavior_3 false))
(assert (= prohibited_behavior_4 true))
(assert (= prohibited_behavior_5 true))
(assert (= prohibited_behavior_6 true))
(assert (= prohibited_behavior_7 true))
(assert (= prohibited_behavior_8 true))
(assert (= prohibited_behavior_9 true))
(assert (= prohibited_behavior_10 true))
(assert (= prohibited_behavior_11 false))
(assert (= prohibited_behavior_12 true))
(assert (= prohibited_behavior_13 false))
(assert (= prohibited_behavior_14 true))
(assert (= prohibited_behavior_15 true))
(assert (= prohibited_behavior_16 true))
(assert (= prohibited_behavior_17 true))
(assert (= prohibited_behavior_18 true))
(assert (= prohibited_behavior_19 true))
(assert (= prohibited_behavior_20 true))
(assert (= prohibited_behavior_21 true))
(assert (= prohibited_behavior_22 false))
(assert (= director_officer_compliance false))
(assert (= director_officer_violation true))
(assert (= penalty true))
(assert (= penalty_conditions_met true))
(assert (= penalty_imposed true))
(assert (= responsible_person_behavior_1 true))
(assert (= responsible_person_behavior_2 true))
(assert (= responsible_person_behavior_3 true))
(assert (= responsible_person_behavior_4 true))
(assert (= responsible_person_behavior_5 true))
(assert (= responsible_person_behavior_6 true))
(assert (= responsible_person_behavior_7 false))
(assert (= responsible_person_behavior_8 true))
(assert (= responsible_person_behavior_9 true))
(assert (= responsible_person_behavior_10 true))
(assert (= responsible_person_behavior_11 false))
(assert (= responsible_person_behavior_12 true))
(assert (= responsible_person_behavior_13 false))
(assert (= responsible_person_behavior_14 true))
(assert (= responsible_person_behavior_15 true))
(assert (= responsible_person_behavior_16 true))
(assert (= responsible_person_behavior_17 false))
(assert (= responsible_person_behavior_18 false))
(assert (= responsible_person_behavior_19 true))
(assert (= responsible_person_behavior_20 false))
(assert (= responsible_person_behavior_21 true))
(assert (= responsible_person_behavior_22 true))
(assert (= responsible_person_behavior_23 true))
(assert (= responsible_person_behavior_24 false))
(assert (= accept_non_authorized_proxy true))
(assert (= accept_non_authorized_proxy_by_personnel true))
(assert (= accept_proxy_by_internal_personnel true))
(assert (= accept_proxy_by_internal_personnel_personnel true))
(assert (= accept_unexecuted_trust_contract true))
(assert (= accept_unexecuted_trust_contract_by_personnel true))
(assert (= accept_non_self_account_opening true))
(assert (= accept_non_self_account_opening_by_personnel true))
(assert (= accept_same_account_offsetting_trade true))
(assert (= accept_different_account_offsetting_trade true))
(assert (= accept_offsetting_trade_by_personnel true))
(assert (= accept_trust_with_insider_info_or_manipulation false))
(assert (= accept_trust_with_insider_info_or_manipulation_by_personnel false))
(assert (= provide_account_for_trading false))
(assert (= provide_false_or_fraud_info false))
(assert (= provide_price_trend_judgment false))
(assert (= provide_price_trend_judgment_by_personnel false))
(assert (= provide_specific_benefit_or_loss false))
(assert (= proxy_account_opening_by_personnel false))
(assert (= recommend_specific_stocks false))
(assert (= use_client_name_or_account_for_trading false))
(assert (= use_client_name_or_account_by_personnel false))
(assert (= use_insider_info_for_trading false))
(assert (= use_non_securities_personnel_or_unreasonable_commission false))
(assert (= use_others_or_relatives_name false))
(assert (= violate_financial_business_management_rules true))
(assert (= violate_other_regulations false))
(assert (= violate_settlement_obligation false))
(assert (= unapproved_margin_or_securities_lending false))
(assert (= unapproved_securities_promotion false))
(assert (= set_fixed_place_outside_office false))
(assert (= set_fixed_place_contract_or_settlement false))
(assert (= commission_exception_applied false))
(assert (= auto_rebalance_exception_applied false))
(assert (= credit_transaction_exception_applied false))
(assert (= legal_proxy_exception_applied false))
(assert (= underwriting_exception_applied false))
(assert (= other_violations true))
(assert (= other_violations_by_personnel true))
(assert (= fraud_or_misleading_behavior false))
(assert (= illegal_disclosure_by_personnel false))
(assert (= illegal_disclosure_of_client_info false))
(assert (= improper_benefit_agreement false))
(assert (= loan_or_securities_mediation false))
(assert (= misappropriate_client_assets false))
(assert (= misappropriate_or_custody_by_personnel false))
(assert (= obstruct_inspection false))
(assert (= self_dealing false))
(assert (= joint_risk_sharing false))
(assert (= profit_guarantee_or_sharing false))
(assert (= accept_full_discretionary_trust false))
(assert (= accept_full_discretionary_trust_by_personnel false))
(assert (= custody_of_client_assets false))
(assert (= exception_37_1_applied false))
(assert (= execute_trades_per_client_instructions false))
(assert (= fail_to_submit_documents false))
(assert (= violate_specified_articles false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 54
; Total variables: 118
; Total facts: 118
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
