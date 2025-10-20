; SMT2 file generated from compliance case automatic
; Case ID: case_7
; Generated at: 2025-10-19T04:55:44.685452
;
; This file can be executed with Z3:
;   z3 case_7.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_control_operations_established Bool)
(declare-const annual_reporting_and_bookkeeping_compliant Bool)
(declare-const annual_reports_submitted Bool)
(declare-const annual_revenue Real)
(declare-const anti_money_laundering_and_counter_terrorism_established Bool)
(declare-const appropriate_operational_procedures_established Bool)
(declare-const audit_committee_established Bool)
(declare-const audit_committee_included Bool)
(declare-const audit_committee_meeting_management_included Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const bank_broker_service_operational_procedures_met Bool)
(declare-const bank_permitted_to_operate_brokerage Bool)
(declare-const broker_service_operational_procedures_met Bool)
(declare-const control_activities_and_segregation_of_duties Bool)
(declare-const control_activities_established Bool)
(declare-const control_environment_established Bool)
(declare-const dedicated_bookkeeping Bool)
(declare-const financial_inspection_report_management_established Bool)
(declare-const fixed_office_and_bookkeeping Bool)
(declare-const followup_and_review_done Bool)
(declare-const has_dedicated_bookkeeping Bool)
(declare-const has_fixed_office Bool)
(declare-const improvement_and_followup_compliant Bool)
(declare-const improvement_measures_taken Bool)
(declare-const information_and_communication Bool)
(declare-const information_communication_established Bool)
(declare-const information_control_operations_established Bool)
(declare-const internal_control_below_scale_principles_met Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_operational_procedures_complete Bool)
(declare-const internal_control_procedures_reviewed_and_updated Bool)
(declare-const internal_control_required Bool)
(declare-const internal_control_reviewed Bool)
(declare-const internal_control_scale_requirement_met Bool)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const is_publicly_listed Bool)
(declare-const major_incident_handling_mechanism_established Bool)
(declare-const management_supervision_and_control_culture Bool)
(declare-const meets_scale_threshold Bool)
(declare-const monitoring_activities_established Bool)
(declare-const monitoring_and_correction_of_deficiencies Bool)
(declare-const other_regulator_specified_matters_established Bool)
(declare-const penalty Bool)
(declare-const personal_data_protection_established Bool)
(declare-const provides_risk_planning_or_claim_services Bool)
(declare-const provides_risk_planning_or_reinsurance_or_claim_services Bool)
(declare-const regulator_inspection_and_reporting Bool)
(declare-const regulator_inspection_conducted Bool)
(declare-const regulator_ordered_report_submitted Bool)
(declare-const reporting_end_date Int)
(declare-const reporting_start_date Int)
(declare-const reports_submitted_to_regulator_on_time Bool)
(declare-const risk_assessment_established Bool)
(declare-const risk_identification_and_assessment Bool)
(declare-const single_license_only Bool)
(declare-const solicitation_system_defined_by_business_and_scale Bool)
(declare-const solicitation_system_established Bool)
(declare-const solicitation_system_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:fixed_office_and_bookkeeping] 保險代理人、經紀人、公證人應有固定業務處所並專設帳簿記載業務收支
(assert (= fixed_office_and_bookkeeping
   (and has_fixed_office has_dedicated_bookkeeping)))

; [insurance:single_license_only] 兼有代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license_only
   (= 1 (+ (ite is_agent 1 0) (ite is_broker 1 0) (ite is_notary 1 0)))))

; [insurance:internal_control_required] 公開發行或一定規模代理人公司、經紀人公司應建立內部控制、稽核及招攬處理制度與程序
(assert (= internal_control_required
   (or (not (or is_publicly_listed meets_scale_threshold))
       (and internal_control_established
            audit_system_established
            solicitation_system_established))))

; [insurance:internal_control_compliance] 內部控制、稽核制度及招攬處理制度確實執行
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_executed
        audit_system_established
        audit_system_executed
        solicitation_system_established
        solicitation_system_executed)))

; [insurance:internal_control_scale_requirement] 年度營業收入達5億元者內部控制制度應包括五大組成要素
(assert (= internal_control_scale_requirement_met
   (or (not (<= 500000000.0 annual_revenue))
       (and control_environment_established
            risk_assessment_established
            control_activities_established
            information_communication_established
            monitoring_activities_established))))

; [insurance:internal_control_below_scale_principles] 年度營業收入未達5億元者內部控制制度應符合五項原則
(assert (= internal_control_below_scale_principles_met
   (or (<= 500000000.0 annual_revenue)
       (and management_supervision_and_control_culture
            risk_identification_and_assessment
            control_activities_and_segregation_of_duties
            information_and_communication
            monitoring_and_correction_of_deficiencies))))

; [insurance:internal_control_must_be_reviewed] 內部控制制度應依業務性質及規模訂定招攬處理制度及程序並適時檢討修訂
(assert (= internal_control_reviewed
   (and solicitation_system_defined_by_business_and_scale
        internal_control_procedures_reviewed_and_updated)))

; [insurance:audit_committee_included] 設置審計委員會者內部控制制度應包括審計委員會議事運作管理
(assert (= audit_committee_included
   (or audit_committee_meeting_management_included
       (not audit_committee_established))))

; [insurance:internal_control_operational_procedures] 內部控制作業程序至少包括會計、資訊、個資保護、防制洗錢及打擊資恐、金融檢查報告管理、重大偶發事件處理及主管機關指定事項
(assert (= internal_control_operational_procedures_complete
   (and accounting_control_operations_established
        information_control_operations_established
        personal_data_protection_established
        anti_money_laundering_and_counter_terrorism_established
        financial_inspection_report_management_established
        major_incident_handling_mechanism_established
        other_regulator_specified_matters_established)))

; [insurance:broker_service_operational_procedures] 保險經紀人公司提供風險規劃、再保險規劃及保險理賠申請服務者須依服務建立適當作業程序
(assert (= broker_service_operational_procedures_met
   (or appropriate_operational_procedures_established
       (not provides_risk_planning_or_reinsurance_or_claim_services))))

; [insurance:bank_broker_service_operational_procedures] 經主管機關許可兼營保險經紀人業務之銀行提供風險規劃及保險理賠申請服務者須依服務建立適當作業程序
(assert (= bank_broker_service_operational_procedures_met
   (or appropriate_operational_procedures_established
       (not bank_permitted_to_operate_brokerage)
       (not provides_risk_planning_or_claim_services))))

; [insurance:annual_reporting_and_bookkeeping] 個人執業代理人、代理人公司及銀行應專設帳簿並於指定期間彙報主管機關
(assert (= annual_reporting_and_bookkeeping_compliant
   (and dedicated_bookkeeping
        (<= 401 reporting_start_date)
        (>= 531 reporting_end_date)
        annual_reports_submitted)))

; [insurance:regulator_inspection_and_reporting] 主管機關得隨時派員檢查或令限期報告營業狀況
(assert (= regulator_inspection_and_reporting
   (or regulator_inspection_conducted regulator_ordered_report_submitted)))

; [insurance:improvement_and_followup] 對主管機關檢查意見或缺失應確實改善並持續追蹤覆查，並於期限內函送主管機關
(assert (= improvement_and_followup_compliant
   (and improvement_measures_taken
        followup_and_review_done
        reports_submitted_to_regulator_on_time)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制、稽核、招攬制度建立或執行，未專設帳簿或未依規定彙報，未改善缺失時處罰
(assert (= penalty
   (or (not single_license_only)
       (not improvement_and_followup_compliant)
       (not (and internal_control_executed
                 audit_system_executed
                 solicitation_system_executed))
       (not fixed_office_and_bookkeeping)
       (not annual_reporting_and_bookkeeping_compliant)
       (not (and internal_control_established
                 audit_system_established
                 solicitation_system_established)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= is_broker true))
(assert (= annual_revenue 900000000.0))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_system_established false))
(assert (= solicitation_system_executed false))
(assert (= has_fixed_office true))
(assert (= has_dedicated_bookkeeping true))
(assert (= dedicated_bookkeeping true))
(assert (= fixed_office_and_bookkeeping true))
(assert (= single_license_only true))
(assert (= annual_reports_submitted false))
(assert (= annual_reporting_and_bookkeeping_compliant false))
(assert (= improvement_measures_taken false))
(assert (= followup_and_review_done false))
(assert (= reports_submitted_to_regulator_on_time false))
(assert (= improvement_and_followup_compliant false))
(assert (= regulator_inspection_conducted true))
(assert (= regulator_ordered_report_submitted false))
(assert (= regulator_inspection_and_reporting true))
(assert (= reporting_start_date 401))
(assert (= reporting_end_date 531))
(assert (= is_agent false))
(assert (= is_notary false))
(assert (= meets_scale_threshold true))
(assert (= control_environment_established false))
(assert (= risk_assessment_established false))
(assert (= control_activities_established false))
(assert (= information_communication_established false))
(assert (= monitoring_activities_established false))
(assert (= management_supervision_and_control_culture false))
(assert (= risk_identification_and_assessment false))
(assert (= control_activities_and_segregation_of_duties false))
(assert (= information_and_communication false))
(assert (= monitoring_and_correction_of_deficiencies false))
(assert (= internal_control_scale_requirement_met true))
(assert (= internal_control_below_scale_principles_met false))
(assert (= internal_control_reviewed false))
(assert (= solicitation_system_defined_by_business_and_scale false))
(assert (= internal_control_procedures_reviewed_and_updated false))
(assert (= audit_committee_established false))
(assert (= audit_committee_meeting_management_included false))
(assert (= audit_committee_included false))
(assert (= accounting_control_operations_established false))
(assert (= information_control_operations_established false))
(assert (= personal_data_protection_established false))
(assert (= anti_money_laundering_and_counter_terrorism_established false))
(assert (= financial_inspection_report_management_established false))
(assert (= major_incident_handling_mechanism_established false))
(assert (= other_regulator_specified_matters_established false))
(assert (= internal_control_operational_procedures_complete false))
(assert (= provides_risk_planning_or_reinsurance_or_claim_services false))
(assert (= appropriate_operational_procedures_established false))
(assert (= broker_service_operational_procedures_met false))
(assert (= bank_permitted_to_operate_brokerage false))
(assert (= provides_risk_planning_or_claim_services false))
(assert (= bank_broker_service_operational_procedures_met false))
(assert (= penalty true))
(assert (= internal_control_compliance false))
(assert (= internal_control_required false))
(assert (= is_publicly_listed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 63
; Total facts: 63
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
