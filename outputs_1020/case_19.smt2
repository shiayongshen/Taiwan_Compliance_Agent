; SMT2 file generated from compliance case automatic
; Case ID: case_19
; Generated at: 2025-10-19T05:31:27.302516
;
; This file can be executed with Z3:
;   z3 case_19.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authorized_action_presumption Bool)
(declare-const civil_liability_action_presumed_authorized Bool)
(declare-const compensation_responsibility Bool)
(declare-const confidentiality_compliance Bool)
(declare-const confidentiality_maintained Bool)
(declare-const control_operation_recorded Bool)
(declare-const damaging_client_interest_trading Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_loyalty Bool)
(declare-const execution_recorded Bool)
(declare-const fiduciary_duty_compliance Bool)
(declare-const good_faith_principle Bool)
(declare-const improper_order_account_transfer Bool)
(declare-const insider_trading_declaration Bool)
(declare-const insider_trading_during_holding_period Bool)
(declare-const insider_trading_reported Bool)
(declare-const insider_trading_restriction Bool)
(declare-const intentional_opposite_order Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const investment_decision_based_on_analysis Bool)
(declare-const investment_decision_has_reasonable_basis Bool)
(declare-const investment_decision_record_compliance Bool)
(declare-const law_and_order_compliance Bool)
(declare-const monthly_review_submitted Bool)
(declare-const noncompliant_investment_decision Bool)
(declare-const opposite_order_trading Bool)
(declare-const other_harmful_behavior Bool)
(declare-const other_law_or_authority_exemption Bool)
(declare-const penalty Bool)
(declare-const performance_fee_regulated Bool)
(declare-const personnel_lawful_performance Bool)
(declare-const personnel_not_violating_article_19 Bool)
(declare-const personnel_not_violating_article_59 Bool)
(declare-const personnel_not_violating_law_or_contract Bool)
(declare-const personnel_qualification_and_training_compliant Bool)
(declare-const personnel_qualification_compliance Bool)
(declare-const personnel_violation_penalty Bool)
(declare-const profit_loss_sharing_agreement Bool)
(declare-const prohibited_behavior_level_1 Bool)
(declare-const prohibited_behavior_level_2 Bool)
(declare-const prohibited_behavior_level_3 Bool)
(declare-const prohibited_behavior_level_4 Bool)
(declare-const prohibited_behavior_level_5 Bool)
(declare-const prohibited_behavior_level_6 Bool)
(declare-const prohibited_behavior_level_7 Bool)
(declare-const prohibited_behavior_level_8 Bool)
(declare-const prohibited_behavior_level_9 Bool)
(declare-const prohibited_personnel_behavior Bool)
(declare-const reasonable_explanation_provided Bool)
(declare-const record_retention_period_compliant Bool)
(declare-const regulatory_exception_for_subdelegation Bool)
(declare-const subdelegation_or_transfer Bool)
(declare-const trade_through_central_market_or_broker Bool)
(declare-const use_client_account_for_own_or_others_trading Bool)
(declare-const use_of_duty_info_for_own_or_others_trading Bool)
(declare-const violation_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:fiduciary_duty_compliance] 證券投資信託事業等依善良管理人注意義務及忠實義務誠實信用原則執行業務
(assert (= fiduciary_duty_compliance
   (and duty_of_care duty_of_loyalty good_faith_principle)))

; [securities:confidentiality_compliance] 保守受益人或客戶個人資料及交易資料秘密
(assert (= confidentiality_compliance
   (or confidentiality_maintained other_law_or_authority_exemption)))

; [securities:compensation_responsibility] 違反誠信義務或保密義務致損害應負賠償責任
(assert (= compensation_responsibility
   (and (not fiduciary_duty_compliance) (not confidentiality_compliance))))

; [securities:investment_decision_record_compliance] 投資決策依分析作成並有合理基礎，執行有紀錄並按月檢討
(assert (= investment_decision_record_compliance
   (and investment_decision_based_on_analysis
        investment_decision_has_reasonable_basis
        execution_recorded
        monthly_review_submitted)))

; [securities:internal_control_compliance] 內部控制制度訂定且確實執行，控制作業留存紀錄並保存期限合規
(assert (= internal_control_compliance
   (and internal_control_system_established
        internal_control_system_executed
        control_operation_recorded
        record_retention_period_compliant)))

; [securities:prohibited_behavior_level_1] 禁止利用職務資訊為自己或非客戶人從事有價證券買賣交易
(assert (not (= use_of_duty_info_for_own_or_others_trading prohibited_behavior_level_1)))

; [securities:prohibited_behavior_level_2] 禁止運用委託投資資產買賣有價證券時損害客戶權益之交易
(assert (not (= damaging_client_interest_trading prohibited_behavior_level_2)))

; [securities:prohibited_behavior_level_3] 禁止與客戶約定收益共享或損失分擔（主管機關另有規定者除外）
(assert (= prohibited_behavior_level_3
   (or performance_fee_regulated (not profit_loss_sharing_agreement))))

; [securities:prohibited_behavior_level_4] 禁止運用委託投資資產與自己或其他客戶資產為相對委託交易（特定例外除外）
(assert (= prohibited_behavior_level_4
   (or (not opposite_order_trading)
       (and trade_through_central_market_or_broker
            (not intentional_opposite_order)))))

; [securities:prohibited_behavior_level_5] 禁止利用客戶帳戶為自己或他人買賣有價證券
(assert (not (= use_client_account_for_own_or_others_trading
        prohibited_behavior_level_5)))

; [securities:prohibited_behavior_level_6] 禁止將全權委託投資契約全部或部分複委任或轉讓他人（主管機關另有規定除外）
(assert (= prohibited_behavior_level_6
   (or regulatory_exception_for_subdelegation (not subdelegation_or_transfer))))

; [securities:prohibited_behavior_level_7] 禁止無正當理由將已成交買賣委託帳戶間轉換
(assert (not (= improper_order_account_transfer prohibited_behavior_level_7)))

; [securities:prohibited_behavior_level_8] 禁止未依投資分析報告作成投資決策，除能提供合理解釋者外
(assert (= prohibited_behavior_level_8
   (or reasonable_explanation_provided (not noncompliant_investment_decision))))

; [securities:prohibited_behavior_level_9] 禁止其他影響事業經營或客戶權益之行為
(assert (not (= other_harmful_behavior prohibited_behavior_level_9)))

; [securities:personnel_qualification_compliance] 人員資格條件、行為規範、訓練、登記期限及程序合規
(assert (= personnel_qualification_compliance
   personnel_qualification_and_training_compliant))

; [securities:prohibited_personnel_behavior] 負責人、業務人員及受僱人不得為第19條、59條及法令契約禁止行為
(assert (= prohibited_personnel_behavior
   (and personnel_not_violating_article_19
        personnel_not_violating_article_59
        personnel_not_violating_law_or_contract)))

; [securities:authorized_action_presumption] 負責人、業務人員及受僱人涉及民事責任行為推定為事業授權範圍內行為
(assert (= authorized_action_presumption civil_liability_action_presumed_authorized))

; [securities:insider_trading_restriction] 負責人等及其關係人於持有公司股票及股權性衍生商品期間不得交易該標的
(assert (not (= insider_trading_during_holding_period insider_trading_restriction)))

; [securities:insider_trading_declaration] 負責人等及關係人從事公司股票及股權性衍生商品交易應申報
(assert (= insider_trading_declaration insider_trading_reported))

; [securities:violation_penalty] 違反本法或命令者主管機關得處分
(assert (not (= law_and_order_compliance violation_penalty)))

; [securities:personnel_violation_penalty] 董事、監察人、經理人或受僱人違反法令影響業務正常執行者主管機關得處分
(assert (not (= personnel_lawful_performance personnel_violation_penalty)))

; [securities:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities:penalty_conditions] 處罰條件：違反誠信義務、保密義務、內部控制、禁止行為或法令規定時處罰
(assert (= penalty
   (or (not prohibited_behavior_level_2)
       (not prohibited_behavior_level_8)
       (not prohibited_behavior_level_1)
       (not prohibited_behavior_level_7)
       violation_penalty
       (not prohibited_behavior_level_4)
       personnel_violation_penalty
       (not prohibited_behavior_level_9)
       (not internal_control_compliance)
       (not investment_decision_record_compliance)
       (not confidentiality_compliance)
       (not prohibited_behavior_level_6)
       (not prohibited_behavior_level_5)
       (not prohibited_behavior_level_3)
       (not prohibited_personnel_behavior)
       (not personnel_qualification_compliance)
       (not fiduciary_duty_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= duty_of_care false))
(assert (= duty_of_loyalty false))
(assert (= good_faith_principle false))
(assert (= fiduciary_duty_compliance false))
(assert (= confidentiality_maintained true))
(assert (= other_law_or_authority_exemption false))
(assert (= confidentiality_compliance true))
(assert (= compensation_responsibility false))
(assert (= investment_decision_based_on_analysis true))
(assert (= investment_decision_has_reasonable_basis true))
(assert (= execution_recorded false))
(assert (= monthly_review_submitted false))
(assert (= investment_decision_record_compliance false))
(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= control_operation_recorded false))
(assert (= record_retention_period_compliant true))
(assert (= internal_control_compliance false))
(assert (= use_of_duty_info_for_own_or_others_trading true))
(assert (= prohibited_behavior_level_1 false))
(assert (= damaging_client_interest_trading false))
(assert (= prohibited_behavior_level_2 true))
(assert (= performance_fee_regulated false))
(assert (= profit_loss_sharing_agreement false))
(assert (= prohibited_behavior_level_3 true))
(assert (= trade_through_central_market_or_broker true))
(assert (= intentional_opposite_order false))
(assert (= opposite_order_trading true))
(assert (= prohibited_behavior_level_4 false))
(assert (= use_client_account_for_own_or_others_trading true))
(assert (= prohibited_behavior_level_5 false))
(assert (= regulatory_exception_for_subdelegation false))
(assert (= subdelegation_or_transfer false))
(assert (= prohibited_behavior_level_6 true))
(assert (= improper_order_account_transfer false))
(assert (= prohibited_behavior_level_7 true))
(assert (= reasonable_explanation_provided false))
(assert (= noncompliant_investment_decision true))
(assert (= prohibited_behavior_level_8 false))
(assert (= other_harmful_behavior true))
(assert (= prohibited_behavior_level_9 false))
(assert (= personnel_qualification_and_training_compliant true))
(assert (= personnel_qualification_compliance true))
(assert (= personnel_not_violating_article_19 false))
(assert (= personnel_not_violating_article_59 false))
(assert (= personnel_not_violating_law_or_contract false))
(assert (= prohibited_personnel_behavior false))
(assert (= law_and_order_compliance false))
(assert (= violation_penalty true))
(assert (= personnel_lawful_performance false))
(assert (= personnel_violation_penalty true))
(assert (= civil_liability_action_presumed_authorized true))
(assert (= authorized_action_presumption true))
(assert (= insider_trading_during_holding_period true))
(assert (= insider_trading_restriction false))
(assert (= insider_trading_reported false))
(assert (= insider_trading_declaration false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 23
; Total variables: 58
; Total facts: 58
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
