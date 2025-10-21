; SMT2 file generated from compliance case automatic
; Case ID: case_36
; Generated at: 2025-10-20T23:39:56.900036
;
; This file can be executed with Z3:
;   z3 case_36.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accepted_client_without_trust_contract Bool)
(declare-const accepted_client_without_trust_contract_by_responsible_person Bool)
(declare-const accepted_different_account_offsetting_trades Bool)
(declare-const accepted_full_discretionary_trust Bool)
(declare-const accepted_full_discretionary_trust_by_responsible_person Bool)
(declare-const accepted_non_authorized_proxy_trading Bool)
(declare-const accepted_non_authorized_proxy_trading_by_responsible_person Bool)
(declare-const accepted_non_self_account_opening Bool)
(declare-const accepted_non_self_account_opening_by_responsible_person Bool)
(declare-const accepted_offsetting_trades_by_responsible_person Bool)
(declare-const accepted_proxy_trading_by_internal_personnel Bool)
(declare-const accepted_proxy_trading_by_internal_personnel_by_responsible_person Bool)
(declare-const accepted_proxy_trading_by_responsible_person Bool)
(declare-const accepted_same_account_offsetting_trades Bool)
(declare-const accepted_trading_with_insider_or_manipulation_intent Bool)
(declare-const accepted_trading_with_insider_or_manipulation_intent_by_responsible_person Bool)
(declare-const business_according_to_articles Bool)
(declare-const business_according_to_internal_control Bool)
(declare-const business_according_to_law Bool)
(declare-const business_compliance Bool)
(declare-const exception_37_1_applied Bool)
(declare-const exception_by_authority_12 Bool)
(declare-const exception_by_authority_19 Bool)
(declare-const exception_by_authority_9 Bool)
(declare-const exception_by_tripartite_contract_13 Bool)
(declare-const exception_by_tripartite_contract_20 Bool)
(declare-const exception_credit_transaction_offset Bool)
(declare-const exception_for_underwriting_15 Bool)
(declare-const exception_legal_agent_17 Bool)
(declare-const exception_same_day_cash_offset Bool)
(declare-const executed_business_with_honesty_and_credit Bool)
(declare-const executed_trades_according_to_client_instructions Bool)
(declare-const guaranteed_profit_or_shared_benefit Bool)
(declare-const had_concealment_or_fraud_in_underwriting_or_trading Bool)
(declare-const had_loan_or_securities_lending_with_client Bool)
(declare-const had_undue_benefit_agreement Bool)
(declare-const held_client_assets_on_behalf Bool)
(declare-const internal_control_change_completed_within_deadline Bool)
(declare-const internal_control_change_notified Bool)
(declare-const internal_control_compliant Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_updated Bool)
(declare-const misappropriated_client_assets Bool)
(declare-const misappropriated_or_held_client_assets Bool)
(declare-const penalty Bool)
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
(declare-const provided_account_for_trading Bool)
(declare-const provided_false_or_fraudulent_information Bool)
(declare-const provided_price_movement_prediction Bool)
(declare-const provided_price_movement_prediction_by_responsible_person Bool)
(declare-const provided_specific_benefit_or_loss_burden Bool)
(declare-const provided_unapproved_financing_or_securities Bool)
(declare-const recommended_specific_stocks_to_public Bool)
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
(declare-const self_counterparty_trading Bool)
(declare-const set_fixed_place_outside_office_for_contract_or_settlement Bool)
(declare-const set_fixed_place_outside_office_for_trading Bool)
(declare-const shared_trading_loss_or_profit Bool)
(declare-const solicited_unapproved_securities_or_derivatives Bool)
(declare-const unauthorized_disclosure_by_responsible_person Bool)
(declare-const unauthorized_disclosure_of_client_info Bool)
(declare-const used_client_name_or_account_by_responsible_person Bool)
(declare-const used_client_name_or_account_for_trading Bool)
(declare-const used_insider_info_for_speculation Bool)
(declare-const used_non_securities_personnel_or_paid_unreasonable_commission Bool)
(declare-const used_others_or_relatives_name_for_client_trading Bool)
(declare-const violated_other_securities_regulations Bool)
(declare-const violated_other_securities_regulations_by_responsible_person Bool)
(declare-const violated_settlement_obligation Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:internal_control_established] 證券商依本會及相關機構訂定標準建立內部控制制度
(assert (= internal_control_established internal_control_compliant))

; [securities:internal_control_updated] 內部控制制度於本會或相關機構通知變更後限期內完成變更
(assert (= internal_control_updated
   (or internal_control_change_completed_within_deadline
       (not internal_control_change_notified))))

; [securities:business_compliance] 證券商業務依法令、章程及內部控制制度經營
(assert (= business_compliance
   (and business_according_to_law
        business_according_to_articles
        business_according_to_internal_control)))

; [securities:prohibited_behavior_1] 禁止提供有價證券漲跌判斷以勸誘客戶買賣
(assert (not (= provided_price_movement_prediction prohibited_behavior_1)))

; [securities:prohibited_behavior_2] 禁止約定或提供特定利益或負擔損失以勸誘客戶買賣
(assert (not (= provided_specific_benefit_or_loss_burden prohibited_behavior_2)))

; [securities:prohibited_behavior_3] 禁止提供帳戶供客戶申購、買賣有價證券
(assert (not (= provided_account_for_trading prohibited_behavior_3)))

; [securities:prohibited_behavior_4] 禁止對客戶提供虛偽、詐騙或足致他人誤信之有價證券資訊
(assert (not (= provided_false_or_fraudulent_information prohibited_behavior_4)))

; [securities:prohibited_behavior_5] 禁止接受客戶對買賣有價證券之種類、數量、價格及買進或賣出之全權委託
(assert (not (= accepted_full_discretionary_trust prohibited_behavior_5)))

; [securities:prohibited_behavior_6] 禁止接受客戶以同一帳戶為同種有價證券買進與賣出或賣出與買進相抵之交割（不含第三十七條之一規定者）
(assert (= prohibited_behavior_6
   (or exception_37_1_applied (not accepted_same_account_offsetting_trades))))

; [securities:prohibited_behavior_7] 禁止接受客戶以不同帳戶為同一種有價證券買進與賣出或賣出與買進相抵之交割
(assert (not (= accepted_different_account_offsetting_trades prohibited_behavior_7)))

; [securities:prohibited_behavior_8] 禁止於本公司或分支機構營業場所外設置固定場所接受有價證券買賣委託
(assert (not (= set_fixed_place_outside_office_for_trading prohibited_behavior_8)))

; [securities:prohibited_behavior_9] 禁止於本公司或分支機構營業場所外設置固定場所辦理受託契約簽訂或有價證券買賣交割（本會另有規定者除外）
(assert (= prohibited_behavior_9
   (or exception_by_authority_9
       (not set_fixed_place_outside_office_for_contract_or_settlement))))

; [securities:prohibited_behavior_10] 禁止受理未經辦妥受託契約之客戶買賣有價證券
(assert (not (= accepted_client_without_trust_contract prohibited_behavior_10)))

; [securities:prohibited_behavior_11] 禁止受理本公司董事、監察人、受僱人代理他人開戶、申購、買賣或交割有價證券
(assert (not (= accepted_proxy_trading_by_internal_personnel prohibited_behavior_11)))

; [securities:prohibited_behavior_12] 禁止受理非本人開戶（本會另有規定者除外）
(assert (= prohibited_behavior_12
   (or exception_by_authority_12 (not accepted_non_self_account_opening))))

; [securities:prohibited_behavior_13] 禁止受理非本人或未具客戶委任書之代理人申購、買賣或交割有價證券（證券商依三方契約接受證券投資顧問自動再平衡交易者除外）
(assert (= prohibited_behavior_13
   (or exception_by_tripartite_contract_13
       (not accepted_non_authorized_proxy_trading))))

; [securities:prohibited_behavior_14] 禁止知悉客戶利用未公開重大消息或操縱市場意圖仍接受委託買賣
(assert (not (= accepted_trading_with_insider_or_manipulation_intent
        prohibited_behavior_14)))

; [securities:prohibited_behavior_15] 禁止利用客戶名義或帳戶申購、買賣有價證券
(assert (not (= used_client_name_or_account_for_trading prohibited_behavior_15)))

; [securities:prohibited_behavior_16] 禁止非依法令所為之查詢洩露客戶委託事項及業務秘密
(assert (not (= unauthorized_disclosure_of_client_info prohibited_behavior_16)))

; [securities:prohibited_behavior_17] 禁止挪用客戶所有或暫存於證券商之有價證券或款項
(assert (not (= misappropriated_client_assets prohibited_behavior_17)))

; [securities:prohibited_behavior_18] 禁止代客戶保管有價證券、款項、印鑑或存摺
(assert (not (= held_client_assets_on_behalf prohibited_behavior_18)))

; [securities:prohibited_behavior_19] 禁止未經本會核准辦理有價證券買賣之融資或融券，提供款項或有價證券供客戶交割
(assert (not (= provided_unapproved_financing_or_securities prohibited_behavior_19)))

; [securities:prohibited_behavior_20] 禁止違反對證券交易市場之交割義務
(assert (not (= violated_settlement_obligation prohibited_behavior_20)))

; [securities:prohibited_behavior_21] 禁止利用非證券商人員招攬業務或給付不合理佣金
(assert (not (= used_non_securities_personnel_or_paid_unreasonable_commission
        prohibited_behavior_21)))

; [securities:prohibited_behavior_22] 禁止其他違反證券管理法令或本會規定應為或不得為之行為
(assert (not (= violated_other_securities_regulations prohibited_behavior_22)))

; [securities:responsible_person_honest] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= responsible_person_honest executed_business_with_honesty_and_credit))

; [securities:responsible_person_prohibited_1] 負責人及業務人員不得以職務上所知悉消息從事上市或上櫃有價證券買賣以獲取投機利益
(assert (not (= used_insider_info_for_speculation responsible_person_prohibited_1)))

; [securities:responsible_person_prohibited_2] 負責人及業務人員不得非依法令所為之查詢洩漏客戶委託事項及職務上所獲悉秘密
(assert (not (= unauthorized_disclosure_by_responsible_person
        responsible_person_prohibited_2)))

; [securities:responsible_person_prohibited_3] 負責人及業務人員不得受理客戶對買賣有價證券之種類、數量、價格及買進或賣出之全權委託
(assert (not (= accepted_full_discretionary_trust_by_responsible_person
        responsible_person_prohibited_3)))

; [securities:responsible_person_prohibited_4] 負責人及業務人員不得對客戶作贏利保證或分享利益之證券買賣
(assert (not (= guaranteed_profit_or_shared_benefit responsible_person_prohibited_4)))

; [securities:responsible_person_prohibited_5] 負責人及業務人員不得約定與客戶共同承擔買賣有價證券之交易損益
(assert (not (= shared_trading_loss_or_profit responsible_person_prohibited_5)))

; [securities:responsible_person_prohibited_6] 負責人及業務人員不得同時以自己計算為買入或賣出之相對行為
(assert (not (= self_counterparty_trading responsible_person_prohibited_6)))

; [securities:responsible_person_prohibited_7] 負責人及業務人員不得利用客戶名義或帳戶申購、買賣有價證券
(assert (not (= used_client_name_or_account_by_responsible_person
        responsible_person_prohibited_7)))

; [securities:responsible_person_prohibited_8] 負責人及業務人員不得以他人或親屬名義供客戶申購、買賣有價證券
(assert (not (= used_others_or_relatives_name_for_client_trading
        responsible_person_prohibited_8)))

; [securities:responsible_person_prohibited_9] 負責人及業務人員不得與客戶有借貸款項、有價證券或為借貸媒介情事
(assert (not (= had_loan_or_securities_lending_with_client
        responsible_person_prohibited_9)))

; [securities:responsible_person_prohibited_10] 負責人及業務人員辦理承銷或買賣有價證券時不得有隱瞞、詐欺或足以致人誤信之行為
(assert (not (= had_concealment_or_fraud_in_underwriting_or_trading
        responsible_person_prohibited_10)))

; [securities:responsible_person_prohibited_11] 負責人及業務人員不得挪用或代客戶保管有價證券、款項、印鑑或存摺
(assert (not (= misappropriated_or_held_client_assets responsible_person_prohibited_11)))

; [securities:responsible_person_prohibited_12] 負責人及業務人員不得受理未經辦妥受託契約之客戶買賣有價證券
(assert (not (= accepted_client_without_trust_contract_by_responsible_person
        responsible_person_prohibited_12)))

; [securities:responsible_person_prohibited_13] 負責人及業務人員未依據客戶委託事項及條件執行有價證券買賣
(assert (not (= executed_trades_according_to_client_instructions
        responsible_person_prohibited_13)))

; [securities:responsible_person_prohibited_14] 負責人及業務人員不得向客戶或不特定多數人提供有價證券漲跌判斷以勸誘買賣
(assert (not (= provided_price_movement_prediction_by_responsible_person
        responsible_person_prohibited_14)))

; [securities:responsible_person_prohibited_15] 負責人及業務人員不得向不特定多數人推介買賣特定股票（承銷有價證券所需除外）
(assert (= responsible_person_prohibited_15
   (or exception_for_underwriting_15
       (not recommended_specific_stocks_to_public))))

; [securities:responsible_person_prohibited_16] 負責人及業務人員不得接受客戶以同一或不同帳戶為同種有價證券買賣相抵交割（信用交易資券相抵及同日現券相抵除外）
(assert (= responsible_person_prohibited_16
   (or (not accepted_offsetting_trades_by_responsible_person)
       exception_credit_transaction_offset
       exception_same_day_cash_offset)))

; [securities:responsible_person_prohibited_17] 負責人及業務人員不得代理他人開戶、申購、買賣或交割有價證券（法定代理人除外）
(assert (= responsible_person_prohibited_17
   (or exception_legal_agent_17
       (not accepted_proxy_trading_by_responsible_person))))

; [securities:responsible_person_prohibited_18] 負責人及業務人員不得受理本公司董事、監察人、受僱人代理他人開戶、申購、買賣或交割有價證券
(assert (not (= accepted_proxy_trading_by_internal_personnel_by_responsible_person
        responsible_person_prohibited_18)))

; [securities:responsible_person_prohibited_19] 負責人及業務人員不得受理非本人開戶（本會另有規定者除外）
(assert (= responsible_person_prohibited_19
   (or exception_by_authority_19
       (not accepted_non_self_account_opening_by_responsible_person))))

; [securities:responsible_person_prohibited_20] 負責人及業務人員不得受理非本人或未具客戶委任書之代理人申購、買賣或交割有價證券（依三方契約接受證券投資顧問自動再平衡交易者除外）
(assert (= responsible_person_prohibited_20
   (or exception_by_tripartite_contract_20
       (not accepted_non_authorized_proxy_trading_by_responsible_person))))

; [securities:responsible_person_prohibited_21] 負責人及業務人員不得知悉客戶利用未公開重大消息或操縱市場意圖仍接受委託買賣
(assert (not (= accepted_trading_with_insider_or_manipulation_intent_by_responsible_person
        responsible_person_prohibited_21)))

; [securities:responsible_person_prohibited_22] 負責人及業務人員不得與發行公司或相關人員有獲取不當利益之約定
(assert (not (= had_undue_benefit_agreement responsible_person_prohibited_22)))

; [securities:responsible_person_prohibited_23] 負責人及業務人員不得招攬、媒介、促銷未經核准之有價證券或衍生性商品
(assert (not (= solicited_unapproved_securities_or_derivatives
        responsible_person_prohibited_23)))

; [securities:responsible_person_prohibited_24] 負責人及業務人員不得違反證券管理法令或本會規定不得為之行為
(assert (not (= violated_other_securities_regulations_by_responsible_person
        responsible_person_prohibited_24)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一證券商管理規則或證券交易法規定之禁止行為時處罰
(assert (= penalty
   (or (not responsible_person_prohibited_21)
       (not responsible_person_prohibited_9)
       (not responsible_person_prohibited_23)
       (not responsible_person_prohibited_10)
       (not responsible_person_prohibited_2)
       (not responsible_person_prohibited_19)
       (not prohibited_behavior_2)
       (not prohibited_behavior_10)
       (not prohibited_behavior_7)
       (not prohibited_behavior_9)
       (not responsible_person_prohibited_15)
       (not responsible_person_prohibited_17)
       (not responsible_person_prohibited_14)
       (not responsible_person_prohibited_4)
       (not prohibited_behavior_15)
       (not internal_control_established)
       (not prohibited_behavior_21)
       (not prohibited_behavior_4)
       (not responsible_person_prohibited_5)
       (not responsible_person_prohibited_22)
       (not prohibited_behavior_5)
       (not responsible_person_prohibited_11)
       (not responsible_person_honest)
       (not prohibited_behavior_19)
       (not prohibited_behavior_20)
       (not responsible_person_prohibited_6)
       (not prohibited_behavior_12)
       (not prohibited_behavior_13)
       (not prohibited_behavior_3)
       (not prohibited_behavior_22)
       (not responsible_person_prohibited_13)
       (not responsible_person_prohibited_18)
       (not prohibited_behavior_16)
       (not prohibited_behavior_1)
       (not responsible_person_prohibited_16)
       (not responsible_person_prohibited_20)
       (not business_compliance)
       (not responsible_person_prohibited_8)
       (not prohibited_behavior_18)
       (not responsible_person_prohibited_3)
       (not responsible_person_prohibited_24)
       (not responsible_person_prohibited_1)
       (not internal_control_updated)
       (not responsible_person_prohibited_7)
       (not prohibited_behavior_6)
       (not prohibited_behavior_14)
       (not responsible_person_prohibited_12)
       (not prohibited_behavior_11)
       (not prohibited_behavior_17)
       (not prohibited_behavior_8))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= internal_control_compliant false))
(assert (= internal_control_updated false))
(assert (= internal_control_change_notified false))
(assert (= internal_control_change_completed_within_deadline false))
(assert (= business_according_to_law false))
(assert (= business_according_to_articles true))
(assert (= business_according_to_internal_control false))
(assert (= accepted_non_authorized_proxy_trading true))
(assert (= accepted_non_authorized_proxy_trading_by_responsible_person true))
(assert (= accepted_proxy_trading_by_internal_personnel true))
(assert (= accepted_proxy_trading_by_internal_personnel_by_responsible_person true))
(assert (= accepted_client_without_trust_contract true))
(assert (= accepted_client_without_trust_contract_by_responsible_person true))
(assert (= executed_business_with_honesty_and_credit false))
(assert (= executed_trades_according_to_client_instructions false))
(assert (= violated_other_securities_regulations true))
(assert (= violated_other_securities_regulations_by_responsible_person true))
(assert (= prohibited_behavior_10 false))
(assert (= prohibited_behavior_11 false))
(assert (= prohibited_behavior_13 false))
(assert (= responsible_person_prohibited_12 false))
(assert (= responsible_person_prohibited_20 false))
(assert (= responsible_person_prohibited_13 false))
(assert (= responsible_person_honest false))
(assert (= penalty true))
(assert (= provided_price_movement_prediction false))
(assert (= provided_price_movement_prediction_by_responsible_person false))
(assert (= provided_specific_benefit_or_loss_burden false))
(assert (= provided_account_for_trading false))
(assert (= provided_false_or_fraudulent_information false))
(assert (= accepted_full_discretionary_trust false))
(assert (= accepted_full_discretionary_trust_by_responsible_person false))
(assert (= accepted_same_account_offsetting_trades false))
(assert (= accepted_different_account_offsetting_trades false))
(assert (= accepted_trading_with_insider_or_manipulation_intent false))
(assert (= accepted_trading_with_insider_or_manipulation_intent_by_responsible_person false))
(assert (= accepted_non_self_account_opening false))
(assert (= accepted_non_self_account_opening_by_responsible_person false))
(assert (= exception_37_1_applied false))
(assert (= exception_by_authority_9 false))
(assert (= exception_by_authority_12 false))
(assert (= exception_by_authority_19 false))
(assert (= exception_by_tripartite_contract_13 false))
(assert (= exception_by_tripartite_contract_20 false))
(assert (= exception_credit_transaction_offset false))
(assert (= exception_same_day_cash_offset false))
(assert (= exception_legal_agent_17 false))
(assert (= guaranteed_profit_or_shared_benefit false))
(assert (= shared_trading_loss_or_profit false))
(assert (= self_counterparty_trading false))
(assert (= set_fixed_place_outside_office_for_trading false))
(assert (= set_fixed_place_outside_office_for_contract_or_settlement false))
(assert (= solicited_unapproved_securities_or_derivatives false))
(assert (= unauthorized_disclosure_of_client_info false))
(assert (= unauthorized_disclosure_by_responsible_person false))
(assert (= used_client_name_or_account_for_trading false))
(assert (= used_client_name_or_account_by_responsible_person false))
(assert (= used_insider_info_for_speculation false))
(assert (= used_non_securities_personnel_or_paid_unreasonable_commission false))
(assert (= used_others_or_relatives_name_for_client_trading false))
(assert (= had_concealment_or_fraud_in_underwriting_or_trading false))
(assert (= had_loan_or_securities_lending_with_client false))
(assert (= had_undue_benefit_agreement false))
(assert (= misappropriated_client_assets false))
(assert (= misappropriated_or_held_client_assets false))
(assert (= held_client_assets_on_behalf false))
(assert (= violated_settlement_obligation false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 52
; Total variables: 114
; Total facts: 68
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
