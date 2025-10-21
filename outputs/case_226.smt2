; SMT2 file generated from compliance case automatic
; Case ID: case_226
; Generated at: 2025-10-21T05:01:31.289293
;
; This file can be executed with Z3:
;   z3 case_226.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accept_trades_with_insider_or_market_manipulation_intent Bool)
(declare-const accept_trades_without_proper_contract Bool)
(declare-const all_prohibited_behaviors_compliance Bool)
(declare-const fraud_or_misrepresentation_in_underwriting_or_trading Bool)
(declare-const full_discretionary_trading_accepted Bool)
(declare-const honesty_and_credit_compliance Bool)
(declare-const honesty_and_credit_principle_followed Bool)
(declare-const illegal_disclosure_of_client_info Bool)
(declare-const improper_benefit_agreement_in_underwriting Bool)
(declare-const inducing_trades_by_price_prediction Bool)
(declare-const insider_trading_for_speculation Bool)
(declare-const internal_person_proxy_trading_accepted Bool)
(declare-const loan_or_securities_lending_with_client Bool)
(declare-const misappropriation_or_improper_custody Bool)
(declare-const non_owner_account_opening_accepted Bool)
(declare-const not_following_client_instructions Bool)
(declare-const offsetting_trades_without_legal_exception Bool)
(declare-const other_prohibited_acts Bool)
(declare-const penalty Bool)
(declare-const penalty_applicable Bool)
(declare-const profit_guarantee_or_sharing Bool)
(declare-const prohibited_behavior_1 Bool)
(declare-const prohibited_behavior_2 Bool)
(declare-const prohibited_behavior_3 Bool)
(declare-const prohibited_behavior_4 Bool)
(declare-const prohibited_behavior_5 Bool)
(declare-const prohibited_behavior_6 Bool)
(declare-const prohibited_behavior_7 Bool)
(declare-const prohibited_behavior_8 Bool)
(declare-const prohibited_behavior_9 Bool)
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
(declare-const prohibited_behavior_20 Bool)
(declare-const prohibited_behavior_21 Bool)
(declare-const prohibited_behavior_22 Bool)
(declare-const prohibited_behavior_23 Bool)
(declare-const prohibited_behavior_24 Bool)
(declare-const self_dealing_in_client_trades Bool)
(declare-const shared_trading_loss_profit Bool)
(declare-const unapproved_securities_promotion Bool)
(declare-const unauthorized_agent_trading_accepted Bool)
(declare-const unauthorized_proxy_account_opening_or_trading Bool)
(declare-const unsolicited_stock_recommendation Bool)
(declare-const using_client_account_for_trading Bool)
(declare-const using_others_or_relatives_name_for_client_trading Bool)
(declare-const violation_detected Bool)
(declare-const violation_of_law Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_of_law] 證券商董事、監察人及受僱人違反證券交易法或相關法令，影響業務正常執行
(assert (= violation_of_law violation_detected))

; [securities:penalty_applicable] 主管機關可命令停止一年以下業務或解除職務，並依情節輕重處分
(assert (= penalty_applicable violation_of_law))

; [securities:honesty_and_credit_compliance] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= honesty_and_credit_compliance honesty_and_credit_principle_followed))

; [securities:prohibited_behavior_1] 以職務上所知悉消息從事上市或上櫃有價證券買賣以獲取投機利益
(assert (not (= insider_trading_for_speculation prohibited_behavior_1)))

; [securities:prohibited_behavior_2] 非依法令查詢洩漏客戶委託事項及職務上所獲悉秘密
(assert (not (= illegal_disclosure_of_client_info prohibited_behavior_2)))

; [securities:prohibited_behavior_3] 受理客戶對買賣有價證券之種類、數量、價格及買進或賣出之全權委託
(assert (not (= full_discretionary_trading_accepted prohibited_behavior_3)))

; [securities:prohibited_behavior_4] 對客戶作贏利保證或分享利益之證券買賣
(assert (not (= profit_guarantee_or_sharing prohibited_behavior_4)))

; [securities:prohibited_behavior_5] 約定與客戶共同承擔買賣有價證券之交易損益
(assert (not (= shared_trading_loss_profit prohibited_behavior_5)))

; [securities:prohibited_behavior_6] 接受客戶委託買賣有價證券時，同時以自己計算為買入或賣出相對行為
(assert (not (= self_dealing_in_client_trades prohibited_behavior_6)))

; [securities:prohibited_behavior_7] 利用客戶名義或帳戶申購、買賣有價證券
(assert (not (= using_client_account_for_trading prohibited_behavior_7)))

; [securities:prohibited_behavior_8] 以他人或親屬名義供客戶申購、買賣有價證券
(assert (not (= using_others_or_relatives_name_for_client_trading prohibited_behavior_8)))

; [securities:prohibited_behavior_9] 與客戶有借貸款項、有價證券或為借貸款項、有價證券之媒介情事
(assert (not (= loan_or_securities_lending_with_client prohibited_behavior_9)))

; [securities:prohibited_behavior_10] 辦理承銷、自行或受託買賣有價證券時，有隱瞞、詐欺或其他足以致人誤信之行為
(assert (not (= fraud_or_misrepresentation_in_underwriting_or_trading
        prohibited_behavior_10)))

; [securities:prohibited_behavior_11] 挪用或代客戶保管有價證券、款項、印鑑或存摺
(assert (not (= misappropriation_or_improper_custody prohibited_behavior_11)))

; [securities:prohibited_behavior_12] 受理未經辦妥受託契約之客戶買賣有價證券
(assert (not (= accept_trades_without_proper_contract prohibited_behavior_12)))

; [securities:prohibited_behavior_13] 未依據客戶委託事項及條件執行有價證券買賣
(assert (not (= not_following_client_instructions prohibited_behavior_13)))

; [securities:prohibited_behavior_14] 向客戶或不特定多數人提供某種有價證券將上漲或下跌之判斷以勸誘買賣
(assert (not (= inducing_trades_by_price_prediction prohibited_behavior_14)))

; [securities:prohibited_behavior_15] 向不特定多數人推介買賣特定股票（承銷有價證券所需者除外）
(assert (not (= unsolicited_stock_recommendation prohibited_behavior_15)))

; [securities:prohibited_behavior_16] 接受客戶以同一或不同帳戶為同種有價證券買進與賣出或賣出與買進相抵之交割（法令例外除外）
(assert (not (= offsetting_trades_without_legal_exception prohibited_behavior_16)))

; [securities:prohibited_behavior_17] 代理他人開戶、申購、買賣或交割有價證券（法定代理人除外）
(assert (not (= unauthorized_proxy_account_opening_or_trading prohibited_behavior_17)))

; [securities:prohibited_behavior_18] 受理本公司董事、監察人、受僱人代理他人開戶、申購、買賣或交割有價證券
(assert (not (= internal_person_proxy_trading_accepted prohibited_behavior_18)))

; [securities:prohibited_behavior_19] 受理非本人開戶（本會另有規定除外）
(assert (not (= non_owner_account_opening_accepted prohibited_behavior_19)))

; [securities:prohibited_behavior_20] 受理非本人或未具客戶委任書之代理人申購、買賣或交割有價證券（特定三方契約例外）
(assert (not (= unauthorized_agent_trading_accepted prohibited_behavior_20)))

; [securities:prohibited_behavior_21] 知悉客戶利用未公開重大消息或操縱市場意圖仍接受委託買賣
(assert (not (= accept_trades_with_insider_or_market_manipulation_intent
        prohibited_behavior_21)))

; [securities:prohibited_behavior_22] 辦理有價證券承銷業務人員與發行公司或相關人員間有獲取不當利益約定
(assert (not (= improper_benefit_agreement_in_underwriting prohibited_behavior_22)))

; [securities:prohibited_behavior_23] 招攬、媒介、促銷未經核准之有價證券或其衍生性商品
(assert (not (= unapproved_securities_promotion prohibited_behavior_23)))

; [securities:prohibited_behavior_24] 其他違反證券管理法令或本會規定不得為之行為
(assert (not (= other_prohibited_acts prohibited_behavior_24)))

; [securities:all_prohibited_behaviors_compliance] 證券商負責人及業務人員未有任何禁止行為
(assert (= all_prohibited_behaviors_compliance
   (and prohibited_behavior_1
        prohibited_behavior_2
        prohibited_behavior_3
        prohibited_behavior_4
        prohibited_behavior_5
        prohibited_behavior_6
        prohibited_behavior_7
        prohibited_behavior_8
        prohibited_behavior_9
        prohibited_behavior_10
        prohibited_behavior_11
        prohibited_behavior_12
        prohibited_behavior_13
        prohibited_behavior_14
        prohibited_behavior_15
        prohibited_behavior_16
        prohibited_behavior_17
        prohibited_behavior_18
        prohibited_behavior_19
        prohibited_behavior_20
        prohibited_behavior_21
        prohibited_behavior_22
        prohibited_behavior_23
        prohibited_behavior_24)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：證券商董事、監察人及受僱人違反法令或負責人及業務人員有禁止行為時處罰
(assert (= penalty (or violation_of_law (not all_prohibited_behaviors_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_detected true))
(assert (= violation_of_law true))
(assert (= penalty_applicable true))
(assert (= penalty true))
(assert (= honesty_and_credit_principle_followed false))
(assert (= honesty_and_credit_compliance false))
(assert (= loan_or_securities_lending_with_client true))
(assert (= fraud_or_misrepresentation_in_underwriting_or_trading true))
(assert (= unauthorized_agent_trading_accepted true))
(assert (= prohibited_behavior_9 false))
(assert (= prohibited_behavior_10 false))
(assert (= prohibited_behavior_20 false))
(assert (= all_prohibited_behaviors_compliance false))
(assert (= accept_trades_with_insider_or_market_manipulation_intent true))
(assert (= accept_trades_without_proper_contract true))
(assert (= full_discretionary_trading_accepted true))
(assert (= illegal_disclosure_of_client_info true))
(assert (= improper_benefit_agreement_in_underwriting true))
(assert (= inducing_trades_by_price_prediction true))
(assert (= insider_trading_for_speculation true))
(assert (= internal_person_proxy_trading_accepted true))
(assert (= misappropriation_or_improper_custody true))
(assert (= non_owner_account_opening_accepted true))
(assert (= not_following_client_instructions true))
(assert (= offsetting_trades_without_legal_exception true))
(assert (= other_prohibited_acts true))
(assert (= profit_guarantee_or_sharing true))
(assert (= prohibited_behavior_1 true))
(assert (= prohibited_behavior_2 true))
(assert (= prohibited_behavior_3 true))
(assert (= prohibited_behavior_4 true))
(assert (= prohibited_behavior_5 true))
(assert (= prohibited_behavior_6 true))
(assert (= prohibited_behavior_7 true))
(assert (= prohibited_behavior_8 true))
(assert (= prohibited_behavior_11 true))
(assert (= prohibited_behavior_12 true))
(assert (= prohibited_behavior_13 true))
(assert (= prohibited_behavior_14 true))
(assert (= prohibited_behavior_15 true))
(assert (= prohibited_behavior_16 true))
(assert (= prohibited_behavior_17 true))
(assert (= prohibited_behavior_18 true))
(assert (= prohibited_behavior_19 true))
(assert (= prohibited_behavior_21 true))
(assert (= prohibited_behavior_22 true))
(assert (= prohibited_behavior_23 true))
(assert (= prohibited_behavior_24 true))
(assert (= self_dealing_in_client_trades true))
(assert (= shared_trading_loss_profit true))
(assert (= using_client_account_for_trading true))
(assert (= using_others_or_relatives_name_for_client_trading true))
(assert (= unauthorized_proxy_account_opening_or_trading true))
(assert (= unsolicited_stock_recommendation true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 30
; Total variables: 55
; Total facts: 54
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
