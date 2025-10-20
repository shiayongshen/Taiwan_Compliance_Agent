; SMT2 file generated from compliance case automatic
; Case ID: case_25
; Generated at: 2025-10-19T05:40:47.721192
;
; This file can be executed with Z3:
;   z3 case_25.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const director_supervisor_dismissal_notified Bool)
(declare-const dismiss_director_supervisor Bool)
(declare-const disposition_completed Bool)
(declare-const disposition_completed_within_deadline Bool)
(declare-const disposition_not_completed_within_deadline Bool)
(declare-const dissolution_and_liquidation_ordered Bool)
(declare-const fhc_violation_flag Bool)
(declare-const license_revocation_ordered Bool)
(declare-const license_revoked Bool)
(declare-const notification_to_economic_ministry Bool)
(declare-const other_penalty_measures_taken Bool)
(declare-const penalty_measures Bool)
(declare-const shares_and_directors_not_meet_requirements Bool)
(declare-const violation_occurred Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:violation_occurred] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred fhc_violation_flag))

; [fhc:penalty_measures] 主管機關可採取之處分措施
(assert (and (or violation_occurred (not penalty_measures))
     (or penalty_measures (not violation_occurred))))

; [fhc:director_supervisor_dismissal_notified] 依第四款解除董事、監察人職務時，主管機關已通知經濟部廢止其登記
(assert (= director_supervisor_dismissal_notified
   (and dismiss_director_supervisor notification_to_economic_ministry)))

; [fhc:license_revoked] 依第六款廢止許可
(assert (= license_revoked license_revocation_ordered))

; [fhc:disposition_completed_within_deadline] 於期限內完成處分銀行、保險公司或證券商持有股份及董事人數不符規定
(assert (= disposition_completed_within_deadline
   (and license_revoked
        disposition_completed
        shares_and_directors_not_meet_requirements)))

; [fhc:disposition_not_completed_within_deadline] 未於期限內完成處分，應進行解散及清算
(assert (= disposition_not_completed_within_deadline
   (and license_revoked (not disposition_completed))))

; [fhc:dissolution_and_liquidation_ordered] 應令進行解散及清算
(assert (= dissolution_and_liquidation_ordered
   disposition_not_completed_within_deadline))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令且未於期限內完成處分或未執行必要處置時處罰
(assert (let ((a!1 (or (and license_revoked (not disposition_completed))
               (and violation_occurred
                    (not (or dismiss_director_supervisor
                             license_revoked
                             other_penalty_measures_taken))))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fhc_violation_flag true))
(assert (= violation_occurred true))
(assert (= dismiss_director_supervisor true))
(assert (= notification_to_economic_ministry false))
(assert (= director_supervisor_dismissal_notified false))
(assert (= license_revocation_ordered false))
(assert (= license_revoked false))
(assert (= disposition_completed false))
(assert (= disposition_completed_within_deadline false))
(assert (= disposition_not_completed_within_deadline false))
(assert (= dissolution_and_liquidation_ordered false))
(assert (= other_penalty_measures_taken false))
(assert (= penalty_measures true))
(assert (= shares_and_directors_not_meet_requirements false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 15
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
