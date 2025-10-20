; SMT2 file generated from compliance case automatic
; Case ID: case_226
; Generated at: 2025-10-19T10:54:04.230507
;
; This file can be executed with Z3:
;   z3 case_226.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accept_uncontracted_customer Bool)
(declare-const follow_customer_instructions Bool)
(declare-const fraud_or_misleading_in_underwriting_or_trading Bool)
(declare-const full_power_delegation_accepted Bool)
(declare-const honesty_and_credit_principle Bool)
(declare-const honesty_and_credit_principle_met Bool)
(declare-const illegal_account_agent Bool)
(declare-const illegal_inquiry_or_disclosure Bool)
(declare-const illegal_market_tips Bool)
(declare-const illegal_promotion Bool)
(declare-const illegal_recommendation Bool)
(declare-const illegal_settlement_offset Bool)
(declare-const improper_benefit_in_underwriting Bool)
(declare-const internal_agent_trading Bool)
(declare-const joint_loss_sharing_agreement Bool)
(declare-const knowingly_accept_illegal_trades Bool)
(declare-const loan_or_mediation_with_customer Bool)
(declare-const misappropriation_or_custody Bool)
(declare-const non_authorized_agent_trading Bool)
(declare-const non_customer_account_accepted Bool)
(declare-const other_violations Bool)
(declare-const penalty Bool)
(declare-const profit_guarantee_or_sharing Bool)
(declare-const prohibited_accept_uncontracted_customer Bool)
(declare-const prohibited_fraud_or_misleading_in_underwriting_or_trading Bool)
(declare-const prohibited_full_power_delegation Bool)
(declare-const prohibited_illegal_account_agent Bool)
(declare-const prohibited_illegal_inquiry_and_disclosure Bool)
(declare-const prohibited_illegal_market_tips Bool)
(declare-const prohibited_illegal_promotion Bool)
(declare-const prohibited_illegal_recommendation Bool)
(declare-const prohibited_illegal_settlement_offset Bool)
(declare-const prohibited_improper_benefit_in_underwriting Bool)
(declare-const prohibited_internal_agent_trading Bool)
(declare-const prohibited_joint_loss_sharing Bool)
(declare-const prohibited_knowingly_accept_illegal_trades Bool)
(declare-const prohibited_loan_or_mediation_with_customer Bool)
(declare-const prohibited_misappropriation_or_custody Bool)
(declare-const prohibited_non_authorized_agent_trading Bool)
(declare-const prohibited_non_customer_account Bool)
(declare-const prohibited_not_follow_customer_instructions Bool)
(declare-const prohibited_other_violations Bool)
(declare-const prohibited_profit_guarantee_or_sharing Bool)
(declare-const prohibited_self_dealing Bool)
(declare-const prohibited_speculative_trading Bool)
(declare-const prohibited_use_customer_account Bool)
(declare-const prohibited_use_others_or_relatives_account Bool)
(declare-const self_dealing_in_customer_trades Bool)
(declare-const speculative_trading_with_insider_info Bool)
(declare-const use_customer_account_for_trading Bool)
(declare-const use_others_or_relatives_account Bool)
(declare-const violation_affects_business Bool)
(declare-const violation_affects_business_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:honesty_and_credit_principle] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= honesty_and_credit_principle honesty_and_credit_principle_met))

; [securities:prohibited_speculative_trading] 不得以職務上所知悉之消息從事上市或上櫃有價證券買賣以獲取投機利益
(assert (not (= speculative_trading_with_insider_info prohibited_speculative_trading)))

; [securities:prohibited_illegal_inquiry_and_disclosure] 不得非依法令查詢並洩漏客戶委託事項及職務上所獲悉之秘密
(assert (not (= illegal_inquiry_or_disclosure prohibited_illegal_inquiry_and_disclosure)))

; [securities:prohibited_full_power_delegation] 不得受理客戶對買賣有價證券之種類、數量、價格及買進或賣出之全權委託
(assert (not (= full_power_delegation_accepted prohibited_full_power_delegation)))

; [securities:prohibited_profit_guarantee_or_sharing] 不得對客戶作贏利保證或分享利益之證券買賣
(assert (not (= profit_guarantee_or_sharing prohibited_profit_guarantee_or_sharing)))

; [securities:prohibited_joint_loss_sharing] 不得約定與客戶共同承擔買賣有價證券之交易損益
(assert (not (= joint_loss_sharing_agreement prohibited_joint_loss_sharing)))

; [securities:prohibited_self_dealing] 不得接受客戶委託買賣有價證券時，同時以自己計算為買入或賣出之相對行為
(assert (not (= self_dealing_in_customer_trades prohibited_self_dealing)))

; [securities:prohibited_use_customer_account] 不得利用客戶名義或帳戶申購、買賣有價證券
(assert (not (= use_customer_account_for_trading prohibited_use_customer_account)))

; [securities:prohibited_use_others_or_relatives_account] 不得以他人或親屬名義供客戶申購、買賣有價證券
(assert (not (= use_others_or_relatives_account
        prohibited_use_others_or_relatives_account)))

; [securities:prohibited_loan_or_mediation_with_customer] 不得與客戶有借貸款項、有價證券或為借貸款項、有價證券之媒介情事
(assert (not (= loan_or_mediation_with_customer
        prohibited_loan_or_mediation_with_customer)))

; [securities:prohibited_fraud_or_misleading_in_underwriting_or_trading] 辦理承銷、自行或受託買賣有價證券時，不得有隱瞞、詐欺或其他足以致人誤信之行為
(assert (not (= fraud_or_misleading_in_underwriting_or_trading
        prohibited_fraud_or_misleading_in_underwriting_or_trading)))

; [securities:prohibited_misappropriation_or_custody] 不得挪用或代客戶保管有價證券、款項、印鑑或存摺
(assert (not (= misappropriation_or_custody prohibited_misappropriation_or_custody)))

; [securities:prohibited_accept_uncontracted_customer] 不得受理未經辦妥受託契約之客戶買賣有價證券
(assert (not (= accept_uncontracted_customer prohibited_accept_uncontracted_customer)))

; [securities:prohibited_not_follow_customer_instructions] 未依據客戶委託事項及條件執行有價證券之買賣
(assert (not (= follow_customer_instructions
        prohibited_not_follow_customer_instructions)))

; [securities:prohibited_illegal_market_tips] 不得向客戶或不特定多數人提供某種有價證券將上漲或下跌之判斷以勸誘買賣
(assert (not (= illegal_market_tips prohibited_illegal_market_tips)))

; [securities:prohibited_illegal_recommendation] 不得向不特定多數人推介買賣特定股票（承銷有價證券所需者除外）
(assert (not (= illegal_recommendation prohibited_illegal_recommendation)))

; [securities:prohibited_illegal_settlement_offset] 不得接受客戶以同一或不同帳戶為同種有價證券買進與賣出或賣出與買進相抵之交割（法令例外除外）
(assert (not (= illegal_settlement_offset prohibited_illegal_settlement_offset)))

; [securities:prohibited_illegal_account_agent] 不得代理他人開戶、申購、買賣或交割有價證券（法定代理人除外）
(assert (not (= illegal_account_agent prohibited_illegal_account_agent)))

; [securities:prohibited_internal_agent_trading] 不得受理本公司董事、監察人、受僱人代理他人開戶、申購、買賣或交割有價證券
(assert (not (= internal_agent_trading prohibited_internal_agent_trading)))

; [securities:prohibited_non_customer_account] 不得受理非本人開戶（本會另有規定除外）
(assert (not (= non_customer_account_accepted prohibited_non_customer_account)))

; [securities:prohibited_non_authorized_agent_trading] 不得受理非本人或未具客戶委任書之代理人申購、買賣或交割有價證券（特定三方契約除外）
(assert (not (= non_authorized_agent_trading prohibited_non_authorized_agent_trading)))

; [securities:prohibited_knowingly_accept_illegal_trades] 知悉客戶有利用未公開重大消息或操縱市場意圖，仍接受委託買賣
(assert (not (= knowingly_accept_illegal_trades
        prohibited_knowingly_accept_illegal_trades)))

; [securities:prohibited_improper_benefit_in_underwriting] 辦理有價證券承銷業務人員與發行公司或相關人員間有獲取不當利益之約定
(assert (not (= improper_benefit_in_underwriting
        prohibited_improper_benefit_in_underwriting)))

; [securities:prohibited_illegal_promotion] 招攬、媒介、促銷未經核准之有價證券或其衍生性商品
(assert (not (= illegal_promotion prohibited_illegal_promotion)))

; [securities:prohibited_other_violations] 其他違反證券管理法令或本會規定不得為之行為
(assert (not (= other_violations prohibited_other_violations)))

; [securities:violation_affects_business] 董事、監察人及受僱人違反法令行為足以影響證券業務正常執行
(assert (= violation_affects_business violation_affects_business_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一禁止行為或違反誠信原則或違反董事監察人受僱人行為規定且影響業務正常執行時處罰
(assert (= penalty
   (and violation_affects_business
        (or (not prohibited_speculative_trading)
            (not honesty_and_credit_principle)
            (not prohibited_joint_loss_sharing)
            (not prohibited_self_dealing)
            (not prohibited_use_customer_account)
            (not prohibited_use_others_or_relatives_account)
            (not prohibited_loan_or_mediation_with_customer)
            (not prohibited_fraud_or_misleading_in_underwriting_or_trading)
            (not prohibited_misappropriation_or_custody)
            (not prohibited_accept_uncontracted_customer)
            (not prohibited_not_follow_customer_instructions)
            (not prohibited_illegal_market_tips)
            (not prohibited_full_power_delegation)
            (not prohibited_illegal_recommendation)
            (not prohibited_illegal_settlement_offset)
            (not prohibited_illegal_account_agent)
            (not prohibited_internal_agent_trading)
            (not prohibited_non_customer_account)
            (not prohibited_non_authorized_agent_trading)
            (not prohibited_knowingly_accept_illegal_trades)
            (not prohibited_illegal_inquiry_and_disclosure)
            (not prohibited_improper_benefit_in_underwriting)
            (not prohibited_illegal_promotion)
            (not prohibited_other_violations)
            (not prohibited_profit_guarantee_or_sharing)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= honesty_and_credit_principle_met false))
(assert (= honesty_and_credit_principle false))
(assert (= loan_or_mediation_with_customer true))
(assert (= fraud_or_misleading_in_underwriting_or_trading true))
(assert (= non_authorized_agent_trading true))
(assert (= violation_affects_business_flag true))
(assert (= violation_affects_business true))
(assert (= accept_uncontracted_customer false))
(assert (= follow_customer_instructions true))
(assert (= full_power_delegation_accepted false))
(assert (= illegal_account_agent false))
(assert (= illegal_inquiry_or_disclosure false))
(assert (= illegal_market_tips false))
(assert (= illegal_promotion false))
(assert (= illegal_recommendation false))
(assert (= illegal_settlement_offset false))
(assert (= improper_benefit_in_underwriting false))
(assert (= internal_agent_trading false))
(assert (= joint_loss_sharing_agreement false))
(assert (= knowingly_accept_illegal_trades false))
(assert (= misappropriation_or_custody false))
(assert (= non_customer_account_accepted false))
(assert (= other_violations false))
(assert (= penalty true))
(assert (= profit_guarantee_or_sharing false))
(assert (= prohibited_accept_uncontracted_customer false))
(assert (= prohibited_fraud_or_misleading_in_underwriting_or_trading false))
(assert (= prohibited_full_power_delegation true))
(assert (= prohibited_illegal_account_agent true))
(assert (= prohibited_illegal_inquiry_and_disclosure true))
(assert (= prohibited_illegal_market_tips true))
(assert (= prohibited_illegal_promotion true))
(assert (= prohibited_illegal_recommendation true))
(assert (= prohibited_illegal_settlement_offset true))
(assert (= prohibited_improper_benefit_in_underwriting true))
(assert (= prohibited_internal_agent_trading true))
(assert (= prohibited_joint_loss_sharing true))
(assert (= prohibited_knowingly_accept_illegal_trades true))
(assert (= prohibited_loan_or_mediation_with_customer false))
(assert (= prohibited_misappropriation_or_custody true))
(assert (= prohibited_non_authorized_agent_trading false))
(assert (= prohibited_non_customer_account true))
(assert (= prohibited_other_violations true))
(assert (= prohibited_profit_guarantee_or_sharing true))
(assert (= prohibited_self_dealing true))
(assert (= prohibited_speculative_trading true))
(assert (= prohibited_use_customer_account true))
(assert (= prohibited_use_others_or_relatives_account true))
(assert (= self_dealing_in_customer_trades false))
(assert (= speculative_trading_with_insider_info false))
(assert (= use_customer_account_for_trading false))
(assert (= use_others_or_relatives_account false))
(assert (= prohibited_not_follow_customer_instructions false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 53
; Total facts: 53
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
