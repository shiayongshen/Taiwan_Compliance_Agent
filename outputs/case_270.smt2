; SMT2 file generated from compliance case automatic
; Case ID: case_270
; Generated at: 2025-10-21T06:00:57.354562
;
; This file can be executed with Z3:
;   z3 case_270.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const blood_relation_degree Int)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_4_noncompliance Bool)
(declare-const company_law_related_enterprise Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const financial_or_business_status_worsened Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_not_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const is_responsible_person_of_business Bool)
(declare-const is_self Bool)
(declare-const is_spouse Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_deterioration Bool)
(declare-const net_worth_ratio Real)
(declare-const other_legal_violation Bool)
(declare-const penalty Bool)
(declare-const person_type Int)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const public_disclosure_on_time Bool)
(declare-const regulatory_action_required Bool)
(declare-const regulatory_limit_enforced Bool)
(declare-const related_person_or_enterprise_limit_applied Bool)
(declare-const reporting_content_accurate Bool)
(declare-const reporting_document_accurate Bool)
(declare-const reporting_document_provided Bool)
(declare-const reporting_submitted_on_time Bool)
(declare-const risk_of_harming_insured_rights Bool)
(declare-const same_person Bool)
(declare-const same_related_enterprise Bool)
(declare-const same_related_person Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const violation_internal_control_or_handling Bool)
(declare-const violation_internal_control_penalty Bool)
(declare-const violation_other_penalty Bool)
(declare-const violation_reporting_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:same_person_definition] 同一人定義為同一自然人或同一法人
(assert (= same_person (or (= 1 person_type) (= 2 person_type))))

; [insurance:same_related_person_definition] 同一關係人範圍包含本人、配偶、二親等以內血親及以本人或配偶為負責人之事業
(assert (= same_related_person
   (or is_responsible_person_of_business
       is_self
       (>= 2 blood_relation_degree)
       is_spouse)))

; [insurance:same_related_enterprise_definition] 同一關係企業範圍依公司法相關條文規定
(assert (= same_related_enterprise company_law_related_enterprise))

; [insurance:related_person_or_enterprise_limit_applied] 主管機關得對保險業就同一人、同一關係人或同一關係企業之放款或其他交易予以限制
(assert (= related_person_or_enterprise_limit_applied regulatory_limit_enforced))

; [insurance:internal_control_and_audit_established] 保險業建立內部控制及稽核制度
(assert (= internal_control_and_audit_established internal_control_established))

; [insurance:internal_handling_system_established] 保險業建立內部處理制度及程序
(assert (= internal_handling_system_established internal_handling_established))

; [insurance:violation_internal_control_or_handling] 違反內部控制或內部處理制度規定
(assert (= violation_internal_control_or_handling
   (or (not internal_control_established)
       (not internal_control_executed)
       (not internal_handling_established)
       (not internal_handling_executed))))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level)
        (or (not capital_increase_completed)
            (not financial_or_business_improvement_plan_completed)
            (not merger_completed)))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (and financial_or_business_status_worsened
        (or unable_to_fulfill_contract
            risk_of_harming_insured_rights
            unable_to_pay_debt))))

; [insurance:improvement_plan_submitted_and_approved] 保險業提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_not_effective] 損益、淨值加速惡化或經輔導仍未改善，致有監管、接管、勒令停業清理或解散之虞
(assert (= improvement_plan_not_effective
   (and (or net_worth_accelerated_deterioration
            profit_loss_accelerated_deterioration)
        (not improvement_plan_effective))))

; [insurance:regulatory_action_required] 主管機關得為監管、接管、勒令停業清理或命令解散之處分
(assert (= regulatory_action_required
   (or capital_level_4_noncompliance
       (and (not capital_level_4_noncompliance)
            financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_not_effective))))

; [insurance:violation_internal_control_penalty] 違反內部控制或內部處理制度規定，處罰
(assert (= violation_internal_control_penalty violation_internal_control_or_handling))

; [insurance:violation_reporting_penalty] 違反報告或說明文件規定，處罰
(assert (= violation_reporting_penalty
   (or (not reporting_content_accurate)
       (not reporting_document_accurate)
       (not public_disclosure_on_time)
       (not reporting_document_provided)
       (not reporting_submitted_on_time))))

; [insurance:violation_other_penalty] 違反其他法令規定，處罰
(assert (= violation_other_penalty other_legal_violation))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制、內部處理制度、報告說明文件或其他法令規定時處罰
(assert (= penalty
   (or violation_other_penalty
       violation_internal_control_penalty
       violation_reporting_penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= blood_relation_degree 3))
(assert (= capital_adequacy_ratio 100.0))
(assert (= capital_increase_completed false))
(assert (= company_law_related_enterprise false))
(assert (= financial_or_business_deterioration false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= financial_or_business_status_worsened false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_effective false))
(assert (= improvement_plan_not_effective false))
(assert (= improvement_plan_submitted false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= is_responsible_person_of_business false))
(assert (= is_self false))
(assert (= is_spouse false))
(assert (= merger_completed false))
(assert (= net_worth 10.0))
(assert (= net_worth_accelerated_deterioration false))
(assert (= net_worth_ratio 3.0))
(assert (= other_legal_violation true))
(assert (= person_type 1))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= public_disclosure_on_time false))
(assert (= regulatory_limit_enforced false))
(assert (= reporting_content_accurate false))
(assert (= reporting_document_accurate false))
(assert (= reporting_document_provided false))
(assert (= reporting_submitted_on_time false))
(assert (= risk_of_harming_insured_rights false))
(assert (= same_person true))
(assert (= same_related_enterprise false))
(assert (= same_related_person false))
(assert (= unable_to_fulfill_contract false))
(assert (= unable_to_pay_debt false))
(assert (= violation_internal_control_or_handling true))
(assert (= violation_internal_control_penalty true))
(assert (= violation_other_penalty true))
(assert (= violation_reporting_penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 49
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
