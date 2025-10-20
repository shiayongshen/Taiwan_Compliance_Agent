; SMT2 file generated from compliance case automatic
; Case ID: case_450
; Generated at: 2025-10-19T16:20:27.418433
;
; This file can be executed with Z3:
;   z3 case_450.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const correction_given Bool)
(declare-const correction_ordered Bool)
(declare-const dispose_shares_and_directors_not_compliant Bool)
(declare-const dispose_subsidiary_shares Bool)
(declare-const disposed_shares_ratio Real)
(declare-const disposed_within_deadline Bool)
(declare-const improvement_deadline_set Bool)
(declare-const mandatory_dissolution_and_liquidation Bool)
(declare-const measure_1 Bool)
(declare-const measure_2 Bool)
(declare-const measure_3 Bool)
(declare-const measure_4 Bool)
(declare-const measure_5 Bool)
(declare-const measure_6 Bool)
(declare-const moe_notified Bool)
(declare-const notify_moe_for_removal Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const prohibited_company_registration Bool)
(declare-const prohibited_use_name Bool)
(declare-const prohibited_use_name_and_registration Bool)
(declare-const remaining_directors_count Int)
(declare-const remove_director_supervisor Bool)
(declare-const remove_manager_staff Bool)
(declare-const required_directors_count Int)
(declare-const required_shares_ratio Real)
(declare-const revoke_license Bool)
(declare-const revoke_meeting_resolution Bool)
(declare-const suspend_subsidiary_business Bool)
(declare-const violation_flag Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:violation_occurred] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= violation_occurred violation_flag))

; [fhc:correction_ordered] 主管機關已予以糾正並限期令其改善
(assert (= correction_ordered (and correction_given improvement_deadline_set)))

; [fhc:penalty_measures] 主管機關可採取之處分措施
(assert (and (or violation_occurred (not penalty_measures))
     (or penalty_measures (not violation_occurred))))

; [fhc:measure_revoke_meeting_resolution] 撤銷法定會議之決議
(assert (= revoke_meeting_resolution measure_1))

; [fhc:measure_suspend_subsidiary_business] 停止子公司一部或全部業務
(assert (= suspend_subsidiary_business measure_2))

; [fhc:measure_remove_manager_staff] 解除經理人或職員之職務
(assert (= remove_manager_staff measure_3))

; [fhc:measure_remove_director_supervisor] 解除董事、監察人職務或停止其於一定期間內執行職務
(assert (= remove_director_supervisor measure_4))

; [fhc:notify_moe_for_removal] 依第四款解除董事、監察人職務時通知經濟部廢止登記
(assert (= notify_moe_for_removal (and remove_director_supervisor moe_notified)))

; [fhc:measure_dispose_subsidiary_shares] 令其處分持有子公司之股份
(assert (= dispose_subsidiary_shares measure_5))

; [fhc:measure_revoke_license] 廢止許可
(assert (= revoke_license measure_6))

; [fhc:dispose_shares_and_directors_after_license_revocation] 廢止許可後一定期限內處分股份及董事人數不符規定
(assert (let ((a!1 (and revoke_license
                (or (not (<= required_directors_count remaining_directors_count))
                    (not (<= required_shares_ratio disposed_shares_ratio)))
                (not disposed_within_deadline))))
  (= dispose_shares_and_directors_not_compliant a!1)))

; [fhc:prohibited_use_of_name_and_registration] 廢止許可後不得再使用金融控股公司名稱及辦理公司變更登記
(assert (= prohibited_use_name_and_registration
   (and revoke_license prohibited_use_name prohibited_company_registration)))

; [fhc:mandatory_dissolution_and_liquidation] 未於期限內處分完成者，應令其進行解散及清算
(assert (= mandatory_dissolution_and_liquidation
   (and revoke_license (not disposed_within_deadline))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令或未依主管機關處分措施執行時處罰
(assert (= penalty
   (or (not (or revoke_meeting_resolution
                dispose_subsidiary_shares
                revoke_license
                mandatory_dissolution_and_liquidation
                suspend_subsidiary_business
                remove_manager_staff
                remove_director_supervisor))
       (not correction_ordered)
       (not violation_occurred))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= correction_given true))
(assert (= improvement_deadline_set true))
(assert (= measure_1 false))
(assert (= measure_2 false))
(assert (= measure_3 false))
(assert (= measure_4 false))
(assert (= measure_5 false))
(assert (= measure_6 false))
(assert (= moe_notified false))
(assert (= disposed_shares_ratio 0.0))
(assert (= required_shares_ratio 0.0))
(assert (= remaining_directors_count 0))
(assert (= required_directors_count 0))
(assert (= disposed_within_deadline false))
(assert (= prohibited_use_name false))
(assert (= prohibited_company_registration false))
(assert (= correction_ordered false))
(assert (= dispose_shares_and_directors_not_compliant false))
(assert (= dispose_subsidiary_shares false))
(assert (= mandatory_dissolution_and_liquidation false))
(assert (= notify_moe_for_removal false))
(assert (= penalty false))
(assert (= penalty_measures false))
(assert (= prohibited_use_name_and_registration false))
(assert (= remove_director_supervisor false))
(assert (= remove_manager_staff false))
(assert (= revoke_license false))
(assert (= revoke_meeting_resolution false))
(assert (= suspend_subsidiary_business false))
(assert (= violation_occurred false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 31
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
