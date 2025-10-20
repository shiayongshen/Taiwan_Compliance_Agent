; SMT2 file generated from compliance case automatic
; Case ID: case_109
; Generated at: 2025-10-19T08:17:02.744887
;
; This file can be executed with Z3:
;   z3 case_109.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const CAR Real)
(declare-const NWR Real)
(declare-const blood_relation_degree Int)
(declare-const capital_level Int)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const company_law_related_enterprise Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_handling_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const is_responsible_person_of_business Bool)
(declare-const is_self Bool)
(declare-const is_spouse Bool)
(declare-const loan_amount_same_person Real)
(declare-const loan_amount_same_related_enterprise Real)
(declare-const loan_amount_same_related_person Real)
(declare-const loan_and_other_transaction_limit_compliance Bool)
(declare-const loan_and_other_transaction_limit_violation Bool)
(declare-const loan_limit_same_person Real)
(declare-const loan_limit_same_related_enterprise Real)
(declare-const loan_limit_same_related_person Real)
(declare-const loss_accelerated Bool)
(declare-const net_worth Real)
(declare-const net_worth_deteriorated Bool)
(declare-const other_transaction_amount_same_person Real)
(declare-const other_transaction_amount_same_related_enterprise Real)
(declare-const other_transaction_amount_same_related_person Real)
(declare-const other_transaction_limit_same_person Real)
(declare-const other_transaction_limit_same_related_enterprise Real)
(declare-const other_transaction_limit_same_related_person Real)
(declare-const penalty Bool)
(declare-const person_type Int)
(declare-const same_person Bool)
(declare-const same_related_enterprise Bool)
(declare-const same_related_person Bool)
(declare-const supervision_or_takeover_required Bool)
(declare-const violation_of_internal_control_or_handling Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:same_person_definition] 同一人定義為同一自然人或同一法人
(assert (= same_person (or (= 1 person_type) (= 2 person_type))))

; [insurance:same_related_person_definition] 同一關係人定義包含本人、配偶、二親等以內血親及以本人或配偶為負責人之事業
(assert (= same_related_person
   (or (>= 2 blood_relation_degree)
       is_responsible_person_of_business
       is_spouse
       is_self)))

; [insurance:same_related_enterprise_definition] 同一關係企業範圍適用公司法相關條文
(assert (= same_related_enterprise company_law_related_enterprise))

; [insurance:loan_and_other_transaction_limit_compliance] 保險業對同一人、同一關係人或同一關係企業之放款或其他交易應符合主管機關定之限額及範圍
(assert (= loan_and_other_transaction_limit_compliance
   (and (<= loan_amount_same_person loan_limit_same_person)
        (<= loan_amount_same_related_person loan_limit_same_related_person)
        (<= loan_amount_same_related_enterprise
            loan_limit_same_related_enterprise)
        (<= other_transaction_amount_same_person
            other_transaction_limit_same_person)
        (<= other_transaction_amount_same_related_person
            other_transaction_limit_same_related_person)
        (<= other_transaction_amount_same_related_enterprise
            other_transaction_limit_same_related_enterprise))))

; [insurance:internal_control_and_audit_established] 保險業應建立內部控制及稽核制度
(assert (= internal_control_and_audit_established internal_control_established))

; [insurance:internal_handling_system_established] 保險業應建立內部處理制度及程序
(assert (= internal_handling_system_established internal_handling_established))

; [insurance:capital_level_classification] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (ite (and (<= 150.0 CAR) (not (<= 200.0 CAR)))
                2
                (ite (<= 200.0 CAR) 1 0))))
(let ((a!2 (ite (and (<= 50.0 CAR)
                     (not (<= 150.0 CAR))
                     (<= 0.0 NWR)
                     (not (<= 2.0 NWR)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 50.0 CAR)) (not (<= 0.0 net_worth))) 4 a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級(4)應完成增資、財務或業務改善計畫或合併
(assert (= capital_level_4_measures_executed capital_level_4_measures_completed))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且未改善
(assert (= financial_or_business_deterioration
   (and improvement_plan_submitted
        improvement_plan_approved
        (or loss_accelerated net_worth_deteriorated)
        (not improvement_plan_effective))))

; [insurance:supervision_or_takeover_required] 資本嚴重不足且未完成改善計畫或財務業務惡化者應為監管、接管、勒令停業清理或解散處分
(assert (let ((a!1 (or (and (= 4 capital_level) (not capital_level_4_measures_executed))
               (and (not (= 4 capital_level))
                    financial_or_business_deterioration))))
  (= supervision_or_takeover_required a!1)))

; [insurance:internal_control_and_handling_compliance] 保險業建立內部控制及稽核制度且內部處理制度及程序
(assert (= internal_control_and_handling_compliance
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed)))

; [insurance:violation_of_internal_control_or_handling] 違反內部控制或內部處理制度規定
(assert (= violation_of_internal_control_or_handling
   (or (not internal_control_and_audit_established)
       (not internal_handling_system_established))))

; [insurance:loan_and_other_transaction_limit_violation] 違反放款或其他交易限額規定
(assert (not (= loan_and_other_transaction_limit_compliance
        loan_and_other_transaction_limit_violation)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反放款或其他交易限額、違反內部控制或內部處理制度，或資本嚴重不足且未完成改善計畫，或財務業務惡化未改善時處罰
(assert (let ((a!1 (or loan_and_other_transaction_limit_violation
               violation_of_internal_control_or_handling
               (and (= 4 capital_level) (not capital_level_4_measures_executed))
               (and (not (= 4 capital_level))
                    financial_or_business_deterioration))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= CAR 100.0))
(assert (= NWR 1.0))
(assert (= net_worth 100.0))
(assert (= blood_relation_degree 3))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level_4_measures_executed false))
(assert (= company_law_related_enterprise false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_effective false))
(assert (= improvement_plan_submitted false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_control_and_handling_compliance false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_system_established false))
(assert (= is_responsible_person_of_business false))
(assert (= is_self false))
(assert (= is_spouse false))
(assert (= loan_amount_same_person 0.0))
(assert (= loan_amount_same_related_enterprise 0.0))
(assert (= loan_amount_same_related_person 0.0))
(assert (= loan_and_other_transaction_limit_compliance false))
(assert (= loan_and_other_transaction_limit_violation true))
(assert (= loan_limit_same_person 0.0))
(assert (= loan_limit_same_related_enterprise 0.0))
(assert (= loan_limit_same_related_person 0.0))
(assert (= loss_accelerated false))
(assert (= net_worth_deteriorated false))
(assert (= other_transaction_amount_same_person 0.0))
(assert (= other_transaction_amount_same_related_enterprise 0.0))
(assert (= other_transaction_amount_same_related_person 0.0))
(assert (= other_transaction_limit_same_person 0.0))
(assert (= other_transaction_limit_same_related_enterprise 0.0))
(assert (= other_transaction_limit_same_related_person 0.0))
(assert (= penalty true))
(assert (= person_type 1))
(assert (= same_person true))
(assert (= same_related_enterprise false))
(assert (= same_related_person false))
(assert (= supervision_or_takeover_required false))
(assert (= violation_of_internal_control_or_handling true))
(assert (= capital_level 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 45
; Total facts: 45
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
