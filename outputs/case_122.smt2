; SMT2 file generated from compliance case automatic
; Case ID: case_122
; Generated at: 2025-10-21T02:18:38.792345
;
; This file can be executed with Z3:
;   z3 case_122.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_license_and_insurance Bool)
(declare-const agent_permit_obtained Bool)
(declare-const assist_create_formal_appearance Bool)
(declare-const assist_create_formal_appearance_flag Bool)
(declare-const broker_duty_of_care Bool)
(declare-const broker_exercise_diligence Bool)
(declare-const broker_fulfill_fiduciary_duty Bool)
(declare-const broker_provide_written_report Bool)
(declare-const compensation_standard_clearly_informed Bool)
(declare-const compliance_9_1 Bool)
(declare-const correction_or_penalty Bool)
(declare-const deposit_guarantee_fund Bool)
(declare-const ensure_suitability Bool)
(declare-const financial_consumer_data_fully_understood Bool)
(declare-const insurance_purchased Bool)
(declare-const penalty Bool)
(declare-const product_service_suitability_confirmed Bool)
(declare-const severe_violation Bool)
(declare-const understand_consumer_data Bool)
(declare-const underwriting_documents_retained Bool)
(declare-const underwriting_financial_source_assessed Bool)
(declare-const underwriting_no_unfair_treatment Bool)
(declare-const underwriting_no_unqualified_personnel Bool)
(declare-const underwriting_other_regulations_complied Bool)
(declare-const underwriting_personnel_qualified Bool)
(declare-const underwriting_process_defined Bool)
(declare-const underwriting_proper_signatures Bool)
(declare-const underwriting_risk_assessment_policy_implemented Bool)
(declare-const underwriting_system_compliance Bool)
(declare-const violate_advertising_regulations Bool)
(declare-const violate_advertising_rules Bool)
(declare-const violate_agent_broker_provisions Bool)
(declare-const violate_agent_broker_related_regulations Bool)
(declare-const violate_broker_duties Bool)
(declare-const violate_broker_related_regulations Bool)
(declare-const violate_compensation_regulations Bool)
(declare-const violate_compensation_rules Bool)
(declare-const violate_disclosure_regulations Bool)
(declare-const violate_disclosure_rules Bool)
(declare-const violate_financial_business_management Bool)
(declare-const violate_financial_or_business_management Bool)
(declare-const violate_suitability_rules Bool)
(declare-const violation_severe Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [financial_consumer:understand_consumer_data] 金融服務業應充分瞭解金融消費者相關資料
(assert (= understand_consumer_data financial_consumer_data_fully_understood))

; [financial_consumer:ensure_suitability] 金融服務業應確保商品或服務對金融消費者之適合度
(assert (= ensure_suitability product_service_suitability_confirmed))

; [financial_consumer:compliance_9_1] 符合金融消費者保護法第9條第一項規定
(assert (= compliance_9_1 (and understand_consumer_data ensure_suitability)))

; [financial_consumer:violate_advertising_rules] 違反第8條第2項辦法中廣告、業務招攬、營業促銷方式或內容規定
(assert (= violate_advertising_rules violate_advertising_regulations))

; [financial_consumer:violate_suitability_rules] 違反第9條第一項未充分瞭解消費者資料及確保適合度或相關辦法規定
(assert (not (= compliance_9_1 violate_suitability_rules)))

; [financial_consumer:violate_disclosure_rules] 違反第10條第一項未充分說明重要內容或揭露風險或相關辦法規定
(assert (= violate_disclosure_rules violate_disclosure_regulations))

; [financial_consumer:violate_compensation_rules] 違反第11條之一未訂定或未依主管機關核定原則訂定酬金制度或未確實執行
(assert (= violate_compensation_rules violate_compensation_regulations))

; [financial_consumer:assist_create_formal_appearance] 協助自然人或法人創造符合形式上之外觀條件
(assert (= assist_create_formal_appearance assist_create_formal_appearance_flag))

; [insurance:agent_license_and_insurance] 保險代理人、經紀人、公證人應經主管機關許可，繳存保證金並投保相關保險
(assert (= agent_license_and_insurance
   (and agent_permit_obtained deposit_guarantee_fund insurance_purchased)))

; [insurance:broker_duty_of_care] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂契約或提供服務
(assert (= broker_duty_of_care
   (and broker_exercise_diligence broker_fulfill_fiduciary_duty)))

; [insurance:broker_provide_written_report] 保險經紀人於主管機關指定範圍內，應主動提供書面分析報告並明確告知報酬標準
(assert (= broker_provide_written_report
   (and written_analysis_report_provided compensation_standard_clearly_informed)))

; [insurance:violate_financial_or_business_management] 違反保險法第163條第四項管理規則中財務或業務管理規定
(assert (= violate_financial_or_business_management
   violate_financial_business_management))

; [insurance:violate_broker_duties] 違反保險法第163條第七項或第165條第一項規定
(assert (= violate_broker_duties violate_broker_related_regulations))

; [insurance:violate_agent_broker_provisions] 違反保險法第163條第五項準用規定
(assert (= violate_agent_broker_provisions violate_agent_broker_related_regulations))

; [insurance:correction_or_penalty] 違反相關規定應限期改正或處罰
(assert (= correction_or_penalty
   (or violate_financial_or_business_management
       violate_broker_duties
       violate_agent_broker_provisions)))

; [insurance:severe_violation] 違反情節重大者，廢止許可並註銷執業證照
(assert (= severe_violation (and correction_or_penalty violation_severe)))

; [insurance:underwriting_system_compliance] 保險業訂定核保處理制度及程序符合規定
(assert (= underwriting_system_compliance
   (and underwriting_personnel_qualified
        underwriting_process_defined
        underwriting_risk_assessment_policy_implemented
        underwriting_documents_retained
        underwriting_no_unfair_treatment
        underwriting_no_unqualified_personnel
        underwriting_proper_signatures
        underwriting_financial_source_assessed
        underwriting_other_regulations_complied)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融消費者保護法及保險法相關規定時處罰
(assert (= penalty
   (or assist_create_formal_appearance
       violate_compensation_rules
       violate_suitability_rules
       violate_disclosure_rules
       correction_or_penalty
       violate_advertising_rules
       (not underwriting_system_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= financial_consumer_data_fully_understood false))
(assert (= product_service_suitability_confirmed false))
(assert (= understand_consumer_data false))
(assert (= ensure_suitability false))
(assert (= compliance_9_1 false))
(assert (= violate_suitability_rules true))
(assert (= violate_advertising_regulations false))
(assert (= violate_advertising_rules false))
(assert (= violate_disclosure_regulations false))
(assert (= violate_disclosure_rules false))
(assert (= violate_compensation_regulations false))
(assert (= violate_compensation_rules false))
(assert (= assist_create_formal_appearance_flag false))
(assert (= assist_create_formal_appearance false))
(assert (= agent_permit_obtained true))
(assert (= deposit_guarantee_fund true))
(assert (= insurance_purchased true))
(assert (= agent_license_and_insurance true))
(assert (= broker_exercise_diligence true))
(assert (= broker_fulfill_fiduciary_duty true))
(assert (= broker_duty_of_care true))
(assert (= written_analysis_report_provided true))
(assert (= compensation_standard_clearly_informed true))
(assert (= broker_provide_written_report true))
(assert (= violate_financial_business_management false))
(assert (= violate_financial_or_business_management false))
(assert (= violate_broker_related_regulations false))
(assert (= violate_broker_duties false))
(assert (= violate_agent_broker_related_regulations false))
(assert (= violate_agent_broker_provisions false))
(assert (= correction_or_penalty false))
(assert (= violation_severe false))
(assert (= severe_violation false))
(assert (= underwriting_personnel_qualified true))
(assert (= underwriting_process_defined true))
(assert (= underwriting_risk_assessment_policy_implemented true))
(assert (= underwriting_documents_retained true))
(assert (= underwriting_no_unfair_treatment true))
(assert (= underwriting_no_unqualified_personnel true))
(assert (= underwriting_proper_signatures true))
(assert (= underwriting_financial_source_assessed true))
(assert (= underwriting_other_regulations_complied true))
(assert (= underwriting_system_compliance true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 44
; Total facts: 44
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
