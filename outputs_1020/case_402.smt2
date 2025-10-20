; SMT2 file generated from compliance case automatic
; Case ID: case_402
; Generated at: 2025-10-19T14:56:36.688761
;
; This file can be executed with Z3:
;   z3 case_402.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent Bool)
(declare-const bank_must_follow_agent_broker_rules Bool)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permit_obtained Bool)
(declare-const bank_permitted_to_operate_agent_or_broker Bool)
(declare-const broker Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_report_and_fee_disclosed Bool)
(declare-const duty_of_care_observed Bool)
(declare-const duty_of_fidelity_observed Bool)
(declare-const fee_charged Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const guarantee_insurance_purchased Bool)
(declare-const liability_insurance_purchased Bool)
(declare-const license_required Bool)
(declare-const licensed Bool)
(declare-const minimum_amount_set_by_authority Bool)
(declare-const notary Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)
(declare-const qualification_and_management_rules_set Bool)
(declare-const related_insurance_coverage_ok Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_required] 保險代理人、經紀人、公證人須經主管機關許可
(assert (= license_required
   (and licensed
        guarantee_deposit_paid
        related_insurance_purchased
        practice_certificate_held)))

; [insurance:related_insurance_type] 相關保險類型依身份區分
(assert (= (ite related_insurance_type 1 0)
   (ite agent 1 (ite broker 2 (ite notary 1 0)))))

; [insurance:related_insurance_coverage_ok] 相關保險投保符合身份要求
(assert (= related_insurance_coverage_ok
   (or (and agent liability_insurance_purchased)
       (and notary liability_insurance_purchased)
       (and broker liability_insurance_purchased guarantee_insurance_purchased))))

; [insurance:minimum_amount_set_by_authority] 最低保證金及保險金額由主管機關定之
(assert minimum_amount_set_by_authority)

; [insurance:qualification_and_management_rules_set] 資格取得及管理規則由主管機關定之
(assert qualification_and_management_rules_set)

; [insurance:bank_permitted_to_operate_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務
(assert (= bank_permitted_to_operate_agent_or_broker
   (and bank_permit_obtained (or bank_operate_agent bank_operate_broker))))

; [insurance:bank_must_follow_agent_broker_rules] 銀行兼營代理人或經紀人業務應分別準用相關規定
(assert bank_must_follow_agent_broker_rules)

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂契約或提供服務
(assert (= broker_duty_of_care_and_fidelity
   (and broker duty_of_care_observed duty_of_fidelity_observed)))

; [insurance:broker_must_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂契約前應主動提供書面分析報告並明確告知報酬標準
(assert (let ((a!1 (or (not broker)
               (and written_analysis_report_provided
                    (or (not fee_charged) fee_standard_disclosed)))))
  (= broker_report_and_fee_disclosed a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金、未投保相關保險、未持執業證照或保險經紀人未履行義務時處罰
(assert (let ((a!1 (and broker
                (or (not duty_of_care_observed)
                    (not duty_of_fidelity_observed)
                    (not written_analysis_report_provided)
                    (and fee_charged (not fee_standard_disclosed))))))
  (= penalty
     (or a!1
         (not related_insurance_purchased)
         (not licensed)
         (not practice_certificate_held)
         (not guarantee_deposit_paid)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent false))
(assert (= broker true))
(assert (= notary false))
(assert (= licensed true))
(assert (= guarantee_deposit_paid false))
(assert (= related_insurance_purchased false))
(assert (= practice_certificate_held true))
(assert (= liability_insurance_purchased false))
(assert (= guarantee_insurance_purchased false))
(assert (= duty_of_care_observed true))
(assert (= duty_of_fidelity_observed true))
(assert (= written_analysis_report_provided true))
(assert (= fee_charged false))
(assert (= fee_standard_disclosed false))
(assert (= license_required false))
(assert (= minimum_amount_set_by_authority true))
(assert (= qualification_and_management_rules_set true))
(assert (= bank_permit_obtained false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= bank_permitted_to_operate_agent_or_broker false))
(assert (= bank_must_follow_agent_broker_rules false))
(assert (= broker_duty_of_care_and_fidelity true))
(assert (= broker_report_and_fee_disclosed true))
(assert (= related_insurance_type false))
(assert (= related_insurance_coverage_ok false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 27
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
