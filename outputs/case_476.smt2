; SMT2 file generated from compliance case automatic
; Case ID: case_476
; Generated at: 2025-10-22T19:55:42.496679
;
; This file can be executed with Z3:
;   z3 case_476.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const affect_normal_business_execution Bool)
(declare-const penalty Bool)
(declare-const penalty_according_to_article_66 Bool)
(declare-const penalty_imposed Bool)
(declare-const remove_duty_ordered Bool)
(declare-const remove_duty_ordered_flag Bool)
(declare-const stop_business_ordered Bool)
(declare-const stop_business_within_one_year_ordered Bool)
(declare-const violate_law_or_related_regulations Bool)
(declare-const violation_found Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_found] 證券商董事、監察人及受僱人違反法令且影響業務正常執行
(assert (= violation_found
   (and violate_law_or_related_regulations affect_normal_business_execution)))

; [securities:stop_business_ordered] 主管機關命令停止一年以下業務執行
(assert (= stop_business_ordered
   (and violation_found stop_business_within_one_year_ordered)))

; [securities:remove_duty_ordered] 主管機關命令解除職務
(assert (= remove_duty_ordered (and violation_found remove_duty_ordered_flag)))

; [securities:penalty_imposed] 依第六十六條規定對證券商處分
(assert (= penalty_imposed (and violation_found penalty_according_to_article_66)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令且影響業務正常執行時處罰
(assert (= penalty violation_found))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_law_or_related_regulations true))
(assert (= affect_normal_business_execution true))
(assert (= violation_found true))
(assert (= remove_duty_ordered_flag true))
(assert (= remove_duty_ordered true))
(assert (= stop_business_within_one_year_ordered true))
(assert (= stop_business_ordered true))
(assert (= penalty_according_to_article_66 false))
(assert (= penalty_imposed false))
(assert (= penalty true))

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
