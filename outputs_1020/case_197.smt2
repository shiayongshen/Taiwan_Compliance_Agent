; SMT2 file generated from compliance case automatic
; Case ID: case_197
; Generated at: 2025-10-19T10:13:14.274116
;
; This file can be executed with Z3:
;   z3 case_197.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration Bool)
(declare-const accelerated_deterioration_flag Bool)
(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_improvement_plan_completed Bool)
(declare-const capital_improvement_plan_submitted Bool)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_insufficient_measures_taken Bool)
(declare-const capital_insufficient_penalty_condition Bool)
(declare-const capital_insufficient_plan_completed Bool)
(declare-const capital_insufficient_plan_submitted Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_taken Bool)
(declare-const capital_significantly_insufficient_measures_taken Bool)
(declare-const financial_deterioration_condition Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const severely_insufficient_measures_executed Bool)
(declare-const significantly_insufficient_measures_executed Bool)
(declare-const supervisory_measures_applicable Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (<= 150.0 capital_adequacy_ratio)
               (and (not (<= 200.0 capital_adequacy_ratio))
                    (<= 2.0 net_worth_ratio)))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                (ite a!1 2 (ite (<= 200.0 capital_adequacy_ratio) 1 0)))))
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_corrected] 保險業資本等級分類修正，依保險業資本適足率及淨值比率判斷
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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_final] 保險業資本等級依低等級原則決定
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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_insufficient_plan_submitted] 資本嚴重不足且已依主管機關規定期限完成增資、財務或業務改善計畫或合併
(assert (= capital_insufficient_plan_submitted
   (and (= 4 capital_level) capital_improvement_plan_submitted)))

; [insurance:capital_insufficient_plan_completed] 資本嚴重不足且已依主管機關規定期限完成增資、財務或業務改善計畫或合併
(assert (= capital_insufficient_plan_completed
   (and (= 4 capital_level) capital_improvement_plan_completed)))

; [insurance:capital_insufficient_penalty_condition] 資本嚴重不足且未依主管機關規定期限完成增資、財務或業務改善計畫或合併
(assert (= capital_insufficient_penalty_condition
   (and (= 4 capital_level)
        (or (not capital_improvement_plan_completed)
            (not capital_improvement_plan_submitted)))))

; [insurance:financial_deterioration_condition] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_deterioration_condition
   (or risk_to_insured_interest cannot_fulfill_contract cannot_pay_debt)))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_submitted))

; [insurance:accelerated_deterioration] 損益、淨值呈現加速惡化或經輔導仍未改善
(assert (= accelerated_deterioration accelerated_deterioration_flag))

; [insurance:supervisory_measures_applicable] 主管機關得依情節輕重為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_applicable
   (and improvement_plan_approved accelerated_deterioration)))

; [insurance:capital_insufficient_measures_taken] 資本不足者採取主管機關規定之措施
(assert (= capital_insufficient_measures_taken
   (or (not capital_insufficient_penalty_condition)
       capital_insufficient_plan_submitted
       capital_insufficient_plan_completed)))

; [insurance:capital_significantly_insufficient_measures_taken] 資本顯著不足者採取主管機關規定之措施
(assert (= capital_significantly_insufficient_measures_taken
   (and (= 3 capital_level) significantly_insufficient_measures_executed)))

; [insurance:capital_severely_insufficient_measures_taken] 資本嚴重不足者採取主管機關規定之措施
(assert (= capital_severely_insufficient_measures_taken
   (and (= 4 capital_level) severely_insufficient_measures_executed)))

; [insurance:capital_insufficient_measures_executed] 資本不足者採取主管機關規定之措施
(assert (= capital_insufficient_measures_executed
   (and (= 2 capital_level)
        improvement_plan_submitted
        improvement_plan_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未依規定完成增資或改善計畫，或資本不足等級未採取對應措施時處罰
(assert (let ((a!1 (or (and (= 2 capital_level)
                    (not capital_insufficient_measures_executed))
               (and (= 4 capital_level)
                    (or (not capital_insufficient_plan_completed)
                        (not capital_insufficient_plan_submitted)))
               (and (= 3 capital_level)
                    (not significantly_insufficient_measures_executed))
               (and (= 4 capital_level)
                    (not severely_insufficient_measures_executed)))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio (/ 5.0 2.0)))
(assert (= capital_improvement_plan_submitted true))
(assert (= capital_improvement_plan_completed false))
(assert (= severely_insufficient_measures_executed false))
(assert (= capital_level 1))
(assert (= penalty true))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_executed false))
(assert (= accelerated_deterioration_flag false))
(assert (= accelerated_deterioration false))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_interest false))
(assert (= financial_deterioration_condition false))
(assert (= capital_insufficient_plan_submitted false))
(assert (= capital_insufficient_plan_completed false))
(assert (= capital_insufficient_penalty_condition false))
(assert (= capital_insufficient_measures_taken false))
(assert (= capital_significantly_insufficient_measures_taken false))
(assert (= capital_severely_insufficient_measures_taken false))
(assert (= capital_insufficient_measures_executed false))
(assert (= improvement_plan_approved true))
(assert (= supervisory_measures_applicable false))
(assert (= significantly_insufficient_measures_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 26
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
