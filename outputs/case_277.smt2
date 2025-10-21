; SMT2 file generated from compliance case automatic
; Case ID: case_277
; Generated at: 2025-10-21T06:11:14.318906
;
; This file can be executed with Z3:
;   z3 case_277.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const association_rules_approved Bool)
(declare-const association_rules_reported_and_approved Bool)
(declare-const handling_follow_association_rules Bool)
(declare-const improvement_deadline_set Bool)
(declare-const improvement_ordered Bool)
(declare-const license_revoked Bool)
(declare-const officer_dismissed Bool)
(declare-const other_measures_taken Bool)
(declare-const penalty Bool)
(declare-const penalty_dismiss_officer Bool)
(declare-const penalty_license_revocation Bool)
(declare-const penalty_other_measures Bool)
(declare-const penalty_suspension Bool)
(declare-const penalty_warning Bool)
(declare-const penalty_warning_issued Bool)
(declare-const securities_law_violated Bool)
(declare-const stabilizing_operations_allowed Bool)
(declare-const stabilizing_operations_permitted Bool)
(declare-const stabilizing_operations_rules_approved Bool)
(declare-const stabilizing_operations_rules_reported_and_approved Bool)
(declare-const suspension_months Int)
(declare-const underwriting_fair_and_reasonable Bool)
(declare-const underwriting_fee_compensated_otherwise Bool)
(declare-const underwriting_fee_no_other_compensation Bool)
(declare-const underwriting_handling_follow_association Bool)
(declare-const underwriting_method_fair_and_reasonable Bool)
(declare-const violation Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation] 證券商違反證券交易法或依本法發布之命令
(assert (= violation securities_law_violated))

; [securities:penalty_warning] 主管機關得對違反者警告
(assert (= penalty_warning (and violation penalty_warning_issued)))

; [securities:penalty_dismiss_officer] 主管機關得命證券商解除董事、監察人或經理人職務
(assert (= penalty_dismiss_officer (and violation officer_dismissed)))

; [securities:penalty_suspension] 主管機關得對公司或分支機構就其所營業務全部或一部為六個月以內之停業
(assert (let ((a!1 (and violation
                (>= 6.0 (to_real suspension_months))
                (not (<= (to_real suspension_months) 0.0)))))
  (= penalty_suspension a!1)))

; [securities:penalty_license_revocation] 主管機關得對公司或分支機構營業許可之撤銷或廢止
(assert (= penalty_license_revocation (and violation license_revoked)))

; [securities:penalty_other_measures] 主管機關得採取其他必要之處置
(assert (= penalty_other_measures (and violation other_measures_taken)))

; [securities:improvement_ordered] 主管機關得命證券商限期改善
(assert (= improvement_ordered (and violation improvement_deadline_set)))

; [securities:underwriting_fair_and_reasonable] 證券商承銷有價證券應以公平合理方式進行
(assert (= underwriting_fair_and_reasonable underwriting_method_fair_and_reasonable))

; [securities:underwriting_fee_no_other_compensation] 承銷手續費不得以其他方式或名目補償或退還予發行人或其關係人或指定人
(assert (not (= underwriting_fee_compensated_otherwise
        underwriting_fee_no_other_compensation)))

; [securities:underwriting_handling_follow_association] 承銷或再行銷售應依證券商同業公會訂定之處理辦法處理
(assert (= underwriting_handling_follow_association handling_follow_association_rules))

; [securities:association_rules_approved] 證券商同業公會訂定之處理辦法應函報本會核定
(assert (= association_rules_approved association_rules_reported_and_approved))

; [securities:stabilizing_operations_allowed] 證券商辦理上市有價證券承銷或再行銷售得視必要進行安定操作交易
(assert (= stabilizing_operations_allowed stabilizing_operations_permitted))

; [securities:stabilizing_operations_rules_approved] 安定操作交易管理辦法由證券交易所訂定並應函報本會核定
(assert (= stabilizing_operations_rules_approved
   stabilizing_operations_rules_reported_and_approved))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：證券商違反證券交易法或命令時，主管機關得依情節輕重採取處分
(assert (= penalty
   (or penalty_license_revocation
       penalty_dismiss_officer
       penalty_suspension
       penalty_warning
       penalty_other_measures)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation true))
(assert (= securities_law_violated true))
(assert (= penalty_suspension true))
(assert (= suspension_months 3))
(assert (= penalty_warning_issued false))
(assert (= penalty_warning false))
(assert (= penalty_dismiss_officer false))
(assert (= officer_dismissed false))
(assert (= penalty_license_revocation false))
(assert (= license_revoked false))
(assert (= penalty_other_measures false))
(assert (= other_measures_taken false))
(assert (= improvement_deadline_set false))
(assert (= improvement_ordered false))
(assert (= underwriting_method_fair_and_reasonable false))
(assert (= underwriting_fair_and_reasonable false))
(assert (= underwriting_fee_compensated_otherwise false))
(assert (= underwriting_fee_no_other_compensation true))
(assert (= handling_follow_association_rules false))
(assert (= underwriting_handling_follow_association false))
(assert (= association_rules_reported_and_approved false))
(assert (= association_rules_approved false))
(assert (= stabilizing_operations_permitted false))
(assert (= stabilizing_operations_allowed false))
(assert (= stabilizing_operations_rules_reported_and_approved false))
(assert (= stabilizing_operations_rules_approved false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 27
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
