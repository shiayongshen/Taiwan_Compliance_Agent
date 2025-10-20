; SMT2 file generated from compliance case automatic
; Case ID: case_461
; Generated at: 2025-10-19T16:32:13.165147
;
; This file can be executed with Z3:
;   z3 case_461.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration Bool)
(declare-const branch_establishment_reported Bool)
(declare-const business_restriction_approved Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficiency Bool)
(declare-const capital_level_significant_insufficiency Bool)
(declare-const counseling_not_improved Bool)
(declare-const days_after_deadline Int)
(declare-const deposit_amount_per_financial_institution Real)
(declare-const deposit_limit_approved Bool)
(declare-const derivative_trading_compliance Bool)
(declare-const deterioration_report_approved Bool)
(declare-const deterioration_report_submitted Bool)
(declare-const director_supervisor_removal_registration_cancelled Bool)
(declare-const financial_institution_permitted_business Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const full_discretionary_investment Bool)
(declare-const full_discretionary_investment_approved Bool)
(declare-const full_discretionary_investment_requires_approval Bool)
(declare-const funds_deposit_limit_exceeded Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const inspection_rules_applied Bool)
(declare-const insufficient_and_no_measures Bool)
(declare-const insurance_related_business_approved Bool)
(declare-const investment_accounting_bookkeeping_compliance Bool)
(declare-const investment_derivative_trading_compliance Bool)
(declare-const investment_in_insurance_related_business Bool)
(declare-const investment_in_securities Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const order_capital_increase Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const permit_by_finance_ministry Bool)
(declare-const registration_cancelled Bool)
(declare-const remove_director_or_supervisor Bool)
(declare-const remove_manager_or_staff Bool)
(declare-const report_to_finance_ministry Bool)
(declare-const restriction_approved_by_cabinet Bool)
(declare-const restriction_on_business_or_fund_usage Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const severe_insufficiency_and_no_measures Bool)
(declare-const significant_insufficiency_and_no_measures Bool)
(declare-const special_accounting_compliance Bool)
(declare-const stop_or_limit_insurance_products Bool)
(declare-const supervision_consent_contract_commitment Bool)
(declare-const supervision_consent_other_major_financial Bool)
(declare-const supervision_consent_payment_exceed_limit Bool)
(declare-const supervision_or_takeover_or_shutdown_order Bool)
(declare-const supervision_restrictions Bool)
(declare-const supervisor_execute_inspection Bool)
(declare-const taiwan_cross_strait_violation_penalty Bool)
(declare-const total_funds Real)
(declare-const violate_article_36_1_or_2 Bool)
(declare-const violate_financial_institution_restriction_order Bool)
(declare-const violation_fine_and_imprisonment Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficiency] 資本等級嚴重不足判定
(assert (= capital_level_severe_insufficiency
   (or (not (<= 0.0 net_worth)) (not (<= 50.0 capital_adequacy_ratio)))))

; [insurance:capital_level_significant_insufficiency] 資本等級顯著不足判定
(assert (= capital_level_significant_insufficiency
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級不足判定
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級適足判定
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
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

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_level_4_measures_executed level_4_measures_executed))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_level_3_measures_executed level_3_measures_executed))

; [insurance:capital_level_2_measures_executed] 資本不足等級措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:severe_insufficiency_and_no_measures] 嚴重不足且未完成增資、改善計畫或合併
(assert (= severe_insufficiency_and_no_measures
   (and (= 4 capital_level) (not capital_level_4_measures_executed))))

; [insurance:significant_insufficiency_and_no_measures] 顯著不足且未完成增資、改善計畫或合併
(assert (= significant_insufficiency_and_no_measures
   (and (= 3 capital_level) (not capital_level_3_measures_executed))))

; [insurance:insufficient_and_no_measures] 不足且未完成增資、改善計畫或合併
(assert (= insufficient_and_no_measures
   (and (= 2 capital_level)
        (not (and improvement_plan_submitted improvement_plan_executed)))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化且不能支付債務或履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (and deterioration_report_submitted
        deterioration_report_approved
        (or accelerated_deterioration counseling_not_improved))))

; [insurance:supervision_or_takeover_or_shutdown_order] 主管機關依資本嚴重不足或財務業務惡化情況，為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervision_or_takeover_or_shutdown_order
   (or (and (= 4 capital_level)
            (not capital_level_4_measures_executed)
            (>= 90 days_after_deadline))
       financial_or_business_deterioration)))

; [insurance:restriction_on_business_or_fund_usage] 限制營業或資金運用範圍
(assert restriction_on_business_or_fund_usage)

; [insurance:stop_or_limit_insurance_products] 停售保險商品或限制保險商品開辦
(assert stop_or_limit_insurance_products)

; [insurance:order_capital_increase] 令其增資
(assert order_capital_increase)

; [insurance:remove_manager_or_staff] 解除經理人或職員職務
(assert remove_manager_or_staff)

; [insurance:revoke_statutory_meeting_resolution] 撤銷法定會議決議
(assert revoke_statutory_meeting_resolution)

; [insurance:remove_director_or_supervisor] 解除董（理）事、監察人（監事）職務
(assert remove_director_or_supervisor)

; [insurance:other_necessary_measures] 其他必要之處置
(assert other_necessary_measures)

; [insurance:director_supervisor_removal_registration_cancelled] 解除董（理）事、監察人（監事）職務時，主管機關通知公司登記主管機關廢止其登記
(assert (= director_supervisor_removal_registration_cancelled
   (or registration_cancelled (not remove_director_or_supervisor))))

; [insurance:supervision_restrictions] 監管處分期間保險業不得超過限額支付款項或處分財產、締結契約或重大義務承諾及其他重大影響財務事項
(assert (= supervision_restrictions
   (and (not supervision_consent_payment_exceed_limit)
        (not supervision_consent_contract_commitment)
        (not supervision_consent_other_major_financial))))

; [insurance:supervisor_execute_inspection] 監管人執行監管職務時，準用檢查規定
(assert (= supervisor_execute_inspection inspection_rules_applied))

; [insurance:funds_deposit_limit_exceeded] 存款於每一金融機構金額超過資金百分之十且未經主管機關核准
(assert (let ((a!1 (and (not (<= deposit_amount_per_financial_institution
                         (* (/ 1.0 10.0) total_funds)))
                (not deposit_limit_approved))))
  (= funds_deposit_limit_exceeded a!1)))

; [insurance:investment_in_insurance_related_business] 投資保險相關事業符合主管機關認定
(assert (= investment_in_insurance_related_business insurance_related_business_approved))

; [insurance:investment_derivative_trading_compliance] 從事衍生性商品交易符合主管機關規定
(assert (= investment_derivative_trading_compliance derivative_trading_compliance))

; [insurance:investment_accounting_bookkeeping_compliance] 投資型保險業務專設帳簿管理保存及運用符合主管機關規定
(assert (= investment_accounting_bookkeeping_compliance special_accounting_compliance))

; [insurance:full_discretionary_investment_requires_approval] 保險契約委任全權決定運用標的且投資於有價證券須申請兼營全權委託投資業務
(assert (= full_discretionary_investment_requires_approval
   (or full_discretionary_investment_approved
       (not (and full_discretionary_investment investment_in_securities)))))

; [taiwan_cross_strait_violation_penalty] 違反臺灣地區與大陸地區人民關係條例第81條規定之處罰
(assert (= taiwan_cross_strait_violation_penalty
   (or violate_article_36_1_or_2
       violate_financial_institution_restriction_order)))

; [taiwan_cross_strait_violation_fine_and_imprisonment] 違反規定處以罰鍰及刑罰
(assert (= violation_fine_and_imprisonment
   (or violate_article_36_1_or_2
       violate_financial_institution_restriction_order)))

; [taiwan_cross_strait_financial_institution_permitted_business] 臺灣地區金融保險證券期貨機構經財政部許可與大陸地區人民或機構有業務往來
(assert (= financial_institution_permitted_business permit_by_finance_ministry))

; [taiwan_cross_strait_branch_establishment_reported] 臺灣地區金融保險證券期貨機構在大陸地區設立分支機構已報經財政部許可
(assert (= branch_establishment_reported report_to_finance_ministry))

; [taiwan_cross_strait_business_restriction_approved] 財政部報請行政院核定限制或禁止業務直接往來
(assert (= business_restriction_approved restriction_approved_by_cabinet))

; [meta:penalty_default_false] 預設不處罰
(assert true)

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未完成增資或改善計畫、財務業務惡化未改善、違反監管限制或違反臺灣地區與大陸地區人民關係條例規定時處罰
(assert (= penalty
   (or supervision_restrictions
       financial_or_business_deterioration
       (and (= 4 capital_level) (not capital_level_4_measures_executed))
       taiwan_cross_strait_violation_penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_article_36_1_or_2 true))
(assert (= taiwan_cross_strait_violation_penalty true))
(assert (= violation_fine_and_imprisonment true))
(assert (= penalty true))
(assert (= capital_adequacy_ratio 200.0))
(assert (= net_worth 1000000.0))
(assert (= net_worth_ratio 10.0))
(assert (= capital_level_2_measures_executed false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_4_measures_executed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= accelerated_deterioration false))
(assert (= counseling_not_improved false))
(assert (= deterioration_report_submitted false))
(assert (= deterioration_report_approved false))
(assert (= restriction_on_business_or_fund_usage false))
(assert (= stop_or_limit_insurance_products false))
(assert (= order_capital_increase false))
(assert (= remove_manager_or_staff false))
(assert (= remove_director_or_supervisor false))
(assert (= other_necessary_measures false))
(assert (= branch_establishment_reported false))
(assert (= business_restriction_approved false))
(assert (= permit_by_finance_ministry false))
(assert (= report_to_finance_ministry false))
(assert (= restriction_approved_by_cabinet false))
(assert (= inspection_rules_applied false))
(assert (= funds_deposit_limit_exceeded false))
(assert (= deposit_limit_approved false))
(assert (= derivative_trading_compliance false))
(assert (= insurance_related_business_approved false))
(assert (= special_accounting_compliance false))
(assert (= investment_in_securities false))
(assert (= full_discretionary_investment false))
(assert (= full_discretionary_investment_approved false))
(assert (= registration_cancelled false))
(assert (= director_supervisor_removal_registration_cancelled false))
(assert (= supervision_consent_payment_exceed_limit false))
(assert (= supervision_consent_contract_commitment false))
(assert (= supervision_consent_other_major_financial false))
(assert (= supervision_restrictions false))
(assert (= supervisor_execute_inspection false))
(assert (= days_after_deadline 0))
(assert (= deposit_amount_per_financial_institution 0.0))
(assert (= total_funds 0.0))
(assert (= capital_level 0))
(assert (= capital_level_adequate false))
(assert (= capital_level_insufficient false))
(assert (= capital_level_severe_insufficiency false))
(assert (= capital_level_significant_insufficiency false))
(assert (= financial_institution_permitted_business false))
(assert (= financial_or_business_deterioration false))
(assert (= full_discretionary_investment_requires_approval false))
(assert (= insufficient_and_no_measures false))
(assert (= investment_accounting_bookkeeping_compliance false))
(assert (= investment_derivative_trading_compliance false))
(assert (= investment_in_insurance_related_business false))
(assert (= level_3_measures_executed false))
(assert (= level_4_measures_executed false))
(assert (= revoke_statutory_meeting_resolution false))
(assert (= severe_insufficiency_and_no_measures false))
(assert (= significant_insufficiency_and_no_measures false))
(assert (= supervision_or_takeover_or_shutdown_order false))
(assert (= violate_financial_institution_restriction_order false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 35
; Total variables: 65
; Total facts: 65
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
