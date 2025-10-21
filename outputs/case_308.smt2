; SMT2 file generated from compliance case automatic
; Case ID: case_308
; Generated at: 2025-10-21T22:17:06.045551
;
; This file can be executed with Z3:
;   z3 case_308.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const asset_quality_evaluation_included Bool)
(declare-const bad_debt_writeoff_included Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_4_noncompliance Bool)
(declare-const collection_management_included Bool)
(declare-const company_law_related_enterprise Bool)
(declare-const degree_of_kinship Int)
(declare-const financial_deterioration_and_no_improvement Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const financial_or_business_status_significantly_deteriorated Bool)
(declare-const improvement_after_guidance Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_handling_scope_compliant Bool)
(declare-const internal_handling_system_and_procedure_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const is_business_responsible_by_self_or_spouse Bool)
(declare-const is_same_legal_person Bool)
(declare-const is_same_natural_person Bool)
(declare-const is_self Bool)
(declare-const is_spouse Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const overdue_loan_management_included Bool)
(declare-const penalty Bool)
(declare-const policy_solicitation_underwriting_claim_included Bool)
(declare-const profit_loss_and_net_worth_accelerated_deterioration Bool)
(declare-const reserve_provision_included Bool)
(declare-const risk_of_harming_insured_rights Bool)
(declare-const same_person Bool)
(declare-const same_related_enterprise Bool)
(declare-const same_related_person Bool)
(declare-const supervisory_measures_taken Bool)
(declare-const unable_to_fulfill_contractual_obligations Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const violation_internal_control_or_handling Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:same_person_definition] 同一人定義為同一自然人或同一法人
(assert (= same_person (or is_same_legal_person is_same_natural_person)))

; [insurance:same_related_person_definition] 同一關係人定義包含本人、配偶、二親等以內血親及本人或配偶為負責人之事業
(assert (= same_related_person
   (or is_self
       is_spouse
       is_business_responsible_by_self_or_spouse
       (>= 2 degree_of_kinship))))

; [insurance:same_related_enterprise_definition] 同一關係企業範圍依公司法369-1至369-3、369-9及369-11規定
(assert (= same_related_enterprise company_law_related_enterprise))

; [insurance:internal_control_and_audit_established] 保險業建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   internal_control_and_audit_system_established))

; [insurance:internal_handling_system_established] 保險業建立內部處理制度及程序
(assert (= internal_handling_system_established
   internal_handling_system_and_procedure_established))

; [insurance:internal_handling_scope] 內部處理制度涵蓋資產品質評估、準備金提存、逾期放款、催收款清理、呆帳轉銷及保單招攬核保理賠
(assert (= internal_handling_scope_compliant
   (and asset_quality_evaluation_included
        reserve_provision_included
        overdue_loan_management_included
        collection_management_included
        bad_debt_writeoff_included
        policy_solicitation_underwriting_claim_included)))

; [insurance:violation_internal_control_or_handling] 違反未建立或未執行內部控制、稽核或內部處理制度者
(assert (= violation_internal_control_or_handling
   (or (not internal_control_and_audit_established)
       (not internal_handling_system_established))))

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

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level)
        (or (not capital_increase_completed)
            (not financial_or_business_improvement_plan_completed)
            (not merger_completed)))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or unable_to_fulfill_contractual_obligations
       risk_of_harming_insured_rights
       unable_to_pay_debt
       financial_or_business_status_significantly_deteriorated)))

; [insurance:improvement_plan_submitted_and_approved] 保險業提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:financial_deterioration_and_no_improvement] 損益、淨值加速惡化且經輔導仍未改善
(assert (= financial_deterioration_and_no_improvement
   (and profit_loss_and_net_worth_accelerated_deterioration
        (not improvement_after_guidance))))

; [insurance:penalty_conditions] 處罰條件：違反內部控制或處理制度，或資本嚴重不足且未完成增資或改善計畫，或財務惡化未改善時處罰
(assert (= penalty
   (or violation_internal_control_or_handling
       capital_level_4_noncompliance
       (and financial_or_business_deterioration
            (not improvement_plan_submitted_and_approved))
       (and financial_deterioration_and_no_improvement
            (not supervisory_measures_taken)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= is_same_natural_person false))
(assert (= is_same_legal_person false))
(assert (= same_person false))
(assert (= is_self true))
(assert (= is_spouse false))
(assert (= degree_of_kinship 3))
(assert (= is_business_responsible_by_self_or_spouse false))
(assert (= same_related_person true))
(assert (= company_law_related_enterprise false))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_handling_system_and_procedure_established false))
(assert (= internal_handling_system_established false))
(assert (= asset_quality_evaluation_included false))
(assert (= reserve_provision_included false))
(assert (= overdue_loan_management_included false))
(assert (= collection_management_included false))
(assert (= bad_debt_writeoff_included false))
(assert (= policy_solicitation_underwriting_claim_included false))
(assert (= violation_internal_control_or_handling true))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 3.0))
(assert (= capital_level 1))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= capital_level_4_noncompliance false))
(assert (= financial_or_business_status_significantly_deteriorated false))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contractual_obligations false))
(assert (= risk_of_harming_insured_rights false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= profit_loss_and_net_worth_accelerated_deterioration false))
(assert (= improvement_after_guidance false))
(assert (= financial_deterioration_and_no_improvement false))
(assert (= supervisory_measures_taken false))
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
; Total variables: 43
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
