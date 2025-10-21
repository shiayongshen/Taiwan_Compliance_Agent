; SMT2 file generated from compliance case automatic
; Case ID: case_453
; Generated at: 2025-10-21T22:48:19.149454
;
; This file can be executed with Z3:
;   z3 case_453.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const aml_anti_money_laundering_procedures Bool)
(declare-const aml_audit_procedures Bool)
(declare-const aml_dedicated_personnel_assigned Bool)
(declare-const aml_improvement_completed Bool)
(declare-const aml_improvement_order Bool)
(declare-const aml_improvement_order_issued Bool)
(declare-const aml_improvement_order_not_complied Bool)
(declare-const aml_inspection_refusal Bool)
(declare-const aml_inspection_refused Bool)
(declare-const aml_internal_control_compliance Bool)
(declare-const aml_internal_control_established Bool)
(declare-const aml_internal_control_executed Bool)
(declare-const aml_internal_control_implemented Bool)
(declare-const aml_other_designated_matters Bool)
(declare-const aml_regular_training Bool)
(declare-const aml_risk_assessment_report_updated Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_4_compliance Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const financial_deterioration Bool)
(declare-const financial_deterioration_with_plan_not_improved Bool)
(declare-const financial_or_business_deteriorated Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const profit_loss_net_worth_accelerated_deterioration Bool)
(declare-const prohibited_acts_without_supervisor_consent Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const supervisor_consent_contract_commitment Bool)
(declare-const supervisor_consent_other_major_financial_matters Bool)
(declare-const supervisor_consent_payment_exceed_limit Bool)
(declare-const supervisory_measures_applicable Bool)
(declare-const supervisory_measures_applied Bool)
(declare-const supervisory_measures_executed Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)

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

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level) (not capital_level_4_compliance))))

; [insurance:capital_level_4_compliance] 資本嚴重不足等級已依主管機關規定期限完成增資、財務或業務改善計畫或合併
(assert (= capital_level_4_compliance capital_level_4_measures_executed))

; [insurance:financial_deterioration] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= financial_deterioration
   (or unable_to_pay_debt
       financial_or_business_deteriorated
       unable_to_fulfill_contract
       risk_to_insured_interest)))

; [insurance:improvement_plan_submitted_and_approved] 已提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:financial_deterioration_with_plan_not_improved] 損益、淨值加速惡化或經輔導仍未改善且有前述情事之虞
(assert (= financial_deterioration_with_plan_not_improved
   (and financial_deterioration
        (or profit_loss_net_worth_accelerated_deterioration
            (not improvement_plan_effective)))))

; [insurance:supervisory_measures_applicable] 主管機關得依情節輕重為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_applicable
   (or capital_level_4_noncompliance
       financial_deterioration_with_plan_not_improved)))

; [insurance:supervisory_measures_executed] 主管機關已對保險業為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_executed supervisory_measures_applied))

; [insurance:prohibited_acts_without_supervisor_consent] 保險業監管處分時，未經監管人同意不得為禁止行為
(assert (= prohibited_acts_without_supervisor_consent
   (and (not supervisor_consent_payment_exceed_limit)
        (not supervisor_consent_contract_commitment)
        (not supervisor_consent_other_major_financial_matters))))

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= aml_internal_control_established
   (and aml_anti_money_laundering_procedures
        aml_regular_training
        aml_dedicated_personnel_assigned
        aml_risk_assessment_report_updated
        aml_audit_procedures
        aml_other_designated_matters)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= aml_internal_control_executed aml_internal_control_implemented))

; [aml:internal_control_compliance] 洗錢防制內部控制制度建立且確實執行
(assert (= aml_internal_control_compliance
   (and aml_internal_control_established aml_internal_control_executed)))

; [aml:improvement_order_issued] 主管機關限期令改善
(assert (= aml_improvement_order_issued aml_improvement_order))

; [aml:improvement_order_not_complied] 屆期未改善
(assert (= aml_improvement_order_not_complied
   (and aml_improvement_order_issued (not aml_improvement_completed))))

; [aml:inspection_refusal] 規避、拒絕或妨礙查核
(assert (= aml_inspection_refusal aml_inspection_refused))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未完成增資或改善計畫，或財務惡化未改善，或洗錢防制制度未建立或未執行，或未依限改善，或妨礙查核時處罰
(assert (= penalty
   (or (not aml_internal_control_compliance)
       aml_improvement_order_not_complied
       (and financial_deterioration_with_plan_not_improved
            (not supervisory_measures_executed))
       aml_inspection_refusal
       capital_level_4_noncompliance)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_level_4_compliance false))
(assert (= capital_level_4_measures_executed false))
(assert (= financial_or_business_deteriorated false))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= risk_to_insured_interest false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_effective false))
(assert (= aml_anti_money_laundering_procedures false))
(assert (= aml_audit_procedures false))
(assert (= aml_dedicated_personnel_assigned false))
(assert (= aml_improvement_order true))
(assert (= aml_improvement_order_issued true))
(assert (= aml_improvement_completed false))
(assert (= aml_inspection_refused false))
(assert (= aml_inspection_refusal false))
(assert (= aml_internal_control_implemented false))
(assert (= aml_other_designated_matters false))
(assert (= aml_regular_training false))
(assert (= aml_risk_assessment_report_updated false))
(assert (= capital_level 4))
(assert (= financial_deterioration false))
(assert (= financial_deterioration_with_plan_not_improved false))
(assert (= penalty true))
(assert (= prohibited_acts_without_supervisor_consent true))
(assert (= supervisor_consent_contract_commitment false))
(assert (= supervisor_consent_other_major_financial_matters false))
(assert (= supervisor_consent_payment_exceed_limit false))
(assert (= supervisory_measures_applicable true))
(assert (= supervisory_measures_applied false))
(assert (= supervisory_measures_executed false))
(assert (= profit_loss_net_worth_accelerated_deterioration false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 42
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
