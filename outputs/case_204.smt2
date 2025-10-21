; SMT2 file generated from compliance case automatic
; Case ID: case_204
; Generated at: 2025-10-21T04:29:20.355351
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
(declare-const penalty Bool)
(declare-const penalty_fine_200_to_1000 Bool)
(declare-const penalty_fine_institution Bool)
(declare-const penalty_imprison_or_fine_1500 Bool)
(declare-const penalty_officer_imprison_or_fine_1_to_15 Bool)
(declare-const repeat_violation_after_stop Bool)
(declare-const stop_or_correct_not_done Bool)
(declare-const stop_or_correct_not_done_or_repeat Bool)
(declare-const stop_or_correct_ordered Bool)
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

; [taiwan_relations:stop_or_correct_ordered] 限期命其停止或改正
(assert true)

; [taiwan_relations:stop_or_correct_not_done_or_repeat] 屆期不停止或改正，或停止後再為相同違反行為
(assert (= stop_or_correct_not_done_or_repeat
   (or stop_or_correct_not_done repeat_violation_after_stop)))

; [taiwan_relations:penalty_imprison_or_fine_1500] 屆期不停止或改正，或停止後再為相同違反行為者，處行為負責人三年以下有期徒刑、拘役或科或併科新臺幣一千五百萬元以下罰金
(assert (= penalty_imprison_or_fine_1500 stop_or_correct_not_done_or_repeat))

; [taiwan_relations:violate_ministry_order] 違反財政部依第三十六條第四項規定報請行政院核定之限制或禁止命令
(assert true)

; [taiwan_relations:penalty_officer_imprison_or_fine_1_to_15] 違反限制或禁止命令者，處行為負責人三年以下有期徒刑、拘役或科或併科新臺幣一百萬元以上一千五百萬元以下罰金
(assert (= penalty_officer_imprison_or_fine_1_to_15 violate_ministry_order))

; [taiwan_relations:penalty_fine_institution] 對金融保險證券期貨機構科罰金
(assert (= penalty_fine_institution
   (or penalty_fine_200_to_1000
       penalty_imprison_or_fine_1500
       penalty_officer_imprison_or_fine_1_to_15)))

; [taiwan_relations:applicable_outside_roc] 第一項及第二項規定於中華民國領域外犯罪者適用
(assert (= applicable_outside_roc crime_outside_roc))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第三十六條第一項或第二項規定，或違反限制命令，或未停止或改正且再違反時處罰
(assert (= penalty
   (or penalty_fine_200_to_1000
       penalty_imprison_or_fine_1500
       penalty_officer_imprison_or_fine_1_to_15)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= applicable_outside_roc false))
(assert (= crime_outside_roc false))
(assert (= penalty true))
(assert (= penalty_fine_200_to_1000 true))
(assert (= penalty_fine_institution true))
(assert (= penalty_imprison_or_fine_1500 false))
(assert (= penalty_officer_imprison_or_fine_1_to_15 false))
(assert (= repeat_violation_after_stop false))
(assert (= stop_or_correct_not_done false))
(assert (= stop_or_correct_not_done_or_repeat false))
(assert (= stop_or_correct_ordered false))
(assert (= violate_article_36_1 true))
(assert (= violate_article_36_1_or_2 true))
(assert (= violate_article_36_2 false))
(assert (= violate_ministry_order false))

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
