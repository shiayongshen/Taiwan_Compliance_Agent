; SMT2 file generated from compliance case automatic
; Case ID: case_308
; Generated at: 2025-10-19T12:43:46.390755
;
; This file can be executed with Z3:
;   z3 case_308.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const blood_relation_degree Int)
(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_4_violation Bool)
(declare-const company_law_369_11_applied Bool)
(declare-const company_law_369_1_applied Bool)
(declare-const company_law_369_2_applied Bool)
(declare-const company_law_369_3_applied Bool)
(declare-const company_law_369_9_applied Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_by_authority Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_executed Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const is_business_responsible_by_self_or_spouse Bool)
(declare-const is_self Bool)
(declare-const is_spouse Bool)
(declare-const net_worth Real)
(declare-const net_worth_accelerated_deterioration Bool)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const person_type Int)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const prohibited_actions_without_supervisor_consent Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const same_person Bool)
(declare-const same_related_enterprise Bool)
(declare-const same_related_person Bool)
(declare-const supervision_or_takeover_decision Bool)
(declare-const supervisor_consent_for_contract Bool)
(declare-const supervisor_consent_for_financial_matters Bool)
(declare-const supervisor_consent_for_payment Bool)
(declare-const violation_internal_control_or_handling Bool)
(declare-const violation_internal_control_or_handling_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:same_person_definition] 同一人定義為同一自然人或同一法人
(assert (= same_person (or (= 1 person_type) (= 2 person_type))))

; [insurance:same_related_person_definition] 同一關係人定義包含本人、配偶、二親等以內血親及以本人或配偶為負責人之事業
(assert (= same_related_person
   (or is_self
       is_business_responsible_by_self_or_spouse
       is_spouse
       (>= 2 blood_relation_degree))))

; [insurance:same_related_enterprise_definition] 同一關係企業範圍適用公司法相關條文
(assert (= same_related_enterprise
   (or company_law_369_9_applied
       company_law_369_2_applied
       company_law_369_11_applied
       company_law_369_3_applied
       company_law_369_1_applied)))

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

; [insurance:improvement_plan_submitted_and_executed] 增資、財務或業務改善計畫已提交且執行
(assert (= improvement_plan_submitted_and_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:capital_level_4_violation] 資本嚴重不足且未依規定完成增資或改善計畫
(assert (= capital_level_4_violation
   (and (= 4 capital_level) (not improvement_plan_submitted_and_executed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or cannot_fulfill_contract risk_to_insured_rights cannot_pay_debt)))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_by_authority))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值加速惡化或經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration
   (or profit_loss_accelerated_deterioration
       (not improvement_plan_executed)
       net_worth_accelerated_deterioration)))

; [insurance:supervision_or_takeover_decision] 主管機關為監管、接管、勒令停業清理或命令解散之處分
(assert (let ((a!1 (or capital_level_4_violation
               (and (not (= 4 capital_level))
                    financial_or_business_deterioration
                    improvement_plan_approved
                    improvement_plan_accelerated_deterioration))))
  (= supervision_or_takeover_decision a!1)))

; [insurance:prohibited_actions_without_supervisor_consent] 監管處分期間未經監管人同意不得為特定行為
(assert (= prohibited_actions_without_supervisor_consent
   (and (not supervisor_consent_for_payment)
        (not supervisor_consent_for_contract)
        (not supervisor_consent_for_financial_matters))))

; [insurance:violation_internal_control_or_handling_penalty] 違反內部控制或內部處理制度規定處罰
(assert (= violation_internal_control_or_handling_penalty
   violation_internal_control_or_handling))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制或內部處理制度，或資本嚴重不足且未完成改善計畫，或財務業務惡化且未改善時處罰
(assert (let ((a!1 (or capital_level_4_violation
               (and (not (= 4 capital_level))
                    financial_or_business_deterioration
                    improvement_plan_approved
                    improvement_plan_accelerated_deterioration)
               violation_internal_control_or_handling)))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= blood_relation_degree 3))
(assert (= cannot_fulfill_contract false))
(assert (= cannot_pay_debt false))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 3.0))
(assert (= capital_level 1))
(assert (= capital_level_4_violation false))
(assert (= company_law_369_1_applied false))
(assert (= company_law_369_2_applied false))
(assert (= company_law_369_3_applied false))
(assert (= company_law_369_9_applied false))
(assert (= company_law_369_11_applied false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_approved_by_authority false))
(assert (= improvement_plan_executed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_submitted_and_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_system_established false))
(assert (= is_business_responsible_by_self_or_spouse false))
(assert (= is_self false))
(assert (= is_spouse false))
(assert (= penalty true))
(assert (= person_type 0))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= prohibited_actions_without_supervisor_consent false))
(assert (= risk_to_insured_rights true))
(assert (= same_person false))
(assert (= same_related_enterprise false))
(assert (= same_related_person false))
(assert (= supervision_or_takeover_decision false))
(assert (= supervisor_consent_for_contract false))
(assert (= supervisor_consent_for_financial_matters false))
(assert (= supervisor_consent_for_payment false))
(assert (= violation_internal_control_or_handling true))
(assert (= violation_internal_control_or_handling_penalty true))
(assert (= net_worth_accelerated_deterioration false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 44
; Total facts: 44
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
