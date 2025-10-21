; SMT2 file generated from compliance case automatic
; Case ID: case_60
; Generated at: 2025-10-21T00:28:31.458083
;
; This file can be executed with Z3:
;   z3 case_60.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_held Real)
(declare-const capital_held_by_fhc Real)
(declare-const company_law_articles_applied Bool)
(declare-const control_shareholding Real)
(declare-const correction_flag Bool)
(declare-const correction_ordered Bool)
(declare-const direct_indirect_appointed_directors Int)
(declare-const direct_indirect_appointed_directors_by_fhc Int)
(declare-const dispose_completed_within_deadline Bool)
(declare-const dispose_shares_within_deadline Bool)
(declare-const dispose_subsidiary_shares_ordered Bool)
(declare-const established_under_law Bool)
(declare-const is_bank_subsidiary Bool)
(declare-const is_fhc Bool)
(declare-const is_insurance_subsidiary Bool)
(declare-const is_securities_subsidiary Bool)
(declare-const is_subsidiary Bool)
(declare-const legal_person_and_spouse_second_degree_relative Bool)
(declare-const liquidation_ordered Bool)
(declare-const major_shareholder Bool)
(declare-const max_allowed_directors Int)
(declare-const notification_sent Bool)
(declare-const notify_economic_ministry Bool)
(declare-const penalty Bool)
(declare-const penalty_dispose_subsidiary_shares Bool)
(declare-const penalty_remove_director_supervisor Bool)
(declare-const penalty_remove_manager_staff Bool)
(declare-const penalty_revocation_resolution Bool)
(declare-const penalty_revoke_license Bool)
(declare-const penalty_stop_subsidiary_business Bool)
(declare-const prohibited_use_fhc_name Bool)
(declare-const prohibited_use_name_flag Bool)
(declare-const related_enterprise Bool)
(declare-const related_enterprise_board_chair_or_majority_directors Bool)
(declare-const related_enterprise_board_chair_or_majority_directors_legal Bool)
(declare-const remove_director_supervisor_ordered Bool)
(declare-const remove_manager_staff_ordered Bool)
(declare-const revocation_resolution_ordered Bool)
(declare-const revoke_license_ordered Bool)
(declare-const same_legal_person Bool)
(declare-const same_natural_person Bool)
(declare-const same_person Bool)
(declare-const same_person_related_legal Bool)
(declare-const same_person_related_natural Bool)
(declare-const shares_held Real)
(declare-const shares_held_by_related_enterprise Real)
(declare-const shares_held_by_related_enterprise_legal Real)
(declare-const shares_held_spouse_minor_children Real)
(declare-const spouse_or_second_degree_relative Bool)
(declare-const stop_subsidiary_business_ordered Bool)
(declare-const subsidiary_directors_appointed Int)
(declare-const subsidiary_shares_held Real)
(declare-const total_capital Real)
(declare-const total_shares Real)
(declare-const total_shares_legal Real)
(declare-const total_subsidiary_shares Real)
(declare-const total_voting_shares Real)
(declare-const violation_exists Bool)
(declare-const violation_flag Bool)
(declare-const voting_shares_held Real)
(declare-const voting_shares_held_by_fhc Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:violation_exists] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= violation_exists violation_flag))

; [fhc:correction_ordered] 主管機關已予以糾正並限期改善
(assert (= correction_ordered correction_flag))

; [fhc:penalty_revocation_resolution] 主管機關撤銷法定會議之決議
(assert (= penalty_revocation_resolution revocation_resolution_ordered))

; [fhc:penalty_stop_subsidiary_business] 主管機關停止子公司一部或全部業務
(assert (= penalty_stop_subsidiary_business stop_subsidiary_business_ordered))

; [fhc:penalty_remove_manager_staff] 主管機關令其解除經理人或職員之職務
(assert (= penalty_remove_manager_staff remove_manager_staff_ordered))

; [fhc:penalty_remove_director_supervisor] 主管機關解除董事、監察人職務或停止其於一定期間內執行職務
(assert (= penalty_remove_director_supervisor remove_director_supervisor_ordered))

; [fhc:notify_economic_ministry] 主管機關通知經濟部廢止董事或監察人登記（依第四款解除職務時）
(assert (= notify_economic_ministry
   (and penalty_remove_director_supervisor notification_sent)))

; [fhc:penalty_dispose_subsidiary_shares] 主管機關令其處分持有子公司之股份
(assert (= penalty_dispose_subsidiary_shares dispose_subsidiary_shares_ordered))

; [fhc:penalty_revoke_license] 主管機關廢止許可
(assert (= penalty_revoke_license revoke_license_ordered))

; [fhc:dispose_shares_within_deadline] 金融控股公司於期限內處分銀行、保險公司或證券商持有之股份及董事人數符合規定
(assert (= dispose_shares_within_deadline
   (and (<= (/ subsidiary_shares_held total_subsidiary_shares) (/ 1.0 4.0))
        (<= subsidiary_directors_appointed max_allowed_directors)
        dispose_completed_within_deadline)))

; [fhc:prohibited_use_fhc_name] 金融控股公司不得再使用金融控股公司名稱及辦理公司變更登記
(assert (= prohibited_use_fhc_name prohibited_use_name_flag))

; [fhc:liquidation_ordered] 未於期限內處分完成者，主管機關令其進行解散及清算
(assert (= liquidation_ordered
   (and (not dispose_completed_within_deadline) revoke_license_ordered)))

; [fhc:control_shareholding_definition] 控制性持股定義成立
(assert (let ((a!1 (or (not (<= (/ voting_shares_held total_voting_shares) (/ 1.0 4.0)))
               (not (<= (/ capital_held total_capital) (/ 1.0 4.0)))
               (not (<= direct_indirect_appointed_directors 0)))))
  (= control_shareholding (ite a!1 1.0 0.0))))

; [fhc:is_fhc] 是否為金融控股公司
(assert (= is_fhc (and (= control_shareholding 1.0) established_under_law)))

; [fhc:is_subsidiary] 是否為子公司
(assert (let ((a!1 (or (not (<= (/ capital_held_by_fhc total_capital) (/ 1.0 2.0)))
               (not (<= (/ voting_shares_held_by_fhc total_voting_shares)
                        (/ 1.0 2.0)))
               (not (<= direct_indirect_appointed_directors_by_fhc 0))
               is_securities_subsidiary
               is_insurance_subsidiary
               is_bank_subsidiary)))
  (= is_subsidiary a!1)))

; [fhc:same_person_definition] 同一人定義成立
(assert (= same_person (or same_natural_person same_legal_person)))

; [fhc:same_person_related_persons] 同一自然人之關係人範圍
(assert (let ((a!1 (and same_natural_person
                (or related_enterprise_board_chair_or_majority_directors
                    (>= (/ shares_held_by_related_enterprise total_shares)
                        (/ 33.0 100.0))
                    spouse_or_second_degree_relative))))
  (= same_person_related_natural a!1)))

; [fhc:same_legal_person_related_persons] 同一法人之關係人範圍
(assert (let ((a!1 (and same_legal_person
                (or related_enterprise_board_chair_or_majority_directors_legal
                    (>= (/ shares_held_by_related_enterprise_legal
                           total_shares_legal)
                        (/ 33.0 100.0))
                    legal_person_and_spouse_second_degree_relative))))
  (= same_person_related_legal a!1)))

; [fhc:related_enterprise_definition] 關係企業定義成立
(assert (= related_enterprise company_law_articles_applied))

; [fhc:major_shareholder_definition] 大股東定義成立
(assert (= major_shareholder
   (or (>= (/ shares_held total_shares) (/ 1.0 20.0))
       (>= (/ shares_held_spouse_minor_children total_shares) (/ 1.0 20.0)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：有違反且主管機關依情節輕重為處分時處罰
(assert (= penalty
   (and violation_exists
        (or liquidation_ordered
            penalty_remove_director_supervisor
            penalty_revocation_resolution
            penalty_stop_subsidiary_business
            penalty_revoke_license
            penalty_remove_manager_staff
            penalty_dispose_subsidiary_shares))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation_exists true))
(assert (= correction_flag false))
(assert (= correction_ordered false))
(assert (= remove_director_supervisor_ordered true))
(assert (= penalty_remove_director_supervisor true))
(assert (= notification_sent false))
(assert (= notify_economic_ministry false))
(assert (= penalty true))
(assert (= is_fhc true))
(assert (= established_under_law true))
(assert (= control_shareholding 30.0))
(assert (= direct_indirect_appointed_directors 1))
(assert (= dispose_completed_within_deadline false))
(assert (= dispose_shares_within_deadline false))
(assert (= dispose_subsidiary_shares_ordered false))
(assert (= penalty_dispose_subsidiary_shares false))
(assert (= penalty_revocation_resolution false))
(assert (= penalty_stop_subsidiary_business false))
(assert (= penalty_remove_manager_staff false))
(assert (= penalty_revoke_license false))
(assert (= liquidation_ordered false))
(assert (= prohibited_use_name_flag false))
(assert (= prohibited_use_fhc_name false))
(assert (= company_law_articles_applied true))
(assert (= related_enterprise true))
(assert (= related_enterprise_board_chair_or_majority_directors false))
(assert (= same_natural_person false))
(assert (= same_legal_person false))
(assert (= same_person false))
(assert (= same_person_related_natural false))
(assert (= same_person_related_legal false))
(assert (= major_shareholder false))
(assert (= shares_held 0.0))
(assert (= total_shares 100.0))
(assert (= shares_held_spouse_minor_children 0.0))
(assert (= shares_held_by_related_enterprise 0.0))
(assert (= shares_held_by_related_enterprise_legal 0.0))
(assert (= spouse_or_second_degree_relative false))
(assert (= legal_person_and_spouse_second_degree_relative false))
(assert (= capital_held 0.0))
(assert (= capital_held_by_fhc 0.0))
(assert (= total_capital 100.0))
(assert (= voting_shares_held 30.0))
(assert (= voting_shares_held_by_fhc 30.0))
(assert (= total_voting_shares 100.0))
(assert (= is_bank_subsidiary false))
(assert (= is_insurance_subsidiary false))
(assert (= is_securities_subsidiary false))
(assert (= is_subsidiary false))
(assert (= direct_indirect_appointed_directors_by_fhc 1))
(assert (= subsidiary_shares_held 0.0))
(assert (= total_subsidiary_shares 0.0))
(assert (= subsidiary_directors_appointed 0))
(assert (= max_allowed_directors 5))
(assert (= remove_manager_staff_ordered false))
(assert (= revocation_resolution_ordered false))
(assert (= revoke_license_ordered false))
(assert (= stop_subsidiary_business_ordered false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 61
; Total facts: 59
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
