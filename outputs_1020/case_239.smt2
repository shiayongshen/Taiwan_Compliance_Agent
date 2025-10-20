; SMT2 file generated from compliance case automatic
; Case ID: case_239
; Generated at: 2025-10-19T11:07:27.753805
;
; This file can be executed with Z3:
;   z3 case_239.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const apply_bank_law_61_1 Bool)
(declare-const business_guidance_necessary Bool)
(declare-const business_guidance_needed Bool)
(declare-const clear_communication_system_established Bool)
(declare-const compliance_evaluation_and_supervision Bool)
(declare-const compliance_unit_mandatory_tasks Bool)
(declare-const compliance_with_article_4_1 Bool)
(declare-const consultation_channel_established Bool)
(declare-const current_date Int)
(declare-const director_or_supervisor_removed Bool)
(declare-const disciplinary_measures Bool)
(declare-const dispose_shares_and_dissolve_if_not_completed Bool)
(declare-const disposition_deadline Int)
(declare-const foreign_branch_compliance_supervision Bool)
(declare-const foreign_compliance_resources_adequate Bool)
(declare-const foreign_compliance_self_evaluation_implemented Bool)
(declare-const foreign_compliance_supervisor_qualified Bool)
(declare-const foreign_regulations_collected Bool)
(declare-const high_risk_business_external_verification Bool)
(declare-const internal_audit_exemption Bool)
(declare-const internal_audit_unit_self_evaluation Bool)
(declare-const internal_control_communication_established Bool)
(declare-const internal_control_report_includes_analysis Bool)
(declare-const last_self_evaluation_date Int)
(declare-const legal_opinion_signed_before_new_business Bool)
(declare-const license_revoked Bool)
(declare-const non_epayment_business_apply_rules Bool)
(declare-const non_epayment_business_violation Bool)
(declare-const notify_economic_ministry_on_director_removal Bool)
(declare-const notify_registration_authority_on_director_removal Bool)
(declare-const penalty Bool)
(declare-const record_creation_date Int)
(declare-const regulations_updated_timely Bool)
(declare-const report_includes_deficiency_analysis Bool)
(declare-const report_includes_improvement_suggestions Bool)
(declare-const self_evaluation_records_retained Bool)
(declare-const self_evaluation_report_submitted Bool)
(declare-const semiannual_self_evaluation Bool)
(declare-const shares_disposed Bool)
(declare-const staff_training_provided Bool)
(declare-const supervision_of_internal_regulations_implementation Bool)
(declare-const unit_supervisor_designated_person Bool)
(declare-const violation Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:disciplinary_measures] 金融控股公司違反法令或章程時可採取之處分措施
(assert (and (or (not disciplinary_measures) violation)
     (or (not violation) disciplinary_measures)))

; [fhc:notify_economic_ministry_on_director_removal] 解除董事、監察人職務時通知經濟部廢止登記
(assert (= notify_economic_ministry_on_director_removal director_or_supervisor_removed))

; [fhc:dispose_shares_and_dissolve_if_not_completed] 廢止許可時限期處分股份，未完成則解散清算
(assert (let ((a!1 (or (not license_revoked)
               (and (<= disposition_deadline current_date)
                    (or (not compliance_with_article_4_1) (not shares_disposed))))))
  (= dispose_shares_and_dissolve_if_not_completed a!1)))

; [fhc:internal_control_communication_established] 建立法令規章諮詢溝通管道
(assert (= internal_control_communication_established consultation_channel_established))

; [fhc:internal_control_report_includes_analysis] 法令遵循單位提報董事會報告包含缺失分析及改善建議
(assert (= internal_control_report_includes_analysis
   (and report_includes_deficiency_analysis
        report_includes_improvement_suggestions)))

; [fhc:compliance_unit_mandatory_tasks] 法令遵循單位應辦理事項
(assert (= compliance_unit_mandatory_tasks
   (and clear_communication_system_established
        regulations_updated_timely
        legal_opinion_signed_before_new_business
        compliance_evaluation_and_supervision
        staff_training_provided
        supervision_of_internal_regulations_implementation)))

; [fhc:internal_audit_exemption] 內部稽核單位自行評估法令遵循不適用部分規定
(assert (= internal_audit_exemption internal_audit_unit_self_evaluation))

; [fhc:foreign_branch_compliance_supervision] 國外營業單位法令遵循督導事項
(assert (= foreign_branch_compliance_supervision
   (and foreign_regulations_collected
        foreign_compliance_self_evaluation_implemented
        foreign_compliance_supervisor_qualified
        foreign_compliance_resources_adequate
        high_risk_business_external_verification)))

; [fhc:semiannual_self_evaluation] 法令遵循自行評估每半年至少辦理一次
(assert (let ((a!1 (and (<= 180 (+ current_date (* (- 1) last_self_evaluation_date)))
                self_evaluation_report_submitted
                unit_supervisor_designated_person)))
  (= semiannual_self_evaluation a!1)))

; [fhc:self_evaluation_records_retained] 自行評估工作底稿及資料保存至少五年
(assert (= self_evaluation_records_retained
   (<= 1825 (+ current_date (* (- 1) record_creation_date)))))

; [bank:disciplinary_measures] 銀行違反法令或章程時可採取之處分措施
(assert (and (or (not disciplinary_measures) violation)
     (or (not violation) disciplinary_measures)))

; [bank:notify_registration_authority_on_director_removal] 解除董事、監察人職務時通知公司登記主管機關撤銷或廢止登記
(assert (= notify_registration_authority_on_director_removal
   director_or_supervisor_removed))

; [bank:business_guidance_needed] 主管機關得指定機構辦理銀行業務輔導
(assert (= business_guidance_needed business_guidance_necessary))

; [epayment:disciplinary_measures] 電子支付機構違反法令或章程時可採取之處分措施
(assert (and (or (not disciplinary_measures) violation)
     (or (not violation) disciplinary_measures)))

; [epayment:notify_registration_authority_on_director_removal] 解除董事、監察人職務時通知公司登記主管機關廢止登記
(assert (= notify_registration_authority_on_director_removal
   director_or_supervisor_removed))

; [epayment:non_epayment_business_apply_rules] 非電子支付機構經主管機關許可經營特定業務違反法令準用電子支付機構規定
(assert (= non_epayment_business_apply_rules non_epayment_business_violation))

; [billfinance:apply_bank_law_61_1] 票券金融公司違反法令準用銀行法第61-1條規定
(assert (= apply_bank_law_61_1 violation))

; [insurance_agent:disciplinary_measures] 保險代理人、經紀人、公證人違反法令或有礙健全經營時可採取之處分措施
(assert (and (or (not disciplinary_measures) violation)
     (or (not violation) disciplinary_measures)))

; [insurance_agent:notify_registration_authority_on_director_removal] 解除公司董事或監察人職務時通知主管機關註銷登記
(assert (= notify_registration_authority_on_director_removal
   director_or_supervisor_removed))

; [meta:penalty_default_false] 預設不處罰
(assert (or (not penalty) apply_bank_law_61_1 disciplinary_measures))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司、銀行、電子支付機構、票券金融公司及保險代理人相關法令規定時處罰
(assert (= penalty (or apply_bank_law_61_1 disciplinary_measures)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation true))
(assert (= disciplinary_measures true))
(assert (= consultation_channel_established false))
(assert (= clear_communication_system_established false))
(assert (= regulations_updated_timely false))
(assert (= legal_opinion_signed_before_new_business false))
(assert (= compliance_evaluation_and_supervision false))
(assert (= staff_training_provided false))
(assert (= supervision_of_internal_regulations_implementation false))
(assert (= report_includes_deficiency_analysis false))
(assert (= report_includes_improvement_suggestions false))
(assert (= director_or_supervisor_removed false))
(assert (= business_guidance_necessary false))
(assert (= business_guidance_needed false))
(assert (= internal_audit_unit_self_evaluation false))
(assert (= internal_audit_exemption false))
(assert (= foreign_regulations_collected false))
(assert (= foreign_compliance_self_evaluation_implemented false))
(assert (= foreign_compliance_supervisor_qualified false))
(assert (= foreign_compliance_resources_adequate false))
(assert (= high_risk_business_external_verification false))
(assert (= self_evaluation_report_submitted false))
(assert (= unit_supervisor_designated_person false))
(assert (= last_self_evaluation_date 0))
(assert (= current_date 0))
(assert (= record_creation_date 0))
(assert (= self_evaluation_records_retained false))
(assert (= shares_disposed false))
(assert (= license_revoked false))
(assert (= disposition_deadline 0))
(assert (= notify_economic_ministry_on_director_removal false))
(assert (= notify_registration_authority_on_director_removal false))
(assert (= non_epayment_business_violation false))
(assert (= non_epayment_business_apply_rules false))
(assert (= apply_bank_law_61_1 false))
(assert (= penalty true))
(assert (= compliance_unit_mandatory_tasks false))
(assert (= compliance_with_article_4_1 false))
(assert (= dispose_shares_and_dissolve_if_not_completed false))
(assert (= foreign_branch_compliance_supervision false))
(assert (= internal_control_communication_established false))
(assert (= internal_control_report_includes_analysis false))
(assert (= semiannual_self_evaluation false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 43
; Total facts: 43
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
