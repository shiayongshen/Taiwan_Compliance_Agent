; SMT2 file generated from compliance case automatic
; Case ID: case_201
; Generated at: 2025-10-19T10:19:38.783294
;
; This file can be executed with Z3:
;   z3 case_201.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration Bool)
(declare-const accelerated_deterioration_and_no_improvement Bool)
(declare-const business_improvement_plan_completed Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const financial_improvement_plan_completed Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const financial_or_business_deterioration_flag Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio_prev1 Real)
(declare-const net_worth_ratio_prev2 Real)
(declare-const penalty Bool)
(declare-const penalty_148_1_violation Bool)
(declare-const penalty_148_2_1_violation Bool)
(declare-const penalty_148_2_2_violation Bool)
(declare-const penalty_148_3_1_violation Bool)
(declare-const penalty_148_3_2_violation Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const serious_insufficient_and_no_improvement Bool)
(declare-const supervisory_measures_applicable Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const violate_148_1 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (or (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio_prev1))
                    (not (<= 3.0 net_worth_ratio_prev2))
                    (or (<= 2.0 net_worth_ratio_prev1)
                        (<= 2.0 net_worth_ratio_prev2)))))
      (a!2 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 2.0 net_worth_ratio_prev1))
                    (not (<= 2.0 net_worth_ratio_prev2))
                    (<= 0.0 net_worth_ratio_prev1)))))
(let ((a!3 (ite a!1 3 (ite a!2 2 (ite (<= 200.0 capital_adequacy_ratio) 1 0)))))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!3)))
  (= capital_level a!4)))))

; [insurance:serious_insufficient_and_no_improvement] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= serious_insufficient_and_no_improvement
   (and (= 4 capital_level)
        (not (or merger_completed
                 business_improvement_plan_completed
                 capital_increase_completed
                 financial_improvement_plan_completed)))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or unable_to_fulfill_contract
       risk_to_insured_interest
       unable_to_pay_debt
       financial_or_business_deterioration_flag)))

; [insurance:improvement_plan_required_and_approved] 主管機關已核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_submitted_and_approved))

; [insurance:accelerated_deterioration_and_no_improvement] 損益、淨值加速惡化且經輔導仍未改善
(assert (= accelerated_deterioration_and_no_improvement
   (and accelerated_deterioration (not improvement_plan_effective))))

; [insurance:supervisory_measures_applicable] 應依情節輕重為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_applicable
   (or serious_insufficient_and_no_improvement
       (and financial_or_business_deterioration
            improvement_plan_approved
            accelerated_deterioration_and_no_improvement))))

; [insurance:penalty_148_1_violation] 違反第一百四十八條之一第一項或第二項規定
(assert (= penalty_148_1_violation violate_148_1))

; [insurance:penalty_148_2_1_violation] 違反第一百四十八條之二第一項規定，未提供或提供不實說明文件
(assert (= penalty_148_2_1_violation violate_148_2_1))

; [insurance:penalty_148_2_2_violation] 違反第一百四十八條之二第二項規定，未依限報告或公開說明或內容不實
(assert (= penalty_148_2_2_violation violate_148_2_2))

; [insurance:penalty_148_3_1_violation] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= penalty_148_3_1_violation violate_148_3_1))

; [insurance:penalty_148_3_2_violation] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= penalty_148_3_2_violation violate_148_3_2))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or penalty_148_1_violation
       penalty_148_2_1_violation
       penalty_148_2_2_violation
       penalty_148_3_1_violation
       penalty_148_3_2_violation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= accelerated_deterioration false))
(assert (= business_improvement_plan_completed false))
(assert (= capital_adequacy_ratio 100.0))
(assert (= capital_increase_completed false))
(assert (= financial_improvement_plan_completed false))
(assert (= financial_or_business_deterioration false))
(assert (= financial_or_business_deterioration_flag false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_effective false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= merger_completed false))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio_prev1 100.0))
(assert (= net_worth_ratio_prev2 100.0))
(assert (= penalty true))
(assert (= penalty_148_1_violation true))
(assert (= penalty_148_2_1_violation false))
(assert (= penalty_148_2_2_violation false))
(assert (= penalty_148_3_1_violation false))
(assert (= penalty_148_3_2_violation false))
(assert (= risk_to_insured_interest true))
(assert (= serious_insufficient_and_no_improvement false))
(assert (= supervisory_measures_applicable true))
(assert (= unable_to_fulfill_contract true))
(assert (= unable_to_pay_debt false))
(assert (= violate_148_1 true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 false))
(assert (= violate_148_3_2 false))
(assert (= accelerated_deterioration_and_no_improvement false))
(assert (= capital_level 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 32
; Total facts: 32
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
