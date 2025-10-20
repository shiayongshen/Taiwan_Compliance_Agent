; SMT2 file generated from compliance case automatic
; Case ID: case_465
; Generated at: 2025-10-19T16:38:42.199284
;
; This file can be executed with Z3:
;   z3 case_465.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_noncompliance Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_4_noncompliance Bool)
(declare-const complies_with_corporate_law_369_369_3_369_9_369_11 Bool)
(declare-const counseling_not_improved Bool)
(declare-const criminal_penalty_unsecured_loans Bool)
(declare-const degree_of_kinship Int)
(declare-const financial_or_business_improvement_plan_completed Bool)
(declare-const financial_or_business_status_significantly_deteriorated Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const is_business_responsible_by_self_or_spouse Bool)
(declare-const is_same_legal_person Bool)
(declare-const is_same_natural_person Bool)
(declare-const is_self Bool)
(declare-const is_spouse Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const penalty_unauthorized_guaranteed_loans Bool)
(declare-const penalty_violation_loan_transaction_limits Bool)
(declare-const profit_loss_and_net_worth_accelerated_deterioration Bool)
(declare-const prohibited_acts_without_supervisor_consent Bool)
(declare-const regulatory_restriction_enforced Bool)
(declare-const regulatory_restriction_other_transactions_enforced Bool)
(declare-const related_party_definition Bool)
(declare-const restriction_on_loans_and_other_transactions Bool)
(declare-const restriction_on_other_transactions_with_interested_parties Bool)
(declare-const risk_of_financial_or_business_deterioration Bool)
(declare-const same_person Bool)
(declare-const same_related_corporate Bool)
(declare-const same_related_person Bool)
(declare-const significant_deterioration_noncompliance Bool)
(declare-const supervisor_consent_contract_commitment Bool)
(declare-const supervisor_consent_other_major_financial_matters Bool)
(declare-const supervisor_consent_payment_exceed_limit Bool)
(declare-const supervisory_measures_enforced Bool)
(declare-const unable_to_pay_debts_or_fulfill_contracts Bool)
(declare-const unauthorized_guaranteed_loans_violated Bool)
(declare-const unsecured_or_preferential_loans_violated Bool)
(declare-const violated_article_143 Bool)
(declare-const violated_article_143_5_or_143_6_measures Bool)
(declare-const violated_business_scope_regulations Bool)
(declare-const violated_fund_usage_regulations Bool)
(declare-const violated_loan_or_transaction_limits_or_procedures Bool)
(declare-const violated_reserve_provision_regulations Bool)
(declare-const violation_article_143 Bool)
(declare-const violation_article_143_5_6 Bool)
(declare-const violation_business_scope Bool)
(declare-const violation_fund_usage Bool)
(declare-const violation_reserve Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:related_party_definition] 同一人、同一關係人及同一關係企業定義
(assert (= related_party_definition
   (and same_person same_related_person same_related_corporate)))

; [insurance:related_party_same_person] 同一人定義為同一自然人或同一法人
(assert (= same_person (or is_same_natural_person is_same_legal_person)))

; [insurance:related_party_same_related_person] 同一關係人包含本人、配偶、二親等以內血親及本人或配偶為負責人之事業
(assert (= same_related_person
   (or is_self
       (>= 2 degree_of_kinship)
       is_spouse
       is_business_responsible_by_self_or_spouse)))

; [insurance:related_party_same_related_corporate] 同一關係企業範圍依公司法相關條文規定
(assert (= same_related_corporate complies_with_corporate_law_369_369_3_369_9_369_11))

; [insurance:restriction_on_loans_and_other_transactions] 主管機關得限制保險業對同一人、同一關係人或同一關係企業之放款及其他交易
(assert (= restriction_on_loans_and_other_transactions regulatory_restriction_enforced))

; [insurance:restriction_on_other_transactions_with_interested_parties] 主管機關得限制保險業與利害關係人從事放款以外其他交易
(assert (= restriction_on_other_transactions_with_interested_parties
   regulatory_restriction_other_transactions_enforced))

; [insurance:supervisory_measures_classification] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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

; [insurance:supervisory_measures_required] 資本嚴重不足且未依規定完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level)
        (not (or capital_increase_completed
                 financial_or_business_improvement_plan_completed
                 merger_completed)))))

; [insurance:supervisory_measures_significant_deterioration] 財務或業務狀況顯著惡化且未改善
(assert (= significant_deterioration_noncompliance
   (and financial_or_business_status_significantly_deteriorated
        unable_to_pay_debts_or_fulfill_contracts
        (not improvement_plan_submitted_and_approved))))

; [insurance:supervisory_measures_accelerated_deterioration] 損益、淨值加速惡化且輔導未改善
(assert (= accelerated_deterioration_noncompliance
   (and profit_loss_and_net_worth_accelerated_deterioration
        counseling_not_improved
        risk_of_financial_or_business_deterioration)))

; [insurance:supervisory_measures_enforcement] 主管機關得依情節輕重為監管、接管、勒令停業清理或命令解散
(assert (= supervisory_measures_enforced
   (or accelerated_deterioration_noncompliance capital_level_4_noncompliance)))

; [insurance:prohibited_acts_without_supervisor_consent] 監管處分期間未經監管人同意不得為特定行為
(assert (= prohibited_acts_without_supervisor_consent
   (and (not supervisor_consent_payment_exceed_limit)
        (not supervisor_consent_contract_commitment)
        (not supervisor_consent_other_major_financial_matters))))

; [insurance:violation_of_business_scope_penalty] 違反業務範圍規定罰鍰
(assert (= violation_business_scope violated_business_scope_regulations))

; [insurance:violation_reserve_penalty] 違反賠償準備金提存額度及方式規定罰鍰
(assert (= violation_reserve violated_reserve_provision_regulations))

; [insurance:violation_article_143_penalty] 違反第一百四十三條規定罰鍰
(assert (= violation_article_143 violated_article_143))

; [insurance:violation_article_143_5_and_143_6_penalty] 違反第一百四十三條之五或主管機關依第一百四十三條之六措施罰鍰
(assert (= violation_article_143_5_6 violated_article_143_5_or_143_6_measures))

; [insurance:violation_fund_usage_penalty] 資金運用違規罰鍰或解除負責人職務
(assert (= violation_fund_usage violated_fund_usage_regulations))

; [insurance:criminal_penalty_for_unsecured_loans] 無十足擔保或條件優於其他同類放款刑責
(assert (= criminal_penalty_unsecured_loans unsecured_or_preferential_loans_violated))

; [insurance:penalty_for_unauthorized_guaranteed_loans] 擔保放款未經董事會三分之二出席及四分之三同意或違限額罰鍰
(assert (= penalty_unauthorized_guaranteed_loans unauthorized_guaranteed_loans_violated))

; [insurance:penalty_for_violation_loan_and_transaction_limits] 違反放款或其他交易限額及決議程序罰鍰
(assert (= penalty_violation_loan_transaction_limits
   violated_loan_or_transaction_limits_or_procedures))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法令規定時處罰
(assert (= penalty
   (or violation_business_scope
       violation_article_143_5_6
       penalty_violation_loan_transaction_limits
       violation_fund_usage
       supervisory_measures_enforced
       violation_article_143
       penalty_unauthorized_guaranteed_loans
       criminal_penalty_unsecured_loans
       violation_reserve)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violated_fund_usage_regulations true))
(assert (= violation_fund_usage true))
(assert (= regulatory_restriction_other_transactions_enforced true))
(assert (= restriction_on_other_transactions_with_interested_parties true))
(assert (= penalty_violation_loan_transaction_limits true))
(assert (= violated_loan_or_transaction_limits_or_procedures true))
(assert (= violation_reserve true))
(assert (= violated_reserve_provision_regulations true))
(assert (= penalty true))
(assert (= same_person true))
(assert (= is_same_natural_person false))
(assert (= is_same_legal_person true))
(assert (= same_related_person true))
(assert (= is_self true))
(assert (= is_spouse false))
(assert (= degree_of_kinship 0))
(assert (= is_business_responsible_by_self_or_spouse false))
(assert (= same_related_corporate true))
(assert (= complies_with_corporate_law_369_369_3_369_9_369_11 true))
(assert (= regulatory_restriction_enforced true))
(assert (= restriction_on_loans_and_other_transactions true))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 50.0))
(assert (= net_worth_ratio 50.0))
(assert (= capital_level 1))
(assert (= capital_increase_completed false))
(assert (= financial_or_business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= capital_level_4_noncompliance false))
(assert (= accelerated_deterioration_noncompliance false))
(assert (= profit_loss_and_net_worth_accelerated_deterioration false))
(assert (= counseling_not_improved false))
(assert (= risk_of_financial_or_business_deterioration false))
(assert (= significant_deterioration_noncompliance false))
(assert (= financial_or_business_status_significantly_deteriorated false))
(assert (= unable_to_pay_debts_or_fulfill_contracts false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= supervisory_measures_enforced false))
(assert (= prohibited_acts_without_supervisor_consent true))
(assert (= supervisor_consent_payment_exceed_limit false))
(assert (= supervisor_consent_contract_commitment false))
(assert (= supervisor_consent_other_major_financial_matters false))
(assert (= criminal_penalty_unsecured_loans false))
(assert (= unsecured_or_preferential_loans_violated false))
(assert (= penalty_unauthorized_guaranteed_loans false))
(assert (= unauthorized_guaranteed_loans_violated false))
(assert (= violation_article_143 false))
(assert (= violated_article_143 false))
(assert (= violation_article_143_5_6 false))
(assert (= violated_article_143_5_or_143_6_measures false))
(assert (= violation_business_scope false))
(assert (= violated_business_scope_regulations false))
(assert (= related_party_definition false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 53
; Total facts: 53
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
