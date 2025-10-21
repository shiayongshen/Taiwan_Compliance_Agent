; SMT2 file generated from compliance case automatic
; Case ID: case_476
; Generated at: 2025-10-21T10:31:17.566650
;
; This file can be executed with Z3:
;   z3 case_476.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const director_violation Bool)
(declare-const order_dismiss_officer Bool)
(declare-const order_stop_business_within_one_year Bool)
(declare-const penalty Bool)
(declare-const penalty_according_to_article_66 Bool)
(declare-const penalty_imposed Bool)
(declare-const supervisor_order_stop_or_dismiss Bool)
(declare-const violation_affects_business Bool)
(declare-const violation_affects_normal_business Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_affects_business] 董事、監察人及受僱人違反法令且影響證券業務正常執行
(assert (= violation_affects_business
   (and director_violation violation_affects_normal_business)))

; [securities:supervisor_order_stop_or_dismiss] 主管機關得命令停止一年以下業務或解除職務
(assert (= supervisor_order_stop_or_dismiss
   (or order_stop_business_within_one_year order_dismiss_officer)))

; [securities:penalty_imposed] 依情節輕重對證券商處以第六十六條所定處分
(assert (= penalty_imposed
   (and violation_affects_business penalty_according_to_article_66)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令且影響業務正常執行，且未依規定處分時處罰
(assert (= penalty (and violation_affects_business (not penalty_imposed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= director_violation true))
(assert (= violation_affects_normal_business true))
(assert (= order_dismiss_officer true))
(assert (= order_stop_business_within_one_year true))
(assert (= penalty_according_to_article_66 true))
(assert (= violation_affects_business true))
(assert (= penalty_imposed true))
(assert (= supervisor_order_stop_or_dismiss true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 5
; Total variables: 9
; Total facts: 9
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
