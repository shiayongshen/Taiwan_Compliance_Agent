; SMT2 file generated from compliance case automatic
; Case ID: case_450
; Generated at: 2025-10-21T10:08:47.335056
;
; This file can be executed with Z3:
;   z3 case_450.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const correction_flag Bool)
(declare-const correction_ordered Bool)
(declare-const dispose_deadline_days_left Int)
(declare-const dispose_shares_within_deadline Bool)
(declare-const dispose_subsidiary_shares Bool)
(declare-const economic_ministry_notified Bool)
(declare-const liquidation_ordered Bool)
(declare-const notify_economic_ministry Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const prohibit_use_name_and_change_registration Bool)
(declare-const remove_director_or_supervisor Bool)
(declare-const remove_manager_or_staff Bool)
(declare-const revoke_license Bool)
(declare-const revoke_statutory_resolution Bool)
(declare-const subsidiary_direct_or_indirect_directors Bool)
(declare-const subsidiary_shares_held Bool)
(declare-const suspend_director_or_supervisor_duty Bool)
(declare-const suspend_subsidiary_business_all Bool)
(declare-const suspend_subsidiary_business_partial Bool)
(declare-const violation_exists Bool)
(declare-const violation_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:violation_exists] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= violation_exists violation_flag))

; [fhc:correction_ordered] 主管機關已予以糾正並限期改善
(assert (= correction_ordered correction_flag))

; [fhc:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or dispose_subsidiary_shares
       other_necessary_measures
       remove_director_or_supervisor
       remove_manager_or_staff
       revoke_license
       revoke_statutory_resolution
       suspend_director_or_supervisor_duty
       suspend_subsidiary_business_all
       suspend_subsidiary_business_partial)))

; [fhc:notify_economic_ministry] 依第四款解除董事、監察人職務時通知經濟部廢止登記
(assert (= notify_economic_ministry
   (or economic_ministry_notified (not remove_director_or_supervisor))))

; [fhc:dispose_shares_within_deadline] 依第六款廢止許可時，於期限內處分子公司股份及董事人數不符規定
(assert (= dispose_shares_within_deadline
   (and revoke_license
        (>= 0 dispose_deadline_days_left)
        (or subsidiary_direct_or_indirect_directors subsidiary_shares_held))))

; [fhc:prohibit_use_name_and_change_registration] 不得再使用金融控股公司名稱及辦理公司變更登記
(assert (= prohibit_use_name_and_change_registration revoke_license))

; [fhc:liquidation_ordered] 未於期限內處分完成者，應令解散及清算
(assert (= liquidation_ordered dispose_shares_within_deadline))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令且未依規定處分股份或未解散清算時處罰
(assert (= penalty
   (or dispose_shares_within_deadline
       liquidation_ordered
       (and violation_exists (not correction_ordered)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation_exists true))
(assert (= correction_flag true))
(assert (= correction_ordered true))
(assert (= dispose_subsidiary_shares false))
(assert (= dispose_deadline_days_left 0))
(assert (= dispose_shares_within_deadline false))
(assert (= revoke_license false))
(assert (= liquidation_ordered false))
(assert (= penalty_measures true))
(assert (= penalty true))
(assert (= remove_director_or_supervisor false))
(assert (= economic_ministry_notified false))
(assert (= notify_economic_ministry false))
(assert (= revoke_statutory_resolution false))
(assert (= suspend_subsidiary_business_partial false))
(assert (= suspend_subsidiary_business_all false))
(assert (= remove_manager_or_staff false))
(assert (= suspend_director_or_supervisor_duty false))
(assert (= other_necessary_measures false))
(assert (= subsidiary_shares_held true))
(assert (= subsidiary_direct_or_indirect_directors true))
(assert (= prohibit_use_name_and_change_registration false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 23
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
