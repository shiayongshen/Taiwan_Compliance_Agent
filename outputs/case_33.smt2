; SMT2 file generated from compliance case automatic
; Case ID: case_33
; Generated at: 2025-10-20T23:32:45.182875
;
; This file can be executed with Z3:
;   z3 case_33.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const academic_performance_good Bool)
(declare-const ad_discloses_commissioner_and_funder Bool)
(declare-const advertisement_prohibited_behaviors Bool)
(declare-const advisor_change_approval_required Bool)
(declare-const advisor_revoke_license_for_illegal_suspend Bool)
(declare-const advisor_suspend_limit Int)
(declare-const applies_for_full_discretionary Bool)
(declare-const asset_insufficient_improved Bool)
(declare-const asset_insufficient_penalty Bool)
(declare-const assets Real)
(declare-const brokerage_firm_operates_full_discretionary Bool)
(declare-const brokerage_qualification_requirements Bool)
(declare-const business_guarantee_deposit_required Bool)
(declare-const business_guarantee_deposit_restrictions_ok Bool)
(declare-const business_operation_months Int)
(declare-const business_sanction_level Int)
(declare-const change_business_scope Bool)
(declare-const change_capital Bool)
(declare-const change_company_name Bool)
(declare-const change_office_location Bool)
(declare-const client_delegated_assets Real)
(declare-const custodian_performs_full_discretionary_custody Bool)
(declare-const custodian_qualified_bank Bool)
(declare-const damage_occurred Bool)
(declare-const department_and_staffing_standard Bool)
(declare-const department_head_qualified Bool)
(declare-const deposit_change_reported Bool)
(declare-const deposit_guarantee Bool)
(declare-const deposit_no_pledge Bool)
(declare-const deposit_not_distributed Bool)
(declare-const dissolution_or_merger Bool)
(declare-const education_recognized Bool)
(declare-const exempted_by_other_regulations Bool)
(declare-const false_approval_claim Bool)
(declare-const financial_accounting_department_established Bool)
(declare-const financial_report_audited Bool)
(declare-const financial_report_board_approved Bool)
(declare-const financial_report_compliance Bool)
(declare-const financial_report_submission_months_after_year_end Int)
(declare-const financial_report_supervisor_approved Bool)
(declare-const full_discretionary_custodian_definition Bool)
(declare-const full_discretionary_investment_applicability Bool)
(declare-const full_discretionary_investment_definition Bool)
(declare-const general_manager_count Int)
(declare-const general_manager_qualification Bool)
(declare-const general_manager_required Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_deposit_restrictions_ok Bool)
(declare-const guaranteed_profit_or_loss Bool)
(declare-const impersonation_of_famous_persons Bool)
(declare-const improvement_completed Bool)
(declare-const improvement_period_months Int)
(declare-const internet_media_advertisement_prohibition Bool)
(declare-const internet_media_advertisement_requirements Bool)
(declare-const internet_media_intentional_or_gross_negligence Bool)
(declare-const internet_media_joint_liability Bool)
(declare-const internet_media_liability_relief_conditions Bool)
(declare-const internet_media_limits_access Bool)
(declare-const internet_media_other_measures Bool)
(declare-const internet_media_performed_required_measures Bool)
(declare-const internet_media_publishes_non_securities_ad Bool)
(declare-const internet_media_publishes_violating_ad Bool)
(declare-const internet_media_received_financial_benefit Bool)
(declare-const internet_media_removes_ad Bool)
(declare-const internet_media_stops_broadcast Bool)
(declare-const investment_analysis_and_solicitation Bool)
(declare-const investment_decision_and_execution Bool)
(declare-const investment_experience_years Int)
(declare-const investment_in_securities_or_approved_items Bool)
(declare-const investment_research_department_established Bool)
(declare-const latest_net_asset_value_per_share Real)
(declare-const liabilities Real)
(declare-const manager_qualified Bool)
(declare-const meets_analyst_qualification Bool)
(declare-const misleading_recommendations Bool)
(declare-const net_asset_value_improved Bool)
(declare-const net_asset_value_improvement_exempt Bool)
(declare-const net_asset_value_improvement_penalty Bool)
(declare-const net_asset_value_improvement_required Bool)
(declare-const net_asset_value_per_share Real)
(declare-const no_other_equivalent_manager Bool)
(declare-const other_approval_matters Bool)
(declare-const other_improper_recommendations Bool)
(declare-const other_qualification_proven Bool)
(declare-const paid_in_capital Real)
(declare-const par_value_per_share Real)
(declare-const penalty Bool)
(declare-const recent_1_year_more_penalties_count Int)
(declare-const recent_1_year_trading_suspension Bool)
(declare-const recent_2_years_most_serious_penalties_count Int)
(declare-const recent_3_months_major_penalties_count Int)
(declare-const recent_6_months_other_penalties_count Int)
(declare-const self_suspend_duration_months Int)
(declare-const staff_qualified Bool)
(declare-const suspend_application_once_only Bool)
(declare-const suspend_application_submitted Bool)
(declare-const suspend_period_months Int)
(declare-const suspend_resume_cease_business Bool)
(declare-const transfer_major_business_or_assets Bool)
(declare-const trust_company_full_discretionary_application Bool)
(declare-const trust_company_manages_approved_assets Bool)
(declare-const trust_company_operates_full_discretionary Bool)
(declare-const violation_dismissal Bool)
(declare-const violation_other_measures Bool)
(declare-const violation_revoke_license Bool)
(declare-const violation_suspend_fund_or_new_business Bool)
(declare-const violation_suspend_operation Bool)
(declare-const violation_warning Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:business_sanction_level] 主管機關對違反法令事業之處分等級（1=警告,2=解除職務,3=停止募集或新增業務,4=停業,5=廢止營業許可,6=其他處置）
(assert (let ((a!1 (ite violation_suspend_fund_or_new_business
                3
                (ite violation_suspend_operation
                     4
                     (ite violation_revoke_license
                          5
                          (ite violation_other_measures 6 0))))))
  (= business_sanction_level
     (ite violation_warning 1 (ite violation_dismissal 2 a!1)))))

; [securities:advisor_change_approval_required] 證券投資顧問事業變更事項需先報請本會核准
(assert (= advisor_change_approval_required
   (or dissolution_or_merger
       change_capital
       change_company_name
       change_office_location
       transfer_major_business_or_assets
       change_business_scope
       other_approval_matters
       suspend_resume_cease_business)))

; [securities:advisor_suspend_limit] 證券投資顧問事業停業申請限制及期限
(assert (= advisor_suspend_limit
   (ite (and suspend_application_once_only (>= 12 suspend_period_months)) 1 0)))

; [securities:advisor_revoke_license_for_illegal_suspend] 未依規定申請停業且自行停業超過三個月者，得廢止營業許可
(assert (= advisor_revoke_license_for_illegal_suspend
   (and (not suspend_application_submitted)
        (not (<= self_suspend_duration_months 3)))))

; [securities:business_guarantee_deposit_required] 證券投資顧問事業應向符合條件金融機構提存營業保證金
(assert (= business_guarantee_deposit_required
   (or deposit_guarantee (not exempted_by_other_regulations))))

; [securities:business_guarantee_deposit_amount] 營業保證金提存金額依實收資本額分級
(assert (let ((a!1 (ite (and (<= 200000000.0 paid_in_capital)
                     (not (<= 300000000.0 paid_in_capital)))
                20000000.0
                (ite (<= 300000000.0 paid_in_capital) 25000000.0 0.0))))
(let ((a!2 (ite (and (<= 100000000.0 paid_in_capital)
                     (not (<= 200000000.0 paid_in_capital)))
                15000000.0
                a!1)))
  (= guarantee_deposit_amount
     (ite (<= 100000000.0 paid_in_capital) a!2 10000000.0)))))

; [securities:business_guarantee_deposit_restrictions] 營業保證金不得設定質權或分散提存，變更須報本會核准
(assert (= guarantee_deposit_restrictions_ok
   (and deposit_no_pledge deposit_not_distributed deposit_change_reported)))

; [securities:financial_report_compliance] 證券投資顧問事業財務報告依規定編製並申報
(assert (= financial_report_compliance
   (and financial_report_audited
        financial_report_board_approved
        financial_report_supervisor_approved
        (>= 3 financial_report_submission_months_after_year_end))))

; [securities:net_asset_value_improvement_required] 每股淨值低於面額者應於一年內改善
(assert (= net_asset_value_improvement_required
   (and (not (<= par_value_per_share net_asset_value_per_share))
        (>= 12 improvement_period_months))))

; [securities:net_asset_value_improvement_exempt] 取得營業執照未滿一年者，不適用淨值改善規定
(assert (not (= (<= 12 business_operation_months) net_asset_value_improvement_exempt)))

; [securities:net_asset_value_improvement_penalty] 淨值低於面額且未改善者限制證券投資分析活動
(assert (= net_asset_value_improvement_penalty
   (and (not (<= par_value_per_share net_asset_value_per_share))
        (not net_asset_value_improved)
        (not net_asset_value_improvement_exempt))))

; [securities:asset_insufficient_penalty] 資產不足抵償負債且未改善者，得廢止營業許可
(assert (= asset_insufficient_penalty
   (and (not (<= liabilities assets)) (not asset_insufficient_improved))))

; [securities:general_manager_required] 證券投資顧問事業應置一名總經理且不得有其他相當職責人
(assert (= general_manager_required
   (and (= 1 general_manager_count) no_other_equivalent_manager)))

; [securities:general_manager_qualification] 總經理應具備資格條件之一
(assert (= general_manager_qualification
   (or (and meets_analyst_qualification (<= 1 investment_experience_years))
       other_qualification_proven
       (and education_recognized
            (<= 4 investment_experience_years)
            academic_performance_good))))

; [securities:department_and_staffing_standard] 證券投資顧問事業應設投資研究及財務會計部門，配置適任人員並符合資格條件
(assert (= department_and_staffing_standard
   (and investment_research_department_established
        financial_accounting_department_established
        manager_qualified
        department_head_qualified
        staff_qualified)))

; [securities:full_discretionary_investment_definition] 全權委託投資業務定義
(assert (= full_discretionary_investment_definition
   (and (= client_delegated_assets 1.0)
        investment_in_securities_or_approved_items
        investment_decision_and_execution)))

; [securities:full_discretionary_investment_applicability] 兼營全權委託投資業務者適用本辦法相關規定
(assert (= full_discretionary_investment_applicability
   (or brokerage_firm_operates_full_discretionary
       trust_company_operates_full_discretionary)))

; [securities:trust_company_full_discretionary_application] 信託業辦理特定全權委託投資業務應申請兼營並依規定辦理
(assert (= trust_company_full_discretionary_application
   (and trust_company_manages_approved_assets applies_for_full_discretionary)))

; [securities:full_discretionary_custodian_definition] 全權委託保管機構定義
(assert (= full_discretionary_custodian_definition
   (and custodian_qualified_bank custodian_performs_full_discretionary_custody)))

; [securities:advertisement_prohibited_behaviors] 非證券投資信託及顧問事業不得有不當廣告行為
(assert (not (= (or guaranteed_profit_or_loss
            false_approval_claim
            investment_analysis_and_solicitation
            other_improper_recommendations
            impersonation_of_famous_persons
            misleading_recommendations)
        advertisement_prohibited_behaviors)))

; [securities:internet_media_advertisement_requirements] 網路媒體刊登非證券投資信託及顧問事業廣告應載明委託及出資資訊
(assert (= internet_media_advertisement_requirements
   (or ad_discloses_commissioner_and_funder
       (not internet_media_publishes_non_securities_ad))))

; [securities:internet_media_advertisement_prohibition] 網路媒體不得刊登違規廣告，違規後應主動或通知移除等處置
(assert (= internet_media_advertisement_prohibition
   (or internet_media_removes_ad
       (not internet_media_publishes_violating_ad)
       internet_media_other_measures
       internet_media_stops_broadcast
       internet_media_limits_access)))

; [securities:internet_media_joint_liability] 網路媒體刊登違規廣告致損害者，與委託及出資者負連帶賠償責任
(assert (= internet_media_joint_liability
   (and internet_media_publishes_violating_ad
        damage_occurred
        (not internet_media_performed_required_measures))))

; [securities:internet_media_liability_relief_conditions] 網路媒體未獲利益或非故意重大過失者得減輕或免除責任
(assert (= internet_media_liability_relief_conditions
   (or (not internet_media_intentional_or_gross_negligence)
       (not internet_media_received_financial_benefit))))

; [securities:brokerage_qualification_requirements] 證券經紀商或期貨經紀商申請兼營證券投資顧問業務之資格條件
(assert (= brokerage_qualification_requirements
   (and (>= latest_net_asset_value_per_share par_value_per_share)
        (not (<= 3 recent_3_months_major_penalties_count))
        (not (<= 1 recent_6_months_other_penalties_count))
        (not (<= 1 recent_1_year_more_penalties_count))
        (not (<= 1 recent_2_years_most_serious_penalties_count))
        improvement_completed
        (not recent_1_year_trading_suspension))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令或規定之任一情形時處罰
(assert (let ((a!1 (or violation_revoke_license
               (and (not suspend_application_submitted)
                    (not (<= self_suspend_duration_months 3)))
               (and (not (<= liabilities assets))
                    (not asset_insufficient_improved))
               (not internet_media_advertisement_requirements)
               (not department_and_staffing_standard)
               (not general_manager_qualification)
               violation_warning
               violation_suspend_operation
               advisor_change_approval_required
               (and internet_media_publishes_violating_ad
                    damage_occurred
                    (not internet_media_performed_required_measures))
               (not financial_report_compliance)
               (and (not (<= par_value_per_share net_asset_value_per_share))
                    (not net_asset_value_improved)
                    (not net_asset_value_improvement_exempt))
               (not business_guarantee_deposit_required)
               violation_suspend_fund_or_new_business
               (not general_manager_required)
               (not full_discretionary_investment_definition)
               violation_other_measures
               (not full_discretionary_investment_applicability)
               violation_dismissal
               (not (or (not internet_media_intentional_or_gross_negligence)
                        (not internet_media_received_financial_benefit)))
               (not brokerage_qualification_requirements)
               (not business_guarantee_deposit_restrictions_ok)
               (not full_discretionary_custodian_definition)
               (not advertisement_prohibited_behaviors)
               (and internet_media_publishes_violating_ad
                    (not (or internet_media_removes_ad
                             internet_media_other_measures
                             internet_media_stops_broadcast
                             internet_media_limits_access)))
               (not trust_company_full_discretionary_application))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_revoke_license true))
(assert (= advisor_change_approval_required true))
(assert (= change_office_location true))
(assert (= business_guarantee_deposit_required true))
(assert (= deposit_guarantee false))
(assert (= asset_insufficient_penalty true))
(assert (= assets 4000000))
(assert (= liabilities 5000000))
(assert (= asset_insufficient_improved false))
(assert (= general_manager_required false))
(assert (= general_manager_count 0))
(assert (= no_other_equivalent_manager true))
(assert (= general_manager_qualification false))
(assert (= investment_research_department_established false))
(assert (= financial_accounting_department_established false))
(assert (= manager_qualified false))
(assert (= department_head_qualified false))
(assert (= staff_qualified false))
(assert (= department_and_staffing_standard false))
(assert (= business_guarantee_deposit_restrictions_ok false))
(assert (= deposit_no_pledge false))
(assert (= deposit_not_distributed false))
(assert (= deposit_change_reported false))
(assert (= financial_report_audited false))
(assert (= financial_report_board_approved false))
(assert (= financial_report_supervisor_approved false))
(assert (= financial_report_compliance false))
(assert (= business_operation_months 24))
(assert (= net_asset_value_per_share 8.0))
(assert (= par_value_per_share 10.0))
(assert (= net_asset_value_improved false))
(assert (= net_asset_value_improvement_exempt false))
(assert (= net_asset_value_improvement_penalty true))
(assert (= improvement_period_months 24))
(assert (= improvement_completed false))
(assert (= violation_warning false))
(assert (= violation_dismissal false))
(assert (= violation_suspend_fund_or_new_business false))
(assert (= violation_suspend_operation false))
(assert (= violation_other_measures false))
(assert (= change_company_name false))
(assert (= change_capital false))
(assert (= change_business_scope false))
(assert (= transfer_major_business_or_assets false))
(assert (= dissolution_or_merger false))
(assert (= suspend_resume_cease_business false))
(assert (= suspend_application_submitted false))
(assert (= self_suspend_duration_months 0))
(assert (= suspend_application_once_only true))
(assert (= suspend_period_months 0))
(assert (= false_approval_claim false))
(assert (= investment_analysis_and_solicitation false))
(assert (= guaranteed_profit_or_loss false))
(assert (= misleading_recommendations false))
(assert (= impersonation_of_famous_persons false))
(assert (= other_improper_recommendations false))
(assert (= internet_media_publishes_non_securities_ad false))
(assert (= ad_discloses_commissioner_and_funder true))
(assert (= internet_media_publishes_violating_ad false))
(assert (= internet_media_removes_ad false))
(assert (= internet_media_limits_access false))
(assert (= internet_media_stops_broadcast false))
(assert (= internet_media_other_measures false))
(assert (= internet_media_performed_required_measures false))
(assert (= internet_media_received_financial_benefit false))
(assert (= internet_media_intentional_or_gross_negligence false))
(assert (= damage_occurred false))
(assert (= brokerage_firm_operates_full_discretionary false))
(assert (= trust_company_operates_full_discretionary false))
(assert (= applies_for_full_discretionary false))
(assert (= trust_company_manages_approved_assets false))
(assert (= trust_company_full_discretionary_application false))
(assert (= custodian_qualified_bank false))
(assert (= custodian_performs_full_discretionary_custody false))
(assert (= full_discretionary_investment_definition false))
(assert (= full_discretionary_investment_applicability false))
(assert (= other_approval_matters false))
(assert (= paid_in_capital 10000000))
(assert (= guarantee_deposit_amount 10000000))
(assert (= academic_performance_good false))
(assert (= education_recognized false))
(assert (= meets_analyst_qualification false))
(assert (= investment_experience_years 0))
(assert (= other_qualification_proven false))
(assert (= brokerage_qualification_requirements false))
(assert (= recent_3_months_major_penalties_count 1))
(assert (= recent_6_months_other_penalties_count 1))
(assert (= recent_1_year_more_penalties_count 1))
(assert (= recent_2_years_most_serious_penalties_count 1))
(assert (= recent_1_year_trading_suspension true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 27
; Total variables: 108
; Total facts: 90
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
