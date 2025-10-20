; SMT2 file generated from compliance case automatic
; Case ID: case_476
; Generated at: 2025-10-19T16:49:54.321903
;
; This file can be executed with Z3:
;   z3 case_476.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const affects_normal_operations Bool)
(declare-const officer_removed Bool)
(declare-const penalty Bool)
(declare-const penalty_according_to_article_66 Bool)
(declare-const penalty_imposed Bool)
(declare-const remove_officer_ordered Bool)
(declare-const stop_business_ordered Bool)
(declare-const stop_business_within_one_year Bool)
(declare-const violation_found Bool)
(declare-const violation_of_law Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_found] 證券商董事、監察人及受僱人違反法令且影響業務正常執行
(assert (= violation_found (and violation_of_law affects_normal_operations)))

; [securities:stop_business_ordered] 主管機關命令停止一年以下業務執行
(assert (= stop_business_ordered stop_business_within_one_year))

; [securities:remove_officer_ordered] 主管機關命令解除職務
(assert (= remove_officer_ordered officer_removed))

; [securities:penalty_imposed] 依第六十六條規定對證券商處分
(assert (= penalty_imposed penalty_according_to_article_66))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令且影響業務正常執行時處罰
(assert (= penalty (and violation_found penalty_imposed)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_of_law true))
(assert (= affects_normal_operations true))
(assert (= officer_removed true))
(assert (= stop_business_within_one_year true))
(assert (= penalty_according_to_article_66 false))
(assert (= penalty false))
(assert (= penalty_imposed false))
(assert (= remove_officer_ordered false))
(assert (= stop_business_ordered false))
(assert (= violation_found false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 10
; Total facts: 10
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
