; SMT2 file generated from compliance case automatic
; Case ID: case_161
; Generated at: 2025-10-19T09:38:33.547398
;
; This file can be executed with Z3:
;   z3 case_161.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const confidentiality_maintained Bool)
(declare-const confidentiality_obligation_met Bool)
(declare-const duty_of_care_and_loyalty Bool)
(declare-const duty_of_care_and_loyalty_performed Bool)
(declare-const failure_to_return_commission_or_benefits_to_fund Bool)
(declare-const fraud_or_misrepresentation Bool)
(declare-const fund_holding_stock_or_equity_derivative Bool)
(declare-const improper_account_transfer Bool)
(declare-const improper_commission_or_client_recruitment Bool)
(declare-const improper_public_recommendation_or_forecast Bool)
(declare-const insider_trading_or_leakage Bool)
(declare-const market_manipulation_or_harm_to_investors Bool)
(declare-const other_acts_harming_investors_or_company Bool)
(declare-const penalty Bool)
(declare-const person_or_related_party_trading_stock_or_equity_derivative Bool)
(declare-const prohibited_behaviors_absent Bool)
(declare-const prohibited_trading_during_fund_holding Bool)
(declare-const providing_or_receiving_undue_benefits Bool)
(declare-const related_person_defined_by_authority Bool)
(declare-const related_person_definition_compliant Bool)
(declare-const self_dealing_or_conflict_of_interest Bool)
(declare-const selling_voting_rights_for_benefits Bool)
(declare-const trading_declaration_required Bool)
(declare-const trading_reported_to_fund_company Bool)
(declare-const unauthorized_agent_trading Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:prohibited_trading_during_fund_holding] 負責人及關係人於基金持有期間不得從事該公司股票及具股權性質衍生商品交易
(assert (= prohibited_trading_during_fund_holding
   (or (not fund_holding_stock_or_equity_derivative)
       (not person_or_related_party_trading_stock_or_equity_derivative))))

; [securities:trading_declaration_required] 負責人及關係人從事公司股票及具股權性質衍生商品交易應申報
(assert (= trading_declaration_required
   (or (not person_or_related_party_trading_stock_or_equity_derivative)
       trading_reported_to_fund_company)))

; [securities:related_person_definition] 關係人定義符合主管機關規定
(assert (= related_person_definition_compliant related_person_defined_by_authority))

; [securities:duty_of_care_and_loyalty] 負責人及業務人員應以善良管理人注意義務及忠實義務執行業務
(assert (= duty_of_care_and_loyalty duty_of_care_and_loyalty_performed))

; [securities:prohibited_behaviors] 負責人及業務人員不得有法令禁止之不當行為
(assert (= prohibited_behaviors_absent
   (and (not insider_trading_or_leakage)
        (not self_dealing_or_conflict_of_interest)
        (not fraud_or_misrepresentation)
        (not failure_to_return_commission_or_benefits_to_fund)
        (not providing_or_receiving_undue_benefits)
        (not selling_voting_rights_for_benefits)
        (not market_manipulation_or_harm_to_investors)
        (not improper_account_transfer)
        (not improper_public_recommendation_or_forecast)
        (not improper_commission_or_client_recruitment)
        (not unauthorized_agent_trading)
        (not other_acts_harming_investors_or_company))))

; [securities:confidentiality_obligation] 負責人及業務人員應保守受益人及客戶資料秘密
(assert (= confidentiality_obligation_met confidentiality_maintained))

; [securities:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities:penalty_conditions] 處罰條件：違反禁止交易、申報義務、善良管理義務或保密義務時處罰
(assert (= penalty
   (or (not prohibited_trading_during_fund_holding)
       (not confidentiality_obligation_met)
       (not duty_of_care_and_loyalty)
       (not prohibited_behaviors_absent)
       (not trading_declaration_required))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fund_holding_stock_or_equity_derivative true))
(assert (= person_or_related_party_trading_stock_or_equity_derivative true))
(assert (= trading_reported_to_fund_company false))
(assert (= related_person_defined_by_authority true))
(assert (= related_person_definition_compliant true))
(assert (= duty_of_care_and_loyalty_performed false))
(assert (= duty_of_care_and_loyalty false))
(assert (= insider_trading_or_leakage true))
(assert (= self_dealing_or_conflict_of_interest true))
(assert (= fraud_or_misrepresentation false))
(assert (= failure_to_return_commission_or_benefits_to_fund false))
(assert (= providing_or_receiving_undue_benefits false))
(assert (= selling_voting_rights_for_benefits false))
(assert (= market_manipulation_or_harm_to_investors false))
(assert (= improper_account_transfer false))
(assert (= improper_public_recommendation_or_forecast false))
(assert (= improper_commission_or_client_recruitment false))
(assert (= unauthorized_agent_trading false))
(assert (= other_acts_harming_investors_or_company false))
(assert (= prohibited_behaviors_absent false))
(assert (= confidentiality_maintained false))
(assert (= confidentiality_obligation_met false))
(assert (= prohibited_trading_during_fund_holding false))
(assert (= trading_declaration_required false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 25
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
