; SMT2 file generated from compliance case automatic
; Case ID: case_329
; Generated at: 2025-10-21T07:26:20.046568
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
(declare-const capital_level_2_measures_completed Bool)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const company_law_related_enterprise Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const is_responsible_person_of_enterprise Bool)
(declare-const is_self Bool)
(declare-const is_spouse Bool)
(declare-const loan_and_other_transaction_limit Real)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const non_loan_transaction_limit Real)
(declare-const penalty Bool)
(declare-const person_type Int)
(declare-const regulatory_limit_non_loan_set Bool)
(declare-const regulatory_limit_set Bool)
(declare-const same_person Bool)
(declare-const same_related_enterprise Bool)
(declare-const same_related_person Bool)
(declare-const supervision_imposed Bool)
(declare-const supervision_restriction Bool)
(declare-const violation_internal_control_penalty Bool)
(declare-const violation_internal_handling_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:same_person_definition] 同一人定義為同一自然人或同一法人
(assert (= same_person (or (= 1 person_type) (= 2 person_type))))

; [insurance:same_related_person_definition] 同一關係人定義包含本人、配偶、二親等以內血親及以本人或配偶為負責人之事業
(assert (= same_related_person
   (or (>= 2 blood_relation_degree)
       is_self
       is_responsible_person_of_enterprise
       is_spouse)))

; [insurance:same_related_enterprise_definition] 同一關係企業範圍適用公司法相關條文
(assert (= same_related_enterprise company_law_related_enterprise))

; [insurance:loan_and_other_transaction_limit] 主管機關得限制保險業對同一人、同一關係人或同一關係企業之放款或其他交易
(assert (= loan_and_other_transaction_limit (ite regulatory_limit_set 1.0 0.0)))

; [insurance:non_loan_transaction_limit] 主管機關得限制保險業與利害關係人從事放款以外之其他交易
(assert (= non_loan_transaction_limit (ite regulatory_limit_non_loan_set 1.0 0.0)))

; [insurance:internal_control_and_audit_established] 保險業應建立內部控制及稽核制度
(assert (= internal_control_and_audit_established internal_control_established))

; [insurance:internal_handling_system_established] 保險業應建立資產品質評估、準備金提存、逾期放款、催收款清理、呆帳轉銷及保單招攬核保理賠之內部處理制度及程序
(assert (= internal_handling_system_established internal_handling_established))

; [insurance:violation_internal_control_penalty] 違反內部控制或稽核制度規定處罰
(assert (= violation_internal_control_penalty
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violation_internal_handling_penalty] 違反內部處理制度或程序規定處罰
(assert (= violation_internal_handling_penalty
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著惡化, 4=嚴重不足）
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
(let ((a!3 (ite (and (not (<= 50.0 capital_adequacy_ratio))
                     (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級4應完成增資、財務或業務改善計畫或合併
(assert (= capital_level_4_measures_executed capital_level_4_measures_completed))

; [insurance:capital_level_3_measures_executed] 資本顯著惡化等級3應完成主管機關核定之財務或業務改善計畫
(assert (= capital_level_3_measures_executed capital_level_3_measures_completed))

; [insurance:capital_level_2_measures_executed] 資本不足等級2應完成主管機關核定之財務或業務改善計畫
(assert (= capital_level_2_measures_executed capital_level_2_measures_completed))

; [insurance:supervision_restriction] 主管機關對保險業監管處分限制營業或資金運用範圍等
(assert (= supervision_restriction supervision_imposed))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反內部控制、內部處理制度或資本不足且未完成改善計畫時處罰
(assert (= penalty
   (or (and (= 2 capital_level) (not capital_level_2_measures_executed))
       violation_internal_handling_penalty
       (and (= 3 capital_level) (not capital_level_3_measures_executed))
       violation_internal_control_penalty
       (and (= 4 capital_level) (not capital_level_4_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= blood_relation_degree 3))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 1000000.0))
(assert (= net_worth_ratio 3.0))
(assert (= capital_level_2_measures_completed false))
(assert (= capital_level_3_measures_completed false))
(assert (= capital_level_4_measures_completed false))
(assert (= company_law_related_enterprise true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= is_responsible_person_of_enterprise false))
(assert (= is_self false))
(assert (= is_spouse false))
(assert (= regulatory_limit_non_loan_set false))
(assert (= regulatory_limit_set false))
(assert (= same_person false))
(assert (= same_related_enterprise true))
(assert (= same_related_person false))
(assert (= person_type 1))
(assert (= supervision_imposed true))
(assert (= violation_internal_control_penalty true))
(assert (= violation_internal_handling_penalty true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 34
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
