; SMT2 file generated from compliance case automatic
; Case ID: case_4
; Generated at: 2025-10-19T04:48:53.839081
;
; This file can be executed with Z3:
;   z3 case_4.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_operated_according_to_internal_control Bool)
(declare-const confidentiality Bool)
(declare-const confidentiality_management_rule Bool)
(declare-const damaging_client_interest_trade Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_loyalty Bool)
(declare-const fiduciary_duty Bool)
(declare-const good_faith_principle Bool)
(declare-const improper_order_transfer Bool)
(declare-const insider_trading_for_others Bool)
(declare-const insider_trading_restriction Bool)
(declare-const intentional_matched_trade Bool)
(declare-const internal_control_approved Bool)
(declare-const internal_control_approved_by_board Bool)
(declare-const internal_control_changed_if_notified Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_filed Bool)
(declare-const internal_control_system_established Bool)
(declare-const investment_decision_based_on_report Bool)
(declare-const matched_principal_trade Bool)
(declare-const other_harmful_behavior Bool)
(declare-const other_related_data_protected Bool)
(declare-const penalty Bool)
(declare-const performance_fee_regulated Bool)
(declare-const personal_data_protected Bool)
(declare-const profit_loss_sharing_agreement Bool)
(declare-const prohibited_behavior_1 Bool)
(declare-const prohibited_behavior_2 Bool)
(declare-const prohibited_behavior_3 Bool)
(declare-const prohibited_behavior_4 Bool)
(declare-const prohibited_behavior_5 Bool)
(declare-const prohibited_behavior_6 Bool)
(declare-const prohibited_behavior_7 Bool)
(declare-const prohibited_behavior_8 Bool)
(declare-const prohibited_behavior_9 Bool)
(declare-const reasonable_explanation_provided Bool)
(declare-const regulator_allows_subdelegation Bool)
(declare-const report_lacks_reasonable_basis Bool)
(declare-const restricted_related_party_trading Bool)
(declare-const subdelegation_or_assignment Bool)
(declare-const trade_through_central_market Bool)
(declare-const transaction_data_protected Bool)
(declare-const use_client_account_for_self_or_others Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:fiduciary_duty] 證券投資信託及顧問事業及相關人員應以善良管理人注意義務及忠實義務執行業務
(assert (= fiduciary_duty (and duty_of_care duty_of_loyalty good_faith_principle)))

; [securities:confidentiality] 應保守受益人或客戶個人資料、往來交易資料及其他相關資料秘密
(assert (= confidentiality
   (and personal_data_protected
        transaction_data_protected
        other_related_data_protected)))

; [securities:prohibited_behavior_1] 不得利用職務上所獲知資訊為自己或客戶以外之人從事有價證券買賣交易
(assert (not (= insider_trading_for_others prohibited_behavior_1)))

; [securities:prohibited_behavior_2] 不得運用委託投資資產買賣有價證券時從事足以損害客戶權益之交易
(assert (not (= damaging_client_interest_trade prohibited_behavior_2)))

; [securities:prohibited_behavior_3] 不得與客戶為投資有價證券收益共享或損失分擔之約定（主管機關另有規定者除外）
(assert (= prohibited_behavior_3
   (or performance_fee_regulated (not profit_loss_sharing_agreement))))

; [securities:prohibited_behavior_4] 不得運用客戶委託投資資產與自己或其他客戶資金為相對委託交易（經由集中交易市場或證券商營業處所委託買賣成交且非故意者除外）
(assert (= prohibited_behavior_4
   (or (not matched_principal_trade)
       (and trade_through_central_market (not intentional_matched_trade)))))

; [securities:prohibited_behavior_5] 不得利用客戶帳戶為自己或他人買賣有價證券
(assert (not (= use_client_account_for_self_or_others prohibited_behavior_5)))

; [securities:prohibited_behavior_6] 不得將全權委託投資契約全部或部分複委任或轉讓他人（主管機關另有規定者除外）
(assert (= prohibited_behavior_6
   (or regulator_allows_subdelegation (not subdelegation_or_assignment))))

; [securities:prohibited_behavior_7] 不得無正當理由將已成交買賣委託自全權委託帳戶改為自己、他人或其他全權委託帳戶，或反向改變
(assert (not (= improper_order_transfer prohibited_behavior_7)))

; [securities:prohibited_behavior_8] 未依投資分析報告作成投資決策或投資分析報告缺乏合理分析基礎（能合理解釋者除外）
(assert (= prohibited_behavior_8
   (or (not investment_decision_based_on_report)
       (and report_lacks_reasonable_basis (not reasonable_explanation_provided)))))

; [securities:prohibited_behavior_9] 其他影響事業經營或客戶權益之行為
(assert (not (= other_harmful_behavior prohibited_behavior_9)))

; [securities:insider_trading_restriction] 負責人、部門主管、分支機構經理人、基金經理人及其關係人不得從事特定公司股票及具股權性質衍生商品交易
(assert (not (= restricted_related_party_trading insider_trading_restriction)))

; [securities:confidentiality_management_rule] 證券投資信託事業負責人與業務人員應保守受益人或客戶個人資料、往來交易資料及其他相關資料秘密
(assert (= confidentiality_management_rule
   (and personal_data_protected
        transaction_data_protected
        other_related_data_protected)))

; [securities:internal_control_established] 證券投資信託事業已建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_executed] 證券投資信託事業已依法令、章程及內部控制制度經營業務
(assert (= internal_control_executed business_operated_according_to_internal_control))

; [securities:internal_control_approved] 內部控制制度訂定或變更已報董事會同意並留存備查，並於本會通知限期內變更
(assert (= internal_control_approved
   (and internal_control_approved_by_board
        internal_control_filed
        internal_control_changed_if_notified)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反誠信義務、保密義務、禁止行為或未建立及執行內部控制制度時處罰
(assert (= penalty
   (or (not confidentiality)
       (not prohibited_behavior_4)
       (not prohibited_behavior_9)
       (not prohibited_behavior_7)
       (not internal_control_approved)
       (not fiduciary_duty)
       (not internal_control_executed)
       (not prohibited_behavior_1)
       (not prohibited_behavior_8)
       (not prohibited_behavior_6)
       (not prohibited_behavior_3)
       (not prohibited_behavior_5)
       (not internal_control_established)
       (not prohibited_behavior_2)
       (not confidentiality_management_rule)
       (not insider_trading_restriction))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= duty_of_care false))
(assert (= duty_of_loyalty false))
(assert (= good_faith_principle false))
(assert (= fiduciary_duty false))
(assert (= personal_data_protected true))
(assert (= transaction_data_protected true))
(assert (= other_related_data_protected true))
(assert (= confidentiality true))
(assert (= confidentiality_management_rule true))
(assert (= insider_trading_for_others true))
(assert (= prohibited_behavior_1 false))
(assert (= damaging_client_interest_trade true))
(assert (= prohibited_behavior_2 false))
(assert (= profit_loss_sharing_agreement false))
(assert (= performance_fee_regulated true))
(assert (= prohibited_behavior_3 false))
(assert (= matched_principal_trade false))
(assert (= trade_through_central_market true))
(assert (= intentional_matched_trade false))
(assert (= prohibited_behavior_4 false))
(assert (= use_client_account_for_self_or_others true))
(assert (= prohibited_behavior_5 false))
(assert (= subdelegation_or_assignment false))
(assert (= regulator_allows_subdelegation false))
(assert (= prohibited_behavior_6 false))
(assert (= improper_order_transfer false))
(assert (= prohibited_behavior_7 false))
(assert (= investment_decision_based_on_report false))
(assert (= report_lacks_reasonable_basis true))
(assert (= reasonable_explanation_provided false))
(assert (= prohibited_behavior_8 false))
(assert (= other_harmful_behavior false))
(assert (= prohibited_behavior_9 false))
(assert (= restricted_related_party_trading true))
(assert (= insider_trading_restriction false))
(assert (= internal_control_system_established false))
(assert (= internal_control_established false))
(assert (= business_operated_according_to_internal_control false))
(assert (= internal_control_executed false))
(assert (= internal_control_approved_by_board false))
(assert (= internal_control_filed false))
(assert (= internal_control_changed_if_notified false))
(assert (= internal_control_approved false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 44
; Total facts: 44
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
