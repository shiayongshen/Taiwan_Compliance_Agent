; SMT2 file generated from compliance case automatic
; Case ID: case_159
; Generated at: 2025-10-19T09:36:22.797206
;
; This file can be executed with Z3:
;   z3 case_159.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const branch_restriction_enforced Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_ok Bool)
(declare-const capital_insufficient_penalty_condition Bool)
(declare-const capital_level Int)
(declare-const capital_level_lowest Int)
(declare-const capital_severely_insufficient_measures_ok Bool)
(declare-const capital_severely_insufficient_penalty_condition Bool)
(declare-const capital_significantly_insufficient_measures_ok Bool)
(declare-const capital_significantly_insufficient_penalty_condition Bool)
(declare-const credit_restriction_enforced Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const responsible_person_avg_pay_after_reduction Real)
(declare-const responsible_person_avg_pay_before_reduction Real)
(declare-const responsible_person_duty_suspended Bool)
(declare-const responsible_person_registration_cancelled Bool)
(declare-const responsible_person_removed Bool)
(declare-const special_asset_approval_obtained Bool)
(declare-const special_asset_disposed Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_article_148_1_2 Bool)
(declare-const violate_article_148_2_1 Bool)
(declare-const violate_article_148_2_2 Bool)
(declare-const violate_article_148_3_1 Bool)
(declare-const violate_article_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))
               (and (not (<= 2.0 net_worth_ratio)) (<= 0.0 net_worth_ratio))))
      (a!2 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                (ite a!1 3 a!2))))
  (= capital_level a!3))))

; [insurance:capital_level_lowest] 資本等級以較低等級為準（同時符合多等級時）
(assert (let ((a!1 (ite (= 3 capital_level)
                3
                (ite (= 2 capital_level) 2 (ite (= 1 capital_level) 1 0)))))
  (= capital_level_lowest (ite (= 4 capital_level) 4 a!1))))

; [insurance:capital_insufficient_measures_ok] 資本不足等級措施執行完成
(assert (= capital_insufficient_measures_ok
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:capital_significantly_insufficient_measures_ok] 資本顯著不足等級措施執行完成
(assert (= capital_significantly_insufficient_measures_ok
   (and capital_insufficient_measures_ok
        responsible_person_removed
        responsible_person_registration_cancelled
        responsible_person_duty_suspended
        special_asset_approval_obtained
        special_asset_disposed
        credit_restriction_enforced
        (>= (/ responsible_person_avg_pay_after_reduction
               responsible_person_avg_pay_before_reduction)
            (/ 7.0 10.0))
        branch_restriction_enforced)))

; [insurance:capital_severely_insufficient_measures_ok] 資本嚴重不足等級措施執行完成
(assert (= capital_severely_insufficient_measures_ok
   capital_significantly_insufficient_measures_ok))

; [insurance:capital_severely_insufficient_penalty_condition] 資本嚴重不足且未於期限完成增資、改善計畫或合併
(assert (= capital_severely_insufficient_penalty_condition
   (and (= 4 capital_level) (not capital_severely_insufficient_measures_ok))))

; [insurance:capital_significantly_insufficient_penalty_condition] 資本顯著不足且未執行對應措施
(assert (= capital_significantly_insufficient_penalty_condition
   (and (= 3 capital_level)
        (not capital_significantly_insufficient_measures_ok))))

; [insurance:capital_insufficient_penalty_condition] 資本不足且未執行對應措施
(assert (= capital_insufficient_penalty_condition
   (and (= 2 capital_level) (not capital_insufficient_measures_ok))))

; [insurance:violate_article_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_article_148_1_2 violate_148_1_2))

; [insurance:violate_article_148_2_1] 違反第一百四十八條之二第一項規定
(assert (= violate_article_148_2_1 violate_148_2_1))

; [insurance:violate_article_148_2_2] 違反第一百四十八條之二第二項規定
(assert (= violate_article_148_2_2 violate_148_2_2))

; [insurance:violate_article_148_3_1] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (not (= (and internal_control_established internal_control_executed)
        violate_article_148_3_1)))

; [insurance:violate_article_148_3_2] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (not (= (and internal_handling_established internal_handling_executed)
        violate_article_148_3_2)))

; [insurance:capital_insufficient_measures_penalty] 資本等級不足且未執行對應措施時處罰
(assert (= penalty
   (or (and (= 4 capital_level) (not capital_severely_insufficient_measures_ok))
       (and (= 3 capital_level)
            (not capital_significantly_insufficient_measures_ok))
       (and (= 2 capital_level) (not capital_insufficient_measures_ok)))))

; [insurance:violate_article_148_penalty] 違反第一百四十八條之一、二、三條規定時處罰
(assert (= penalty
   (or violate_article_148_1_2
       violate_article_148_2_1
       violate_article_148_2_2
       violate_article_148_3_1
       violate_article_148_3_2)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 true))
(assert (= violate_148_2_2 true))
(assert (= violate_article_148_3_1 true))
(assert (= violate_article_148_3_2 true))
(assert (= capital_adequacy_ratio 200.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio (/ 5.0 2.0)))
(assert (= capital_level 1))
(assert (= capital_level_lowest 1))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= branch_restriction_enforced false))
(assert (= credit_restriction_enforced false))
(assert (= responsible_person_removed false))
(assert (= responsible_person_registration_cancelled false))
(assert (= responsible_person_duty_suspended false))
(assert (= special_asset_approval_obtained false))
(assert (= special_asset_disposed false))
(assert (= responsible_person_avg_pay_after_reduction 0.0))
(assert (= responsible_person_avg_pay_before_reduction 0.0))
(assert (= capital_insufficient_measures_ok false))
(assert (= capital_insufficient_penalty_condition false))
(assert (= capital_severely_insufficient_measures_ok false))
(assert (= capital_severely_insufficient_penalty_condition false))
(assert (= capital_significantly_insufficient_measures_ok false))
(assert (= capital_significantly_insufficient_penalty_condition false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= penalty false))
(assert (= violate_article_148_1_2 false))
(assert (= violate_article_148_2_1 false))
(assert (= violate_article_148_2_2 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 35
; Total facts: 35
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
