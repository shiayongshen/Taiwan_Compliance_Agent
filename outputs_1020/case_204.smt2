; SMT2 file generated from compliance case automatic
; Case ID: case_204
; Generated at: 2025-10-19T10:25:56.831032
;
; This file can be executed with Z3:
;   z3 case_204.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const applicable_outside_roc Bool)
(declare-const crime_outside_roc Bool)
(declare-const fail_to_stop Bool)
(declare-const fail_to_stop_or_repeat_violation Bool)
(declare-const order_stop_or_correct Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_200_to_1000 Bool)
(declare-const penalty_fine_for_institution Bool)
(declare-const penalty_imprisonment_or_fine_100_to_1500 Bool)
(declare-const penalty_imprisonment_or_fine_1500 Bool)
(declare-const repeat_violation Bool)
(declare-const violate_article_36_1 Bool)
(declare-const violate_article_36_1_or_2 Bool)
(declare-const violate_article_36_2 Bool)
(declare-const violate_ministry_order Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [taiwan_relations:violate_article_36_1_or_2] 違反第三十六條第一項或第二項規定
(assert (= violate_article_36_1_or_2 violate_article_36_1))

; [taiwan_relations:violate_article_36_1] 違反第三十六條第一項規定
(assert true)

; [taiwan_relations:violate_article_36_2] 違反第三十六條第二項規定
(assert true)

; [taiwan_relations:penalty_fine_200_to_1000] 違反第三十六條第一項或第二項規定者，處新臺幣二百萬元以上一千萬元以下罰鍰
(assert (= penalty_fine_200_to_1000 violate_article_36_1_or_2))

; [taiwan_relations:order_stop_or_correct] 得限期命其停止或改正
(assert (= order_stop_or_correct violate_article_36_1_or_2))

; [taiwan_relations:fail_to_stop_or_repeat_violation] 屆期不停止或改正，或停止後再為相同違反行為
(assert (= fail_to_stop_or_repeat_violation (or fail_to_stop repeat_violation)))

; [taiwan_relations:penalty_imprisonment_or_fine_1500] 處行為負責人三年以下有期徒刑、拘役或科或併科新臺幣一千五百萬元以下罰金
(assert (= penalty_imprisonment_or_fine_1500 fail_to_stop_or_repeat_violation))

; [taiwan_relations:violate_ministry_order] 違反財政部依第三十六條第四項規定報請行政院核定之限制或禁止命令
(assert true)

; [taiwan_relations:penalty_imprisonment_or_fine_100_to_1500] 處行為負責人三年以下有期徒刑、拘役或科或併科新臺幣一百萬元以上一千五百萬元以下罰金
(assert (= penalty_imprisonment_or_fine_100_to_1500 violate_ministry_order))

; [taiwan_relations:penalty_fine_for_institution] 對金融保險證券期貨機構科罰金
(assert (= penalty_fine_for_institution
   (or violate_article_36_1_or_2 violate_ministry_order)))

; [taiwan_relations:applicable_outside_roc] 第一項及第二項規定於中華民國領域外犯罪適用
(assert (= applicable_outside_roc crime_outside_roc))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第三十六條第一項或第二項規定，或違反財政部限制命令時處罰
(assert (= penalty (or violate_article_36_1_or_2 violate_ministry_order)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_article_36_1 true))
(assert (= violate_article_36_2 false))
(assert (= violate_article_36_1_or_2 true))
(assert (= violate_ministry_order false))
(assert (= penalty_fine_200_to_1000 true))
(assert (= penalty_fine_for_institution true))
(assert (= penalty_imprisonment_or_fine_100_to_1500 false))
(assert (= penalty_imprisonment_or_fine_1500 false))
(assert (= penalty true))
(assert (= order_stop_or_correct true))
(assert (= fail_to_stop false))
(assert (= fail_to_stop_or_repeat_violation false))
(assert (= repeat_violation false))
(assert (= crime_outside_roc false))
(assert (= applicable_outside_roc false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 15
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
