; SMT2 file generated from compliance case automatic
; Case ID: case_270
; Generated at: 2025-10-19T11:48:34.381570
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
(declare-const capital_level Int)
(declare-const capital_level_2_deterioration Bool)
(declare-const capital_level_2_measures_completed Bool)
(declare-const capital_level_3_deterioration Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const company_law_related_enterprise Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_executed Bool)
(declare-const internal_control_and_handling_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const is_business_responsible_by_self_or_spouse Bool)
(declare-const is_related_enterprise_or_responsible_person_major_shareholder Bool)
(declare-const is_responsible_person_or_major_shareholder Bool)
(declare-const is_responsible_person_or_major_shareholder_enterprise Bool)
(declare-const is_self Bool)
(declare-const is_spouse Bool)
(declare-const is_subsidiary_or_responsible_person Bool)
(declare-const loan_and_other_transaction_limit Real)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_transaction_limit Real)
(declare-const penalty Bool)
(declare-const person_type Int)
(declare-const regulatory_limit_set Bool)
(declare-const regulatory_other_transaction_limit_set Bool)
(declare-const related_person_for_other_transaction Bool)
(declare-const same_person Bool)
(declare-const same_related_enterprise Bool)
(declare-const same_related_person Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:same_person_definition] 同一人定義為同一自然人或同一法人
(assert (= same_person (or (= 1 person_type) (= 2 person_type))))

; [insurance:same_related_person_definition] 同一關係人範圍包含本人、配偶、二親等以內血親及以本人或配偶為負責人之事業
(assert (= same_related_person
   (or (>= 2 blood_relation_degree)
       is_spouse
       is_business_responsible_by_self_or_spouse
       is_self)))

; [insurance:same_related_enterprise_definition] 同一關係企業範圍適用公司法相關條文
(assert (= same_related_enterprise company_law_related_enterprise))

; [insurance:loan_and_other_transaction_limit] 主管機關得限制保險業對同一人、同一關係人或同一關係企業之放款或其他交易
(assert (= loan_and_other_transaction_limit (ite regulatory_limit_set 1.0 0.0)))

; [insurance:other_transaction_limit] 主管機關得限制保險業與利害關係人從事放款以外之其他交易
(assert (= other_transaction_limit (ite regulatory_other_transaction_limit_set 1.0 0.0)))

; [insurance:related_person_definition_for_other_transaction] 利害關係人範圍包括負責人、大股東及其相關企業
(assert (= related_person_for_other_transaction
   (or is_related_enterprise_or_responsible_person_major_shareholder
       is_responsible_person_or_major_shareholder
       is_responsible_person_or_major_shareholder_enterprise
       is_subsidiary_or_responsible_person)))

; [insurance:internal_control_and_audit_established] 保險業建立內部控制及稽核制度
(assert (= internal_control_and_audit_established internal_control_established))

; [insurance:internal_control_and_audit_executed] 保險業執行內部控制及稽核制度
(assert (= internal_control_and_audit_executed internal_control_executed))

; [insurance:internal_handling_system_established] 保險業建立內部處理制度及程序
(assert (= internal_handling_system_established internal_handling_established))

; [insurance:internal_handling_system_executed] 保險業執行內部處理制度及程序
(assert (= internal_handling_system_executed internal_handling_executed))

; [insurance:internal_control_and_handling_ok] 保險業建立且執行內部控制及稽核制度與內部處理制度
(assert (= internal_control_and_handling_ok
   (and internal_control_and_audit_established
        internal_control_and_audit_executed
        internal_handling_system_established
        internal_handling_system_executed)))

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

; [insurance:improvement_plan_submitted_and_approved] 保險業提出且主管機關核定財務或業務改善計畫
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level) (not capital_level_4_measures_completed))))

; [insurance:capital_level_3_deterioration] 財務或業務狀況顯著惡化且未改善
(assert (= capital_level_3_deterioration
   (and (= 3 capital_level) (not capital_level_3_measures_completed))))

; [insurance:capital_level_2_deterioration] 財務或業務狀況不足且未改善
(assert (= capital_level_2_deterioration
   (and (= 2 capital_level) (not capital_level_2_measures_completed))))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制或內部處理制度，或資本不足且未執行對應措施時處罰
(assert (= penalty
   (or (not internal_control_and_handling_ok)
       (and (= 3 capital_level) (not capital_level_3_measures_completed))
       (and (= 4 capital_level) (not capital_level_4_measures_completed))
       (and (= 2 capital_level) (not capital_level_2_measures_completed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= blood_relation_degree 3))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 1000000.0))
(assert (= net_worth_ratio 5.0))
(assert (= capital_level_2_measures_completed false))
(assert (= capital_level_3_measures_completed false))
(assert (= capital_level_4_measures_completed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= company_law_related_enterprise false))
(assert (= is_self false))
(assert (= is_spouse false))
(assert (= is_business_responsible_by_self_or_spouse false))
(assert (= is_related_enterprise_or_responsible_person_major_shareholder false))
(assert (= is_responsible_person_or_major_shareholder false))
(assert (= is_responsible_person_or_major_shareholder_enterprise false))
(assert (= is_subsidiary_or_responsible_person false))
(assert (= person_type 0))
(assert (= regulatory_limit_set false))
(assert (= regulatory_other_transaction_limit_set false))
(assert (= related_person_for_other_transaction false))
(assert (= same_person false))
(assert (= same_related_enterprise false))
(assert (= same_related_person false))
(assert (= capital_level 0))
(assert (= capital_level_2_deterioration false))
(assert (= capital_level_3_deterioration false))
(assert (= capital_level_4_noncompliance false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_control_and_audit_executed false))
(assert (= internal_control_and_handling_ok false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= loan_and_other_transaction_limit 0.0))
(assert (= other_transaction_limit 0.0))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 41
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
