; SMT2 file generated from compliance case automatic
; Case ID: case_46
; Generated at: 2025-10-19T06:29:39.561486
;
; This file can be executed with Z3:
;   z3 case_46.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const company_registration_changed Bool)
(declare-const correction_order_issued Bool)
(declare-const director_or_supervisor_dismissed_or_suspended Bool)
(declare-const director_supervisor_dismissal_notification Bool)
(declare-const directors_reduced_within_deadline Bool)
(declare-const economic_ministry_notified Bool)
(declare-const fhc_violation_flag Bool)
(declare-const improvement_order_issued Bool)
(declare-const license_revocation_noncompliance Bool)
(declare-const license_revocation_requirements_met Bool)
(declare-const license_revoked Bool)
(declare-const manager_or_staff_dismissed Bool)
(declare-const name_usage_stopped Bool)
(declare-const other_measures_taken Bool)
(declare-const penalty Bool)
(declare-const penalty_measures_authorized Bool)
(declare-const resolution_revoked Bool)
(declare-const shares_disposed_within_deadline Bool)
(declare-const subsidiary_business_suspended Bool)
(declare-const subsidiary_shares_disposed Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:violation_occurred] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred fhc_violation_flag))

; [fhc:penalty_measures_authorized] 主管機關得依情節輕重採取處分措施
(assert (= penalty_measures_authorized
   (and violation_occurred
        (or subsidiary_shares_disposed
            director_or_supervisor_dismissed_or_suspended
            other_measures_taken
            correction_order_issued
            subsidiary_business_suspended
            license_revoked
            resolution_revoked
            improvement_order_issued
            manager_or_staff_dismissed))))

; [fhc:director_supervisor_dismissal_notification] 依第四款解除董事、監察人職務時，主管機關通知經濟部廢止登記
(assert (= director_supervisor_dismissal_notification
   (or (not director_or_supervisor_dismissed_or_suspended)
       economic_ministry_notified)))

; [fhc:license_revocation_requirements_met] 依第六款廢止許可時，金融控股公司於期限內完成股份及董事人數處分且停止使用名稱及變更登記
(assert (= license_revocation_requirements_met
   (and license_revoked
        shares_disposed_within_deadline
        directors_reduced_within_deadline
        name_usage_stopped
        company_registration_changed)))

; [fhc:license_revocation_noncompliance] 未於期限內完成股份及董事人數處分者，應進行解散及清算
(assert (= license_revocation_noncompliance
   (and license_revoked (not license_revocation_requirements_met))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令且未依規定完成改善或處分者處罰
(assert (= penalty
   (or (and violation_occurred (not penalty_measures_authorized))
       (and license_revoked (not license_revocation_requirements_met)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fhc_violation_flag true))
(assert (= violation_occurred true))
(assert (= correction_order_issued true))
(assert (= improvement_order_issued false))
(assert (= resolution_revoked false))
(assert (= subsidiary_business_suspended false))
(assert (= manager_or_staff_dismissed false))
(assert (= director_or_supervisor_dismissed_or_suspended true))
(assert (= director_supervisor_dismissal_notification false))
(assert (= economic_ministry_notified false))
(assert (= license_revoked false))
(assert (= shares_disposed_within_deadline false))
(assert (= directors_reduced_within_deadline false))
(assert (= name_usage_stopped false))
(assert (= company_registration_changed false))
(assert (= license_revocation_requirements_met false))
(assert (= license_revocation_noncompliance false))
(assert (= other_measures_taken false))
(assert (= penalty_measures_authorized true))
(assert (= penalty false))
(assert (= subsidiary_shares_disposed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 21
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
