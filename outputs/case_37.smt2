; SMT2 file generated from compliance case automatic
; Case ID: case_37
; Generated at: 2025-10-20T23:46:19.881326
;
; This file can be executed with Z3:
;   z3 case_37.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accept_client_without_proper_trust_contract Bool)
(declare-const accept_client_without_proper_trust_contract_by_responsible_person Bool)
(declare-const accept_different_account_offset_trading Bool)
(declare-const accept_full_discretionary_trust Bool)
(declare-const accept_full_discretionary_trust_by_responsible_person Bool)
(declare-const accept_non_self_account_opening Bool)
(declare-const accept_non_self_account_opening_responsible Bool)
(declare-const accept_offset_trading_by_responsible_person_except_legal_exceptions Bool)
(declare-const accept_proxy_trading_by_internal_personnel Bool)
(declare-const accept_proxy_trading_by_internal_personnel_responsible Bool)
(declare-const accept_proxy_without_power_of_attorney_except_auto_rebalance Bool)
(declare-const accept_proxy_without_power_of_attorney_except_auto_rebalance_responsible Bool)
(declare-const accept_same_account_offset_trading_except_37_1 Bool)
(declare-const accept_trading_with_material_nonpublic_info_or_market_manipulation_intent Bool)
(declare-const accept_trading_with_material_nonpublic_info_or_market_manipulation_intent_responsible Bool)
(declare-const business_operated_according_to_law_and_internal_control Bool)
(declare-const concealment_or_fraud_in_underwriting_or_trading Bool)
(declare-const custody_of_client_securities_or_funds Bool)
(declare-const evade_inspection Bool)
(declare-const execute_business_with_honesty_and_credit Bool)
(declare-const execute_trades_according_to_client_instructions Bool)
(declare-const illegal_disclosure_by_responsible_person Bool)
(declare-const illegal_disclosure_of_client_info Bool)
(declare-const improper_benefit_agreement_with_issuer Bool)
(declare-const internal_control_compliant Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_updated_within_deadline Bool)
(declare-const internal_control_updated Bool)
(declare-const joint_risk_sharing_with_client Bool)
(declare-const loan_or_securities_mediation_with_client Bool)
(declare-const misappropriate_client_securities_or_funds Bool)
(declare-const misappropriate_or_custody_by_responsible_person Bool)
(declare-const not_comply_document_requirements Bool)
(declare-const not_submit_required_documents Bool)
(declare-const obstruct_inspection Bool)
(declare-const other_violations_by_responsible_person Bool)
(declare-const other_violations_of_securities_regulations Bool)
(declare-const penalty Bool)
(declare-const profit_guarantee_or_sharing_by_responsible_person Bool)
(declare-const prohibited_behavior_37_1 Bool)
(declare-const prohibited_behavior_37_10 Bool)
(declare-const prohibited_behavior_37_11 Bool)
(declare-const prohibited_behavior_37_12 Bool)
(declare-const prohibited_behavior_37_13 Bool)
(declare-const prohibited_behavior_37_14 Bool)
(declare-const prohibited_behavior_37_15 Bool)
(declare-const prohibited_behavior_37_16 Bool)
(declare-const prohibited_behavior_37_17 Bool)
(declare-const prohibited_behavior_37_18 Bool)
(declare-const prohibited_behavior_37_19 Bool)
(declare-const prohibited_behavior_37_2 Bool)
(declare-const prohibited_behavior_37_20 Bool)
(declare-const prohibited_behavior_37_21 Bool)
(declare-const prohibited_behavior_37_22 Bool)
(declare-const prohibited_behavior_37_3 Bool)
(declare-const prohibited_behavior_37_4 Bool)
(declare-const prohibited_behavior_37_5 Bool)
(declare-const prohibited_behavior_37_6 Bool)
(declare-const prohibited_behavior_37_7 Bool)
(declare-const prohibited_behavior_37_8 Bool)
(declare-const prohibited_behavior_37_9 Bool)
(declare-const provide_account_for_client_trading Bool)
(declare-const provide_false_or_fraudulent_information Bool)
(declare-const provide_price_movement_prediction Bool)
(declare-const provide_price_movement_prediction_by_responsible_person Bool)
(declare-const provide_specific_benefits_or_losses Bool)
(declare-const proxy_trading_except_legal_agent Bool)
(declare-const recommend_specific_stock_to_public_except_underwriting Bool)
(declare-const refuse_inspection Bool)
(declare-const responsible_person_honest Bool)
(declare-const responsible_person_prohibited_1 Bool)
(declare-const responsible_person_prohibited_10 Bool)
(declare-const responsible_person_prohibited_11 Bool)
(declare-const responsible_person_prohibited_12 Bool)
(declare-const responsible_person_prohibited_13 Bool)
(declare-const responsible_person_prohibited_14 Bool)
(declare-const responsible_person_prohibited_15 Bool)
(declare-const responsible_person_prohibited_16 Bool)
(declare-const responsible_person_prohibited_17 Bool)
(declare-const responsible_person_prohibited_18 Bool)
(declare-const responsible_person_prohibited_19 Bool)
(declare-const responsible_person_prohibited_2 Bool)
(declare-const responsible_person_prohibited_20 Bool)
(declare-const responsible_person_prohibited_21 Bool)
(declare-const responsible_person_prohibited_22 Bool)
(declare-const responsible_person_prohibited_23 Bool)
(declare-const responsible_person_prohibited_24 Bool)
(declare-const responsible_person_prohibited_3 Bool)
(declare-const responsible_person_prohibited_4 Bool)
(declare-const responsible_person_prohibited_5 Bool)
(declare-const responsible_person_prohibited_6 Bool)
(declare-const responsible_person_prohibited_7 Bool)
(declare-const responsible_person_prohibited_8 Bool)
(declare-const responsible_person_prohibited_9 Bool)
(declare-const self_dealing_by_responsible_person Bool)
(declare-const set_fixed_place_outside_office_for_contract_or_settlement Bool)
(declare-const set_fixed_place_outside_office_for_trading Bool)
(declare-const solicit_unapproved_securities_or_derivatives Bool)
(declare-const unapproved_margin_or_securities_lending Bool)
(declare-const use_client_name_or_account_by_responsible_person Bool)
(declare-const use_client_name_or_account_for_trading Bool)
(declare-const use_duty_info_for_trading Bool)
(declare-const use_non_securities_personnel_or_unreasonable_commission Bool)
(declare-const use_others_or_relatives_name_for_client_trading Bool)
(declare-const violate_article_141 Bool)
(declare-const violate_article_144 Bool)
(declare-const violate_article_145_2 Bool)
(declare-const violate_article_147 Bool)
(declare-const violate_article_14_1_1 Bool)
(declare-const violate_article_14_1_3 Bool)
(declare-const violate_article_14_3 Bool)
(declare-const violate_article_152 Bool)
(declare-const violate_article_159 Bool)
(declare-const violate_article_165_1 Bool)
(declare-const violate_article_165_2 Bool)
(declare-const violate_article_18_2_rules Bool)
(declare-const violate_article_21_1_5 Bool)
(declare-const violate_article_22_4_44_4_60_2_62_2_70 Bool)
(declare-const violate_article_56 Bool)
(declare-const violate_article_58 Bool)
(declare-const violate_article_61 Bool)
(declare-const violate_article_62_2 Bool)
(declare-const violate_article_69_1 Bool)
(declare-const violate_article_79 Bool)
(declare-const violate_article_90 Bool)
(declare-const violate_article_93_95_102 Bool)
(declare-const violate_settlement_obligation Bool)
(declare-const violation_178_1_1 Bool)
(declare-const violation_178_1_2 Bool)
(declare-const violation_178_1_3 Bool)
(declare-const violation_178_1_4 Bool)
(declare-const violation_178_1_5 Bool)
(declare-const violation_178_1_6 Bool)
(declare-const violation_178_1_7 Bool)
(declare-const violation_178_1_minor Bool)
(declare-const violation_56 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_178_1_1] 違反證券交易法第14條第3項、第14條之一第1項、第3項、第21條之一第5項、第58條、第61條、第69條第1項、第79條、第141條、第144條、第145條第2項、第147條、第152條、第159條、第165條之一或第165條之2準用相關規定
(assert (= violation_178_1_1
   (or violate_article_159
       violate_article_69_1
       violate_article_144
       violate_article_152
       violate_article_14_3
       violate_article_14_1_3
       violate_article_58
       violate_article_145_2
       violate_article_165_1
       violate_article_165_2
       violate_article_61
       violate_article_14_1_1
       violate_article_141
       violate_article_21_1_5
       violate_article_79
       violate_article_147)))

; [securities:violation_178_1_2] 未依主管機關命令提出帳簿、表冊、文件或其他資料，或規避、妨礙、拒絕檢查
(assert (= violation_178_1_2
   (or refuse_inspection
       obstruct_inspection
       not_submit_required_documents
       evade_inspection)))

; [securities:violation_178_1_3] 未依規定製作、申報、公告、備置或保存帳簿、表冊、傳票、財務報告或其他業務文件
(assert (= violation_178_1_3 not_comply_document_requirements))

; [securities:violation_178_1_4] 證券商或第十八條第一項事業未確實執行內部控制制度
(assert (not (= internal_control_executed violation_178_1_4)))

; [securities:violation_178_1_5] 第十八條第一項事業違反同條第二項規則有關財務、業務或管理規定
(assert (= violation_178_1_5 violate_article_18_2_rules))

; [securities:violation_178_1_6] 證券商違反第22條第4項、第44條第4項、第60條第2項、第62條第2項、第70條規定有關財務、業務或管理規定
(assert (= violation_178_1_6 violate_article_22_4_44_4_60_2_62_2_70))

; [securities:violation_178_1_7] 證券櫃檯買賣中心違反第62條第2項規定、證券商同業公會違反第90條規定、證券交易所違反第93條、第95條、第102條規定有關財務、業務或管理規定
(assert (= violation_178_1_7
   (or violate_article_62_2 violate_article_90 violate_article_93_95_102)))

; [securities:violation_56] 證券商董事、監察人及受僱人違反法令影響業務正常執行
(assert (= violation_56 violate_article_56))

; [securities:internal_control_established] 證券商依規定訂定內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_compliant] 證券商業務依內部控制制度及法令章程經營
(assert (= internal_control_compliant
   (and internal_control_system_established
        business_operated_according_to_law_and_internal_control)))

; [securities:internal_control_updated] 內部控制制度變更於限期內完成
(assert (= internal_control_updated internal_control_system_updated_within_deadline))

; [securities:prohibited_behavior_37_1] 證券商不得提供有價證券漲跌判斷以勸誘買賣
(assert (not (= provide_price_movement_prediction prohibited_behavior_37_1)))

; [securities:prohibited_behavior_37_2] 證券商不得約定或提供特定利益或負擔損失以勸誘買賣
(assert (not (= provide_specific_benefits_or_losses prohibited_behavior_37_2)))

; [securities:prohibited_behavior_37_3] 證券商不得提供帳戶供客戶申購、買賣有價證券
(assert (not (= provide_account_for_client_trading prohibited_behavior_37_3)))

; [securities:prohibited_behavior_37_4] 證券商不得對客戶提供虛偽、詐騙或足致他人誤信之有價證券資訊
(assert (not (= provide_false_or_fraudulent_information prohibited_behavior_37_4)))

; [securities:prohibited_behavior_37_5] 證券商不得接受客戶對買賣有價證券之全權委託
(assert (not (= accept_full_discretionary_trust prohibited_behavior_37_5)))

; [securities:prohibited_behavior_37_6] 證券商不得接受客戶以同一帳戶為同種有價證券買賣相抵交割（符合37-1條例外除外）
(assert (not (= accept_same_account_offset_trading_except_37_1 prohibited_behavior_37_6)))

; [securities:prohibited_behavior_37_7] 證券商不得接受客戶以不同帳戶為同一種有價證券買賣相抵交割
(assert (not (= accept_different_account_offset_trading prohibited_behavior_37_7)))

; [securities:prohibited_behavior_37_8] 證券商不得於營業場所外設置固定場所接受有價證券買賣委託
(assert (not (= set_fixed_place_outside_office_for_trading prohibited_behavior_37_8)))

; [securities:prohibited_behavior_37_9] 證券商不得於營業場所外設置固定場所辦理受託契約或有價證券買賣交割（本會另有規定除外）
(assert (not (= set_fixed_place_outside_office_for_contract_or_settlement
        prohibited_behavior_37_9)))

; [securities:prohibited_behavior_37_10] 證券商不得受理未辦妥受託契約之客戶買賣有價證券
(assert (not (= accept_client_without_proper_trust_contract prohibited_behavior_37_10)))

; [securities:prohibited_behavior_37_11] 證券商不得受理本公司董事、監察人、受僱人代理他人開戶、申購、買賣或交割有價證券
(assert (not (= accept_proxy_trading_by_internal_personnel prohibited_behavior_37_11)))

; [securities:prohibited_behavior_37_12] 證券商不得受理非本人開戶（本會另有規定除外）
(assert (not (= accept_non_self_account_opening prohibited_behavior_37_12)))

; [securities:prohibited_behavior_37_13] 證券商不得受理非本人或未具委任書代理人申購、買賣或交割有價證券（符合三方契約自動再平衡交易除外）
(assert (not (= accept_proxy_without_power_of_attorney_except_auto_rebalance
        prohibited_behavior_37_13)))

; [securities:prohibited_behavior_37_14] 證券商不得知悉重大未公開消息或操縱市場意圖仍接受委託買賣
(assert (not (= accept_trading_with_material_nonpublic_info_or_market_manipulation_intent
        prohibited_behavior_37_14)))

; [securities:prohibited_behavior_37_15] 證券商不得利用客戶名義或帳戶申購、買賣有價證券
(assert (not (= use_client_name_or_account_for_trading prohibited_behavior_37_15)))

; [securities:prohibited_behavior_37_16] 證券商不得非依法令查詢洩露客戶委託事項及業務秘密
(assert (not (= illegal_disclosure_of_client_info prohibited_behavior_37_16)))

; [securities:prohibited_behavior_37_17] 證券商不得挪用客戶有價證券或款項
(assert (not (= misappropriate_client_securities_or_funds prohibited_behavior_37_17)))

; [securities:prohibited_behavior_37_18] 證券商不得代客戶保管有價證券、款項、印鑑或存摺
(assert (not (= custody_of_client_securities_or_funds prohibited_behavior_37_18)))

; [securities:prohibited_behavior_37_19] 證券商不得未經本會核准辦理融資或融券，提供款項或有價證券供客戶交割
(assert (not (= unapproved_margin_or_securities_lending prohibited_behavior_37_19)))

; [securities:prohibited_behavior_37_20] 證券商不得違反證券交易市場交割義務
(assert (not (= violate_settlement_obligation prohibited_behavior_37_20)))

; [securities:prohibited_behavior_37_21] 證券商不得利用非證券商人員招攬業務或給付不合理佣金
(assert (not (= use_non_securities_personnel_or_unreasonable_commission
        prohibited_behavior_37_21)))

; [securities:prohibited_behavior_37_22] 證券商不得其他違反證券管理法令或本會規定應為或不得為之行為
(assert (not (= other_violations_of_securities_regulations prohibited_behavior_37_22)))

; [securities:responsible_person_honest] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= responsible_person_honest execute_business_with_honesty_and_credit))

; [securities:responsible_person_prohibited_1] 負責人及業務人員不得以職務消息從事上市或上櫃有價證券買賣
(assert (not (= use_duty_info_for_trading responsible_person_prohibited_1)))

; [securities:responsible_person_prohibited_2] 負責人及業務人員不得非法洩漏客戶委託事項及業務秘密
(assert (not (= illegal_disclosure_by_responsible_person
        responsible_person_prohibited_2)))

; [securities:responsible_person_prohibited_3] 負責人及業務人員不得受理客戶全權委託買賣有價證券
(assert (not (= accept_full_discretionary_trust_by_responsible_person
        responsible_person_prohibited_3)))

; [securities:responsible_person_prohibited_4] 負責人及業務人員不得對客戶作贏利保證或分享利益之證券買賣
(assert (not (= profit_guarantee_or_sharing_by_responsible_person
        responsible_person_prohibited_4)))

; [securities:responsible_person_prohibited_5] 負責人及業務人員不得與客戶共同承擔買賣有價證券交易損益
(assert (not (= joint_risk_sharing_with_client responsible_person_prohibited_5)))

; [securities:responsible_person_prohibited_6] 負責人及業務人員不得同時以自己計算為買入或賣出相對行為
(assert (not (= self_dealing_by_responsible_person responsible_person_prohibited_6)))

; [securities:responsible_person_prohibited_7] 負責人及業務人員不得利用客戶名義或帳戶申購、買賣有價證券
(assert (not (= use_client_name_or_account_by_responsible_person
        responsible_person_prohibited_7)))

; [securities:responsible_person_prohibited_8] 負責人及業務人員不得以他人或親屬名義供客戶申購、買賣有價證券
(assert (not (= use_others_or_relatives_name_for_client_trading
        responsible_person_prohibited_8)))

; [securities:responsible_person_prohibited_9] 負責人及業務人員不得與客戶有借貸款項、有價證券或為借貸媒介
(assert (not (= loan_or_securities_mediation_with_client
        responsible_person_prohibited_9)))

; [securities:responsible_person_prohibited_10] 負責人及業務人員辦理承銷或買賣有價證券時不得有隱瞞、詐欺或足致誤信行為
(assert (not (= concealment_or_fraud_in_underwriting_or_trading
        responsible_person_prohibited_10)))

; [securities:responsible_person_prohibited_11] 負責人及業務人員不得挪用或代客戶保管有價證券、款項、印鑑或存摺
(assert (not (= misappropriate_or_custody_by_responsible_person
        responsible_person_prohibited_11)))

; [securities:responsible_person_prohibited_12] 負責人及業務人員不得受理未辦妥受託契約之客戶買賣有價證券
(assert (not (= accept_client_without_proper_trust_contract_by_responsible_person
        responsible_person_prohibited_12)))

; [securities:responsible_person_prohibited_13] 負責人及業務人員未依客戶委託事項及條件執行有價證券買賣
(assert (not (= execute_trades_according_to_client_instructions
        responsible_person_prohibited_13)))

; [securities:responsible_person_prohibited_14] 負責人及業務人員不得向客戶或不特定多數人提供漲跌判斷以勸誘買賣
(assert (not (= provide_price_movement_prediction_by_responsible_person
        responsible_person_prohibited_14)))

; [securities:responsible_person_prohibited_15] 負責人及業務人員不得向不特定多數人推介買賣特定股票（承銷除外）
(assert (not (= recommend_specific_stock_to_public_except_underwriting
        responsible_person_prohibited_15)))

; [securities:responsible_person_prohibited_16] 負責人及業務人員不得接受客戶以同一或不同帳戶為同種有價證券買賣相抵交割（法令例外除外）
(assert (not (= accept_offset_trading_by_responsible_person_except_legal_exceptions
        responsible_person_prohibited_16)))

; [securities:responsible_person_prohibited_17] 負責人及業務人員不得代理他人開戶、申購、買賣或交割有價證券（法定代理人除外）
(assert (not (= proxy_trading_except_legal_agent responsible_person_prohibited_17)))

; [securities:responsible_person_prohibited_18] 負責人及業務人員不得受理本公司董事、監察人、受僱人代理他人開戶、申購、買賣或交割有價證券
(assert (not (= accept_proxy_trading_by_internal_personnel_responsible
        responsible_person_prohibited_18)))

; [securities:responsible_person_prohibited_19] 負責人及業務人員不得受理非本人開戶（本會另有規定除外）
(assert (not (= accept_non_self_account_opening_responsible
        responsible_person_prohibited_19)))

; [securities:responsible_person_prohibited_20] 負責人及業務人員不得受理非本人或未具委任書代理人申購、買賣或交割有價證券（符合三方契約自動再平衡交易除外）
(assert (not (= accept_proxy_without_power_of_attorney_except_auto_rebalance_responsible
        responsible_person_prohibited_20)))

; [securities:responsible_person_prohibited_21] 負責人及業務人員不得知悉重大未公開消息或操縱市場意圖仍接受委託買賣
(assert (not (= accept_trading_with_material_nonpublic_info_or_market_manipulation_intent_responsible
        responsible_person_prohibited_21)))

; [securities:responsible_person_prohibited_22] 負責人及業務人員辦理有價證券承銷業務時不得與發行公司或相關人員有不當利益約定
(assert (not (= improper_benefit_agreement_with_issuer responsible_person_prohibited_22)))

; [securities:responsible_person_prohibited_23] 負責人及業務人員不得招攬、媒介、促銷未經核准之有價證券或衍生性商品
(assert (not (= solicit_unapproved_securities_or_derivatives
        responsible_person_prohibited_23)))

; [securities:responsible_person_prohibited_24] 負責人及業務人員不得其他違反證券管理法令或本會規定不得為之行為
(assert (not (= other_violations_by_responsible_person responsible_person_prohibited_24)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法第178-1條規定之任一情事且情節非輕微時處罰
(assert (= penalty
   (and (or violation_178_1_1
            violation_178_1_2
            violation_178_1_3
            violation_178_1_4
            violation_178_1_5
            violation_178_1_6
            violation_178_1_7)
        (not violation_178_1_minor))))

; [meta:penalty_conditions_article_56] 處罰條件：證券商董事、監察人及受僱人違反法令影響業務正常執行時處罰
(assert (= penalty violation_56))

; [meta:penalty_conditions_internal_control] 處罰條件：證券商未依規定訂定或執行內部控制制度時處罰
(assert (= penalty
   (or (not internal_control_updated)
       (not internal_control_compliant)
       (not internal_control_established))))

; [meta:penalty_conditions_prohibited_behaviors] 處罰條件：證券商有禁止行為之一時處罰
(assert (= penalty
   (or (not prohibited_behavior_37_4)
       (not prohibited_behavior_37_6)
       (not prohibited_behavior_37_7)
       (not prohibited_behavior_37_17)
       (not prohibited_behavior_37_2)
       (not prohibited_behavior_37_12)
       (not prohibited_behavior_37_19)
       (not prohibited_behavior_37_10)
       (not prohibited_behavior_37_9)
       (not prohibited_behavior_37_13)
       (not prohibited_behavior_37_14)
       (not prohibited_behavior_37_15)
       (not prohibited_behavior_37_11)
       (not prohibited_behavior_37_16)
       (not prohibited_behavior_37_20)
       (not prohibited_behavior_37_8)
       (not prohibited_behavior_37_21)
       (not prohibited_behavior_37_18)
       (not prohibited_behavior_37_22)
       (not prohibited_behavior_37_3)
       (not prohibited_behavior_37_1)
       (not prohibited_behavior_37_5))))

; [meta:penalty_conditions_responsible_person] 處罰條件：證券商負責人及業務人員違反誠實信用原則或禁止行為之一時處罰
(assert (= penalty
   (or (not responsible_person_prohibited_15)
       (not responsible_person_honest)
       (not responsible_person_prohibited_18)
       (not responsible_person_prohibited_4)
       (not responsible_person_prohibited_5)
       (not responsible_person_prohibited_24)
       (not responsible_person_prohibited_10)
       (not responsible_person_prohibited_9)
       (not responsible_person_prohibited_1)
       (not responsible_person_prohibited_8)
       (not responsible_person_prohibited_7)
       (not responsible_person_prohibited_23)
       (not responsible_person_prohibited_14)
       (not responsible_person_prohibited_22)
       (not responsible_person_prohibited_19)
       (not responsible_person_prohibited_2)
       (not responsible_person_prohibited_13)
       (not responsible_person_prohibited_16)
       (not responsible_person_prohibited_12)
       (not responsible_person_prohibited_3)
       (not responsible_person_prohibited_11)
       (not responsible_person_prohibited_17)
       (not responsible_person_prohibited_20)
       (not responsible_person_prohibited_21)
       (not responsible_person_prohibited_6))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_article_18_2_rules true))
(assert (= internal_control_system_established true))
(assert (= business_operated_according_to_law_and_internal_control false))
(assert (= internal_control_compliant false))
(assert (= internal_control_executed false))
(assert (= violation_178_1_4 true))
(assert (= responsible_person_honest false))
(assert (= responsible_person_prohibited_9 false))
(assert (= loan_or_securities_mediation_with_client true))
(assert (= provide_account_for_client_trading true))
(assert (= prohibited_behavior_37_3 false))
(assert (= violate_article_56 true))
(assert (= violation_56 true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 64
; Total variables: 138
; Total facts: 13
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
