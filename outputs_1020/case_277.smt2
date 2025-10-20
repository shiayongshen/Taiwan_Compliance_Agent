; SMT2 file generated from compliance case automatic
; Case ID: case_277
; Generated at: 2025-10-19T11:54:38.710780
;
; This file can be executed with Z3:
;   z3 case_277.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const association_rules_reported_and_approved Bool)
(declare-const association_rules_reported_to_authority Bool)
(declare-const authority_imposes_warning Bool)
(declare-const authority_orders_dismiss_officer Bool)
(declare-const authority_orders_other_measures Bool)
(declare-const authority_orders_revoke_license Bool)
(declare-const authority_orders_suspension Bool)
(declare-const follow_association_handling_rules Bool)
(declare-const penalty Bool)
(declare-const penalty_dismiss_officer Bool)
(declare-const penalty_other_measures Bool)
(declare-const penalty_revoke_license Bool)
(declare-const penalty_suspension Bool)
(declare-const penalty_warning Bool)
(declare-const securities_law_violated Bool)
(declare-const stabilizing_operations_allowed Bool)
(declare-const stabilizing_operations_management_reported Bool)
(declare-const stabilizing_operations_management_reported_and_approved Bool)
(declare-const stabilizing_operations_permitted Bool)
(declare-const underwriting_and_resale_follow_association_rules Bool)
(declare-const underwriting_fair_and_reasonable Bool)
(declare-const underwriting_fee_compensated_by_other_means Bool)
(declare-const underwriting_fee_no_other_compensation Bool)
(declare-const underwriting_method_fair_and_reasonable Bool)
(declare-const violation Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation] 證券商違反證券交易法或依本法發布之命令
(assert (= violation securities_law_violated))

; [securities:penalty_warning] 主管機關得警告違反者
(assert (= penalty_warning (and violation authority_imposes_warning)))

; [securities:penalty_dismiss_officer] 主管機關得命證券商解除董事、監察人或經理人職務
(assert (= penalty_dismiss_officer (and violation authority_orders_dismiss_officer)))

; [securities:penalty_suspension] 主管機關得對公司或分支機構就其所營業務全部或一部停業六個月以內
(assert (= penalty_suspension (and violation authority_orders_suspension)))

; [securities:penalty_revoke_license] 主管機關得撤銷或廢止公司或分支機構營業許可
(assert (= penalty_revoke_license (and violation authority_orders_revoke_license)))

; [securities:penalty_other_measures] 主管機關得為其他必要之處置
(assert (= penalty_other_measures (and violation authority_orders_other_measures)))

; [securities:underwriting_fair_and_reasonable] 證券商承銷有價證券應以公平合理方式進行
(assert (= underwriting_fair_and_reasonable underwriting_method_fair_and_reasonable))

; [securities:underwriting_fee_no_other_compensation] 承銷手續費不得以其他方式或名目補償或退還予發行人或其關係人或指定人
(assert (not (= underwriting_fee_compensated_by_other_means
        underwriting_fee_no_other_compensation)))

; [securities:underwriting_and_resale_follow_association_rules] 承銷或再行銷售應依證券商同業公會訂定之處理辦法
(assert (= underwriting_and_resale_follow_association_rules
   follow_association_handling_rules))

; [securities:association_rules_reported_to_authority] 證券商同業公會訂定之處理辦法應函報本會核定
(assert (= association_rules_reported_to_authority
   association_rules_reported_and_approved))

; [securities:stabilizing_operations_allowed] 證券商辦理上市有價證券承銷或再行銷售得視必要進行安定操作交易
(assert (= stabilizing_operations_allowed stabilizing_operations_permitted))

; [securities:stabilizing_operations_management_reported] 安定操作交易管理辦法由證券交易所訂定並應函報本會核定
(assert (= stabilizing_operations_management_reported
   stabilizing_operations_management_reported_and_approved))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：證券商違反證券交易法或命令時，主管機關得依情節輕重處分
(assert (= penalty
   (or penalty_revoke_license
       penalty_dismiss_officer
       penalty_warning
       penalty_suspension
       penalty_other_measures)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= securities_law_violated true))
(assert (= violation true))
(assert (= authority_orders_suspension true))
(assert (= penalty_suspension true))
(assert (= authority_imposes_warning false))
(assert (= penalty_warning false))
(assert (= authority_orders_dismiss_officer false))
(assert (= penalty_dismiss_officer false))
(assert (= authority_orders_revoke_license false))
(assert (= penalty_revoke_license false))
(assert (= authority_orders_other_measures false))
(assert (= penalty_other_measures false))
(assert (= association_rules_reported_and_approved false))
(assert (= association_rules_reported_to_authority false))
(assert (= follow_association_handling_rules false))
(assert (= underwriting_method_fair_and_reasonable false))
(assert (= underwriting_fair_and_reasonable false))
(assert (= underwriting_fee_compensated_by_other_means false))
(assert (= underwriting_fee_no_other_compensation true))
(assert (= stabilizing_operations_permitted false))
(assert (= stabilizing_operations_allowed false))
(assert (= stabilizing_operations_management_reported_and_approved false))
(assert (= stabilizing_operations_management_reported false))
(assert (= penalty false))
(assert (= underwriting_and_resale_follow_association_rules false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 25
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
