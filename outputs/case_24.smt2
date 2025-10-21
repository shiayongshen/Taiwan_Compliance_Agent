; SMT2 file generated from compliance case automatic
; Case ID: case_24
; Generated at: 2025-10-20T23:17:26.057520
;
; This file can be executed with Z3:
;   z3 case_24.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const company_registration_changed Bool)
(declare-const correction_flag Bool)
(declare-const correction_ordered Bool)
(declare-const dispose_deadline_days_left Int)
(declare-const dispose_shares_within_deadline Bool)
(declare-const dispose_subsidiary_shares Bool)
(declare-const license_revoked Bool)
(declare-const name_use_stopped Bool)
(declare-const notify_economic_ministry Bool)
(declare-const notify_ministry_done Bool)
(declare-const penalty Bool)
(declare-const penalty_dispose_subsidiary_shares Bool)
(declare-const penalty_license_revoked Bool)
(declare-const penalty_liquidation_ordered Bool)
(declare-const penalty_remove_director_supervisor Bool)
(declare-const penalty_remove_manager_staff Bool)
(declare-const penalty_revocation_resolution Bool)
(declare-const penalty_suspend_subsidiary_business Bool)
(declare-const remove_director_supervisor Bool)
(declare-const remove_manager_staff Bool)
(declare-const revocation_resolution Bool)
(declare-const subsidiary_directors_appointed_percent Real)
(declare-const subsidiary_shares_held_percent Real)
(declare-const suspend_subsidiary_business Bool)
(declare-const violation_exists Bool)
(declare-const violation_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:violation_exists] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= violation_exists violation_flag))

; [fhc:correction_ordered] 主管機關已予以糾正並限期改善
(assert (= correction_ordered correction_flag))

; [fhc:penalty_revocation_resolution] 主管機關撤銷法定會議之決議
(assert (= penalty_revocation_resolution revocation_resolution))

; [fhc:penalty_suspend_subsidiary_business] 主管機關停止子公司一部或全部業務
(assert (= penalty_suspend_subsidiary_business suspend_subsidiary_business))

; [fhc:penalty_remove_manager_staff] 主管機關令其解除經理人或職員之職務
(assert (= penalty_remove_manager_staff remove_manager_staff))

; [fhc:penalty_remove_director_supervisor] 主管機關解除董事、監察人職務或停止其於一定期間內執行職務
(assert (= penalty_remove_director_supervisor remove_director_supervisor))

; [fhc:notify_economic_ministry] 解除董事、監察人職務時通知經濟部廢止其登記
(assert (= notify_economic_ministry
   (and penalty_remove_director_supervisor notify_ministry_done)))

; [fhc:penalty_dispose_subsidiary_shares] 主管機關令其處分持有子公司之股份
(assert (= penalty_dispose_subsidiary_shares dispose_subsidiary_shares))

; [fhc:penalty_license_revoked] 主管機關廢止許可
(assert (= penalty_license_revoked license_revoked))

; [fhc:dispose_shares_within_deadline] 廢止許可後於期限內處分銀行、保險公司或證券商持有之股份及董事人數符合規定
(assert (= dispose_shares_within_deadline
   (and (>= 0 dispose_deadline_days_left)
        (>= 25.0 subsidiary_shares_held_percent)
        (>= 50.0 subsidiary_directors_appointed_percent)
        name_use_stopped
        company_registration_changed)))

; [fhc:penalty_liquidation_ordered] 未於期限內完成處分者，主管機關令其解散及清算
(assert (let ((a!1 (and (not (<= dispose_deadline_days_left 0))
                (or (not (<= subsidiary_shares_held_percent 25.0))
                    (not name_use_stopped)
                    (not (<= subsidiary_directors_appointed_percent 50.0))
                    (not company_registration_changed)))))
  (= penalty_liquidation_ordered a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：有違反且主管機關依情節輕重執行處分時處罰
(assert (= penalty
   (and violation_exists
        (or penalty_liquidation_ordered
            penalty_license_revoked
            penalty_suspend_subsidiary_business
            penalty_revocation_resolution
            penalty_remove_manager_staff
            penalty_dispose_subsidiary_shares
            penalty_remove_director_supervisor))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation_exists true))
(assert (= correction_flag true))
(assert (= correction_ordered true))
(assert (= remove_director_supervisor true))
(assert (= penalty_remove_director_supervisor true))
(assert (= penalty true))
(assert (= revocation_resolution false))
(assert (= penalty_revocation_resolution false))
(assert (= suspend_subsidiary_business false))
(assert (= penalty_suspend_subsidiary_business false))
(assert (= remove_manager_staff false))
(assert (= penalty_remove_manager_staff false))
(assert (= dispose_subsidiary_shares false))
(assert (= penalty_dispose_subsidiary_shares false))
(assert (= license_revoked false))
(assert (= penalty_license_revoked false))
(assert (= dispose_deadline_days_left 0))
(assert (= dispose_shares_within_deadline false))
(assert (= subsidiary_shares_held_percent 0.0))
(assert (= subsidiary_directors_appointed_percent 0.0))
(assert (= name_use_stopped false))
(assert (= company_registration_changed false))
(assert (= notify_ministry_done false))
(assert (= notify_economic_ministry false))
(assert (= penalty_liquidation_ordered false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 26
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
