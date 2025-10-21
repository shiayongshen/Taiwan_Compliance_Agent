; SMT2 file generated from compliance case automatic
; Case ID: case_239
; Generated at: 2025-10-21T05:17:57.786658
;
; This file can be executed with Z3:
;   z3 case_239.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const apply_bank_law_61_1 Bool)
(declare-const bank_violation Bool)
(declare-const bill_finance_violation Bool)
(declare-const business_guidance Bool)
(declare-const collect_local_financial_regulations Bool)
(declare-const compliance_supervisor_issues_opinion_before_new_business Bool)
(declare-const compliance_unit_duties Bool)
(declare-const confirm_regulations_updated Bool)
(declare-const consultation_channel Bool)
(declare-const consultation_channel_established Bool)
(declare-const designate_guidance_agency Bool)
(declare-const director_supervisor_removal_notify Bool)
(declare-const dispose_subsidiary_shares Bool)
(declare-const dissolution_and_liquidation Bool)
(declare-const document_retention_years Int)
(declare-const e_payment_violation Bool)
(declare-const engage_external_expert_for_high_risk_verification Bool)
(declare-const ensure_compliance_resources_adequate Bool)
(declare-const ensure_compliance_supervisor_qualification Bool)
(declare-const establish_clear_communication_system Bool)
(declare-const establish_risk_assessment_and_monitoring Bool)
(declare-const exempt_from_compliance_unit_duties_4 Bool)
(declare-const financial_holding_violation Bool)
(declare-const foreign_branch_compliance Bool)
(declare-const implement_self_assessment Bool)
(declare-const includes_deficiency_analysis Bool)
(declare-const includes_improvement_suggestions Bool)
(declare-const insurance_agent_violation Bool)
(declare-const internal_audit_exemption Bool)
(declare-const legal_limit_directors Int)
(declare-const legal_limit_shares Int)
(declare-const non_e_payment_business_operated_with_permit Bool)
(declare-const non_e_payment_business_violation Bool)
(declare-const notify_company_registration_authority Bool)
(declare-const notify_ministry_of_economy Bool)
(declare-const operational_deficiency_exists Bool)
(declare-const order_closure_of_branches_or_departments Bool)
(declare-const order_company_remove_manager_or_staff Bool)
(declare-const order_or_prohibit_asset_disposition Bool)
(declare-const order_provision_of_reserve_funds Bool)
(declare-const order_provision_of_reserve_or_capital_increase Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalties_applicable Bool)
(declare-const penalty Bool)
(declare-const penalty_decision_made Bool)
(declare-const penalty_types Bool)
(declare-const prohibit_use_financial_holding_name Bool)
(declare-const provide_appropriate_training Bool)
(declare-const remove_manager_or_staff Bool)
(declare-const remove_manager_or_staff_or_suspend Bool)
(declare-const remove_or_suspend_company_director_or_supervisor Bool)
(declare-const remove_or_suspend_director_or_supervisor Bool)
(declare-const report_submitted Bool)
(declare-const report_to_board_includes_analysis Bool)
(declare-const restrict_business_scope Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_all_or_part_business_permit Bool)
(declare-const revoke_permit Bool)
(declare-const revoke_permit_penalty Bool)
(declare-const revoke_permit_requirements Bool)
(declare-const revoke_shareholders_or_board_resolution Bool)
(declare-const revoke_statutory_meeting_resolution Bool)
(declare-const self_assessment_document_retention Bool)
(declare-const self_assessment_frequency Int)
(declare-const self_assessment_times_per_year Int)
(declare-const set_evaluation_procedures_and_supervise Bool)
(declare-const subsidiary_directors_appointed Bool)
(declare-const subsidiary_shares_held Int)
(declare-const supervise_implementation_of_internal_rules Bool)
(declare-const suspend_partial_business Bool)
(declare-const suspend_subsidiary_business_part_or_all Bool)
(declare-const unit_is_internal_audit Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [financial_holding:violation_occurred] 金融控股公司違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred financial_holding_violation))

; [financial_holding:penalties_applicable] 主管機關得視情節輕重為下列處分
(assert (= penalties_applicable (and violation_occurred penalty_decision_made)))

; [financial_holding:penalty_types] 金融控股公司可處分類型
(assert (= penalty_types
   (and (or remove_manager_or_staff
            revoke_permit
            dispose_subsidiary_shares
            remove_or_suspend_director_or_supervisor
            other_necessary_measures
            suspend_subsidiary_business_part_or_all
            revoke_statutory_meeting_resolution)
        violation_occurred)))

; [financial_holding:director_supervisor_removal_notify] 解除董事、監察人職務時通知經濟部廢止登記
(assert (= director_supervisor_removal_notify
   (or notify_ministry_of_economy
       (not remove_or_suspend_director_or_supervisor))))

; [financial_holding:revoke_permit_requirements] 廢止許可時處分股份及董事人數並禁止使用名稱
(assert (let ((a!1 (or (not revoke_permit)
               (and (<= subsidiary_shares_held legal_limit_shares)
                    (>= legal_limit_directors
                        (ite subsidiary_directors_appointed 1 0))
                    prohibit_use_financial_holding_name))))
  (= revoke_permit_requirements a!1)))

; [financial_holding:revoke_permit_penalty] 未於期限內完成處分者應解散清算
(assert (let ((a!1 (or (and (<= subsidiary_shares_held legal_limit_shares)
                    (>= legal_limit_directors
                        (ite subsidiary_directors_appointed 1 0))
                    prohibit_use_financial_holding_name)
               dissolution_and_liquidation)))
  (= revoke_permit_penalty a!1)))

; [internal_control:consultation_channel_established] 建立法令規章諮詢溝通管道
(assert (= consultation_channel_established consultation_channel))

; [internal_control:report_to_board_includes_analysis] 法令遵循單位提報董事會報告包含缺失分析及改善建議
(assert (= report_to_board_includes_analysis
   (and report_submitted
        includes_deficiency_analysis
        includes_improvement_suggestions)))

; [internal_control:compliance_unit_duties] 法令遵循單位應辦理事項
(assert (= compliance_unit_duties
   (and establish_clear_communication_system
        confirm_regulations_updated
        compliance_supervisor_issues_opinion_before_new_business
        set_evaluation_procedures_and_supervise
        provide_appropriate_training
        supervise_implementation_of_internal_rules)))

; [internal_control:internal_audit_exemption] 內部稽核單位自行訂定評估程序不適用部分規定
(assert (= internal_audit_exemption
   (or (not unit_is_internal_audit) exempt_from_compliance_unit_duties_4)))

; [internal_control:foreign_branch_compliance] 國外營業單位法令遵循要求
(assert (= foreign_branch_compliance
   (and collect_local_financial_regulations
        implement_self_assessment
        ensure_compliance_supervisor_qualification
        ensure_compliance_resources_adequate
        establish_risk_assessment_and_monitoring
        engage_external_expert_for_high_risk_verification)))

; [internal_control:self_assessment_frequency] 法令遵循自行評估每半年至少辦理一次
(assert (= self_assessment_frequency (ite (<= 2 self_assessment_times_per_year) 1 0)))

; [internal_control:self_assessment_document_retention] 自行評估工作底稿及資料保存至少五年
(assert (= self_assessment_document_retention (<= 5 document_retention_years)))

; [bank:violation_occurred] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred bank_violation))

; [bank:penalties_applicable] 主管機關得視情節輕重為下列處分
(assert (= penalties_applicable (and violation_occurred penalty_decision_made)))

; [bank:penalty_types] 銀行可處分類型
(assert (= penalty_types
   (and (or remove_or_suspend_director_or_supervisor
            remove_manager_or_staff_or_suspend
            suspend_partial_business
            other_necessary_measures
            order_provision_of_reserve_funds
            restrict_investment
            order_closure_of_branches_or_departments
            order_or_prohibit_asset_disposition
            revoke_statutory_meeting_resolution)
        violation_occurred)))

; [bank:director_supervisor_removal_notify] 解除董事、監察人職務時通知公司登記主管機關撤銷或廢止登記
(assert (= director_supervisor_removal_notify
   (or (not remove_or_suspend_director_or_supervisor)
       notify_company_registration_authority)))

; [bank:business_guidance] 主管機關得指定機構辦理業務輔導
(assert (= business_guidance
   (or (not operational_deficiency_exists) designate_guidance_agency)))

; [e_payment:violation_occurred] 專營電子支付機構違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred e_payment_violation))

; [e_payment:penalties_applicable] 主管機關得視情節輕重為下列處分
(assert (= penalties_applicable (and violation_occurred penalty_decision_made)))

; [e_payment:penalty_types] 專營電子支付機構可處分類型
(assert (= penalty_types
   (and (or remove_manager_or_staff
            remove_or_suspend_director_or_supervisor
            other_necessary_measures
            revoke_all_or_part_business_permit
            revoke_shareholders_or_board_resolution
            order_provision_of_reserve_or_capital_increase)
        violation_occurred)))

; [e_payment:director_supervisor_removal_notify] 解除董事、監察人職務時通知公司登記主管機關廢止登記
(assert (= director_supervisor_removal_notify
   (or (not remove_or_suspend_director_or_supervisor)
       notify_company_registration_authority)))

; [e_payment:non_e_payment_business_violation] 非電子支付機構經主管機關許可經營特定業務違反法令準用規定
(assert (= non_e_payment_business_violation
   (or violation_occurred (not non_e_payment_business_operated_with_permit))))

; [bill_finance:violation_occurred] 票券金融公司違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred bill_finance_violation))

; [bill_finance:apply_bank_law_61_1] 票券金融公司違反法令準用銀行法第61-1條規定
(assert (= apply_bank_law_61_1 violation_occurred))

; [insurance_agent:violation_occurred] 保險代理人、經紀人、公證人違反法令或有礙健全經營之虞
(assert (= violation_occurred insurance_agent_violation))

; [insurance_agent:penalties_applicable] 主管機關得視情節輕重為下列處分
(assert (= penalties_applicable (and violation_occurred penalty_decision_made)))

; [insurance_agent:penalty_types] 保險代理人可處分類型
(assert (= penalty_types
   (and (or restrict_business_scope
            other_necessary_measures
            order_company_remove_manager_or_staff
            remove_or_suspend_company_director_or_supervisor)
        violation_occurred)))

; [insurance_agent:director_supervisor_removal_notify] 解除公司董事或監察人職務時通知主管機關註銷登記
(assert (= director_supervisor_removal_notify
   (or (not remove_or_suspend_company_director_or_supervisor)
       notify_company_registration_authority)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司、銀行、電子支付機構、票券金融公司、保險代理人相關法令規定時處罰
(assert (= penalty
   (or (and violation_occurred (not penalties_applicable))
       (and violation_occurred (not apply_bank_law_61_1)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= financial_holding_violation true))
(assert (= violation_occurred true))
(assert (= penalty_decision_made true))
(assert (= remove_manager_or_staff true))
(assert (= remove_or_suspend_director_or_supervisor false))
(assert (= penalties_applicable true))
(assert (= penalty_types true))
(assert (= director_supervisor_removal_notify false))
(assert (= consultation_channel false))
(assert (= establish_clear_communication_system false))
(assert (= confirm_regulations_updated false))
(assert (= compliance_supervisor_issues_opinion_before_new_business false))
(assert (= set_evaluation_procedures_and_supervise false))
(assert (= provide_appropriate_training false))
(assert (= supervise_implementation_of_internal_rules false))
(assert (= compliance_unit_duties false))
(assert (= report_submitted false))
(assert (= includes_deficiency_analysis false))
(assert (= includes_improvement_suggestions false))
(assert (= report_to_board_includes_analysis false))
(assert (= operational_deficiency_exists true))
(assert (= designate_guidance_agency true))
(assert (= unit_is_internal_audit false))
(assert (= exempt_from_compliance_unit_duties_4 false))
(assert (= consultation_channel_established false))
(assert (= business_guidance true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 31
; Total variables: 73
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
