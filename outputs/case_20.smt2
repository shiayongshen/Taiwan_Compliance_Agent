; SMT2 file generated from compliance case automatic
; Case ID: case_20
; Generated at: 2025-10-20T23:12:57.829905
;
; This file can be executed with Z3:
;   z3 case_20.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bribery_for_voting_rights Bool)
(declare-const business_operated_according_to_law_and_articles Bool)
(declare-const confidentiality_compliance Bool)
(declare-const confidentiality_maintained Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_loyalty Bool)
(declare-const exemption_by_authority Bool)
(declare-const fiduciary_duty_compliance Bool)
(declare-const fraudulent_or_misleading_acts Bool)
(declare-const fund_invests_in_company_stock_or_equity_derivatives Bool)
(declare-const good_faith_principle Bool)
(declare-const improper_promotion_or_benefit Bool)
(declare-const improper_public_recommendation Bool)
(declare-const insider_information_leaked Bool)
(declare-const insider_trading_prohibition Bool)
(declare-const internal_control_change_approved Bool)
(declare-const internal_control_change_approved_by_board Bool)
(declare-const internal_control_change_filed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_changed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const market_price_manipulation Bool)
(declare-const other_law_or_authority_exemption Bool)
(declare-const penalty Bool)
(declare-const person_is_natural_person Bool)
(declare-const person_or_related_trades_company_stock_or_equity_derivatives Bool)
(declare-const personal_trade_confidentiality Bool)
(declare-const personal_trade_declaration_compliance Bool)
(declare-const personal_trade_declaration_required Bool)
(declare-const personal_trade_prohibition Bool)
(declare-const related_person_definition_compliant Bool)
(declare-const related_person_is_controlled_corporation Bool)
(declare-const related_person_is_spouse_or_second_degree_relative_or_enterprise_controlled_by_person_or_spouse Bool)
(declare-const self_or_others_benefit_trades Bool)
(declare-const trade_declaration_submitted Bool)
(declare-const unauthorized_account_transfer Bool)
(declare-const unauthorized_agent_trades Bool)
(declare-const undisclosed_rebate_or_benefit Bool)
(declare-const unreasonable_commission_payment Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:fiduciary_duty_compliance] 證券投資信託事業等依善良管理人注意義務及忠實義務執行業務
(assert (= fiduciary_duty_compliance
   (and duty_of_care duty_of_loyalty good_faith_principle)))

; [securities:confidentiality_compliance] 保守受益人或客戶個人資料及交易資料秘密
(assert (= confidentiality_compliance
   (or confidentiality_maintained other_law_or_authority_exemption)))

; [securities:insider_trading_prohibition] 負責人及相關人員不得從事特定公司股票及股權性質衍生商品交易期間交易
(assert (= insider_trading_prohibition
   (or (not fund_invests_in_company_stock_or_equity_derivatives)
       (not (or exemption_by_authority
                person_or_related_trades_company_stock_or_equity_derivatives)))))

; [securities:personal_trade_declaration_compliance] 負責人及相關人員應依主管機關規定申報公司股票及股權性質衍生商品交易
(assert (= personal_trade_declaration_compliance
   (or trade_declaration_submitted
       (not person_or_related_trades_company_stock_or_equity_derivatives))))

; [securities:internal_control_established] 證券投資信託事業建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_executed] 證券投資信託事業依法令、章程及內部控制制度經營業務
(assert (= internal_control_executed
   (and business_operated_according_to_law_and_articles
        internal_control_system_executed)))

; [securities:internal_control_change_approved] 內部控制制度訂定或變更經董事會同意並留存備查
(assert (= internal_control_change_approved
   (or (not internal_control_system_changed)
       (and internal_control_change_approved_by_board
            internal_control_change_filed))))

; [securities:personal_trade_prohibition] 負責人及業務人員不得洩漏消息或從事不當交易行為
(assert (= personal_trade_prohibition
   (and (not insider_information_leaked)
        (not self_or_others_benefit_trades)
        (not fraudulent_or_misleading_acts)
        (not undisclosed_rebate_or_benefit)
        (not improper_promotion_or_benefit)
        (not bribery_for_voting_rights)
        (not market_price_manipulation)
        (not unauthorized_account_transfer)
        (not improper_public_recommendation)
        (not unreasonable_commission_payment)
        (not unauthorized_agent_trades))))

; [securities:personal_trade_confidentiality] 負責人及業務人員保守受益人或客戶個人資料及交易資料秘密
(assert (= personal_trade_confidentiality
   (or confidentiality_maintained other_law_or_authority_exemption)))

; [securities:personal_trade_declaration_required] 負責人及相關人員本人及關係人應申報公司股票及股權性質衍生商品交易
(assert (= personal_trade_declaration_required
   (or trade_declaration_submitted
       (not person_or_related_trades_company_stock_or_equity_derivatives))))

; [securities:personal_trade_related_person_definition] 關係人定義符合規定
(assert (= related_person_definition_compliant
   (or (and person_is_natural_person
            related_person_is_spouse_or_second_degree_relative_or_enterprise_controlled_by_person_or_spouse)
       (and (not person_is_natural_person)
            related_person_is_controlled_corporation))))

; [securities:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities:penalty_conditions] 處罰條件：違反善良管理人義務、保密義務、內部控制制度、個人交易申報及禁止交易等規定時處罰
(assert (= penalty
   (or (not personal_trade_prohibition)
       (not personal_trade_confidentiality)
       (not internal_control_executed)
       (not personal_trade_declaration_required)
       (not internal_control_change_approved)
       (not confidentiality_compliance)
       (not related_person_definition_compliant)
       (not fiduciary_duty_compliance)
       (not internal_control_established))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= duty_of_care false))
(assert (= duty_of_loyalty false))
(assert (= good_faith_principle false))
(assert (= confidentiality_maintained false))
(assert (= other_law_or_authority_exemption false))
(assert (= person_or_related_trades_company_stock_or_equity_derivatives true))
(assert (= trade_declaration_submitted false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_system_changed false))
(assert (= internal_control_change_approved_by_board false))
(assert (= internal_control_change_filed false))
(assert (= person_is_natural_person true))
(assert (= related_person_is_spouse_or_second_degree_relative_or_enterprise_controlled_by_person_or_spouse false))
(assert (= related_person_is_controlled_corporation false))
(assert (= insider_information_leaked true))
(assert (= self_or_others_benefit_trades true))
(assert (= fraudulent_or_misleading_acts false))
(assert (= undisclosed_rebate_or_benefit false))
(assert (= improper_promotion_or_benefit false))
(assert (= bribery_for_voting_rights false))
(assert (= market_price_manipulation false))
(assert (= unauthorized_account_transfer false))
(assert (= improper_public_recommendation false))
(assert (= unreasonable_commission_payment false))
(assert (= unauthorized_agent_trades false))
(assert (= business_operated_according_to_law_and_articles false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 41
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
