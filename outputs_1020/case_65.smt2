; SMT2 file generated from compliance case automatic
; Case ID: case_65
; Generated at: 2025-10-19T07:02:44.046469
;
; This file can be executed with Z3:
;   z3 case_65.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_type Bool)
(declare-const approved_by_authority Bool)
(declare-const authority_defined_minimum_guarantee_deposit Real)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_insurance_agent_or_broker_approved Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_written_analysis_and_fee_disclosed Bool)
(declare-const business_scope_restricted Bool)
(declare-const certificate_canceled Bool)
(declare-const correction_deadline_given Bool)
(declare-const corrective_order_issued Bool)
(declare-const director_or_supervisor_dismissed Bool)
(declare-const director_or_supervisor_dismissed_or_suspended Bool)
(declare-const director_supervisor_dismissal_registered Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_fidelity Bool)
(declare-const fee_charged Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const fine_imposed Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const improvement_deadline_given Bool)
(declare-const insurance_fee_payment_method_ok Bool)
(declare-const insurance_type Bool)
(declare-const license_and_guarantee_required Bool)
(declare-const license_issued Bool)
(declare-const license_revoked Bool)
(declare-const management_rules_defined Bool)
(declare-const manager_or_staff_dismissed Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const note_issued_non_policyholder Bool)
(declare-const note_issued_non_policyholder_declaration_ok Bool)
(declare-const other_necessary_measures_taken Bool)
(declare-const penalty Bool)
(declare-const policyholder_declaration_provided Bool)
(declare-const registration_canceled Bool)
(declare-const relevant_insurance_purchased Bool)
(declare-const relevant_insurance_type_ok Bool)
(declare-const self_named_note_issued Bool)
(declare-const serious_violation Bool)
(declare-const total_amount_paid_directly Real)
(declare-const violation_fine_or_revocation Bool)
(declare-const violation_penalties_applicable Bool)
(declare-const written_analysis_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_agent:license_and_guarantee_required] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，且領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_required
   (and approved_by_authority
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_purchased
        license_issued)))

; [insurance_agent:relevant_insurance_type] 相關保險種類依身份區分：保險代理人、公證人為責任保險；保險經紀人為責任保險及保證保險
(assert (= relevant_insurance_type_ok (and agent_type insurance_type)))

; [insurance_agent:minimum_guarantee_deposit_and_insurance] 主管機關定最低保證金及保險金額，依經營業務範圍及規模等因素決定
(assert (= minimum_guarantee_deposit authority_defined_minimum_guarantee_deposit))

; [insurance_agent:management_rules_defined] 主管機關定保險代理人、經紀人、公證人資格取得、申請許可條件、程序、文件、董事監察人經理人資格條件、解任事由、分支機構條件、財務業務管理、教育訓練、廢止許可及其他管理規則
(assert management_rules_defined)

; [bank:insurance_agent_or_broker_approval] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_insurance_agent_or_broker_approved
   (and bank_approved_by_authority
        (or bank_operate_as_agent bank_operate_as_broker))))

; [insurance_broker:duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_fidelity (and duty_of_care duty_of_fidelity)))

; [insurance_broker:provide_written_analysis_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，收取報酬者應明確告知報酬標準
(assert (= broker_written_analysis_and_fee_disclosed
   (and written_analysis_provided (or (not fee_charged) fee_standard_disclosed))))

; [insurance_agent:violation_penalties] 保險代理人、經紀人、公證人違反法令或有礙健全經營時，主管機關得糾正、限期改善或處分
(assert (= violation_penalties_applicable
   (or improvement_deadline_given
       business_scope_restricted
       manager_or_staff_dismissed
       other_necessary_measures_taken
       director_or_supervisor_dismissed_or_suspended
       corrective_order_issued)))

; [insurance_agent:director_supervisor_dismissal_registration] 依規定解除董事或監察人職務時，主管機關通知公司登記主管機關註銷其登記
(assert (= director_supervisor_dismissal_registered
   (or (not director_or_supervisor_dismissed) registration_canceled)))

; [insurance_agent:violation_fine_or_license_revocation] 違反管理規則財務或業務管理規定，或相關規定者，應限期改正或處罰鍰，情節重大者廢止許可並註銷執業證照
(assert (= violation_fine_or_revocation
   (or fine_imposed
       correction_deadline_given
       (and license_revoked certificate_canceled)
       (not serious_violation))))

; [insurance_agent:insurance_fee_payment_method] 個人執業代理人、代理人公司及銀行代收保險費應直接總額解繳保險業，不得以自己名義開立票據解繳
(assert (= insurance_fee_payment_method_ok
   (and (= total_amount_paid_directly 1.0) (not self_named_note_issued))))

; [insurance_agent:note_issued_non_policyholder_declaration] 以票據解繳保險費非要保人、被保險人及受益人名義開立者，應出具要保人聲明書
(assert (= note_issued_non_policyholder_declaration_ok
   (or policyholder_declaration_provided (not note_issued_non_policyholder))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可、保證金、保險、執業證照規定，或違反管理規則財務業務管理規定，或未依主管機關處分改善時處罰
(assert (= penalty
   (or (not violation_penalties_applicable)
       (not insurance_fee_payment_method_ok)
       (not management_rules_defined)
       (not license_and_guarantee_required)
       (not violation_fine_or_revocation)
       (not relevant_insurance_type_ok)
       (not note_issued_non_policyholder_declaration_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approved_by_authority true))
(assert (= guarantee_deposit_amount 0.0))
(assert (= minimum_guarantee_deposit 0.0))
(assert (= relevant_insurance_purchased true))
(assert (= agent_type true))
(assert (= insurance_type true))
(assert (= license_issued true))
(assert (= management_rules_defined true))
(assert (= corrective_order_issued false))
(assert (= improvement_deadline_given false))
(assert (= business_scope_restricted true))
(assert (= manager_or_staff_dismissed false))
(assert (= director_or_supervisor_dismissed false))
(assert (= director_or_supervisor_dismissed_or_suspended false))
(assert (= other_necessary_measures_taken false))
(assert (= violation_penalties_applicable true))
(assert (= correction_deadline_given false))
(assert (= fine_imposed true))
(assert (= serious_violation true))
(assert (= license_revoked false))
(assert (= certificate_canceled false))
(assert (= insurance_fee_payment_method_ok false))
(assert (= total_amount_paid_directly 0.0))
(assert (= self_named_note_issued false))
(assert (= note_issued_non_policyholder false))
(assert (= policyholder_declaration_provided true))
(assert (= note_issued_non_policyholder_declaration_ok true))
(assert (= penalty true))
(assert (= bank_approved_by_authority false))
(assert (= bank_insurance_agent_or_broker_approved false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= broker_duty_of_care_and_fidelity false))
(assert (= duty_of_care false))
(assert (= duty_of_fidelity false))
(assert (= broker_written_analysis_and_fee_disclosed false))
(assert (= written_analysis_provided false))
(assert (= fee_charged false))
(assert (= fee_standard_disclosed false))
(assert (= director_supervisor_dismissal_registered false))
(assert (= registration_canceled false))
(assert (= authority_defined_minimum_guarantee_deposit 0.0))
(assert (= license_and_guarantee_required false))
(assert (= relevant_insurance_type_ok false))
(assert (= violation_fine_or_revocation false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 45
; Total facts: 45
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
