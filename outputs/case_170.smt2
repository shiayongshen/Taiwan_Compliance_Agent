; SMT2 file generated from compliance case automatic
; Case ID: case_170
; Generated at: 2025-10-21T03:48:31.131246
;
; This file can be executed with Z3:
;   z3 case_170.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const enter_major_contract Bool)
(declare-const exceed_payment_limit Bool)
(declare-const financial_deterioration Bool)
(declare-const financial_deterioration_noncompliance Bool)
(declare-const improvement_plan_approved Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_acts Bool)
(declare-const penalty Bool)
(declare-const prohibited_actions_without_consent Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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

; [insurance:internal_control_ok] 建立並執行內部控制及稽核制度
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立並執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level) (not capital_level_4_measures_completed))))

; [insurance:financial_deterioration_noncompliance] 財務或業務狀況顯著惡化且未提出或未核定改善計畫
(assert (= financial_deterioration_noncompliance
   (and financial_deterioration (not improvement_plan_approved))))

; [insurance:prohibited_actions_without_supervisor_consent] 監管處分期間未經監管人同意從事限制行為
(assert (= prohibited_actions_without_consent
   (or enter_major_contract exceed_payment_limit other_major_financial_acts)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制或內部處理制度規定，或資本嚴重不足未完成改善，或財務惡化未核定改善計畫，或監管期間未經同意從事限制行為時處罰
(assert (= penalty
   (or capital_level_4_noncompliance
       prohibited_actions_without_consent
       financial_deterioration_noncompliance
       (not internal_handling_ok)
       (not internal_control_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_level 3))
(assert (= capital_level_4_measures_completed false))
(assert (= enter_major_contract false))
(assert (= exceed_payment_limit false))
(assert (= other_major_financial_acts false))
(assert (= financial_deterioration true))
(assert (= improvement_plan_approved false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= penalty true))
(assert (= prohibited_actions_without_consent false))
(assert (= financial_deterioration_noncompliance true))
(assert (= internal_control_ok false))
(assert (= internal_handling_ok false))
(assert (= capital_level_4_noncompliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 20
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
