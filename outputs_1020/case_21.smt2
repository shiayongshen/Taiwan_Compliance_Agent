; SMT2 file generated from compliance case automatic
; Case ID: case_21
; Generated at: 2025-10-19T05:37:19.549299
;
; This file can be executed with Z3:
;   z3 case_21.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const analyst_qualification_before_2004_10_31 Bool)
(declare-const authority_order_stop_or_remove Bool)
(declare-const business_staff_test_passed Bool)
(declare-const foreign_analyst_qualification_and_experience Bool)
(declare-const full_discretionary_investment_manager_correction_completed Bool)
(declare-const full_discretionary_investment_manager_correction_deadline_passed Bool)
(declare-const full_discretionary_investment_manager_prohibited Bool)
(declare-const full_discretionary_investment_manager_qualification Bool)
(declare-const fund_manager_experience_over_1_year Bool)
(declare-const illegal_business_operation Bool)
(declare-const internal_control_system_defined Bool)
(declare-const internal_control_system_executed_and_reviewed Bool)
(declare-const investment_advisor_qualification Bool)
(declare-const investment_advisor_qualification_conditions Bool)
(declare-const media_analyst_correction_completed Bool)
(declare-const media_analyst_correction_deadline_passed Bool)
(declare-const media_analyst_prohibited Bool)
(declare-const media_analyst_qualification Bool)
(declare-const operate_without_business_license_63_1 Bool)
(declare-const penalty Bool)
(declare-const penalty_imposed_by_authority Bool)
(declare-const personnel_qualification_rule_set Bool)
(declare-const qualification_analyst_test_passed Bool)
(declare-const senior_broker_test_passed Bool)
(declare-const trust_business_test_passed Bool)
(declare-const university_degree_and_3_years_experience Bool)
(declare-const violate_behavior_rules_69 Bool)
(declare-const violate_branch_establishment_rules_72_1 Bool)
(declare-const violate_diversification_ratio_rule_58_2 Bool)
(declare-const violate_investment_transaction_rules_14_18_56 Bool)
(declare-const violate_investment_transaction_rules_16_4 Bool)
(declare-const violate_restriction_rules_70 Bool)
(declare-const violate_rules_16_1_19_1_51_1_59 Bool)
(declare-const violation_affecting_business_execution Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:personnel_qualification_rule_set] 主管機關定之應備置人員資格條件、行為規範、訓練、登記期限、程序及其他應遵行事項之規則
(assert personnel_qualification_rule_set)

; [securities:violation_affecting_business_execution] 董事、監察人、經理人或受僱人有違反法令行為足以影響業務正常執行
(assert violation_affecting_business_execution)

; [securities:authority_order_stop_or_remove] 主管機關命令停止一年以下執行業務或解除職務
(assert authority_order_stop_or_remove)

; [securities:penalty_imposed_by_authority] 主管機關視情節輕重對事業為處分
(assert penalty_imposed_by_authority)

; [securities:illegal_business_operation] 經營未經主管機關核准之業務
(assert illegal_business_operation)

; [securities:violate_investment_transaction_rules_14_18_56] 違反主管機關依第14條第1項、第18條第1項或第56條第1項所定投資、交易範圍、方式或限制規定
(assert violate_investment_transaction_rules_14_18_56)

; [securities:violate_investment_transaction_rules_16_4] 違反主管機關依第16條第4項所定投資、交易範圍或限制規定
(assert violate_investment_transaction_rules_16_4)

; [securities:violate_rules_16_1_19_1_51_1_59] 違反第16條之一第1項、第19條第1項、第51條第1項或第59條規定
(assert violate_rules_16_1_19_1_51_1_59)

; [securities:violate_diversification_ratio_rule_58_2] 違反主管機關依第58條第2項所定有關投資標的分散比率規定
(assert violate_diversification_ratio_rule_58_2)

; [securities:operate_without_business_license_63_1] 未經主管機關核發營業執照而營業
(assert operate_without_business_license_63_1)

; [securities:violate_behavior_rules_69] 違反主管機關依第69條所定行為規範或限制、禁止規定
(assert violate_behavior_rules_69)

; [securities:violate_restriction_rules_70] 違反主管機關依第70條所定限制、禁止規定
(assert violate_restriction_rules_70)

; [securities:violate_branch_establishment_rules_72_1] 違反主管機關依第72條第1項所定標準或規則，未經核准設立分支機構、遷移或裁撤
(assert violate_branch_establishment_rules_72_1)

; [securities:qualification_analyst_test_passed] 證券投資分析人員測驗合格
(assert qualification_analyst_test_passed)

; [securities:foreign_analyst_qualification_and_experience] 外國證券分析師資格且二年以上經驗，並通過法規測驗及同業公會認可
(assert foreign_analyst_qualification_and_experience)

; [securities:analyst_qualification_before_2004_10_31] 於2004年10月31日前取得證券投資分析人員資格
(assert analyst_qualification_before_2004_10_31)

; [securities:investment_advisor_qualification] 證券投資顧問事業業務人員資格符合第5條規定之一
(assert investment_advisor_qualification)

; [securities:investment_advisor_qualification_conditions] 證券投資顧問事業業務人員具備以下任一資格
(assert (= investment_advisor_qualification_conditions
   (or university_degree_and_3_years_experience
       senior_broker_test_passed
       business_staff_test_passed
       fund_manager_experience_over_1_year
       qualification_analyst_test_passed
       trust_business_test_passed)))

; [securities:media_analyst_qualification] 證券投資顧問事業於各種傳播媒體從事證券投資分析人員具備資格
(assert media_analyst_qualification)

; [securities:media_analyst_correction_completed] 本規則訂定發布前於傳播媒體從事證券投資分析人員已完成補正
(assert media_analyst_correction_completed)

; [securities:media_analyst_correction_deadline_passed] 本規則訂定發布前於傳播媒體從事證券投資分析人員未完成補正且期限已過
(assert (or media_analyst_correction_completed media_analyst_correction_deadline_passed))

; [securities:media_analyst_prohibited] 未完成補正者不得於各種傳播媒體從事證券投資分析
(assert (or media_analyst_correction_completed media_analyst_prohibited))

; [securities:full_discretionary_investment_manager_qualification] 全權委託投資業務投資經理人符合第五條之三資格
(assert full_discretionary_investment_manager_qualification)

; [securities:full_discretionary_investment_manager_correction_completed] 修正發布日起二年內取得資格完成補正
(assert full_discretionary_investment_manager_correction_completed)

; [securities:full_discretionary_investment_manager_correction_deadline_passed] 修正發布日起二年內未取得資格且期限已過
(assert (or full_discretionary_investment_manager_correction_completed
    full_discretionary_investment_manager_correction_deadline_passed))

; [securities:full_discretionary_investment_manager_prohibited] 未完成補正者不得充任全權委託投資業務或證券投資顧問業務人員
(assert (or full_discretionary_investment_manager_correction_completed
    full_discretionary_investment_manager_prohibited))

; [securities:internal_control_system_defined] 各服務事業訂定明確內部組織結構、呈報體系及權限責任等內部控制制度
(assert internal_control_system_defined)

; [securities:internal_control_system_executed_and_reviewed] 各服務事業設計並確實執行內部控制制度，並隨時檢討以確保持續有效
(assert internal_control_system_executed_and_reviewed)

; [meta:penalty_default_false] 預設不處罰
(assert (or violate_branch_establishment_rules_72_1
    violate_rules_16_1_19_1_51_1_59
    (and media_analyst_correction_deadline_passed media_analyst_prohibited)
    violate_investment_transaction_rules_14_18_56
    violate_restriction_rules_70
    (not penalty)
    illegal_business_operation
    operate_without_business_license_63_1
    (and full_discretionary_investment_manager_correction_deadline_passed
         full_discretionary_investment_manager_prohibited)
    violate_behavior_rules_69
    violate_diversification_ratio_rule_58_2
    violate_investment_transaction_rules_16_4))

; [meta:penalty_conditions] 處罰條件：違反任一法定規定時處罰
(assert (= penalty
   (or violate_branch_establishment_rules_72_1
       violate_rules_16_1_19_1_51_1_59
       (and full_discretionary_investment_manager_correction_deadline_passed
            full_discretionary_investment_manager_prohibited)
       violate_investment_transaction_rules_14_18_56
       (and media_analyst_correction_deadline_passed media_analyst_prohibited)
       violate_restriction_rules_70
       illegal_business_operation
       operate_without_business_license_63_1
       violate_behavior_rules_69
       violate_diversification_ratio_rule_58_2
       violate_investment_transaction_rules_16_4)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= analyst_qualification_before_2004_10_31 false))
(assert (= authority_order_stop_or_remove true))
(assert (= business_staff_test_passed false))
(assert (= foreign_analyst_qualification_and_experience false))
(assert (= full_discretionary_investment_manager_correction_completed false))
(assert (= full_discretionary_investment_manager_correction_deadline_passed false))
(assert (= full_discretionary_investment_manager_prohibited false))
(assert (= full_discretionary_investment_manager_qualification false))
(assert (= fund_manager_experience_over_1_year false))
(assert (= illegal_business_operation false))
(assert (= internal_control_system_defined false))
(assert (= internal_control_system_executed_and_reviewed false))
(assert (= investment_advisor_qualification false))
(assert (= investment_advisor_qualification_conditions false))
(assert (= media_analyst_correction_completed false))
(assert (= media_analyst_correction_deadline_passed false))
(assert (= media_analyst_prohibited false))
(assert (= media_analyst_qualification false))
(assert (= operate_without_business_license_63_1 false))
(assert (= penalty true))
(assert (= penalty_imposed_by_authority true))
(assert (= personnel_qualification_rule_set true))
(assert (= qualification_analyst_test_passed false))
(assert (= senior_broker_test_passed false))
(assert (= trust_business_test_passed false))
(assert (= university_degree_and_3_years_experience false))
(assert (= violate_behavior_rules_69 true))
(assert (= violate_branch_establishment_rules_72_1 false))
(assert (= violate_diversification_ratio_rule_58_2 false))
(assert (= violate_investment_transaction_rules_14_18_56 false))
(assert (= violate_investment_transaction_rules_16_4 false))
(assert (= violate_restriction_rules_70 false))
(assert (= violate_rules_16_1_19_1_51_1_59 false))
(assert (= violation_affecting_business_execution true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 30
; Total variables: 34
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
