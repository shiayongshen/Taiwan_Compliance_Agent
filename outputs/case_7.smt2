; SMT2 file generated from compliance case automatic
; Case ID: case_7
; Generated at: 2025-10-20T22:53:21.364414
;
; This file can be executed with Z3:
;   z3 case_7.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const IF Bool)
(declare-const accounting_information_personal_data_aml_terrorism_control Bool)
(declare-const annual_reports_submitted Bool)
(declare-const annual_revenue Real)
(declare-const appropriate_operating_procedures_established Bool)
(declare-const audit_committee_established Bool)
(declare-const audit_committee_included Bool)
(declare-const audit_committee_meeting_management_included Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const authority_inspection_and_correction Bool)
(declare-const authority_inspection_and_correction_broker Bool)
(declare-const authority_inspection_conducted Bool)
(declare-const bank_broker_service_procedures Bool)
(declare-const bank_permitted_to_operate_broker_business Bool)
(declare-const broker_company_service_procedures Bool)
(declare-const continuous_follow_up_done Bool)
(declare-const control_activities_implemented Bool)
(declare-const control_environment_established Bool)
(declare-const correction_of_deficiencies_done Bool)
(declare-const financial_inspection_report_management Bool)
(declare-const fixed_office_and_special_account_book Bool)
(declare-const follow_up_reported_to_board_and_audit_committee Bool)
(declare-const has_agent_license Bool)
(declare-const has_broker_license Bool)
(declare-const has_certain_scale Bool)
(declare-const has_fixed_office Bool)
(declare-const has_notary_license Bool)
(declare-const has_separate_account_book Bool)
(declare-const has_special_account_book Bool)
(declare-const information_and_communication_effective Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_compliance_required Bool)
(declare-const internal_control_elements_met Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_operating_procedures Bool)
(declare-const internal_control_operating_procedures_defined Bool)
(declare-const internal_control_operating_procedures_items Bool)
(declare-const internal_control_required Bool)
(declare-const internal_control_scale_requirement Bool)
(declare-const is_publicly_listed Bool)
(declare-const major_incident_handling_mechanism Bool)
(declare-const monitoring_activities_performed Bool)
(declare-const operating_procedures_reviewed_and_updated Bool)
(declare-const other_matters_designated_by_authority Bool)
(declare-const penalty Bool)
(declare-const provides_risk_planning_claim_services Bool)
(declare-const provides_risk_planning_reinsurance_claim_services Bool)
(declare-const reporting_period_end_month_day Int)
(declare-const reporting_period_start_month_day Int)
(declare-const risk_assessment_performed Bool)
(declare-const separate_account_book_and_reporting Bool)
(declare-const separate_account_book_and_reporting_broker Bool)
(declare-const single_license_only Bool)
(declare-const solicitation_handling_procedures_defined Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:fixed_office_and_special_account_book] 保險代理人、經紀人、公證人應有固定業務處所並專設帳簿記載業務收支
(assert (= fixed_office_and_special_account_book
   (and has_fixed_office has_special_account_book)))

; [insurance:single_license_only] 兼有保險代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license_only
   (>= 1
       (+ (ite has_agent_license 1 0)
          (ite has_broker_license 1 0)
          (ite has_notary_license 1 0)))))

; [insurance:internal_control_required] 保險代理人公司、經紀人公司為公開發行公司或具一定規模者應建立內部控制、稽核制度與招攬處理制度及程序
(assert (= internal_control_required
   (or (not (or is_publicly_listed has_certain_scale))
       (and internal_control_established
            audit_system_established
            solicitation_handling_system_established))))

; [insurance:internal_control_compliance] 違反內部控制、稽核制度、招攬處理制度或程序者應限期改正或處罰
(assert (= internal_control_compliance
   (and internal_control_established
        audit_system_established
        solicitation_handling_system_established
        internal_control_executed
        audit_system_executed
        solicitation_handling_system_executed)))

; [insurance:internal_control_compliance_required] 違反第一百六十五條第三項或第一百六十三條第五項準用規定未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序
(assert (= internal_control_compliance_required
   (and internal_control_established
        audit_system_established
        solicitation_handling_system_established
        internal_control_executed
        audit_system_executed
        solicitation_handling_system_executed)))

; [insurance:internal_control_elements_met] 保險代理人公司、保險經紀人公司內部控制制度符合規定組成要素
(assert (= internal_control_elements_met
   (and control_environment_established
        risk_assessment_performed
        control_activities_implemented
        information_and_communication_effective
        monitoring_activities_performed)))

; [insurance:internal_control_scale_requirement] 年度營業收入未達五億元者仍應依規定辦理內部控制制度
(assert (= internal_control_scale_requirement
   (or internal_control_elements_met (<= 500000000.0 annual_revenue))))

; [insurance:internal_control_operating_procedures] 內部控制作業程序應包括招攬處理制度及程序與內部控制作業程序並適時檢討修訂
(assert (= internal_control_operating_procedures
   (and solicitation_handling_procedures_defined
        internal_control_operating_procedures_defined
        operating_procedures_reviewed_and_updated)))

; [insurance:audit_committee_included] 設置審計委員會者內部控制制度應包括審計委員會議事運作管理
(assert (= audit_committee_included
   (or audit_committee_meeting_management_included
       (not audit_committee_established))))

; [insurance:internal_control_operating_procedures_items] 內部控制作業程序至少應包括指定項目
(assert (= internal_control_operating_procedures_items
   (and accounting_information_personal_data_aml_terrorism_control
        financial_inspection_report_management
        major_incident_handling_mechanism
        other_matters_designated_by_authority)))

; [insurance:broker_company_service_procedures] 保險經紀人公司提供風險規劃、再保險規劃及保險理賠申請服務須建立適當作業程序
(assert (= broker_company_service_procedures
   (or appropriate_operating_procedures_established
       (not provides_risk_planning_reinsurance_claim_services))))

; [insurance:bank_broker_service_procedures] 經主管機關許可兼營保險經紀人業務之銀行提供風險規劃及保險理賠申請服務須建立適當作業程序
(assert (= bank_broker_service_procedures
   (or (not bank_permitted_to_operate_broker_business)
       (not provides_risk_planning_claim_services)
       appropriate_operating_procedures_established)))

; [insurance:separate_account_book_and_reporting] 個人執業代理人、代理人公司及銀行應專設帳簿並定期彙報主管機關
(assert (= separate_account_book_and_reporting
   (and has_separate_account_book
        (<= 401 reporting_period_start_month_day)
        (>= 531 reporting_period_end_month_day)
        annual_reports_submitted)))

; [insurance:authority_inspection_and_correction] 主管機關得隨時檢查並要求限期報告，並要求改善及持續追蹤覆查
(assert (= authority_inspection_and_correction
   (and authority_inspection_conducted
        correction_of_deficiencies_done
        continuous_follow_up_done
        follow_up_reported_to_board_and_audit_committee)))

; [insurance:separate_account_book_and_reporting_broker] 個人執業經紀人、經紀人公司及銀行應專設帳簿並定期彙報主管機關
(assert (= separate_account_book_and_reporting_broker
   (and has_separate_account_book
        (<= 401 reporting_period_start_month_day)
        (>= 531 reporting_period_end_month_day)
        annual_reports_submitted)))

; [insurance:authority_inspection_and_correction_broker] 主管機關得隨時檢查並要求限期報告，並要求改善及持續追蹤覆查（經紀人）
(assert (= authority_inspection_and_correction_broker
   (and authority_inspection_conducted
        correction_of_deficiencies_done
        continuous_follow_up_done
        follow_up_reported_to_board_and_audit_committee)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制、稽核制度、招攬處理制度或程序未建立或未確實執行時處罰
(assert (= penalty
   (or (not audit_system_established)
       (not solicitation_handling_system_established)
       (not internal_control_established)
       (not audit_system_executed)
       (not internal_control_executed)
       (not solicitation_handling_system_executed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= has_fixed_office true))
(assert (= has_special_account_book true))
(assert (= fixed_office_and_special_account_book true))
(assert (= has_agent_license false))
(assert (= has_broker_license true))
(assert (= has_notary_license false))
(assert (= single_license_only true))
(assert (= is_publicly_listed false))
(assert (= has_certain_scale true))
(assert (= annual_revenue 900000000))
(assert (= internal_control_required true))
(assert (= internal_control_established true))
(assert (= audit_system_established true))
(assert (= solicitation_handling_system_established true))
(assert (= internal_control_executed false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_executed false))
(assert (= internal_control_compliance false))
(assert (= internal_control_compliance_required false))
(assert (= internal_control_elements_met false))
(assert (= control_environment_established false))
(assert (= risk_assessment_performed false))
(assert (= control_activities_implemented false))
(assert (= information_and_communication_effective false))
(assert (= monitoring_activities_performed false))
(assert (= internal_control_operating_procedures_defined false))
(assert (= solicitation_handling_procedures_defined false))
(assert (= operating_procedures_reviewed_and_updated false))
(assert (= internal_control_operating_procedures false))
(assert (= accounting_information_personal_data_aml_terrorism_control false))
(assert (= financial_inspection_report_management false))
(assert (= major_incident_handling_mechanism false))
(assert (= other_matters_designated_by_authority false))
(assert (= internal_control_operating_procedures_items false))
(assert (= penalty true))
(assert (= authority_inspection_conducted true))
(assert (= correction_of_deficiencies_done false))
(assert (= continuous_follow_up_done false))
(assert (= follow_up_reported_to_board_and_audit_committee false))
(assert (= authority_inspection_and_correction false))
(assert (= authority_inspection_and_correction_broker false))
(assert (= annual_reports_submitted false))
(assert (= has_separate_account_book true))
(assert (= reporting_period_start_month_day 401))
(assert (= reporting_period_end_month_day 531))
(assert (= separate_account_book_and_reporting true))
(assert (= separate_account_book_and_reporting_broker true))
(assert (= audit_committee_established false))
(assert (= audit_committee_meeting_management_included false))
(assert (= audit_committee_included true))
(assert (= bank_permitted_to_operate_broker_business false))
(assert (= provides_risk_planning_reinsurance_claim_services false))
(assert (= appropriate_operating_procedures_established false))
(assert (= broker_company_service_procedures false))
(assert (= bank_broker_service_procedures false))
(assert (= provides_risk_planning_claim_services false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 58
; Total facts: 56
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
