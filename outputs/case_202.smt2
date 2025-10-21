; SMT2 file generated from compliance case automatic
; Case ID: case_202
; Generated at: 2025-10-21T04:26:52.186892
;
; This file can be executed with Z3:
;   z3 case_202.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_deadline_ok Bool)
(declare-const adjustment_deadline_years Int)
(declare-const adjustment_extension_times Int)
(declare-const adjustment_extension_years_per_time Int)
(declare-const anti_money_laundering_and_terrorism_financing_defined Bool)
(declare-const board_of_directors_risk_responsibility Bool)
(declare-const board_recognizes_operational_risks Bool)
(declare-const board_responsible_for_internal_control Bool)
(declare-const board_supervises_operational_results Bool)
(declare-const business_days_since_application Int)
(declare-const business_guidelines_defined Bool)
(declare-const capital_reduction_approval_applied Bool)
(declare-const conflict_of_interest_rules_defined Bool)
(declare-const customer_data_confidentiality_defined Bool)
(declare-const equity_management_defined Bool)
(declare-const external_information_disclosure_defined Bool)
(declare-const fhc_corrective_action_taken Bool)
(declare-const fhc_must_adjust_within_deadline Bool)
(declare-const fhc_must_dispose_illegal_investment Bool)
(declare-const fhc_must_dispose_shares_to_comply Bool)
(declare-const fhc_must_dissolve_and_liquidate Bool)
(declare-const fhc_must_reduce_directors_to_comply Bool)
(declare-const fhc_must_stop_using_fhc_name Bool)
(declare-const fhc_officer_conflict_of_interest Bool)
(declare-const fhc_officer_internal_control_compliant Bool)
(declare-const fhc_officer_maintains_group_balance Bool)
(declare-const fhc_officer_maintains_supervision_mechanism Bool)
(declare-const fhc_officer_manager_conflict_prohibited Bool)
(declare-const fhc_officer_multiple_positions Bool)
(declare-const fhc_officer_multiple_positions_ok Bool)
(declare-const fhc_officer_or_staff_is_manager_of_venture_invested_company Bool)
(declare-const fhc_officer_positions_effective Bool)
(declare-const fhc_officer_protects_shareholders_rights Bool)
(declare-const fhc_order_adjust Bool)
(declare-const fhc_order_dispose_illegal_investment Bool)
(declare-const fhc_violation_corrective_actions Bool)
(declare-const fhc_violation_or_risk Bool)
(declare-const fhc_violation_penalties Bool)
(declare-const financial_consumer_protection_management_defined Bool)
(declare-const financial_inspection_report_management_defined Bool)
(declare-const financial_report_process_defined Bool)
(declare-const general_affairs_it_hr_defined Bool)
(declare-const internal_control_effective Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_policies_and_procedures_defined Bool)
(declare-const internal_control_subsidiary_management_defined Bool)
(declare-const invest_in_bank Bool)
(declare-const invest_in_bill_finance Bool)
(declare-const invest_in_commercial_bank Bool)
(declare-const invest_in_credit_card Bool)
(declare-const invest_in_fhc Bool)
(declare-const invest_in_first_to_ninth_category Bool)
(declare-const invest_in_foreign_financial_institution_approved Bool)
(declare-const invest_in_futures Bool)
(declare-const invest_in_futures_advisor Bool)
(declare-const invest_in_futures_broker Bool)
(declare-const invest_in_futures_manager Bool)
(declare-const invest_in_futures_trust Bool)
(declare-const invest_in_insurance Bool)
(declare-const invest_in_insurance_agent Bool)
(declare-const invest_in_insurance_broker Bool)
(declare-const invest_in_leveraged_trader Bool)
(declare-const invest_in_life_insurance Bool)
(declare-const invest_in_other_financial_related_approved Bool)
(declare-const invest_in_professional_bank Bool)
(declare-const invest_in_property_insurance Bool)
(declare-const invest_in_reinsurance_company Bool)
(declare-const invest_in_securities Bool)
(declare-const invest_in_securities_firm Bool)
(declare-const invest_in_securities_investment_advisor Bool)
(declare-const invest_in_securities_investment_trust Bool)
(declare-const invest_in_tenth_or_eleventh_category Bool)
(declare-const invest_in_trust Bool)
(declare-const invest_in_trust_investment_company Bool)
(declare-const invest_in_venture_capital Bool)
(declare-const investment_approval_timing_ok Bool)
(declare-const investment_approved Bool)
(declare-const investment_bank_subtypes_ok Bool)
(declare-const investment_executed Bool)
(declare-const investment_futures_subtypes_ok Bool)
(declare-const investment_guidelines_defined Bool)
(declare-const investment_insurance_subtypes_ok Bool)
(declare-const investment_securities_subtypes_ok Bool)
(declare-const investment_shares_no_voting_right Bool)
(declare-const investment_without_approval_prohibited Bool)
(declare-const major_incident_handling_defined Bool)
(declare-const notify_economic_ministry_revoke_registration Bool)
(declare-const organization_rules_defined Bool)
(declare-const other_business_rules_defined Bool)
(declare-const penalty Bool)
(declare-const penalty_dispose_subsidiary_shares Bool)
(declare-const penalty_other_measures Bool)
(declare-const penalty_remove_director_or_supervisor Bool)
(declare-const penalty_remove_manager_or_staff Bool)
(declare-const penalty_revoke_license Bool)
(declare-const penalty_revoke_meeting_resolution Bool)
(declare-const penalty_suspend_subsidiary_business Bool)
(declare-const remove_director_supervisor_notify_economic_ministry Bool)
(declare-const revoke_license_dispose_shares_and_name Bool)
(declare-const revoke_license_dispose_shares_or_dissolve Bool)
(declare-const shares_acquired Int)
(declare-const shares_excluded_from_total Int)
(declare-const shares_no_voting_right Int)
(declare-const subsidiary_business_exceed_law Bool)
(declare-const subsidiary_business_investment Bool)
(declare-const subsidiary_business_management Bool)
(declare-const subsidiary_business_or_investment_exceed_law Bool)
(declare-const subsidiary_business_scope_ok Bool)
(declare-const subsidiary_capital_reduction Bool)
(declare-const subsidiary_capital_reduction_approval_required Bool)
(declare-const subsidiary_investment_exceed_law Bool)
(declare-const subsidiary_management_defined Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:subsidiary_business_scope_ok] 子公司業務限於投資及對被投資事業之管理
(assert (= subsidiary_business_scope_ok
   (and subsidiary_business_investment subsidiary_business_management)))

; [fhc:investment_approved] 投資事業屬主管機關核准範圍
(assert (= investment_approved
   (or invest_in_fhc
       invest_in_credit_card
       invest_in_trust
       invest_in_bank
       invest_in_venture_capital
       invest_in_futures
       invest_in_insurance
       invest_in_securities
       invest_in_foreign_financial_institution_approved
       invest_in_other_financial_related_approved
       invest_in_bill_finance)))

; [fhc:investment_bank_subtypes_ok] 銀行業投資包含商業銀行、專業銀行及信託投資公司
(assert (= investment_bank_subtypes_ok
   (or invest_in_commercial_bank
       invest_in_professional_bank
       invest_in_trust_investment_company)))

; [fhc:investment_insurance_subtypes_ok] 保險業投資包含財產保險業、人身保險業、再保險公司、保險代理人及經紀人
(assert (= investment_insurance_subtypes_ok
   (or invest_in_property_insurance
       invest_in_insurance_agent
       invest_in_life_insurance
       invest_in_reinsurance_company
       invest_in_insurance_broker)))

; [fhc:investment_securities_subtypes_ok] 證券業投資包含證券商、證券投資信託事業、證券投資顧問事業
(assert (= investment_securities_subtypes_ok
   (or invest_in_securities_firm
       invest_in_securities_investment_advisor
       invest_in_securities_investment_trust)))

; [fhc:investment_futures_subtypes_ok] 期貨業投資包含期貨商、槓桿交易商、期貨信託事業、期貨經理事業及期貨顧問事業
(assert (= investment_futures_subtypes_ok
   (or invest_in_futures_manager
       invest_in_futures_advisor
       invest_in_futures_trust
       invest_in_futures_broker
       invest_in_leveraged_trader)))

; [fhc:investment_approval_timing_ok] 主管機關於申請後15或30營業日內未反對視為核准
(assert (= investment_approval_timing_ok
   (or (and invest_in_first_to_ninth_category
            (>= 15 business_days_since_application))
       (and invest_in_tenth_or_eleventh_category
            (>= 30 business_days_since_application)))))

; [fhc:investment_without_approval_prohibited] 未經核准不得進行申請之投資行為
(assert (= investment_without_approval_prohibited
   (or investment_approved (not investment_executed))))

; [fhc:investment_shares_no_voting_right] 未申請核准取得之股份無表決權且不計入已發行股份總數
(assert (let ((a!1 (or (not (and (not investment_approved) (= shares_acquired 1)))
               (and (= shares_no_voting_right 1)
                    (= shares_excluded_from_total 1)))))
  (= investment_shares_no_voting_right a!1)))

; [fhc:fhc_must_dispose_illegal_investment] 主管機關應限令金融控股公司處分違規投資
(assert (= fhc_must_dispose_illegal_investment
   (or investment_approved fhc_order_dispose_illegal_investment)))

; [fhc:subsidiary_business_or_investment_exceed_law] 子公司業務或投資逾越法令規定範圍
(assert (= subsidiary_business_or_investment_exceed_law
   (or subsidiary_business_exceed_law subsidiary_investment_exceed_law)))

; [fhc:fhc_must_adjust_within_deadline] 主管機關應限期命金融控股公司調整逾越範圍
(assert (= fhc_must_adjust_within_deadline
   (or fhc_order_adjust (not subsidiary_business_or_investment_exceed_law))))

; [fhc:adjustment_deadline_max_3_years] 調整期限最長三年，必要時得申請延長二次，每次二年
(assert (let ((a!1 (and (>= 3 adjustment_deadline_years)
                (or (<= adjustment_extension_times 0)
                    (and (>= 2 adjustment_extension_times)
                         (>= 2 adjustment_extension_years_per_time))))))
  (= adjustment_deadline_ok a!1)))

; [fhc:fhc_officer_manager_conflict_prohibited] 金融控股公司負責人或職員不得擔任創業投資事業所投資事業經理人
(assert (not (= fhc_officer_or_staff_is_manager_of_venture_invested_company
        fhc_officer_manager_conflict_prohibited)))

; [fhc:subsidiary_capital_reduction_approval_required] 子公司減資應事先申請核准
(assert (= subsidiary_capital_reduction_approval_required
   (or capital_reduction_approval_applied (not subsidiary_capital_reduction))))

; [fhc:fhc_violation_corrective_actions] 主管機關得對違反法令或有礙健全經營者採取處分
(assert (= fhc_violation_corrective_actions
   (or (not fhc_violation_or_risk) fhc_corrective_action_taken)))

; [fhc:fhc_violation_penalties] 主管機關得依情節輕重採取撤銷決議、停止業務、解除職務、處分股份、廢止許可等處分
(assert (= fhc_violation_penalties
   (or penalty_revoke_meeting_resolution
       (not fhc_violation_or_risk)
       penalty_remove_manager_or_staff
       penalty_remove_director_or_supervisor
       penalty_revoke_license
       penalty_suspend_subsidiary_business
       penalty_dispose_subsidiary_shares
       penalty_other_measures)))

; [fhc:remove_director_supervisor_notify_economic_ministry] 解除董事監察人職務時通知經濟部廢止登記
(assert (= remove_director_supervisor_notify_economic_ministry
   (or notify_economic_ministry_revoke_registration
       (not penalty_remove_director_or_supervisor))))

; [fhc:revoke_license_dispose_shares_and_name] 廢止許可時限期處分股份及董事人數，並不得使用金融控股公司名稱
(assert (= revoke_license_dispose_shares_and_name
   (or (not penalty_revoke_license)
       (and fhc_must_dispose_shares_to_comply
            fhc_must_reduce_directors_to_comply
            fhc_must_stop_using_fhc_name))))

; [fhc:revoke_license_dispose_shares_or_dissolve] 未於期限內處分完成者，應令解散清算
(assert (let ((a!1 (or (not (and penalty_revoke_license
                         (not fhc_must_dispose_shares_to_comply)))
               fhc_must_dissolve_and_liquidate)))
  (= revoke_license_dispose_shares_or_dissolve a!1)))

; [fhc:internal_control_established_and_executed] 金融控股公司及銀行業建立內部控制制度且持續有效執行
(assert (= internal_control_established_and_executed
   (and internal_control_established internal_control_effective)))

; [fhc:internal_control_policies_and_procedures_defined] 內部控制制度涵蓋所有營運活動並訂定適當政策及程序
(assert (= internal_control_policies_and_procedures_defined
   (and organization_rules_defined
        business_guidelines_defined
        investment_guidelines_defined
        customer_data_confidentiality_defined
        conflict_of_interest_rules_defined
        equity_management_defined
        financial_report_process_defined
        general_affairs_it_hr_defined
        external_information_disclosure_defined
        financial_inspection_report_management_defined
        financial_consumer_protection_management_defined
        major_incident_handling_defined
        anti_money_laundering_and_terrorism_financing_defined
        other_business_rules_defined)))

; [fhc:internal_control_subsidiary_management_defined] 金融控股公司內部控制制度應包括子公司管理及共同行銷管理
(assert (= internal_control_subsidiary_management_defined subsidiary_management_defined))

; [fhc:board_of_directors_risk_responsibility] 董（理）事會負最終責任監督營運風險及內部控制制度
(assert (= board_of_directors_risk_responsibility
   (and board_recognizes_operational_risks
        board_supervises_operational_results
        board_responsible_for_internal_control)))

; [fhc:fhc_officer_multiple_positions_ok] 金融控股公司負責人兼任轉投資事業及子公司職務且有效執行
(assert (= fhc_officer_multiple_positions_ok
   (and fhc_officer_multiple_positions
        fhc_officer_positions_effective
        fhc_officer_maintains_supervision_mechanism
        (not fhc_officer_conflict_of_interest)
        fhc_officer_internal_control_compliant
        fhc_officer_maintains_group_balance
        fhc_officer_protects_shareholders_rights)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法及相關規定時處罰
(assert (= penalty
   (or (not remove_director_supervisor_notify_economic_ministry)
       (not fhc_must_adjust_within_deadline)
       (not internal_control_policies_and_procedures_defined)
       (not investment_futures_subtypes_ok)
       (not subsidiary_business_scope_ok)
       (not fhc_violation_penalties)
       (not investment_shares_no_voting_right)
       (not revoke_license_dispose_shares_or_dissolve)
       (not board_of_directors_risk_responsibility)
       (not fhc_must_dispose_illegal_investment)
       (not fhc_violation_corrective_actions)
       (not internal_control_established_and_executed)
       (not internal_control_subsidiary_management_defined)
       (not fhc_officer_multiple_positions_ok)
       (not investment_approved)
       (not investment_bank_subtypes_ok)
       (not investment_approval_timing_ok)
       (not revoke_license_dispose_shares_and_name)
       (not fhc_officer_manager_conflict_prohibited)
       (not subsidiary_capital_reduction_approval_required)
       (not investment_insurance_subtypes_ok)
       (not adjustment_deadline_ok)
       (not investment_securities_subtypes_ok)
       (not investment_without_approval_prohibited))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= subsidiary_business_investment true))
(assert (= subsidiary_business_management false))
(assert (= subsidiary_business_scope_ok false))
(assert (= investment_approved false))
(assert (= invest_in_bank true))
(assert (= invest_in_commercial_bank true))
(assert (= invest_in_professional_bank false))
(assert (= invest_in_trust_investment_company false))
(assert (= invest_in_trust false))
(assert (= invest_in_insurance false))
(assert (= invest_in_securities false))
(assert (= invest_in_futures false))
(assert (= investment_bank_subtypes_ok false))
(assert (= investment_insurance_subtypes_ok false))
(assert (= investment_securities_subtypes_ok false))
(assert (= investment_futures_subtypes_ok false))
(assert (= investment_approval_timing_ok false))
(assert (= investment_without_approval_prohibited false))
(assert (= fhc_must_dispose_illegal_investment true))
(assert (= subsidiary_business_exceed_law true))
(assert (= subsidiary_investment_exceed_law true))
(assert (= subsidiary_business_or_investment_exceed_law true))
(assert (= fhc_order_adjust true))
(assert (= fhc_order_dispose_illegal_investment true))
(assert (= fhc_violation_or_risk true))
(assert (= fhc_corrective_action_taken true))
(assert (= fhc_violation_penalties true))
(assert (= penalty_remove_director_or_supervisor true))
(assert (= remove_director_supervisor_notify_economic_ministry true))
(assert (= internal_control_established false))
(assert (= internal_control_effective false))
(assert (= internal_control_established_and_executed false))
(assert (= internal_control_policies_and_procedures_defined false))
(assert (= organization_rules_defined false))
(assert (= business_guidelines_defined false))
(assert (= investment_guidelines_defined false))
(assert (= customer_data_confidentiality_defined false))
(assert (= conflict_of_interest_rules_defined false))
(assert (= equity_management_defined false))
(assert (= financial_report_process_defined false))
(assert (= general_affairs_it_hr_defined false))
(assert (= external_information_disclosure_defined false))
(assert (= financial_inspection_report_management_defined false))
(assert (= financial_consumer_protection_management_defined false))
(assert (= major_incident_handling_defined false))
(assert (= anti_money_laundering_and_terrorism_financing_defined false))
(assert (= other_business_rules_defined false))
(assert (= internal_control_subsidiary_management_defined false))
(assert (= subsidiary_management_defined false))
(assert (= board_recognizes_operational_risks false))
(assert (= board_supervises_operational_results false))
(assert (= board_responsible_for_internal_control false))
(assert (= board_of_directors_risk_responsibility false))
(assert (= fhc_officer_multiple_positions true))
(assert (= fhc_officer_positions_effective false))
(assert (= fhc_officer_maintains_supervision_mechanism false))
(assert (= fhc_officer_conflict_of_interest true))
(assert (= fhc_officer_internal_control_compliant false))
(assert (= fhc_officer_maintains_group_balance false))
(assert (= fhc_officer_protects_shareholders_rights false))
(assert (= fhc_officer_multiple_positions_ok false))
(assert (= fhc_officer_or_staff_is_manager_of_venture_invested_company true))
(assert (= subsidiary_capital_reduction false))
(assert (= capital_reduction_approval_applied false))
(assert (= adjustment_deadline_ok false))
(assert (= adjustment_deadline_years 7))
(assert (= adjustment_extension_times 3))
(assert (= adjustment_extension_years_per_time 3))
(assert (= penalty true))
(assert (= penalty_dispose_subsidiary_shares true))
(assert (= penalty_other_measures true))
(assert (= penalty_remove_manager_or_staff true))
(assert (= penalty_revoke_license false))
(assert (= penalty_revoke_meeting_resolution false))
(assert (= penalty_suspend_subsidiary_business false))
(assert (= fhc_must_dispose_shares_to_comply false))
(assert (= fhc_must_stop_using_fhc_name false))
(assert (= fhc_must_dissolve_and_liquidate false))
(assert (= notify_economic_ministry_revoke_registration false))
(assert (= shares_acquired 100))
(assert (= shares_no_voting_right 100))
(assert (= shares_excluded_from_total 100))
(assert (= business_days_since_application 40))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 27
; Total variables: 113
; Total facts: 83
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
