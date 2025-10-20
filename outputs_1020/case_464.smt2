; SMT2 file generated from compliance case automatic
; Case ID: case_464
; Generated at: 2025-10-19T16:36:35.330716
;
; This file can be executed with Z3:
;   z3 case_464.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration Bool)
(declare-const agent_company_dissolved_or_license_revoked Bool)
(declare-const agent_company_dissolved_or_license_revoked_flag Bool)
(declare-const agent_company_must_discipline Bool)
(declare-const agent_misconduct Bool)
(declare-const agent_must_retake_exam_and_register Bool)
(declare-const agent_registered_for_special_insurance Bool)
(declare-const agent_registration_changed Bool)
(declare-const agent_registration_must_be_revoked Bool)
(declare-const agent_registration_revoked Bool)
(declare-const agent_registration_revoked_due_to_violation Bool)
(declare-const agent_special_exam_passed Bool)
(declare-const agent_suspension_cumulative_2_years Bool)
(declare-const agent_suspension_cumulative_two_years Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severely_insufficient Bool)
(declare-const capital_level_significantly_insufficient Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_by_authority Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_done_on_time Bool)
(declare-const improvement_plan_improved_after_guidance Bool)
(declare-const improvement_plan_not_improved_after_guidance Bool)
(declare-const improvement_plan_overdue Bool)
(declare-const misconduct_coerce_to_terminate_and_reapply Bool)
(declare-const misconduct_exaggerated_comparison Bool)
(declare-const misconduct_exaggerated_promotion Bool)
(declare-const misconduct_false_or_no_explanation Bool)
(declare-const misconduct_illegal_entity_or_person_recruit Bool)
(declare-const misconduct_illegal_insurance_or_financial_products Bool)
(declare-const misconduct_improper_discount_or_commission Bool)
(declare-const misconduct_induce_false_or_no_disclosure Bool)
(declare-const misconduct_misuse_funds_or_documents Bool)
(declare-const misconduct_obstruct_disclosure Bool)
(declare-const misconduct_other_improper_business Bool)
(declare-const misconduct_recruit_without_consent Bool)
(declare-const misconduct_sign_or_fill_without_consent Bool)
(declare-const misconduct_spread_false_information Bool)
(declare-const misconduct_unauthorized_premium_collection_or_misuse Bool)
(declare-const misconduct_use_others_registration Bool)
(declare-const misconduct_violate_other_regulations Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const prohibited_acts_without_supervisor_consent Bool)
(declare-const registration_revoked_11_1 Bool)
(declare-const registration_revoked_13 Bool)
(declare-const registration_revoked_19_3 Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const significant_financial_deterioration Bool)
(declare-const special_exam_passed Bool)
(declare-const supervision_or_takeover_or_shutdown_order Bool)
(declare-const supervisor_consent_contract_commitment Bool)
(declare-const supervisor_consent_other_major_financial_matters Bool)
(declare-const supervisor_consent_payment_exceed_limit Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)

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

; [insurance:capital_level_severely_insufficient] 資本等級為嚴重不足
(assert (= capital_level_severely_insufficient (= 4 capital_level)))

; [insurance:capital_level_significantly_insufficient] 資本等級為顯著不足
(assert (= capital_level_significantly_insufficient (= 3 capital_level)))

; [insurance:capital_level_insufficient] 資本等級為不足
(assert (= capital_level_insufficient (= 2 capital_level)))

; [insurance:capital_level_adequate] 資本等級為適足
(assert (= capital_level_adequate (= 1 capital_level)))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限內完成
(assert (= improvement_plan_completed improvement_plan_done_on_time))

; [insurance:improvement_plan_overdue] 增資、財務或業務改善計畫或合併未於主管機關規定期限內完成
(assert (not (= improvement_plan_done_on_time improvement_plan_overdue)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or unable_to_pay_debt
       unable_to_fulfill_contract
       risk_to_insured_rights
       significant_financial_deterioration)))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_by_authority))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值呈現加速惡化
(assert (= improvement_plan_accelerated_deterioration accelerated_deterioration))

; [insurance:improvement_plan_not_improved_after_guidance] 經輔導仍未改善
(assert (not (= improvement_plan_improved_after_guidance
        improvement_plan_not_improved_after_guidance)))

; [insurance:supervision_or_takeover_or_shutdown_order] 主管機關為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervision_or_takeover_or_shutdown_order
   (or (and capital_level_severely_insufficient
            (not improvement_plan_completed))
       (and (not capital_level_severely_insufficient)
            financial_or_business_deterioration
            improvement_plan_approved
            (or improvement_plan_accelerated_deterioration
                improvement_plan_not_improved_after_guidance)))))

; [insurance:prohibited_acts_without_supervisor_consent] 保險業監管處分時，未經監管人同意不得為禁止行為
(assert (= prohibited_acts_without_supervisor_consent
   (and (not supervisor_consent_payment_exceed_limit)
        (not supervisor_consent_contract_commitment)
        (not supervisor_consent_other_major_financial_matters))))

; [insurance:agent_special_exam_passed] 業務員通過特別測驗
(assert (= agent_special_exam_passed special_exam_passed))

; [insurance:agent_registered_for_special_insurance] 業務員已依規定辦理變更登錄始得招攬特別測驗保險
(assert (= agent_registered_for_special_insurance
   (and agent_special_exam_passed agent_registration_changed)))

; [insurance:agent_registration_revoked_due_to_violation] 業務員因撤銷登錄處分須重新參加測驗並辦理變更登錄
(assert (= agent_registration_revoked_due_to_violation
   (or registration_revoked_11_1
       registration_revoked_13
       registration_revoked_19_3)))

; [insurance:agent_must_retake_exam_and_register] 業務員撤銷登錄後須重新參加測驗合格並辦理變更登錄
(assert (= agent_must_retake_exam_and_register
   (and agent_registration_revoked_due_to_violation
        agent_special_exam_passed
        agent_registration_changed)))

; [insurance:agent_misconduct] 業務員有不當行為
(assert (= agent_misconduct
   (or misconduct_illegal_entity_or_person_recruit
       misconduct_induce_false_or_no_disclosure
       misconduct_obstruct_disclosure
       misconduct_exaggerated_comparison
       misconduct_misuse_funds_or_documents
       misconduct_false_or_no_explanation
       misconduct_exaggerated_promotion
       misconduct_improper_discount_or_commission
       misconduct_illegal_insurance_or_financial_products
       misconduct_coerce_to_terminate_and_reapply
       misconduct_spread_false_information
       misconduct_use_others_registration
       misconduct_unauthorized_premium_collection_or_misuse
       misconduct_violate_other_regulations
       misconduct_recruit_without_consent
       misconduct_sign_or_fill_without_consent
       misconduct_other_improper_business)))

; [insurance:agent_company_dissolved_or_license_revoked] 業務員所屬公司已解散或註銷公司執業證照
(assert (= agent_company_dissolved_or_license_revoked
   agent_company_dissolved_or_license_revoked_flag))

; [insurance:agent_company_must_discipline] 業務員行為時所屬公司已解散或註銷公司執業證照，應予處分
(assert (= agent_company_must_discipline
   (and agent_misconduct agent_company_dissolved_or_license_revoked)))

; [insurance:agent_suspension_cumulative_two_years] 最近五年內受停止招攬行為處分期間累計達二年
(assert (= agent_suspension_cumulative_two_years agent_suspension_cumulative_2_years))

; [insurance:agent_registration_must_be_revoked] 業務員停止招攬行為處分期間累計達二年者，所屬公司應撤銷其登錄
(assert (= agent_registration_must_be_revoked
   (and agent_suspension_cumulative_two_years agent_registration_revoked)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未依規定完成改善計畫，或財務業務顯著惡化且未改善，或業務員違規行為未受處分等情形
(assert (= penalty
   (or (and (not capital_level_severely_insufficient)
            financial_or_business_deterioration
            improvement_plan_approved
            (or improvement_plan_accelerated_deterioration
                improvement_plan_not_improved_after_guidance)
            supervision_or_takeover_or_shutdown_order)
       (and agent_suspension_cumulative_two_years
            (not agent_registration_must_be_revoked))
       (and capital_level_severely_insufficient
            (not improvement_plan_completed)
            supervision_or_takeover_or_shutdown_order)
       (and agent_misconduct (not agent_company_must_discipline)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 150.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 3.0))
(assert (= financial_or_business_deterioration true))
(assert (= risk_to_insured_rights true))
(assert (= agent_misconduct true))
(assert (= misconduct_sign_or_fill_without_consent true))
(assert (= misconduct_illegal_insurance_or_financial_products true))
(assert (= misconduct_other_improper_business true))
(assert (= improvement_plan_completed false))
(assert (= improvement_plan_done_on_time false))
(assert (= improvement_plan_approved_by_authority false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= improvement_plan_not_improved_after_guidance false))
(assert (= supervision_or_takeover_or_shutdown_order false))
(assert (= agent_company_dissolved_or_license_revoked_flag false))
(assert (= agent_company_dissolved_or_license_revoked false))
(assert (= agent_company_must_discipline false))
(assert (= agent_special_exam_passed false))
(assert (= agent_registration_changed false))
(assert (= agent_registration_revoked_due_to_violation false))
(assert (= agent_registration_revoked false))
(assert (= agent_suspension_cumulative_2_years false))
(assert (= agent_suspension_cumulative_two_years false))
(assert (= agent_registration_must_be_revoked false))
(assert (= registration_revoked_11_1 false))
(assert (= registration_revoked_13 false))
(assert (= registration_revoked_19_3 false))
(assert (= accelerated_deterioration false))
(assert (= misconduct_false_or_no_explanation false))
(assert (= misconduct_induce_false_or_no_disclosure false))
(assert (= misconduct_obstruct_disclosure false))
(assert (= misconduct_improper_discount_or_commission false))
(assert (= misconduct_exaggerated_promotion false))
(assert (= misconduct_recruit_without_consent false))
(assert (= misconduct_coerce_to_terminate_and_reapply false))
(assert (= misconduct_unauthorized_premium_collection_or_misuse false))
(assert (= misconduct_use_others_registration false))
(assert (= misconduct_exaggerated_comparison false))
(assert (= misconduct_spread_false_information false))
(assert (= misconduct_misuse_funds_or_documents false))
(assert (= misconduct_violate_other_regulations false))
(assert (= prohibited_acts_without_supervisor_consent true))
(assert (= supervisor_consent_payment_exceed_limit false))
(assert (= supervisor_consent_contract_commitment false))
(assert (= supervisor_consent_other_major_financial_matters false))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= significant_financial_deterioration false))
(assert (= agent_must_retake_exam_and_register false))
(assert (= agent_registered_for_special_insurance false))
(assert (= capital_level 0))
(assert (= capital_level_adequate false))
(assert (= capital_level_insufficient false))
(assert (= capital_level_severely_insufficient false))
(assert (= capital_level_significantly_insufficient false))
(assert (= improvement_plan_improved_after_guidance false))
(assert (= improvement_plan_overdue false))
(assert (= misconduct_illegal_entity_or_person_recruit false))
(assert (= penalty false))
(assert (= special_exam_passed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 24
; Total variables: 62
; Total facts: 62
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
