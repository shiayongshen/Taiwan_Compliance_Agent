; SMT2 file generated from compliance case automatic
; Case ID: case_410
; Generated at: 2025-10-21T22:34:12.816532
;
; This file can be executed with Z3:
;   z3 case_410.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const behavior_agent_for_others Bool)
(declare-const behavior_change_account_without_reason Bool)
(declare-const behavior_false_or_fraud Bool)
(declare-const behavior_leak_info Bool)
(declare-const behavior_manipulate_market_price Bool)
(declare-const behavior_not_return_commission Bool)
(declare-const behavior_offer_special_benefit Bool)
(declare-const behavior_other_harmful Bool)
(declare-const behavior_public_promotion_or_forecast Bool)
(declare-const behavior_self_dealing Bool)
(declare-const behavior_transfer_proxy_vote_for_benefit Bool)
(declare-const behavior_unreasonable_commission Bool)
(declare-const confidentiality_compliance Bool)
(declare-const confidentiality_observed Bool)
(declare-const duty_of_care_and_loyalty_observed Bool)
(declare-const fiduciary_duty_compliance Bool)
(declare-const full_trust_behavior_change_account_without_reason Bool)
(declare-const full_trust_behavior_harm_client Bool)
(declare-const full_trust_behavior_no_reason_investment_decision Bool)
(declare-const full_trust_behavior_other_harmful Bool)
(declare-const full_trust_behavior_profit_loss_sharing Bool)
(declare-const full_trust_behavior_reasonable_explanation Bool)
(declare-const full_trust_behavior_relative_trading Bool)
(declare-const full_trust_behavior_self_dealing Bool)
(declare-const full_trust_behavior_subcontract_or_transfer Bool)
(declare-const full_trust_behavior_subcontract_or_transfer_exempted Bool)
(declare-const full_trust_behavior_use_client_account Bool)
(declare-const full_trust_behavior_use_info_for_others Bool)
(declare-const full_trust_relative_trading_not_intentional Bool)
(declare-const no_prohibited_behavior_full_trust Bool)
(declare-const no_prohibited_behaviors Bool)
(declare-const order_dismiss_personnel Bool)
(declare-const order_suspend_business_within_one_year Bool)
(declare-const penalty Bool)
(declare-const personnel_suspension_or_dismissal Bool)
(declare-const personnel_violation Bool)
(declare-const personnel_violation_occurred Bool)
(declare-const restricted_trading_full_trust_occurred Bool)
(declare-const restricted_trading_occurred Bool)
(declare-const restricted_trading_prohibition Bool)
(declare-const restricted_trading_prohibition_full_trust Bool)
(declare-const restricted_trading_reported Bool)
(declare-const restricted_trading_reporting Bool)
(declare-const violation_111_not_improved Bool)
(declare-const violation_111_occurred Bool)
(declare-const violation_111_repeat_fine Bool)
(declare-const violation_dismiss_officer Bool)
(declare-const violation_fine_and_improvement Bool)
(declare-const violation_other_measures Bool)
(declare-const violation_penalty_level Bool)
(declare-const violation_revoke_license Bool)
(declare-const violation_suspend_fund_or_business Bool)
(declare-const violation_suspend_operation Bool)
(declare-const violation_warning Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_penalty_level] 違反證券投資信託及顧問法之處分等級（1=警告,2=解除職務,3=停止募集或新增業務,4=停業,5=廢止營業許可,6=其他處置,0=無處分）
(assert (let ((a!1 (ite violation_suspend_fund_or_business
                3
                (ite violation_suspend_operation
                     4
                     (ite violation_revoke_license
                          5
                          (ite violation_other_measures 6 0))))))
  (= (ite violation_penalty_level 1 0)
     (ite violation_warning 1 (ite violation_dismiss_officer 2 a!1)))))

; [securities:personnel_violation] 董事、監察人、經理人或受僱人違反法令且影響業務正常執行
(assert (= personnel_violation personnel_violation_occurred))

; [securities:personnel_suspension_or_dismissal] 主管機關命令停止執行業務或解除職務
(assert (= personnel_suspension_or_dismissal
   (or order_suspend_business_within_one_year order_dismiss_personnel)))

; [securities:violation_fine_and_improvement] 違反第111條規定且罰鍰及限期改善
(assert (= violation_fine_and_improvement violation_111_occurred))

; [securities:violation_111_repeat_fine] 第111條違規屢次未改善，罰鍰加倍
(assert (= violation_111_repeat_fine
   (and violation_111_occurred violation_111_not_improved)))

; [securities:fiduciary_duty_compliance] 負責人及業務人員遵守善良管理人注意義務及忠實義務
(assert (= fiduciary_duty_compliance duty_of_care_and_loyalty_observed))

; [securities:prohibited_behaviors] 未有證券投資信託事業負責人與業務人員管理規則第13條禁止行為
(assert (= no_prohibited_behaviors
   (and (not behavior_leak_info)
        (not behavior_self_dealing)
        (not behavior_false_or_fraud)
        (not behavior_not_return_commission)
        (not behavior_offer_special_benefit)
        (not behavior_transfer_proxy_vote_for_benefit)
        (not behavior_manipulate_market_price)
        (not behavior_change_account_without_reason)
        (not behavior_public_promotion_or_forecast)
        (not behavior_unreasonable_commission)
        (not behavior_agent_for_others)
        (not behavior_other_harmful))))

; [securities:confidentiality_compliance] 遵守保守秘密義務
(assert (= confidentiality_compliance confidentiality_observed))

; [securities:restricted_trading_prohibition] 負責人等及其關係人不得從事特定股票及衍生商品交易
(assert (not (= restricted_trading_occurred restricted_trading_prohibition)))

; [securities:restricted_trading_reporting] 負責人等及其關係人應申報特定股票及衍生商品交易
(assert (= restricted_trading_reporting restricted_trading_reported))

; [securities:prohibited_behavior_full_trust_investment] 全權委託投資業務禁止行為
(assert (= no_prohibited_behavior_full_trust
   (and (not full_trust_behavior_use_info_for_others)
        (not full_trust_behavior_harm_client)
        (not full_trust_behavior_profit_loss_sharing)
        (not full_trust_behavior_self_dealing)
        (or (not full_trust_behavior_relative_trading)
            (and full_trust_behavior_relative_trading
                 full_trust_relative_trading_not_intentional))
        (not full_trust_behavior_use_client_account)
        (or (not full_trust_behavior_subcontract_or_transfer)
            full_trust_behavior_subcontract_or_transfer_exempted)
        (not full_trust_behavior_change_account_without_reason)
        (or full_trust_behavior_reasonable_explanation
            (not full_trust_behavior_no_reason_investment_decision))
        (not full_trust_behavior_other_harmful))))

; [securities:restricted_trading_prohibition_full_trust] 全權委託投資業務負責人等及其關係人不得從事特定股票及衍生商品交易
(assert (not (= restricted_trading_full_trust_occurred
        restricted_trading_prohibition_full_trust)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法令規定或管理規則禁止行為時處罰
(assert (= penalty
   (or (not restricted_trading_prohibition_full_trust)
       (not restricted_trading_prohibition)
       (not no_prohibited_behaviors)
       (not restricted_trading_reporting)
       personnel_violation
       (not confidentiality_compliance)
       (not fiduciary_duty_compliance)
       violation_fine_and_improvement
       (not no_prohibited_behavior_full_trust))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_warning true))
(assert (= violation_dismiss_officer true))
(assert (= violation_fine_and_improvement true))
(assert (= violation_111_occurred true))
(assert (= violation_111_not_improved true))
(assert (= personnel_violation_occurred true))
(assert (= personnel_violation true))
(assert (= order_dismiss_personnel true))
(assert (= personnel_suspension_or_dismissal true))
(assert (= behavior_self_dealing true))
(assert (= full_trust_behavior_self_dealing true))
(assert (= full_trust_behavior_relative_trading true))
(assert (= full_trust_relative_trading_not_intentional false))
(assert (= restricted_trading_occurred true))
(assert (= restricted_trading_prohibition false))
(assert (= restricted_trading_full_trust_occurred true))
(assert (= restricted_trading_prohibition_full_trust false))
(assert (= restricted_trading_reported false))
(assert (= restricted_trading_reporting false))
(assert (= fiduciary_duty_compliance false))
(assert (= duty_of_care_and_loyalty_observed false))
(assert (= no_prohibited_behaviors false))
(assert (= behavior_leak_info false))
(assert (= confidentiality_observed true))
(assert (= confidentiality_compliance true))
(assert (= no_prohibited_behavior_full_trust false))
(assert (= full_trust_behavior_use_info_for_others true))
(assert (= full_trust_behavior_harm_client false))
(assert (= full_trust_behavior_profit_loss_sharing true))
(assert (= full_trust_behavior_use_client_account false))
(assert (= full_trust_behavior_subcontract_or_transfer false))
(assert (= full_trust_behavior_subcontract_or_transfer_exempted true))
(assert (= full_trust_behavior_change_account_without_reason false))
(assert (= full_trust_behavior_no_reason_investment_decision false))
(assert (= full_trust_behavior_reasonable_explanation false))
(assert (= full_trust_behavior_other_harmful false))
(assert (= behavior_agent_for_others false))
(assert (= behavior_change_account_without_reason false))
(assert (= behavior_false_or_fraud false))
(assert (= behavior_not_return_commission false))
(assert (= behavior_offer_special_benefit false))
(assert (= behavior_transfer_proxy_vote_for_benefit false))
(assert (= behavior_manipulate_market_price false))
(assert (= behavior_public_promotion_or_forecast false))
(assert (= behavior_unreasonable_commission false))
(assert (= behavior_other_harmful false))
(assert (= violation_111_repeat_fine true))
(assert (= violation_penalty_level true))
(assert (= violation_suspend_fund_or_business false))
(assert (= violation_suspend_operation false))
(assert (= violation_revoke_license false))
(assert (= violation_other_measures false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 54
; Total facts: 53
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
