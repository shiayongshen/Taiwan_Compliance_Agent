; SMT2 file generated from compliance case automatic
; Case ID: case_60
; Generated at: 2025-10-19T06:55:28.762473
;
; This file can be executed with Z3:
;   z3 case_60.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_held Real)
(declare-const control_holding_definition Bool)
(declare-const correction_ordered Bool)
(declare-const directly_or_indirectly_appointed_directors Int)
(declare-const dispose_shares_and_dissolve Bool)
(declare-const dispose_shares_completed Bool)
(declare-const dispose_shares_within_deadline Bool)
(declare-const dispose_subsidiary_shares Bool)
(declare-const dissolution_and_liquidation Bool)
(declare-const established_under_fhc_law Bool)
(declare-const has_violation Bool)
(declare-const is_bank Bool)
(declare-const is_bank_subsidiary Bool)
(declare-const is_chairman_or_general_manager_or_majority_directors Bool)
(declare-const is_fhc Bool)
(declare-const is_financial_institution Bool)
(declare-const is_insurance_company Bool)
(declare-const is_insurance_subsidiary Bool)
(declare-const is_legal_person_and_executives_and_relatives Bool)
(declare-const is_related_enterprise Bool)
(declare-const is_same_legal_person Bool)
(declare-const is_same_natural_person Bool)
(declare-const is_securities_firm Bool)
(declare-const is_securities_subsidiary Bool)
(declare-const is_spouse_or_second_degree_relative Bool)
(declare-const is_subsidiary Bool)
(declare-const major_shareholder_definition Bool)
(declare-const moe_notification_done Bool)
(declare-const notify_moe_on_removal Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const reduce_directors_within_deadline Bool)
(declare-const related_enterprise_definition Bool)
(declare-const remove_manager_or_staff Bool)
(declare-const remove_or_suspend_director_supervisor Bool)
(declare-const revoke_license Bool)
(declare-const revoke_statutory_resolution Bool)
(declare-const same_legal_person_relation_definition Bool)
(declare-const same_person_definition Bool)
(declare-const same_person_relation_definition Bool)
(declare-const shares_held Real)
(declare-const shares_held_by_related_enterprise Real)
(declare-const stop_using_fhc_name Bool)
(declare-const suspend_subsidiary_business Bool)
(declare-const total_capital Real)
(declare-const total_voting_shares Real)
(declare-const violation_occurred Bool)
(declare-const voting_shares_held Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:has_violation] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= has_violation violation_occurred))

; [fhc:correction_ordered] 主管機關已予以糾正並限期改善
(assert correction_ordered)

; [fhc:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or remove_or_suspend_director_supervisor
       revoke_license
       other_necessary_measures
       remove_manager_or_staff
       suspend_subsidiary_business
       dispose_subsidiary_shares
       revoke_statutory_resolution)))

; [fhc:notify_moe_on_removal] 依第四款解除董事、監察人職務時通知經濟部廢止登記
(assert (= notify_moe_on_removal
   (or (not remove_or_suspend_director_supervisor) moe_notification_done)))

; [fhc:dispose_shares_and_dissolve] 依第六款廢止許可時，限期內處分股份及董事人數並不得再用名稱，逾期解散清算
(assert (= dispose_shares_and_dissolve
   (or (not revoke_license)
       (and dispose_shares_within_deadline
            reduce_directors_within_deadline
            stop_using_fhc_name
            (or dispose_shares_completed dissolution_and_liquidation)))))

; [fhc:control_holding_definition] 控制性持股定義
(assert (let ((a!1 (or (not (<= (/ capital_held total_capital) (/ 1.0 4.0)))
               (not (<= (/ voting_shares_held total_voting_shares) (/ 1.0 4.0)))
               (not (<= directly_or_indirectly_appointed_directors 50)))))
  (= control_holding_definition a!1)))

; [fhc:is_fhc] 金融控股公司定義
(assert (= is_fhc (and control_holding_definition established_under_fhc_law)))

; [fhc:is_financial_institution] 金融機構定義
(assert (= is_financial_institution
   (or is_bank is_insurance_company is_securities_firm)))

; [fhc:is_subsidiary] 子公司定義
(assert (let ((a!1 (or is_bank_subsidiary
               is_insurance_subsidiary
               is_securities_subsidiary
               (not (<= directly_or_indirectly_appointed_directors 50))
               (not (<= (/ capital_held total_capital) (/ 1.0 2.0)))
               (not (<= (/ voting_shares_held total_voting_shares) (/ 1.0 2.0))))))
  (= is_subsidiary a!1)))

; [fhc:same_person_definition] 同一人定義
(assert (= same_person_definition (or is_same_natural_person is_same_legal_person)))

; [fhc:same_person_relation_definition] 同一自然人之關係人範圍
(assert (let ((a!1 (or is_chairman_or_general_manager_or_majority_directors
               (not (<= (/ shares_held_by_related_enterprise
                           total_voting_shares)
                        (/ 33.0 100.0)))
               is_spouse_or_second_degree_relative)))
  (= same_person_relation_definition a!1)))

; [fhc:same_legal_person_relation_definition] 同一法人之關係人範圍
(assert (let ((a!1 (or is_chairman_or_general_manager_or_majority_directors
               is_legal_person_and_executives_and_relatives
               (not (<= (/ shares_held_by_related_enterprise
                           total_voting_shares)
                        (/ 33.0 100.0))))))
  (= same_legal_person_relation_definition a!1)))

; [fhc:related_enterprise_definition] 關係企業定義
(assert (= related_enterprise_definition is_related_enterprise))

; [fhc:major_shareholder_definition] 大股東定義
(assert (= major_shareholder_definition
   (or (>= (/ shares_held total_capital) (/ 1.0 20.0))
       (>= (/ shares_held total_voting_shares) (/ 1.0 20.0)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：金融控股公司有違反且未限期改善或未執行處分措施時處罰
(assert (= penalty
   (and has_violation (or (not correction_ordered) (not penalty_measures)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_occurred true))
(assert (= correction_ordered true))
(assert (= remove_or_suspend_director_supervisor true))
(assert (= moe_notification_done false))
(assert (= revoke_statutory_resolution false))
(assert (= suspend_subsidiary_business false))
(assert (= remove_manager_or_staff false))
(assert (= dispose_subsidiary_shares false))
(assert (= revoke_license false))
(assert (= other_necessary_measures false))
(assert (= dispose_shares_within_deadline false))
(assert (= reduce_directors_within_deadline false))
(assert (= stop_using_fhc_name false))
(assert (= dispose_shares_completed false))
(assert (= dissolution_and_liquidation false))
(assert (= control_holding_definition false))
(assert (= established_under_fhc_law true))
(assert (= directly_or_indirectly_appointed_directors 0))
(assert (= is_bank false))
(assert (= is_insurance_company false))
(assert (= is_securities_firm false))
(assert (= is_bank_subsidiary false))
(assert (= is_insurance_subsidiary false))
(assert (= is_securities_subsidiary false))
(assert (= is_chairman_or_general_manager_or_majority_directors true))
(assert (= is_related_enterprise false))
(assert (= is_same_natural_person false))
(assert (= is_same_legal_person false))
(assert (= is_legal_person_and_executives_and_relatives false))
(assert (= is_spouse_or_second_degree_relative false))
(assert (= same_person_definition false))
(assert (= same_person_relation_definition false))
(assert (= same_legal_person_relation_definition false))
(assert (= related_enterprise_definition false))
(assert (= major_shareholder_definition false))
(assert (= shares_held 0.0))
(assert (= shares_held_by_related_enterprise 0.0))
(assert (= total_voting_shares 0.0))
(assert (= total_capital 0.0))
(assert (= voting_shares_held 0.0))
(assert (= capital_held 0.0))
(assert (= penalty_measures true))
(assert (= penalty false))
(assert (= notify_moe_on_removal false))
(assert (= dispose_shares_and_dissolve false))
(assert (= has_violation false))
(assert (= is_fhc false))
(assert (= is_financial_institution false))
(assert (= is_subsidiary false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 49
; Total facts: 49
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
