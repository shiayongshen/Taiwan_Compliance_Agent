; SMT2 file generated from compliance case automatic
; Case ID: case_329
; Generated at: 2025-10-19T13:24:05.386751
;
; This file can be executed with Z3:
;   z3 case_329.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const blood_relation_degree Int)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_4_penalty_condition Bool)
(declare-const company_law_related_enterprise Bool)
(declare-const financial_deterioration_condition Bool)
(declare-const financial_or_business_deteriorated Bool)
(declare-const improvement_plan_approved Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const is_responsible_person_of_enterprise Bool)
(declare-const is_self Bool)
(declare-const is_spouse Bool)
(declare-const legal_person Bool)
(declare-const loan_and_other_transaction_limit Real)
(declare-const natural_person Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_transaction_limit Real)
(declare-const penalty Bool)
(declare-const person_type Int)
(declare-const regulatory_limit_enforced Bool)
(declare-const regulatory_other_transaction_limit_enforced Bool)
(declare-const same_person Bool)
(declare-const same_related_enterprise Bool)
(declare-const same_related_person Bool)
(declare-const violation_internal_control_penalty Bool)
(declare-const violation_internal_handling_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:same_person_definition] 同一人定義為同一自然人或同一法人
(assert (= same_person
   (or (= person_type (ite natural_person 1 0))
       (= person_type (ite legal_person 1 0)))))

; [insurance:same_related_person_definition] 同一關係人定義包含本人、配偶、二親等以內血親及以本人或配偶為負責人之事業
(assert (= same_related_person
   (or is_spouse
       is_self
       is_responsible_person_of_enterprise
       (>= 2 blood_relation_degree))))

; [insurance:same_related_enterprise_definition] 同一關係企業範圍適用公司法相關條文
(assert (= same_related_enterprise company_law_related_enterprise))

; [insurance:loan_and_other_transaction_limit] 主管機關得限制保險業對同一人、同一關係人或同一關係企業之放款或其他交易
(assert (= loan_and_other_transaction_limit (ite regulatory_limit_enforced 1.0 0.0)))

; [insurance:other_transaction_limit] 主管機關得限制保險業與利害關係人從事放款以外之其他交易
(assert (= other_transaction_limit
   (ite regulatory_other_transaction_limit_enforced 1.0 0.0)))

; [insurance:internal_control_and_audit_established] 保險業建立內部控制及稽核制度
(assert (= internal_control_and_audit_established internal_control_established))

; [insurance:internal_handling_system_established] 保險業建立內部處理制度及程序
(assert (= internal_handling_system_established internal_handling_established))

; [insurance:violation_internal_control_penalty] 違反內部控制或稽核制度規定處罰
(assert (not (= (and internal_control_established internal_control_executed)
        violation_internal_control_penalty)))

; [insurance:violation_internal_handling_penalty] 違反內部處理制度或程序規定處罰
(assert (not (= (and internal_handling_established internal_handling_executed)
        violation_internal_handling_penalty)))

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

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級(4)應完成增資、財務或業務改善計畫或合併
(assert (= capital_level_4_measures_executed capital_level_4_measures_completed))

; [insurance:capital_level_4_penalty_condition] 資本嚴重不足且未完成增資、改善計畫或合併者處罰條件
(assert (= capital_level_4_penalty_condition
   (and (= 4 capital_level) (not capital_level_4_measures_completed))))

; [insurance:financial_deterioration_condition] 財務或業務狀況顯著惡化且未改善
(assert (= financial_deterioration_condition
   (and financial_or_business_deteriorated (not improvement_plan_approved))))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制、內部處理制度或資本嚴重不足且未完成改善計畫等情況處罰
(assert (= penalty
   (or financial_deterioration_condition
       violation_internal_control_penalty
       violation_internal_handling_penalty
       (and (= 4 capital_level) (not capital_level_4_measures_completed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= blood_relation_degree 2))
(assert (= capital_adequacy_ratio 100.0))
(assert (= capital_level 0))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level_4_measures_executed false))
(assert (= capital_level_4_penalty_condition false))
(assert (= company_law_related_enterprise true))
(assert (= financial_deterioration_condition false))
(assert (= financial_or_business_deteriorated false))
(assert (= improvement_plan_approved false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed false))
(assert (= internal_handling_system_established true))
(assert (= is_responsible_person_of_enterprise true))
(assert (= is_self true))
(assert (= is_spouse false))
(assert (= legal_person true))
(assert (= loan_and_other_transaction_limit 0.0))
(assert (= natural_person false))
(assert (= net_worth 1000000.0))
(assert (= net_worth_ratio 10.0))
(assert (= other_transaction_limit 0.0))
(assert (= penalty true))
(assert (= person_type 1))
(assert (= regulatory_limit_enforced true))
(assert (= regulatory_other_transaction_limit_enforced true))
(assert (= same_person true))
(assert (= same_related_enterprise true))
(assert (= same_related_person true))
(assert (= violation_internal_control_penalty true))
(assert (= violation_internal_handling_penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 34
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
