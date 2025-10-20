; SMT2 file generated from compliance case automatic
; Case ID: case_429
; Generated at: 2025-10-19T15:43:33.757773
;
; This file can be executed with Z3:
;   z3 case_429.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adequate_rate Real)
(declare-const agent_broker_operate_allowed Bool)
(declare-const annual_training_hours_fair_treatment_seniors Real)
(declare-const avg_annual_legal_course_hours_last_2_years Real)
(declare-const avg_annual_onjob_training_hours Real)
(declare-const ban_solicitation_seniors Bool)
(declare-const bank_agent_broker_permit_compliant Bool)
(declare-const bank_apply_suspend Bool)
(declare-const bank_apply_suspend_or_terminate Bool)
(declare-const bank_apply_terminate Bool)
(declare-const bank_broker_business_license_canceled Bool)
(declare-const bank_broker_license_canceled Bool)
(declare-const bank_broker_license_cancellation_registration_done Bool)
(declare-const bank_operate_agent Bool)
(declare-const bank_operate_broker Bool)
(declare-const bank_permit_obtained Bool)
(declare-const bank_report_board_meeting Bool)
(declare-const bank_suspend_terminate_approved Bool)
(declare-const bank_suspend_terminate_broker_business_approved Bool)
(declare-const broker_annual_training_compliant Bool)
(declare-const broker_charge_fee Bool)
(declare-const broker_company_broker_appointed Bool)
(declare-const broker_company_broker_license_canceled Bool)
(declare-const broker_company_broker_license_canceled_flag Bool)
(declare-const broker_company_dissolve_reported Bool)
(declare-const broker_company_fail_resume_and_appoint Bool)
(declare-const broker_company_license_canceled Bool)
(declare-const broker_company_resume_reported Bool)
(declare-const broker_company_stop_extension_applied Bool)
(declare-const broker_company_stop_extension_apply_days_before Int)
(declare-const broker_company_stop_extension_once Bool)
(declare-const broker_company_stop_period_compliant Bool)
(declare-const broker_company_stop_period_expired Bool)
(declare-const broker_company_stop_period_expiring Bool)
(declare-const broker_company_stop_period_months Int)
(declare-const broker_company_stop_reported Bool)
(declare-const broker_company_stop_resume_dissolve_reported Bool)
(declare-const broker_disclose_fee_standard Bool)
(declare-const broker_duty_of_care_fulfilled Bool)
(declare-const broker_exercise_duty_of_care Bool)
(declare-const broker_fulfill_fidelity Bool)
(declare-const broker_license_canceled Bool)
(declare-const broker_license_cancellation_registration_done Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_report_and_fee_disclosure_compliant Bool)
(declare-const business_type_air_nuclear_special Bool)
(declare-const cancel_solicitation_qualification Bool)
(declare-const compliance_officer_annual_training_hours Real)
(declare-const compliance_officer_training_compliant Bool)
(declare-const days_since_bank_suspend_terminate_or_revocation Int)
(declare-const days_since_stop_or_dissolve_or_revocation Int)
(declare-const deposit_guarantee Bool)
(declare-const higher_layer_rate Real)
(declare-const insurance_subscribed Bool)
(declare-const insurance_subscribed_guarantee Bool)
(declare-const insurance_subscribed_responsibility Bool)
(declare-const insurance_type_compliant Bool)
(declare-const license_held Bool)
(declare-const license_permitted Bool)
(declare-const license_revoked Bool)
(declare-const no_temporary_reinsurance_violation Bool)
(declare-const penalty Bool)
(declare-const policy_issuance_fee_rate Real)
(declare-const rate_level_reasonable Bool)
(declare-const reinsurance_rate Real)
(declare-const reinsurance_rate_compliant Bool)
(declare-const reinsurance_rate_reflect_cost Bool)
(declare-const retention_rate Real)
(declare-const retention_rate_layer Real)
(declare-const retention_rate_nonproportional_compliant Bool)
(declare-const retention_rate_proportional_compliant Bool)
(declare-const role_agent_or_notary Bool)
(declare-const role_broker Bool)
(declare-const solicitation_qualification_canceled Bool)
(declare-const temporary_inward_reinsurance_arranged Bool)
(declare-const temporary_outward_reinsurance_arranged Bool)
(declare-const training_content_approved Bool)
(declare-const training_fair_treatment_seniors_compliant Bool)
(declare-const training_fair_treatment_seniors_passed Bool)
(declare-const training_organization_approved Bool)
(declare-const training_organization_recognized Bool)
(declare-const violate_agent_broker_permit_or_management Bool)
(declare-const violate_broker_duty_or_related Bool)
(declare-const violate_business_management Bool)
(declare-const violate_finance_management Bool)
(declare-const violate_finance_or_business_management Bool)
(declare-const weighted_avg_reinsurance_rate_same_layer Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_not_operate_without_license] 保險代理人、經紀人、公證人須經主管機關許可、繳存保證金、投保相關保險並領有執業證照後始得經營或執行業務
(assert (= agent_broker_operate_allowed
   (and license_permitted deposit_guarantee insurance_subscribed license_held)))

; [insurance:insurance_type_by_role] 保險代理人、公證人須投保責任保險；保險經紀人須投保責任保險及保證保險
(assert (= insurance_type_compliant
   (or (and role_agent_or_notary insurance_subscribed_responsibility)
       (and role_broker
            insurance_subscribed_responsibility
            insurance_subscribed_guarantee))))

; [insurance:bank_permit_for_agent_or_broker] 銀行經主管機關許可得擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_agent_broker_permit_compliant
   (and bank_permit_obtained (or bank_operate_agent bank_operate_broker))))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_fulfilled
   (and broker_exercise_duty_of_care broker_fulfill_fidelity)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_report_and_fee_disclosure_compliant
   (and broker_provide_written_report
        (or (not broker_charge_fee) broker_disclose_fee_standard))))

; [insurance:violate_finance_or_business_management_rules] 違反保險代理人、經紀人、公證人財務或業務管理規定
(assert (= violate_finance_or_business_management
   (or violate_business_management violate_finance_management)))

; [insurance:violate_broker_duty_or_related_rules] 違反保險經紀人善良管理人義務或相關規定
(assert (= violate_broker_duty_or_related
   (or (not broker_duty_of_care_fulfilled)
       (not broker_report_and_fee_disclosure_compliant))))

; [insurance:violate_agent_broker_permit_or_management] 違反保險代理人、經紀人、公證人許可或管理規則準用規定
(assert (= violate_agent_broker_permit_or_management
   (or (not agent_broker_operate_allowed)
       (not bank_agent_broker_permit_compliant))))

; [broker_company:report_and_approval_for_stop_resume_dissolve] 經紀人公司停業、復業、解散應報主管機關核准並辦理登記
(assert (= broker_company_stop_resume_dissolve_reported
   (or broker_company_dissolve_reported
       broker_company_stop_reported
       broker_company_resume_reported)))

; [broker_company:stop_period_limit_and_extension] 經紀人公司停業期間以一年為限，得申請一次展延，並於屆滿前十五日提出
(assert (= broker_company_stop_period_compliant
   (and (>= 12 broker_company_stop_period_months)
        (or (not broker_company_stop_extension_applied)
            broker_company_stop_extension_once)
        (or (not broker_company_stop_period_expiring)
            (<= 15 broker_company_stop_extension_apply_days_before)))))

; [broker_company:fail_resume_and_appoint_broker] 經紀人公司停業屆滿未申請復業並依規定任用經紀人者，主管機關廢止許可並註銷執業證照
(assert (= broker_company_fail_resume_and_appoint
   (and broker_company_stop_period_expired
        (not broker_company_resume_reported)
        (not broker_company_broker_appointed))))

; [broker_company:cancel_broker_license_on_stop_or_dissolve] 經紀人公司申請停業或解散應繳銷所任用經紀人執業證照
(assert (= broker_company_broker_license_canceled
   (or (and broker_company_stop_reported
            broker_company_broker_license_canceled_flag)
       (and broker_company_dissolve_reported
            broker_company_broker_license_canceled_flag
            broker_company_license_canceled))))

; [broker_company:broker_license_cancellation_registration] 經紀人公司停業、解散或主管機關註銷許可未辦理繳銷經紀人執業證照者，經紀人應於三十日內委由公會辦理註銷登記
(assert (= broker_license_cancellation_registration_done
   (or (and license_revoked
            (not broker_license_canceled)
            (>= 30 days_since_stop_or_dissolve_or_revocation))
       (and broker_company_stop_reported
            (not broker_license_canceled)
            (>= 30 days_since_stop_or_dissolve_or_revocation))
       (and broker_company_dissolve_reported
            (not broker_license_canceled)
            (>= 30 days_since_stop_or_dissolve_or_revocation)))))

; [bank:apply_suspend_or_terminate_broker_business] 銀行申請暫時停止或終止兼營保險經紀業務應報主管機關核准
(assert (= bank_suspend_terminate_broker_business_approved
   (and bank_apply_suspend_or_terminate
        bank_report_board_meeting
        bank_suspend_terminate_approved)))

; [bank:cancel_broker_license_on_suspend_or_terminate] 銀行申請暫停兼營保險經紀業務應繳銷所任用經紀人執業證照；申請終止應繳銷經紀人及兼營保險經紀業務執業證照
(assert (= bank_broker_license_canceled
   (or (and bank_apply_suspend broker_license_canceled)
       (and bank_apply_terminate
            broker_license_canceled
            bank_broker_business_license_canceled))))

; [bank:broker_license_cancellation_registration] 銀行經主管機關核准暫停、終止兼營保險經紀業務或許可廢止，未辦理繳銷經紀人執業證照者，經紀人應於三十日內委由公會辦理註銷登記
(assert (= bank_broker_license_cancellation_registration_done
   (or (and bank_suspend_terminate_approved
            (not broker_license_canceled)
            (>= 30 days_since_bank_suspend_terminate_or_revocation))
       (and license_revoked
            (not broker_license_canceled)
            (>= 30 days_since_bank_suspend_terminate_or_revocation)))))

; [broker:annual_training_hours_compliance] 個人執業經紀人及受任用經紀人每年平均參加在職教育訓練16小時以上，且換照前2年每年平均法令課程時數不低於8小時
(assert (= broker_annual_training_compliant
   (and (<= 16.0 avg_annual_onjob_training_hours)
        (<= 8.0 avg_annual_legal_course_hours_last_2_years))))

; [broker:compliance_officer_training_hours] 法令遵循人員每年參加在職教育訓練15小時以上
(assert (= compliance_officer_training_compliant
   (<= 15.0 compliance_officer_annual_training_hours)))

; [broker:approved_training_organization] 教育訓練由主管機關認可機構辦理，內容須報主管機關核可
(assert (= training_organization_approved
   (and training_organization_recognized training_content_approved)))

; [broker:training_for_fair_treatment_of_seniors] 經紀人每年應參加並通過公平對待65歲以上客戶相關教育訓練2小時
(assert (= training_fair_treatment_seniors_compliant
   (and (<= 2.0 annual_training_hours_fair_treatment_seniors)
        training_fair_treatment_seniors_passed)))

; [broker:ban_solicitation_if_not_compliant] 未依規定參加公平對待65歲以上客戶教育訓練者，次年度不得招攬65歲以上客戶保險商品
(assert (not (= training_fair_treatment_seniors_compliant ban_solicitation_seniors)))

; [broker_company:cancel_solicitation_qualification_if_not_compliant] 經紀人公司或銀行應取消未依規定參加公平對待65歲以上客戶教育訓練經紀人次年度招攬資格
(assert (= cancel_solicitation_qualification
   (or training_fair_treatment_seniors_compliant
       solicitation_qualification_canceled)))

; [property_insurance:reinsurance_rate_compliance] 財產保險業承接再保險分入業務時，再保險費率應符合適足性及合理性並反映成本
(assert (= reinsurance_rate_compliant
   (and (>= reinsurance_rate adequate_rate) reinsurance_rate_reflect_cost)))

; [property_insurance:retention_rate_proportional_reinsurance] 比例性再保險分出時，自留費率不得低於再保險費率及出單費率
(assert (= retention_rate_proportional_compliant
   (and (>= retention_rate reinsurance_rate)
        (>= retention_rate policy_issuance_fee_rate))))

; [property_insurance:retention_rate_nonproportional_reinsurance] 非比例性再保險分出時，各自留層費率不得低於高層費率及同層加權平均再保險費率，費率水準應合理
(assert (= retention_rate_nonproportional_compliant
   (and (>= retention_rate_layer higher_layer_rate)
        (>= retention_rate_layer weighted_avg_reinsurance_rate_same_layer)
        rate_level_reasonable)))

; [property_insurance:no_temporary_reinsurance_after_temporary_outward] 原簽單業務安排臨時再保險分出後，不得以任何臨時再保或分保方式承接該分出風險，航空、核能及專屬再保險業務除外
(assert (= no_temporary_reinsurance_violation
   (and temporary_outward_reinsurance_arranged
        temporary_inward_reinsurance_arranged
        (not business_type_air_nuclear_special))))

; [property_insurance:penalty_conditions] 處罰條件：違反財務或業務管理規定、違反保險代理人經紀人管理規則或未符合再保險費率規定時處罰
(assert (= penalty
   (or violate_broker_duty_or_related
       violate_agent_broker_permit_or_management
       violate_finance_or_business_management
       (not retention_rate_proportional_compliant)
       (not retention_rate_nonproportional_compliant)
       (not reinsurance_rate_compliant)
       no_temporary_reinsurance_violation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_broker_operate_allowed true))
(assert (= license_permitted true))
(assert (= deposit_guarantee true))
(assert (= insurance_subscribed true))
(assert (= license_held true))
(assert (= role_broker true))
(assert (= insurance_subscribed_responsibility true))
(assert (= insurance_subscribed_guarantee true))
(assert (= broker_exercise_duty_of_care false))
(assert (= broker_fulfill_fidelity false))
(assert (= broker_provide_written_report false))
(assert (= broker_charge_fee false))
(assert (= broker_disclose_fee_standard false))
(assert (= violate_finance_management false))
(assert (= violate_business_management true))
(assert (= violate_finance_or_business_management true))
(assert (= violate_broker_duty_or_related true))
(assert (= violate_agent_broker_permit_or_management false))
(assert (= reinsurance_rate 2.0))
(assert (= adequate_rate 3.0))
(assert (= reinsurance_rate_reflect_cost false))
(assert (= reinsurance_rate_compliant false))
(assert (= retention_rate_proportional_compliant true))
(assert (= retention_rate_nonproportional_compliant false))
(assert (= retention_rate_layer (/ 7.0 5.0)))
(assert (= higher_layer_rate (/ 417.0 100.0)))
(assert (= weighted_avg_reinsurance_rate_same_layer 3.0))
(assert (= rate_level_reasonable false))
(assert (= no_temporary_reinsurance_violation false))
(assert (= temporary_outward_reinsurance_arranged false))
(assert (= temporary_inward_reinsurance_arranged false))
(assert (= business_type_air_nuclear_special false))
(assert (= broker_duty_of_care_fulfilled false))
(assert (= broker_report_and_fee_disclosure_compliant false))
(assert (= penalty true))
(assert (= annual_training_hours_fair_treatment_seniors 0.0))
(assert (= avg_annual_legal_course_hours_last_2_years 0.0))
(assert (= avg_annual_onjob_training_hours 0.0))
(assert (= ban_solicitation_seniors false))
(assert (= bank_agent_broker_permit_compliant false))
(assert (= bank_apply_suspend false))
(assert (= bank_apply_suspend_or_terminate false))
(assert (= bank_apply_terminate false))
(assert (= bank_broker_business_license_canceled false))
(assert (= bank_broker_license_canceled false))
(assert (= bank_broker_license_cancellation_registration_done false))
(assert (= bank_operate_agent false))
(assert (= bank_operate_broker false))
(assert (= bank_permit_obtained false))
(assert (= bank_report_board_meeting false))
(assert (= bank_suspend_terminate_approved false))
(assert (= bank_suspend_terminate_broker_business_approved false))
(assert (= broker_annual_training_compliant false))
(assert (= broker_company_broker_appointed false))
(assert (= broker_company_broker_license_canceled false))
(assert (= broker_company_broker_license_canceled_flag false))
(assert (= broker_company_dissolve_reported false))
(assert (= broker_company_fail_resume_and_appoint false))
(assert (= broker_company_license_canceled false))
(assert (= broker_company_resume_reported false))
(assert (= broker_company_stop_extension_applied false))
(assert (= broker_company_stop_extension_apply_days_before 0))
(assert (= broker_company_stop_extension_once false))
(assert (= broker_company_stop_period_compliant false))
(assert (= broker_company_stop_period_expired false))
(assert (= broker_company_stop_period_expiring false))
(assert (= broker_company_stop_period_months 0))
(assert (= broker_company_stop_reported false))
(assert (= broker_company_stop_resume_dissolve_reported false))
(assert (= broker_license_canceled false))
(assert (= broker_license_cancellation_registration_done false))
(assert (= cancel_solicitation_qualification false))
(assert (= compliance_officer_annual_training_hours 0.0))
(assert (= compliance_officer_training_compliant false))
(assert (= days_since_bank_suspend_terminate_or_revocation 0))
(assert (= days_since_stop_or_dissolve_or_revocation 0))
(assert (= insurance_type_compliant false))
(assert (= license_revoked false))
(assert (= policy_issuance_fee_rate 0.0))
(assert (= retention_rate 0.0))
(assert (= role_agent_or_notary false))
(assert (= solicitation_qualification_canceled false))
(assert (= training_content_approved false))
(assert (= training_fair_treatment_seniors_compliant false))
(assert (= training_fair_treatment_seniors_passed false))
(assert (= training_organization_approved false))
(assert (= training_organization_recognized false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 87
; Total facts: 87
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
