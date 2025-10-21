; SMT2 file generated from compliance case automatic
; Case ID: case_466
; Generated at: 2025-10-21T10:25:09.230572
;
; This file can be executed with Z3:
;   z3 case_466.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_compliance Bool)
(declare-const capital_level_3_compliance Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_compliance Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const criminal_liability_for_unsecured_loans Bool)
(declare-const delegated_not_subject_to_gov_procurement Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const penalty_for_unauthorized_guaranteed_loans Bool)
(declare-const penalty_for_violation_loan_limits Bool)
(declare-const receivership_exceptions Bool)
(declare-const receivership_reorganization_procedure Bool)
(declare-const related_party_definition Bool)
(declare-const supervised_entity_restrictions Bool)
(declare-const supervision_procedures_defined Bool)
(declare-const supervisor_inspection_applies Bool)
(declare-const supervisor_limit_other_transactions Bool)
(declare-const supervisor_limit_related_party_transactions Bool)
(declare-const supervisor_may_delegate Bool)
(declare-const supervisor_may_impose_measures Bool)
(declare-const supervisor_may_take_action_for_deterioration Bool)
(declare-const supervisor_must_notify_deregistration Bool)
(declare-const supervisor_must_take_action_for_level_4 Bool)
(declare-const violation_article_143_5_6_penalty Bool)
(declare-const violation_article_143_penalty Bool)
(declare-const violation_business_scope_penalty Bool)
(declare-const violation_fund_management_penalty Bool)
(declare-const violation_reserve_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:related_party_definition] 同一人、同一關係人及同一關係企業定義
(assert related_party_definition)

; [insurance:supervisor_limit_related_party_transactions] 主管機關得限制保險業對同一人、同一關係人或同一關係企業之放款或其他交易
(assert supervisor_limit_related_party_transactions)

; [insurance:supervisor_limit_other_transactions] 主管機關得限制保險業與利害關係人從事放款以外之其他交易
(assert supervisor_limit_other_transactions)

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

; [insurance:capital_level_4_compliance] 資本嚴重不足等級措施完成
(assert (= capital_level_4_compliance capital_level_4_measures_executed))

; [insurance:capital_level_3_compliance] 資本顯著不足等級措施完成
(assert (= capital_level_3_compliance capital_level_3_measures_executed))

; [insurance:capital_level_2_compliance] 資本不足等級措施完成
(assert (= capital_level_2_compliance
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:supervisor_may_impose_measures] 主管機關得對違反法令或有礙健全經營之保險業予以糾正、限期改善及處分
(assert supervisor_may_impose_measures)

; [insurance:supervisor_must_take_action_for_level_4] 資本嚴重不足且未依規定完成增資或改善計畫，主管機關應於期限屆滿後90日內為接管等處分
(assert (= supervisor_must_take_action_for_level_4
   (and (= 4 capital_level) (not capital_level_4_compliance))))

; [insurance:supervisor_may_take_action_for_deterioration] 財務或業務狀況顯著惡化且未改善者，主管機關得為監管、接管等處分
(assert supervisor_may_take_action_for_deterioration)

; [insurance:supervisor_must_notify_deregistration] 依解除董（理）事、監察人職務規定，主管機關應通知登記主管機關廢止登記
(assert supervisor_must_notify_deregistration)

; [insurance:supervisor_may_delegate] 主管機關得委託其他保險業或專業人員擔任監管人、接管人等
(assert supervisor_may_delegate)

; [insurance:delegated_not_subject_to_gov_procurement] 委託機構或個人辦理受委託事項不適用政府採購法
(assert delegated_not_subject_to_gov_procurement)

; [insurance:receivership_exceptions] 保險業受接管或勒令停業清理時不適用公司法臨時管理人或檢查人規定
(assert receivership_exceptions)

; [insurance:receivership_reorganization_procedure] 接管人依本法規定聲請重整，法院得合併審理或裁定
(assert receivership_reorganization_procedure)

; [insurance:supervised_entity_restrictions] 保險業監管處分期間非經監管人同意不得超限額支付款項或處分財產等
(assert supervised_entity_restrictions)

; [insurance:supervisor_inspection_applies] 監管人執行監管職務時準用檢查規定
(assert supervisor_inspection_applies)

; [insurance:supervision_procedures_defined] 監管或接管程序及相關事項由主管機關定之
(assert supervision_procedures_defined)

; [insurance:violation_business_scope_penalty] 違反業務範圍規定處罰
(assert violation_business_scope_penalty)

; [insurance:violation_reserve_penalty] 違反賠償準備金提存額度及方式規定處罰
(assert violation_reserve_penalty)

; [insurance:violation_article_143_penalty] 違反第一百四十三條規定處罰
(assert violation_article_143_penalty)

; [insurance:violation_article_143_5_6_penalty] 違反第一百四十三條之五或主管機關依第一百四十三條之六措施處罰
(assert violation_article_143_5_6_penalty)

; [insurance:violation_fund_management_penalty] 違反資金運用相關規定處罰
(assert violation_fund_management_penalty)

; [insurance:criminal_liability_for_unsecured_loans] 無十足擔保或條件優於其他同類放款者，行為負責人刑責
(assert criminal_liability_for_unsecured_loans)

; [insurance:penalty_for_unauthorized_guaranteed_loans] 擔保放款未經董事會三分之二出席及四分之三同意或違反放款限額規定處罰
(assert penalty_for_unauthorized_guaranteed_loans)

; [insurance:penalty_for_violation_loan_limits] 違反放款或其他交易限額及決議程序規定處罰
(assert penalty_for_violation_loan_limits)

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法令規定時處罰
(assert (= penalty
   (or (not violation_reserve_penalty)
       (not criminal_liability_for_unsecured_loans)
       (not penalty_for_violation_loan_limits)
       (not violation_article_143_5_6_penalty)
       (not violation_fund_management_penalty)
       (not violation_business_scope_penalty)
       (not violation_article_143_penalty)
       (not penalty_for_unauthorized_guaranteed_loans))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= related_party_definition true))
(assert (= supervisor_limit_related_party_transactions true))
(assert (= supervisor_limit_other_transactions true))
(assert (= violation_fund_management_penalty true))
(assert (= penalty true))
(assert (= penalty_for_violation_loan_limits false))
(assert (= penalty_for_unauthorized_guaranteed_loans false))
(assert (= violation_business_scope_penalty false))
(assert (= violation_reserve_penalty false))
(assert (= violation_article_143_penalty false))
(assert (= violation_article_143_5_6_penalty false))
(assert (= criminal_liability_for_unsecured_loans false))
(assert (= capital_adequacy_ratio 120.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 3.0))
(assert (= capital_level_2_compliance false))
(assert (= capital_level_3_compliance false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_4_compliance false))
(assert (= capital_level_4_measures_executed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= delegated_not_subject_to_gov_procurement true))
(assert (= supervised_entity_restrictions true))
(assert (= supervision_procedures_defined true))
(assert (= supervisor_inspection_applies true))
(assert (= supervisor_may_impose_measures true))
(assert (= supervisor_may_take_action_for_deterioration true))
(assert (= supervisor_must_notify_deregistration true))
(assert (= supervisor_may_delegate true))
(assert (= receivership_exceptions true))
(assert (= receivership_reorganization_procedure true))
(assert (= supervisor_must_take_action_for_level_4 false))
(assert (= capital_level 2))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 34
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
