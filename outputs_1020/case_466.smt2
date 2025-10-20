; SMT2 file generated from compliance case automatic
; Case ID: case_466
; Generated at: 2025-10-19T16:41:05.149419
;
; This file can be executed with Z3:
;   z3 case_466.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const cannot_pay_debt_or_fulfill_contract Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_severely_insufficient_measures_executed_flag Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_executed_flag Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const insurance_company_restricted_actions_without_monitor_consent Bool)
(declare-const loan_guarantee_exceed_board_approval Bool)
(declare-const loan_guarantee_exceed_board_approval_flag Bool)
(declare-const loan_without_sufficient_collateral_or_better_terms Bool)
(declare-const loan_without_sufficient_collateral_or_better_terms_flag Bool)
(declare-const monitor_execute_supervision_apply_inspection_rules Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const profit_and_net_worth_accelerated_deterioration Bool)
(declare-const related_party_definition Bool)
(declare-const supervisor_delegate_exempt_gov_procurement Bool)
(declare-const supervisor_delegate_monitor_or_liquidator Bool)
(declare-const supervisor_impose_restriction Bool)
(declare-const supervisor_limit_other_transactions Bool)
(declare-const supervisor_limit_related_party_transactions Bool)
(declare-const supervisor_notify_authority_to_cancel_registration Bool)
(declare-const supervisor_order_capital_increase Bool)
(declare-const supervisor_order_improvement_plan Bool)
(declare-const supervisor_order_remove_manager_or_staff Bool)
(declare-const supervisor_order_stop_sale_or_limit_product Bool)
(declare-const supervisor_other_necessary_measures Bool)
(declare-const supervisor_remove_directors_or_supervisors Bool)
(declare-const supervisor_reorganization_petition Bool)
(declare-const supervisor_revoke_meeting_resolution Bool)
(declare-const supervisor_take_over_for_deterioration Bool)
(declare-const supervisor_take_over_or_order_liquidation Bool)
(declare-const supervisor_takeover_not_apply_company_law_temp_manager Bool)
(declare-const violate_article_138_2_related_regulations Bool)
(declare-const violate_article_138_related_regulations Bool)
(declare-const violate_article_143 Bool)
(declare-const violate_article_143_5_or_143_6_flag Bool)
(declare-const violate_article_143_5_or_143_6_measures Bool)
(declare-const violate_article_143_flag Bool)
(declare-const violate_business_scope_regulations Bool)
(declare-const violate_fund_management_flag Bool)
(declare-const violate_fund_management_regulations Bool)
(declare-const violate_law_or_harmful_to_stability Bool)
(declare-const violate_loan_or_transaction_limits_or_resolution Bool)
(declare-const violate_loan_or_transaction_limits_or_resolution_flag Bool)
(declare-const violate_reserve_requirements Bool)

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

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_severely_insufficient_measures_executed
   capital_severely_insufficient_measures_executed_flag))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_significantly_insufficient_measures_executed
   capital_significantly_insufficient_measures_executed_flag))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施已執行
(assert (= capital_insufficient_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:supervisor_impose_restriction] 主管機關對保險業違反法令或有礙健全經營時得予以限制營業或資金運用範圍等處分
(assert (= supervisor_impose_restriction violate_law_or_harmful_to_stability))

; [insurance:supervisor_order_stop_sale_or_limit_product] 主管機關得令保險業停售保險商品或限制其開辦
(assert (= supervisor_order_stop_sale_or_limit_product
   violate_law_or_harmful_to_stability))

; [insurance:supervisor_order_capital_increase] 主管機關得令保險業增資
(assert (= supervisor_order_capital_increase violate_law_or_harmful_to_stability))

; [insurance:supervisor_order_remove_manager_or_staff] 主管機關得令保險業解除經理人或職員職務
(assert (= supervisor_order_remove_manager_or_staff violate_law_or_harmful_to_stability))

; [insurance:supervisor_revoke_meeting_resolution] 主管機關得撤銷法定會議決議
(assert (= supervisor_revoke_meeting_resolution violate_law_or_harmful_to_stability))

; [insurance:supervisor_remove_directors_or_supervisors] 主管機關得解除董（理）事、監察人（監事）職務或停止其執行職務
(assert (= supervisor_remove_directors_or_supervisors
   violate_law_or_harmful_to_stability))

; [insurance:supervisor_other_necessary_measures] 主管機關得為其他必要之處置
(assert (= supervisor_other_necessary_measures violate_law_or_harmful_to_stability))

; [insurance:supervisor_notify_authority_to_cancel_registration] 主管機關通知公司登記主管機關廢止董（理）事、監察人登記
(assert (= supervisor_notify_authority_to_cancel_registration
   supervisor_remove_directors_or_supervisors))

; [insurance:supervisor_take_over_or_order_liquidation] 主管機關對資本嚴重不足且未依規定完成增資或改善計畫者，九十日內為接管、勒令停業清理或解散處分
(assert (= supervisor_take_over_or_order_liquidation
   (and (= 4 capital_level)
        (not capital_severely_insufficient_measures_executed))))

; [insurance:supervisor_order_improvement_plan] 主管機關對財務或業務狀況顯著惡化且不能支付債務或履行契約者，先令提出改善計畫並核定
(assert (= supervisor_order_improvement_plan
   (and (not (= 4 capital_level))
        financial_or_business_deterioration
        cannot_pay_debt_or_fulfill_contract)))

; [insurance:supervisor_take_over_for_deterioration] 主管機關對損益淨值加速惡化且輔導未改善者，得為監管、接管、勒令停業清理或解散處分
(assert (= supervisor_take_over_for_deterioration
   (and financial_or_business_deterioration
        profit_and_net_worth_accelerated_deterioration
        (not improvement_plan_executed))))

; [insurance:supervisor_delegate_monitor_or_liquidator] 主管機關得委託其他保險業或專業人員擔任監管人、接管人、清理人或清算人
(assert supervisor_delegate_monitor_or_liquidator)

; [insurance:supervisor_delegate_exempt_gov_procurement] 主管機關委託相關機構或個人辦理受委託事項時，不適用政府採購法
(assert supervisor_delegate_exempt_gov_procurement)

; [insurance:supervisor_takeover_not_apply_company_law_temp_manager] 保險業受接管或停業清理時，不適用公司法有關臨時管理人或檢查人規定
(assert supervisor_takeover_not_apply_company_law_temp_manager)

; [insurance:supervisor_reorganization_petition] 接管人依本法規定聲請重整，法院得合併審理或裁定
(assert supervisor_reorganization_petition)

; [insurance:insurance_company_restricted_actions_without_monitor_consent] 保險業監管處分時，非經監管人同意不得超限額支付款項、締結契約或重大義務承諾等
(assert insurance_company_restricted_actions_without_monitor_consent)

; [insurance:monitor_execute_supervision_apply_inspection_rules] 監管人執行監管職務時，準用檢查規定
(assert monitor_execute_supervision_apply_inspection_rules)

; [insurance:violate_business_scope_regulations] 違反業務範圍規定
(assert (= violate_business_scope_regulations violate_article_138_related_regulations))

; [insurance:violate_reserve_requirements] 違反賠償準備金提存額度及方式規定
(assert (= violate_reserve_requirements violate_article_138_2_related_regulations))

; [insurance:violate_article_143] 違反第一百四十三條規定
(assert (= violate_article_143 violate_article_143_flag))

; [insurance:violate_article_143_5_or_143_6_measures] 違反第一百四十三條之五或主管機關依第一百四十三條之六措施
(assert (= violate_article_143_5_or_143_6_measures violate_article_143_5_or_143_6_flag))

; [insurance:violate_fund_management_regulations] 違反資金運用相關規定
(assert (= violate_fund_management_regulations violate_fund_management_flag))

; [insurance:loan_without_sufficient_collateral_or_better_terms] 放款無十足擔保或條件優於其他同類放款對象
(assert (= loan_without_sufficient_collateral_or_better_terms
   loan_without_sufficient_collateral_or_better_terms_flag))

; [insurance:loan_guarantee_exceed_board_approval] 擔保放款達主管機關規定金額以上，未經董事會三分之二以上出席及四分之三以上同意
(assert (= loan_guarantee_exceed_board_approval
   loan_guarantee_exceed_board_approval_flag))

; [insurance:violate_loan_or_transaction_limits_or_resolution] 違反放款或其他交易限額及決議程序規定
(assert (= violate_loan_or_transaction_limits_or_resolution
   violate_loan_or_transaction_limits_or_resolution_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關法令、章程或規定時處罰
(assert (= penalty
   (or loan_guarantee_exceed_board_approval
       violate_reserve_requirements
       violate_article_143_5_or_143_6_measures
       violate_loan_or_transaction_limits_or_resolution
       violate_fund_management_regulations
       violate_article_143
       violate_business_scope_regulations
       loan_without_sufficient_collateral_or_better_terms)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= related_party_definition true))
(assert (= supervisor_limit_related_party_transactions true))
(assert (= supervisor_limit_other_transactions true))
(assert (= violate_fund_management_flag true))
(assert (= violate_fund_management_regulations true))
(assert (= violate_loan_or_transaction_limits_or_resolution_flag true))
(assert (= violate_loan_or_transaction_limits_or_resolution true))
(assert (= penalty true))
(assert (= violate_law_or_harmful_to_stability true))
(assert (= supervisor_impose_restriction true))
(assert (= supervisor_order_stop_sale_or_limit_product true))
(assert (= supervisor_order_capital_increase true))
(assert (= supervisor_order_remove_manager_or_staff true))
(assert (= supervisor_revoke_meeting_resolution true))
(assert (= supervisor_remove_directors_or_supervisors true))
(assert (= supervisor_other_necessary_measures true))
(assert (= supervisor_notify_authority_to_cancel_registration true))
(assert (= supervisor_delegate_monitor_or_liquidator true))
(assert (= supervisor_delegate_exempt_gov_procurement true))
(assert (= monitor_execute_supervision_apply_inspection_rules true))
(assert (= supervisor_takeover_not_apply_company_law_temp_manager true))
(assert (= supervisor_reorganization_petition true))
(assert (= insurance_company_restricted_actions_without_monitor_consent true))
(assert (= cannot_pay_debt_or_fulfill_contract false))
(assert (= capital_adequacy_ratio 150.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio (/ 5.0 2.0)))
(assert (= capital_level 2))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_severely_insufficient_measures_executed_flag false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed_flag false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_executed false))
(assert (= improvement_plan_submitted false))
(assert (= profit_and_net_worth_accelerated_deterioration false))
(assert (= loan_without_sufficient_collateral_or_better_terms_flag false))
(assert (= loan_without_sufficient_collateral_or_better_terms false))
(assert (= loan_guarantee_exceed_board_approval_flag false))
(assert (= loan_guarantee_exceed_board_approval false))
(assert (= violate_article_138_related_regulations false))
(assert (= violate_article_138_2_related_regulations false))
(assert (= violate_article_143_flag false))
(assert (= violate_article_143 false))
(assert (= violate_article_143_5_or_143_6_flag false))
(assert (= violate_article_143_5_or_143_6_measures false))
(assert (= violate_business_scope_regulations false))
(assert (= violate_reserve_requirements false))
(assert (= supervisor_order_improvement_plan false))
(assert (= supervisor_take_over_for_deterioration false))
(assert (= supervisor_take_over_or_order_liquidation false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 34
; Total variables: 52
; Total facts: 52
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
