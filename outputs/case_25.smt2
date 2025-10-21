; SMT2 file generated from compliance case automatic
; Case ID: case_25
; Generated at: 2025-10-20T23:18:20.299400
;
; This file can be executed with Z3:
;   z3 case_25.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const company_registration_changed Bool)
(declare-const correction_issued Bool)
(declare-const correction_ordered Bool)
(declare-const direct_or_indirect_board_members Bool)
(declare-const director_or_supervisor_dismissed_or_suspended Bool)
(declare-const director_supervisor_dismissal_notified Bool)
(declare-const dissolution_and_liquidation_ordered Bool)
(declare-const fhc_name_usage_stopped Bool)
(declare-const fhc_violation_flag Bool)
(declare-const improvement_deadline_set Bool)
(declare-const license_revocation_requirements_met Bool)
(declare-const license_revoked Bool)
(declare-const manager_or_staff_dismissed Bool)
(declare-const max_board_members_allowed Int)
(declare-const notification_to_economic_ministry_done Bool)
(declare-const other_necessary_measures_taken Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
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

; [fhc:correction_ordered] 主管機關已予以糾正並限期令其改善
(assert (= correction_ordered (and correction_issued improvement_deadline_set)))

; [fhc:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or license_revoked
       subsidiary_shares_disposed
       manager_or_staff_dismissed
       director_or_supervisor_dismissed_or_suspended
       subsidiary_business_suspended
       resolution_revoked
       other_necessary_measures_taken)))

; [fhc:director_supervisor_dismissal_notified] 依第四款解除董事、監察人職務時，主管機關通知經濟部廢止其登記
(assert (= director_supervisor_dismissal_notified
   (or (not director_or_supervisor_dismissed_or_suspended)
       notification_to_economic_ministry_done)))

; [fhc:license_revocation_requirements_met] 依第六款廢止許可時，金融控股公司於期限內處分股份及董事人數不符規定
(assert (let ((a!1 (not (and (>= 0.0 (ite shares_disposed_within_deadline 1.0 0.0))
                     (>= max_board_members_allowed
                         (ite direct_or_indirect_board_members 1 0))
                     fhc_name_usage_stopped
                     company_registration_changed))))
  (= license_revocation_requirements_met (and license_revoked a!1))))

; [fhc:dissolution_and_liquidation_ordered] 未於期限內完成處分者，主管機關令其解散及清算
(assert (let ((a!1 (and license_revoked
                (not (>= 0.0 (ite shares_disposed_within_deadline 1.0 0.0))))))
  (= dissolution_and_liquidation_ordered a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令且未依規定改善或未完成處分及解散清算時處罰
(assert (let ((a!1 (not (and (>= 0.0 (ite shares_disposed_within_deadline 1.0 0.0))
                     (>= max_board_members_allowed
                         (ite direct_or_indirect_board_members 1 0))
                     fhc_name_usage_stopped
                     company_registration_changed)))
      (a!2 (and license_revoked
                (not (>= 0.0 (ite shares_disposed_within_deadline 1.0 0.0)))
                (not dissolution_and_liquidation_ordered))))
  (= penalty
     (or (and violation_occurred (not correction_ordered))
         (and license_revoked a!1)
         a!2))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fhc_violation_flag true))
(assert (= violation_occurred true))
(assert (= correction_issued true))
(assert (= improvement_deadline_set false))
(assert (= director_or_supervisor_dismissed_or_suspended true))
(assert (= notification_to_economic_ministry_done true))
(assert (= penalty_measures true))
(assert (= penalty true))
(assert (= resolution_revoked false))
(assert (= subsidiary_business_suspended false))
(assert (= manager_or_staff_dismissed false))
(assert (= subsidiary_shares_disposed false))
(assert (= license_revoked false))
(assert (= other_necessary_measures_taken false))
(assert (= shares_disposed_within_deadline false))
(assert (= dissolution_and_liquidation_ordered false))
(assert (= fhc_name_usage_stopped false))
(assert (= company_registration_changed false))
(assert (= max_board_members_allowed 0))
(assert (= direct_or_indirect_board_members false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 23
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
