; SMT2 file generated from compliance case automatic
; Case ID: case_26
; Generated at: 2025-10-19T05:44:16.983288
;
; This file can be executed with Z3:
;   z3 case_26.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_deadline_ok Bool)
(declare-const adjustment_deadline_years Int)
(declare-const adjustment_order_issued Bool)
(declare-const adjustment_ordered Bool)
(declare-const approval_obtained Bool)
(declare-const approval_received Bool)
(declare-const approved_investment_target Bool)
(declare-const audit_committee_management_included Bool)
(declare-const bank_business_manual_defined Bool)
(declare-const bank_commercial Bool)
(declare-const bank_professional Bool)
(declare-const bank_subcategory Bool)
(declare-const bank_trust_investment Bool)
(declare-const business_days_since_application Int)
(declare-const business_days_since_approval_application Int)
(declare-const business_handling_manual_defined Bool)
(declare-const capital_reduction_applied Bool)
(declare-const capital_reduction_approved Bool)
(declare-const days_since_fhc_established Int)
(declare-const exception_before_conversion Bool)
(declare-const fhc_manager_is_venture_invested_manager Bool)
(declare-const futures_advisor Bool)
(declare-const futures_broker Bool)
(declare-const futures_leveraged_trader Bool)
(declare-const futures_manager Bool)
(declare-const futures_subcategory Bool)
(declare-const futures_trust Bool)
(declare-const group_aml_ctf_plan_established Bool)
(declare-const illegal_pledge Bool)
(declare-const insurance_agent Bool)
(declare-const insurance_broker Bool)
(declare-const insurance_life Bool)
(declare-const insurance_property Bool)
(declare-const insurance_reinsurance Bool)
(declare-const insurance_subcategory Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_policy_coverage Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const invest_target_bank Bool)
(declare-const invest_target_bill_finance Bool)
(declare-const invest_target_credit_card Bool)
(declare-const invest_target_fhc Bool)
(declare-const invest_target_foreign_financial Bool)
(declare-const invest_target_futures Bool)
(declare-const invest_target_in_10_or_11 Bool)
(declare-const invest_target_in_1_to_9 Bool)
(declare-const invest_target_insurance Bool)
(declare-const invest_target_other_related Bool)
(declare-const invest_target_securities Bool)
(declare-const invest_target_trust Bool)
(declare-const invest_target_venture_capital Bool)
(declare-const investment_approval_status Bool)
(declare-const investment_illegal Bool)
(declare-const investment_without_approval_penalty Bool)
(declare-const organization_rules_defined Bool)
(declare-const penalty Bool)
(declare-const pledge_to_subsidiary Bool)
(declare-const policy_revision_reviewed Bool)
(declare-const prohibited_manager_in_venture_invested Bool)
(declare-const reporting_required Bool)
(declare-const reporting_submitted Bool)
(declare-const salary_committee_management_included Bool)
(declare-const securities_advisor Bool)
(declare-const securities_broker Bool)
(declare-const securities_subcategory Bool)
(declare-const securities_trust Bool)
(declare-const shareholder_approval_required Bool)
(declare-const shareholder_approval_status Bool)
(declare-const shareholder_illegal_pledge Bool)
(declare-const shareholder_reporting_compliance Bool)
(declare-const shareholder_reporting_required Bool)
(declare-const shareholding_limit_compliance Bool)
(declare-const shareholding_penalty Bool)
(declare-const shareholding_percentage Real)
(declare-const subsidiary_business_exceed_limit Bool)
(declare-const subsidiary_business_investment Bool)
(declare-const subsidiary_business_management Bool)
(declare-const subsidiary_business_or_investment_exceed_limit Bool)
(declare-const subsidiary_business_scope_ok Bool)
(declare-const subsidiary_capital_reduction_approval Bool)
(declare-const subsidiary_control_defined Bool)
(declare-const subsidiary_investment_exceed_limit Bool)
(declare-const subsidiary_management_included Bool)
(declare-const trust_business_manual_defined Bool)
(declare-const violation_dispose_subsidiary_shares Bool)
(declare-const violation_other_measures Bool)
(declare-const violation_penalty_conditions Bool)
(declare-const violation_remove_director_or_supervisor Bool)
(declare-const violation_remove_manager_or_staff Bool)
(declare-const violation_revoke_license Bool)
(declare-const violation_revoke_meeting_resolution Bool)
(declare-const violation_suspend_subsidiary_business Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:subsidiary_business_scope_ok] 子公司業務限於投資及對被投資事業之管理
(assert (= subsidiary_business_scope_ok
   (and subsidiary_business_investment subsidiary_business_management)))

; [fhc:approved_investment_target] 投資事業為主管機關核准之範圍
(assert (= approved_investment_target
   (or invest_target_trust
       invest_target_credit_card
       invest_target_other_related
       invest_target_securities
       invest_target_foreign_financial
       invest_target_futures
       invest_target_fhc
       invest_target_bank
       invest_target_bill_finance
       invest_target_insurance
       invest_target_venture_capital)))

; [fhc:bank_subcategory] 銀行業子類別分類（商業銀行、專業銀行、信託投資公司）
(assert (= (ite bank_subcategory 1 0)
   (ite bank_commercial
        1
        (ite bank_professional 2 (ite bank_trust_investment 3 0)))))

; [fhc:insurance_subcategory] 保險業子類別分類（財產保險、人身保險、再保險、代理人及經紀人）
(assert (let ((a!1 (ite insurance_life
                2
                (ite insurance_reinsurance
                     3
                     (ite insurance_agent 4 (ite insurance_broker 5 0))))))
  (= (ite insurance_subcategory 1 0) (ite insurance_property 1 a!1))))

; [fhc:securities_subcategory] 證券業子類別分類（證券商、證券投信、證券投顧）
(assert (= (ite securities_subcategory 1 0)
   (ite securities_broker
        1
        (ite securities_trust 2 (ite securities_advisor 3 0)))))

; [fhc:futures_subcategory] 期貨業子類別分類（期貨商、槓桿交易商、期貨信託、期貨經理、期貨顧問）
(assert (let ((a!1 (ite futures_leveraged_trader
                2
                (ite futures_trust
                     3
                     (ite futures_manager 4 (ite futures_advisor 5 0))))))
  (= (ite futures_subcategory 1 0) (ite futures_broker 1 a!1))))

; [fhc:investment_approval_status] 投資行為是否經主管機關核准
(assert (let ((a!1 (and (not approval_received)
                (or (and invest_target_in_10_or_11
                         (>= 30 business_days_since_application))
                    (and invest_target_in_1_to_9
                         (>= 15 business_days_since_application))))))
  (= investment_approval_status (or approval_received a!1))))

; [fhc:investment_without_approval_penalty] 未經核准投資行為無表決權且應限令處分
(assert (= investment_without_approval_penalty
   (and (not investment_approval_status) investment_illegal)))

; [fhc:subsidiary_business_or_investment_exceed_limit] 子公司業務或投資逾越法令規定範圍
(assert (= subsidiary_business_or_investment_exceed_limit
   (or subsidiary_business_exceed_limit subsidiary_investment_exceed_limit)))

; [fhc:adjustment_ordered] 主管機關限期命金融控股公司調整逾越範圍
(assert (= adjustment_ordered
   (or (not subsidiary_business_or_investment_exceed_limit)
       adjustment_order_issued)))

; [fhc:adjustment_deadline] 調整期限最長三年，得申請延長二次，每次二年
(assert (= adjustment_deadline_ok
   (and (>= 7 adjustment_deadline_years) (<= 0 adjustment_deadline_years))))

; [fhc:prohibited_manager_in_venture_invested] 金融控股公司負責人或職員不得擔任創業投資事業所投資事業經理人
(assert (not (= fhc_manager_is_venture_invested_manager
        prohibited_manager_in_venture_invested)))

; [fhc:subsidiary_capital_reduction_approval] 子公司減資應事先申請核准
(assert (= subsidiary_capital_reduction_approval
   (and capital_reduction_applied capital_reduction_approved)))

; [fhc:internal_control_established] 金融控股公司建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [fhc:internal_control_executed] 金融控股公司內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [fhc:violation_penalty_conditions] 違反法令、章程或有礙健全經營之虞時主管機關得處分
(assert (= violation_penalty_conditions
   (or violation_revoke_meeting_resolution
       violation_suspend_subsidiary_business
       violation_revoke_license
       violation_dispose_subsidiary_shares
       violation_remove_director_or_supervisor
       violation_other_measures
       violation_remove_manager_or_staff)))

; [fhc:shareholder_reporting_compliance] 同一人或同一關係人持股申報及核准合規
(assert (= shareholder_reporting_compliance
   (and reporting_required reporting_submitted approval_obtained)))

; [fhc:shareholding_limit_compliance] 持股未超過法定限制且未違反質權設定規定
(assert (= shareholding_limit_compliance
   (and (>= 10.0 shareholding_percentage) (not illegal_pledge))))

; [fhc:shareholding_penalty] 未依規定申報或核准持股超過部分無表決權且應限期處分
(assert (= shareholding_penalty
   (or (not shareholder_reporting_compliance)
       (not shareholding_limit_compliance))))

; [fhc:internal_control_compliance] 金融控股公司建立且確實執行內部控制及稽核制度
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [fhc:internal_control_policy_coverage] 內部控制制度涵蓋所有營運活動及必要政策程序
(assert (= internal_control_policy_coverage
   (and organization_rules_defined
        business_handling_manual_defined
        subsidiary_management_included
        bank_business_manual_defined
        trust_business_manual_defined
        salary_committee_management_included
        audit_committee_management_included
        subsidiary_control_defined
        group_aml_ctf_plan_established
        policy_revision_reviewed)))

; [fhc:shareholder_reporting_required] 同一人或同一關係人持股申報義務
(assert (= shareholder_reporting_required
   (or (not (<= shareholding_percentage 5.0))
       (and (>= 10.0 shareholding_percentage)
            (>= 180 days_since_fhc_established)))))

; [fhc:shareholder_approval_required] 持股超過10%、25%、50%應事先申請核准
(assert (= shareholder_approval_required
   (or (not (<= shareholding_percentage 10.0))
       (not (<= shareholding_percentage 25.0))
       (not (<= shareholding_percentage 50.0)))))

; [fhc:shareholder_approval_status] 持股申請核准狀態
(assert (= shareholder_approval_status
   (or approval_received (>= 15 business_days_since_approval_application))))

; [fhc:shareholder_illegal_pledge] 持股股票不得設定質權予子公司（例外除外）
(assert (= shareholder_illegal_pledge
   (and (not (<= shareholding_percentage 10.0))
        pledge_to_subsidiary
        (not exception_before_conversion))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法及相關規定時處罰
(assert (= penalty
   (or (not prohibited_manager_in_venture_invested)
       violation_penalty_conditions
       (not investment_approval_status)
       (not subsidiary_capital_reduction_approval)
       (not shareholder_reporting_compliance)
       (not internal_control_compliance)
       (not shareholding_limit_compliance)
       investment_without_approval_penalty
       (not approved_investment_target)
       shareholding_penalty
       (not subsidiary_business_scope_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= subsidiary_business_investment true))
(assert (= subsidiary_business_management false))
(assert (= approved_investment_target true))
(assert (= investment_approval_status true))
(assert (= investment_illegal false))
(assert (= capital_reduction_applied false))
(assert (= capital_reduction_approved false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= organization_rules_defined false))
(assert (= business_handling_manual_defined false))
(assert (= subsidiary_management_included false))
(assert (= bank_business_manual_defined false))
(assert (= trust_business_manual_defined false))
(assert (= salary_committee_management_included false))
(assert (= audit_committee_management_included false))
(assert (= subsidiary_control_defined false))
(assert (= group_aml_ctf_plan_established false))
(assert (= policy_revision_reviewed false))
(assert (= fhc_manager_is_venture_invested_manager false))
(assert (= shareholding_percentage 0.0))
(assert (= illegal_pledge false))
(assert (= pledge_to_subsidiary false))
(assert (= exception_before_conversion false))
(assert (= reporting_required true))
(assert (= reporting_submitted true))
(assert (= approval_obtained true))
(assert (= shareholder_reporting_compliance true))
(assert (= shareholding_limit_compliance true))
(assert (= shareholding_penalty false))
(assert (= subsidiary_business_exceed_limit true))
(assert (= subsidiary_investment_exceed_limit false))
(assert (= subsidiary_business_or_investment_exceed_limit true))
(assert (= adjustment_order_issued true))
(assert (= adjustment_ordered true))
(assert (= adjustment_deadline_years 0))
(assert (= adjustment_deadline_ok true))
(assert (= violation_revoke_meeting_resolution false))
(assert (= violation_suspend_subsidiary_business false))
(assert (= violation_remove_manager_or_staff false))
(assert (= violation_remove_director_or_supervisor false))
(assert (= violation_dispose_subsidiary_shares false))
(assert (= violation_revoke_license false))
(assert (= violation_other_measures true))
(assert (= violation_penalty_conditions true))
(assert (= penalty true))
(assert (= approval_received false))
(assert (= bank_commercial false))
(assert (= bank_professional false))
(assert (= bank_subcategory false))
(assert (= bank_trust_investment false))
(assert (= business_days_since_application 0))
(assert (= business_days_since_approval_application 0))
(assert (= days_since_fhc_established 0))
(assert (= futures_advisor false))
(assert (= futures_broker false))
(assert (= futures_leveraged_trader false))
(assert (= futures_manager false))
(assert (= futures_subcategory false))
(assert (= futures_trust false))
(assert (= insurance_agent false))
(assert (= insurance_broker false))
(assert (= insurance_life false))
(assert (= insurance_property false))
(assert (= insurance_reinsurance false))
(assert (= insurance_subcategory false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_policy_coverage false))
(assert (= invest_target_bank false))
(assert (= invest_target_bill_finance false))
(assert (= invest_target_credit_card false))
(assert (= invest_target_fhc false))
(assert (= invest_target_foreign_financial false))
(assert (= invest_target_futures false))
(assert (= invest_target_in_10_or_11 false))
(assert (= invest_target_in_1_to_9 false))
(assert (= invest_target_insurance false))
(assert (= invest_target_other_related false))
(assert (= invest_target_securities false))
(assert (= invest_target_trust false))
(assert (= invest_target_venture_capital false))
(assert (= investment_without_approval_penalty false))
(assert (= prohibited_manager_in_venture_invested false))
(assert (= securities_advisor false))
(assert (= securities_broker false))
(assert (= securities_subcategory false))
(assert (= securities_trust false))
(assert (= shareholder_approval_required false))
(assert (= shareholder_approval_status false))
(assert (= shareholder_illegal_pledge false))
(assert (= shareholder_reporting_required false))
(assert (= subsidiary_business_scope_ok false))
(assert (= subsidiary_capital_reduction_approval false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 27
; Total variables: 95
; Total facts: 95
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
