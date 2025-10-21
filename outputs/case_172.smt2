; SMT2 file generated from compliance case automatic
; Case ID: case_172
; Generated at: 2025-10-21T03:54:20.980678
;
; This file can be executed with Z3:
;   z3 case_172.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_or_no_improvement_after_counseling Bool)
(declare-const aml_improvement_completed Bool)
(declare-const aml_internal_control_audit_content_compliant Bool)
(declare-const aml_internal_control_audit_established Bool)
(declare-const aml_refused_or_obstructed_inspection Bool)
(declare-const automatic_suspension_of_other_proceedings Bool)
(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_improvement_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_severe_and_not_completed_improvement Bool)
(declare-const capital_level_severe_and_not_completed_improvement_within_90_days Bool)
(declare-const consolidated_reorganization_request Bool)
(declare-const days_since_improvement_deadline Int)
(declare-const delegation_of_supervision Bool)
(declare-const exemption_from_gov_procurement_law Bool)
(declare-const extension_or_resubmission_of_improvement_plan Bool)
(declare-const failure_to_establish_or_implement_internal_control Bool)
(declare-const failure_to_improve_after_order Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_after_counseling Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_requested Bool)
(declare-const improvement_plan_required_and_approved Bool)
(declare-const internal_control_audit_content_compliant Bool)
(declare-const internal_control_audit_established Bool)
(declare-const internal_control_audit_established_and_executed Bool)
(declare-const internal_handling_established_and_executed Bool)
(declare-const major_event_affecting_financial_market Bool)
(declare-const major_event_affecting_financial_market_and_not_completed_improvement Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const non_applicability_of_company_law_provisions Bool)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const prohibited_acts_without_supervisor_consent Bool)
(declare-const refusal_or_obstruction_of_inspection Bool)
(declare-const regulation_of_supervision_and_takeover Bool)
(declare-const regulatory_action_due_to_deterioration Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervisor_inspection_applies Bool)
(declare-const under_supervision Bool)
(declare-const violated_article_143 Bool)
(declare-const violated_article_143_5_or_143_6_measures Bool)
(declare-const violated_business_scope_rules Bool)
(declare-const violated_fund_management_rules Bool)
(declare-const violated_loan_approval_rules Bool)
(declare-const violated_loan_guarantee_rules Bool)
(declare-const violated_loan_limit_rules Bool)
(declare-const violated_reserve_rules Bool)
(declare-const violation_of_article_143 Bool)
(declare-const violation_of_article_143_5_or_143_6_measures Bool)
(declare-const violation_of_business_scope_rules Bool)
(declare-const violation_of_fund_management_rules Bool)
(declare-const violation_of_internal_control_audit Bool)
(declare-const violation_of_internal_handling Bool)
(declare-const violation_of_loan_approval_rules Bool)
(declare-const violation_of_loan_guarantee_rules Bool)
(declare-const violation_of_loan_limit_rules Bool)
(declare-const violation_of_reserve_rules Bool)

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

; [insurance:capital_level_severe_and_not_completed_improvement] 資本嚴重不足且未依主管機關規定期限完成增資、財務或業務改善計畫或合併
(assert (= capital_level_severe_and_not_completed_improvement
   (and (= 4 capital_level) (not capital_improvement_completed))))

; [insurance:capital_level_severe_and_not_completed_improvement_within_90_days] 資本嚴重不足且未完成改善計畫，應於期限屆滿次日起90日內為接管、勒令停業清理或命令解散
(assert (= capital_level_severe_and_not_completed_improvement_within_90_days
   (and capital_level_severe_and_not_completed_improvement
        (>= 90.0 (to_real days_since_improvement_deadline)))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or cannot_fulfill_contract cannot_pay_debt risk_to_insured_rights)))

; [insurance:improvement_plan_required_and_approved] 主管機關已令保險業提出財務或業務改善計畫並核定
(assert (= improvement_plan_required_and_approved
   (and improvement_plan_requested improvement_plan_approved)))

; [insurance:accelerated_deterioration_or_no_improvement_after_counseling] 損益、淨值加速惡化或經輔導仍未改善，致仍有財務或業務惡化之虞
(assert (= accelerated_deterioration_or_no_improvement_after_counseling
   (or profit_loss_accelerated_deterioration
       (and (not improvement_after_counseling)
            financial_or_business_deterioration))))

; [insurance:regulatory_action_due_to_deterioration] 主管機關得依情節輕重為監管、接管、勒令停業清理或命令解散之處分
(assert (= regulatory_action_due_to_deterioration
   (and accelerated_deterioration_or_no_improvement_after_counseling
        improvement_plan_required_and_approved)))

; [insurance:major_event_affecting_financial_market_and_not_completed_improvement] 因重大事件影響金融市場致未於期限內完成增資、財務或業務改善或合併計畫
(assert (= major_event_affecting_financial_market_and_not_completed_improvement
   (and major_event_affecting_financial_market
        (not capital_improvement_completed))))

; [insurance:extension_or_resubmission_of_improvement_plan] 主管機關得令保險業另定完成期限或重新提具增資、財務或業務改善或合併計畫
(assert (= extension_or_resubmission_of_improvement_plan
   major_event_affecting_financial_market_and_not_completed_improvement))

; [insurance:delegation_of_supervision] 主管機關得委託其他保險業、保險相關機構或專業人員擔任監管人、接管人、清理人或清算人
(assert (= delegation_of_supervision regulatory_action_due_to_deterioration))

; [insurance:exemption_from_gov_procurement_law] 委託機構或個人辦理受委託事項時，不適用政府採購法規定
(assert (= exemption_from_gov_procurement_law delegation_of_supervision))

; [insurance:non_applicability_of_company_law_provisions] 保險業受接管或勒令停業清理時，不適用公司法有關臨時管理人或檢查人規定
(assert (= non_applicability_of_company_law_provisions
   regulatory_action_due_to_deterioration))

; [insurance:automatic_suspension_of_other_proceedings] 除依本法規定聲請重整外，其他重整、破產、和解及強制執行程序當然停止
(assert (= automatic_suspension_of_other_proceedings
   regulatory_action_due_to_deterioration))

; [insurance:consolidated_reorganization_request] 接管人得聲請法院合併審理或裁定受接管保險業重整案件
(assert (= consolidated_reorganization_request regulatory_action_due_to_deterioration))

; [insurance:prohibited_acts_without_supervisor_consent] 監管處分期間，非經監管人同意不得超限支付款項、締結契約或其他重大財務事項
(assert (= prohibited_acts_without_supervisor_consent under_supervision))

; [insurance:supervisor_inspection_applies] 監管人執行監管職務時，準用檢查規定
(assert (= supervisor_inspection_applies under_supervision))

; [insurance:regulation_of_supervision_and_takeover] 監管或接管程序及相關職權、費用負擔由主管機關定之
(assert (= regulation_of_supervision_and_takeover under_supervision))

; [insurance:violation_of_business_scope_rules] 違反業務範圍規定
(assert (= violation_of_business_scope_rules violated_business_scope_rules))

; [insurance:violation_of_reserve_rules] 違反賠償準備金提存額度或方式規定
(assert (= violation_of_reserve_rules violated_reserve_rules))

; [insurance:violation_of_article_143] 違反第一百四十三條規定
(assert (= violation_of_article_143 violated_article_143))

; [insurance:violation_of_article_143_5_or_143_6_measures] 違反第一百四十三條之五或主管機關依第一百四十三條之六規定所為措施
(assert (= violation_of_article_143_5_or_143_6_measures
   violated_article_143_5_or_143_6_measures))

; [insurance:violation_of_fund_management_rules] 違反資金運用相關規定
(assert (= violation_of_fund_management_rules violated_fund_management_rules))

; [insurance:violation_of_loan_guarantee_rules] 違反放款無十足擔保或條件優於其他同類放款對象規定
(assert (= violation_of_loan_guarantee_rules violated_loan_guarantee_rules))

; [insurance:violation_of_loan_approval_rules] 違反放款董事會同意或限額規定
(assert (= violation_of_loan_approval_rules violated_loan_approval_rules))

; [insurance:violation_of_loan_limit_rules] 違反放款或其他交易限額及決議程序規定
(assert (= violation_of_loan_limit_rules violated_loan_limit_rules))

; [insurance:violation_of_internal_control_audit] 未建立或未執行內部控制或稽核制度
(assert (not (= internal_control_audit_established_and_executed
        violation_of_internal_control_audit)))

; [insurance:violation_of_internal_handling] 未建立或未執行內部處理制度或程序
(assert (not (= internal_handling_established_and_executed
        violation_of_internal_handling)))

; [aml:internal_control_audit_established] 金融機構及指定非金融事業建立洗錢防制內部控制與稽核制度
(assert (= internal_control_audit_established aml_internal_control_audit_established))

; [aml:internal_control_audit_content_compliant] 洗錢防制內部控制與稽核制度內容符合規定
(assert (= internal_control_audit_content_compliant
   aml_internal_control_audit_content_compliant))

; [aml:failure_to_establish_or_implement_internal_control] 違反洗錢防制法未建立制度或未依規定實施
(assert (not (= (and internal_control_audit_established
             internal_control_audit_content_compliant)
        failure_to_establish_or_implement_internal_control)))

; [aml:failure_to_improve_after_order] 違反洗錢防制法被限期令其改善，屆期未改善
(assert (= failure_to_improve_after_order
   (and failure_to_establish_or_implement_internal_control
        (not aml_improvement_completed))))

; [aml:refusal_or_obstruction_of_inspection] 規避、拒絕或妨礙現地或非現地查核
(assert (= refusal_or_obstruction_of_inspection aml_refused_or_obstructed_inspection))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未完成改善計畫，或財務業務惡化未改善，或違反相關規定時處罰
(assert (= penalty
   (or violation_of_fund_management_rules
       violation_of_reserve_rules
       violation_of_article_143_5_or_143_6_measures
       violation_of_article_143
       violation_of_loan_limit_rules
       capital_level_severe_and_not_completed_improvement_within_90_days
       violation_of_business_scope_rules
       regulatory_action_due_to_deterioration
       violation_of_internal_handling
       violation_of_loan_guarantee_rules
       failure_to_improve_after_order
       refusal_or_obstruction_of_inspection
       violation_of_loan_approval_rules
       violation_of_internal_control_audit)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 45.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_improvement_completed false))
(assert (= days_since_improvement_deadline 7))
(assert (= violated_business_scope_rules true))
(assert (= violated_loan_limit_rules true))
(assert (= violated_loan_approval_rules true))
(assert (= violated_loan_guarantee_rules true))
(assert (= violated_reserve_rules false))
(assert (= violated_article_143 false))
(assert (= violated_article_143_5_or_143_6_measures false))
(assert (= violated_fund_management_rules false))
(assert (= internal_control_audit_established_and_executed false))
(assert (= internal_handling_established_and_executed false))
(assert (= aml_internal_control_audit_established false))
(assert (= aml_internal_control_audit_content_compliant false))
(assert (= aml_improvement_completed false))
(assert (= aml_refused_or_obstructed_inspection false))
(assert (= improvement_plan_requested false))
(assert (= improvement_plan_approved false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= improvement_after_counseling false))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_rights false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 34
; Total variables: 61
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
