; SMT2 file generated from compliance case automatic
; Case ID: case_20
; Generated at: 2025-10-19T05:34:03.158424
;
; This file can be executed with Z3:
;   z3 case_20.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const board_approval_obtained Bool)
(declare-const business_operated_according_to_internal_control Bool)
(declare-const confidentiality_compliance Bool)
(declare-const confidentiality_maintained Bool)
(declare-const confidentiality_personnel_compliance Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_loyalty Bool)
(declare-const fiduciary_duty_compliance Bool)
(declare-const fraudulent_behavior Bool)
(declare-const good_faith_principle Bool)
(declare-const improper_fee_handling Bool)
(declare-const improper_public_recommendation Bool)
(declare-const insider_trading_or_leakage Bool)
(declare-const internal_control_change_approved Bool)
(declare-const internal_control_change_complied Bool)
(declare-const internal_control_change_reported Bool)
(declare-const internal_control_changed_within_deadline Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const law_or_order_violated Bool)
(declare-const market_manipulation Bool)
(declare-const other_harmful_behaviors Bool)
(declare-const other_law_or_authority_exemption Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_violation Bool)
(declare-const personal_trading_declaration_compliance Bool)
(declare-const personal_trading_declared Bool)
(declare-const personal_trading_restriction_compliance Bool)
(declare-const personal_trading_restrictions_followed Bool)
(declare-const personnel_confidentiality_maintained Bool)
(declare-const personnel_qualification_compliance Bool)
(declare-const personnel_qualification_meets_requirements Bool)
(declare-const prohibited_behaviors_compliance Bool)
(declare-const prohibited_trading_compliance Bool)
(declare-const prohibited_trading_occurred Bool)
(declare-const providing_undue_benefits Bool)
(declare-const proxy_vote_for_benefit Bool)
(declare-const record_kept Bool)
(declare-const regulator_change_notification Bool)
(declare-const regulatory_exemption Bool)
(declare-const required_trading_declared Bool)
(declare-const self_dealing_or_conflict_of_interest Bool)
(declare-const serious_violation_occurred Bool)
(declare-const serious_violation_penalty_applicable Bool)
(declare-const trading_declaration_compliance Bool)
(declare-const unauthorized_account_transfer Bool)
(declare-const unauthorized_agent_trading Bool)
(declare-const unreasonable_commission_payment Bool)
(declare-const violate_article_14_1 Bool)
(declare-const violate_article_16_1 Bool)
(declare-const violate_article_16_4 Bool)
(declare-const violate_article_18_1 Bool)
(declare-const violate_article_19_1 Bool)
(declare-const violate_article_3_4 Bool)
(declare-const violate_article_4_4 Bool)
(declare-const violate_article_51_1 Bool)
(declare-const violate_article_56_1 Bool)
(declare-const violate_article_58_2 Bool)
(declare-const violate_article_59 Bool)
(declare-const violate_article_63_1 Bool)
(declare-const violate_article_69 Bool)
(declare-const violate_article_70 Bool)
(declare-const violate_article_72_1 Bool)
(declare-const violation_penalty_applicable Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:fiduciary_duty_compliance] 證券投資信託事業等應以善良管理人注意義務及忠實義務執行業務
(assert (= fiduciary_duty_compliance
   (and duty_of_care duty_of_loyalty good_faith_principle)))

; [securities:confidentiality_compliance] 應保守受益人或客戶個人資料及交易資料秘密
(assert (= confidentiality_compliance
   (or confidentiality_maintained other_law_or_authority_exemption)))

; [securities:personnel_qualification_compliance] 人員資格條件及行為規範符合主管機關規定
(assert (= personnel_qualification_compliance
   personnel_qualification_meets_requirements))

; [securities:prohibited_trading_compliance] 負責人及關係人不得從事禁止之公司股票及股權性質衍生商品交易
(assert (= prohibited_trading_compliance
   (or regulatory_exemption (not prohibited_trading_occurred))))

; [securities:trading_declaration_compliance] 負責人及關係人應依規定申報公司股票及股權性質衍生商品交易
(assert (= trading_declaration_compliance required_trading_declared))

; [securities:internal_control_established] 證券投資信託事業已建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_executed] 證券投資信託事業依法令及內部控制制度經營業務
(assert (= internal_control_executed business_operated_according_to_internal_control))

; [securities:internal_control_change_approved] 內部控制制度訂定或變更經董事會同意並留存備查
(assert (= internal_control_change_approved
   (and internal_control_change_reported board_approval_obtained record_kept)))

; [securities:internal_control_change_complied] 依本會通知限期內變更內部控制制度
(assert (= internal_control_change_complied
   (or internal_control_changed_within_deadline
       (not regulator_change_notification))))

; [securities:personal_trading_restriction_compliance] 負責人及關係人遵守個人交易限制規定
(assert (= personal_trading_restriction_compliance
   personal_trading_restrictions_followed))

; [securities:personal_trading_declaration_compliance] 負責人及關係人依規定申報個人交易
(assert (= personal_trading_declaration_compliance personal_trading_declared))

; [securities:prohibited_behaviors_compliance] 負責人及業務人員未有違反善良管理人注意義務及忠實義務之禁止行為
(assert (= prohibited_behaviors_compliance
   (and (not insider_trading_or_leakage)
        (not self_dealing_or_conflict_of_interest)
        (not fraudulent_behavior)
        (not improper_fee_handling)
        (not providing_undue_benefits)
        (not proxy_vote_for_benefit)
        (not market_manipulation)
        (not unauthorized_account_transfer)
        (not improper_public_recommendation)
        (not unreasonable_commission_payment)
        (not unauthorized_agent_trading)
        (not other_harmful_behaviors))))

; [securities:confidentiality_personnel_compliance] 負責人及業務人員對受益人或客戶資料保守秘密
(assert (= confidentiality_personnel_compliance
   (or other_law_or_authority_exemption personnel_confidentiality_maintained)))

; [securities:violation_penalty_applicable] 違反本法或主管機關命令規定者，主管機關得依情節輕重處分
(assert (= violation_penalty_applicable law_or_order_violated))

; [securities:serious_violation_penalty_applicable] 董事、監察人、經理人或受僱人違反法令足以影響業務正常執行者，得命令停止業務或解除職務
(assert (= serious_violation_penalty_applicable serious_violation_occurred))

; [securities:penalty_fine_violation] 違反特定條文規定者處罰鍰並限期改善
(assert (= penalty_fine_violation
   (or violate_article_63_1
       violate_article_56_1
       violate_article_14_1
       violate_article_72_1
       violate_article_16_1
       violate_article_19_1
       violate_article_58_2
       violate_article_16_4
       violate_article_4_4
       violate_article_18_1
       violate_article_69
       violate_article_70
       violate_article_59
       violate_article_51_1
       violate_article_3_4)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反善良管理人義務、保密義務、內部控制、交易申報、禁止交易或主管機關規定者處罰
(assert (= penalty
   (or (not internal_control_established)
       (not personnel_qualification_compliance)
       (not prohibited_trading_compliance)
       violation_penalty_applicable
       serious_violation_penalty_applicable
       (not personal_trading_restriction_compliance)
       (not fiduciary_duty_compliance)
       penalty_fine_violation
       (not internal_control_change_complied)
       (not internal_control_executed)
       (not prohibited_behaviors_compliance)
       (not trading_declaration_compliance)
       (not confidentiality_personnel_compliance)
       (not personal_trading_declaration_compliance)
       (not confidentiality_compliance)
       (not internal_control_change_approved))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= duty_of_care false))
(assert (= duty_of_loyalty false))
(assert (= good_faith_principle false))
(assert (= fiduciary_duty_compliance false))
(assert (= confidentiality_maintained false))
(assert (= confidentiality_compliance false))
(assert (= confidentiality_personnel_compliance false))
(assert (= personnel_qualification_meets_requirements true))
(assert (= personnel_qualification_compliance true))
(assert (= prohibited_trading_occurred true))
(assert (= prohibited_trading_compliance false))
(assert (= required_trading_declared false))
(assert (= trading_declaration_compliance false))
(assert (= internal_control_system_established true))
(assert (= internal_control_established true))
(assert (= business_operated_according_to_internal_control false))
(assert (= internal_control_executed false))
(assert (= internal_control_change_reported false))
(assert (= board_approval_obtained false))
(assert (= record_kept false))
(assert (= internal_control_change_approved false))
(assert (= regulator_change_notification false))
(assert (= internal_control_changed_within_deadline false))
(assert (= internal_control_change_complied true))
(assert (= personal_trading_restrictions_followed false))
(assert (= personal_trading_restriction_compliance false))
(assert (= personal_trading_declared false))
(assert (= personal_trading_declaration_compliance false))
(assert (= insider_trading_or_leakage true))
(assert (= self_dealing_or_conflict_of_interest true))
(assert (= fraudulent_behavior false))
(assert (= improper_fee_handling false))
(assert (= improper_public_recommendation false))
(assert (= providing_undue_benefits false))
(assert (= proxy_vote_for_benefit false))
(assert (= market_manipulation false))
(assert (= unauthorized_account_transfer false))
(assert (= unreasonable_commission_payment false))
(assert (= unauthorized_agent_trading false))
(assert (= other_harmful_behaviors false))
(assert (= prohibited_behaviors_compliance false))
(assert (= other_law_or_authority_exemption false))
(assert (= regulatory_exemption false))
(assert (= law_or_order_violated true))
(assert (= violation_penalty_applicable true))
(assert (= serious_violation_occurred true))
(assert (= serious_violation_penalty_applicable true))
(assert (= violate_article_69 true))
(assert (= violate_article_14_1 true))
(assert (= penalty_fine_violation true))
(assert (= penalty true))
(assert (= personnel_confidentiality_maintained false))
(assert (= violate_article_16_1 false))
(assert (= violate_article_16_4 false))
(assert (= violate_article_18_1 false))
(assert (= violate_article_19_1 false))
(assert (= violate_article_3_4 false))
(assert (= violate_article_4_4 false))
(assert (= violate_article_51_1 false))
(assert (= violate_article_56_1 false))
(assert (= violate_article_58_2 false))
(assert (= violate_article_59 false))
(assert (= violate_article_63_1 false))
(assert (= violate_article_70 false))
(assert (= violate_article_72_1 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 65
; Total facts: 65
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
