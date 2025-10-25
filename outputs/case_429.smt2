; SMT2 file generated from compliance case automatic
; Case ID: case_429
; Generated at: 2025-10-24T20:26:36.896374
;
; This file can be executed with Z3:
;   z3 case_429.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_not_permitted_without_license_and_guarantee Bool)
(declare-const avg_annual_legal_course_hours_last_2_years Real)
(declare-const avg_annual_onjob_training_hours Real)
(declare-const aviation Bool)
(declare-const bank_broker_business_license_canceled Bool)
(declare-const bank_broker_license_revoked Bool)
(declare-const bank_broker_stop_reported Bool)
(declare-const bank_broker_stop_terminate_or_license_revoked_and_broker_not_canceled Bool)
(declare-const bank_broker_terminate_reported Bool)
(declare-const bank_must_cancel_broker_license_on_stop_or_terminate Bool)
(declare-const bank_must_report_stop_or_terminate_broker_business Bool)
(declare-const broker_annual_education_training_for_fair_treatment_of_seniors Real)
(declare-const broker_appointed_per_rule Bool)
(declare-const broker_company_dissolve_reported Bool)
(declare-const broker_company_extension_applied Bool)
(declare-const broker_company_extension_once Bool)
(declare-const broker_company_license_revoked Bool)
(declare-const broker_company_must_appoint_broker_on_resume Bool)
(declare-const broker_company_must_cancel_broker_license_on_stop_or_dissolve Bool)
(declare-const broker_company_must_report_stop_resume_dissolve Bool)
(declare-const broker_company_or_bank_cancel_qualification Bool)
(declare-const broker_company_resume_reported Bool)
(declare-const broker_company_stop_or_dissolve_or_license_revoked_and_broker_not_canceled Bool)
(declare-const broker_company_stop_period_limit_and_extension Bool)
(declare-const broker_company_stop_period_years Int)
(declare-const broker_company_stop_reported Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercised_duty_of_care Bool)
(declare-const broker_fulfilled_fiduciary_duty Bool)
(declare-const broker_license_canceled Bool)
(declare-const broker_must_cancel_license_within_30_days_after_company_stop_dissolve_or_license_revoked Bool)
(declare-const broker_not_participate_fair_treatment_training_restriction Bool)
(declare-const broker_provide_written_report_and_disclose_fee Bool)
(declare-const compliance_officer_education_training_hours Real)
(declare-const compliance_officer_training_hours Real)
(declare-const days_before_stop_period_expiry_to_apply Int)
(declare-const days_to_cancel_broker_license Int)
(declare-const exclusive_reinsurance Bool)
(declare-const fair_treatment_training_passed Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosed_clearly Bool)
(declare-const guarantee Bool)
(declare-const guarantee_deposited Bool)
(declare-const higher_layer_rate Real)
(declare-const individual_broker_education_training_hours Real)
(declare-const insurance_type Int)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_not_broker Bool)
(declare-const is_notary Bool)
(declare-const is_not_notary Bool)
(declare-const liability Bool)
(declare-const license_held Bool)
(declare-const license_permitted Bool)
(declare-const next_year_restriction_on_senior_clients Bool)
(declare-const nuclear Bool)
(declare-const penalty Bool)
(declare-const policy_issuance_fee_rate Real)
(declare-const property_insurance_no_temporary_reinsurance_after_temporary_reinsurance_out Bool)
(declare-const property_insurance_reinsurance_rate_compliance Bool)
(declare-const property_insurance_reinsurance_rate_violation_penalty Bool)
(declare-const property_insurance_retention_rate_nonproportional_reinsurance Real)
(declare-const property_insurance_retention_rate_proportional_reinsurance Real)
(declare-const rate_level_reasonable Bool)
(declare-const reinsurance_rate Real)
(declare-const reinsurance_rate_adequate_and_reasonable Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_correct Bool)
(declare-const retention_rate Real)
(declare-const retention_rate_layer Int)
(declare-const temporary_reinsurance_in_arranged Bool)
(declare-const temporary_reinsurance_out_arranged Bool)
(declare-const weighted_avg_reinsurance_rate_same_layer Real)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_not_permitted_without_license_and_guarantee] 保險代理人、經紀人、公證人須經主管機關許可、繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= agent_broker_not_permitted_without_license_and_guarantee
   (and license_permitted
        guarantee_deposited
        related_insurance_purchased
        license_held)))

; [insurance:related_insurance_type_correct] 相關保險類型符合規定：代理人、公證人為責任保險；經紀人為責任保險及保證保險
(assert (let ((a!1 (and is_broker
                (or (= insurance_type (ite liability 1 0))
                    (= insurance_type (ite guarantee 1 0))))))
(let ((a!2 (or (and is_agent
                    is_not_broker
                    is_not_notary
                    (= insurance_type (ite liability 1 0)))
               a!1
               (and is_notary (= insurance_type (ite liability 1 0))))))
  (= related_insurance_type_correct a!2))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務及負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercised_duty_of_care broker_fulfilled_fiduciary_duty)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於洽訂保險契約前，應主動提供書面分析報告，並明確告知報酬收取標準
(assert (= broker_provide_written_report_and_disclose_fee
   (and written_analysis_report_provided
        (or fee_disclosed_clearly (not fee_charged)))))

; [insurance:broker_company_must_report_stop_resume_dissolve] 經紀人公司停業、復業、解散應報主管機關核准並辦理登記
(assert (= broker_company_must_report_stop_resume_dissolve
   (or broker_company_stop_reported
       broker_company_resume_reported
       broker_company_dissolve_reported)))

; [insurance:broker_company_stop_period_limit_and_extension] 經紀人公司停業期間以一年為限，得申請一次展延，且應於屆滿前十五日提出
(assert (= broker_company_stop_period_limit_and_extension
   (and (>= 1 broker_company_stop_period_years)
        (or broker_company_extension_once
            (not broker_company_extension_applied))
        (>= 15 days_before_stop_period_expiry_to_apply))))

; [insurance:broker_company_must_appoint_broker_on_resume] 經紀人公司復業時應依規定任用經紀人
(assert (= broker_company_must_appoint_broker_on_resume
   (or broker_appointed_per_rule (not broker_company_resume_reported))))

; [insurance:broker_company_must_cancel_broker_license_on_stop_or_dissolve] 經紀人公司停業或解散應繳銷所任用經紀人執業證照
(assert (= broker_company_must_cancel_broker_license_on_stop_or_dissolve
   (or broker_license_canceled
       (not (or broker_company_stop_reported broker_company_dissolve_reported)))))

; [insurance:broker_must_cancel_license_within_30_days_after_company_stop_dissolve_or_license_revoked] 經紀人公司停業、解散或主管機關註銷公司執業證照後，受任用經紀人應於30日內辦理註銷登記
(assert (= broker_must_cancel_license_within_30_days_after_company_stop_dissolve_or_license_revoked
   (or (not (or broker_company_stop_reported
                broker_company_license_revoked
                broker_company_dissolve_reported))
       (>= 30 days_to_cancel_broker_license))))

; [insurance:broker_company_stop_or_dissolve_or_license_revoked_and_broker_not_canceled] 經紀人公司停業、解散或主管機關註銷公司執業證照，未辦理繳銷經紀人執業證照
(assert (= broker_company_stop_or_dissolve_or_license_revoked_and_broker_not_canceled
   (and (or broker_company_stop_reported
            broker_company_license_revoked
            broker_company_dissolve_reported)
        (not broker_license_canceled))))

; [insurance:bank_must_report_stop_or_terminate_broker_business] 銀行申請暫時停止或終止兼營保險經紀業務應報主管機關核准
(assert (= bank_must_report_stop_or_terminate_broker_business
   (or bank_broker_stop_reported bank_broker_terminate_reported)))

; [insurance:bank_must_cancel_broker_license_on_stop_or_terminate] 銀行暫時停止兼營保險經紀業務應繳銷經紀人執業證照，終止兼營保險經紀業務應繳銷經紀人及兼營保險經紀業務執業證照
(assert (= bank_must_cancel_broker_license_on_stop_or_terminate
   (and (or broker_license_canceled (not bank_broker_stop_reported))
        (or (not bank_broker_terminate_reported)
            (and broker_license_canceled bank_broker_business_license_canceled)))))

; [insurance:bank_broker_stop_terminate_or_license_revoked_and_broker_not_canceled] 銀行暫時停止、終止兼營保險經紀業務或主管機關註銷其許可，未辦理繳銷經紀人執業證照
(assert (= bank_broker_stop_terminate_or_license_revoked_and_broker_not_canceled
   (and (or bank_broker_terminate_reported
            bank_broker_license_revoked
            bank_broker_stop_reported)
        (not broker_license_canceled))))

; [insurance:individual_broker_education_training_hours] 個人執業經紀人每年平均參加在職教育訓練16小時以上，且前二年每年平均法令課程時數不少於8小時
(assert (= individual_broker_education_training_hours
   (ite (and (<= 16.0 avg_annual_onjob_training_hours)
             (<= 8.0 avg_annual_legal_course_hours_last_2_years))
        1.0
        0.0)))

; [insurance:compliance_officer_education_training_hours] 法令遵循人員每年參加在職教育訓練15小時以上
(assert (= compliance_officer_education_training_hours
   (ite (<= 15.0 compliance_officer_training_hours) 1.0 0.0)))

; [insurance:broker_annual_education_training_for_fair_treatment_of_seniors] 個人執業經紀人、經紀人公司或銀行任用經紀人每年應參加並通過公平對待65歲以上客戶相關教育訓練2小時
(assert (= broker_annual_education_training_for_fair_treatment_of_seniors
   (ite fair_treatment_training_passed 1.0 0.0)))

; [insurance:broker_not_participate_fair_treatment_training_restriction] 未依規定參加並通過公平對待65歲以上客戶教育訓練者，次年度不得招攬65歲以上客戶，且所屬經紀人公司或銀行應取消該資格
(assert (= broker_not_participate_fair_treatment_training_restriction
   (or fair_treatment_training_passed
       (and next_year_restriction_on_senior_clients
            broker_company_or_bank_cancel_qualification))))

; [insurance:property_insurance_reinsurance_rate_compliance] 財產保險業承接再保險分入業務時，再保險費率應符合適足性及合理性並反映各項成本
(assert (= property_insurance_reinsurance_rate_compliance
   reinsurance_rate_adequate_and_reasonable))

; [insurance:property_insurance_retention_rate_proportional_reinsurance] 財產保險業以比例性再保險方式安排分出時，自留費率不得低於再保險費率及出單費率
(assert (= property_insurance_retention_rate_proportional_reinsurance
   (ite (and (>= retention_rate reinsurance_rate)
             (>= retention_rate policy_issuance_fee_rate))
        1.0
        0.0)))

; [insurance:property_insurance_retention_rate_nonproportional_reinsurance] 財產保險業以非比例性再保險方式安排分出時，各自留層費率不得低於高層費率及同層加權平均再保險費率，且費率水準應合理
(assert (let ((a!1 (ite (and (>= (to_real retention_rate_layer) higher_layer_rate)
                     (>= (to_real retention_rate_layer)
                         weighted_avg_reinsurance_rate_same_layer)
                     rate_level_reasonable)
                1.0
                0.0)))
  (= property_insurance_retention_rate_nonproportional_reinsurance a!1)))

; [insurance:property_insurance_no_temporary_reinsurance_after_temporary_reinsurance_out] 財產保險業原簽單業務安排臨時再保險分出後，不得以任何臨時再保或分保方式承接該分出風險，航空保險、核能保險及專屬再保險業務除外
(assert (let ((a!1 (not (or (= insurance_type (ite aviation 1 0))
                    (= insurance_type (ite nuclear 1 0))
                    (= insurance_type (ite exclusive_reinsurance 1 0))))))
  (= property_insurance_no_temporary_reinsurance_after_temporary_reinsurance_out
     (or (not (and temporary_reinsurance_out_arranged a!1))
         (not temporary_reinsurance_in_arranged)))))

; [insurance:property_insurance_reinsurance_rate_violation_penalty] 財產保險業未符合再保險費率適足性及合理性者，依保險法第170條之一處分並由簽證精算人員於年度精算簽證報告中提出說明
(assert (not (= property_insurance_reinsurance_rate_compliance
        property_insurance_reinsurance_rate_violation_penalty)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險代理人、經紀人、公證人許可、保證金、保險投保及執業證照規定，或違反經紀人公司及銀行相關停業、解散、執業證照繳銷規定，或未依規定參加教育訓練，或財產保險業再保險費率不符規定時處罰
(assert (= penalty
   (or (not broker_company_stop_period_limit_and_extension)
       (not broker_company_must_report_stop_resume_dissolve)
       (not related_insurance_type_correct)
       (not (= individual_broker_education_training_hours 1.0))
       (not broker_must_cancel_license_within_30_days_after_company_stop_dissolve_or_license_revoked)
       (not broker_provide_written_report_and_disclose_fee)
       (not bank_must_cancel_broker_license_on_stop_or_terminate)
       (not broker_duty_of_care_and_fidelity)
       (not agent_broker_not_permitted_without_license_and_guarantee)
       (not broker_company_must_appoint_broker_on_resume)
       (not broker_company_must_cancel_broker_license_on_stop_or_dissolve)
       (not bank_must_report_stop_or_terminate_broker_business)
       (not property_insurance_reinsurance_rate_compliance)
       (not (= broker_annual_education_training_for_fair_treatment_of_seniors
               1.0))
       (not (= compliance_officer_education_training_hours 1.0)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= license_permitted true))
(assert (= guarantee_deposited false))
(assert (= related_insurance_purchased true))
(assert (= license_held true))
(assert (= is_broker true))
(assert (= insurance_type 1))
(assert (= related_insurance_type_correct false))
(assert (= broker_exercised_duty_of_care false))
(assert (= broker_fulfilled_fiduciary_duty false))
(assert (= written_analysis_report_provided false))
(assert (= fee_charged true))
(assert (= fee_disclosed_clearly false))
(assert (= broker_company_must_report_stop_resume_dissolve false))
(assert (= broker_company_stop_period_limit_and_extension true))
(assert (= broker_company_must_appoint_broker_on_resume true))
(assert (= broker_company_must_cancel_broker_license_on_stop_or_dissolve true))
(assert (= broker_must_cancel_license_within_30_days_after_company_stop_dissolve_or_license_revoked true))
(assert (= bank_must_report_stop_or_terminate_broker_business true))
(assert (= bank_must_cancel_broker_license_on_stop_or_terminate true))
(assert (= avg_annual_onjob_training_hours 10.0))
(assert (= avg_annual_legal_course_hours_last_2_years 5.0))
(assert (= compliance_officer_training_hours 10.0))
(assert (= fair_treatment_training_passed false))
(assert (= property_insurance_reinsurance_rate_compliance false))
(assert (= reinsurance_rate_adequate_and_reasonable false))
(assert (= retention_rate 1.0))
(assert (= reinsurance_rate 2.0))
(assert (= policy_issuance_fee_rate (/ 1.0 2.0)))
(assert (= retention_rate_layer 1))
(assert (= higher_layer_rate (/ 417.0 100.0)))
(assert (= weighted_avg_reinsurance_rate_same_layer (/ 5.0 2.0)))
(assert (= rate_level_reasonable false))
(assert (= temporary_reinsurance_out_arranged false))
(assert (= temporary_reinsurance_in_arranged false))
(assert (= broker_license_canceled false))
(assert (= broker_company_stop_reported false))
(assert (= broker_company_dissolve_reported false))
(assert (= broker_company_license_revoked false))
(assert (= bank_broker_stop_reported false))
(assert (= bank_broker_terminate_reported false))
(assert (= bank_broker_license_revoked false))
(assert (= broker_company_stop_period_years 0))
(assert (= broker_company_extension_applied false))
(assert (= broker_company_extension_once false))
(assert (= days_before_stop_period_expiry_to_apply 0))
(assert (= days_to_cancel_broker_license 0))
(assert (= is_agent false))
(assert (= is_not_broker false))
(assert (= is_notary false))
(assert (= is_not_notary true))
(assert (= liability true))
(assert (= aviation false))
(assert (= nuclear false))
(assert (= exclusive_reinsurance false))
(assert (= bank_broker_stop_terminate_or_license_revoked_and_broker_not_canceled false))
(assert (= broker_company_stop_or_dissolve_or_license_revoked_and_broker_not_canceled false))
(assert (= broker_not_participate_fair_treatment_training_restriction true))
(assert (= next_year_restriction_on_senior_clients true))
(assert (= broker_company_or_bank_cancel_qualification true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 24
; Total variables: 74
; Total facts: 59
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
