; SMT2 file generated from compliance case automatic
; Case ID: case_109
; Generated at: 2025-10-21T01:54:13.440250
;
; This file can be executed with Z3:
;   z3 case_109.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const blood_relation_degree Int)
(declare-const board_meeting_approval_ratio Real)
(declare-const board_meeting_attendance_ratio Real)
(declare-const board_member_conflict_of_interest_vote Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_completed Bool)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const company_law_related_enterprise Bool)
(declare-const contract_or_major_commitment_exceeded Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_executed Bool)
(declare-const internal_control_and_handling_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const is_responsible_person_of_business Bool)
(declare-const is_self Bool)
(declare-const is_spouse Bool)
(declare-const loan_amount_same_person Real)
(declare-const loan_amount_same_related_enterprise Real)
(declare-const loan_amount_same_related_person Real)
(declare-const loan_and_other_transaction_limit_compliance Bool)
(declare-const loan_limit_same_person Real)
(declare-const loan_limit_same_related_enterprise Real)
(declare-const loan_limit_same_related_person Real)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_impact_violated Bool)
(declare-const other_transaction_amount_same_person Real)
(declare-const other_transaction_amount_same_related_enterprise Real)
(declare-const other_transaction_amount_same_related_person Real)
(declare-const other_transaction_condition Bool)
(declare-const other_transaction_condition_compliance Bool)
(declare-const other_transaction_condition_standard Bool)
(declare-const other_transaction_limit_same_person Real)
(declare-const other_transaction_limit_same_related_enterprise Real)
(declare-const other_transaction_limit_same_related_person Real)
(declare-const payment_limit Real)
(declare-const penalty Bool)
(declare-const person_type Int)
(declare-const same_person Bool)
(declare-const same_related_enterprise Bool)
(declare-const same_related_person Bool)
(declare-const supervision_payment_limit Real)
(declare-const supervision_restriction_compliance Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:same_person_definition] 同一人定義為同一自然人或同一法人
(assert (= same_person (or (= 1 person_type) (= 2 person_type))))

; [insurance:same_related_person_definition] 同一關係人定義包含本人、配偶、二親等以內血親及以本人或配偶為負責人之事業
(assert (= same_related_person
   (or is_self
       (>= 2 blood_relation_degree)
       is_spouse
       is_responsible_person_of_business)))

; [insurance:same_related_enterprise_definition] 同一關係企業範圍依公司法相關條文規定
(assert (= same_related_enterprise company_law_related_enterprise))

; [insurance:loan_and_other_transaction_limit_compliance] 保險業對同一人、同一關係人或同一關係企業之放款或其他交易符合主管機關限制規定
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

; [insurance:other_transaction_condition_compliance] 保險業與利害關係人從事放款以外其他交易符合條件及決議程序
(assert (= other_transaction_condition_compliance
   (and (or (not other_transaction_condition)
            other_transaction_condition_standard)
        (<= (/ 6667.0 10000.0) board_meeting_attendance_ratio)
        (<= (/ 3.0 4.0) board_meeting_approval_ratio)
        (not board_member_conflict_of_interest_vote))))

; [insurance:internal_control_and_audit_established] 保險業建立內部控制及稽核制度
(assert (= internal_control_and_audit_established internal_control_established))

; [insurance:internal_control_and_audit_executed] 保險業執行內部控制及稽核制度
(assert (= internal_control_and_audit_executed internal_control_executed))

; [insurance:internal_handling_system_established] 保險業建立內部處理制度及程序
(assert (= internal_handling_system_established internal_handling_established))

; [insurance:internal_handling_system_executed] 保險業執行內部處理制度及程序
(assert (= internal_handling_system_executed internal_handling_executed))

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

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級(4)應執行之增資、財務或業務改善計畫已完成
(assert (= capital_level_4_measures_executed capital_level_4_measures_completed))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級(3)應執行之改善計畫已完成
(assert (= capital_level_3_measures_executed capital_level_3_measures_completed))

; [insurance:capital_level_2_measures_executed] 資本不足等級(2)應執行之改善計畫已完成
(assert (= capital_level_2_measures_executed capital_level_2_measures_completed))

; [insurance:supervision_restriction_compliance] 保險業監管處分期間遵守主管機關規定之限制
(assert (= supervision_restriction_compliance
   (and (<= payment_limit supervision_payment_limit)
        (not contract_or_major_commitment_exceeded)
        (not other_major_financial_impact_violated))))

; [insurance:internal_control_and_handling_compliance] 保險業建立並執行內部控制、稽核及內部處理制度及程序
(assert (= internal_control_and_handling_compliance
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反放款及其他交易限額、內部控制及稽核制度、內部處理制度或資本不足等規定時處罰
(assert (= penalty
   (or (not internal_handling_system_established)
       (and (= 4 capital_level) (not capital_level_4_measures_executed))
       (and (= 3 capital_level) (not capital_level_3_measures_executed))
       (not loan_and_other_transaction_limit_compliance)
       (and (= 2 capital_level) (not capital_level_2_measures_executed))
       (not internal_control_and_audit_established)
       (not internal_control_and_audit_executed)
       (not internal_handling_system_executed)
       (not other_transaction_condition_compliance)
       (not supervision_restriction_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= person_type 1))
(assert (= same_person true))
(assert (= is_self true))
(assert (= is_spouse false))
(assert (= blood_relation_degree 3))
(assert (= is_responsible_person_of_business false))
(assert (= company_law_related_enterprise false))
(assert (= loan_amount_same_person 4000000000))
(assert (= loan_limit_same_person 3000000000))
(assert (= loan_amount_same_related_person 0))
(assert (= loan_limit_same_related_person 0))
(assert (= loan_amount_same_related_enterprise 0))
(assert (= loan_limit_same_related_enterprise 0))
(assert (= other_transaction_amount_same_person 100000000))
(assert (= other_transaction_limit_same_person 50000000))
(assert (= other_transaction_amount_same_related_person 0))
(assert (= other_transaction_limit_same_related_person 0))
(assert (= other_transaction_amount_same_related_enterprise 0))
(assert (= other_transaction_limit_same_related_enterprise 0))
(assert (= other_transaction_condition false))
(assert (= other_transaction_condition_standard false))
(assert (= board_meeting_attendance_ratio (/ 1.0 2.0)))
(assert (= board_meeting_approval_ratio (/ 3.0 5.0)))
(assert (= board_member_conflict_of_interest_vote true))
(assert (= capital_adequacy_ratio 140.0))
(assert (= net_worth 1000000000))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_level_2_measures_completed false))
(assert (= capital_level_3_measures_completed false))
(assert (= capital_level_4_measures_completed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= contract_or_major_commitment_exceeded true))
(assert (= other_major_financial_impact_violated true))
(assert (= payment_limit 3200000))
(assert (= supervision_payment_limit 2000000))
(assert (= supervision_restriction_compliance false))

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
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
