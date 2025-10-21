; SMT2 file generated from compliance case automatic
; Case ID: case_464
; Generated at: 2025-10-21T10:22:29.914796
;
; This file can be executed with Z3:
;   z3 case_464.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_company_dissolved Bool)
(declare-const agent_company_dissolved_flag Bool)
(declare-const agent_company_responsible_for_discipline Bool)
(declare-const agent_cumulative_suspension_over_2_years Bool)
(declare-const agent_improper_behavior Bool)
(declare-const agent_re_registration_required Bool)
(declare-const agent_registration_revoked Bool)
(declare-const agent_registration_revoked_due_to_suspension Bool)
(declare-const agent_special_exam_passed Bool)
(declare-const agent_suspension_cumulative_years Real)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_2_3_deterioration Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const company_registered_change_done Bool)
(declare-const contract_or_major_commitment_made_without_supervisor_consent Bool)
(declare-const exaggerate_or_false_comparison_with_other_products Bool)
(declare-const exaggerated_or_false_promotion Bool)
(declare-const false_or_no_explanation_to_insured Bool)
(declare-const financial_or_business_deteriorated Bool)
(declare-const financial_or_business_improvement_completed Bool)
(declare-const improper_discount_or_commission Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_failed_after_guidance Bool)
(declare-const improvement_plan_not_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const induce_insured_to_false_or_no_disclosure Bool)
(declare-const merger_completed Bool)
(declare-const misappropriate_funds_or_documents Bool)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_deterioration Bool)
(declare-const net_worth_ratio Real)
(declare-const obstruct_insured_disclosure Bool)
(declare-const other_improper_business_behavior Bool)
(declare-const other_major_financial_impact_without_supervisor_consent Bool)
(declare-const payment_limit Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const recruit_without_company_consent Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const sign_or_fill_contract_without_consent Bool)
(declare-const solicit_unapproved_insurance_business_entity_or_person Bool)
(declare-const solicit_unapproved_insurance_or_financial_products Bool)
(declare-const special_exam_passed Bool)
(declare-const special_exam_taken Bool)
(declare-const spread_false_information_disturb_financial_order Bool)
(declare-const supervisory_measures_required Bool)
(declare-const supervisory_payment_limit Real)
(declare-const supervisory_restrictions Bool)
(declare-const threat_or_deceive_to_terminate_contract Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const unauthorized_collection_or_misuse_of_premium Bool)
(declare-const use_or_loan_registration_certificate Bool)
(declare-const violate_other_relevant_articles Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未於期限內完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level)
        (not capital_increase_completed)
        (not financial_or_business_improvement_completed)
        (not merger_completed))))

; [insurance:capital_level_2_3_deterioration] 資本等級非嚴重不足但財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= capital_level_2_3_deterioration
   (and (or (= 3 capital_level)
            (= 1 capital_level)
            (= 2 capital_level)
            (= 0 capital_level))
        financial_or_business_deteriorated
        (or risk_to_insured_rights
            unable_to_fulfill_contract
            unable_to_pay_debt))))

; [insurance:improvement_plan_submitted_and_approved] 保險業已提出並經主管機關核定財務或業務改善計畫
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_not_effective] 損益、淨值加速惡化或經輔導仍未改善
(assert (= improvement_plan_not_effective
   (or improvement_plan_failed_after_guidance
       profit_loss_accelerated_deterioration
       net_worth_accelerated_deterioration)))

; [insurance:supervisory_measures_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_required
   (or capital_level_4_noncompliance
       (and capital_level_2_3_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_not_effective))))

; [insurance:supervisory_restrictions] 監管處分限制保險業行為
(assert (= supervisory_restrictions
   (and (<= payment_limit supervisory_payment_limit)
        (not contract_or_major_commitment_made_without_supervisor_consent)
        (not other_major_financial_impact_without_supervisor_consent))))

; [insurance:agent_special_exam_passed] 業務員通過特別測驗
(assert (= agent_special_exam_passed
   (and special_exam_taken special_exam_passed company_registered_change_done)))

; [insurance:agent_re_registration_required] 業務員被撤銷登錄後需重新參加測驗並辦理變更登錄
(assert (= agent_re_registration_required
   (and agent_registration_revoked agent_special_exam_passed)))

; [insurance:agent_improper_behavior] 業務員有不當行為
(assert (= agent_improper_behavior
   (or exaggerate_or_false_comparison_with_other_products
       misappropriate_funds_or_documents
       false_or_no_explanation_to_insured
       other_improper_business_behavior
       induce_insured_to_false_or_no_disclosure
       unauthorized_collection_or_misuse_of_premium
       solicit_unapproved_insurance_or_financial_products
       recruit_without_company_consent
       exaggerated_or_false_promotion
       improper_discount_or_commission
       obstruct_insured_disclosure
       use_or_loan_registration_certificate
       spread_false_information_disturb_financial_order
       solicit_unapproved_insurance_business_entity_or_person
       violate_other_relevant_articles
       threat_or_deceive_to_terminate_contract
       sign_or_fill_contract_without_consent)))

; [insurance:agent_company_dissolved] 業務員所屬公司已解散或註銷執業證照
(assert (= agent_company_dissolved agent_company_dissolved_flag))

; [insurance:agent_company_responsible_for_discipline] 業務員所屬公司負責處分
(assert (= agent_company_responsible_for_discipline
   (or (and agent_improper_behavior (not agent_company_dissolved))
       (and agent_improper_behavior agent_company_dissolved))))

; [insurance:agent_cumulative_suspension_over_2_years] 最近五年內停止招攬行為處分期間累計達二年
(assert (= agent_cumulative_suspension_over_2_years
   (<= 2.0 agent_suspension_cumulative_years)))

; [insurance:agent_registration_revoked_due_to_suspension] 因停止招攬行為處分期間累計達二年，所屬公司應撤銷業務員登錄
(assert (= agent_registration_revoked_due_to_suspension
   (and agent_cumulative_suspension_over_2_years
        agent_company_responsible_for_discipline)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或財務業務顯著惡化且未改善，或業務員違規行為等情形
(assert (= penalty
   (or agent_registration_revoked_due_to_suspension
       agent_improper_behavior
       capital_level_4_noncompliance
       (and capital_level_2_3_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_not_effective))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_improper_behavior true))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_improvement_completed false))
(assert (= merger_completed false))
(assert (= capital_level 1))
(assert (= financial_or_business_deteriorated false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= improvement_plan_not_effective false))
(assert (= agent_company_dissolved_flag false))
(assert (= agent_company_dissolved false))
(assert (= agent_company_responsible_for_discipline true))
(assert (= agent_cumulative_suspension_over_2_years false))
(assert (= agent_registration_revoked false))
(assert (= agent_registration_revoked_due_to_suspension false))
(assert (= special_exam_taken false))
(assert (= special_exam_passed false))
(assert (= company_registered_change_done false))
(assert (= agent_re_registration_required false))
(assert (= contract_or_major_commitment_made_without_supervisor_consent false))
(assert (= other_major_financial_impact_without_supervisor_consent false))
(assert (= payment_limit 168.0))
(assert (= supervisory_payment_limit 168.0))
(assert (= supervisory_restrictions true))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= net_worth_accelerated_deterioration false))
(assert (= improvement_plan_failed_after_guidance false))
(assert (= false_or_no_explanation_to_insured false))
(assert (= induce_insured_to_false_or_no_disclosure false))
(assert (= obstruct_insured_disclosure false))
(assert (= improper_discount_or_commission false))
(assert (= exaggerated_or_false_promotion false))
(assert (= recruit_without_company_consent false))
(assert (= sign_or_fill_contract_without_consent false))
(assert (= threat_or_deceive_to_terminate_contract false))
(assert (= unauthorized_collection_or_misuse_of_premium false))
(assert (= use_or_loan_registration_certificate false))
(assert (= solicit_unapproved_insurance_or_financial_products true))
(assert (= solicit_unapproved_insurance_business_entity_or_person false))
(assert (= exaggerate_or_false_comparison_with_other_products false))
(assert (= spread_false_information_disturb_financial_order false))
(assert (= misappropriate_funds_or_documents false))
(assert (= violate_other_relevant_articles true))
(assert (= other_improper_business_behavior false))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= risk_to_insured_rights false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 57
; Total facts: 51
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
