; SMT2 file generated from compliance case automatic
; Case ID: case_21
; Generated at: 2025-10-20T23:14:45.026442
;
; This file can be executed with Z3:
;   z3 case_21.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const affects_normal_business Bool)
(declare-const analyst_qualification_ok Bool)
(declare-const appropriate_authority_and_responsibility_defined Bool)
(declare-const association_recognized Bool)
(declare-const before_rule_amendment Bool)
(declare-const before_rule_enactment Bool)
(declare-const business_staff_qualification_ok Bool)
(declare-const competent_authority_rules_defined Bool)
(declare-const foreign_analyst_qualification Bool)
(declare-const foreign_experience_years Int)
(declare-const fund_manager_experience_years Int)
(declare-const has_senior_broker_certificate Bool)
(declare-const internal_control_designed Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_execution_and_review Bool)
(declare-const internal_control_requirements_met Bool)
(declare-const internal_control_reviewed Bool)
(declare-const internal_organization_structure_defined Bool)
(declare-const investment_manager_correction_completed Bool)
(declare-const investment_manager_correction_done Bool)
(declare-const investment_manager_correction_overdue Bool)
(declare-const investment_manager_correction_required Bool)
(declare-const investment_manager_qualification_ok Bool)
(declare-const manager_setup_and_policies_defined Bool)
(declare-const media_analyst_correction_completed Bool)
(declare-const media_analyst_correction_done Bool)
(declare-const media_analyst_correction_overdue Bool)
(declare-const media_analyst_correction_required Bool)
(declare-const media_analyst_qualification_ok Bool)
(declare-const passed_analyst_exam Bool)
(declare-const passed_business_staff_exam Bool)
(declare-const passed_regulation_exam Bool)
(declare-const passed_senior_broker_exam Bool)
(declare-const passed_trust_business_exam Bool)
(declare-const penalty Bool)
(declare-const penalty_authority_action_allowed Bool)
(declare-const personnel_qualification_rules_set Bool)
(declare-const qualified_before_2004_10_31 Bool)
(declare-const reporting_system_defined Bool)
(declare-const university_degree_recognized Bool)
(declare-const violation_affecting_business Bool)
(declare-const violation_behavior_rules Bool)
(declare-const violation_branch_establishment_rules Bool)
(declare-const violation_business_without_approval Bool)
(declare-const violation_business_without_license Bool)
(declare-const violation_investment_diversification_ratio Bool)
(declare-const violation_investment_scope_limit_1 Bool)
(declare-const violation_investment_scope_limit_2 Bool)
(declare-const violation_items Bool)
(declare-const violation_of_law Bool)
(declare-const violation_other_law_violations Bool)
(declare-const violation_restriction_rules Bool)
(declare-const years_business_experience Int)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:personnel_qualification_rules_set] 主管機關定證券投資信託及顧問事業應備置人員資格條件等規則
(assert (= personnel_qualification_rules_set competent_authority_rules_defined))

; [securities:violation_affecting_business] 董事、監察人、經理人或受僱人有違反法令且影響業務正常執行
(assert (= violation_affecting_business (and violation_of_law affects_normal_business)))

; [securities:penalty_authority_action_allowed] 主管機關得命令停止執行業務或解除職務，並視情節輕重處分
(assert (= penalty_authority_action_allowed violation_affecting_business))

; [securities:violation_items] 證券投資信託及顧問事業違反法條事項
(assert (= violation_items
   (or violation_investment_diversification_ratio
       violation_restriction_rules
       violation_behavior_rules
       violation_business_without_approval
       violation_investment_scope_limit_2
       violation_branch_establishment_rules
       violation_other_law_violations
       violation_investment_scope_limit_1
       violation_business_without_license)))

; [securities:personnel_qualification_analyst] 證券投資分析人員資格符合任一規定
(assert (= analyst_qualification_ok
   (or passed_analyst_exam
       qualified_before_2004_10_31
       (and foreign_analyst_qualification
            (<= 2 foreign_experience_years)
            passed_regulation_exam
            association_recognized))))

; [securities:personnel_qualification_business_staff] 證券投資顧問事業業務人員資格符合任一規定
(assert (= business_staff_qualification_ok
   (or has_senior_broker_certificate
       passed_business_staff_exam
       analyst_qualification_ok
       passed_senior_broker_exam
       (and passed_trust_business_exam passed_regulation_exam)
       (<= 1 fund_manager_experience_years)
       (and university_degree_recognized (<= 3 years_business_experience)))))

; [securities:media_analyst_qualification] 證券投資顧問事業於各種傳播媒體從事證券投資分析人員資格符合
(assert (= media_analyst_qualification_ok analyst_qualification_ok))

; [securities:media_analyst_correction_required] 本規則訂定發布前不符資格者須於三年內補正
(assert (= media_analyst_correction_required
   (and before_rule_enactment (not media_analyst_qualification_ok))))

; [securities:media_analyst_correction_completed] 已於三年內完成補正
(assert (= media_analyst_correction_completed media_analyst_correction_done))

; [securities:media_analyst_correction_overdue] 未於三年內完成補正
(assert (= media_analyst_correction_overdue
   (and media_analyst_correction_required
        (not media_analyst_correction_completed))))

; [securities:investment_manager_qualification_correction_required] 本規則修正發布前未符合資格之投資經理人須於二年內補正
(assert (= investment_manager_correction_required
   (and before_rule_amendment (not investment_manager_qualification_ok))))

; [securities:investment_manager_correction_completed] 已於二年內完成補正
(assert (= investment_manager_correction_completed investment_manager_correction_done))

; [securities:investment_manager_correction_overdue] 未於二年內完成補正
(assert (= investment_manager_correction_overdue
   (and investment_manager_correction_required
        (not investment_manager_correction_completed))))

; [securities:internal_control_requirements_met] 服務事業內部控制制度符合明確組織結構、呈報體系及權責等要求
(assert (= internal_control_requirements_met
   (and internal_organization_structure_defined
        reporting_system_defined
        appropriate_authority_and_responsibility_defined
        manager_setup_and_policies_defined)))

; [securities:internal_control_execution_and_review] 服務事業及子公司設計並確實執行內部控制制度，並隨時檢討
(assert (= internal_control_execution_and_review
   (and internal_control_designed
        internal_control_executed
        internal_control_reviewed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令事項或未完成資格補正或內部控制不符規定時處罰
(assert (= penalty
   (or media_analyst_correction_overdue
       investment_manager_correction_overdue
       (not internal_control_requirements_met)
       violation_items
       (not internal_control_execution_and_review))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= competent_authority_rules_defined true))
(assert (= violation_of_law true))
(assert (= affects_normal_business true))
(assert (= violation_items true))
(assert (= violation_behavior_rules true))
(assert (= violation_other_law_violations true))
(assert (= personnel_qualification_rules_set true))
(assert (= analyst_qualification_ok false))
(assert (= passed_analyst_exam false))
(assert (= foreign_analyst_qualification false))
(assert (= foreign_experience_years 0))
(assert (= passed_regulation_exam false))
(assert (= association_recognized false))
(assert (= qualified_before_2004_10_31 false))
(assert (= business_staff_qualification_ok false))
(assert (= passed_business_staff_exam false))
(assert (= passed_senior_broker_exam false))
(assert (= has_senior_broker_certificate false))
(assert (= fund_manager_experience_years 0))
(assert (= passed_trust_business_exam false))
(assert (= university_degree_recognized false))
(assert (= years_business_experience 0))
(assert (= media_analyst_qualification_ok false))
(assert (= before_rule_enactment false))
(assert (= media_analyst_correction_required false))
(assert (= media_analyst_correction_done false))
(assert (= media_analyst_correction_completed false))
(assert (= media_analyst_correction_overdue false))
(assert (= internal_organization_structure_defined true))
(assert (= reporting_system_defined true))
(assert (= appropriate_authority_and_responsibility_defined false))
(assert (= manager_setup_and_policies_defined true))
(assert (= internal_control_designed false))
(assert (= internal_control_executed false))
(assert (= internal_control_reviewed false))
(assert (= internal_control_requirements_met false))
(assert (= internal_control_execution_and_review false))
(assert (= violation_affecting_business true))
(assert (= penalty_authority_action_allowed true))
(assert (= penalty true))
(assert (= investment_manager_qualification_ok false))
(assert (= before_rule_amendment false))
(assert (= investment_manager_correction_required false))
(assert (= investment_manager_correction_done false))
(assert (= investment_manager_correction_completed false))
(assert (= investment_manager_correction_overdue false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 53
; Total facts: 46
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
