; SMT2 file generated from compliance case automatic
; Case ID: case_386
; Generated at: 2025-10-19T14:36:33.886468
;
; This file can be executed with Z3:
;   z3 case_386.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authority_delegated_supervision Bool)
(declare-const authority_may_delegate_supervision Bool)
(declare-const authority_may_extend_deadline_or_require_new_plan Bool)
(declare-const authority_may_take_actions Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_3_or_worse_financial_deterioration Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const contract_or_major_obligation_committed_without_supervisor_consent Bool)
(declare-const delegated_entities_exempt_from_gov_procurement_law Bool)
(declare-const delegated_entities_not_subject_to_gov_procurement_law Bool)
(declare-const financial_or_business_deterioration_significant Bool)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const improvement_plan_accelerated_deterioration_or_no_improvement Bool)
(declare-const improvement_plan_approved_by_authority Bool)
(declare-const improvement_plan_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const major_domestic_or_international_event_affecting_financial_market Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_impact_without_supervisor_consent Bool)
(declare-const payment_amount Real)
(declare-const penalty Bool)
(declare-const profit_loss_net_worth_accelerated_deterioration Bool)
(declare-const receivership_exemption_from_company_law Bool)
(declare-const receivership_or_ordered_suspension Bool)
(declare-const reorganization_petition_by_receiver Bool)
(declare-const reorganization_petition_handling Bool)
(declare-const restricted_actions_without_supervisor_consent Bool)
(declare-const risk_of_harming_insured_rights Bool)
(declare-const supervisor_inspection_applies Bool)
(declare-const supervisor_limit Bool)
(declare-const supervisor_performs_inspection Bool)
(declare-const unable_to_fulfill_contractual_responsibilities Bool)
(declare-const unable_to_pay_debts Bool)
(declare-const under_supervision Bool)

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
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level)
        (not capital_increase_completed)
        (not financial_or_business_improvement_plan_completed)
        (not merger_completed))))

; [insurance:capital_level_3_or_worse_financial_deterioration] 資本等級非嚴重不足但財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= capital_level_3_or_worse_financial_deterioration
   (and (not (= 4 capital_level))
        financial_or_business_deterioration_significant
        (or unable_to_pay_debts
            unable_to_fulfill_contractual_responsibilities
            risk_of_harming_insured_rights))))

; [insurance:improvement_plan_submitted_and_approved] 保險業已提出且主管機關核定財務或業務改善計畫
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved_by_authority)))

; [insurance:improvement_plan_accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration_or_no_improvement
   (or profit_loss_net_worth_accelerated_deterioration
       (not improvement_plan_effective))))

; [insurance:authority_may_take_actions] 主管機關得依情節輕重為監管、接管、勒令停業清理或命令解散
(assert (= authority_may_take_actions
   (or capital_level_4_noncompliance
       (and capital_level_3_or_worse_financial_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_accelerated_deterioration_or_no_improvement))))

; [insurance:authority_may_extend_deadline_or_require_new_plan] 主管機關得另定期限或要求重新提具增資、改善或合併計畫
(assert (= authority_may_extend_deadline_or_require_new_plan
   (and major_domestic_or_international_event_affecting_financial_market
        (not capital_increase_completed)
        (not financial_or_business_improvement_plan_completed)
        (not merger_completed))))

; [insurance:authority_may_delegate_supervision] 主管機關得委託其他保險業、相關機構或專業人員擔任監管人、接管人、清理人或清算人
(assert (= authority_may_delegate_supervision authority_delegated_supervision))

; [insurance:delegated_entities_not_subject_to_gov_procurement_law] 受委託機構或個人辦理事項不適用政府採購法
(assert (= delegated_entities_not_subject_to_gov_procurement_law
   delegated_entities_exempt_from_gov_procurement_law))

; [insurance:receivership_exemption_from_company_law] 保險業受接管或勒令停業清理時不適用公司法臨時管理人或檢查人規定
(assert (= receivership_exemption_from_company_law receivership_or_ordered_suspension))

; [insurance:reorganization_petition_handling] 接管人依本法聲請重整，法院得合併審理或裁定
(assert (= reorganization_petition_handling reorganization_petition_by_receiver))

; [insurance:restricted_actions_without_supervisor_consent] 監管處分期間非經監管人同意不得超限支付款項、締結契約或重大財務事項
(assert (let ((a!1 (or (not under_supervision)
               (and (<= payment_amount (ite supervisor_limit 1.0 0.0))
                    (not contract_or_major_obligation_committed_without_supervisor_consent)
                    (not other_major_financial_impact_without_supervisor_consent)))))
  (= restricted_actions_without_supervisor_consent a!1)))

; [insurance:supervisor_inspection_applies] 監管人執行監管職務時準用檢查規定
(assert (= supervisor_inspection_applies supervisor_performs_inspection))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資、改善計畫或合併，或財務狀況惡化且未改善時處罰
(assert (= penalty
   (or capital_level_4_noncompliance
       (and capital_level_3_or_worse_financial_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_accelerated_deterioration_or_no_improvement))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 45.0))
(assert (= net_worth 10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= capital_level 4))
(assert (= capital_level_4_noncompliance true))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved_by_authority false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= financial_or_business_deterioration_significant false))
(assert (= capital_level_3_or_worse_financial_deterioration false))
(assert (= improvement_plan_accelerated_deterioration_or_no_improvement false))
(assert (= authority_may_take_actions true))
(assert (= authority_delegated_supervision false))
(assert (= authority_may_delegate_supervision false))
(assert (= major_domestic_or_international_event_affecting_financial_market false))
(assert (= authority_may_extend_deadline_or_require_new_plan false))
(assert (= contract_or_major_obligation_committed_without_supervisor_consent false))
(assert (= delegated_entities_exempt_from_gov_procurement_law false))
(assert (= delegated_entities_not_subject_to_gov_procurement_law false))
(assert (= payment_amount 0.0))
(assert (= other_major_financial_impact_without_supervisor_consent false))
(assert (= penalty true))
(assert (= profit_loss_net_worth_accelerated_deterioration false))
(assert (= improvement_plan_effective false))
(assert (= receivership_or_ordered_suspension false))
(assert (= receivership_exemption_from_company_law false))
(assert (= reorganization_petition_by_receiver false))
(assert (= reorganization_petition_handling false))
(assert (= restricted_actions_without_supervisor_consent false))
(assert (= risk_of_harming_insured_rights false))
(assert (= supervisor_performs_inspection false))
(assert (= supervisor_inspection_applies false))
(assert (= under_supervision false))
(assert (= unable_to_fulfill_contractual_responsibilities false))
(assert (= unable_to_pay_debts false))
(assert (= supervisor_limit false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 39
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
