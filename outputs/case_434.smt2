; SMT2 file generated from compliance case automatic
; Case ID: case_434
; Generated at: 2025-10-21T22:43:48.157038
;
; This file can be executed with Z3:
;   z3 case_434.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const client_data_kept_confidential Bool)
(declare-const confidentiality_maintained Bool)
(declare-const duties_fulfilled_with_diligence_and_loyalty Bool)
(declare-const fraudulent_or_misleading_acts Bool)
(declare-const improper_account_transfer Bool)
(declare-const improper_fee_or_benefit_handling Bool)
(declare-const improper_promotion_or_benefit_provision Bool)
(declare-const improper_public_recommendation_or_forecast Bool)
(declare-const insider_information_leaked Bool)
(declare-const internal_control_defined_and_executed Bool)
(declare-const internal_control_defined_in_system Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_recorded_and_retained Bool)
(declare-const internal_control_records_retained Bool)
(declare-const internal_control_records_retention_period_years Int)
(declare-const investment_analysis_has_reasonable_basis Bool)
(declare-const investment_analysis_reasonable Bool)
(declare-const investment_decision_based_on_analysis Bool)
(declare-const investment_decision_recorded Bool)
(declare-const investment_execution_recorded Bool)
(declare-const investment_monthly_reviewed Bool)
(declare-const investment_review_submitted_monthly Bool)
(declare-const market_manipulation_or_investor_harm Bool)
(declare-const other_acts_harming_investors_or_business Bool)
(declare-const penalty Bool)
(declare-const personnel_qualifications_and_conduct_compliant Bool)
(declare-const personnel_qualifications_compliant Bool)
(declare-const prohibited_behaviors_absent Bool)
(declare-const responsible_persons_duties_fulfilled Bool)
(declare-const self_dealing_or_conflict_of_interest Bool)
(declare-const unauthorized_securities_investment_agent Bool)
(declare-const unreasonable_commission_or_nonprofessional_recruitment Bool)
(declare-const vote_proxy_trading_for_benefit Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:investment_decision_recorded] 證券投資信託事業投資決定依據分析作成且交付執行時有紀錄
(assert (= investment_decision_recorded
   (and investment_decision_based_on_analysis investment_execution_recorded)))

; [securities:investment_monthly_reviewed] 證券投資信託事業按月提出投資檢討
(assert (= investment_monthly_reviewed investment_review_submitted_monthly))

; [securities:investment_analysis_reasonable] 證券投資信託事業投資分析與決定有合理基礎及根據
(assert (= investment_analysis_reasonable investment_analysis_has_reasonable_basis))

; [securities:internal_control_defined_and_executed] 證券投資信託事業內部控制制度訂定且確實執行
(assert (= internal_control_defined_and_executed
   (and internal_control_defined_in_system internal_control_executed)))

; [securities:internal_control_recorded_and_retained] 證券投資信託事業內部控制作業留存紀錄並保存一定期限
(assert (= internal_control_recorded_and_retained
   (and internal_control_records_retained
        (<= 5.0 (to_real internal_control_records_retention_period_years)))))

; [securities:personnel_qualifications_compliant] 證券投資信託事業及顧問事業人員資格條件及行為規範符合主管機關規定
(assert (= personnel_qualifications_compliant
   personnel_qualifications_and_conduct_compliant))

; [securities:responsible_persons_duties_fulfilled] 證券投資信託事業負責人及業務人員以善良管理人注意義務及忠實義務執行業務
(assert (= responsible_persons_duties_fulfilled
   duties_fulfilled_with_diligence_and_loyalty))

; [securities:prohibited_behaviors_absent] 證券投資信託事業人員無法令禁止之不當行為
(assert (= prohibited_behaviors_absent
   (and (not insider_information_leaked)
        (not self_dealing_or_conflict_of_interest)
        (not fraudulent_or_misleading_acts)
        (not improper_fee_or_benefit_handling)
        (not improper_promotion_or_benefit_provision)
        (not vote_proxy_trading_for_benefit)
        (not market_manipulation_or_investor_harm)
        (not improper_account_transfer)
        (not improper_public_recommendation_or_forecast)
        (not unreasonable_commission_or_nonprofessional_recruitment)
        (not unauthorized_securities_investment_agent)
        (not other_acts_harming_investors_or_business))))

; [securities:confidentiality_maintained] 證券投資信託事業人員對客戶資料保守秘密
(assert (= confidentiality_maintained client_data_kept_confidential))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反投資決定紀錄、內部控制、資格條件、禁止行為或保密義務等規定時處罰
(assert (= penalty
   (or (not responsible_persons_duties_fulfilled)
       (not investment_monthly_reviewed)
       (not confidentiality_maintained)
       (not investment_decision_recorded)
       (not personnel_qualifications_compliant)
       (not internal_control_defined_and_executed)
       (not internal_control_recorded_and_retained)
       (not investment_analysis_reasonable)
       (not prohibited_behaviors_absent))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= investment_decision_based_on_analysis false))
(assert (= investment_execution_recorded false))
(assert (= investment_review_submitted_monthly false))
(assert (= investment_analysis_has_reasonable_basis false))
(assert (= internal_control_defined_in_system true))
(assert (= internal_control_executed false))
(assert (= internal_control_records_retained true))
(assert (= internal_control_records_retention_period_years 5))
(assert (= personnel_qualifications_and_conduct_compliant false))
(assert (= duties_fulfilled_with_diligence_and_loyalty false))
(assert (= insider_information_leaked false))
(assert (= self_dealing_or_conflict_of_interest true))
(assert (= fraudulent_or_misleading_acts true))
(assert (= improper_fee_or_benefit_handling false))
(assert (= improper_promotion_or_benefit_provision false))
(assert (= vote_proxy_trading_for_benefit false))
(assert (= market_manipulation_or_investor_harm false))
(assert (= improper_account_transfer false))
(assert (= improper_public_recommendation_or_forecast false))
(assert (= unreasonable_commission_or_nonprofessional_recruitment false))
(assert (= unauthorized_securities_investment_agent false))
(assert (= other_acts_harming_investors_or_business false))
(assert (= client_data_kept_confidential true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 33
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
